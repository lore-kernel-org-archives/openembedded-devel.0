Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0967F7F285
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:32:04 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id y22so1082106pfr.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5NuP2Kkbe58DYtP69Vnkr9+WZQX/EfTtgLkaRbB80H4=;
	b=qvR5JxEFKYdhXp++ux3Uc1N39VAUuC7gW7xHoOlTgSDFAxseWkMwJxkoOknFGos5cS
	14u7lc5N2gJgL9jWI1+Nejg1bRgFH78blhmWyyLjO955AJTHHyb+2ENAagwxi5KncuG+
	AbSjIfKnGXKHwSp0YP8uPxhue37gVr5pzQQEiH7v93w6PVqqeYUJqRuO4U7Royw9uR/T
	Pzm9yagwAnjgAot7yZ4kJfdvSD3j4yOrPAGgb8s54lo2bcAmojIwl7sn92wrG0sEgghf
	SRHPCUUY3twCJZHRFJRf9C1mjDS636AVMVsZhZCqSs8OtDGbi28neUMB7N9G6uCC6Xbg
	2QGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5NuP2Kkbe58DYtP69Vnkr9+WZQX/EfTtgLkaRbB80H4=;
	b=ATQmZodsxrLYBpFTJub6KBfTFr8txnOJfdYHzOifaaR043oLF/bKC1JTbzmY8V0+x1
	tgCqLlkNMwtb0faNABWmCu38UQKz+ZZoKtse/BikVzyEA3ZdHiMy2XV2Rvy1r7jC16Hc
	HvnFbbIsM3REvl24RKiPqkmz08D36hAe+14MUAjFnAhxOW2MtzPn1tENJKBF8hqqwLGj
	P0Yap7mRi5S2Lut/tKxaCTOVtDlm0OUwvPZlIptNPxhlDfjXULU/fMqibMug+dTDtKyi
	LhvWDFYUErBKoYxYvcKDPkn1uQr80iSp8E/0ELz6Pk5BE6u0pn2DJAJFJEESjZs84idG
	XeMw==
X-Gm-Message-State: APjAAAUWA6TSxskY/YD6JIX7UHHzXUT7RQEY0L2JBCKP/lhCV3Q15ZoK
	G/r/T7Vg83Yi1T9Wf0Uhu3PetcsB
X-Google-Smtp-Source: APXvYqwJpbCveBe6zNqIh46ifg3HiV3WKutRSDyriD5099ovY7wtLdRiSFt1MntsOTSJh/9jI1Ff7Q==
X-Received: by 2002:a17:90a:1d0:: with SMTP id 16mr5491499pjd.98.1567287126037;
	Sat, 31 Aug 2019 14:32:06 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id
	a18sm8060827pgl.44.2019.08.31.14.32.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:32:05 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:31:41 -0700
Message-Id: <9d913cb51e60cdb13d43ba797deaf6e15479f2b2.1567286967.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567286967.git.akuster808@gmail.com>
References: <cover.1567286967.git.akuster808@gmail.com>
Subject: [warrior 20/23] wireshark: Use an upstream URL that stays valid longer
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
X-List-Received-Date: Sat, 31 Aug 2019 21:32:05 -0000

From: Adrian Bunk <bunk@stusta.de>

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/wireshark/wireshark_3.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.0.1.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.1.bb
index 572dc1a..c2552a9 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.0.1.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.1.bb
@@ -8,7 +8,7 @@ DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bi
 
 DEPENDS_append_class-target = " wireshark-native chrpath-replacement-native "
 
-SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz"
+SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz"
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-- 
2.7.4


