Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6DF8D36128
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.27765.1730831936960037230
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZS/kbquK;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e3cdbc25a0so64377557b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831936; x=1731436736; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/J/HDWs+DMK4/KJNGIU26/BfoypaYNENkd//ytDFIc=;
        b=ZS/kbquKzyOWV7OiV6VNkBTfdgnqRAH574WkAP9dCkn0qwF9xXQ+r/XbQ3jpW4PUJF
         0ocqZ5DDIEkq5MWA3I0IgZZN6eqx0N/7IbrebQkXb9kPuTniVIszuH8i11jMbVNrEfkt
         Q4zfGUDRtTOP0QnOg+EFPuXAjItcengkBLKWIP2qxi5pnnKzaXT3kd74I8UyDt0LLxkr
         5ZXfXA1FlH+4uGCKyZmweY/wk019rBUV0o2ThGkdTXYUW3mzgew+3Z9DS82AHf555wo1
         v29sQLcbyqu2d77G1qYm3dZ73vsWWU8KzKh4bZpkA24P1aQPG2t2+eK99tVGZlasm617
         UxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831936; x=1731436736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T/J/HDWs+DMK4/KJNGIU26/BfoypaYNENkd//ytDFIc=;
        b=V5RPkZYt7gU4syuUeqKTz9ZCg7G6bfljHuiWZYq+jmp1348EZr0wGflipN65MJktIo
         UPccD5DCAAULbpuL658zdv/EUCNeojZXkqwGZhSKEQSrE+6pfU9eaia7hQ0uv2zX0fCE
         77nQ9Gqi/3zbrVC7iG39vo1V8XfQ7FtNvfL0101wYJI7ulOh6bWxW/usB1QGjWUkNwvp
         Eygm10m6L6ImoAq5naYSqWNOMNd4YeHKR8sLbdWnkUpdDq207mDkEzBOgOE8BFZ/wZIR
         BVwEsQ8sBhuPTCU4A/7uZtGXIoLTbvtLJExV+qAhkteCUoEPhJBDdkGegYeCMKtIwDdP
         NOtw==
X-Gm-Message-State: AOJu0YyxYZ9LfjT46xAxXRb7mZLhL5i4EzbNcXdC+4rg+JkwTPXKuTDe
	5NTXEGtdpYu4i/J8PtpFAnb65xpm0e/C5+v/hxh/Ch9UrTli9kWVLNzDspXx
X-Google-Smtp-Source: AGHT+IFIO+3f0agDsnPdDxWSFLatrt/M6vzVVgK5Dewy4sUhhkBlye+FRR74DbWiNUAU95nN4qPYyw==
X-Received: by 2002:a05:690c:48c7:b0:6e3:2361:df8c with SMTP id 00721157ae682-6ea64c0eab2mr180744607b3.42.1730831935651;
        Tue, 05 Nov 2024 10:38:55 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:55 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 070/161] libsdl-mixer: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:46 -0500
Message-ID: <20241105183658.34982-72-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113585

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb b/meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb
index a470ee81d..35f278c89 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb
@@ -8,7 +8,6 @@ SRC_URI = "http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-${PV}.tar.
            file://configure.patch \
 "
 
-SRC_URI[md5sum] = "e03ff73d77a55e3572ad0217131dc4a1"
 SRC_URI[sha256sum] = "1644308279a975799049e4826af2cfc787cad2abb11aa14562e402521f86992a"
 
 S = "${WORKDIR}/SDL_mixer-${PV}"
-- 
2.43.0


