Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB79ECD691E
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 09:39:56 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.87073.1696930790170394262
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Oct 2023 02:39:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=PIvce6zD;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso5174632f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 02:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696930788; x=1697535588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51IEXaXT+uqofj6abuBXNcPs1qqUnkN9XdFns16kSws=;
        b=PIvce6zD0pJ0Hv+iLHVGwxm0d/0x0KRddZKO1oe2Il1a4H3vyS2GmobfXK/pdCHI/M
         pJl7qs8ND/zzlLpaqRZ3S+xQ0Wh1gq3ZJpSl1pb6/crZl/mP3yJe7rtnaALzybexY/GP
         OGwM9iHbkmzGOwfQSEYnDH6lQlSeDsQqoRE/uDrN1dWviU7sjn0KhTlbP9imTJCTp/tq
         Lc3kxivlyqt+j8zNJYtOalIwK+9V/hjLkKy9+NEsXXLtN/Lj45DyXwP7PmtR0gvqJDZK
         dpWptSbjiPKepkxMjM9h3lYHzs8WAc7lYXAgLXc4SOQyqa4H91Dqvrc67TsgtP9AJJ/8
         UORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696930788; x=1697535588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51IEXaXT+uqofj6abuBXNcPs1qqUnkN9XdFns16kSws=;
        b=bJaO5o5okfkK9vtQNGykSl4M7U2n7y+QhTiWu951Bp0Ckw2zQ/kAKl44yzA7eRpFPh
         FYZE6rGgMOdQ9ImgSwHkEzELqgbMj5eVK9/yC1zs3mZWCJC9H8Khv7X0gx5T+HAMe5Jr
         vPAktIY4jmWVExbj3NJS+Jv0DgIidWNV4Tp6W4eDb6ibhdbmuv2OqiwUs39janxE2q5j
         un5iT629284iwoqpo8WlALIKTZwnnCz0DXd0+bf+2YTfBmLojxQbUXF5wVosoNZL2ITD
         MpYOklhbjnU2GhXoTwdBelDb48n+ZCTXM7k42hOWBTH3Zdyy+HtUK9d9MG/I862iissi
         MhYA==
X-Gm-Message-State: AOJu0Yz+6U7n6HfInz4CY8UKNyTJll/ZVNIuJ3btBxES9JGeVayTcl+d
	OdwAmhgwRndLcSmHbxv4hEpsPiZrq+M+3vwnNjk=
X-Google-Smtp-Source: AGHT+IFJ7HAYBpT0TiTOVVkGzMvHkARvLV6ceJZIakJ9Fpkfi5b135RGo5ayrRr/zt7ubDdEFIMIYA==
X-Received: by 2002:a05:6000:1946:b0:327:e073:d604 with SMTP id e6-20020a056000194600b00327e073d604mr14243636wry.45.1696930788401;
        Tue, 10 Oct 2023 02:39:48 -0700 (PDT)
Received: from p-nan-fatho.home (2a01cb0584747e00ad7461ecf2f04d44.ipv6.abo.wanadoo.fr. [2a01:cb05:8474:7e00:ad74:61ec:f2f0:4d44])
        by smtp.gmail.com with ESMTPSA id p4-20020a5d68c4000000b003232f167df5sm12150639wrw.108.2023.10.10.02.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 02:39:48 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Fabien Thomas <fabien.thomas@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-gnome][PATCH 2/7] Add static-passwd and static-group files
Date: Tue, 10 Oct 2023 11:39:35 +0200
Message-Id: <20231010093940.75037-2-fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231010093940.75037-1-fabien.thomas@smile.fr>
References: <20231010093940.75037-1-fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 09:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105398

In order to pass reproducible tests, recipes that use the
useradd class must have static ids configured.

Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-gnome/files/static-passwd-meta-gnome | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 meta-gnome/files/static-passwd-meta-gnome

diff --git a/meta-gnome/files/static-passwd-meta-gnome b/meta-gnome/files/static-passwd-meta-gnome
new file mode 100644
index 000000000..4502d8bd1
--- /dev/null
+++ b/meta-gnome/files/static-passwd-meta-gnome
@@ -0,0 +1 @@
+gdm:x:680:nogroup::/:/bin/nologin
\ No newline at end of file
-- 
2.34.1


