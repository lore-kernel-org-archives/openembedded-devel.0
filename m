Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFCABD1037E
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:14 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.6077.1729801146106304474
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FEmJalTD;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e3c3da5bcdso14240067b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801145; x=1730405945; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjbuFUZsYCyvYWy1JdsmNXUZJu6kDs47dXJHb+d6Z38=;
        b=FEmJalTD0bFXVNSZ6FLsM6SWSuK+0rUQpaQSoCn0YOvC1nKYY/hYlpqDu+TvNj7mzT
         /TexFEHKtxZm5pP68Z6kYusIsUT5i60VraP+5aZ9nxQEYWLaZwIYuWbLS7zQP1wZxyZA
         Yj9l7SYdkR6173nI2EmogN+lK/u6jE/uunfoExJ4YnlVwBIuxbTzmuFwyo3vpgUvQZNG
         qhTdbq9o72Yr/aBcefwJqljGKKXMz4zW4PQre1pTEZiNwGpkuYsB6igA9FSUTzhgfCs6
         fU/3doKBCClMgcJXoKr7QiC6TU8FB0VIz0uaFh7kY38/bUnilfL2sFyQVkwvplH3Y4a3
         Yrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801145; x=1730405945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GjbuFUZsYCyvYWy1JdsmNXUZJu6kDs47dXJHb+d6Z38=;
        b=N/3aBbv9wxCYsYEmZV9G/N5h9sVN0yLHrNESqZCQVoKAzSdnVBbXUp8r79pHniAg9+
         Q86HToBy9AqRL46uCQM3rzgFhFID4LybNDvt3Vo+35JL8eM/C49vQTe5xiMefGu1sp2f
         XiK6v/OeBwAp2t8Xk8vmB8hpMxyVXNPHXbT+e7MTW/QA2h07VaRZr14NlJfxLXtmjTJJ
         If8+XuF12t3uB8M3fOGI5NpwPtvvq2+21T6AbsYraaiaZbpaaW0oB9sf4W8C1JGmQXcp
         NPrOS45ltb9NsNtoBzBBJs1kiOwU4i0kwcc47I1Qq7B0GFENj5Rhwox+4/BvQTBy/s/o
         MnwQ==
X-Gm-Message-State: AOJu0YzZQfOjP0DV/c6e6pEcSwCiM/MzsWPQqHR8SoN6MqmV/N9/Wwbw
	8lDABnpnig6qfky/3KLKFl4TQ8EoXOPvW2VfOmtNTE2hmzz3OV9ck23Gkg==
X-Google-Smtp-Source: AGHT+IEYHOIEDi6ry1vojD65lg9m70/hq3Yn1LhrNHgI6+w/lvSjtZx45kSzrpalwidAR37ZVooU9g==
X-Received: by 2002:a05:690c:360b:b0:6b0:70fc:f6e4 with SMTP id 00721157ae682-6e7f0e3e59emr89656887b3.15.1729801144712;
        Thu, 24 Oct 2024 13:19:04 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:04 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 18/42] libfile-slurper-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:37 -0400
Message-ID: <20241024201806.440273-19-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113196

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.014.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.014.bb b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.014.bb
index e29abb3e3..410ce8046 100644
--- a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.014.bb
+++ b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.014.bb
@@ -6,7 +6,7 @@ errors, write functions don't return any meaningful value."
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-HOMEPAGE=       "https://metacpan.org/release/File-Slurper"
+HOMEPAGE = "https://metacpan.org/release/File-Slurper"
 
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
 file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=30c0b8a5048cc2f4be5ff15ef0d8cf61"
-- 
2.43.0


