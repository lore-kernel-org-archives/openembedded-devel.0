Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42D5C43602
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 16:22:50 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20738.1782663768931668364
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 09:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oaVnQ/mp;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30c965eab27so4341012eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 09:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663768; x=1783268568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQvGf1OfHryZPbAfBGw0+fS6JeyK4OXFco3HxwXt1OY=;
        b=oaVnQ/mpM1KhjP4ITUHcOvVOphZeabG7SFDxVTOZnwL9MpF21cSPm2B98Mk1Xh3ywo
         bLAqKN2EdMd4m6liWv8vl7zVh8Tv5TwFP+pqM6iENkSR02EFSLX/Gsyofn/8XvDBNvuE
         ZAhguclMPad9s+W8DYZ6XCd+bEK01blvjoyzxVtBZF15uxZsiiquROJwMVv8KGEG8UGP
         W4tvjDmsoxRz4MyG3aiGV8IP254Lx7HTWQalgJ9bLRSGwierkdWk4moJXLDEKnffX/zD
         WfZdCYTGFH327bQ1ouD+XXgVlcZ+8tIzedibXbmuTWa1omFKE0pThKVnVNgHBgQtUezw
         AwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663768; x=1783268568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mQvGf1OfHryZPbAfBGw0+fS6JeyK4OXFco3HxwXt1OY=;
        b=pqUy2ClMHZ0Szp4RzuGAsSz6NCHZBrd5zL6r169YmI76yA4HgNFtvk9sFuVSQSoaoZ
         4W+k5Eeg9iKIBtHT64CNrTjTc6pqgsEgGxMzhcmDlIEC9ngTBoGchq/HAHDruqgLW8/g
         te7yMSlrBNLgqDg3flI6+bnhm43LoX65lY0vNKq3YpTHNKnCpdnvOAfHMtAZssLUzy7e
         04IbO7lS3asI1R5+Jb9qfmQ2JxdaIJNOkYduj1c2MvNmRr3KQkleqIhH95thf1Lq+tnN
         pd83zyxYH3E3CSDJNeR5xujPgDFvC9y1aDmw099EHZI7LKSOhlMmnmzSso6ZEzaik38t
         4XTg==
X-Gm-Message-State: AOJu0YzoBUuuyYhAgH6cMzE7PGA5FuAl6m5flh4Cc9klg+sgCgFjwEWy
	ydnhVjc9k2oBFZqz1lFtxkwtVZ9mO3KC3js/G8eh4EgE+9dYQqDnseaKeEN77B23oYEWCg==
X-Gm-Gg: AfdE7cltpjTDAENnl/XVl9kD1UHCdEdtoaq2o0PMeUraEuGeMLzXyNJgYzKLvqjZjV0
	6KfGzvgO1wxjLQbN6uLe/vTZZAZgN3m6k+nVMx2B5kXO/ePT4tJ21wRAwReJ0Q8CZ0kpP54sJ0J
	Q4E0SWD+a1wOGlAZqk1o64MwQ+/jUKkWRAq7bydfjPgRxhapjHcLF8YreP2EtdP7R7WioeVPh8l
	d0FX0dp0ZfmQI0cwvMM+YZwX224aSG7pbrK58pQ6b93pZbA6LAE3wG+iHdl3mZQ0vgeDojINs2p
	u2LvkHTj26X9dCTL8anDr0+pABgE5pXlmWhijPydsFOjZQeoLts5tgHSsZ0oGX6aktQJiyef5IL
	qGZJOyhl6A7EmVo7w06bQIruXP+0ujG/M3uqWBmbtlQ8tQpDqyIJRkyhQKs+EE8V7cb5hqyPf7U
	/QMVPuh+c2b3VBOUEh6q6LNDvQYYoISX7lGkSJKyLO76ADHXUiVHXAMCwy/Wsrk9fZClU3znnp2
	3smBOxaLkt4wjUxOYAAiSShqj6JxEoIwv35ZzGixUocGbZooAo4XZa4HrH5DG+B3w1m9jsxfx95
	fukR6GnFPZv3A1bHl4YQhfw/qqtWuQ==
X-Received: by 2002:a05:7300:748d:b0:30c:ab4f:46c4 with SMTP id 5a478bee46e88-30cab4f495cmr7384371eec.42.1782663768233;
        Sun, 28 Jun 2026 09:22:48 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm49849445eec.7.2026.06.28.09.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:22:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 123/128] telepathy-glib: relax -Werror=incompatible-pointer-types for GCC 14+
Date: Sun, 28 Jun 2026 09:22:17 -0700
Message-ID: <20260628162222.4081517-23-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
References: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 16:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127933

GCC 14 promotes -Wincompatible-pointer-types to an error by default. This
release passes a wrongly-typed GDestroyNotify to g_ptr_array_new_full:

  telepathy-glib/protocol.c:1794:42: error: passing argument 2 of
  'g_ptr_array_new_full' from incompatible pointer type
  [-Wincompatible-pointer-types]

Add -Wno-error=incompatible-pointer-types so the build completes.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/telepathy/telepathy-glib_0.24.2.bb  | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.2.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.2.bb
index 0c88cbe65f..6bfffd40c1 100644
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.2.bb
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.2.bb
@@ -11,6 +11,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 
 inherit autotools pkgconfig gettext gobject-introspection vala gtk-doc
 
+# GCC 14+ promotes -Wincompatible-pointer-types to an error. This 0.24.2
+# release predates the stricter C rules (e.g. g_ptr_array_new_full callback
+# casts in protocol.c).
+CFLAGS += "-Wno-error=incompatible-pointer-types"
+
 # Respect GI_DATA_ENABLED value when enabling vala-bindings:
 # configure: error: GObject-Introspection must be enabled for Vala bindings
 EXTRA_OECONF = "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-vala-bindings', '--disable-vala-bindings', d)}"

