Return-Path: <arthur.oliveira@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70204C41535
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 12:33:30 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.5951.1698842006228655240
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Nov 2023 05:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20230601.gappssmtp.com header.s=20230601 header.b=VPrRRypV;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.169, mailfrom: arthur.oliveira@ossystems.com.br)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-778925998cbso462506685a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 05:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20230601.gappssmtp.com; s=20230601; t=1698842005; x=1699446805; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uiweSif1voSgbnlABYPVbzMk9k/bEjV2yYH85SjPYc=;
        b=VPrRRypViDvoUkWkeIHURpxxF3GeqdgndPm3Dz9bpkzEaSoBTBZlmBszUVHyRA1jSk
         Uqd3VAZMSiDn5AhhaUs48ELlxk6r4vSQf41DxV8gOAGEUbNUyTD+po7dIsCRmCHHun/n
         /4zD/iMZcgbQW5SMYc0mL3/qQ1IrUVyKiiN5ICyeY4aRMYeBNvrWcbF5w9ZgEypbZjW6
         q9JrwkHI42k5Fy5v2JiV0IOkt14+fikSLyKlKNeCcmyu343YBh3fX0pI+EZfXulWfUP2
         s1LO7eJtzTfa8MTKdYBSPx4sIfNHaGccPE7X2LZLpl+yKSyFsj7dkoKBtJGMkR/AvLEg
         mgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698842005; x=1699446805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uiweSif1voSgbnlABYPVbzMk9k/bEjV2yYH85SjPYc=;
        b=s47b0ZuKt+sXTFXZf+xOhc6gw2iSD2Wx/h30PceOOhHAHFWaYkvvju4y1Aq+V55Tm4
         YZeSnB1R1os99ohtyvOLQ3gD/SRysVNSdkBTSOIrZMvA02sSku567aIm8rjJ320cVR59
         Neungeqbt8yZGd3oRey+OXlCQEkoM7h1Ohc51UULQih/coa7aahxx2i8K8b0XBP4Of6+
         IeG7JBWLYai2KZRqtj7630rE35qUIDc044BmzDoiIYTcCeSAmDwQrWoWvH7Fx0HY0xtW
         C9LIkne2ylZEhbT+uh6dXbiiD5Rbj4G4eVlPPe852wdAUI4uImxOMdghefKGcqsTe4wr
         Kmow==
X-Gm-Message-State: AOJu0Yxgztgsna3JBjau+myVNoidc8ip4jcjyjL+kXGl23b+Xijmek/g
	5+yre/lvIxmSvpEsjvQpCU6C2pxvTPY6NN/QmOabog==
X-Google-Smtp-Source: AGHT+IGTzpBMJD5f5mFMtEuUIgzx8gu/857yeCT/+NOqJxWneoalwFvMFrMJ3dLfGgd12SABsrOerg==
X-Received: by 2002:ad4:5c8d:0:b0:66d:1f11:8b85 with SMTP id o13-20020ad45c8d000000b0066d1f118b85mr24304817qvh.13.1698842004916;
        Wed, 01 Nov 2023 05:33:24 -0700 (PDT)
Received: from hyper.lab.ossystems (189-11-177-132.user3p.brasiltelecom.net.br. [189.11.177.132])
        by smtp.gmail.com with ESMTPSA id i5-20020ad44ba5000000b0065b22afe53csm1422601qvw.94.2023.11.01.05.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 05:33:24 -0700 (PDT)
From: arthur.oliveira@ossystems.com.br
To: openembedded-devel@lists.openembedded.org
Cc: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
Subject: [meta-python][PATCH 2/3] python3-objectpath: Add ObjectPath Python Recipe
Date: Wed,  1 Nov 2023 09:33:16 -0300
Message-Id: <20231101123317.1806460-3-arthur.oliveira@ossystems.com.br>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231101123317.1806460-1-arthur.oliveira@ossystems.com.br>
References: <20231101123317.1806460-1-arthur.oliveira@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 12:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105817

From: Arthur Oliveira <arthur.oliveira@ossystems.com.br>

This commit includes the python3-objectpath recipe, which introduces the agile
NoSQL query language for semi-structured data. It is licensed under MIT.

Signed-off-by: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
---
 .../recipes-devtools/python/python3-objectpath_0.6.1.bb  | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-objectpath_0.6.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-objectpath_0.6.1.bb b/meta-python/recipes-devtools/python/python3-objectpath_0.6.1.bb
new file mode 100644
index 000000000..6e82dc13b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-objectpath_0.6.1.bb
@@ -0,0 +1,9 @@
+DESCRIPTION = "The agile NoSQL query language for semi-structured data"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=a53cbc7cb75660694e138ba973c148df"
+
+DEPENDS += "dtc-native"
+
+SRC_URI[sha256sum] = "461263136c79292e42431fbb85cdcaac4c6a256f6b1aa5b3ae9316e4965ad819"
+
+inherit pypi setuptools3
-- 
2.39.2


