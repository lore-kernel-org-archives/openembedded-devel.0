Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B25BD6BA7C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2013 09:22:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7S9Mshx009020
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2013 02:22:54 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 28 Aug 2013 02:22:53 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Aug 2013 17:22:58 +0800
Message-ID: <1377681778-2387-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH meta-networking] tftp-hpa: add error check for disk filled up
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Aug 2013 09:22:54 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Add error check when the write-buffer is finally flushed to the file,
the caller can detect if the disk filled up (or had an i/o error) and
return a NOSAPCE nak to the other side.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../files/add-error-check-for-disk-filled-up.patch |   81 ++++++++++++++++++++
 .../recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb       |    4 +-
 2 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/add-error-check-for-disk-filled-up.patch

diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/add-error-check-for-disk-filled-up.patch b/meta-networking/recipes-daemons/tftp-hpa/files/add-error-check-for-disk-filled-up.patch
new file mode 100644
index 0000000..073b769
--- /dev/null
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/add-error-check-for-disk-filled-up.patch
@@ -0,0 +1,81 @@
+From bd5773947af5ca80ca546ad5625818fc912bdd60 Mon Sep 17 00:00:00 2001
+From: "Roy.Li" <rongqing.li@windriver.com>
+Date: Thu, 22 Aug 2013 08:56:09 +0800
+Subject: [PATCH] tftp-hpa: add error check for disk filled up
+
+Upstream-status: Pending [Sent to http://www.syslinux.org/archives/2013-August/020765.html]
+
+Add error check when the write-buffer is finally flushed to the file,
+the caller can detect if the disk filled up (or had an i/o error) and
+return a NOSAPCE nak to the other side.
+
+Signed-off-by: Ming Liu <ming.liu@windriver.com>
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+---
+ common/tftpsubs.c |    8 +++++---
+ tftpd/tftpd.c     |   12 ++++++++++--
+ 2 files changed, 15 insertions(+), 5 deletions(-)
+
+diff --git a/common/tftpsubs.c b/common/tftpsubs.c
+index 8c999f6..b4d4ffe 100644
+--- a/common/tftpsubs.c
++++ b/common/tftpsubs.c
+@@ -206,20 +206,22 @@ int write_behind(FILE * file, int convert)
+ 
+     p = buf;
+     ct = count;
++    count = 0;
+     while (ct--) {              /* loop over the buffer */
+         c = *p++;               /* pick up a character */
+         if (prevchar == '\r') { /* if prev char was cr */
+             if (c == '\n')      /* if have cr,lf then just */
+-                fseek(file, -1, 1);     /* smash lf on top of the cr */
++                count = count - 1;
+             else if (c == '\0') /* if have cr,nul then */
+                 goto skipit;    /* just skip over the putc */
+             /* else just fall through and allow it */
+         }
+-        putc(c, file);
++        buf[count] = c;
++        count ++;
+       skipit:
+         prevchar = c;
+     }
+-    return count;
++    return write(fileno(file), buf, count);
+ }
+ 
+ /* When an error has occurred, it is possible that the two sides
+diff --git a/tftpd/tftpd.c b/tftpd/tftpd.c
+index 1873e70..c2adbda 100644
+--- a/tftpd/tftpd.c
++++ b/tftpd/tftpd.c
+@@ -1681,7 +1681,11 @@ static void tftp_recvfile(const struct formats *pf, struct tftphdr *oap, int oac
+             syslog(LOG_WARNING, "tftpd: write(ack): %m");
+             goto abort;
+         }
+-        write_behind(file, pf->f_convert);
++        if(write_behind(file, pf->f_convert) < 0) {
++            nak(ENOSPACE, NULL);
++            (void)fclose(file);
++            goto abort;
++        }
+         for (;;) {
+             n = recv_time(peer, dp, PKTSIZE, 0, &r_timeout);
+             if (n < 0) {        /* really? */
+@@ -1712,7 +1716,11 @@ static void tftp_recvfile(const struct formats *pf, struct tftphdr *oap, int oac
+             goto abort;
+         }
+     } while (size == segsize);
+-    write_behind(file, pf->f_convert);
++    if(write_behind(file, pf->f_convert) < 0) {
++        nak(ENOSPACE, NULL);
++        (void)fclose(file);
++        goto abort;
++    }
+     (void)fclose(file);         /* close data file */
+ 
+     ap->th_opcode = htons((u_short) ACK);       /* send the "final" ack */
+-- 
+1.7.10.4
+
diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
index cb5b234..9cb25f0 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
+++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
@@ -23,7 +23,9 @@ SRC_URI = "http://kernel.org/pub/software/network/tftp/tftp-hpa/tftp-hpa-${PV}.t
            file://tftp-hpa-0.49-stats.patch \
            file://tftp-hpa-5.2-pktinfo.patch \
            file://default \
-           file://init"
+           file://init \
+           file://add-error-check-for-disk-filled-up.patch \
+"
 
 SRC_URI[md5sum] = "46c9bd20bbffa62f79c958c7b99aac21"
 SRC_URI[sha256sum] = "0a9f88d4c1c02687b4853b02ab5dd8779d4de4ffdb9b2e5c9332841304d1a269"
-- 
1.7.10.4


