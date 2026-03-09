Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC7EEFCD62
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 09:15:03 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9880.1773047700282526494
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 02:15:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J3RCll1M;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3598df39444so4935504a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 02:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773047699; x=1773652499; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Kn6Rmb4cxlf2o1bIbjkWK6vSo+z1dw6MIC/OT/9kuk=;
        b=J3RCll1MBrvN7Vho9YU+1A98BxQ/yEC3YpKlGdKYUNbLgH+8lWZ6jdVc9Co11KHlyd
         40rFrZAeIfj+8aUNFSSyDTRK2bK9TK6AF6Gk9+OvSl/O2//7CzdZhMu/j8N6r2y5p1kk
         KhSmhvTJBNm6JvzR3KvZNKXFsd+K56X/ecwBMsLdejyLL6N5rbRaXG85VfHFmpyv6hzu
         AaPzV0o2KNZn6OM6vbayLFMg8TqBukFXST3/B948ZaNrx5847UpMWzy322GMdoy0U8S7
         R3OEYH+kT9aowzZsXBCIaPEwb0os6ASYCJob23iwH3cRYOoU3Mr7fiWIX7VAsHBfqmEF
         hing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773047699; x=1773652499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Kn6Rmb4cxlf2o1bIbjkWK6vSo+z1dw6MIC/OT/9kuk=;
        b=DkXwc3X1C9vhDOgTC1xtmgu0FwtlgUB1wu4tlEQIvLZg6zFqC5PaaoPMod1M1P8sVc
         iGj7vBseiIezkQn3bpHm+5F06m8JA+1j9ZYhPo9XRoDFnHkYrToSopNzpZoqYOFkDHcH
         Jd74KUIVf+KehuL5nfDiLS4A7mSUOTIvF+K7JPYp/jpmmueaZOlYjs3uQNwBKLG+BKm2
         7sq/0u2+ZyhRVK4Vw/LnF7aQ8IqYOei0W5YsfzIhzPquSsnvR/CkQPh+cbROML5B9eX3
         SCfpkiAQAp3nwEJib97tSbNpnTYlbSDyOQzpfk5t1MnifPqF28elG9frq4YbptHAsNlP
         k78Q==
X-Gm-Message-State: AOJu0YxedSMY/PEB6f4G73BzfP3hcYEm3ORllpxn7MK9lGQXQwE10w8i
	mL3Ax4JWC6vFIgVoxkt/eVgL8fKPNHT59FYRE+zNXdbejr0yvL4tSitjljVR0w==
X-Gm-Gg: ATEYQzy3jnKJfH/3lLGfNgMN0DiDwNTNuKvkA7SC8JoPy8ph4NDkfci8OP60clttWx3
	mViAN7aA5+Hg0FZ2hpPRdODQnGoyEXZPSrZsPcHYr9TpF68aM0iIiJryWzzZ6SzdUUdcVLXMb1P
	FJZp/GUQBBiVcFs0L0UcSzZmD4y5AJUmA8cHbG4sygKcO9xuC+70I7F8MXsO/buIikLJj5otOpg
	D7blf13i2dDPYAWFnmMsBHGt1/KDQO0xTTK0M3g/rflpoHSp22haoTj6zO6+VwnXkJlWd3m+69o
	AJJLrXV+wdPDK21YqTaxuce4CeAsPg8ZyopAsc33CpaLZ+iLqRasaVhKdGRHFAhswcYes43Dfir
	DPg4eIFohf4Jbqx34Gdxf4m1l8/4gPzhqhAzqscS4Ttjp915RPcqHaTtMFKrowv0Mi9X3Jl3igW
	sSakkWbIh0Kd19qE8kpAamLtINjsTHl4JQokE=
X-Received: by 2002:a17:90b:2e0c:b0:33b:a906:e40 with SMTP id 98e67ed59e1d1-359be21d409mr9395502a91.2.1773047699437;
        Mon, 09 Mar 2026 02:14:59 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.26])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d60767sm13822583a91.8.2026.03.09.02.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:14:58 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][whinlatter][PATCH 3/3] pipewire: update 1.4.9 -> 1.4.10
Date: Mon,  9 Mar 2026 22:14:15 +1300
Message-ID: <20260309091415.393661-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309091415.393661-1-ankur.tyagi85@gmail.com>
References: <20260309091415.393661-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 09:15:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124964

From: Markus Volk <f_l_k@t-online.de>

PipeWire 1.4.10 (2026-01-16)

This is a small bugfix release that is API and ABI compatible with
previous 1.x releases.

Highlights
  - Fix a regression in restoring volumes on nodes.
    - Clean up timed out stream on pulse-server.
      - Backport filter-graph channel support.
        - More small fixes and improvements.

PipeWire
  - Backport the timer queue from 1.5.

modules
  - Fix module leak in module-eq. (#5045)
    - Fix profiling of multiple drivers when profile.interval.ms is
        set. (#5061)
          - Allow both sink and source pulse tunnels with the same name.
              (#5079)

SPA
  - Emit props events in all cases. (#4610)
    - Backport some filter-graph changes to make it adapt better to the
        number of channels of the stream.
          - Fix some port errors in filter-graph. (#4700)
            - Avoid a memcpy in the convolver.
              - Handle some DBus errors better instead of crashing.
                - Fix AVX2 functions and flags. (#5072)
                  - Limit resampler phases to avoid crashes (#5073)
                    - Support some more channel downmix positions.

pulse-server
  - Clean up timed out streams. (#4901)
    - Add message to force mono mixdown.

GStreamer
  - Avoid scaling overflow in the clock.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b7bd06e9b4ff1bf55b5ba8943c2547ec8ff6dba7)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../pipewire/{pipewire_1.4.9.bb => pipewire_1.4.10.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.4.9.bb => pipewire_1.4.10.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.9.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.10.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.9.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.10.bb
index 683d5f3ce0..a0b3848dd0 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.9.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.10.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "dbus ncurses"
 
-SRCREV = "fd60e04525f3a04d90bf50085222e0cc9139b4a4"
+SRCREV = "ced36a5315135044a22c4b373be44368d312f9c8"
 BRANCH = "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=${BRANCH};protocol=https;tag=${PV}"
 

