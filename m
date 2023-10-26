Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A27C25B67
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 13:12:16 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.70016.1698325930720837564
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 06:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S7et0sAr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.179, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c54c8934abso12923111fa.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 06:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698325928; x=1698930728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJpmhgA4uL4qcnzI5CIMps7ZL7uma9yHKTjl9iGDv+M=;
        b=S7et0sArvlADpSZ/jAXUQpJkRYg+ftaAp5O/7IxPJXUn4ydqw2I+FVdBagJf1gjoPJ
         5LErTAeUA2HOPeUpkreNJ+7y7VI4gqzjIWygRvTOhHKadDC702L06jf864vdO2gGHw3q
         1jEXpisRNrBCWHYHeXE6CO/uMlgvb9M8jjT34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698325928; x=1698930728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJpmhgA4uL4qcnzI5CIMps7ZL7uma9yHKTjl9iGDv+M=;
        b=U6lrktymdJpzd/R+Y6Q6sNCvNHo6r0OZMLQhKs/mi8MdxcLOjelWZ0CePQrTqe3O9T
         KKvl1eUJUwjfmnE28HBf66XHv+U8PuySX2+CUfCLJ/pwcAzzSGXBEWtKGeqmBh/tlSDH
         +LMtyXubxHOwI9/wJHIN4PNUwqyRDtUHTSl9dArvtPan9NSBVO3ePbxZUz4xYzb8Wj+c
         usHgO41DQ4kUqYd7+UhJjGqNVl9+BBABS53pU6d+su3V+Xx9BNfDFB/ylhyzpCt2KxNR
         8Xm+3OPJKXMeYsmqNTj4pLlQ8yFc1ivScNnITmtoQeZntEEZtFtHTA1Yl/zBAgu5ZCJi
         oMkg==
X-Gm-Message-State: AOJu0Yyqexidv4Hl4U/1VeoK9ctBjuDbCN3A7gejrfCWfZS//mx97a87
	sLoLZsXtA5fE7GYDs6ESvwhAIt9n17V5kWZFKc0=
X-Google-Smtp-Source: AGHT+IHjw9w/x3lNckcrNEIc2+YBwAJc/sfW8zcUULC7SvTz+esPO/a3szTBQ3RmYa+K8XdeKI6C5w==
X-Received: by 2002:a2e:9d8b:0:b0:2c0:c6a:d477 with SMTP id c11-20020a2e9d8b000000b002c00c6ad477mr14426303ljj.18.1698325928675;
        Thu, 26 Oct 2023 06:12:08 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:aeb5:bfd7:dc1c:82a3])
        by smtp.gmail.com with ESMTPSA id w11-20020a05600c474b00b004067e905f44sm2591879wmo.9.2023.10.26.06.12.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 06:12:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded] [dunfell] [PATCH 2/2] grubby: Update branchname to match upstream
Date: Thu, 26 Oct 2023 14:12:06 +0100
Message-Id: <20231026131206.1501025-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231026131206.1501025-1-richard.purdie@linuxfoundation.org>
References: <20231026131206.1501025-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 13:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105747

meta-oe master already made this change along with others. Update the branchname
to match upstream repository changes to allow fetching to continue to work.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-initramfs/recipes-devtools/grubby/grubby_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/grubby/grubby_git.bb b/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
index c0797ac5c..9d3d7b55c 100644
--- a/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
+++ b/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
@@ -14,7 +14,7 @@ DEPENDS_append_libc-musl = " libexecinfo"
 
 S = "${WORKDIR}/git"
 SRCREV = "a1d2ae93408c3408e672d7eba4550fdf27fb0201"
-SRC_URI = "git://github.com/rhboot/grubby.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/rhboot/grubby.git;protocol=https;branch=main \
            file://grubby-rename-grub2-editenv-to-grub-editenv.patch \
            file://run-ptest \
            file://0001-Add-another-variable-LIBS-to-provides-libraries-from.patch \
-- 
2.39.2


