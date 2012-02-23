Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0Xdm-0004lJ-RA
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 13:19:19 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so506551eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 04:10:59 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.14.97.131 as permitted sender)
	client-ip=10.14.97.131; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.14.97.131 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.14.97.131])
	by 10.14.97.131 with SMTP id t3mr777034eef.3.1329999059876 (num_hops =
	1); Thu, 23 Feb 2012 04:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=x90La6kjLH23rYsyOQ8EBbnKZ6ibepnXPZyTrK3awtA=;
	b=Vmg3cMQYVKBbyTY82QkuIoKeB6e38S6Zaiq/v2d8gvvz5Gcnolz+8ZpUrUCmg2xII5
	lUqdnW1Ewie3kYp2sK2+qRRdGWhPTIK7391pQ4LGGWChTLnN6A1haGwawWaMpDqCSxA8
	yFQDE1itbY/zgB4WsJ8j3E38fRJWJbIRNnQ00=
Received: by 10.14.97.131 with SMTP id t3mr612023eef.3.1329999059755;
	Thu, 23 Feb 2012 04:10:59 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n52sm4739136eea.5.2012.02.23.04.10.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 04:10:59 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:10:43 +0100
Message-Id: <1329999054-23112-13-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe V3 12/23] openssh: remove unneeded systemd code
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
X-List-Received-Date: Thu, 23 Feb 2012 12:19:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../openssh/openssh_5.9p1.bbappend                 |   14 +-------------
 1 files changed, 1 insertions(+), 13 deletions(-)

diff --git a/meta-oe/recipes-connectivity/openssh/openssh_5.9p1.bbappend b/meta-oe/recipes-connectivity/openssh/openssh_5.9p1.bbappend
index 3f68e09..de7668f 100644
--- a/meta-oe/recipes-connectivity/openssh/openssh_5.9p1.bbappend
+++ b/meta-oe/recipes-connectivity/openssh/openssh_5.9p1.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 SYSTEMD_PACKAGES = "openssh-sshd-systemd"
 SYSTEMD_SERVICE = "sshd.socket"
@@ -8,15 +8,3 @@ SYSTEMD_SERVICE = "sshd.socket"
 inherit systemd
 
 SRC_URI += "file://sshd.socket file://sshd@.service file://sshdgenkeys.service"
-
-do_install_append() {
-       install -d ${D}${base_libdir}/systemd/system
-       install -m 644 ${WORKDIR}/sshd.socket ${D}${base_libdir}/systemd/system
-       install -m 644 ${WORKDIR}/sshd@.service ${D}${base_libdir}/systemd/system
-       install -m 644 ${WORKDIR}/sshdgenkeys.service ${D}${base_libdir}/systemd/system
-}
-
-PACKAGES =+ "openssh-sshd-systemd"
-
-FILES_openssh-sshd-systemd += "${base_libdir}/systemd"
-RDEPENDS_openssh-sshd-systemd += "openssh-sshd"
-- 
1.7.6.4



