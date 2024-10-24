Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A50CFD1036A
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:24 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.6080.1729801147238488853
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mDlIs604;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e28fe07e97dso1550580276.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801146; x=1730405946; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zVcVlI1JD/UZiMVjWfk97RIfJVZQxwXNeCRb69+z18=;
        b=mDlIs604oq0j7wosuJl2AF/KuOT808LyM6LKX/oFFTN2RfmfeOi3Ts5WK1MXf11TkA
         lHg5jNsXS/QRlb1Ljz9Gk4l8ZQ9pZ3wvYLxA+kpkmqcgzbybNQonPhOv+xjui3ZQAJho
         AVz2muu5J2n2cS6q+iKMJs1PA4yolmtFdPqd0w+ErqU6BclWz8v5amBTsRfHMYTQgUWv
         kpDp+GvYRTwLHwEhBMbL57B3opcPWdhp79SY6wzqrA4fajiBecUNhdusPuttBA3FV4sj
         evS7zg7MUJFGWmAeefj/AaYE0aXNWIKJx7D428lPIS5a5rRKByLXHpDN6T1anDAVPwU6
         FEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801146; x=1730405946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+zVcVlI1JD/UZiMVjWfk97RIfJVZQxwXNeCRb69+z18=;
        b=lRLQHhwNtQd+KPkv3wNyL8FKUbcdpJfIoo/HW4Uzqd57wp2dZu77MIn4hBlh3SZDyU
         gj9zaDt9/Xb2c0WertP1+DjaB/d70IWsALAXw5Tz0yMbdxDuXZPP2w3v8das0hHPpUii
         AxuoTqEvcorN+m6JEstHowzRVdXcniuAMLHuJdwMRbaDJKfzYt1tqWYF/hFbrled8upn
         rJTL4SjHD1C3Y+DMCqbsM36isDBY/2L+zLAa3D8WaN21dBb73cyX6m/2a0O7mjK5CHP3
         uzcaOiRfo1cYul0ykNeGv3NNhncvJTkhUy+4UX42bavAsw7PSv+dCUxx4LeMHCyJR+GT
         S94w==
X-Gm-Message-State: AOJu0YzJSGxZXTtTeMPS7eMxziL5SzuVAWvK26EsN2+mgPK0pEp+amVa
	y68OsIBRu/wB3gDn3i3cqAt5fhy0WLh/UTiZC6SDt0hq16seAeCR0DT/+w==
X-Google-Smtp-Source: AGHT+IEYxnuMQz1QKv1p2ZDGqYzH/90fWZ7uAkZjFhBeoUgM7e8WQyh9Lj1S8duLW8xx1a5b8EST2Q==
X-Received: by 2002:a05:690c:39c:b0:6e3:39ed:f029 with SMTP id 00721157ae682-6e7f0fdc58amr90210377b3.44.1729801145972;
        Thu, 24 Oct 2024 13:19:05 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:05 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 20/42] libimport-into-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:39 -0400
Message-ID: <20241024201806.440273-21-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113198

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-perl/libimport/libimport-into-perl_1.002004.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb b/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb
index 690bbe92e..c16c358fc 100644
--- a/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb
+++ b/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb
@@ -11,7 +11,7 @@ directly, since they effect the current unit of compilation. \
 
 SECTION = "libs"
 
-HOMEPAGE = "https://metacpan.org/pod/Import-Into/"
+HOMEPAGE = "https://metacpan.org/pod/Import::Into"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=209;endline=223;md5=3cf363f1e405dea6db2c6cd0ef23680c"
-- 
2.43.0


