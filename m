Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6CADF77080
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 20:10:21 +0000 (UTC)
Received: by wicfv8 with SMTP id fv8so178822858wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 13:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=H9i9CHQdL584p13Dyzg9QbwKTf6bn+b9IEDXE3Nx8Jk=;
	b=bnV9EAFR53P04NuURzGzEcTRVn5ahrRmxZnUY3kEy7v8QD3PI86Yjw4qit/Iuj9ZZ8
	BuP3rI5Hhmz74/f0GllCe5Sf/GQQDYATRjZtN/9tZqQXclmWdnUTkV7IoClnoSzS3IIr
	wXrtqjOXcfnvSTqVEIVILHbQMxyGuk+eqreB/4pma96pmGEVmBYiwSbvJj5ApsoS2WiH
	fvSvk3BAX6dxgT9zsvf00oY8ud1Xk+6tWk+sfkZLrVt6vpuT+1jOOtTXdYSk3dfFP6PI
	botpiefKMNvmPfyc7HDXbqzYTLhXakSUCAdD062tugqSQu2O6QFtHLiUhaXc5nS1cOiv
	0J4Q==
X-Received: by 10.180.206.230 with SMTP id lr6mr30656964wic.69.1445976621003; 
	Tue, 27 Oct 2015 13:10:21 -0700 (PDT)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id bn5sm2954818wib.0.2015.10.27.13.10.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Oct 2015 13:10:20 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <143CF7ED-1B54-4239-B957-F9426C4AB267@gmail.com>
Date: Tue, 27 Oct 2015 21:10:19 +0100
To: OE-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [meta-oe][PATCH] samba: add support for sysvinit via lsb-init-functions
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
X-List-Received-Date: Tue, 27 Oct 2015 20:10:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Since there're surely lot's of individual distibutions not moved to =
systemd,
allow sane samba start/stop with systemv anyway. Rely on =
lsb-init-functions
for improved control.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta-oe/recipes-connectivity/samba/samba_4.1.12.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb =
b/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
index 22c2bb4..0a04870 100644
--- a/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
@@ -97,6 +97,11 @@ do_install_append() {
 	install -d ${D}${sysconfdir}/tmpfiles.d
 	echo "d ${localstatedir}/log/samba 0755 root root -" \
             > ${D}${sysconfdir}/tmpfiles.d/99-${BPN}.conf
+    elif ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', =
'false', d)}; then
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0644 packaging/LSB/samba.sh ${D}${sysconfdir}/init.d
+	update-rc.d -r ${D} samba.sh start 20 3 5 .
+	update-rc.d -r ${D} samba.sh start 20 0 1 6 .
     fi
=20
     install -d ${D}${sysconfdir}/samba
@@ -118,7 +123,9 @@ FILES_${PN} +=3D "/run \
                "
=20
 SMB_SERVICE=3D"${systemd_unitdir}/system/nmb.service =
${systemd_unitdir}/system/smb.service"
+SMB_SYSV=3D"${sysconfdir}/init.d ${sysconfdir}/rc?.d"
 FILES_${PN} +=3D"${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'${SMB_SERVICE}', '', d)}"
+FILES_${PN} +=3D"${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', =
'${SMB_SYSV}', '', d)}"
=20
 FILES_${PN}-dbg +=3D "${libdir}/samba/idmap/.debug/* \
                     ${libdir}/samba/pdb/.debug/* \
--=20
1.9.1

--=20
Jens Rehsack - rehsack@gmail.com


