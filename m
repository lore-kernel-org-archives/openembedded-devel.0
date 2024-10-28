Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2262CD5B16A
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.1062.1730142299804503645
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O17xK1hD;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e3a97a6010so51935747b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 12:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730142299; x=1730747099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEfPtJP3Lh03XyYUNp3jm7ZWP10HuA5OuMSzIDqnrJM=;
        b=O17xK1hDzMhDWpXgKnRGTFh+0HtH/b1sNzZBCxrH6SpGcciUDR7VNoTGUCM2CPAUSg
         uBNI6ogQcHhAWXve/5oYlM6th/oiBQhxcXhR9G+p3tVqBhEuhIkQY0c9YU8lzrG1j+Lq
         aJvR0xtI4RV9AaRKCq1RLdlKK7JmnSzwxjWV1HqGKcl+qyjlZjjb6drI+kOYi0Ci2bya
         pXhFoy1BdUOY8ZtssldWYY0kWbM15J3aj0I0cVMSDGGoII0JS2MK6pjPzOrUDiZ/u97N
         NI0tGyF5u1k8C+t0uRsUsOcUkmK7o5dx+OMMxMu9s2r4Ukg/xnq5PHiPiUgGge+WwaUG
         ZSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142299; x=1730747099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sEfPtJP3Lh03XyYUNp3jm7ZWP10HuA5OuMSzIDqnrJM=;
        b=e185gGsiRfuv0KxtLpncakixlVwxDogIHztOzt9bYg0He8aLprRUfiTm3moxVM7Ein
         XRGfZtNZblrwuNxBld7ctEvqDdgbpnGW9nV0AqDd9A58uK1UX57/qZZheQ3pir6u+80l
         iuoatAUc1yhX1aeD1VDhfroNZlarTWsuiihrf1OC4rLKipR0Tsq5EsDdyCIyjbz1aICH
         5KbUTd3h9zfUGpl3iDMRsYbUlWicN+FFP+wD126mJYIqBhly5yRJl1pRrDPXwn2BWVgv
         u1HFhYvfBGKqE5Fq4QQ32OWLqWrbdQkGNgCiF+Cz9zEKq7Yay6CHhsM7vh06sJA5bvbJ
         LOJw==
X-Gm-Message-State: AOJu0YyfLKumzWNJdokjOh0eP+PJvUy7xlBnIEnSIocLu+ppq1E5vw/d
	oQsVVypzIHsJawO0RGTCuePR64q1IU32wdgQaSFHzzvWI62L+EoA2PiRsg==
X-Google-Smtp-Source: AGHT+IH4gjCg0wy0U1eF5EscVGHnjswsesmjZrjtkpTiUIo1A7j6whRzgBRGpySSj15wLUg7SkytKA==
X-Received: by 2002:a05:690c:64c3:b0:6dd:cb3e:7069 with SMTP id 00721157ae682-6e9d899d1f9mr96192147b3.24.1730142298399;
        Mon, 28 Oct 2024 12:04:58 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c187e4sm15557237b3.62.2024.10.28.12.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 12:04:58 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH v2 08/22] liberror-perl: Use ${CPAN_MIRROR}
Date: Mon, 28 Oct 2024 15:01:44 -0400
Message-ID: <20241028190444.10522-9-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028190444.10522-1-schonm@gmail.com>
References: <20241028190444.10522-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113299

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb b/meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb
index 15e0ef85c..83baf2a02 100644
--- a/meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb
+++ b/meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb
@@ -31,7 +31,7 @@ RDEPENDS:${PN}-ptest += " \
     perl-module-test-more \
 "
 
-SRC_URI = "http://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/Error-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/S/SH/SHLOMIF/Error-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "1a23f7913032aed6d4b68321373a3899ca66590f4727391a091ec19c95bf7adc"
 
-- 
2.43.0


