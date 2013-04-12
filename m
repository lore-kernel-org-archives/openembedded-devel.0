Received: from mail-pb0-f51.google.com ([209.85.160.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQlDB-0000Jc-Tr
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Apr 2013 23:08:46 +0200
Received: by mail-pb0-f51.google.com with SMTP id rr4so1599406pbb.38
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2013 13:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=uuGQTLb4cm4KbtPx/OkULWmLLFY5WJ1uxwTbKfBYQ2M=;
	b=IBB3MvkkXJb0nuYtS6OHf2ih1Kr5kc9h4RiM5dGZr+ub9GbQ9wCjhN2L1XGsJhfeE/
	Q23Tfzj5UTgpkpLY2r6juf7boc//8EyKxqrBizDnrNdK+XqEvOp5jls/stWDuWM1XtAx
	v2vMLPFLRX7RJNl0Pdd/EzZs6TjS8Wwqb4qtl3uPBgsKtAz8GZ0BT9O34JEHRYgptIT6
	l7YapGsI7bHwUnGa9uD7RQ7SJ8JvS2BoQhmtZYXjsvahnn3WSv5Poy/ZvWQLUJiQlF2q
	GaEQywVG9LbMCGdciiIW0or6lW9ougI6QnSXtn9UyZWoX6yK/fYKCqmFd5ENisZf0KQ7
	HgiQ==
X-Received: by 10.66.121.1 with SMTP id lg1mr17722288pab.167.1365799880400;
	Fri, 12 Apr 2013 13:51:20 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id
	xl10sm10896739pac.15.2013.04.12.13.51.17
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 13:51:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Apr 2013 22:50:10 +0200
Message-Id: <1365799812-5676-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365799812-5676-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365799812-5676-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-systemd][meta-gpe][PATCH 2/4] atftpd: fix warning about overwritting keys
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
X-List-Received-Date: Fri, 12 Apr 2013 21:08:47 -0000

* WARNING: Variable key FILES_${PN}d (${sbindir}/* ${sysconfdir}/init.d/* /srv/tftp) replaces original key FILES_atftpd ( ${systemd_unitdir}/system/atftpd.service).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../meta-oe/recipes-extended/atftp/atftp_git.bbappend        | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-systemd/meta-oe/recipes-extended/atftp/atftp_git.bbappend b/meta-systemd/meta-oe/recipes-extended/atftp/atftp_git.bbappend
index e58306f..ed9cf9d 100644
--- a/meta-systemd/meta-oe/recipes-extended/atftp/atftp_git.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/atftp/atftp_git.bbappend
@@ -6,12 +6,12 @@ inherit systemd
 
 SRC_URI += "file://atftpd.service"
 
-SYSTEMD_PACKAGES = "atftpd"
-SYSTEMD_SERVICE_atftpd = "atftpd.service"
-FILES_atftpd += "${systemd_unitdir}/system/atftpd.service"
-RPROVIDES_atftpd += "atftpd-systemd"
-RREPLACES_atftpd += "atftpd-systemd"
-RCONFLICTS_atftpd += "atftpd-systemd"
+SYSTEMD_PACKAGES = "${PN}d"
+SYSTEMD_SERVICE_${PN}d = "atftpd.service"
+FILES_${PN}d += "${systemd_unitdir}/system/atftpd.service"
+RPROVIDES_${PN}d += "${PN}d-systemd"
+RREPLACES_${PN}d += "${PN}d-systemd"
+RCONFLICTS_${PN}d += "${PN}d-systemd"
 do_install_append() {
 	install -d ${D}${systemd_unitdir}/system
 	install -m 0644 ${WORKDIR}/atftpd.service ${D}${systemd_unitdir}/system
-- 
1.8.1.5



