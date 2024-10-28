Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B27C5D5B865
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:26 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web11.1068.1730142304136691629
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dhlA8nJn;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: schonm@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5eb5be68c7dso2561105eaf.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 12:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730142303; x=1730747103; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3xYQxRsxVY74EYytAoazphDAgqTFfXNxKJPwh/Ko20=;
        b=dhlA8nJntbZumkUOfgllSJ2sY1jFZ4dIFJIk3IWQSRJ8i6F/CvRWLgtsx9z1XTHnPb
         K4KWogNJn99YCc7q3XaZ32Afk+vHWJf+JPc2jC80zE8CWPYVIcMxmkB4IoJiC8WVPcgx
         EpEeSsXVUd0b36GuE3GSHu/1LdQYNJuAK7qJ1irsiAJDx78Q3CIx+997Zay9mubs/2Fq
         Brm/q/TcUWwqmoXiF9smCtG6cbQ642moYjZxTLKwO84bYJVX8/zKiADzuSRGBDgLG5OI
         J61xaIVUq/g0MvWrMzt7a5EmVcL/14eHTMUnRCYRJZJ8zw8fJGWvNlg826OhI/ZWjq4V
         IpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142303; x=1730747103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3xYQxRsxVY74EYytAoazphDAgqTFfXNxKJPwh/Ko20=;
        b=kHkSl/eouOotibVAaqhEAtYTlBcKl3CBYQ8CgloK0RTzG4IV1OqCrGT1JKQwxMyJn8
         9xzWLCJHdk+61FCcm6LY5KvnODeWE64hKJ9fs5d2hvU5ikb4kIEDpnTlitZ4juJFSP+T
         QATkdHVG9eLppcjKyXFuqSEKbuqqSdoQjTtVry4sVj4KheJK3qh8WWqXmYJt4E9tbFlX
         wECZWWqdEvbniORizsPkSt6f3tYX+E3fxmIuAkYgN3/G/+ntQf0iu+HPOF7W25skvf8D
         DvpaTufKp/V0qgfPX+lWFSKV2QfbOIIUSPhdDdP4XHFnZDEOhALIQOQ5bFGX7cLXcCxQ
         0iiA==
X-Gm-Message-State: AOJu0YwVOxfYaU1iggpOuhJbddKOdBN5KlGPqAN6ruhtgXiWQ0DJq4GD
	B7dy9wi0TcM6kf2cGoY5fZXQcpEzrp334WIeplemtOo/tqCQmvv+8Gc7+A==
X-Google-Smtp-Source: AGHT+IEE00AU54Ac5jwzbrGdE5LuTwIsui34ZTXQvrFDBWQpeqimZIg5b8NbyXBUFAjc4ny4wpphZA==
X-Received: by 2002:a05:6358:33a4:b0:1c3:889b:880f with SMTP id e5c5f4694b2df-1c3f9f724cbmr320764555d.20.1730142302925;
        Mon, 28 Oct 2024 12:05:02 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c187e4sm15557237b3.62.2024.10.28.12.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 12:05:02 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH v2 15/22] libnet-libidn-perl: Use ${CPAN_MIRROR}
Date: Mon, 28 Oct 2024 15:01:51 -0400
Message-ID: <20241028190444.10522-16-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028190444.10522-1-schonm@gmail.com>
References: <20241028190444.10522-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113306

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
index de85e2664..f56b5a26e 100644
--- a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
@@ -12,7 +12,7 @@ DEPENDS += "libidn"
 # such as Net::LibIDN::idn_to_ascii().
 RDEPENDS:${PN}:append:libc-glibc = " glibc-gconvs"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/T/TH/THOR/Net-LibIDN-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/T/TH/THOR/Net-LibIDN-${PV}.tar.gz"
 SRC_URI[sha256sum] = "2f8acc9442b3866ec7dc63cd449fc693ae3e930d5d3e5e9430fbb6f393bdbb17"
 
 SRC_URI += "file://libidn-wr-cross-compile.patch"
-- 
2.43.0


