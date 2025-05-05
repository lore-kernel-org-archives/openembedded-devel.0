Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0607EC3ABB6
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 12:21:27 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.45393.1746433905983096763
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 01:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gIusFNAy;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736e52948ebso5321493b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 01:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746433905; x=1747038705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPCtOIhn/D8U4BVvlfV7hpWlYPOYFyCFv4cHsvumpbI=;
        b=gIusFNAy+1kLz6Sy49JKhSPf0ZYRMoD06JN9a/4yiax8jomjPyWmnBAlVR0NMz8Vfx
         rQQbv1qR9+9tfjuMg/Czg9Sh6spd9Lr2UUOoH+LrT1cuT9Jy9UAs9DU/vAGU/U8l8B/P
         XyWxtEqFkx3+70DkOCHZeLnfOH3wtn2DcmPlMN5pBSF2Fd+piLF4rys9Wiwy7SA/Kwuw
         3dYK0nDR9z4FH6LcBzIPpNbzKqxX9zmf+zvx3cohrLEIzHEuq3sABusX9Ql/nOd1ghOz
         VjAYPU5us6bUyK63agXIQAfduq50WPTVXrJMHziNQnOtp2pM0kXthVR/JQrM6pkrI0Do
         wZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746433905; x=1747038705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPCtOIhn/D8U4BVvlfV7hpWlYPOYFyCFv4cHsvumpbI=;
        b=ADpCdlIhQzimXWcK2lg/B57Cz9v+IQkyAugaPa0iR8Te0uGyBfbXt1DgLOXUDfDdbE
         BDJNf1yIYKrm6/+lZGVPSPI12R3uH+JwpAX/xNd5hyUUPqqgNE6dwyEq/KqqCuIHOaNn
         uQJ4KZFM1/CNBVPYCX0FAHHb/55LdEc1n6qeypQy0ssJcY8aZ0S6vbu5SBqg5EeBr3Xg
         vI2KRWD2dpwIwN3aUt6lbitkSVFH/LUrSVcRJX6HgFpHphvw21kc4fuHuX2r0P0iO+wf
         LVmgA+Rr4RqZnZlaGQyIlByRxZUJUF8z7bXEKe//PqCj+mCIC845O/uwzH6uAk7XZmIQ
         bBLA==
X-Gm-Message-State: AOJu0YynCH+S2iq6CmTUozGjS8JIb0Q5tJa7NKipUXTMeoeidPZ4epvy
	5IJMRhJM0SNPYDmyyGCk3lxSccZmRorFoIWvCAyeJdyXZJOdJCF6dxKqE0Ty
X-Gm-Gg: ASbGncuNCIuj/RbuRAvqs1lPi6M81niFGipAad9wi74sVW5wBUG1pdp65XLU4lWcAtX
	lHym30cXotIm9Zz4oY8aHSAvT5OzcJlnueCNXFfyWbqUbHA30CkkTex6pibpQlup8W7iP7UIqgx
	7kNwbGjOwjfno6QeOxVDEjLN0e7a5rvZGeP4mz2zSownXv/3tFjVxVQiHZ9xatBpsxkTY6e5lrc
	Bp6r/9KD6IE+F90gI6HSEHK52OjrOdoCNwhp0ttYkvZck6WBcmICICk/c7I3Wo29moGkOzLOnXB
	yfug9tJjtKu3tSX09+7OqLL1hAXBNbxkNfTUaEV2NoM+/PFczd75
X-Google-Smtp-Source: AGHT+IE0O5Z/DSl7pEFPNHTpAgeH/Ob6115ZKSb/TpXVemddnepVIyVZWswAonJkKHtlrtCDXX0KjA==
X-Received: by 2002:a05:6a00:aa8d:b0:732:a24:7354 with SMTP id d2e1a72fcca58-7406f094a99mr9680484b3a.4.1746433905293;
        Mon, 05 May 2025 01:31:45 -0700 (PDT)
Received: from MVIN00210.. ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059020f4esm6153977b3a.112.2025.05.05.01.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 01:31:45 -0700 (PDT)
From: "Ashish Mishra" <emailaddress.ashish@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: henning@itconsulting-heinold.de,
	otavio@ossystems.com.br,
	richard.leitner@skidata.com,
	Ashish Mishra <emailaddress.ashish@gmail.com>
Subject: [meta-java][PATCH 1/4] Updates the SRC_URI for xalan-j recipe
Date: Mon,  5 May 2025 14:01:10 +0530
Message-ID: <20250505083113.815950-2-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250505083113.815950-1-emailaddress.ashish@gmail.com>
References: <20250505083113.815950-1-emailaddress.ashish@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 12:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117305

Signed-off-by: Ashish Mishra <emailaddress.ashish@gmail.com>
---
 recipes-core/xalan-j/xalan-j_2.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/xalan-j/xalan-j_2.7.1.bb b/recipes-core/xalan-j/xalan-j_2.7.1.bb
index 5e72a34..a1f4ea2 100644
--- a/recipes-core/xalan-j/xalan-j_2.7.1.bb
+++ b/recipes-core/xalan-j/xalan-j_2.7.1.bb
@@ -12,7 +12,7 @@ PR = "r2"
 DEPENDS = "xerces-j regexp jlex cup jaxp1.3 bcel"
 
 SRC_URI = "\
-	http://archive.apache.org/dist/xml/${BPN}/${BPN}_2_7_1-src.tar.gz;name=archive \
+	https://archive.apache.org/dist/xml/xalan-j/source/${BPN}_2_7_1-src.tar.gz;name=archive \
 	https://dlcdn.apache.org/commons/bsf/source/bsf-src-2.4.0.tar.gz;name=bsf \
 	"
 

