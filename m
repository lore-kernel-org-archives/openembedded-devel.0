Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76014C02198
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 16:47:00 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.25675.1739551618256976374
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Feb 2025 08:46:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HaCuhT6t;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43963935585so21134995e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 08:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739551617; x=1740156417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8CTK4NsYJEcAnyL0OpqGv9PCS7x+Ud4b4mu0O8tHDOg=;
        b=HaCuhT6t2VvuxhnrDrVVFmdGm001zjVQgEY4shhHzuh7T7nwIrlWI21Wl4fChz7zBI
         bieU+oyEl98tkKrnpDOgDYOWZ+JuSQSEW9U6Ri4h8okxyjLp8WgUC8L8uRUmO7FLqcPv
         8TqUOZACohOr3tgjO3zSYraJZl0db+7I03WD3Jo1f3/yca3sNGG7TV/O+bwh9b7LXs4A
         Bx7WxK+kR/lqkvLOrhvOS95ieVY6cloEDj45tiVE8/M3JIPWu8HqDZtdPbzV2ZkGZgoN
         VJEj+ETOi9lOAtCQz0mjRbdgEhTEZd2GnRXmeR+hjbnLWE9GvbEXXupDqxTVNrJzLNwC
         J3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739551617; x=1740156417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8CTK4NsYJEcAnyL0OpqGv9PCS7x+Ud4b4mu0O8tHDOg=;
        b=dj4tj0LsUXMqtLJfqINbv8nJyFLBNiOe12piTDTD7SET0crGTkDyne+0XJd902ukbV
         fP/ET8y4tCu0TQYdUQxbROs06EZYgWRyBoMuf2I5ZF9Fj2cTbhTkpDdxoYtXcVq5JFc3
         62Gt/ZqXh8bPDhl9p1ygTWWX2/KwXlSWUAO5Nh2HrwlOuNUWPMFncc9mvKRH8ZEjSTl9
         xH8QweDwIYX7CWweKUNVqMzxgKJqLB6GCxUiOfP/HnktqtvsKeT3qQ3d6rLt6sjGZ4r/
         vkOlili44QxqFBVTqjzFtM1AJtH50kZqxyc3SEgn0LMOo8Q6dvYy6NDmtf7XFIHV6b7B
         xIMw==
X-Gm-Message-State: AOJu0YxVDZa4Kh1BLarM7KldI4KOBGWUv8DZinnvBbXe5Lm953TEvtjU
	cluaPh5HmQpt2VPqYG48mfKRWSWO8zFzkstj3HQKOUyjmJQ21aYqE/pXmQ==
X-Gm-Gg: ASbGnctqWCyHkI1T+XxFwpEh9JBjHHdyyu3x0WGvjpvGxoQu33b/XfDS9kBk1gGOTHL
	mJEG5VotV/bBOWYsNjT35s+SLidM3nV18TovscU1+C2D9+fyrIPfrrBl8o6S6wK11QV/1qpcUcw
	BfV9BC+O/ufS5Fpbz790Mz7Oonu/5vOTRN+1o58cq+TuG5VCx/pjc3MVqVyVrTLRhvb8KAUgEIG
	O6pNmmjHiIDutqp/gHR9qXyiQUPZM5txy9SxZHo74/HGxJfvHYMcA65qghzd5ijIu+pA24sAZoO
	4Ynaasio4qKe42nH5HmpTutAYLE1xbI=
X-Google-Smtp-Source: AGHT+IE54wdRZhwfXh7v2+008/oTNqkLFzQH9lf124frC9ayzDM3vBWp6JehEFn55oyX83AJ/N3Snw==
X-Received: by 2002:a05:600c:3d99:b0:439:614b:1c15 with SMTP id 5b1f17b1804b1-439614b1f2emr99895535e9.13.1739551616243;
        Fri, 14 Feb 2025 08:46:56 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a04f8a2sm79518275e9.2.2025.02.14.08.46.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 08:46:55 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: remove WORKDIR from documentation
Date: Fri, 14 Feb 2025 17:46:55 +0100
Message-ID: <20250214164655.97821-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 16:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115489

In case docs PACKAGECONFIG is enabled, do_package_qa task fails
due to some of the generated html files are referencing the ${WORKDIR}.

Delete it from these files.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-multimedia/pipewire/pipewire_1.2.7.bb           | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.7.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.7.bb
index d2aede6d49..8c486b9c5e 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.7.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.7.bb
@@ -391,3 +391,9 @@ FILES:gstreamer1.0-pipewire = " \
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_install:append() {
+  if ls ${D}${datadir}/doc/pipewire/html/dir_*html; then
+    sed -i "s,${WORKDIR},,g" ${D}${datadir}/doc/pipewire/html/dir_*html
+  fi
+}

