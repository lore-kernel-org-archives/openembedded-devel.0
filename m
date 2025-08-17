Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB10CA0EE9
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 17:41:12 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.57334.1755452463745501428
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Aug 2025 10:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KKS9QbWm;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b9e413a219so2907177f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Aug 2025 10:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755452462; x=1756057262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkFohBC+r8WvoZohudk+GcYD1+/9dJa8X04z3MWumxQ=;
        b=KKS9QbWmUZR8+F8BOh1Z6yL+9jkRfMgz1BbfDCuE6F1QM+SN39I5hD5QQstNz55NSZ
         OhB8MEkq4XRx1RDaLB2YH3H5QhRYKVTjk9isVfR0nb10FSH3DEgqEYtTL+b18l2//j9k
         LKbKKHw4AnorJSPhN/qNiYlfi9mQtwufHIHOCuR5pZ1wfDHFX9jRx57Vu0l5s5sfdpwp
         ykNVrifo0IYaL6B8gngGvD5L61vze6N51uav2rVoonUuXwUHcirr04nw1E7PLYkd8UOu
         eBKibo0Egw7pOYkEmhWp5EgTE8kWC7AsLWfe9FtDHUX2+X6OdtxREdDeEQp5+c8h+u8N
         w3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755452462; x=1756057262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nkFohBC+r8WvoZohudk+GcYD1+/9dJa8X04z3MWumxQ=;
        b=rwBqdDY0wz9PzBCmIA3tZTOeA41TTh6UAKVEj7sVOcGm7lp1u3dJLonpikBrdwoeVj
         dUMMRUonw+1usADrbx+wyaZk7sxoMfe2V86Z/IrdLqdil0JjhgzDhoW3AIzEzWO9icQy
         vM270NDyDPzroe2F4vjIwx+s34dDd+QlLgi4a8SrdL8dmYa50Ym2Lxr8GHWTFFRl1rC7
         8jHmpUqOsIkw/EMT74iAhLXD4gbrNOYUaXQQIkYkeUwRuR8owTcqWfKGSnMRVXiwNyPU
         XCgUmenvwy1b7VUcooeid3J5uY2b3gL32M4Gd+DFn///azm/HsRyRXslZ7FFqEg72BEJ
         2ClA==
X-Gm-Message-State: AOJu0Yz3Bax/c1EIHb9hVelf+9ng17InpzYb1/0iL1/8rH4aGAYbrTGY
	hRNtszMwLSa3Tux2S3cZrycG4AgNFeIq3cyZyIOpzqM0Bo2EmHsZK27O3DRkog==
X-Gm-Gg: ASbGncvO+GLm7W3vru/aQIVXAcOF4qA8vo8ZWuAg79mbcOcDUh9bpkE9rXYx1QV9xtZ
	mt6J1U6pCSeJRnjgPDU/nFAiFsev1gXqDAr1TDT8Jc3bWf0ss5kW81wgbgeMLHlbi62RQcatGkt
	NcNhciSf+G0PQZwFkHoqcRGmXoRkRim1VDYrLsQFHble7xB8hZuFQbBWGPcSm+wtMPFmmMKqXDf
	EXYivQrXXY6cAZEKHJY9dUyc9B+OtmvtIhBP8oJ6DsUMYIxUxAu7jBmuuAHjEPGiYMMJeTV1W+B
	Wbg4uizI03HempAx5dXs0teW4mS512DI3gfdvSRWHEqNpZ7EfJRdaBBrX3qruhi1bT0VLnKv5z0
	NCD7FJnhJXNOHKkv1lZmDzyp5OI1AZP9GqxDE599zrBTbt+2KHxvi4QDC746vAOKEoZcUrucgG+
	lbvq54SWCCIEcRJ6a7MT1ox4NsDYn4
X-Google-Smtp-Source: AGHT+IHvrzwkXIgsQhPHLiFpAgzPH/mVZnoVhMsXZD5GPPmTZJUUXihYieJNgYMiYEonhRPe9437DQ==
X-Received: by 2002:a05:6000:2483:b0:3b8:d2d1:5bfc with SMTP id ffacd0b85a97d-3bb68cfadf8mr6695618f8f.37.1755452461883;
        Sun, 17 Aug 2025 10:41:01 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxril34oe3x6dm.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:5cba:763c:2ed2:f98a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a2232de40sm97345715e9.26.2025.08.17.10.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 10:41:01 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-exhale: fixed location + added nativesdk
Date: Sun, 17 Aug 2025 19:40:52 +0200
Message-Id: <20250817174052.51506-2-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250817174052.51506-1-jan.vermaete@gmail.com>
References: <20250817174052.51506-1-jan.vermaete@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Aug 2025 17:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118985

    * moved the recipe from  meta-python/recipes/devtool to meta-python/recipes-devtools/python3-exhale
      What seems to be a more common location
    * added nativesdk to BBCLASSEXTEND

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../python3-exhale}/python3-exhale_0.3.7.bb                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/{recipes/devtool => recipes-devtools/python3-exhale}/python3-exhale_0.3.7.bb (95%)

diff --git a/meta-python/recipes/devtool/python3-exhale_0.3.7.bb b/meta-python/recipes-devtools/python3-exhale/python3-exhale_0.3.7.bb
similarity index 95%
rename from meta-python/recipes/devtool/python3-exhale_0.3.7.bb
rename to meta-python/recipes-devtools/python3-exhale/python3-exhale_0.3.7.bb
index 0e80df9cc1..e0e30763d4 100644
--- a/meta-python/recipes/devtool/python3-exhale_0.3.7.bb
+++ b/meta-python/recipes-devtools/python3-exhale/python3-exhale_0.3.7.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} = "\
     python3-beautifulsoup4 \
     "
 
-BBCLASSEXTEND =+ "native"
+BBCLASSEXTEND =+ "native nativesdk"
-- 
2.39.5


