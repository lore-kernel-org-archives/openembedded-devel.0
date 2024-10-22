Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7379CDD0FB
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:31 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.21793.1729612096618198126
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MHjv8eNR;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e61a779148so15105017b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612096; x=1730216896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6Ucd0glbNeHYBU+OU/E/OSkifHQ1FjQ4Y2YugXRMAg=;
        b=MHjv8eNRhTSnAzw2W/duex/R4Zu7b7Ts/VxBoBjA7Omb5jI1eeZUtRhB1PzYHmye1T
         vV7VFIifyY8zGaCdOKt7PuLlNnpdTP9LQYRFBpRQR+rTu/Oks9KmERRrkQ6tE974UJGP
         bppABnHrgAJdB+NZzgKjkiVjAlLxBqyqHOZHfRJMelmP29+VWMFReIUAbmAqWF1ag5uC
         3HucwCN6Y9t+a2GoQDxeTgxmANtKXqQC5tHs5G+gJuLVP9H/6M+4zMLbWLD69/X648l2
         YXaAWNQv9vnKwcqqWjVBhDEAelo9ofGfjwCSIXs7PMUqt9wBLr2phtfuC0v8OY9cvL8A
         cK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612096; x=1730216896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6Ucd0glbNeHYBU+OU/E/OSkifHQ1FjQ4Y2YugXRMAg=;
        b=UhbLsifNw5IkIyw+Ar0ne6dGhBFJqPhAsciM/GoQwlSlsFGANzObunf/qspqm41ylH
         rvk/rbb7x6Tg7lWxkKXyDAkodXPqQM5lXR/iaDETH7QL7t5Dp5JbF17elSOHoBSE+Ww0
         94Ll5olwmntGcr/C1iTuFUsDHThTKj2/NmbsoTfvmMsZoIwD+dWSq0IndzHlZJwWCRjw
         FMtIDEV63U6YXoUb1naa0SRXVQp9tyGGU1rsPq2r9saRUOMmK/7UpNRylB+WcZFEPpeh
         Ea7TN/uppjYakLw9WDgD4Rc95OOHnG8zLlfYhv7VRFepEgKCI+XPT/791vqfW+sZq0aU
         TDRg==
X-Gm-Message-State: AOJu0YwjLS+fUUoRZ0UfVyhcjURtLOYY1pAT0XFdpmRpP0fmYytgvq9W
	pkA+K8K+PDPmOi8AegL2H/ECTIVSlzmOD3AS1CCC9bf3FYwmaxC89utD6g==
X-Google-Smtp-Source: AGHT+IHc4QSYOqgupxDfzz/g/61wtq6z1aPANTJnI18+xPTEzaFJGXodKC8g6Ux8f4ozvkchWk5siA==
X-Received: by 2002:a05:690c:338d:b0:6e3:1537:3d54 with SMTP id 00721157ae682-6e5bfcafb83mr131758777b3.45.1729612095331;
        Tue, 22 Oct 2024 08:48:15 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:15 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 32/46] libproc-waitstat-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:50 -0400
Message-ID: <20241022154729.20331-33-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113123

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb b/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
index 643a704a1..5e4c71b70 100644
--- a/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
+++ b/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
@@ -14,7 +14,6 @@ S = "${WORKDIR}/Proc-WaitStat-${PV}"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RO/ROSCH/Proc-WaitStat-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "b911bd579b6b142391b21de1efa30c95"
 SRC_URI[sha256sum] = "d07563f5e787909d16e7390241e877f49ab739b1de9d0e2ea1a41bd0bf4474bc"
 
 inherit cpan
-- 
2.43.0


