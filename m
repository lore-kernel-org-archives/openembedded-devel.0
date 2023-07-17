Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A2D6C001DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 15:20:47 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.11122.1689607240300652172
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 08:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=OJWaGKmi;
 spf=pass (domain: baylibre.com, ip: 209.85.222.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-765a1690003so379488485a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Jul 2023 08:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689607239; x=1690212039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=InGO4FvcUK3eJZkKzXw8ykiEnLRQieIhBo6q+rtyGeI=;
        b=OJWaGKmidAuSO9veOjocx/9igKUvM+g0aryLpvMlSOqYttWNJPABqMU7wZB8LKawNi
         qLjfUSlMPsOLNnsvJNm0naueP93haBb0oxa+KE5wDwgUT11q/YmLkfFuGaJUWUoxmWx2
         aGSgNwRt/U+5FVtXA7Y6npo6N4d3H9m4kO3fTp9VTKkC3Hn5S+nBMPBCAA6hxQ8NegbY
         pe8/zpcr8VctaBKHW2JtOTtZGCA2DwcIfq7wHS4DzCYobQ0eyilA2b7F4qz7WcvJEY8O
         IKQT4M2AA3VTZV2GD03dCoNhoLeXaeJgkKRVZS6CJ8TlSIxSmiRSHm11PwAm7x3NDh1y
         0sag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689607239; x=1690212039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=InGO4FvcUK3eJZkKzXw8ykiEnLRQieIhBo6q+rtyGeI=;
        b=S1gN3B3o6QznH5K0J0CxM/neeZrHSZhsKFDcBOo2oygt81ZcbMjYOGNV5YbAQ1TwYR
         QQKff+qTUeVQvure+LZRTNXQjLdoN/WxqcR6RjaVQODr3wwiJQ61ptWPB8IL+8Z/j2jh
         sngOC/8fb2jjFT2CJ6U96c5YvYg14L/PNhRFZSPLSdiJ9QL6fNWizQ2ArGg88jF9M87b
         DBVQBAE7EoK3Xc5Ix00b3WXOS3+p+7vx6XDCC5kpKr1+t0puAZAOB16aQLMgScUACfwq
         7oKvMLnF3bjvA3m4ub6U+09XGEdsBNg0Fsm1zRZAPXSqEeZVZYV/i9KAtK26KUbEcvzt
         qwDg==
X-Gm-Message-State: ABy/qLbcPAsd4b84sOpiFhJ1PubwdQ8dSC83wbP9lO4gSwjKSf9HVcuI
	sThEw+gu+R31TuuQVEIskYPr0cOYk0kBkuiGmt0=
X-Google-Smtp-Source: APBJJlEhzJjjvQltRJkAlS+ktVPs0P/tC7D4HpBaKErlRBEdNoNi6jDSJDV+vZCPD8Hn/rRcfCxpdA==
X-Received: by 2002:a05:620a:44cb:b0:75d:5445:6afe with SMTP id y11-20020a05620a44cb00b0075d54456afemr16170818qkp.58.1689607239278;
        Mon, 17 Jul 2023 08:20:39 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id i8-20020a05620a144800b00767d2870e39sm6144226qkl.41.2023.07.17.08.20.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 08:20:38 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 9/9] python3-bitarray: upgrade 2.7.3 -> 2.7.6
Date: Mon, 17 Jul 2023 11:20:32 -0400
Message-ID: <20230717152032.3161667-9-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230717152032.3161667-1-tgamblin@baylibre.com>
References: <20230717152032.3161667-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jul 2023 15:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103886

Changelog: https://github.com/ilanschnell/bitarray/blob/master/CHANGE_LOG

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-bitarray_2.7.3.bb => python3-bitarray_2.7.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.7.3.bb => python3-bitarray_2.7.6.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.7.3.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.7.6.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.7.3.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.7.6.bb
index f766692a0f..b27480057a 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.7.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "f71256a32609b036adad932e1228b66a6b4e2cae6be397e588ddc0babd9a78b9"
+SRC_URI[sha256sum] = "3807f9323c308bc3f9b58cbe5d04dc28f34ac32d852999334da96b42f64b5356"
 
 inherit setuptools3 pypi
 
-- 
2.41.0


