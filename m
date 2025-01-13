Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02231E7719A
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 04:46:14 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.10197.1736743571044843858
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jan 2025 20:46:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OzNtadbe;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ef6c56032eso4856956a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jan 2025 20:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736743570; x=1737348370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6IYLjD9D+AosXHXUzX0l/PFqso/HbHaCYNCEsH7VVtc=;
        b=OzNtadbe+h5TqeOW4dJ5NQY14mmWEGVqamYz6cdwicZM4pYspejtHCsTCHIXznKNY4
         hcYicLmIET26LqNCORQunvYVjBRjEqFlfUHoIE3yzqJnfW2FjdAdmrcwIypgxwLhi28q
         5mtichTQ1dAm5hS6JdKvJu/Ke83mBfnighFbzKgktrNXJJpvaDoIB6eCKNavEWHvdkUP
         Gy9pvhM9C3HUNvpzxZCF3lJ1nJ/+qRjzWG6DrjdrIJbK/F/ntYgb0HokXEfS56wHce+Z
         UqI1b++dSDJeLJJJfA7OuQ2k57DCNtXG5x7zoMRZH2UbOT2uZQFdhce5FiOs+wSlTMaZ
         39uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736743570; x=1737348370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6IYLjD9D+AosXHXUzX0l/PFqso/HbHaCYNCEsH7VVtc=;
        b=tx9LsmA97DU1dHPhOnxct+mXOWwrF45CmeeBNjC90c6MsXEJouJv7HHSvIbbISIHl6
         z1GtRGNP2N6cxBRpBt7OKXnoIYm/Oy+9E/Txg8gNuulKps+oLYP6tcjBJaU+Bwj6FOcm
         cf0rjHlxV5DfCvns7egxQIC2WCe+iDSYAR1vU9aPHU0i7FaJ1z9d0dSTbPdyTaCpZ6/I
         tgd82lzQJydh9aQI8B0h81EypoWoPdfI3PDv0AGDiSTlhWyBHLKs0vUMF0GX79QZlJbr
         VhKvIosBoR87I38y4npk495sDkmytnNJRplq5fp5GimRkjvrXariEuMLErt/mApP5ncY
         OrvA==
X-Gm-Message-State: AOJu0YzhPpiOi/BfOghbuXpCBLIwpMPjq5EOs+3/E6B8S+dc/SrwJQ/M
	rwth4H2tI/5IJJLCxqfeaLTl6WCpdB1oKQI8hi9TJUWufwndXra+kRI2yPDs
X-Gm-Gg: ASbGnctI9GVP26R55OiNMpJSTAUS5vU6eesHfvYOqjt/QjcwhbR8Jj8zMIDdyjYB19S
	nvJXBNWR4m27DtmlgmulWI5Cbi29GXV6dVsexTrAfugUc2h/3qFPpAsd+w0XMftekN2pzKicIs/
	lma750/MEag7No2tanC08Ni/Dna6jAsbgeVkuR/+cFODF34bOgF4an9+Mjx0idFu65++qqR1NT9
	740Wo4ZUMnTcDDTEAcsY+fBuHkWmh3K9p+qXCEPfXKVYFFv
X-Google-Smtp-Source: AGHT+IEpJd5UD62j6TDRF5+wNLfRdn2bY0J62YNzFY3+q79gpTbj8faJaPecJbjplUEi+1lLFNN/kw==
X-Received: by 2002:a17:90b:1348:b0:2ee:cb5c:6c with SMTP id 98e67ed59e1d1-2f548ee54ccmr23764487a91.22.1736743570116;
        Sun, 12 Jan 2025 20:46:10 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::65e9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f559439ae4sm7614921a91.30.2025.01.12.20.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 20:46:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 5/5] vsomeip: Skip building, needs porting to boost >= 1.87
Date: Sun, 12 Jan 2025 20:46:03 -0800
Message-ID: <20250113044603.3467963-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250113044603.3467963-1-raj.khem@gmail.com>
References: <20250113044603.3467963-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 04:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114825

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb b/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb
index 14fc4190b8..e17d98d22e 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb
@@ -76,3 +76,4 @@ FILES:${PN}-dbg += " \
 FILES:${PN}-test = " \
    /opt/${PN}-test \
    "
+SKIP_RECIPE[vsomeip] = "Does not work with boost >= 1.87"

