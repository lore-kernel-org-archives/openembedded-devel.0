Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA66C6FD19
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 08:10:49 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.8318.1678349441626082474
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 00:10:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WiJm1qM3;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id s11so3634252edy.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 00:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678349439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1I3KmHRJ06rCeVayiZcsVefKoBo2ft0INCx+YfRmIg=;
        b=WiJm1qM3zvKAhOrBhW48Q1Sm7ZVXV9+ny1ug96WKrp4tvsIzKiaMMaWd4zxoDttJRe
         nbdzYU1llavyIHSz9T2jO5BzQgXMAnkaMx7LH5DBDIzVNYYuW8WqhTl2liLsUvEG0XLi
         vPehrKdJJd9cDVgSO8EVMgpmyWNXhS7NVGsDEQXFo7mR/D5Dkq3+omuuFZ42Yz9wEiy3
         EjBtLWm/2QWpcUVRdm961IpE8j1K04lE6RfTHpYfP6aqGJ7iT3xJki9m3v/bbszawfeh
         V25wc4OOOpjVr5IJJkEhIMMq8EbZ2RGnbiw4RXpKCSm8D9pD5KLa7r2yZZYPc7DsvOuh
         eo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678349439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z1I3KmHRJ06rCeVayiZcsVefKoBo2ft0INCx+YfRmIg=;
        b=JFjpx2+tnyffYVfUwgvcW7hgPx7gUG6gkfWGU+UnAGm+EYhQXWDM+Gv5lzbPTUrU8Q
         WBENiQeklFxyuzV2Jk05TqF2TtiT0TiPIWx3F4kJhH7WeGwyw32jVTvm49jDoblaMhFe
         y8v/QGQX0SlD3N3mXo8+ioU7IhGI0c5LJjQjmUmJUxTbVXMAxIl5wVUp+xkO4X/jdjlU
         JPaI1fWBvJJ4TalKrLMvLTw5Q+oXHskk/5EIURP2/YdM0KA/Ptog3jHoh6Ui8bSdcpfA
         R1BNcM0iB9XA6gS79TDmX8W1zzE525y80N7eJ8ydOuY4JPpSEvIApSSTxcg40wuSRJaE
         rIJA==
X-Gm-Message-State: AO0yUKU5HJGLVuZ7E3mkjU/Ss3n86jdpi15eO+oF1bbxCBNpMarEDB+0
	aw/w29tjc8OWiNMBTuWyf3R5N1caPZIi5Q==
X-Google-Smtp-Source: AK7set/eLZQOsR+2+IT+DqFedB30EK95Pp4smv/rffi8MrCZHAomuosjos4sQHZgfgrO2IGb5nO+cw==
X-Received: by 2002:aa7:d397:0:b0:4a2:6573:5c35 with SMTP id x23-20020aa7d397000000b004a265735c35mr18787010edq.21.1678349439465;
        Thu, 09 Mar 2023 00:10:39 -0800 (PST)
Received: from localhost.lan (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id gw20-20020a170906f15400b008b7a9ff7dfdsm8435710ejb.162.2023.03.09.00.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 00:10:39 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 2/3] ocl-icd: Add PROVIDES and RPROVIDES for virtual/opencl-icd
Date: Thu,  9 Mar 2023 09:10:35 +0100
Message-Id: <20230309081036.3179583-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309081036.3179583-1-zboszor@gmail.com>
References: <20230309081036.3179583-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 08:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101436

Some programs dlopen libOpenCL.so.1, they use RDEPENDS.
This will allow selecting between ocl-icd and opencl-icd-loader.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-core/opencl/ocl-icd_2.3.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/opencl/ocl-icd_2.3.1.bb b/meta-oe/recipes-core/opencl/ocl-icd_2.3.1.bb
index 250cb6883..b1980e368 100644
--- a/meta-oe/recipes-core/opencl/ocl-icd_2.3.1.bb
+++ b/meta-oe/recipes-core/opencl/ocl-icd_2.3.1.bb
@@ -14,5 +14,7 @@ S = "${WORKDIR}/git"
 inherit autotools
 
 DEPENDS = "ruby-native"
+PROVIDES = "virtual/opencl-icd"
+RPROVIDES:${PN} = "virtual/opencl-icd"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


