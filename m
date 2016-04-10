Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id F346D771F8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:41:51 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id y144so16735017wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=9MiE4zKAsS8wMU+ZaT8KK8/fi8B7tUZrWTxoHi9Jf5E=;
	b=teHPwwi++6tEeywhSoeO8/Shw7s2itasNMZusrtjylKtgX23JtMV8dkSutZB5HXnCx
	44tu3Ij8Vy6ZWLzkZjkA23bZ2Tzb6nBPpmMDr02ZS8FuchnJoDO5iB0fEpKkSKBSa1ck
	oeK9ZAAtg8HU9Ihjztd0Ymgl5WWy/UlkvkLBbruKqCNLPX47k0YgM0iY6zIyAKAhMisc
	yD/x9wn/EOhFp40g/aYGuHtw3guf1XMxGrYt7VvFj7PGsYPgLZ7CS1SMbMzyh/nx55yQ
	dXeN1Ne61DGGfnUJwmfpJuPZKPWCXLqdUJBLn5B3yguvEWUd96g9QCg7+TtEvqCtbFBu
	CGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9MiE4zKAsS8wMU+ZaT8KK8/fi8B7tUZrWTxoHi9Jf5E=;
	b=GmvhPh/jniKteqtnYObkzQifffMBOAkVqk+8GrogX44FTLYh3BuKwKPq4IB2n8m39l
	hCVXtBtBsr0lNpEQSElAP6TLFDMeDgadetIQXk46emDlxXNdr93hlrXBeS/2S2iTqkGl
	Ww2goSdPKWvEUn8u2q7dAbSLjSxZMYCnEBaJmf83L5GeOrf/ac/DykL5ItCd1hfAcUNR
	1D00LiG/0+wQgPRKX7ZnYqxtPzM7/nVhtouynhGeEll4imcg7Fglj5ZNpnzIDPkk6uY/
	2OBjqQrje9nNH7aIHLeRJY2ovnhSTQ1hmCU0V9Le91/qfDhOdw4VTrikYA7lZxph/Cpu
	uOhg==
X-Gm-Message-State: AD7BkJIvy4ijbnIYbmtKvSS6Gh+08LHAE2qk6m1X8w8iWDR2S4CtSuXX4R9TcHJpoBd18g==
X-Received: by 10.28.176.133 with SMTP id z127mr14933748wme.66.1460317312439; 
	Sun, 10 Apr 2016 12:41:52 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.41.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:41:51 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:06 +0200
Message-Id: <1460317290-4787-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 07/31] qtsystems: update sources to 5.6.0
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
 recipes-qt/qt5/qtsystems_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index 868e051..f0131c1 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -33,4 +33,4 @@ QT_MODULE_BRANCH = "dev"
 # qtsystems wasn't released yet, last tag before this SRCREV is 5.0.0-beta1
 # qt5-git PV is only to indicate that this recipe is compatible with qt5 5.6
 
-SRCREV = "cc2077700bd5503d1fcf53aef83cbb76975e745a"
+SRCREV = "236b6b544fd2049eb46e8f79d13bb7aa35ba002f"
-- 
2.5.5


