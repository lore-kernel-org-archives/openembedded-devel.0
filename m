Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BF7CCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 12:01:34 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.30509.1761566493268244530
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 05:01:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=VzTvMwwE;
 spf=pass (domain: konsulko.com, ip: 209.85.208.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61feb87fe26so7923962a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 05:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1761566491; x=1762171291; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ck93KghIMH1IWw4ioE1Jcoiy0i1K5xoaf+U+BmvbWSM=;
        b=VzTvMwwE0pmoYMJW7mCpPorstQ5xZErQGOlsehsoFfi4egKDXMnG/SRkpEB0Kyk1lR
         SbDN/W+o1mJtljbGQZm5uC/2u1J9S7Pad9qrp8DAxRLVlTDU+HXRxNEjatqjwYbQ0PAw
         f+6xnRNROTb+waBcY986LylCU+MAPl102U9dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761566491; x=1762171291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ck93KghIMH1IWw4ioE1Jcoiy0i1K5xoaf+U+BmvbWSM=;
        b=MT+nhZZbUrW1fhVX97YV+fBf6p1TgO2QJCGJ0cJnuftoJHsNGsau7qhDJZ3xh/UfCc
         R9QyUO/QvBTAOzEQ0/UZRYRoIpc1BjYTmE2YJhrlFm+M42JszSsP8OQHBcVdVO1odp/z
         SnTOGowYiSU60ptJ/f4InTN4ZwHYyfzNtBb53Wil5voFCztn2HCxSgGreJWt+2JW5CzN
         ULEXxF6UDPoB7NdoimPCJexfoIAWhr+oFOMa2PaqukjpSLZUjRo+ainvTGEG9AHktLXH
         YNDuSEJ9azV3AQdKVasUiGDmYHxGS2rsTrYnvLC5+YyHaRjnN+u77I88sxqTEHVHwsCF
         qHHg==
X-Gm-Message-State: AOJu0YzLgHSwI3rgmTkK9CX+KjGG1ltRE/IlkYH3WgJns83SO78pqMhM
	s+tpKmiZbOCT1vzG77TchBvMD3nelBX/D2pOIsC6slxuAvQpHgD7/nQ/dQkHskl/N0LGDhmoIit
	ltQk6
X-Gm-Gg: ASbGncsoZvqvSHS6/1Qt9gWOs0ER5YabNMJ3FJWNW4XBYfYtWPapcxY+PjHaglMJves
	wjhVbDEF7xdTjpqWLxRLhw3e3XDzQGcVpLJ6/hzgF1ucuJk+ZoQLh7E6dVj6d0NAIaSP9HRbu4c
	VDtHV1Mn1ntgmTDZfH0MpUnt7KZ2qTIAllnNTFX7qIAE60SWyhwjDfoI0HALaROmrDJ6uNN/DmN
	PxqUIa4ZycyaYojteZNU0CGlRDFmgFPkPd7ujist5XfpXUWntbsL+YlShFQFHdqUNlyzL+Vdbkb
	YD7Ge3bwwwt/sZH2Ik/rgxgxVQ5ddu1+vgKuQDIgC2WE8kwCAszr4rbu2ULJafMNVqMOnRsYbkr
	MkYzQqd5KPimyUp0Xx+LcoeKBXbBxFI8++64kqERi+K+hC3Got5mPCRGP+F/Qe//hCBQdXJPK1H
	pfXqVTps0+fjbVgVTLzfdWlyHY
X-Google-Smtp-Source: AGHT+IHrOqYl3L0Ifys2Nkrlx/dztl7CDBMxCEJgIEakTB5JPq3KeHPXgswHIPbhz1T2VQY/jtGWBA==
X-Received: by 2002:a17:906:730d:b0:b6d:42cb:7fb6 with SMTP id a640c23a62f3a-b6d700366c5mr1000558666b.60.1761566490891;
        Mon, 27 Oct 2025 05:01:30 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85338663sm740833066b.17.2025.10.27.05.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 05:01:30 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-termcolor: Upgrade 3.1.0 -> 3.2.0
Date: Mon, 27 Oct 2025 14:01:26 +0200
Message-ID: <20251027120127.1536673-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 12:01:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121039

Upgrade to release 3.2.0:

- Expose can_colorize as public API
- Add support for Python 3.15
- Drop support for Python 3.9
- Replace action-pre-commit-uv with prek-action

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-termcolor_3.1.0.bb => python3-termcolor_3.2.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-termcolor_3.1.0.bb => python3-termcolor_3.2.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-termcolor_3.1.0.bb b/meta-python/recipes-devtools/python/python3-termcolor_3.2.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-termcolor_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-termcolor_3.2.0.bb
index 5b82da4838..100292858f 100644
--- a/meta-python/recipes-devtools/python/python3-termcolor_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-termcolor_3.2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=e5f5f7c9b280511f124dba5dda3d180e"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "6a6dd7fbee581909eeec6a756cff1d7f7c376063b14e4a298dc4980309e55970"
+SRC_URI[sha256sum] = "610e6456feec42c4bcd28934a8c87a06c3fa28b01561d46aa09a9881b8622c58"
 
 DEPENDS += " \
 	python3-toml-native \
-- 
2.47.3


