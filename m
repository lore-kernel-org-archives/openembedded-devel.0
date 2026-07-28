Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D31AC53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 07:21:22 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6537.1785223279380104442
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 00:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=s9Cf+677;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3811f512167so3311469a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 00:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785223279; x=1785828079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T7R9i9njfDdwJzlWO1z5tPMWnKphz3iqm6UJQI2a+0o=;
        b=s9Cf+677oNYyFVkayeNq4Lj1MdJ3mFjpvzeZRgl/5xJH2fDbX79zmc0KvEF+H8qZma
         36W74eGgbFjN3LFVZ0kw8EJ+ZrGHk8IVJst7TGGZmtPgS2enmJnGTZMTAM0tXrRFDwCU
         MTbrjJEZBWIlpIkFPbGM5I2UYIwPa+pI+0DFjNZkOtKXOR11XkvKelgC//wEAjBdnqOH
         TT8w23ivBLto9VydMwr5uyaSlCOIlWDU2T0QhOnLjPUclepuP0GCm2vTxqmpjh16WHY2
         /oJESYE48LGc//UNeFkDAfLhaU6UM/93WVrvhg1pAQ83JLugEpJwuzVHnJsRbx6nWMwf
         8V7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785223279; x=1785828079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T7R9i9njfDdwJzlWO1z5tPMWnKphz3iqm6UJQI2a+0o=;
        b=h2BAYSFA91H8qZbwWdJ3Ald7MuEuqXtPe2NJB4npgHuHSGO4k99saQqLjkJIrmTGzu
         MLHzQq0NNtw/agAcxq5r8uePDXp6qcmhj/dj/09K/scnF5IWo48SzdvpRGXZjkA7VDAT
         bNdCW+CCiB1/hn/TfBewwnA+z8eEmFg4QCrfo0olCYt7Hl8Sg1b+xtnSq6ImxenRjcSs
         3QGE8FNpHlTMu+hBp/k+u8xMTzrVIvdj/Ng/5xggSZviT+DIdny2oWnbDSBpPHWYuOEh
         Y3wYvVSdE8ybgG4zFoPxwe9Ar9ufWcG/XXWKkfoiIvYZKfbqVTKEBblduZD9AMDpg+8K
         Pcrw==
X-Gm-Message-State: AOJu0YxkxHQjRCid+ml7zc2MnMie2eM/EXz6qEg26ymfutYLSabHf5E1
	NiOT4nFwp9YyxTpyqfU46ZXWeZaJXkOV7VOJIyJCGoZhUQh1pFhsV+MTa/vt192Z
X-Gm-Gg: AR+sD13zsv2ffjH1X8CcrQnH0OjtPwSBw/PI1/iA41dipNf7dpDgpyHZbgwstiBzrTh
	f79BdrqFuNSLWgOARn7NrdjWUvsdLQgMNi05MY8swMM2g1zonhwmbYuZTvnoWQ8ZbK5HZU3SMjS
	jnVtVeqKNMbWgZ2xHBcVI6d87yVrsAy45FNV4MEZXwltv++NYpwNDT16QLQJU8VI93A6Aj5iP24
	DLEZqfZ9Z7iqcnyslz7K9VJJYZNHglLl6nIFv/6wkDIqGQBBgNgJL4CMjavpqJemxbjcHYqsx65
	8s9h+D0NcPolY2Lxco4glepNhKk1k+wsG5SLUbjXF7VMLPQ7f6ehZQVK1zIa0DKjZ0EdWmqnm3w
	mUu2tqXQwT1FXugmbOd0sxbpSQKdTXyATXDdRiMZLETH5eh4614o4vc0X4PJXGRJwfD8EosFH9q
	sHUw/810FK8hEzWelpCdtCqIOn4UDKWMozhgg9vN0QdAnhnziFROJ6/pK4n4X28H/lVrSu7DT2T
	GNaxQiA1yUkCNbiR4em79Mo0nM6IjSffqkGWz9QvVx/MMEKW+XTLNzuqegMP+XYFykQVwthEYoU
	nEFI01HDVRXwouyLuS7hVP3OZkdlAqGdoQMe/83eExvfEcNCbFhgYa/gpRPucNJVJM2q7jXQAbk
	3fA==
X-Received: by 2002:a17:90a:d60f:b0:38e:712a:bb38 with SMTP id 98e67ed59e1d1-38f6a425a2fmr1431848a91.24.1785223277789;
        Tue, 28 Jul 2026 00:21:17 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5a04b2sm37245911eec.28.2026.07.28.00.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 00:21:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 4/4] uutils-coreutils: Exclude from world unless it is the selected provider
Date: Tue, 28 Jul 2026 00:21:11 -0700
Message-ID: <20260728072111.3266991-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728072111.3266991-1-khem.raj@oss.qualcomm.com>
References: <20260728072111.3266991-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 07:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128506

uutils-coreutils sets PROVIDES/RPROVIDES = "coreutils" and is a drop-in
replacement that cannot coexist with GNU coreutils; both ship the same
update-alternatives links. meta-oe/conf/layer.conf already selects between
them with PREFERRED_PROVIDER_coreutils{,-native,nativesdk-}, defaulting to
GNU coreutils.

PREFERRED_PROVIDER only disambiguates providers reached through a
dependency, not recipes built as explicit targets. Since uutils-coreutils
was in world, 'bitbake world' and 'bitbake universe' pulled both recipes
into the same task graph as targets, so bitbake reported:

  NOTE: Multiple .bb files are due to be built which each provide coreutils:
  NOTE: Multiple .bb files are due to be built which each provide coreutils-native:
  NOTE: Multiple .bb files are due to be built which each provide nativesdk-coreutils:

Key EXCLUDE_FROM_WORLD off the selected provider so only the chosen
implementation is built in world/universe. Building uutils-coreutils
explicitly, or selecting it via PREFERRED_PROVIDER_coreutils, still works.
This follows the existing conditional EXCLUDE_FROM_WORLD idiom used by
mpv, sox and vlc.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../uutils-coreutils/uutils-coreutils_0.9.0.bb             | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.9.0.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.9.0.bb
index 2c7d3a3200..9d16342e5c 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.9.0.bb
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.9.0.bb
@@ -18,6 +18,13 @@ require ${BPN}-crates.inc
 PROVIDES = "coreutils"
 RPROVIDES:${PN} = "coreutils"

+# This recipe is a drop-in replacement for coreutils and cannot coexist with it,
+# so only build it in world/universe when it is the selected provider. Otherwise
+# both recipes end up in the same task graph as explicit targets (PREFERRED_PROVIDER
+# only disambiguates dependencies, not targets) and bitbake warns that multiple
+# .bb files provide coreutils.
+EXCLUDE_FROM_WORLD = "${@'0' if d.getVar('PREFERRED_PROVIDER_coreutils') == 'uutils-coreutils' else '1'}"
+
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux systemd', d)}"
 PACKAGECONFIG[selinux] = "--features feat_selinux,,clang-native libselinux-native libselinux"
 PACKAGECONFIG[systemd] = "--features feat_systemd_logind,,systemd"

