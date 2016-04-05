Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8BDA7770FE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:39:11 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n3so1224128wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=fP4HMYrlErEyjcwJ9auJNjkMUQ5thuGLC1/8UsMW0t0=;
	b=h55pPKV/yemN81RDP061b96i0fT6AcFV6XAMY+dWKlwHrf6ZIk3kNU8NKBqitBNqb0
	EZg72WZYjwNTo9+CUKq7TFQR/v0QPgK6M9YgWXrHT9QanF7NhHvIZc1Rq+ZlOyMUZE76
	rAaGEoJfEjgX/8+9mXMbtN6Smv4FULKr++w3XvOadtbCQa+g+0LArB2wmZs8tNGPIR8O
	6uzyrLqdlmXPRNlKTFGPIHU44m5/mt0IKr/s47Mu8AVUScn7iPUQGkHiCvMLOwY1CoBI
	ZX2gBWg0Pem2a4BDCi+h+QZBbYhpYEfJYEDirxz0ov3p33QFjX4sImK2bykDoGwqfJBM
	dWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fP4HMYrlErEyjcwJ9auJNjkMUQ5thuGLC1/8UsMW0t0=;
	b=HtcHPmdAk5Ma4q/lraJn+ok8NbtYYmLjnNQ7b5ezc2F2oUPHlc6N1L580wd3OpEmhQ
	60AcpGcW7DzPYHcVPCdEcXlrblQzv38n+OZJSGVMHhSFIW7J8LbS7ApXtd1XGsaphwed
	/yYI/EYY1ARUqYQRSBh6rMk2JLkw/i8semk7Fz+FcVkKrs3VAA1n3xgmaPZRR0OXViwe
	0S47RC30DjhuHJMY2uxLoC4ieOIJWLX+wzIH0B0g9+l4Hqa3ADbApRvR5vTw+XbijlBB
	Ogym1OzVJvhxBo+isD2l0qrX+kTvzcnFFi+IhDgTuxauDmsFX/ZmPXbfrc4VedJeXMCQ
	CQ6w==
X-Gm-Message-State: AD7BkJKQjDpGUcxT5tFLLMxiPiHj5iUg7EcAHQbQSpW/8cT+b/TRfzwLeF02eXRI8CqaUg==
X-Received: by 10.194.120.229 with SMTP id lf5mr19245172wjb.151.1459834752200; 
	Mon, 04 Apr 2016 22:39:12 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.39.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:39:11 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:28 +0200
Message-Id: <1459834720-17165-20-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 19/31] qtx11extras: update sources to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:39:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtx11extras_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index 0ae8e4a..ac33fb2 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "5df9fa8f3a7209c067a5d5068776b9aa52273d3b"
+SRCREV = "d64ee96f0df4d3baa6959b8552bc59d53cb0b451"
-- 
2.5.5


