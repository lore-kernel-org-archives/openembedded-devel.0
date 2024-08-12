Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 602C0C52D7B
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 03:28:41 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.38303.1723433320927686982
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Aug 2024 20:28:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=oV8qPWaA;
 spf=pass (domain: konsulko.com, ip: 209.85.167.175, mailfrom: tim.orling@konsulko.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3db1657c0fdso2760774b6e.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Aug 2024 20:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723433320; x=1724038120; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPo38N/pJa8lE9QpGYhWVqt0naLxnzR625QjqVhFfUU=;
        b=oV8qPWaAVsAOKGJ/YO4947vBaRNBTu9DeR5kSWvxbish+xpl31Z2ne8Pi+CJk9VcRL
         /JwDUJBA5QFNxNInmE23R/6jv8r/Vmbu+VAdhAqF79h1A0wWeqeWEt961GvUYhrC47yH
         IHo5nrTSSXG2h8wYlh+cNsxu9N8BZYxR8oTk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723433320; x=1724038120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPo38N/pJa8lE9QpGYhWVqt0naLxnzR625QjqVhFfUU=;
        b=Dun1pT90jhNfKhD0WGXZwNfd/UwkNkBRPdJ1ZcP8wbgOY6pm5USyxLmH9Ui7uZ8LNr
         yinKvadigVANeeS4egA/h5+16gCAY7T8cw2z2TbLlDrx4hVy6MMUOP1mmu6y68foz3Bh
         7BLiF46dX2eSJbTRLZt+2HkGzfCPUIbcYYfKLPXVKk5/tTTz2iBo9tuJwgCIRb70urS/
         3P8FzdNXF0NB95I0vlAvrjxc25hVjKmmsFmFY8vAV+DNS+e3RSzVCwIBVx+d+YsicALP
         aJztV2zAN4z6hGouDM/mURwEYiQ+6JO3brNSsQf7TkG3j0UF+Ys+BId60bJMLHsflQth
         vf/A==
X-Gm-Message-State: AOJu0YyVscfbM94HrY+6t/EEhvMB9q0gUEuOJcItu+ji/I+pB/nlxjjJ
	6pQ35DDhZe8jWJW5Wkz85Fgtq+wRQvFnftAAsrkk30qtl8f1ev/RS8fFdj/mS8iTsZDVaGk4/vS
	Eyck=
X-Google-Smtp-Source: AGHT+IGihOtspFCZaqYNSnLFjTYi7fmzCqRzNIilosD8HvUaW0tbv94JS0h71LXUK7OfjjmYBoFyHw==
X-Received: by 2002:a05:6808:2110:b0:3da:e246:36f9 with SMTP id 5614622812f47-3dc416e1309mr12288506b6e.31.1723433319771;
        Sun, 11 Aug 2024 20:28:39 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e58aa1easm3015183b3a.53.2024.08.11.20.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 20:28:39 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Subject: [scarthgap][meta-python][PATCH 2/6] python3-pydantic: Upgrade to 2.7.3
Date: Sun, 11 Aug 2024 20:28:10 -0700
Message-ID: <de27f2eb7d045315f558e2db3eadb5be353db81b.1723432397.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1723432397.git.tim.orling@konsulko.com>
References: <cover.1723432397.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 03:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111760

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>

For full changelog, see:
https://github.com/pydantic/pydantic/compare/v2.7.1...v2.7.3

Highlights:

v2.7.3 (2024-06-03)
Bump pydantic-core to v2.18.4 by @sydney-runkle in #9550

v2.7.2 (2024-05-28)
Bump pydantic-core to v2.18.3 by @sydney-runkle in #9515

Backport from Styhead a45050c6433818e2196bc9e9ceaf2fb9ceec7095 as part of the overall scarthgap fix
Fix typo in version number, it was upgraded to 2.7.3, not 2.7.2
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-pydantic_2.7.1.bb => python3-pydantic_2.7.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.7.1.bb => python3-pydantic_2.7.3.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.7.1.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.7.3.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.7.1.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.7.3.bb
index 3c11144472..423fe76733 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.7.3.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "e9dbb5eada8abe4d9ae5f46b9939aead650cd2b68f249bb3a8139dbe125803cc"
+SRC_URI[sha256sum] = "c46c76a40bb1296728d7a8b99aa73dd70a48c3510111ff290034f860c99c419e"
 
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
-- 
2.46.0


