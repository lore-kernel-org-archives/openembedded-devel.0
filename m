Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 281DB7F79E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 19:33:55 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y11so643957wrt.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Dec 2019 11:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kVxTENYoft2IHTjBbGW48e/MpOMN88c+yRLD7S5RRWM=;
	b=EFUWmfeyVXxPk6po4cQuOrin5oABfh3yRScHzQnH66aB2fYTo713anctxpnu4WM9vU
	Yj/CkvVaC5fo2+ceV7Q3tRg550KMq2RSmvg+Vbsesne66LPOc2s2lZP39Lh/lmX+8M9M
	zTFnrt9N+k3J2FPjvxJKSCurelGBOAiq1yz99qZyyeaMX7jMv9lF64B4SvUtLCHcKg8W
	p4omgzU5Mf1P/yKlmWPIEOKB0DxzYhY4V79mxrebxDWMvPqzNF3TUqwn9BDdXNgw9t5q
	hK3hNDKb8ARY+2lRx8xcak8xccvEkLF5jq2FPBymdhU75XpxIaV6sQQ7uQQcRzWlhAon
	PVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kVxTENYoft2IHTjBbGW48e/MpOMN88c+yRLD7S5RRWM=;
	b=nrG3bzrFL76ttW7AIr3b3uAL8G60dLdt2bKP3MidnE1NvaatnGfbcycxbVaV9em3vn
	ketch9pKi2AYH2oFkeLn3URKy4R5owGkOJ44esvg+y5cHhN4YNCOZdyD6b9dg+ro5JU/
	84GoY0kraKjsCDauwQ2VanFlDBCnsWHa1GEpZ6ynf8Y2ZXhmLxvbHiABBuQOFp6Lf9Uo
	Lng2acJn9f4S4q0aVO59QMv7u6y95gu2pKUy5asEuQnemvCzlY3pq5IOODNybsMKv66b
	0I5mULajncSEoH9blbZMiPGYVR7hshWQOHR/Kx1lgkGNgYoShjUsdSoUZiqjch/H6E9s
	HFVQ==
X-Gm-Message-State: APjAAAUoRgOGiAdktnf2hBoSNTRW5bxSC7JcTu8+zS+ZfLypYIoQgMgr
	r+4TsT+dmc/5cFF+BTj8zm5yowyb
X-Google-Smtp-Source: APXvYqyhWdkhZsGjXjZx/pMUoUfLirhdUrwk/PhQQNH3ShdGyixysGStUNmR2K64ixim7uo28+y5cg==
X-Received: by 2002:adf:fa12:: with SMTP id m18mr620951wrr.309.1575315235702; 
	Mon, 02 Dec 2019 11:33:55 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	y139sm465420wmd.24.2019.12.02.11.33.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 11:33:55 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Dec 2019 19:33:42 +0000
Message-Id: <20191202193343.12298-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202193343.12298-1-alex.kiernan@gmail.com>
References: <20191202193343.12298-1-alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH 4/5] ostree: Add PACKAGECONFIG for builtin-grub2-mkconfig
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
X-List-Received-Date: Mon, 02 Dec 2019 19:33:55 -0000

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta-oe/recipes-extended/ostree/ostree_2019.5.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2019.5.bb b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
index efbbeb6a500d..7c1ed9c6b7a2 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
@@ -54,10 +54,12 @@ PACKAGECONFIG ??= " \
 # soup or curl - https://github.com/ostreedev/ostree/issues/1897
 PACKAGECONFIG_class-native ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'selinux smack', d)} \
+    builtin-grub2-mkconfig \
     soup \
 "
 
 PACKAGECONFIG[avahi] = "--with-avahi, --without-avahi, avahi"
+PACKAGECONFIG[builtin-grub2-mkconfig] = "--with-builtin-grub2-mkconfig, --without-builtin-grub2-mkconfig"
 PACKAGECONFIG[curl] = "--with-curl, --without-curl, curl"
 PACKAGECONFIG[dracut] = "--with-dracut, --without-dracut"
 PACKAGECONFIG[gnutls] = "--with-crypto=gnutls, , gnutls"
@@ -86,7 +88,6 @@ EXTRA_OEMAKE = " \
 "
 
 EXTRA_OECONF_class-native = " \
-    --with-builtin-grub2-mkconfig \
     --enable-wrpseudo-compat \
     --disable-otmpfile \
 "
@@ -124,6 +125,7 @@ FILES_${PN} = " \
     ${libdir}/${BPN}/ostree-remount \
     ${libdir}/girepository-1.0 \
     ${libdir}/lib*${SOLIBS} \
+    ${libdir}/ostree/ostree-grub-generator \
     ${libdir}/tmpfiles.d/ostree-tmpfiles.conf \
     ${sysconfdir}/ostree/remotes.d \
     ${systemd_unitdir}/system-generators/ostree-system-generator \
-- 
2.17.1


