Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22462.1794808948940777691
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jwzdgN7W;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-37198ed3727so4627779eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808948; x=1795413748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hKpSTMY1e7qMborttnfZyO0uqQb59jV5MdW/2OoT03Y=;
        b=jwzdgN7WTJ7cv1JRFPOEnP9FG3uwUA5eODo/Kn17nfdXKNy7dawxZyS05lBoYDjVOR
         TdKFws3X++RknT3FV56gJ1gHVqCaemcoL+DeSuq6enMTedbHVsgp9AcOFdyacLim6Km9
         r/fZpakjqEXtbItIxZcpzBFcwkUtu5jOb2nU0oXU+9qHKhhbMqBII5q1G7/D5LKzS01n
         9QoAPi6vZzyojqZA4hz5ufs+gqfI2QoCmoKKv5j5mOY6kU8pf1OSkJ7e+8TXR1u6P9PO
         8PjTlZifLgIf2QpdwVHKw3lzXX//1ZKoH4OvJ5KIbsVDituRD/JZx1IdxLy6cnZL4b+i
         +9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808948; x=1795413748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hKpSTMY1e7qMborttnfZyO0uqQb59jV5MdW/2OoT03Y=;
        b=Wuye6FAESLfAwKGuLA22dd2++k69IIHpTLi/opgbvrB+09xEodh/qH91i1wD5OrhHw
         ZRpkeq3rmcbtkC0QUG46Egwq9z8RIjZn/xrv9D2xiIEl1FMs3zgJ/f51Ht1TeU5YdXz6
         CwTMM4RUDNntVIplmBoTjIYfQZ53icXjLPLJLXopOQEwpJIEsGj1dvraLTKJjcDRpfPD
         VRZ+YxHM4CE3WElpVneGjTTv6OCbUoku0/HJ/K62XKToDAEu2MUxwZl0AliCseZcJwvY
         JUt9WJK8hC3may1yP7Fkq+URwaLjleM5NK6glVaVXJDuZhUas6Yf7FhedL4mPBwmxGNR
         F1fA==
X-Gm-Message-State: APuU4Z/iO+DU0l1SWzNfDxp+tAtZC4CNeH6zqnn9x/BjynMCAAukSUeO
	/GUaWrxzdP+UkwPeT1M2F042IrXCHLrBU/ofH2RTGHmR3+z3Aw5dAPs7GNzJ0RYb
X-Gm-Gg: AYBFou270Y6k5AqOh3XtBpE6306JyapJJB+d+73r3j0iXxdY410IMZcEM8VMUS9jCPT
	zZj0lvGrWPxb40yrYMclkcq44L+f9d3s+RgUYa7kxIUlG2i+ievQ7KHRsYwn73RuUmuiEGNxrkn
	GV49F57Pdb27vOHsUK4vmsyqQszPoDzhm2AFtC+s0lQUCUzJLBEkVxmx3kkhCLjmhHCHHV5DeuQ
	Tjaalt/lGlKGp/PWH/BKoc1NCR+pUBj6Up8dtIEtthAmnmzK5oKXKzEPAKTVzdimqfw9u/31wsI
	EkQT8OF1OGMcW0hw7oJhr3fLRfMy68mxL2eWjwufdD0EjoMnYu4VWhAfAgWhi35xpcRT5VDcTIy
	Z0mW04wOZZH/EPBq2GhwtMhGGvoMWxtWkfTAr6QUB8W2jAIUmmk4TadX7uCKuAMFMI54Cef0dSv
	xXD9AP+7PP61ScdJ0vLQNpX68O43XTP9kEzRhf7MZS0elTxkuoNpL7rzgSl3o/8l6R/Wcp1hY/n
	agdtAmbeQxEyGpkUPPrC8A4G15KvDvTJmUEESh08A46YO5h3AtcfGjMZ1WVg6LDnIODgQHx8LgL
	atL4MgCENa44jJWPYtu8KS03UK1DYase3VC845fmvyCyJkMDj8taq4H0H9PVws1X7yNFnq3Gz6x
	xK3Ra2//RZnUQHPPTsK81mj/XjWNNmMc0c6hyQBhrjIOBOz5cLKtcGqIKCZhLaH3o/zb3rmMw1f
	RXteKhsgaqk/DkLeA719wntMk4+ZlBTehdbcrVG1gk7rR2tR64IM67CIIoMnXWozwoGTkssi57M
	Y7EDYms88AmVtq/ii2C/B4iwdgvMPd/96t9SAA/hCgnrVdPj5MIk8MJGocmBrrh8UXwNpE/6b7q
	tqoh
X-Received: by 2002:a05:7301:1527:b0:36c:a26f:83c4 with SMTP id 5a478bee46e88-377e101681cmr12213925eec.13.1794808948203;
        Sun, 15 Nov 2026 22:02:28 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 15/30] libmodule-pluggable-perl: upgrade 6.3 -> 6.4
Date: Sun, 15 Nov 2026 22:01:53 -0800
Message-ID: <20261116060209.2916444-15-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132413
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...le-pluggable-perl_6.3.bb => libmodule-pluggable-perl_6.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libmodule/{libmodule-pluggable-perl_6.3.bb => libmodule-pluggable-perl_6.4.bb} (93%)

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_6.3.bb b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_6.4.bb
similarity index 93%
rename from meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_6.3.bb
rename to meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_6.4.bb
index a7751cf818..2035f13508 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_6.3.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_6.4.bb
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=322;endline=325;md5=086450ce010f6fda
 
 SRCNAME = "Module-Pluggable"
 SRC_URI = "${CPAN_MIRROR}/authors/id/S/SI/SIMONW/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "58512bb9c654746d0937770b98b559b30872d85ac24073485e5830890dd1b2a0"
+SRC_URI[sha256sum] = "970fd13accd3d538e637db080ebbd9898020c8b5591837c8493a39edd737922d"
 
 
 UPSTREAM_CHECK_REGEX = "Module\-Pluggable\-(?P<pver>(\d+\.\d+))"
