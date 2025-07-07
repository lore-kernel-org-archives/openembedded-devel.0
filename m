Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C76C83F07
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:33:58 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.55940.1751880834631454446
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=VNptrXwP;
 spf=pass (domain: konsulko.com, ip: 209.85.208.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6099d89a19cso5185028a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 02:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1751880833; x=1752485633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m982mKHGTMCcMe3GWi1yvDxc5mJSdVQMRupaWnQfCyA=;
        b=VNptrXwPG5JrX69mV42wbhn8TVAEBp51j77hwnfUR6pmMr2PCBrYioyJFFroR6xObc
         XsQJrutEZ7wTRcmLQGi1Jm6rKhNYn0kMhOJ0AiH3uQRtJakXGafknnm9swtiv+EhqO4/
         RGnapMNUi/Hj/M6SJv1BgdTcrmrfGBd8Q2FqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751880833; x=1752485633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m982mKHGTMCcMe3GWi1yvDxc5mJSdVQMRupaWnQfCyA=;
        b=pDqT4XqLGdoq3olEDmnRDyp9P5YvyDAnUBGep6N5vsfQKMtN4tRhMrPLL+X2pan2k8
         60wglRQWe/x6LpZFIuMq9eajZR7W9oJX9uJC877uizlWx1+tR4br1zpGIhhxp7zX4AJL
         6dCnEVO/1ovks+o6qulifd6GqlxMnOAAYFZOj5EtQzAtL7YeEwev3C1kG2bQjbtKc/fU
         SkpBVt1DZBOSFwkEDfshgnySEmePoTo0ulD3qHR+9DRWnmXeSa3WfDspo9cKuUCTiIri
         PAsJy1JtyYeazXHPWjPBt8j/aIhCAO8dsPpOPSECrixcdELrJvfzru2AUxTOgnEcSKEI
         u6dA==
X-Gm-Message-State: AOJu0Yy27bLgnkoHEsolGWWoSkQlevMce0YR1khtuH3iFB2STiLAqzLM
	HGf2FwjHYTGHzv9toOc5Ovck3sCO52r5nuh3DnJeJZj6CvMUQQQ+b4nujUgOBj42CTYdDESr5M3
	DPdiu
X-Gm-Gg: ASbGncti9pJbu8te10uOHT5v73a+NCOcAUvtR9FLGFQDSw252Wb/yl7ew2XrlaoSvys
	4++EFSi3WzvkaS+N7/YPLX7OObyra2bnWPj2tpvGCejmFoAdmcOqKa9tOKFXuYUDqe8C+zlzW1H
	Z25MUlVYEx84f+oCwgMU1bdJNeC79In2wgsHMBfjqA10qlT+L1IHOy8z7xYv9VcZ/OgJiq1CQ3G
	6Yuau7OMm5ZUCGoIDxHwjD+UvWGGHekPUFsLgmrKKpjFRt0lsiroNFyBO8+bKy3KfraKqqGh8fC
	rAeKYE89QY3e5tU1GHWp8rS7JEGMpNFfxPHi1fxBSlMRrpohMQIbCfXbKTmSU7PHXbYKXypWVj9
	E
X-Google-Smtp-Source: AGHT+IGKJQo1qzcigAfhsNBbH0VVIj+TRDwcsSjasqz1JGvDkuLrV8ChLbY8XhRJG2i8ehnwqmtPiw==
X-Received: by 2002:aa7:d958:0:b0:608:f493:871c with SMTP id 4fb4d7f45d1cf-60fd6527017mr8417767a12.14.1751880832567;
        Mon, 07 Jul 2025 02:33:52 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca69657fsm5262179a12.26.2025.07.07.02.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:33:52 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-robotframework: Upgrade 7.3.1 -> 7.3.2
Date: Mon,  7 Jul 2025 12:33:48 +0300
Message-Id: <20250707093349.2451474-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250707093349.2451474-1-leon.anavi@konsulko.com>
References: <20250707093349.2451474-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118282

Upgrade to release 7.3.2:

- Embedded arguments matching only after replacing variables do not
  work with Run Keyword or setup/teardown
- French Etant donne, Et and Mais BDD prefixes don't work with
  keyword names starting with que or qu'
- Messages and keywords by listener end_test method override
  original body when using JSON outputs if test has teardown
- --flattenkeywords doesn't work with JSON outputs
- --flattenkeywords doesn't remove GROUP, VAR or RETURN
- ExecutionResult ignores include_keywords argument with JSON outputs
- Suite teardown failures are not handled properly with JSON outputs

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-robotframework_7.3.1.bb => python3-robotframework_7.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_7.3.1.bb => python3-robotframework_7.3.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_7.3.1.bb b/meta-python/recipes-devtools/python/python3-robotframework_7.3.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-robotframework_7.3.1.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_7.3.2.bb
index 0f205b9274..df4b31312e 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_7.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_7.3.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "10be47f826a5ecff09d08e57bf17fce124d38b6e022b380ce67c526ef747194f"
+SRC_URI[sha256sum] = "3bb3e299831ecb1664f3d5082f6ff9f08ba82d61a745bef2227328ef3049e93a"
 
 RDEPENDS:${PN} += " \
     python3-shell \
-- 
2.39.5


