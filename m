Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F22D33A47
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:55 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.27843.1730831907905748547
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mbNN27zX;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6ea5b97e31cso959417b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831907; x=1731436707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MBo2qqSs2jo2CXanm7lVxaaV6TqQ1PJ+8GSieSodC8=;
        b=mbNN27zX5KAaVs//FzLIsqW5ATaawiJf29XrR+7bpB8DxzQb6fVQ9tRhUg5Zb8HF9l
         8Sxi26Ktvxl2tqnE9rmQKrsFWmBfq8U7ARKWgomzzHG3ArW70/dnlBgW/K07jLN0rpO9
         g+iCpZw7WjGpWdE+f2B3RsxOuopWEc2Z3Qh9ASBtRmwfyhygsrV45+NQ1gjjprsWK9tJ
         rSyGRs8+0xwhf2eJNsBKLVMMUguWg66AFu6IwMdSiqJrxsR+8EwJekS7xjp1bXbv4n5K
         oUpZ+iS6UyZYm0oNhyhBZ3SyOMTxrmyKz7EQmzZmGF3StdzoywB8pjDtO1yVITDUloL3
         Mukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831907; x=1731436707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3MBo2qqSs2jo2CXanm7lVxaaV6TqQ1PJ+8GSieSodC8=;
        b=gLenaUIck2FZwF44AEHC5I7zuDqTzhTL6pAwtaQLYQGb3sSxrFBVvLa0y72I1Q8Z9B
         rVOJympm8eals3FElrUjSktDnK9/MAdBp/0PoclGE6pLbn4r1yR0fHufBtupIyGPCxTt
         AK6kdBwCiQERzdrGLiaIJUeNve7561b6LtEpp8Pti9nIrIQnXaMpgl3YmWGdckYrxZ/j
         eoTtmhWn/quQ0CY83EmUsUstYva/N/+oqNMtqWoNM9oPKOjaeQk47xaPUIrQvVrxnper
         fHT1OlLmBkQZz9l8wl65+neNzk2kCInuuWQkam7aJOrdhm5TpE5rjLySzqUCLHpu71t1
         3ssw==
X-Gm-Message-State: AOJu0YyAgXYjjC8L5cOUiCD2amnsdsQWgs2s6lmhR0d6zXrrHjz8Mgt4
	hwPNYnBRg5G0jDcXGhLHnAjvjN7m/+WPu+T7zkhcs1TswCJF105hdm0GTj/+
X-Google-Smtp-Source: AGHT+IFQHCn3vM97ZvDvH7j+wzWX70llOH9FARQTMPBwE7TfXxvfXAzo99/irXUeRUoo0pmDU5J/Cw==
X-Received: by 2002:a05:690c:6407:b0:6e2:b262:bebc with SMTP id 00721157ae682-6ea555022bemr160589027b3.0.1730831906575;
        Tue, 05 Nov 2024 10:38:26 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:26 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 036/161] libperlio-gzip-perl: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:12 -0500
Message-ID: <20241105183658.34982-38-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113551

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb b/meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb
index 11f6a1ad1..4ce31d6fe 100644
--- a/meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb
+++ b/meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb
@@ -11,7 +11,6 @@ DEPENDS += "perl"
 
 SRC_URI = "https://cpan.metacpan.org/authors/id/N/NW/NWCLARK/PerlIO-gzip-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "0393eae5d0b23df6cf40ed44af7d711c"
 SRC_URI[sha256sum] = "4848679a3f201e3f3b0c5f6f9526e602af52923ffa471a2a3657db786bd3bdc5"
 
 S = "${WORKDIR}/PerlIO-gzip-${PV}"
-- 
2.43.0


