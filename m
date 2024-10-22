Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BC0CDD0C0
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:21 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.21943.1729612086737835931
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BNaNO9W5;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e5ef7527deso30372677b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612086; x=1730216886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fU76N1F5s4J0SHMOa8TBz3VNZHm6YvXPAVXXa/vJEFY=;
        b=BNaNO9W5tAzjwadg7R42Bq1x+otwt/11jWrUlMx7N26yyO8VSgE70aLP/xhrEnEkA3
         1trX/lV26hC3q5cX9pXK37ZQc69vsmeMqY1oGGqGzRTJUYm/KnA+Z4F97h338Qc6jMA+
         X8w+FfVbx681IdTQ8ouMEPzbJt8Xl6MWh/iU+Ki1PyI3deFrODwlWqRXWSYD7j/I45PV
         8aN79o4MZXQn4YEEtriydDquGrRzBSFLbifKS5LjErbpNcQ9LVADaBh5QO1CX0s/qmhB
         HNMGPGPYASV8HdNAizIBgXqadYVZQRqPjNDxj928mTZ6Qo7Xbw6xeXt7QWijC169bJPB
         F/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612086; x=1730216886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fU76N1F5s4J0SHMOa8TBz3VNZHm6YvXPAVXXa/vJEFY=;
        b=k9ArjkY5HsSx8KZxrK6Y+vmYLUlbSzspF4QzC3aDjJl0uctmHxdv6wcG4yTKTrX4ho
         RRPC1QFiJmZRtdUhK/UjQ4WtUGfkzzajdzlIwru1CfwOw4jWm4eb/8WD/2XOPXPob59l
         jO9regPytT1fTl7gJeaTx4WWAeSkdXKjsoLoLkraTSTwNeHkzanvJByZFv8seMLja0a2
         6SMJCIgKrtNnOReRpy7O79ReUncflUieAEGf5mV3DCEDHhTABxF2aTXWCEGxSgGhxdia
         XPv/XGYSwD3aH7FDhFm8zuaA/ke9DlSSD8L9FoCvTtHsP+DlCD7xvdwWJ8zzPa3WoCU/
         +5CQ==
X-Gm-Message-State: AOJu0YzLxQsQ48YLzWv++TYR0Dv8PtOn9oH9S0e82nHvMlqsbzFbE7Ev
	AnHrjWfrGLSY7AcFspLDQRVUOUCT1T1N5xFNWfyPBz4X8YddvcLE2Thn7g==
X-Google-Smtp-Source: AGHT+IEA6wESWaq3XvZlQNbgNxu/drV3OwbA+NJxbO1HniHHLWU3vKnQ9DBJV4taoihvyx2eouvaPg==
X-Received: by 2002:a05:690c:34c1:b0:6e3:36fd:d985 with SMTP id 00721157ae682-6e7d824d531mr34857887b3.23.1729612085254;
        Tue, 22 Oct 2024 08:48:05 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:05 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 17/46] libfile-slurp-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:35 -0400
Message-ID: <20241022154729.20331-18-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113108

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb b/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
index 1012ae952..3f138baa4 100644
--- a/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
+++ b/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
@@ -13,7 +13,6 @@ S = "${WORKDIR}/File-Slurp-${PV}"
 
 inherit cpan
 
-SRC_URI[md5sum] = "7d584cd15c4f8b9547765eff8c4ef078"
 SRC_URI[sha256sum] = "ce29ebe995097ebd6e9bc03284714cdfa0c46dc94f6b14a56980747ea3253643"
 
 BBCLASSEXTEND="native"
-- 
2.43.0


