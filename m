Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C5FD10385
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:25 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.6091.1729801157951053377
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HQhgxB3U;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e2e41bd08bso17281957b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801157; x=1730405957; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mT2WGBWg6U8G9B/gHnXeqA+rTXUDzqZ7ZSZ7503x31E=;
        b=HQhgxB3UaOsLcsQHNv8LBY2i4Vef113v3POlQ0qC9q918KtETE8Zemd2vSF73LD54r
         kcXLU41K/DY5cDSv9XtqqyZU8GVI4lRbiw8VR+//JMvci7IGFcznneQ8OtBkKALUJuob
         Ma8Mw9IaW2RN0MmZk8aEJ75Dn9hHkPY7RdUcy3MnnI8FDGBl82Uo2wVevcyVztJAtwWN
         YCyejRE7NVf0ItMkeEaRuAz4Zil57myZOS0SiPFQolM4xOmtRjpvZJOuu3/y4q9uEXW5
         9+/7ZJVzPd9/PR9+4VbtmuMq3HtqVwW3U7po8LaCuSLv0fYo7A/wrpk6DJ/CwMkpuDLY
         xXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801157; x=1730405957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mT2WGBWg6U8G9B/gHnXeqA+rTXUDzqZ7ZSZ7503x31E=;
        b=nm6nFtBD64NrCqNLBpa531EUA7gFgCVQ8tq0dXcsrr1Tp6j9hhyZGyi0D4Q2nfeDiD
         MTaBW7PlrvE4OcB+e7L1itAc7J1J9s46+irYktD4qYxUyhqDTdTrDo3tY9qvYSL8vyF7
         tmr6RyROXOuIPYJuE9K+2jcM5caZEVcykDXPX+bToQ/GDjIFC99h3UmEcCvPptaffMde
         zI0Z3y7GvlkbfRUIHnMRzJuWAhIilZk4C1fYd7YBltX6vAQCsnhzJdhBpLtt0o5QbdjP
         GUQdU7FEmGdhosJmfCFIqiCiBZGQbPioSYs/tZt8Zr0HyLE9Q1IkuTEFXgXlvsv0mJHt
         nzCQ==
X-Gm-Message-State: AOJu0YwHoiU5RuI4Ebv79HZOzxvt2bJ6YZBCXHmouEPFHvwNVeAFYQYv
	IyA24lrCILD8Lr/HQnJ32qROH3mPTqRbV2Umv/RGyW+BJvnSmPE2uHYBrg==
X-Google-Smtp-Source: AGHT+IHARIfpF9I6lhaja45s37ol8+K8cPiD/yc+OOt6CMFMlvGvg1QRPxfBmh22SOSjtot/yXAKtg==
X-Received: by 2002:a05:690c:9b06:b0:6e3:4512:5d84 with SMTP id 00721157ae682-6e7f0fa375bmr87811147b3.40.1729801156707;
        Thu, 24 Oct 2024 13:19:16 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:16 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 36/42] libtext-charwidth-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:55 -0400
Message-ID: <20241024201806.440273-37-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113214

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb b/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
index e9a2bd474..8f16aa1ec 100644
--- a/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
@@ -10,7 +10,7 @@ width of the first character of the given string and mbswidth() gives the \
 width of the whole given string."
 SECTION = "libs"
 
-HOMEPAGE = "http://search.cpan.org/~kubota/Text-CharWidth-${PV}/"
+HOMEPAGE = "https://metacpan.org/release/KUBOTA/Text-CharWidth-0.04"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;md5=d8d54c8c500cbdd57a4c15911d9d96db"
-- 
2.43.0


