Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C40D33A54
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:06 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.27757.1730831924985081455
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j1ulh/AJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6ea7c9226bbso35058657b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831924; x=1731436724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNxf7eFlR+DWk3XpauPc49+eHbFfkO3srtOHEmZ9tjg=;
        b=j1ulh/AJU6uAR8XP8dGaxkjvDqvpO8zs80LzoQT9NhTfirPTww7nkDwBzZxLbb+lsQ
         WhiqCFvP8l9iRUfFVSCvtmHYR6euMut6Y0EcAqlomFoP9zrjKNJE7tI1hAgRTCdK+LmG
         Cu0TTAnBauSSQftnxdU2fGNC6+KIBBxrl0QkMM3xVnbclEgk6x85IdEivuBIzJFCFg3G
         lrAJTv3AORQd7vTS37NxvhUXnYIZD/UR3PW//hv7qYaoDRPepqywlxxiqVQCk1OFRxEK
         TcGhlir+8thxa1vkSWMFhVv6wlUb5x4bjPnZ6BZ8ZGLQtXn8gQToycgpmmoEnYrtBzfI
         n2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831924; x=1731436724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNxf7eFlR+DWk3XpauPc49+eHbFfkO3srtOHEmZ9tjg=;
        b=BrHtbSXI/NNkmEDmvC5JFC8+jvru9saOVSpvQk4RFgdLBGgcOaTctolo0V19gS/PVn
         fOxmkXa0J2fRtv0cwecR0tLwnEV8U5Slc7fVnkqCfHfOXbKB8jYCbtymEsoReknDgE14
         zX11ul0/+TZul41vEHo/1Qe4aIvTotJOBxSNAuBLQdWhmGHbSjxt0Y1ipjjZEBKJOaMe
         CRXSshBMD1uMUVVxbgbr2et8Wglfo9b+zd2eU6TjrriXziqfb+PYlFnBeFtMyNqI5E/7
         A88xRBZZijsn6pgYtanZYfL06wBIR9sU1uK8vIzdEA8ijV36Rham+JSGGgKAxflmwcpf
         o+CA==
X-Gm-Message-State: AOJu0YyNPjswQjCIdzu/VUYAsKyOT/cWxkQ66asFTDoxkR35DU7UeMPL
	9DTTqQuNJFe9mJc+QrqYnPRPrG+6wn0agrqrR12RNViYI5WYZMrJuU0m/RKI
X-Google-Smtp-Source: AGHT+IEmUGhecVzk8M1cHLQmxNcRiYSeJ91kj16iW6yC+nBs9IvI1wdGyfxXHiOXauaUt1fUljaWIQ==
X-Received: by 2002:a05:690c:438d:b0:6db:db51:c02d with SMTP id 00721157ae682-6ea3b8c363emr166803557b3.25.1730831923692;
        Tue, 05 Nov 2024 10:38:43 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:43 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 055/161] sblim-sfc-common: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:31 -0500
Message-ID: <20241105183658.34982-57-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113570

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb  | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb b/meta-oe/recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb
index d2bab6ce5..29b01d5bf 100644
--- a/meta-oe/recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb
+++ b/meta-oe/recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb
@@ -11,7 +11,6 @@ DEPENDS = "cmpi-bindings"
 
 S = "${WORKDIR}/sblim-sfcCommon-${PV}"
 SRC_URI = "http://downloads.sourceforge.net/sblim/sblim-sfcCommon-${PV}.tar.bz2"
-SRC_URI[md5sum] = "8aa2655d97bdea54c4750f220b40990c"
 SRC_URI[sha256sum] = "b9b1037173d6ae0181c3bd5a316ddab5afd6a342ad0dbdc18e940fc0ad2c3297"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/sblim/files/sblim-sfcCommon/"
-- 
2.43.0


