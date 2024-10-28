Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74276D5B845
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.135.1730140100396071662
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 11:28:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mw90yNyj;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: schonm@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-718066adb47so2687868a34.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 11:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730140099; x=1730744899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvpnJBRCwNuT0j0WsH0diuXVIsz4AFl1ytLXmrAWa7k=;
        b=mw90yNyjjniSBYd0GSWtVF8lYjsS0SN75bjD+SoxMTV+oll3KhQCHa39XdClY9pJKQ
         USjvKcQVkBIcmeao0HVVqi/lZd/u/uWWRdBsh1QHGnXF2QcDBHCir2UYZD3ehIBJrj8h
         KAJZy0zgSjIKYUWe0HliRpioANvH9UIb1NoNq+lswCo3/SRiCfJHZhFnhJQwztPbo0AZ
         6RmjU15ztWPmGOLEbWyJ87SyhZ/jwBRgCzBT+5Hj/gboOVz3ghWQ+CVoGd9EujbvfWd8
         XcWXflUeqYTsIj3MqoYx8cGQcqovCMlBoG9MUrCqjdkApfnk/r5KXlxFvJbdMb+PazWP
         F8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730140099; x=1730744899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvpnJBRCwNuT0j0WsH0diuXVIsz4AFl1ytLXmrAWa7k=;
        b=NYZ+jp3o3Jt4NrDmRIAIS9Z3QPIbBBqjUFZtQRuoKNlkzmg8l0OJkYw+D66EWR+lYO
         vS2jm9foeCZk4L34fVjUNM1cyDPjpVaEmSCBKI1AVzktY3RpR1Z76So6aglt9rIzj95y
         8TSNhoOHq0Wl5QBTGsYYmjFFGDyRTsqwPdh20JB+mKqyMjVomJsRmj/TGC+ixoujDMev
         2czd5QNcuO9dtsKE7qc682pV7DPNOyXoS9kzWUbLb/lKUgUT5ciq2sBaWBagMXjxgcLs
         mKkkA9peD7GCr+gWGrpfL3LE+2zU2jHf5v3KxP0so0qL29l+iVfL3owDa7cAUKpSlEaw
         aKlw==
X-Gm-Message-State: AOJu0YzLnq66G6auuhtvT9lF/4FGx8MDGqlVVhLY6f5JT5jxQdToY//m
	mhP+XHavI1jiOEuTltzn2ST9CTiyNIiTSSl1vbX0PGqM2DgsrSVeJhuw6w==
X-Google-Smtp-Source: AGHT+IG/LkXfJ1PpNYpDDsE1cpgoy5JXi7Lg8uI8RYNKaPu+wNFBRx8ZxZJQX/rV7f//r5/jMl1g2g==
X-Received: by 2002:a05:6830:2d86:b0:718:8651:86ae with SMTP id 46e09a7af769-71886518a3cmr1701189a34.13.1730140099313;
        Mon, 28 Oct 2024 11:28:19 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c770cfsm15493397b3.99.2024.10.28.11.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:28:19 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH 13/22] libnet-dns-perl: Use
Date: Mon, 28 Oct 2024 14:20:29 -0400
Message-ID: <20241028182749.5058-14-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028182749.5058-1-schonm@gmail.com>
References: <20241028182749.5058-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113281

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libnet/libnet-dns-perl_1.47.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.47.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.47.bb
index de979cf22..e83701397 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.47.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.47.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=252;endline=269;md5=de95b6a896d5f861
 
 DEPENDS += "perl"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "fec3dab10ac82dbac26b1ae2e367909256f420835d96cda7dc1b508e29938f0b"
 
-- 
2.43.0


