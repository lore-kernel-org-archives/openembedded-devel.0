Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C6FD13588
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 11:19:50 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.45212.1730095922745874272
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Oct 2024 23:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Aim8hktL;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ea0b25695dso3031517b3.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 23:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730095922; x=1730700722; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6cByHqzAFbvcE0ZHC5XLoN2lidvNcZEqFGvV7nOdcQ=;
        b=Aim8hktLQ6LRaEsOW5JwoPRKsZTMT92mFiQa2PQ7YQQ2A3eG6TMBmh1T0K2uGL7Dqx
         oAUdX58baE9JIeA/H4V2TT3qRe0NyPgYDMjaUZ923qRfNEpd6fjV60gYcj5fI4jfdOm3
         ecf+Dqi1Zc6lD+szzQE9rlXXZkFwl2/qudlH2T1A84i/CrLJcRqBNlJDttXvKnSFvEs0
         Mz2/gaIUc8kJv+ki4OkgzfPxY7cEc3jYOA+aXRvni3jbn30PFqXxSMDS6h6t01cTukt0
         ZkZAT/iFwmBR7mi+GXDb4NOJVWJ8KPxoBs/A4hhy1mBKBPGovmSP2b2KfBRCWzndTOEq
         LO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730095922; x=1730700722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6cByHqzAFbvcE0ZHC5XLoN2lidvNcZEqFGvV7nOdcQ=;
        b=YKbg/729O6uOeDTqVhyETDafjzXOHappuqyg41qzhJMw74HlU++ASkFCLpAFtPC2fd
         gZ2j/FS6dpPGMNlZ7abVdXXRIYziayylRNp1k9ED81AIYAB9FqiQjkz7E4N4bzcGhPvC
         7YR8Ik7lfeN5rWZUx9RTuOTK6o7jMs0S5N1RnLal8MKVB90qF+z6bKQu+835g86u290o
         bpOe/6V0WCAgE2zyKQ5h4GssqMQ4kEKDUsQwGTuj8r0uFNQGAB5+RAz9A3AUJKKmc59v
         D701GuXO18ZFoUBbvYsP2z8aUQ2OmsP/BmdBmYgnsscneeLSzCoXOMZNHf8Uuo6PWCQB
         9U6g==
X-Gm-Message-State: AOJu0YycUb4K5g4zDvZI3iAWHE7xuz5fDYJnpey14nRegeP0UDnCJuUM
	UDxmMi5uQBYa71oPpGbjF/aDnrp7XlxsmvCo9X4qvuBVlEAmnUgfGrTdKw==
X-Google-Smtp-Source: AGHT+IHM8D6p7542hrw0y41/hwRMO3HGZ2+KGVnZ2xcKdPI0mIwiwoO3n9PZM1U47JYSfUCKXzEeZg==
X-Received: by 2002:a05:690c:2b11:b0:6e3:2ca6:e666 with SMTP id 00721157ae682-6e9d8b1501dmr51344517b3.41.1730095921449;
        Sun, 27 Oct 2024 23:12:01 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c77305sm12868947b3.90.2024.10.27.23.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 23:12:01 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: ticotimo@gmail.com,
	Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 2/2] libmodule-build-tiny-perl: fix QA Issue: TMPDIR [buildpaths]
Date: Mon, 28 Oct 2024 02:07:48 -0400
Message-ID: <20241028061153.2165048-3-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028061153.2165048-1-schonm@gmail.com>
References: <20241028061153.2165048-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 11:19:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113259

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../libmodule/libmodule-build-tiny-perl_0.048.bb           | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb
index a662b4540..bab9c5c95 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb
@@ -21,6 +21,13 @@ S = "${WORKDIR}/Module-Build-Tiny-${PV}"
 
 inherit cpan_build ptest-perl
 
+do_install:append() {
+  sed -i \
+    -e 's|${TMPDIR}||g' \
+    `find ${D}/usr/lib/perl5 -type f -name .packlist`
+}
+
+
 RDEPENDS:${PN} += " \
     libextutils-config-perl \
     libextutils-helpers-perl \
-- 
2.43.0


