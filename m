Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98BC9D5B859
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.134.1730140100010951253
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 11:28:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=liEnMVgh;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e5ef7527deso49199477b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 11:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730140099; x=1730744899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTsfaFhRbrwU8RZE2NkOSXI8BtuY0w2NQ1TON8jSPEw=;
        b=liEnMVghgvQ7Sc783S4adcHpVj4Bm1qGWQSwuNWXzJtlyMM0XFCeTqYprCgYOM7pxQ
         dl+dprvVMn4ahYjzE1mjR5QXiKdBthAzg/nwhDI+xQ6W3CnXrLclHSMo1R6rBBlsjKEL
         TtX0sRSB+VDXRKhiEda/URZ9lfV69e/8Xpfxrcdv9VqJitRySEZ6ab8Xr2VgLOcbVW0l
         gbLK3r7J5jP0D5Lwd9tMBMxYPWUADXvc6fVp7ysq3ig5sUzVLbQ/fAeZDMRDSoLL2FFb
         bdIRnZjA8Lal2jJvro4hR/mXflV5WXy3VUp3CSGgwh5C0LZ+c4YKuURuSWywD/I7OKO3
         ivrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730140099; x=1730744899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTsfaFhRbrwU8RZE2NkOSXI8BtuY0w2NQ1TON8jSPEw=;
        b=Z7ELDcTwNRibi6rPabRGNtp3Xc1dld42VHjAUXXgLSObc6bncO51yEeLyrLr34bX0H
         +0o7pPc5y6JZsHy7wEDxZJKMo0H7xo7SQ2K0mWnFoR8ubLGiOSj7hXqGkIt2lCGFtQEo
         wQ3J8hixZ+Bna90TR0dPWpowsl9RYJf+Q4KKTaaX7CWCpybavqszTHbBYzHmSMRwYdqe
         aHXfViroMZcfQMMQxbEMdiXr/hntcUX3+qicgKdbgJ1C0CUd7CXVgwnpj3MTHwa5sKXN
         3hWGxRncgXTmiI+DyoEjwKjRfn3GrqQBFiEpPXft3cZhmTnxMlAVnNJcVOereKBPNIEO
         Gx5w==
X-Gm-Message-State: AOJu0YztPhSQEpHzezc+cVfUXqjUmTa/nGdqUW9kU5MaIPtKqxLnYqqZ
	tELE9LQ6V0NvTVXJxkeqEbleiZUUSQOgB8MMDUwhW2z/8Z2naE81QoS/Vw==
X-Google-Smtp-Source: AGHT+IFhUTeJZu39YrvQt7vLuqm10cVdl0xoW7WRr3+tZEv8y32pyzimi2pMqKf/bC3OF+TSQfmG7w==
X-Received: by 2002:a05:690c:60c6:b0:6e7:f940:fe81 with SMTP id 00721157ae682-6e9d88d0a0bmr94097617b3.6.1730140098579;
        Mon, 28 Oct 2024 11:28:18 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c770cfsm15493397b3.99.2024.10.28.11.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:28:18 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH 12/22] libmime-types-perl: Use
Date: Mon, 28 Oct 2024 14:20:28 -0400
Message-ID: <20241028182749.5058-13-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028182749.5058-1-schonm@gmail.com>
References: <20241028182749.5058-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113280

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libmime/libmime-types-perl_2.26.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.26.bb b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.26.bb
index 67b29019c..9b4dc1cab 100644
--- a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.26.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.26.bb
@@ -11,7 +11,7 @@ SECTION = "libraries"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=963ce28228347875ace682de56eef8e8"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/M/MA/MARKOV/MIME-Types-${PV}.tar.gz \
+SRC_URI = "${CPAN_MIRROR}/authors/id/M/MA/MARKOV/MIME-Types-${PV}.tar.gz \
            file://run-ptest \
           "
 SRC_URI[sha256sum] = "bc738483cb4cdb47d61e85fe9304fa929aa9ab927e3171ec2ba2ab1cd7cefdff"
-- 
2.43.0


