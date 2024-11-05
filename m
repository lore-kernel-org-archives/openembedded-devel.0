Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECEFDD40CFE
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:09 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.30386.1730838928805691670
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:35:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GXgRQzVw;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e8063533b5so49320847b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838928; x=1731443728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rf0wFuWm+RLBV3bv3PxgWZQxkOUK66IBI3Fabk4yjc4=;
        b=GXgRQzVwamjObjBdeGcfC4JKJgyRCyQ5C4srph8+8w4lWpK2QOzgtU0+JM9gqOF0hB
         kwlq7VnXjRUCgi7uvzoVbOhYaYEDRxrnuTDL226wJPKF323TbntHvXDdPfa6jkbOEbLv
         JmV3VQ32TmScdHuLx8ho809wjIBuG6W2jT/fwcIOv9LpL3yj/2OzCkG1iosHCSiAHdq2
         7+z6DcSYOoPEnhFZULfH6ahHNqyS+frcyXTQL5YmBguLEdpgxkObbDrmCuFJpycLHQy9
         u5woXCpcU2Un+brYvJV5GCRIqLT53wYuxITyXv93kxJ4M0Ofpyq88wEed5QnDBQCIYoJ
         dtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838928; x=1731443728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rf0wFuWm+RLBV3bv3PxgWZQxkOUK66IBI3Fabk4yjc4=;
        b=a3UxnjhvZ8UyO+6u9HxCc2WkdxEZgYMk61+6D3GRi2XmpCvL2FMpixEsEIthXo+5CZ
         4I4kglTJjDRxC0JYBSU6EgbWIOVKFNN9DNdr8VryKjIdqfkr/1xkvbfS0430OyY1C6oq
         +tevFOOHN0hfvblaLfCALrEqfXPkjc2cA4Iq5ClK13Xd3dJtuC2bfTszOIwL2XWieElL
         06WfgvJTgBWcQ4PLPIj/IDcfYz8T7bVbra584v9+f5FIA9Kgr5KKEhWSaV6SnBZx/J17
         53aYH5WltV5H6JckVJnnplUunnTwU8r2heStDMppHIf2w+Wt0Iv0Wvd0X/Y1ucYOesBh
         hJMQ==
X-Gm-Message-State: AOJu0YyBAykSdt+RHlARNo5cg6WWyZWgCT+V1QtWV5ChafKmgcx+uZcA
	Pcin36PCYdoJMA6DO+EFyhE/HVT+W3q2qEazJJt/9QRqNzlfjmaqb1Sc+HkW
X-Google-Smtp-Source: AGHT+IF4miNW2FRkMo/A0DmcjdrAq/Tvo0L50GrIrQ3PbM1+XDxJFBAsRyOHylmSN4f3q1WqBaRwyQ==
X-Received: by 2002:a05:690c:fd0:b0:6ea:876c:baa6 with SMTP id 00721157ae682-6ea876cbd2emr102693477b3.33.1730838927548;
        Tue, 05 Nov 2024 12:35:27 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:35:27 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 127/161] joe: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:27:52 -0500
Message-ID: <20241105202827.3104-127-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113644

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/joe/joe_4.6.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/joe/joe_4.6.bb b/meta-oe/recipes-support/joe/joe_4.6.bb
index ed0bf337b..510d8f849 100644
--- a/meta-oe/recipes-support/joe/joe_4.6.bb
+++ b/meta-oe/recipes-support/joe/joe_4.6.bb
@@ -11,5 +11,4 @@ PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,ncurses-termin
 
 inherit autotools-brokensep mime-xdg
 
-SRC_URI[md5sum] = "9017484e6116830d846678b625ea5c43"
 SRC_URI[sha256sum] = "495a0a61f26404070fe8a719d80406dc7f337623788e445b92a9f6de512ab9de"
-- 
2.43.0


