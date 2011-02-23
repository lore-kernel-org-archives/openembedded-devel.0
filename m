Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PsETW-0000t8-Ol
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 14:09:51 +0100
Received: by gxk1 with SMTP id 1so3198435gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 05:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=ayzXgPVv1rzwgpKT2zRM7v25b26zs4weV8TaV2R/Y0o=;
	b=NbYUChL9Cpw7en0tvWbmYqJARmOtOt7yu4/HS23VNt9kQ1zf9Zw2f02GXCnuEbcPXn
	banwgDGE9ZvH4VuIEQ8vFTcfOxqMlsTMJV83Yw54cKIp8RKVY4k/yY7lRfblSaMiFiRZ
	JgD5tmEaUhiHqZDvOelJWaRrqzxFYE6iRVTRs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=SFaoccolDJMv9B5VIf/jOwTpQ7+XaR1GFpVAKL+xLS369zp3jagEp//R6DQg9t8vAb
	HErnD3YC6o92JfXzoF/Yv6aZkS07a1GDppk0W42Fw52tmOz/g6aYo9xc3Rrzti6ro/2/
	XS7OBMaqm0e1g4A8YATr1xTCiOz3OPjYvsNnk=
Received: by 10.236.110.173 with SMTP id u33mr7291686yhg.46.1298466510821;
	Wed, 23 Feb 2011 05:08:30 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n10sm2276929yhb.38.2011.02.23.05.08.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Feb 2011 05:08:29 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Feb 2011 13:07:22 +0000
Message-Id: <1298466445-16486-12-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1298466445-16486-11-git-send-email-otavio@ossystems.com.br>
References: <1298466445-16486-1-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-2-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-3-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-4-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-5-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-6-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-7-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-8-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-9-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-10-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-11-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 11/14] parted: fix MiB handling
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Feb 2011 13:09:51 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/parted/files/fix-MiB-handling.patch |  130 +++++++++++++++++++++++++++
 recipes/parted/parted_2.3.bb                |    2 +
 2 files changed, 132 insertions(+), 0 deletions(-)
 create mode 100644 recipes/parted/files/fix-MiB-handling.patch

