Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 256E171951
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jul 2016 02:15:26 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id o80so21133231wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jul 2016 19:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=XVhMhcjrd/rc5R+tBo4IceF0xFuRRADuthJ374PNvyM=;
	b=dBqhucKrEYFIWJmYj2Da/IS7vV8ctwoMe+YY/joiPokZT/C10Wr9snKJB7XVZ74cLC
	cCftQYKJF9KiTBUxeAVgOUKztt58Sns5ynwQw2Uzw0kZawDAk/ufCpfGVECo+FLckzZK
	NmC273X8ECrIfBXvKfqBi9/krdGKXjwMxPu3xbVOMlECzr8T4eMPu7tiD84EkPS+R/i4
	NfjvYZan2YIf/WDwLOS/TchOc0fEaa+6DzH03mJERrHJJbu04RhelMaYo2dhxsgx867H
	6gMp5wpLofz/76XS01ZSE3h5zX7mfr2hOX04FryaY5PZQ3R4WUUB1/g7vhpRryDNCcaT
	Kk6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XVhMhcjrd/rc5R+tBo4IceF0xFuRRADuthJ374PNvyM=;
	b=IqNEFfNY3f5eAGk7WwrWkauTpLtKPHgf6P1jUBnEmoT2pWxK/u+w15AXzc4FdMXtDQ
	8n/tXJb2RYWPMubK5xfvdEr9kPYZq9DWjQ1vVvhZTaEYmYMzO2w/i9JJX3ESkZST1m7+
	WRV8t/KHMjyOY1+Yjk0UoHHWRAQLYeOcQt7EWKZ+CqjcBqkxSZoCUXkhGXQpkuvWB/rU
	D7bLrX4zapyEhI/fws/Hrv0GXQvbOK3FlGT/tBZm8LG3uVFDG/LRDDol8PCwCzwAhhs2
	vmelPc4v8OPU4rqjakgXc90mQiAzunPP05zQgW2vJMdXtmbd4+mYTPERwSSqfYg1oC5r
	SHyA==
X-Gm-Message-State: AEkoouvjxLcAc11qEHkZmkgEsFW/u4Ro2LoSc2qVcVrK7xj7rlGKZkb3eY3G1T61hkZmkA==
X-Received: by 10.28.107.88 with SMTP id g85mr7612073wmc.49.1469931326858;
	Sat, 30 Jul 2016 19:15:26 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0B1C.dip0.t-ipconnect.de.
	[91.10.11.28]) by smtp.googlemail.com with ESMTPSA id
	r16sm10078788wme.16.2016.07.30.19.15.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 30 Jul 2016 19:15:26 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 31 Jul 2016 04:15:01 +0200
Message-Id: <1469931304-13906-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1469931304-13906-1-git-send-email-schnitzeltony@googlemail.com>
References: <1469931304-13906-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] libqmi: update to 1.16.0
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
X-List-Received-Date: Sun, 31 Jul 2016 02:15:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../libqmi/{libqmi_1.14.2.bb => libqmi_1.16.0.bb}                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.14.2.bb => libqmi_1.16.0.bb} (80%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.14.2.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb
similarity index 80%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.14.2.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb
index 84936e7..4e15c56 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.14.2.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb
@@ -12,5 +12,5 @@ DEPENDS = "glib-2.0"
 inherit autotools pkgconfig bash-completion
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "6ec55d1a1941bb18802ab8498baca7e0"
-SRC_URI[sha256sum] = "6283b80aea1b2721523e5229087764b4d6a1c9f53488690fa16a11adff4a0040"
+SRC_URI[md5sum] = "4970c110f160b33637a3515004c637b2"
+SRC_URI[sha256sum] = "7ab6bb47fd23bf4d3fa17424e40ea5552d08b19e5ee4f125f21f316c8086ba2a"
-- 
2.5.5


