Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id C69A1785CC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 13:30:04 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id l22so10742237wrc.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 05:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=qR/ikzpTzp9UOMmDQ+lOP2CKSJM+QL4g+p+7Tjdc69E=;
	b=Tz4cmbDZQ/S6jgZC05D5JzXPkTFXqdN2zpcOxFxoV/TczE8K9JIa3en+vOstoDZNn6
	4ZOwT4VTBaOzn3tdn5wGE/DJCitd47pbpaGdoifsyb/8RJgcXGPVL4/V4W4ocUuPxd/x
	B5YZ7X++9M6YOAfGw6pKsBGP6FPCzfzJa4Jrg9+oDAvhG8nX7lAXaTMJ6xA5K5cSesfC
	9GVpJMGdm8OeSKYovE0o9DGBCa9Fp2TaizYtxoYttxzj1GUQ+h92l/srMlfazNcCmAzp
	/LKcbfzrQZ8DWzXOFag29o1w5e+feEQLr0ZIUyxcs4FojO4kjVLVArGYKjVcGrPUtxPF
	+/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qR/ikzpTzp9UOMmDQ+lOP2CKSJM+QL4g+p+7Tjdc69E=;
	b=qoCw5H339JVGfE6IvXMxtaz6Iu21UocRanMa0I47pK4fEYyk5mMbTD0rrvf6mp2xup
	sjr1jK1cYXshko7SdH2az8jwCKwP0fgiy5l1bfvtxb1ONKySUR8TgpfkGe02VXlr0wPj
	g5MpqYgb0VoPwwjUvAX2beFZ763IcSNRjgw+Lir6KuYC/SRkgRbQb1iGTWGDtZGpkXuA
	yvAv9LCArGsa0hd7FEqqNd7Pv+vwq/eQ+SLcxMPkc1U7JsOGjepfEyURjxgLKdn18H3n
	9HUhNcW0TmzDiTJ6ArD4xXbbFj0D6DAKTG/iVPFGDzndcyKGzpN/FSvoKn0R4d8VtXmR
	AlfQ==
X-Gm-Message-State: AJaThX7lArWmq8UFst3rGd1MDE+bzhA75OWMGEcFeh/xFUfDhZaQBNUM
	tbB5a1simvaNDcjA1ihulvRJ6g==
X-Google-Smtp-Source: AGs4zMYxTiwBMGEQOIE4d1eLGHgg1PDxgH/5AjahO9DekSrW5ZekE+1N6EQlbuHWyMGr6oX3Rn/1sw==
X-Received: by 10.223.167.65 with SMTP id e1mr3145706wrd.280.1510407005678;
	Sat, 11 Nov 2017 05:30:05 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030070ED074A591E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:70:ed07:4a59:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	195sm16189805wmj.3.2017.11.11.05.30.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Nov 2017 05:30:04 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Nov 2017 14:29:41 +0100
Message-Id: <20171111132950.12570-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171111132950.12570-1-schnitzeltony@gmail.com>
References: <20171111132950.12570-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 04/13] xfce4-settings: update to 4.12.1
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
X-List-Received-Date: Sat, 11 Nov 2017 13:30:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

As before: Sources in my git-repo base on relase commit and put ontop:

* Option to hide mouse pointer for certain devices (touchscreens)
* Datetime / Timezone setter

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
index 771da2c..b98d8a7 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
@@ -13,12 +13,12 @@ REQUIRED_DISTRO_FEATURES = "x11"
 # + minor bugfixes - sent mainline but no response
 # + option to hide mousepointer for a specific (touch) input device - sent mainline but no response
 SRC_URI = " \
-    git://github.com/schnitzeltony/xfce4-settings.git;protocol=git;branch=for-oe-4.12.0-1 \
+    git://github.com/schnitzeltony/xfce4-settings.git;protocol=git;branch=for-oe-4.12.1 \
     file://0001-xsettings.xml-Set-default-themes.patch \
 "
-SRCREV = "c6683cb2cff489c16c2c7b5eab4017bb461f07f1"
+SRCREV = "0766cf81daa9d41d0d0fed2fb73a8a26709a3bca"
 S = "${WORKDIR}/git"
-PV = "4.12.0+git${SRCPV}"
+PV = "4.12.1+git${SRCPV}"
 
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
-- 
2.9.5


