Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 558C6771F5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:42:01 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id n3so16812446wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=fP4HMYrlErEyjcwJ9auJNjkMUQ5thuGLC1/8UsMW0t0=;
	b=sPCMsOqAiEhT0KX5KexikXfpKDJvIfZQIXea8FZJhDYR3R14OOFsZ4mlDg98IqyQJt
	OaETkYuckZBXWt1EHNQuGiPezBmWG8RPpfpe65v1z0CT6vo+5s/yCjgTjJetQko7v24r
	yH5iQ0DTzJ6/goZwwW6aTGsFagqXNGHUcSc5nZACOI3WqydJB630fJQ44S1ulTmB5jM5
	hPoJQjsBY1VFSix+tTGOtkof/fU3lfTmO1orA93zjLhbJt2EVcbfM8d04HwNQRmG4yTT
	wq3tVYRapqAr9+QRqXPNfpXFZ3IEgp/IMD9M8ix4TEPyN/CzVp8+8xn+kHOZF9k+ZbNK
	RCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fP4HMYrlErEyjcwJ9auJNjkMUQ5thuGLC1/8UsMW0t0=;
	b=J2fx6D/W89ZZzzlF542ziwuFUqnWZae23D+74dwWmdhvuIox9dg8UbFl2nUAmbhWVL
	eYLKUFqnxsx7TSrXUT1nT3jpD5EmawPfygwiY8gdgp8f0FC08M6s/L703vI9MI/gI3ie
	yqZkq86Dc8nimulmbJ6SFbHpW+W0J/3VYAOsDQb5R93jH0Hz8f2WhytdWjd67r/SkZ2U
	OWoXxU2rKygnz+pQ9wFF/mlxM4FGIVhDYgsPstjMe69Ls/oY/IUgy1vj4BqTzYoQFJ5Z
	dinYJ4bnXNcAXthWqKk0EWsEh/+AyxTsTcCrd4CAgO+X8y6cCj6KYa4xOz2NOueRO+/Y
	aUcQ==
X-Gm-Message-State: AD7BkJLKfLl5QKbBHP0l7mddV8zIIo5iCkTdCfiq6GZpHcOGJUqpePhDDgh3mvdkVrO1Ig==
X-Received: by 10.194.216.99 with SMTP id op3mr20160286wjc.26.1460317321708;
	Sun, 10 Apr 2016 12:42:01 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.42.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:42:01 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:18 +0200
Message-Id: <1460317290-4787-20-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 19/31] qtx11extras: update sources to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:42:01 -0000
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


