Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49341CCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 20:02:07 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.28801.1759867320307311205
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 13:02:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F6Cy/sBf;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-639102bba31so10912677a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 13:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759867319; x=1760472119; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=alyxOA7fMYYQizNE8/bAluihjVYqX066sOoVFuLyWwQ=;
        b=F6Cy/sBfEHZj/pWjU4e3Gsa5PZtO/k5avRgGlwDP+kT9mpSrZ4yEgAo5EPla/Clzz3
         OLKh7YiOPTit6J7PsAixbA1UHhCfKt4f2VdET4gCMV60jaKHx5esgosfQQZ7G+qvkaSj
         Agp1PWBsEjqGI7ZVI067RG2Kx2i3DcVHBdr4ZIMthyaiZi88Br5DNKJBZBqgz9As7GRb
         Z+8IWM7ciLUX2N8DtLM5uUfEQg5r6quLM5GWpS9VZIM5rTuKlQVsK8DJQyL4RJRI/jt5
         PG45a4Gm0IwStY9QBN92k8QTzeLrmVNu9K7L5GYPyNy+aw5FF/VXcMvOTk39dzEPgulo
         L/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759867319; x=1760472119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=alyxOA7fMYYQizNE8/bAluihjVYqX066sOoVFuLyWwQ=;
        b=vN59YXKvhwTkh8lgxEMxXQaGL/MYYTttPrs5cfAxwO8r8DE6xIUSsrb/BTHfaTsWiF
         kqShtbMzM8kHI7zGUB2MxxFe1EOEMDr0eu0SMtIexvwujvAkY8vCS5MH7NJ6Vy96baap
         yTrBQYRR2KWls1Z1MpY05YQE0dLWPI6Qz4JM3jHYdNrQZU6CrkmffvgeNZL0OJBUNjz0
         G5eqit3VpSwo36KLUMQhbzRerB4nBT7TJWSfkKniF9NOmoWIQVanlK1dZrkYU3ZU3/pN
         srF0wBMdNC/6RQKWSeZNYSshF9JQzKY6NxxzfomAaRh9QqXvNQA8sI/cBZDyJ7ms/ChD
         59Jw==
X-Gm-Message-State: AOJu0YyKn2dnBkBbNwHF7SO7crxFlM58CXwSCKlMkBnOfpcANw/41aEe
	D6C2gjtDAjPBzY9rTT6BBfqtqi3RVNincgvyfkqUYVX7BXXGMMGY9st956srUg==
X-Gm-Gg: ASbGncuAen+OI6LMLvCjYyeQ4+s55F9GDzoWjTyRbtQM2hiH3KJZwh7z2QruBoym9P7
	pV49JBWr2Yb3VXclkDN6x2wTIglNX2rNoPHY4zlfj5fifXjsTLrtHf+A+/kyUu7mfTQfhThhe/j
	h8y6aCCcPLHQYEIn+QJ0DKahM638wxWGp5Lpov3PMNr+/7WmzfNVu6AQk4BkTto6FK7ok2MDXhR
	iPtRKVu4QwdKpsTG0C023Z0Ib4qKrtS/eBIOsSgq6koXzDIdliCDzCjU+FGRa+pFK2RCp58WYLC
	UPP+hq/xzEUeNmrDQvLh0NPtqEDo9HhNRHBlxJ15E72sNVXCafxcgPD8eW/K1kLNgNY6BxZqImh
	w3PerSVBAPI4tpiJQg17NJljBIxQ9O4+5hJHQbub1WDr7
X-Google-Smtp-Source: AGHT+IFDZhkYo+krk8IrAaJMPXcdHnTMp35s8qw72yUqgBTGQlRXh7QRlUbM/sktY2r7Mz2C7/LHIA==
X-Received: by 2002:a05:6402:90c:b0:634:cb54:810e with SMTP id 4fb4d7f45d1cf-639d5c57aa7mr553136a12.31.1759867318544;
        Tue, 07 Oct 2025 13:01:58 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6376b3ab4b0sm13146982a12.5.2025.10.07.13.01.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 13:01:58 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][walnascar][PATCH] python3-django: ignore CVE-2025-27556
Date: Tue,  7 Oct 2025 22:01:57 +0200
Message-ID: <20251007200157.147834-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 20:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120350

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-27556

Vulnerability affects only Windows - ignore it.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-django_5.0.13.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.0.13.bb b/meta-python/recipes-devtools/python/python3-django_5.0.13.bb
index 801083833c..2d08bef522 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.0.13.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.0.13.bb
@@ -7,3 +7,5 @@ RDEPENDS:${PN} += "\
     python3-sqlparse \
     python3-asgiref \
 "
+
+CVE_STATUS[CVE-2025-27556] = "not-applicable-platform: vulnerability affects only Windows"

