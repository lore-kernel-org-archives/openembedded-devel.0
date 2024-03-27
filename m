Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8878C54E67
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 08:03:34 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.32270.1711526613860031851
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Mar 2024 01:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Vax5wweH;
 spf=pass (domain: konsulko.com, ip: 209.85.208.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56b0af675deso7913571a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 01:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1711526612; x=1712131412; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1xom9ltYr2oZc1fzxDtY/k73JtqdKBcSp4Kbhd2LAiQ=;
        b=Vax5wweHnYee37fWUqmhS2e/lCSk7Rc8yehO/1BaDwVUppEFyD72x29Hm6V/rF5oZ+
         wZlbQDKqvhIp1zGijPMUBcR3kbXqKJcw4MIPDB3R/xcPR6lnZcfSwBPYP/E920/9SorZ
         tfElroOBxmDcIkHHN5CqRf6KeMPeRM4Zkulks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711526612; x=1712131412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1xom9ltYr2oZc1fzxDtY/k73JtqdKBcSp4Kbhd2LAiQ=;
        b=XObVvk9RqaYwXZfMlMT9wektRqDFYw2K8kGirGCYhvBxCpkW1nc0BVgsBAVfeuyEeM
         fOTvJZ93hK9EJhVvqYHTgNB1GvHwC+7mgiWtaERhbNSj2W4J2bpEuPY619DJ+WB9C8kC
         rEVZWBiAIws6JFWjjXwHJuXljx1l7Jn+5PzQbNLrlM4a4AbNVNVULxYGXOGOyPulxK44
         4kl1MOXxSpFG3HrFqJfaxgsnPhCi4BQIye4EDmBLIz7fv5TWz/nvyDxRX9HcO3S83YM5
         MeIZ9SmDBoDLzpB0IAJ99fJcw1c4487RR5+ol3BPulm/WccNEvNeYXRJUU5BknYoiL9Y
         7PDA==
X-Gm-Message-State: AOJu0YwSQCfKMDrcE05yyn1BRo+uKb3apQ+PkijFGMgI58dlVCWMJqTF
	xlOIjTSqcWWvI7q76r4bvoi6oOZydN2suMYsI2HBlkYNgul8SNDm8usylg2GjO8ibzRpU43/95E
	l
X-Google-Smtp-Source: AGHT+IG6uX+mg7GFY1h7p0AfmYqLiQfiAATsHhAZTnhu3mwlMgiUEpJCqpEvkdwcJTCuLCJES4e6uQ==
X-Received: by 2002:a50:d5d0:0:b0:566:41f4:a0ea with SMTP id g16-20020a50d5d0000000b0056641f4a0eamr353901edj.37.1711526611615;
        Wed, 27 Mar 2024 01:03:31 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id p11-20020a05640243cb00b0056c3013485csm1008759edc.69.2024.03.27.01.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 01:03:31 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-typeguard: Upgrade 4.1.5 -> 4.2.1
Date: Wed, 27 Mar 2024 10:03:27 +0200
Message-Id: <20240327080328.3910249-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 08:03:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109639

Upgrade to version 4.2.1:

- Fixed missing typing_extensions dependency for Python 3.12
- Fixed deprecation warning in the test suite on Python 3.13
- Added support for specifying options for the pytest plugin via
  pytest config files
- Avoid creating reference cycles when type checking unions
- Fixed Optional[...] being removed from the AST if it was located
  within a subscript
- Fixed TypedDict from typing_extensions not being recognized as one
- Fixed typing types (dict[str, int], List[str], etc.) not passing
  checks against type or Type
- Fixed detection of optional fields (NotRequired[...]) in
  TypedDict when using forward references
- Fixed mapping checks against Django's MultiValueDict

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-typeguard_4.1.5.bb => python3-typeguard_4.2.1.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_4.1.5.bb => python3-typeguard_4.2.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_4.1.5.bb b/meta-python/recipes-devtools/python/python3-typeguard_4.2.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-typeguard_4.1.5.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_4.2.1.bb
index 1e9f6685d..e0e84df28 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_4.1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_4.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[sha256sum] = "ea0a113bbc111bcffc90789ebb215625c963411f7096a7e9062d4e4630c155fd"
+SRC_URI[sha256sum] = "c556a1b95948230510070ca53fa0341fb0964611bd05d598d87fb52115d65fee"
 
 inherit pypi python_setuptools_build_meta ptest
 
@@ -12,8 +12,10 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN} += " \
+    python3-core \
     python3-compression \
     python3-unittest \
+    python3-typing-extensions \
 "
 
 RDEPENDS:${PN}-ptest += " \
-- 
2.39.2


