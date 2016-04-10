Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A8F12771F8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:41:52 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l6so16766751wml.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=y4ta7hjU2A/ilTwLGrdA2fdld30xCB09ecIexd6L73g=;
	b=kuIaqJRWmHFwdkaSUvEGGEECghUl4+lwrj3A0UiWrj3jz7RMHXcxrjPssGgxvqarCt
	ietWpipMHJcx6/OA68gWLz8b/Fs007M4BqBcK9ZRq0K+JoG5acn9mOe/YPjguOtdonku
	5RBvMIjEPiB3WndZFcP8ktXHug/k5HHsNus2Fd1azMOiU2IG/8reK8W6b5TOaGxB0LU5
	VIZfOs6TrV70YdQAk52izzzCaCjupF4dUJrVw/qCJNgYeO5O4xE60gKnaoGu4+chjDov
	mbHoEYBYk8fYD+7sS+AGYEZ2VNVj2Y0Wip76VWn0DL6sJpAxoEU28uU4qwzLHzs1vWlX
	1sYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=y4ta7hjU2A/ilTwLGrdA2fdld30xCB09ecIexd6L73g=;
	b=hqObNVT1ZsV+nWQ6ikgxMbkx4btfErrM55+RkrJHXkbevuOAF3MYGOxJaL0xKgOaYg
	6DRsCcnkQvSlpi3URCIlNTJpFgFJ1VRBdKqbdw3sJqvIbwoEuB3eZ9O8cx/Nf8xfHMnq
	FVC78Z55UOIvGlR3mX4woE2nNjnIs1wz5lQ4ozGMuYL6f7WbF3EjND1S4WHKUIplCq3S
	AHyskUUi3fQ7Pgj4yDSHRDX4Uad602F/QTCmDJPwxz5uqVrj24PYUYynCLWekhHeseul
	ddOAeWuDXkt7mnYzcChpG5INIM7LyIaBIEFXoUth7d6FOBkURdXjzA7VNBcMogIWgFgw
	RFtg==
X-Gm-Message-State: AD7BkJK35kCIxvS657UakE+zUDAhntBGHgQVULiQPCa02667hN2+8wJHbdrFOghacZxDOg==
X-Received: by 10.28.54.148 with SMTP id y20mr14297835wmh.68.1460317313320;
	Sun, 10 Apr 2016 12:41:53 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.41.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:41:52 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:07 +0200
Message-Id: <1460317290-4787-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 08/31] qtscript: update sources to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:41:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtscript_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 32f6ebf..eea6911 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -27,4 +27,4 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEPENDS += "qtbase"
 
-SRCREV = "a5e814fd8809dd6a8a3c3efd4b911b36e3325a2a"
+SRCREV = "a70f6a1b9599931fccd13b15a1700e61137f7e72"
-- 
2.5.5


