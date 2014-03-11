Return-Path: <Xufeng.Zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 218426F7D4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 05:43:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2B5hiTY017630
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Mar 2014 22:43:44 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.210) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 10 Mar 2014 22:43:44 -0700
From: Xufeng Zhang <xufeng.zhang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 11 Mar 2014 13:54:09 +0800
Message-ID: <1394517250-15467-2-git-send-email-xufeng.zhang@windriver.com>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1394517250-15467-1-git-send-email-xufeng.zhang@windriver.com>
References: <1394517250-15467-1-git-send-email-xufeng.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] ntp: Running ntpd daemon as ntp:ntp
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
X-List-Received-Date: Tue, 11 Mar 2014 05:43:46 -0000
Content-Type: text/plain

Adding ntp:ntp(user:group) to system and running
ntpd dameon as ntp:ntp.

Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
---
 meta-networking/recipes-support/ntp/files/ntpd |    2 +-
 meta-networking/recipes-support/ntp/ntp.inc    |    6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/ntp/files/ntpd b/meta-networking/recipes-support/ntp/files/ntpd
index 53fa2d1..f1e78aa 100755
--- a/meta-networking/recipes-support/ntp/files/ntpd
+++ b/meta-networking/recipes-support/ntp/files/ntpd
@@ -23,7 +23,7 @@ startdaemon(){
 	# this.  If ntpd seems to disappear after a while assume TICKADJ
 	# above is set to a totally incorrect value.
 	echo -n "Starting ntpd: "
-	start-stop-daemon --start -x /usr/bin/ntpd -- -p /var/run/ntp.pid "$@"
+	start-stop-daemon --start -x /usr/bin/ntpd -- -u ntp:ntp -p /var/run/ntp.pid "$@"
 	echo "done"
 }
 stopdaemon(){
diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index 8381b9e..7876c0b 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -25,13 +25,17 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://ntpd.list \
 "
 
-inherit autotools update-rc.d systemd
+inherit autotools update-rc.d useradd systemd
 
 # The ac_cv_header_readline_history is to stop ntpdc depending on either
 # readline or curses
 EXTRA_OECONF += "--with-net-snmp-config=no --without-ntpsnmpd ac_cv_header_readline_history_h=no"
 CFLAGS_append = " -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED"
 
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system --home-dir /var/lib/ntp \
+                       --shell /bin/false --user-group ntp"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[openssl] = "--with-openssl-libdir=${STAGING_LIBDIR} \
                           --with-openssl-incdir=${STAGING_INCDIR} \
-- 
1.7.0.2


