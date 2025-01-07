Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45534E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 13:17:38 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.19937.1736255856045095480
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 05:17:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=adpsYgYX;
 spf=pass (domain: mvista.com, ip: 209.85.214.176, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-216395e151bso165353235ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 05:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1736255855; x=1736860655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7rirCmQQ91LZLeWPdJIAd1RaTB4/Dy8DDT6Sgr0zZ3U=;
        b=adpsYgYXVrlvfqEYy3/0OlqYZ4qy7KfASt55Nxm0NaucJWIKkeyue0vV801F7HqLn2
         omEvzBxoOzrswNiSSNJ7mhVYE13DQhQTtMNsW4byT37VOT7DD4ViH1JVFxm3P8v69R1r
         Rn4kpoEsSY8h+uEigwcF7NAebgvTVUsU6s6S4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736255855; x=1736860655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7rirCmQQ91LZLeWPdJIAd1RaTB4/Dy8DDT6Sgr0zZ3U=;
        b=Wi8s4eXwmmc+fCij3MDA/EhnIbdQZLMAF1nyRct2hE3KkUq3znZwaGH97VqvWs9hm7
         Z5K8h3Sqs9kXWRHFtQsdGle41LeuG9BTkUz01oHr4CFtE22JdjaLE4ShTcEZGkP9r1Qf
         FRv04Ag24fZuNMH4Kata6ufDkzxp0UJQVOnWw6hgUNgIPtkL+uq8TuAPFSaRf0BoIDkU
         /1ANJuo0XrNY/dgH/JdhoFKoBUOnzNxR8TABretuqfRFYSvIx7pix/KCcoWreLApgCyU
         NJ6sz0wGt8stBdd/3Q6RxOFuo8mxDctQFRk4VUx2LUdpAF8y9hRJQjlahsr3C2M2Cek6
         btRg==
X-Gm-Message-State: AOJu0YxHBYWd5WCX/cAMu28RUXePBwoj/Yer2j/a157egVadWHeWvT3q
	udeKa8wA7UWvfj/uXax//GnfGW6rJSfwyPbrc6QOnQZLKxqBVNMAondUf5RCsAaHBPqPB30Cu3x
	0/Jo=
X-Gm-Gg: ASbGncsvJOm+YkKhzFMY9o7SFVf80gd7fv5OJKP4sZd+JXxy2oBE5PzhefvFJN24ynd
	BfTyLnibspsoeuwAC0ksYvz4CfKaEjERayyKvBqj6iB/xJT6FttXE1FVRlg5sTYjUo0L54/ySpL
	MIpg0tnHWa3S+rZJt2ulNiEddKPLZ+SELecuPsnA37O8aNMVyiewfxkoXC+1FIXiUnMRSifK9Vb
	Bop6Mm4Hk7VS6Xvspj5RiGtfmRKNy7JlXgF1BSsyi4mdhsEvf4iGpb5hitl81TijrwtAJSW
X-Google-Smtp-Source: AGHT+IGv4qVoUNu4U4LhGYAX7QEsfA1+nHUM0DOhmRO6f9PPP0haWqyGICuahnUgHiZtmp3lROcK+Q==
X-Received: by 2002:a17:903:1248:b0:216:5db1:5dc1 with SMTP id d9443c01a7336-21a7a201275mr42946445ad.1.1736255855078;
        Tue, 07 Jan 2025 05:17:35 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:882e:e918:6f2c:302b:4ca0:14ca])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f6156sm299698115ad.209.2025.01.07.05.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:17:34 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][scarthgap][PATCH RESEND] php: upgrade 8.2.24 -> 8.2.26
Date: Tue,  7 Jan 2025 18:47:23 +0530
Message-Id: <20250107131723.5666-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 13:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114700

From: Vijay Anusuri <vanusuri@mvista.com>

Includes fix for CVE-2024-8929, CVE-2024-11236, CVE-2024-11234 and CVE-2024-11233

Changelog:
https://www.php.net/ChangeLog-8.php#8.2.26

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta-oe/recipes-devtools/php/{php_8.2.24.bb => php_8.2.26.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.2.24.bb => php_8.2.26.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.24.bb b/meta-oe/recipes-devtools/php/php_8.2.26.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.2.24.bb
rename to meta-oe/recipes-devtools/php/php_8.2.26.bb
index 034f3bef1..10ef2c36e 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.24.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.26.bb
@@ -34,7 +34,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "4cc76ec644eee97d17c92bfe8d0e84714fedf299a538b7dfadc0639dd0dc432f"
+SRC_URI[sha256sum] = "be57c347d451c905bcb4336832a864d9928dd0e20989b872705fea0ba6476c6b"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.25.1


