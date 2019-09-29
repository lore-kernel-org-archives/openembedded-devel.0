Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 61DE47F17B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 18:15:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46hDHJ14rtz65
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 20:15:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1569780956;
	bh=i9kWV1YIZ3JXAlwuThCEI5Fx3xR9xNKnizagU92lMZI=;
	h=From:To:Subject:Date:From;
	b=H1r7s8GEnr0YRFWgEwUjL7ned9Iy/SYZcqwNxobf7bAzLcQhC/xOo6OHKb438MAAs
	KzaLijJZB/b8AMVWxiye4JI0sXa6nGm1V81haPZE69mRN8N3H/D9rm9c+/zEww83MX
	GLOt9DYlRuJOgQb3TXUtwVh7TLJ34cjRo48khAwemTzDa2EPMFAtilO6ts7DFLkAHI
	IFfZtE1MdeAH/06C/Scn6lg20FcHW6uGql+TYnYDfYd/a0JsabOR/Cwr4m/60ZE19q
	3oiJCflcxGKw++Bx0ZWyxroC3GA80IoGFoncrsoHSwCwTB81TBWR2Q31ZSFfF4+T7z
	FsF8Ne0V1ef+kvJ7vC1OB1uh8XR6ylYmKjC0tWnzBSRw7wZ0cUAbVcMTTaAhBkTMyk
	uuxTmSHZiS6sLN2QXaggfqbHKIHv2IFqIi6L3iwCd/8Co+mHTeg273q1ClUoq4auB1
	GXhYkzt8fYMxa+0+s3iCnAJGP3LAgNnOCK8cOD2XatM8hIBC3slAMv4RqPYgvONSNy
	CmttHci1wLJCuzoSVqYMX9W3TXTvaFZavanzx01JcSefoJct7eNUCCZJtxVtPAwr++
	Hu4T1DTGV2auCLRDtjhGAgw/AvYKDxdakIbZDPjd1JBBjB+GTOaQvX1dA0cW0yu5Jm
	67qsWQggKdJMSaK7eveeAm7g=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:15:54 +0300
Message-Id: <20190929181554.9842-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] networkmanager: Correct the upstream version check
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 29 Sep 2019 18:15:55 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../networkmanager/networkmanager_1.18.2.bb                  | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
index db69a5e77..0d6e1a0b0 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
@@ -19,7 +19,7 @@ DEPENDS = " \
     curl \
 "
 
-inherit gnomebase gettext update-rc.d systemd bash-completion vala gobject-introspection gtk-doc update-alternatives
+inherit gnomebase gettext update-rc.d systemd bash-completion vala gobject-introspection gtk-doc update-alternatives upstream-version-is-even
 
 SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
@@ -34,9 +34,6 @@ SRC_URI_append_libc-musl = " \
 SRC_URI[md5sum] = "ca1e6175c6ba97ca1adf65a67861ccd9"
 SRC_URI[sha256sum] = "4dd97ca974cd1f97990746527258f551f4257cbf011fecd01d10b7d74a6fa5c3"
 
-UPSTREAM_CHECK_URI = "${GNOME_MIRROR}/NetworkManager/1.16/"
-UPSTREAM_CHECK_REGEX = "NetworkManager\-(?P<pver>1\.10(\.\d+)+).tar.xz"
-
 S = "${WORKDIR}/NetworkManager-${PV}"
 
 EXTRA_OECONF = " \
-- 
2.17.1


