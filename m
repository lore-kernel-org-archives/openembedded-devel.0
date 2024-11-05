Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAADFD33A49
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:06 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.27852.1730831915389985365
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zf0psCS1;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e390d9ad1dso47722487b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831914; x=1731436714; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sr7/ghIYaEjQiGRzaCVlpvkf5UZq2JzX+Hzza23JEZg=;
        b=Zf0psCS1N1q+3c7eauBPhdwJ842GxSz61wP/rZ8iAgpkqI6RPtHtLXpfgObepZZGWJ
         W+qD5LnhxyDDiTWNPp69jzH91PWokvRFbUKs55j8Xkz6subxcjQGTHBzedyPwa9AaaBL
         c6wK8PPJsrK7IvhRxAjq5XDzvAYH173bW0D6isZkmnlY3qn3OQ5LlZe6Ovgb1p20p5lN
         vRFmylwfRimCBJGTOGb7pCCRSVBVvpkbQTgYQefGgXJQr/a021HlJxU12wMOFK1hd3PD
         POpF6wA+zc2seTonUFA01b2hzqBYXfttZvyToU083cVdoecEtMjUHUc9KK8zdBb28q6n
         +17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831914; x=1731436714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sr7/ghIYaEjQiGRzaCVlpvkf5UZq2JzX+Hzza23JEZg=;
        b=YHUrUsh2DSNXtBsECnEqLCnniaTO0TIl59mcTjnvGyRApT+6ApN+62oPJA9PLZpxjK
         wmrHo7TMj/Jf/rkCrxfb8vXA+a54CbRrOyykLQH2soeZ7L3ZjK8lAaRIFvkXqybXkhJB
         JQ/To4Ub9opneJI1VzViImBxZLh0zC0GSlZicMxr3vVGFi/43Mzrt7qQLT2zXdcRcZ8Z
         CwqaILAm1IQhGA5ME4LZNonRrJJjHGxJ0h3P2zM5azMcomGu+Buo+IKU+4pDP8vtwsJx
         Xxyjshwes4ZVtX8wWfnqbIqYtxe5tsLiSUic1OGCLrClJ5ibYXCo1AE5VV6rOQR8GzYN
         K3/w==
X-Gm-Message-State: AOJu0YxZ6Mas7NymJV+gayo8ASRpSQV5ivI10P9y4oARUpzelDy/nN2A
	ekAv484wR36biEgfDe58DEjyZWNRa1LsOo+BkhrYsHwa4QYg02NLhyhA1cow
X-Google-Smtp-Source: AGHT+IEUhqToTzfXc45HJpkITWJpqVAhh7MAHJ70/ZaDyFxHAsKCbaDpeOJr7NG3LSc/Go0qbPVd2w==
X-Received: by 2002:a05:690c:968e:b0:6ea:84e9:1612 with SMTP id 00721157ae682-6ea84e91a7dmr104534707b3.29.1730831913968;
        Tue, 05 Nov 2024 10:38:33 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:33 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 042/161] indent: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:18 -0500
Message-ID: <20241105183658.34982-44-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113557

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-extended/indent/indent_2.2.12.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/indent/indent_2.2.12.bb b/meta-oe/recipes-extended/indent/indent_2.2.12.bb
index 1a7d61abc..7847b535b 100644
--- a/meta-oe/recipes-extended/indent/indent_2.2.12.bb
+++ b/meta-oe/recipes-extended/indent/indent_2.2.12.bb
@@ -18,7 +18,6 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-Fix-builds-with-recent-gettext.patch \
            file://0001-Remove-dead-paren_level-code.patch \
            "
-SRC_URI[md5sum] = "4764b6ac98f6654a35da117b8e5e8e14"
 SRC_URI[sha256sum] = "e77d68c0211515459b8812118d606812e300097cfac0b4e9fb3472664263bb8b"
 
 inherit autotools gettext texinfo
-- 
2.43.0


