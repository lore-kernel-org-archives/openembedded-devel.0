Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F0ED35E2C
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:55 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.27734.1730831901197211743
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cRSWcJca;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6ea7c9227bfso12400757b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831900; x=1731436700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gCcAPtDheyBiX47U4bDyAgR+msaEiZcohew89+uQ/E=;
        b=cRSWcJcah5MSDI6nZRKkaTqvgfJ4BVOKbIXLnKL0E3SIAelnXDpFkXTjCl1yZdc38p
         nkGxbDYBIfPMXn1xo4Uadn1Ttft/WfOVq3+3QkZuixWCvNrLMDzrlsP05xvhufyhKAbU
         exYUeqWELSCWdwbKLUyms8MUPe0eXFVctSYRAt8CKcwEghbTMJlLGB7CtfrDIZDbaZBE
         9w1Y5IVNFvnlnrZWjAtGuNlGsqTV41KGkRIhYLuN574knqvTTGUbgMvLU6pigMoNH05d
         Mr4H7qXSKSd/MHqNNVlLEFA1iZeY5RhpfcTrNXuX0SVxNMTb0ctj3ORa5/eJeWsCvJHX
         buWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831900; x=1731436700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gCcAPtDheyBiX47U4bDyAgR+msaEiZcohew89+uQ/E=;
        b=UrbH01FrH3kteElaAPyUa8fD3RMtKq7Be2Fw9FLjXflW4dk2KuLJkh6nOnwT8Vp00r
         AO9jpFghlDXbwjfJGJT+Q5QlhRztLWZXjJODtlpEWTfe4kS/2VfdvTZ9W2GKIggUvnsY
         Ae0JBRuc54enXzOCmAux3nlz1jTpyg6xYTkcgyzRyxktZJhjERFGY2t7V8G8YLGRb5H4
         39k19tNbeA3BxRsp9ei5wGIQ3dt0QwL/sxBS8lOzWyijlVsGEq9AKdN4SD0DI46Spkd9
         JK0t/Hzr7nEZt7PiFsJsGwxOUeT/65bwpX5wOThV9L9gU74pF2Kqy2MIDZPp2yi1l53a
         DA9A==
X-Gm-Message-State: AOJu0YwDwiPwEQwo+o4CC8Ew7VB5SzvYMUdL0NmxjMHy0woo0MryNk/W
	ZfTLkIyZifv9QdEG6PAX2UEoNkYaQ86XEMTmVP8cBfTZbQ3ev1OMj5lLekOL
X-Google-Smtp-Source: AGHT+IE959VBXssq0q1IE4k1jL52lMiH6viipk9+VjXDvj21j3dthF61V6JpwSvcxdGnHskEKfYojA==
X-Received: by 2002:a05:690c:fd0:b0:6ea:87dc:49b1 with SMTP id 00721157ae682-6ea87dc4fcfmr89569267b3.10.1730831899851;
        Tue, 05 Nov 2024 10:38:19 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:19 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 029/161] dmalloc: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:05 -0500
Message-ID: <20241105183658.34982-31-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113544

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/dmalloc/dmalloc_5.5.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/dmalloc/dmalloc_5.5.2.bb b/meta-oe/recipes-devtools/dmalloc/dmalloc_5.5.2.bb
index 2f0d8a340..79252f94a 100644
--- a/meta-oe/recipes-devtools/dmalloc/dmalloc_5.5.2.bb
+++ b/meta-oe/recipes-devtools/dmalloc/dmalloc_5.5.2.bb
@@ -28,7 +28,6 @@ SRC_URI = "http://dmalloc.com/releases/dmalloc-${PV}.tgz \
            file://0001-undefined-strdup-macro.patch \
 "
 
-SRC_URI[md5sum] = "f92e5606c23a8092f3d5694e8d1c932e"
 SRC_URI[sha256sum] = "d3be5c6eec24950cb3bd67dbfbcdf036f1278fae5fd78655ef8cdf9e911e428a"
 
 ARM_INSTRUCTION_SET = "arm"
-- 
2.43.0


