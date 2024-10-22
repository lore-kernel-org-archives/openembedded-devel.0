Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7456CDD0FF
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:31 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.21791.1729612095927843787
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GvENMMVV;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e5ef7527deso30374327b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612095; x=1730216895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnHpH6sE/+lZrr/hFqSkHJpoODCCKWa5ABfZvj8KH4U=;
        b=GvENMMVVyYEP2MceGKoWG8fRuJlnpgAjF3PmOuvZAqW9rRhH1HtSeQhko0njdNoAAo
         2iqRtEekKjeekZ7FhdhbxEluw4nMVPOhKJlTNoiozhspNDez3vc9pczcD0mr3JIqkQw2
         9Qo4hUFjBa79M08+NzuOJiRiKv4QcybCkP/EY1lKoYOAsEmTVpvpTN6EjVwsmUM/RAe/
         dRvLI/xGKmt29nw4jyTdgthLS2TJGDoIiGQmC5Rd47cNJ9tOK8kVrMYGDk/G5VzwQbbe
         aq40d+6jyfTgcMD7N52FibBbVEHqwK+bq1sTq+YaYiixeT1C93LpxkTYqFroh4YfR3+k
         3Qjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612095; x=1730216895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnHpH6sE/+lZrr/hFqSkHJpoODCCKWa5ABfZvj8KH4U=;
        b=sef1CSy0QknRhhY4MnwjGYDQIDbZXW8u3TjjrLkln8cBy6qsi2Kv7qqWbjEIXiuESB
         ADrqQ+EnGD6fjZ72ZBtYc+sZQoSRcPxZMliLD2oxyjIqHPtfWjM0tTsLLWsuJ5er0gi5
         wv0eyx1/ZCJrtHy116+DM3wMCEY6yjSntOG0HLMp2G3P5usprPanisPdF9byOzhfdor+
         gWQeMFEtnqiQeIRDbPxRYz1rrfu5wOvniH8v6EsCyktWLNADOw6cNThUk5taWvGLPOkD
         I/RwYu9GzXRek/uzaUWBncRvlpyfRXegaQhUrN/nd7MtEjqaYLrUM3RZSDxrgIhzv0Pm
         WY0g==
X-Gm-Message-State: AOJu0YzwyY5QaVz1Oq/FH4LG1uIm6whPEoM+c9ZFZhu/4+jUvkbhafSE
	4sIDDdm46KywlyNMNFDzkqdnZaML1Y7JG3G8ELGXxRr3spDHqgdMN86VMA==
X-Google-Smtp-Source: AGHT+IGMQkPfI/+GokqqlaGhsSwLrEKVm+QcFQb0VyTJQ6EhmgnPUepOv/CfOWpcY2gEkyngjbyRqg==
X-Received: by 2002:a05:690c:11:b0:6e2:c13e:20e8 with SMTP id 00721157ae682-6e7d82aa0f9mr31762747b3.30.1729612094585;
        Tue, 22 Oct 2024 08:48:14 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:14 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 31/46] libnet-telnet-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:49 -0400
Message-ID: <20241022154729.20331-32-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113122

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
index d1365f269..d90b47d21 100644
--- a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
@@ -15,7 +15,6 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=4;endline=7;md5=e94ab3b72335e3cdadd6c1ff736dd714"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/J/JR/JROGERS/Net-Telnet-${PV}.tar.gz"
-SRC_URI[md5sum] = "c8573c57a2d9469f038c40ac284b1e5f"
 SRC_URI[sha256sum] = "677f68ba2cd2a824fae323fa82e183bf7e3d03c3c499c91d923bd6283796a743"
 
 S = "${WORKDIR}/Net-Telnet-${PV}"
-- 
2.43.0


