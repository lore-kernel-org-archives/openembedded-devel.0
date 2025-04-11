Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F45BC369B0
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 00:42:17 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.14151.1744332136136783987
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 17:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g2r0JXwW;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-736c1cf75e4so1038346b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 17:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744332135; x=1744936935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ld930SNzNf17J+Uf+0VFT5lOwoiRA+9qTpYXctMg/XY=;
        b=g2r0JXwWJu6ZgyOCszSrDwtXsTjYgjj07hVifKRO06URsRe25fhCfYMGxcbAsLEXed
         MnH5CkoRK+xfTWARRjU89ZgZNoAetFtYaM1exkitS4dKJYGe28m3dB8qwdTGWAp1BBN+
         0ysOhPWRmpKJGZtjsIkj8htrIMK4KYMNZ2IEgPmWCkucWv8lUekNpZkgXeFwnjL7Ubpi
         LvrBO0UMP2OJI0is70oR1Mm9oaUNjyGN7QSGPww1VI2jQ/Eo7Bc4Ui4W3dF9hw1O3pSG
         Q4TPssQgzovSdH/jbCCqvYyTU1zq3TRFbxVik684nip9CqJ/VoKSGL/8wSxXc+W0ESZr
         HH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744332135; x=1744936935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ld930SNzNf17J+Uf+0VFT5lOwoiRA+9qTpYXctMg/XY=;
        b=iD20NOToi4Ob2uUAtk7kfhxIdUikrOGPkpV76s/MOnt9YrmW/3/NCYMSvADAp5qhBL
         1p/toMglVjPyjHaDbpt/KC/Yw9HrhBqZShlwq2Ij3mU8n92sNoz/ObuHFujOAitnBU1z
         cQn8Qw+Ko9rZzO6Dhe6M4aaLUxEgXHjE1I/WdTT2JYgQJA3XCDz/eYvqh5xyxkMrGdXS
         kqT0lFYAHkdyikacMD6UsLKp4trhUhurKzg6PzBJcX6/WZY0muRks2j5PlUxLctbkXsJ
         BmniDs3RYcgkOixOgiID5omIGxCJ4mu/ud1abRnAgzlkXhjUs6Or5ZExRzRlHP7tK2Cq
         Dfzg==
X-Gm-Message-State: AOJu0YzxB529fGYHqAvskmtg7vO5TFyZzhSfK4H7/MdY+kWN/lia3OJC
	DJx0VLE45dGI+qo86lU7ZBU+UWmxp2b0Lsh0FQ8ktfNDO+6SxGBwzwtiCJZx
X-Gm-Gg: ASbGncsgfGFkhc44aBjgWttwNbzgyhVukk+oUZ2zAQ2SUIoEUGsjrS68qSbNrV8Tyje
	vyb8Unmy/o5oAQrgTQFsr4mpn84Fbi3CaCifITKEBZ7n1TP8GIkfUngU1n1T9Z41x79vNpgTsMO
	n7Z30FSpwwUWvUg2AkwFGk2UWjBWLiEj3ObCkJNpv1XwGtNqcN477AJ2MyMyXQLPDk1kQhFpjbw
	4Igo37+cYkRZlrnrnknlTIO+AB7nloEirNVPp7LcBg56qFC0iWFWUWPYcNU8u6X3cqE7mDiiSIW
	5tuctRt1nxbA3k/rcTFdTNTDi6IRmRMP
X-Google-Smtp-Source: AGHT+IE1MeD31wHHNc/qaiFhaqZJZ0OUmMhHnMu4XR5PZVJWPOUvkVbF6ikDx4590fQ2eHOIgi1uKQ==
X-Received: by 2002:a05:6a00:3901:b0:736:4d44:8b77 with SMTP id d2e1a72fcca58-73bd11e210emr1392794b3a.8.1744332135178;
        Thu, 10 Apr 2025 17:42:15 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c6464sm226987b3a.64.2025.04.10.17.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:42:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 10/12] python3-uinput: Switch to PEP-517 build backend
Date: Thu, 10 Apr 2025 17:41:59 -0700
Message-ID: <20250411004201.3826913-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411004201.3826913-1-raj.khem@gmail.com>
References: <20250411004201.3826913-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 00:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116784

Add ptests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 1 +
 meta-python/recipes-devtools/python/python3-uinput_1.0.1.bb | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 99e0bfe115..caeb1ae6a3 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -92,6 +92,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-typeguard \
     python3-typing-inspection \
     python3-tzdata \
+    python3-uinput \
     python3-ujson \
     python3-u-msgpack-python \
     python3-unidiff \
diff --git a/meta-python/recipes-devtools/python/python3-uinput_1.0.1.bb b/meta-python/recipes-devtools/python/python3-uinput_1.0.1.bb
index 7c1eb85264..164a6e902a 100644
--- a/meta-python/recipes-devtools/python/python3-uinput_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-uinput_1.0.1.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "853697344b64df5537d4ae32ba6fbcf0515d51a9010910f5d501995903
 
 PYPI_PACKAGE = "python-uinput"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 DEPENDS += "udev"
 RDEPENDS:${PN} += " \

