Return-Path: <pbarker@toganlabs.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4E48578377
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Nov 2017 22:08:21 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id 15so6918127wrb.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Nov 2017 14:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rhOtaY60puZulwffiwxpoIGq8S0doOottAKaz/XDSyU=;
	b=QB6Ju79jwbzsxuJqL3redwr7jTrn8kwwfWv8X2rLb4jxAOYnGYY4T5NpAejBBFcltQ
	jCN1C7BYNbEq+0n/wj5yL9aFntPOp9KeN0rSm2VIMBXCLixHEBnrzSYLK2uhmrjyX9v/
	P+kDZBnpifTzkfOSiSVF3IeMhxHRYO7LSIcdn8N94XhQUAmHKGFlTQDz2Ul0waDn/rMq
	fjWuHS71CFxtO2Mi5uLpfaudAq7oRzah1JkSiZ9tZANB0p31jN9MtFIHxQW0PRDof/m1
	7KZheidtnaBfPD2ZLMyZ7ISiGIy/cO3To6vFTeYqGnmQMlTfheNiwvuWy3D+C57MfFLN
	dAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rhOtaY60puZulwffiwxpoIGq8S0doOottAKaz/XDSyU=;
	b=BROSRWLG6AS/U/EwowxiLdXvjI5gPAyhaVwmrzQ28gj+YXOU5OjnRhLpLGoQZMSZo9
	sVBVfXIo83AXTwQkFRqb+cV5nfCc0/8Y/4+oh8Ov+b/+xJwyFUXKXWp7UDuM3+iE6Acv
	0cjsxkS/IWYfQxykUNkAT5JbZuggIe/zDAsX0U6kdg0pJSSfnkwK8hbq4WCi/jve19N1
	/8ZJyjH4KfVd6nZdR4wLvewH6XVwpa+XyaUoWfYF5QrV209smH1ZBo36j9esafLrEkKz
	/9LCU6ta0QYJnXDKQVclCpMFd7U3uZdtSmKmvHHy4wRKy96YlgFbfjupEuvWNFKxURF6
	G9sA==
X-Gm-Message-State: AMCzsaUJpJE3dIRkeCXW+eTewHnI1t0A5s0nD00Gg+MWPOslE8F+jdq6
	o5tnrFrDxR+LceFvRtiEzN2TK0J6
X-Google-Smtp-Source: ABhQp+SW0gsHil+nB8KD3FfIc8Q/Gm9VckYTyruRYcLjoQ2RKi8ddywwuggecb7vU6aMoGpblE+Smw==
X-Received: by 10.223.141.129 with SMTP id o1mr10866362wrb.95.1509919702182;
	Sun, 05 Nov 2017 14:08:22 -0800 (PST)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id
	q124sm13845688wmg.18.2017.11.05.14.08.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 05 Nov 2017 14:08:21 -0800 (PST)
From: Paul Barker <pbarker@toganlabs.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Nov 2017 22:07:28 +0000
Message-Id: <1509919652-31388-5-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1509919652-31388-1-git-send-email-pbarker@toganlabs.com>
References: <1509919652-31388-1-git-send-email-pbarker@toganlabs.com>
Subject: [meta-oe][PATCH 4/8] dash: Update to v0.5.9.1
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
X-List-Received-Date: Sun, 05 Nov 2017 22:08:21 -0000

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 meta-oe/recipes-extended/dash/{dash_0.5.8.bb => dash_0.5.9.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/dash/{dash_0.5.8.bb => dash_0.5.9.1.bb} (86%)

diff --git a/meta-oe/recipes-extended/dash/dash_0.5.8.bb b/meta-oe/recipes-extended/dash/dash_0.5.9.1.bb
similarity index 86%
rename from meta-oe/recipes-extended/dash/dash_0.5.8.bb
rename to meta-oe/recipes-extended/dash/dash_0.5.9.1.bb
index 78ca60d..6dee66f 100644
--- a/meta-oe/recipes-extended/dash/dash_0.5.8.bb
+++ b/meta-oe/recipes-extended/dash/dash_0.5.9.1.bb
@@ -10,8 +10,8 @@ inherit autotools update-alternatives
 SRC_URI = "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.gz \
            file://0001-Fix-printf-format-errors-with-clang.patch \
            "
-SRC_URI[md5sum] = "5c152209680dab3c319e8923f6c51378"
-SRC_URI[sha256sum] = "c6db3a237747b02d20382a761397563d813b306c020ae28ce25a1c3915fac60f"
+SRC_URI[md5sum] = "6472702a8d9760d166ef8333dcb527a6"
+SRC_URI[sha256sum] = "5ecd5bea72a93ed10eb15a1be9951dd51b52e5da1d4a7ae020efd9826b49e659"
 
 EXTRA_OECONF += "--bindir=${base_bindir}"
 
-- 
2.7.4


