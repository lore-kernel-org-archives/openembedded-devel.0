Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C17BDD33A55
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:55 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.27833.1730831898347988292
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gWJ7UIYN;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e3c3da5bcdso53351397b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831897; x=1731436697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ja+wAn/9+rhHj+8VN3PH+Ndp3CMzm93jBlXif8IfQuA=;
        b=gWJ7UIYNDnJW5Snk/XTHVWku4GVz3+NcAdnqazh6swcAJ1bPzgHbZfC6wvWqbEVsOk
         viX3HRxZLSGuOyGZuonH5xHaEJF6bl+ez3nEZl5otjxW82rIzIgXPa/+6ukA07jJN9G5
         St8KAZSkf+1d8wQ1S8F+Zqi0dORO0Xv66dr2By+xSHB1Ug93K9ylb7UNlQIBOyBGfywC
         41aIjAqS0ZPZ856NOAep/kMOfCSzEdEIZb/NDzUd/vW4ZKu4q68FDYzY1k2/sSE8uSi/
         Q/uYDNn0njFmx71/LSTZYzPytj2jz6UQd86CNWrHi5qIytZPP0bYgZPN8S/VYQqFeqzG
         YnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831897; x=1731436697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ja+wAn/9+rhHj+8VN3PH+Ndp3CMzm93jBlXif8IfQuA=;
        b=Euw7HpyGXWsM1lSBY1WhXivhhrKX375Ne9apyzvSoI3DbTMjr6hAE37yQJNub/R+9c
         LwvKwNkH69PIB6qkY438Vj0oYa8I7+m1A/ufkmDYdgsXcKdzONG7/GSRaBhApEDlliyj
         npnfDaobl1Q41rNhXVQPjtAa+z/dIsXuhhry44c9NQMstqRGn90SRing4P1R1l/QTEkn
         RdhfzwSQIlni0l3bHksWn9FV8Uu3XrWrZkVtTuGrE6xbyMz3mGmdwt+Wo7KVRJJVl0P+
         9u8tR/MRXoj0lrctzkJhVWo2IH5YfhJ0+BT3VbXv45ntOHoIvLqA/QR3pdBzzPqUak4q
         SE8g==
X-Gm-Message-State: AOJu0Yx5/TvGyYo4g+AP9WwimjdKyuc2DbJqhUunagWh38E0s+LXOiQ4
	ruNBPHWZ1ur8lG5NNFeM778IJe49NpQF31/U14Xt+LIDInkWVOAPz1z+0Lij
X-Google-Smtp-Source: AGHT+IFB9sDDg46HA0krzpl2v5gfrUJABavUFSXw9TQ/3JSwqJuagMAOgJELN93rzcDCeK0g2zxcbA==
X-Received: by 2002:a05:690c:7446:b0:6e5:b96b:6de2 with SMTP id 00721157ae682-6ea3b983162mr264550277b3.42.1730831896945;
        Tue, 05 Nov 2024 10:38:16 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:16 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 026/161] libdbi: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:02 -0500
Message-ID: <20241105183658.34982-28-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113541

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-dbs/libdbi/libdbi_0.9.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/libdbi/libdbi_0.9.0.bb b/meta-oe/recipes-dbs/libdbi/libdbi_0.9.0.bb
index 732291649..9623ef7f1 100644
--- a/meta-oe/recipes-dbs/libdbi/libdbi_0.9.0.bb
+++ b/meta-oe/recipes-dbs/libdbi/libdbi_0.9.0.bb
@@ -1,5 +1,4 @@
 require ${PN}.inc
 
 
-SRC_URI[md5sum] = "05e2ceeac4bc85fbe40de8b4b22d9ab3"
 SRC_URI[sha256sum] = "dafb6cdca524c628df832b6dd0bf8fabceb103248edb21762c02d3068fca4503"
-- 
2.43.0


