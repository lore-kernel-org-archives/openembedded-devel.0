Return-Path: <chgans@googlemail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9DC45605F3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:14:15 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id kp1so208992pab.35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2013 22:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=NYsednSSB0qGiOEyF193nelhUOTsPFrm3cMnd2VD1x0=;
	b=Q6EFsoOlWKAjnATZaIiu9Jb/KGwWXku7blroXaKuoAqv/byohxnm4HUUlHJaVRC8Em
	FtD4H6D7LGJpImgrSYvyvcbJaqcJIEx3t/N3IwsgaF3429OcL5OBFcaFAuAiXPiBcZc1
	p81X71vXDhlaQ+AIQZMe7OIyFh9Ek/tgWAtCtTNKlIECOV5OCGygqn9G0uwqHfsjleWk
	PA4r90HE0hnyACZwr7cS2lGExV8SWkK2TkGX+ITjSoJ+MZ0UF3o3B0n0g8cUcA49RxiM
	MAcVwvL9TuVMS1qAh7s79mdZMqxQ2Eqwe0l85fbM7bTtcezy2mbpSNRnr8T6394mfwjl
	Mz1A==
X-Received: by 10.66.147.65 with SMTP id ti1mr40673598pab.36.1374642856396;
	Tue, 23 Jul 2013 22:14:16 -0700 (PDT)
Received: from localhost (222-154-231-245.adsl.xtra.co.nz. [222.154.231.245])
	by mx.google.com with ESMTPSA id
	yj2sm45425708pbb.40.2013.07.23.22.14.13 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 23 Jul 2013 22:14:15 -0700 (PDT)
Sender: Chris Gagneraud <chgans@googlemail.com>
From: Christian Gagneraud <chgans@gna.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 17:13:54 +1200
Message-Id: <1374642834-2108-1-git-send-email-chgans@gna.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-qt5][dylan][RFC PATCH] qt5.inc: Fix qtbase-tools runtime depencency on perl
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
X-List-Received-Date: Wed, 24 Jul 2013 05:14:16 -0000

I'm not sure if it is the right way to do that, but here I go:

While building a custom rootfs using poky, meta-oe, meta-ti and meta-qt5 (all on Dylan branch), I got the following error:
[...]
| Computing transaction...error: Can't install qtbase-tools-5.0.2-r2.0@armv7a_vfp_neon: no package provides /usr/bin/perl
[...]

qtbase-tools seems to depends and perl (at runtime), but this wasn't specified in any bb file, this patch fixes it.
---
 recipes-qt/qt5/qt5.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index 87bf5e8..955d5bd 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -22,6 +22,8 @@ OE_QMAKE_PATH_TESTS = "${OE_QMAKE_PATH_QT_TESTS}"
 
 PACKAGES =. "${PN}-qmlplugins-dbg ${PN}-tools-dbg ${PN}-plugins-dbg ${PN}-qmlplugins ${PN}-tools ${PN}-plugins ${PN}-mkspecs ${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-dbg ${PN}-examples "
 
+RDEPENDS_${PN}-tools += "perl"
+
 # extra -dbg packages
 FILES_${PN}-qmlplugins-dbg = " \
     ${OE_QMAKE_PATH_QML}/*/.debug \
-- 
1.8.1.2


