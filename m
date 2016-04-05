Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1422960132
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:39:16 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i204so1221894wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=uMukkIXlrec16jcwG3P6fIzMyLSkXoJLEZorjr8CB58=;
	b=WgZrNqj+yW7MXRL0zkZJ3YWgxMVVyixfNaHTHb6uM3Sz8rcWNcv9Fb1BRx1bINf2MN
	PLkCDw1Wd/PWTgDP1h8gDjuAx0Nya3SwAfDlSj59P1NQd+D7reOSfZa6USHpnKOPhC4t
	I9EQZQA+Pt3SbMbu1833IGJLEXkqy/ZNL++dRJ2gU8TwsiPTobcr0uHPKQW8Xs1fVnK7
	1RDIfIxecUZGMMZrOy9NxusWiOwlMHBA/uv30u4a/G6uwT6ArxzmujPEikFhMtfIdyLb
	3IszgSyCYUjVwoUqZPzkbwPwSHD1LzqMoRecEH+f/lGaqTw/B0oRqhwE7H/3Z9MBdklu
	TDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uMukkIXlrec16jcwG3P6fIzMyLSkXoJLEZorjr8CB58=;
	b=N26twEt6GBMhLgzhf0fyXMxyGWbo5dzQ5AriaOrDMBZ71/BeM/ufg+0e6C3R8VOtZT
	dLdMApoaGKuQPSyNLw5zgBxwRZLMH5ka1gLKuixVspBsPu3ZvpI1c47GyWTzyVmyvEge
	U3CdJH+WZguLCH8JhqG6NxevEPecj49GG6b9PWLIi/RL6S88+//V2s+BW+vhXGQtwQeB
	rKoj5n0dTBqE4JyzEltqoniNmRD+g/qraggX79i/sNFla2oHNdlQYAA80bf4wRuDopbe
	wkCFw8aDXS8utscHFnCADW2ZHkQjG1h4HWetKuR5PZrd5upx+jPTZsMCUeJG0+39Xt5+
	hFQA==
X-Gm-Message-State: AD7BkJJuS5+e3mJzl0bbA3RBKGW3mwSb5GojhQDZhh5LLoMl/bbC/OezKBdfXk0BmFcZ3Q==
X-Received: by 10.194.2.210 with SMTP id 18mr1190141wjw.55.1459834756706;
	Mon, 04 Apr 2016 22:39:16 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.39.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:39:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:34 +0200
Message-Id: <1459834720-17165-26-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 25/31] qtmultimedia: update sources to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:39:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtmultimedia_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index ce42302..61c767e 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -35,4 +35,4 @@ SRC_URI += "\
      file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
 "
 
-SRCREV = "3b6de26fe585c586d055ac86c5911cc6df0e3887"
+SRCREV = "9985224a89b830dc182b428f491b6187d6f0e1ba"
-- 
2.5.5


