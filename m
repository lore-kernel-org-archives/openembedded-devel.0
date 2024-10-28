Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2809D5B866
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:26 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.1015.1730142309245169640
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=akgeTkBq;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e290d48d3f7so4746899276.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 12:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730142308; x=1730747108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjRpGUcf2kELaOGjkjmDxeJLjxEQJX2IrRau7FIXqiw=;
        b=akgeTkBq6wLO4ZD2Q+1h5q2oOR6jXZPZ+hu8ZO0JgxTOKCsiRrB1YwjhEZnrUDNeRm
         aZsHYazlDsDBPrw9Oq/3UyQ7Z6W3Ze4eFd3QyOiz+ALOYlSYYBoayx0RV34D4Wa8W8S2
         Jld0AToOW0T/fM//3gay1JaVsioK3B92ZzlFl0QEODSgX++4shAzF8QVtQD3riu1Mwfw
         SCQWkcuqdQnAFnrjiqQ0xMWXm4y1gvWYODZ4Rvz22iniwgKOyGZYy8YM9PxqF3bLOWUI
         YG9lXm30I1UQmGLM3iz8xAbnzwDzGvJUKwgalp/WeLVn4mp+uHrXQgWWdZNwFxUy+O2v
         xP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142308; x=1730747108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjRpGUcf2kELaOGjkjmDxeJLjxEQJX2IrRau7FIXqiw=;
        b=NujzRex268quueAPrw6mELJHryqiy/QYqCEMxqqd5jqLTPb64N2Id2MCgXih9HstGA
         Rq40FLdAjmHAn/CoK881HaEUyo5S7/RKYz6j72EQmqMmdlv0+c+0RDycTAbWFyy+nz80
         hwTUx7zA9/rzd5XZG6K9AtAPTgqtqUW3GZVx9hBxxnlIxGxQreHkbn4qaj4TYU3gUsAD
         EoPj1qIXDrcaMXSJqxLgjCadf8j/JxoyGqp+Le4po28W1oSbym979DW9mhnpumOkiDrZ
         VPjePJ/gc7yQWrDm1DBuJVmP6fwMTZOrDJ/bsf2miWvKRJV3L0T7I3Ed7esGRdvTOb1o
         NMUw==
X-Gm-Message-State: AOJu0YwEX5W/1MkPgS36+oamoWdaXva6n3qhcY9XuiW4VoPS8a6CJaxY
	Frvp66paY6OeRXKoynFLuBI0tjBhvWctQICRrTBVRh4FY/CqXQDQC74d7g==
X-Google-Smtp-Source: AGHT+IF9cohK5K0zfj4+WzQXZMW1yHx5/3AzfNk457OODp4Krmf1W4GHdjy7YaD90DXWDOlliIexiQ==
X-Received: by 2002:a05:690c:6a0a:b0:6e2:1b8c:ad28 with SMTP id 00721157ae682-6e9d897c900mr92052057b3.24.1730142307959;
        Mon, 28 Oct 2024 12:05:07 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c187e4sm15557237b3.62.2024.10.28.12.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 12:05:07 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH v2 22/22] libxml-sax-writer-perl: Use ${CPAN_MIRROR}
Date: Mon, 28 Oct 2024 15:01:58 -0400
Message-ID: <20241028190444.10522-23-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028190444.10522-1-schonm@gmail.com>
References: <20241028190444.10522-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113312

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
index f906cda2e..d4a027e6d 100644
--- a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
@@ -12,7 +12,7 @@ HOMEPAGE = "https://metacpan.org/dist/XML-SAX-Writer"
 DEPENDS += "libxml-filter-buffertext-perl-native"
 RDEPENDS:${PN} += "libxml-filter-buffertext-perl"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/P/PE/PERIGRIN/XML-SAX-Writer-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/P/PE/PERIGRIN/XML-SAX-Writer-${PV}.tar.gz"
 SRC_URI[sha256sum] = "3d61d07ef43b0126f5b4de4f415a256fa859fa88dc4fdabaad70b7be7c682cf0"
 
 LIC_FILES_CHKSUM = "file://README;beginline=45;endline=46;md5=d41d8cd98f00b204e9800998ecf8427e"
-- 
2.43.0


