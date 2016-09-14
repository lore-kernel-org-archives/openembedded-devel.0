Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id CC65B700F3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2016 20:14:22 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b184so4119123wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2016 13:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=b6yAxTFp58zQ1oQ8pul5NLScX0pCzrtgtKhyMcXN49A=;
	b=B4+mxHaefU8Tely30OkxuzqXI5I/9aHD74y3nzAktNJ1W1NP4daJLTzRM5Njnm5Km3
	Y5E7uXlXs/kgRPlm3DuQ1oXl1hm30g7bbY5358rv35Z4T+FZzkQzVx9MtvfyoOvJJXvW
	YaFaY48Dee5KpnZfdlrYXga4p+ZEQR6zIqLgVRAskJTLSWAEAhhKnVLgSyiSRW2ATkT8
	P8KmCZrj2cpPcKLPnNLPebHICx91o/EpVUbilmk366H3bl9yL3JSsoJB+Ac0od3XfElI
	VsXHx1F/6W4mXrLxl68xNYMRkUgsr5McugZimGlP20956cr4n2+7yuWkyoFXO4p6DhKz
	YzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=b6yAxTFp58zQ1oQ8pul5NLScX0pCzrtgtKhyMcXN49A=;
	b=DlwujzZ+bXg9IC24WeeWugBYxMRmkNaL6U6IxQhAIKqNaxFxdJvjnSGw4ZkH34bZQ4
	teLnB0SkwaiO97XqAl2d7FdrkcVQZTnkq2wJL7k5HkEhZKKQt7hs+sgL0VM+kIelWNPz
	JbD3scvEX1Eyi/GJeA4PH+Nij8vOanB6UkfcNHyZda7R8QG4XeqfGxQEwHA7AXh0evgD
	Lxzy0S5ddtHTflDhR3cOHXUJlyhPOsCdGRHjzXNrB42a9LkX4ZtV3TiM3cH/xuz+2srr
	9xFrLt+og66n8Ow0CSedfUtRQcCknBCO47ZgFzTxhijw2xD5Mn+/dJjDjcrCx+DGSKgi
	zhAA==
X-Gm-Message-State: AE9vXwO0PRJtCqebP6Zs6yVikb9pgted5RL4ukvu/snRvRV8XS8k5J1uhkTleK6U0b96Ww==
X-Received: by 10.194.146.174 with SMTP id td14mr4390831wjb.152.1473884062542; 
	Wed, 14 Sep 2016 13:14:22 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0BE9.dip0.t-ipconnect.de.
	[91.10.11.233]) by smtp.googlemail.com with ESMTPSA id
	17sm3999350wju.44.2016.09.14.13.14.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Sep 2016 13:14:21 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Sep 2016 22:14:09 +0200
Message-Id: <1473884049-27152-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1473884049-27152-1-git-send-email-schnitzeltony@googlemail.com>
References: <1473884049-27152-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH] samba: unblacklist and link with bfd on arm only
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
X-List-Received-Date: Wed, 14 Sep 2016 20:14:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index 7d7fa02..53721b1 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -88,7 +88,8 @@ EXTRA_OECONF += "--enable-fhs \
                 "
 DISABLE_STATIC = ""
 
-LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
+LDFLAGS += "-Wl,-z,relro,-z,now"
+LDFLAGS_append_arm = " ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
 do_install_append() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true', 'false', d)}; then
@@ -317,8 +318,3 @@ FILES_${PN}-python-dbg = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/.d
 
 RDEPENDS_${PN}-pidl_append = " perl"
 FILES_${PN}-pidl = "${bindir}/pidl ${datadir}/perl5/Parse"
-
-# http://errors.yoctoproject.org/Errors/Details/81004/
-# before this issue it was also failing in do_package and
-# autodetecting libpam dependency
-PNBLACKLIST[samba] ?= "BROKEN: fails to build with new binutils-2.27"
-- 
2.5.5


