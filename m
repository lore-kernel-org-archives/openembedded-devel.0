Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id DED436093B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 21:38:34 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id m85so17498317wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 14:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=LKp5vr0KSN6IE5MOkJBLXfNGJTPKSpGX3wrcItwlkvc=;
	b=Hw1vaXTHwEdmsSRflENw9hFp7+jAyqLNwVWidLp8tqvVimNsC9GS2b2SacaqWcmGqb
	Hfg0wWY/8v02YJgOTgf+TBUMzTmmTcd6UpOUS0XMm0HtixgkGAGLP6fM8VuNaWamt1t8
	vo+asWz3EGRyFiZXem1lD2cfvLYgzyCE3beOk/SMVBFvqoCx3mTFBlXlJGdTPC7NLvot
	39Mrhxs9I1WV0f/q4ZTnUDX4jlHzG8uqSusBCfNtBIKBK94tZup0NgOJrFSSl4qk0BSF
	G5JQKgdk1sM4I4eeZxyIine5Mr394/xJOePOFw//BYyX0jUzRlqET1R7B7o05gdh8+TP
	exuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LKp5vr0KSN6IE5MOkJBLXfNGJTPKSpGX3wrcItwlkvc=;
	b=GIDhbSkmFqoEgCa9PcT/IFvgSzp2wzxA0wfVWVrwHTweWrOPCT6RPaXY7iVkItKpv2
	k2GEsRQAVz2eY/IKD4sT9gi2fY8s5gr4mM1VBLLPsK5BiGu2ouyF1tDDVbMP+sfSf2mw
	XuyVp/OZe8Ljbk5Qf2Xm98WeSQ5oXfskcqndnmjm5II0Jbz+dWK1zi4MM8zVN44xFZu9
	UE5SQw1SZXPakRrXjDVdVdbMkZsA54eioZJD+Snxkv39O287yNhqh5HPnIiEMTj05UsO
	MyEuHmDtDmAX0XVlk3ScaekH1X17fwLhlU0wjLQXgX0j6fD+fObm9M5PllpTKG2d9nIb
	wOrg==
X-Gm-Message-State: AHYfb5gNt3eSCuFQFTbQTl3BAeoDyfN5ngjzFWjzwZgMMJqJ1SN27LC9
	9QAMJAvgPJyr8mEv
X-Received: by 10.28.71.5 with SMTP id u5mr4410431wma.138.1502228315397;
	Tue, 08 Aug 2017 14:38:35 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E90C29881E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e90c:2988:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	p68sm14587855wmf.0.2017.08.08.14.38.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Aug 2017 14:38:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 23:38:14 +0200
Message-Id: <20170808213821.17561-2-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170808213821.17561-1-schnitzeltony@googlemail.com>
References: <20170808213821.17561-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/9] thunar: update 1.6.11 -> 1.6.12
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
X-List-Received-Date: Tue, 08 Aug 2017 21:38:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/thunar/{thunar_1.6.11.bb => thunar_1.6.12.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.6.11.bb => thunar_1.6.12.bb} (88%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.6.11.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.6.12.bb
similarity index 88%
rename from meta-xfce/recipes-xfce/thunar/thunar_1.6.11.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_1.6.12.bb
index c750e8c..8f1b23e 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.6.11.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.6.12.bb
@@ -9,8 +9,8 @@ inherit xfce distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:3]}/Thunar-${PV}.tar.bz2"
-SRC_URI[md5sum] = "9749be8247cb19ed0fd36e4118c6236a"
-SRC_URI[sha256sum] = "b1c7c3121827f59610900ef1cc19aa10a50ab2cc3ae38eee15181b64256e8b42"
+SRC_URI[md5sum] = "1bdf3c4a57ff886c512341f24b5e0e88"
+SRC_URI[sha256sum] = "fb22091f07ec6de2c9d9d89c61289d2bc3436b36c8c53ccbc9c32ca8a99f2086"
 
 S = "${WORKDIR}/Thunar-${PV}/"
 
-- 
2.9.4


