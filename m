Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 024CDC02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 13:28:58 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.115756.1738675727991647303
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Feb 2025 05:28:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=uqhR6VRn;
 spf=pass (domain: konsulko.com, ip: 209.85.208.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so958884a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Feb 2025 05:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1738675726; x=1739280526; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8GqnpMajYWgOnNSe6sFxUfHe76ldIItBCXq4LNUzjS8=;
        b=uqhR6VRnU9b0jqiKHNeNFeEpSgC2ngumysmetQ8760JfUJg9RF1vaDERJgFG3LR7gD
         Jg+T/Joj0DB1DRHVce6w3VewUcMykDHwBSzdSf/5sqzsipRaldsh4323+X0tFsepRHNg
         OSh7R9upZtYqQoX+dUF+0oK9NXU0VLtwluUbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738675726; x=1739280526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8GqnpMajYWgOnNSe6sFxUfHe76ldIItBCXq4LNUzjS8=;
        b=CE2QApCXvNVCIn22LcC8JJkcqqcQaEPeg5zWSC1exM413yf+jndnbo6D8y4OwLZlS6
         0z4aXzAFm7CI1TCFch2qrP5J++nZGUcKywSJzBWnoE7UhkLxzhf0H79rW7UaiSEGCXlJ
         jLdrJ+YNh5su07iB0A7yXEDzJgm0xcjd8ykxg7ajVhO+i+s3/DyOpCKH/cQ2r6LRtOVN
         HbK64z70+vXZJvlYC47skNX0DWxpYOZYQrPO0bkEt+3LIta+gaoTlMNHbJNuINgW+CEK
         8DOcNZU9DoIGzZiXQ4smzKc5ZuSNansSoud+VQv9ibXvKRUSvgCI1GKXqDDzuTheBsh5
         9wxg==
X-Gm-Message-State: AOJu0YwOVf6zzcYugWXXK5KiJXcwmPy1ApYID5duQc3zyjUNhTdhMmIn
	S/G2DkTS7fd+CwrhZtCgWF6LdE2KD6Ef9C2+67McgqLJ5utw8wS2VY45NSrCuc+ngkXLwTy/nD8
	/
X-Gm-Gg: ASbGncuOTSDObC51LoL64dE2f/Z1zOSHohWFRPFOQLLqjQDCaTeLvnc0i5FehStWGVj
	9QFJ5PbKx9wGXXvgkjl5odyuQO8fXH1nsU0FmCmVowJn5YRaGuwGxkU7A+ZSG9GWoaBk3RkD7gS
	uR3KfcZFGmwMPC2hg5krNJ8qaon77zNKXX81KxzA099Kjhp5yx9EQ59LbyCQTpc33m7+vRvBNS2
	JRWs9PU71RdnsQAKis34EPjPXwqVoReXn78VY0vYc5aHsAWoTWnGPIvIs14TBkakXXoVkyGvn6u
	Dkk39hiV065iCLhTVXAsXvxD3ztDxw==
X-Google-Smtp-Source: AGHT+IEunrAf2Wkev4T2sMuxoFQvcLodIjp0ds7jQHpfN2Nx2eSrKuLi0ujayc30pNKV5stmFmkKGQ==
X-Received: by 2002:a05:6402:358f:b0:5d3:d79a:6d6d with SMTP id 4fb4d7f45d1cf-5dcc137ec5dmr3734928a12.0.1738675726029;
        Tue, 04 Feb 2025 05:28:46 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcc45516c3sm1097216a12.65.2025.02.04.05.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 05:28:45 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] sip: Upgrade 6.9.1 -> 6.10.0
Date: Tue,  4 Feb 2025 15:28:43 +0200
Message-Id: <20250204132843.2357097-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Feb 2025 13:28:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115272

After the migration from Mercurial to GitHub the homepage has
changed and SIP is now licensed under the BSD-2-Clause license. The
upgrade to version 6.10.0 brings the following changes:

- SIP_ABI_VERSION has been added as a module attribute of the sip
  module. This is an integer that represents the ABI version that
  the module implements as a 3 part hexadecimal number.
  This has been implemented in ABIs v12.17 and v13.10.
- The ability of sip-module to generate sdists for older ABI
  versions has been restored. The oldest that can be generated are
  v12.9 and v13.1 which are the oldest non-deprecated versions.
- The default minor ABI version to use is now the latest minor
  version for a particular major version (rather than 0 as it was
  previously).
- The --abi-version command line option has been added to sip-build,
  sip-install and sip-wheel to specify the ABI version of the sip
  module to generate code for.
- The %MinimumABIVersion directive is used to specify the minimum
  sip module ABI to target in order to ensure that all calls to the
  public API from handwritten code are available.
  A consequence of this change is that passing string values to the
  /Deprecated/ annotation no longer requires an ABI version that
  supports them to be targeted. If the targeted ABI version does
  not support them they are simply ignored.
- The value of a string annotation uses the ; and : characters to
  allow platform- and feature-specific values to be defined. These
  special characters can now be escaped using a leading \\. This
  capability has now been documented.
- The license designator in setup.py for the latest versions of the
  sip module are now correctly specified as BSD-2-Clause.
- The code generation has been fixed for classes created by
  instantiating mapped type templates using a typedef with the
  /NoTypeName/ annotation.

This work was sponsored by GOVCERT.LU.

License-Update: SIP is now licensed under the BSD-2-Clause license.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/sip/{sip_6.9.1.bb => sip_6.10.0.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.9.1.bb => sip_6.10.0.bb} (75%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.9.1.bb b/meta-oe/recipes-devtools/sip/sip_6.10.0.bb
similarity index 75%
rename from meta-oe/recipes-devtools/sip/sip_6.9.1.bb
rename to meta-oe/recipes-devtools/sip/sip_6.10.0.bb
index c076929b94..82a4bb3024 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.9.1.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.10.0.bb
@@ -3,15 +3,15 @@
 
 SUMMARY = "A Python bindings generator for C/C++ libraries"
 
-HOMEPAGE = "https://www.riverbankcomputing.com/software/sip/"
-LICENSE = "GPL-2.0-or-later"
+HOMEPAGE = "https://github.com/Python-SIP/sip"
+LICENSE = "BSD-2-Clause"
 SECTION = "devel"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ed1d69a33480ebf4ff8a7a760826d84e"
 
 inherit pypi python_setuptools_build_meta python3native
 
 PYPI_PACKAGE = "sip"
-SRC_URI[sha256sum] = "7904be5190d7879952563b78a3af0e58fa27d9525af7f53f93eac7a83b433e7b"
+SRC_URI[sha256sum] = "fa0515697d4c98dbe04d9e898d816de1427e5b9ae5d0e152169109fd21f5d29c"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.39.5


