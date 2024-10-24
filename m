Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B345D1038D
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:25 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.6199.1729801153717617805
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aE3digwR;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e3c3da5bcdso14241237b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801153; x=1730405953; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmbaDhqFkynshdUI49yiFV1VmxOkFdsWivSlZEoq+uQ=;
        b=aE3digwRqHVeepxqwTaxrnHPXL/RC/E09xLGqz3kKRZVoZJS2cGb1noLncYMALm36e
         Z9BsyUZuqAYZf0DxwemluuJrAoGxUZOjuoJ20L/Qo0SMvtLkJ8Fqcth0zMc9um2LWBvt
         mQSrdWJkOBm/npGdyjWzF3JcSSTJAAQJzmbgEcX0JBHNjKjaSGhuQsrbnRSkL5+q27r7
         78XgUH/HeXY0lLpP0yHZwDWwxQdBgRWdy+7zPE1BRvUT9BIVnYMuNR5t6EEkeUH/9ue0
         y8WpYK2q79LcT2PBF65fgkzTgeuno10Ahb27rrOU5jyZBrkZTY0R1y3cmaQm1jrwIPdC
         ADsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801153; x=1730405953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dmbaDhqFkynshdUI49yiFV1VmxOkFdsWivSlZEoq+uQ=;
        b=ioQbwfTVvo3eINzEYNIBZ/7nx5iWJJeH0BNTom3i1pQjroQev4SBf+9mSK3Xw7j9Ne
         6CZ6Qhk8wKOK4QYiFywvXnVEaf8VEcRnJanZDHA6jVCAyXtsuIa+qCah2us9L3PGIoUk
         8JTt+TNfzngp+fSQdx3a0Y1ly1IPwiWa+mlwMwpjLTRSZySJ8qcaF/ZLZnvnW4my5tJL
         yIdR/MZZ/DSzl1GkXo3qhJ3/sK0wFACbBLkj7P8wog7GGk7TZS3UFu9j5O7G8ZTCKZrA
         rVz4cZxaMZzUfrqDevk/M7SIEXdf4VzZHC5J+HJLZyelLVdLR/1Mpx0IMNikIA2Nt0d5
         Wsgw==
X-Gm-Message-State: AOJu0YyWARcqeqWOmj92MIUhE3VebCXEgkN68rYHGnSryUzxAQOFzACH
	I+eDambxuinlj2WYqlGirfacob35m+gILjQSLJiFtPcKg78vdHiA/5nD9w==
X-Google-Smtp-Source: AGHT+IFUk8hqb3xw/ObKYBOfosyOE2BQYpRisbGXxQUC/qOOHTrHgiThOdUkKfyV9Xclwy2et7hQIQ==
X-Received: by 2002:a05:690c:b88:b0:6e5:a4d6:e544 with SMTP id 00721157ae682-6e7f0e73184mr88772017b3.24.1729801152406;
        Thu, 24 Oct 2024 13:19:12 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:12 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 30/42] libnet-ssleay-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:49 -0400
Message-ID: <20241024201806.440273-31-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113208

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
index a91bb6cbe..707b9fdef 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
@@ -4,7 +4,7 @@ web pages on SSL servers (for symmetry, same API is offered for \
 accessing http servers, too), a sslcat() function for writing your own \
 clients, and finally access to the SSL api of SSLeay/OpenSSL package \
 so you can write servers or clients for more complicated applications."
-HOMEPAGE = "http://search.cpan.org/dist/Net-SSLeay/"
+HOMEPAGE = "https://metacpan.org/dist/Net-SSLeay"
 SECTION = "libs"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
@@ -23,7 +23,7 @@ RDEPENDS:${PN} += "\
     zlib \
 "
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MI/MIKEM/Net-SSLeay-${PV}.tar.gz \
+SRC_URI = "https://cpan.metacpan.org/authors/id/M/MI/MIKEM/Net-SSLeay-${PV}.tar.gz \
            file://no-exec-on-configure.patch \
            file://run-ptest \
           "
-- 
2.43.0