diff --git a/recipes/parted/files/fix-MiB-handling.patch b/recipes/parted/files/fix-MiB-handling.patch
new file mode 100644
index 0000000..db4945f
--- /dev/null
+++ b/recipes/parted/files/fix-MiB-handling.patch
@@ -0,0 +1,130 @@
+Delivered-To: otavio.salvador@gmail.com
+Received: by 10.204.59.147 with SMTP id l19cs132424bkh;
+        Sun, 16 Jan 2011 04:26:09 -0800 (PST)
+Received: by 10.90.113.8 with SMTP id l8mr1322981agc.21.1295180768845;
+        Sun, 16 Jan 2011 04:26:08 -0800 (PST)
+Return-Path: <bug-parted-bounces+otavio=debian.org@gnu.org>
+Received: from master.debian.org (master.debian.org [70.103.162.29])
+        by mx.google.com with ESMTPS id c36si6867598ana.168.2011.01.16.04.26.08
+        (version=TLSv1/SSLv3 cipher=RC4-MD5);
+        Sun, 16 Jan 2011 04:26:08 -0800 (PST)
+Received-SPF: softfail (google.com: domain of transitioning bug-parted-bounces+otavio=debian.org@gnu.org does not designate 70.103.162.29 as permitted sender) client-ip=70.103.162.29;
+Authentication-Results: mx.google.com; spf=softfail (google.com: domain of transitioning bug-parted-bounces+otavio=debian.org@gnu.org does not designate 70.103.162.29 as permitted sender) smtp.mail=bug-parted-bounces+otavio=debian.org@gnu.org
+Received: from lists.gnu.org ([199.232.76.165])
+	by master.debian.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
+	(Exim 4.69)
+	(envelope-from <bug-parted-bounces+otavio=debian.org@gnu.org>)
+	id 1PeRgN-00069u-NM
+	for otavio.salvador@gmail.com; Sun, 16 Jan 2011 12:26:08 +0000
+Received: from localhost ([127.0.0.1]:34642 helo=lists.gnu.org)
+	by lists.gnu.org with esmtp (Exim 4.43)
+	id 1PeRgL-0007eS-Ku
+	for otavio@debian.org; Sun, 16 Jan 2011 07:26:05 -0500
+Received: from [140.186.70.92] (port=41438 helo=eggs.gnu.org)
+	by lists.gnu.org with esmtp (Exim 4.43) id 1PeRgG-0007cP-GQ
+	for bug-parted@gnu.org; Sun, 16 Jan 2011 07:26:01 -0500
+Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
+	(envelope-from <jim@meyering.net>) id 1PeRgF-0003PP-7D
+	for bug-parted@gnu.org; Sun, 16 Jan 2011 07:26:00 -0500
+Received: from mx.meyering.net ([82.230.74.64]:52182)
+	by eggs.gnu.org with esmtp (Exim 4.71)
+	(envelope-from <jim@meyering.net>) id 1PeRgF-0003PL-0K
+	for bug-parted@gnu.org; Sun, 16 Jan 2011 07:25:59 -0500
+Received: by rho.meyering.net (Acme Bit-Twister, from userid 1000)
+	id 5C38F60466; Sun, 16 Jan 2011 13:25:56 +0100 (CET)
+From: Jim Meyering <jim@meyering.net>
+To: bug-parted@gnu.org
+Date: Sun, 16 Jan 2011 13:25:56 +0100
+Message-ID: <8762tpox0r.fsf@meyering.net>
+Lines: 67
+MIME-Version: 1.0
+Content-Type: text/plain
+X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
+Subject: treat "1MiB" like "1048576B"
+X-BeenThere: bug-parted@gnu.org
+X-Mailman-Version: 2.1.5
+Precedence: list
+List-Id: Bug reports for the GNU Parted disk partition editor
+	<bug-parted.gnu.org>
+List-Unsubscribe: <http://lists.gnu.org/mailman/listinfo/bug-parted>,
+	<mailto:bug-parted-request@gnu.org?subject=unsubscribe>
+List-Archive: <http://lists.gnu.org/archive/html/bug-parted>
+List-Post: <mailto:bug-parted@gnu.org>
+List-Help: <mailto:bug-parted-request@gnu.org?subject=help>
+List-Subscribe: <http://lists.gnu.org/mailman/listinfo/bug-parted>,
+	<mailto:bug-parted-request@gnu.org?subject=subscribe>
+Sender: bug-parted-bounces+otavio=debian.org@gnu.org
+Errors-To: bug-parted-bounces+otavio=debian.org@gnu.org
+
+[ I noticed that using a starting address of "1MiB" evokes a warning,
+  along with the obviously unintended start sector of 34:
+
+    parted -s -- $dev mklabel gpt mkpart PARTITION-NAME 1MiB -34s
+    Warning: The resulting partition is not properly aligned for best performance.
+
+  While the following, with "1048576B", works fine and creates the partition
+  starting at the desired 1MiB address:
+
+    parted -s -- $dev mklabel gpt mkpart PARTITION-NAME 1048576B -34s
+  ]
+
+I made parted tell me why it was treating "1MiB" differently from
+"1048576B".  Bottom line is that if you use a large unit, like MiB, it
+assumes you're being sloppy, but if you specify bytes or sectors, you
+require exactness (radius = 0).  That may have made sense when people
+used sloppy units like MB (1,000,000), but obviously does not hold for
+most people who bother to type "MiB".
+
+Here's a proposed patch to make the command I gave work the way I
+intended.  Opinions welcome.  On one hand, I don't particularly like
+treating 1MiB differently from 1MB, but if someone is using 1MB and
+intends 1MiB, they need a little wake up call (or some RTFM).
+[the full patch will include a documentation update as well as
+a couple of tests to illustrate/exercise the difference. ]
+
+In the mean time, to get the proper 1MiB alignment, you'll have to
+use an explicit byte or sector count.  I prefer byte counts, in spite of
+the greater number of digits, because that works the same regardless
+of a disk's sector size:
+
+    dev=...
+    k=1024 m=$((k*k))
+    parted -s -- $dev mklabel gpt mkpart P-NAME ${m}B -34s
+
+
+diff --git a/libparted/unit.c b/libparted/unit.c
+index 2670c38..59a9644 100644
+--- a/libparted/unit.c
++++ b/libparted/unit.c
+@@ -480,6 +480,12 @@ parse_unit_suffix (const char* suffix, PedUnit suggested_unit)
+ 	return suggested_unit;
+ }
+
++static bool
++is_power_of_2 (long long n)
++{
++  return (n & (n - 1)) == 0;
++}
++
+ /**
+  * If \p str contains a valid description of a location on \p dev, then
+  * \p *sector is modified to describe the location and a geometry is created
+@@ -530,6 +536,13 @@ ped_unit_parse_custom (const char* str, const PedDevice* dev, PedUnit unit,
+ 	radius = ped_div_round_up (unit_size, dev->sector_size) - 1;
+ 	if (radius < 0)
+ 		radius = 0;
++	/* If the user specified units in a power of 2, e.g., 1MiB, as in
++	       parted -s -- $dev mklabel gpt mkpart P-NAME 1MiB -34s
++	   do not use 1MiB as the range.  Rather, presume that they
++	   are specifying precisely the starting or ending number,
++	   and treat "1MiB" just as we would treat "1048576B".  */
++	if (is_power_of_2 (unit_size))
++		radius = 0;
+
+ 	*sector = num * unit_size / dev->sector_size;
+ 	/* negative numbers count from the end */
+
+_______________________________________________
+bug-parted mailing list
+bug-parted@gnu.org
+http://lists.gnu.org/mailman/listinfo/bug-parted
diff --git a/recipes/parted/parted_2.3.bb b/recipes/parted/parted_2.3.bb
index d2ac303..f3b596c 100644
--- a/recipes/parted/parted_2.3.bb
+++ b/recipes/parted/parted_2.3.bb
@@ -3,9 +3,11 @@ HOMEPAGE = "http://www.gnu.org/software/parted/parted.html"
 LICENSE = "GPLv3"
 SECTION = "console/tools"
 DEPENDS = "readline util-linux-ng lvm2"
+PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.gz \
            file://use_llseek_syscall.patch \
+           file://fix-MiB-handling.patch \
           "
            
 EXTRA_OECONF = "--disable-Werror ac_cv_func_calloc_0_nonnull=yes"
-- 
1.7.2.3



