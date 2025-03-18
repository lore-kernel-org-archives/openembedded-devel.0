Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC5BC28B28
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 14:03:05 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.12594.1742306577077697698
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Mar 2025 07:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=hpaT1BPN;
 spf=pass (domain: konsulko.com, ip: 209.85.221.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3913d45a148so4959755f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 07:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1742306575; x=1742911375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyb0Jwfd/eroNwvtXmrv4X+c0SFmQAH0F5qaDzzI4iI=;
        b=hpaT1BPNKhIixY7p8sO98xkbBUKEmYqrBlaUJ0uGHrG3y8bz2kfgHuy+GZw/kOOeUe
         oh4wWsRco0ylm2iNQN4XqeEoDGjfZztWknq1vUK1I4qZ3JDS8xbGoNav4bZd/ECfUxUx
         ROoCWZyWGqdvJrccRQm2fgkxWulnRhzc5cuO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742306575; x=1742911375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyb0Jwfd/eroNwvtXmrv4X+c0SFmQAH0F5qaDzzI4iI=;
        b=UpU7sK55rKeGyijzkP0H1yFGag7M+NVmTarvxsZnDGFiB2QNzU15Ee9IZ8DcIKNAnM
         2p4mzAnp3/t+IM7kKpyWQ7ma6/tymHugDgLpWtnlra69cYIbrxLJe4Z8me/GJJOqP5cs
         +mUOqEjwuBDFRmF5M6eOgbi1xLLjyAAhvSdSyDujiY5enpXizGo+bHFeoE18fhDXeN0q
         7ACLfasL6lwhIkk6DzdUmL83mvEFXfp+cSSV98CbCqBGjYE1faBHZSzwlBrCp5VKfWEC
         lLssezUzrcp/FcC57UKrGVZW6kFV23IOfFscAbeEXzdg9Vkydf5xLHoqoqK4lb9ss3dr
         H8Lg==
X-Gm-Message-State: AOJu0YxvppwAFDd7l01/P3Kz26RmMtjdhgT9g2O2CoCPTLEgo6Ve2rKw
	yCWx0B2LZhDZoxlUmYV1wrJtAM0ZjQWXqKswmAMu1Ij4Tq0/lEWEUBq5fdcOWbIk8B4tHgz+won
	S
X-Gm-Gg: ASbGncv7jOEy4Os7G5nvkvG5nzLMVh8UsOgYy2C6WXFh5+y/mzFC+AKRfdnxY6alOJk
	/SBgI5gcMfmTD/Gge3CUuMo5SjGjkXbKSG+yudZBZc+NE6vJUet5/moGQsHe3yr6JuRgbBxBGvB
	nEKM1ZYj1qaGgBfV2kE7dfhC7HLSbSgfdK0ee7VTjQN2vTuIme3Zkw1nmHCG26GSUQF2RrtDYMU
	0nZIaoxXgJhVRTyTDEASQMxNZ3J4ZC97Lt1OwR0OMT8o+ADPJQXPZW12Uuls0CtXwBCkJxS/g0y
	jGfWhq9xCRuPMwkcxHK5mPW7Zy/VSlQ7BGthVFb+oYtSJbveSBIOMMpdTLU=
X-Google-Smtp-Source: AGHT+IGQCbmDBnCSr8opP6+10SK1CcYRNczQPiFbWmBKA0UVrsAMNTNVXBYPhcxV+wtamkATiK8tzw==
X-Received: by 2002:a5d:47cc:0:b0:391:3f4f:a17f with SMTP id ffacd0b85a97d-3971ee43fc3mr18858513f8f.42.1742306575060;
        Tue, 18 Mar 2025 07:02:55 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d20e29a38sm131345035e9.37.2025.03.18.07.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 07:02:54 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-decorator: Upgrade 5.1.1 -> 5.2.1
Date: Tue, 18 Mar 2025 16:02:50 +0200
Message-Id: <20250318140251.522768-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250318140251.522768-1-leon.anavi@konsulko.com>
References: <20250318140251.522768-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 14:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116058

Upgrade to release 5.2.1:

- Changed the build procedure to use pyproject.toml and moved the
  tests outside of the generated wheel/tarball.
- Added official support for Python 3.11, 3.12, 3.13
- Dropped official support for Python < 3.8: the module is expected
  to work on older Python versions, but I cannot test such versions
  on GitHub actions, so the author cannot claim that it is
  officially supported.
- Dafu Wu provided support for decorating partial functions, i.e.
  functions wrapped by functools.partial.
- Included tests and documentation in sdist

License-Update: Updated copyright years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-decorator_5.1.1.bb => python3-decorator_5.2.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-decorator_5.1.1.bb => python3-decorator_5.2.1.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-decorator_5.1.1.bb b/meta-python/recipes-devtools/python/python3-decorator_5.2.1.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-decorator_5.1.1.bb
rename to meta-python/recipes-devtools/python/python3-decorator_5.2.1.bb
index f330376243..e0ab87f89e 100644
--- a/meta-python/recipes-devtools/python/python3-decorator_5.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-decorator_5.2.1.bb
@@ -7,11 +7,11 @@ can be abused and you should not try to solve every problem with a \
 decorator, just because you can."
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=be2fd2007972bf96c08af3293d728b22"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=69f84fd117b2398674e12b8380df27c8"
 
-SRC_URI[sha256sum] = "637996211036b6385ef91435e4fae22989472f9d571faba8927ba8253acbc330"
+SRC_URI[sha256sum] = "65f266143752f734b0a7cc83c46f4618af75b8c5911b00ccb61d0ac9b6da0360"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "\
     python3-stringold \
-- 
2.39.5


