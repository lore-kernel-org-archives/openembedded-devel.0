Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3828.1794729043872402931
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=I1tW2Muw;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1430307eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729043; x=1795333843; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pewtYD+OGxS5vHWwbgkotON+CgR+5GwAiCWqTMCu4k4=;
        b=I1tW2MuwjMpinY3ieBVHzfwMy6ouBq87BRXCB9GjRjwJMZAsm2lE5Wo43uRcnmZ4sp
         IJfLm3dS5e48tOCk/FHUpNPZcWLmJVKqoxs/bYemOJ2tC7VN76AA/KR0MlkqZYHa9Rk9
         06qu7RIg/WXMZQGAVyJpcVVuw8V18CaQNKZbvxO+gfMWH48wZ7WsEri+l5lUfJ8CmPjG
         /2RwI/iofYNs+SquBcc2djyx1WvHhG4noWMtHdZIk7XZTQXiDUZBIr8xp5uusvPyw3d2
         mTC+6zsoOH2ulgirpE/hOTs5DgP0OetibhdwqJJkINR7mkNbyi2x3VQWeP4lpeMUm5XD
         oIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729043; x=1795333843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pewtYD+OGxS5vHWwbgkotON+CgR+5GwAiCWqTMCu4k4=;
        b=VLIgzanDRcQrIE3d7hOpU4yjgb/ifI47bRi1OWVYXHluoVdcaFM+vQjE/2l0wwBfY5
         zH+dgdxS/CwDy3OP9q//gf7NnNjDxOez2iqafp2TOvECdo7dfMcQ0601qZ9KkebzL6rX
         0rz06hTlb6hiCK9e76eVzwJJIDPABB9K1R6v/KI51pRwLDvQ+EkJT1xbNDoYFZN6b9fP
         C2H84z+OpNhQQwHw+EZy1b+7U+qmgsUUEWh2Er64TnRcTFugICqrFAggwdERVlUeJpSD
         Y1tagb/Mdg6HDqsOJDIgh2SC4bQ0fnccIecYJh34CFf1DHPryqmveD1UMYWjF+JtnDu6
         vOAg==
X-Gm-Message-State: APuU4Z/+PiM4FbNXxDNKAqIWn1VJKRTCFHecQImSk50pLTdTEjbHN4jD
	jIlaoGQ0YCogELLE/JZCwpWuZEh3lm6seMOACJhFizh0QmTdh+MiggX7rPhh++p3
X-Gm-Gg: AYBFou1C1RbBWnee2TAXBsaX6VpLQKeOxy8ElTpo88nKgF/QARqG/WktLySr52fUouc
	iG4/VtJXXIZ4rS9uyZzWDJj8hKeYjAPhHANxWrg/ynBIgJwDlxVXnFo8wx3Av4hA5UhAvtn0jky
	Jdqc/Vmf4xF/LaGgDZeokIPSl8F8+F3uvmZ1djGGmG4hghqVcuYOvsmX+61VKQzLM4G64/ZaZt5
	QZ2K1wRBPH3GC16MqI470CnOeZBcxqwY4W4cLZG1cErF94j4Fdv+cez4D6rvBHMSozC3lM5SY4y
	6tO0MLO7H2JvZ0PLkYwrMyKcoHmcwCucfmeixNTxSScRxX7emcnwy9NHKPhsWDMNFcXJS+v8gG1
	QNyXf+ZvkbpiJcdNejH5AXY58rZeaNCSkMF/0FefiXFOHhImSydph0oNnrxaYZwsIJ0T5mYkidr
	5XHPGDyMywAIgHbulQLV6JBKmWJBl9hRvRAjmcFMIwZc4apubrp+pH7UwX/whetrpH9w93wGudk
	2pyjp6bcHILyETe3TlQBSbdTu1vXqNPQQN9/OZVRIrtbTIBagLUQAa7qSc7HrO/Qpu1rzlcNboi
	LrPAO4TyjgJot8sGnpxDbK2wEAfz8LesTzTRSCKgUIFcJIzfsBKnrR4p711tDvutxay7ozC6BjA
	3bVMyFA6UjTNu/prYrxQCanObBjoufTqhNKDeIHwB9wID3Y88HoXTtkMbi9CjMZm7+0eFTGbNjV
	aQAkAGFWzlnQsDOEbCMSI2ENnTAr4/IrBCa/UnCSbZTGDosphPC77K/EwQ0r3rnR0rCNKbKXRm6
	gDrTeSbLkzbjF49kfiEFO+pYfKxww26BRIKyq93cA5xXqAXEzubFY+7VonsW3UjoMV2cM3AjFJS
	XeKd
X-Received: by 2002:a05:7300:8b:b0:377:5cb:a534 with SMTP id 5a478bee46e88-37965da9681mr7734752eec.17.1794729043146;
        Sat, 14 Nov 2026 23:50:43 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 52/96] fluentbit: upgrade 5.1.5 -> 5.2.0
Date: Sat, 14 Nov 2026 23:48:30 -0800
Message-ID: <20261115074918.2932593-52-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132322
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../fluentbit/{fluentbit_5.1.5.bb => fluentbit_5.2.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/fluentbit/{fluentbit_5.1.5.bb => fluentbit_5.2.0.bb} (99%)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_5.1.5.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_5.2.0.bb
similarity index 99%
rename from meta-oe/recipes-extended/fluentbit/fluentbit_5.1.5.bb
rename to meta-oe/recipes-extended/fluentbit/fluentbit_5.2.0.bb
index 5b71003bbe..3b3ca5e25f 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_5.1.5.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_5.2.0.bb
@@ -17,7 +17,7 @@ DEPENDS = "\
 "
 DEPENDS:append:libc-musl = " fts"
 
-SRCREV = "0039c4f0d1b530bedd8448df2fa4c301d58a5b91"
+SRCREV = "e0149076aeff009d35fd495e55379cb78f1eb53f"
 SRC_URI = "\
     git://github.com/fluent/fluent-bit.git;branch=master;protocol=https;tag=v${PV} \
     file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch \
