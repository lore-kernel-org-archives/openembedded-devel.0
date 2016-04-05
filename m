Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C4A12734B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:39:13 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i204so1221740wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=CDVUXB422CuE0u0vvH/cv/R590aHI5ko5Y+wzXViiRk=;
	b=u3z9xn6BTo9WEwlJ2Yl2ekn2/+CpVlvAppm1yr6+zscriR/aL/+Va1gyMe8INKttIA
	QaeFVZ3afWYQLuo8t/GiDJgEQfSWo5x1KM89y9XH1I946dkk8Br/UXnHwKTecgJ+Sxn0
	9cKP6Q3g0ULUJ7s+87keRCKj1EafX3d5uV4ppVRkfnRNxxsG0pQVfs5vRI0XM52fU2gg
	kTzeR/iGQZxGtIAJ67YJGhoDdYjDGEhcrneYICpxQoZ2RlaWF35USeyLdds4RE2rueRJ
	ziDbQWFNbd9w+SNTG1DXcezhkDi+Wc/IVWyYkUK4hWQZP+Du1iK617wCMih+YxcYxjza
	16BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CDVUXB422CuE0u0vvH/cv/R590aHI5ko5Y+wzXViiRk=;
	b=iOGtHtyiWbTzBNeWgRREdQHrEmhyOTU0nkGyNOrmNQrqTtomKAZEXomRiYTGXymU1D
	t9U4iM1Dg2RPW7SReFAzLGnalGs6sz3uJ1nFUhYtaZ/PisRzgoQBV+betb4II4wUcFUe
	Vajeyy28Bj995FXb0kW/ZyDduq7PgO6i+G1HzKZL+qbh4zLbgmk50KoYyQ7or+se/tH7
	CHnKsYZIYBk73R8r9QKnU7/GR8+QnYVUOn1ZTgo3KoXurGsyKpHWGDbg3yKhug0W5/Hm
	tWqJsdjLZlpAvNxFa15qyuYNjRV7nQdOqpZER5EiMuideNd3EBS9FM5KBNQjXeAI9Fnk
	tqZQ==
X-Gm-Message-State: AD7BkJK/QhJgOAtWvxbqJKq3jfrv1459j6sOKb8FXCFQbRpJ5pbI2J7bzbtugFstMFJpMw==
X-Received: by 10.28.95.131 with SMTP id t125mr16058896wmb.80.1459834754430;
	Mon, 04 Apr 2016 22:39:14 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.39.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:39:13 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:31 +0200
Message-Id: <1459834720-17165-23-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 22/31] qtimageformats: update sources to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:39:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtimageformats_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index b49940b..0a97f12 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -28,4 +28,4 @@ EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'jasper', 'CONFIG+=OE_
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libtiff', 'CONFIG+=OE_LIBTIFF_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libwebp', 'CONFIG+=OE_LIBWEBP_ENABLED', '', d)}"
 
-SRCREV = "58f19cf8d51e06f1781f3142e6d872e5feb0690e"
+SRCREV = "0bd46d5861fa7b48c87cd3a734d00671df929869"
-- 
2.5.5


