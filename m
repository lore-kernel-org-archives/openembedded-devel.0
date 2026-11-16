Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22787.1794814537971318626
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 23:35:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=f3+r92sy;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so38681465e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 23:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794814536; x=1795419336; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WvKgK6BQ2L1Dr1jfPyiJpV2/oOH6OTsWt8hhp8ssWq0=;
        b=f3+r92syb8j8++eEuik9DQHuRWT90ONQML8Var5q0PiYmuHQfaBn10g/U2p6YDc+0r
         hs0VsRv6JdTC4aX3a9t/XdapnklgNXAtTr56yXYG1gpSJ5gI7KELtGXrAdQMbwhCN3gs
         LWY3pLW1vfVvoELiSJMFfRxCB+l9CoUUw0VjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814536; x=1795419336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WvKgK6BQ2L1Dr1jfPyiJpV2/oOH6OTsWt8hhp8ssWq0=;
        b=a6aE2+syBaj75EN41qAZzqHBcGtrvB/fJsu/gL5R8Kjr2kM2IPjXlYTr5VwhHekmuy
         iHSsY5IrlRFi3xOlwCiws3YUj3h2OJJ1GnsI3qUWfCMKnmAGh0E1H9V2e8BdX053MiLj
         zc6B1zvxAakDDt/cw/CMymXwG5cWZKxCH9YigJIXbUFbLRBoSJNdZMmzu1whj4mfJ4g7
         zbUewt+i1jv7bNesjKvG6PXp0FHnUpa9MsRUdc2fLSTYCROZ1YnYquklGcO1Dv3mPZQ/
         PsHnPeRVzW9quIn4ZMJU4aGCcz1obw/9eBnbhcpKSLhhOCFXaJzVZECXvDFpgm9jKS33
         nlKw==
X-Gm-Message-State: APuU4Z/Xs2f+P4r23MSj2mTdufgeZmOI7/dFmcYZefdxgZ7pg9wEpbBm
	rNrroJkeOUrPDegLBZB6iaM/Qeea3qx0Lxqt8iJkuhUpR1aGK0sKKkdducE3ML8hmbFrpvWsSVa
	wz+on
X-Gm-Gg: AYBFou3f4SCGhsEtS6bsNbBBsDwfNOPNI3E+QPPmX7vyHBYiS/DvxzkEmiF3afzQeq+
	DLeok2yZWRAVaFWsopGJG+FZwqToiysH3TrnY1/EOrPgaGloJzcdZUfxhj1RIN2/uYOz/kmhAVm
	hVJ5f0RTDpd+TK42ZekQnCJCUvPCDTMnZxMy0p3sC4FxfK9VmU4TqeIJAkfLeWxnfS9rfcB4CZB
	QX9nFmh3ylFaye4AB6fD96CDqPxe79Mf609f9XxOBcAEXvAt4+0f46JY2RXSO6PXasFDp5y47S6
	3FAIxi6FHcjPqLbpQV1f8S7zIY5SNPHC9EsxoQk9fmlwgel4cxQrO0k7amJq5QT0YhPV9G4Lg+t
	njR4Djk2eF/vO3JQWHqJ9eFxm1BdsXNTwHMtXrjxL/Cw/YZGbMetZKKR+f5HEVreIphLk+xsDes
	Ea/KyFx0HIFmhqSSbwdl1a4Ua0lrwD8U+j7sdX/C0OoR91VAYdfKzK5U1qSWc8xMW6pUXO04yJi
	3eUqzEJmBelOoYocxdXrudoCrw6IyoZr5igcwJpXV0BvvL/7uBMXU+B/yJ4IWo3471iwXXKJxGO
	TFBPluzZ0RycHXhp+97o2H3ZXlBW5oJ8uRcCak/sfLR1ERJtYCveeCJUlr7//AqRWMLQnIfwL+/
	URIgP4htOo5QFuhBLrJNNYLllr3xvwjz0V16KtEQu4LyXme8klQeHgQ==
X-Received: by 2002:a05:600c:6308:b0:4b7:6942:39bf with SMTP id 5b1f17b1804b1-4bb55a68492mr219661735e9.28.1794814536271;
        Sun, 15 Nov 2026 23:35:36 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm289781975e9.10.2026.11.15.23.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:35:35 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/24] python3-gmqtt: Upgrade 0.8.0 -> 0.10.0
Date: Mon, 16 Nov 2026 09:35:10 +0200
Message-ID: <20261116073532.880420-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116073532.880420-1-leon.anavi@konsulko.com>
References: <20261116073532.880420-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 07:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132431
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.10.0:

- fixed server_keep_alive
- Try to use github actions
- Fix github actions badge
- Added the ability to pass your logger
- Properly handle already encoded topics

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-gmqtt_0.8.0.bb => python3-gmqtt_0.10.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gmqtt_0.8.0.bb => python3-gmqtt_0.10.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.8.0.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.10.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-gmqtt_0.8.0.bb
rename to meta-python/recipes-devtools/python/python3-gmqtt_0.10.0.bb
index cdba352322..45d8717ccc 100644
--- a/meta-python/recipes-devtools/python/python3-gmqtt_0.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.10.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/wialon/gmqtt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=903f1792621a3b35ee546da75d139177"
 
-SRC_URI[sha256sum] = "61fb7641109f57ca29f73d2d8f2cb487de49d76338ef8c68228db961b6e9696a"
+SRC_URI[sha256sum] = "d8df2ab2ee9a359b771341a312ca6fa8d69c3c54c2ec4593eda6b388f1b9cc5b"
 
 inherit pypi setuptools3
 
-- 
2.47.3

