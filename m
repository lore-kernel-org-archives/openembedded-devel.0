Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8BABD770CD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:39:17 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 20so1205431wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=6k93a4cSrT/WsbZyCktz92IGDI57EcKD6L04IEL7AUs=;
	b=xbyxUd47MriFCI8dDq6taVHlpTzsMJZ+Nn2Hk+KFCFVNMgYyt/H3d8t8aGNd/7sy/j
	elpEzWS7wVafaYyz4uC0hJ/lQgAHaLNpSdeYzbgQ/5j8ylW6ht60qAed3/I3LwrGaLwj
	nWWiYmBq4Ui0SUNSrqlJQ+nqQL4w/B0FuHQhR17eDi3hkQDXpPh0RsVJg+ES8OoFo53i
	M6OuxrkNdrdPKhZvCevV/zCLmN3nRenySOjmHyz2HBFnKF5vwHVIOlPTH1raCBaUTIrb
	rWEOCkegJVpT5XYF0uSzn5WVLp3kHFeu86D5Fh6C4v1xwIGB1jI5QpD9YzHDX+DrcyCe
	j3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6k93a4cSrT/WsbZyCktz92IGDI57EcKD6L04IEL7AUs=;
	b=Rw1Y42HaUuBzP0hBrdi3CzX3KEKqLnOlYrlmFF3QMmXphqurRwcosfrvIowHk9oATL
	b2KmVoDs4AcrLjRDRFYf1kcZZP8RYWWiDYPa4Lx1R5iDHcXECf5IZozKmDAILQx7Fe0h
	/m3Lq8NEQNGehqryE065dR191ocb5Sj4w5MwoqqZf5odzmTBecJiqqikRtbwC2KYN46F
	DL7A3VLZ/pbSlNSD1XyuQHbioPZ/fnhJr02L2/MRo2YCvd7/R4VDjGxkL+Zf5mcjAjny
	TWFqdiNnKUTjqhrxya0jeIDDPW07d5RJ+flwgq0RKDYAWsdqz0UiJmHc0y4jBZJJO+I6
	4DpQ==
X-Gm-Message-State: AD7BkJKR3VwofSZ++DHPKH6RfubjcoVlGwRDQsf2K4BLJlcpffi58EDsesSO87wfeRCszQ==
X-Received: by 10.28.135.4 with SMTP id j4mr16072178wmd.80.1459834758196;
	Mon, 04 Apr 2016 22:39:18 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.39.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:39:17 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:36 +0200
Message-Id: <1459834720-17165-28-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 27/31] qt3d: update sources to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:39:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qt3d_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index a19422b..730efac 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -27,6 +27,6 @@ FILES_${PN}-qmlplugins += " \
     ${OE_QMAKE_PATH_QML}/*/*/*.obj \
 "
 
-SRCREV = "9b9f34701f47824e8201453d148152fb0855f98a"
+SRCREV = "7a208d76ed96bb506899becfe680df06f95451c7"
 
 BBCLASSEXTEND += "native nativesdk"
-- 
2.5.5


