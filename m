Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4372C75D22
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 18:09:20 +0000 (UTC)
Received: by wijp11 with SMTP id p11so97652334wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 10:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=qD0rWUENF4LsCOb6hqEY72P+l/ugQd1TYODGGSFgc4g=;
	b=lSeDr8zCE5Xf8lt3rSRs3+biuRvgSgs+EMkrqgmqpYjfwNre7DN1IN1M6C+FuGGPJu
	oQZ0/3iHHnU+RbDOfzT61vXrvcPdX7RkaDAuKZoaFK4zxOa09TfIc4vJJAUhBY1CeIas
	tgdJ+fFTH+OfaVfEA51/fXow4A43ionCDh5YbbO+r71F1uvx4AYQd+9VHd61REvk2rRl
	KbdqSDLUA/mc8HzwGRgEYwUSLfJeiw9gEw4i011JckA2jvoJ7ldQzH3CzsRqzToxBuyX
	j6w9cEOtqQDtavnJhW4t13KGzpcpkMP1uphwAiPiXQIrV6QSy8yque7tm+BhX+K15DDV
	80uQ==
X-Received: by 10.194.172.162 with SMTP id bd2mr2170808wjc.140.1446660560909; 
	Wed, 04 Nov 2015 10:09:20 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id r5sm2792951wjf.18.2015.11.04.10.09.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Nov 2015 10:09:20 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <FD578A39-55EB-46F0-8AB8-85C7F9B8CC2C@gmail.com>
Date: Wed, 4 Nov 2015 19:09:19 +0100
To: OE-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [meta-oe][PATCH] samba: systemv-init script must be executable
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
X-List-Received-Date: Wed, 04 Nov 2015 18:09:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Fix insane permissions installing SystemV init-script for samba4 to =
allow
executing it correctly.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta-oe/recipes-connectivity/samba/samba_4.1.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb =
b/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
index 0a04870..e2bf719 100644
--- a/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
@@ -99,7 +99,7 @@ do_install_append() {
             > ${D}${sysconfdir}/tmpfiles.d/99-${BPN}.conf
     elif ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', =
'false', d)}; then
 	install -d ${D}${sysconfdir}/init.d
-	install -m 0644 packaging/LSB/samba.sh ${D}${sysconfdir}/init.d
+	install -m 0755 packaging/LSB/samba.sh ${D}${sysconfdir}/init.d
 	update-rc.d -r ${D} samba.sh start 20 3 5 .
 	update-rc.d -r ${D} samba.sh start 20 0 1 6 .
     fi
--=20
1.9.1

--=20
Jens Rehsack - rehsack@gmail.com


