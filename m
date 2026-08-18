Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA45CC5DF67
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:02:08 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2328.1787029321392019259
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rcLbqxVz;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso3483282b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 22:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787029321; x=1787634121; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iRLMh8ajCItwqGNOq0iYgVavpXz+V7BpMg11dIQaZIw=;
        b=rcLbqxVz7hg4MG7Q8Euudp8FtX6rdqgjAFZTri3RuGbiJgS73kFsLfaWh0k+rF8KWk
         791vUvWLe/YzEfxHW/aoTMck9VQhKxtdp+aYyA4JTQJCoirdHDTtn0s/O4Z1gmCqlgHq
         aWHEkSpg3FM5H2Hv3i1TnyGuP1yemo9tWD24SeDDhmfJhwpJEklQG/Wdo1BZ8AfzpF54
         nKt8X953vpv7dkjq94ITWqbPrtiL2ZiHCinB/DqBfPvRgiznA9ZfO/yFUgwqJXq+38O5
         k7XlJdCXyGh08F88U0HQt2kWUbKxTVPGVNioBDfXyw0Ou1CmkNQWrQfjgu7nD68h78ch
         G+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029321; x=1787634121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iRLMh8ajCItwqGNOq0iYgVavpXz+V7BpMg11dIQaZIw=;
        b=EEPuU8XYlwROF2qf3grNDK6vvXbVvv9qXHOZhIGEJwrz0fECaXG90ahhwPYF2GAega
         z3vVQ2x6woyx1dDWwzB2cQ+s7WcDAdYclghsWpxKvXd6ieO/IHxvXmhpPqqNsblwW9WF
         /xJI80jrm4WuS4HxW0+TUl6h25dz5YyVq5pt8s1ztCRtszhReUPm6LtbqGjgh+VOH2Tx
         Be920mKW4JrVgwteEu+OlMhWpThvloGT+RfIjXOoKab+lBw/JtVyx+L7p3BnJ2hpM7oQ
         bEnUbU22QTr7duPouyM5aqRqhTdgavSqyAyG3rGafdKnNxql5wMO9xL55X8Aa6SZG/x0
         Gcyg==
X-Gm-Message-State: AOJu0Ywyr6YPP50YxQiLSw9Umh5LYPyuatAFauTYpE7D8wKKHSAGOl6z
	u5TlS0RMQ2LljMCqQvWwjjX1CnZslADBhuNrOVNTyh6RsugrZYmgvXgvksTPdxf9
X-Gm-Gg: AR+sD12MGuFq+aM+hbUCK6KoqlIz4rT6cgapXLiymVmWyfA8sTpcqhsPMjFUG8PQetv
	9ZMpbBYXq/nRQVK3UUlgX1ge78fOOGmX8eI5zL+2isILq/tJseMPxwQn3m3kTpDAjsEhldlowey
	fn643kioIxhFcyDJ1FEGIiBXi6aCmLryFWnSMOdgqIJGn++E8Ybaw7l5TvRZyIaLLG/IBFQcndJ
	coK7wdzw6Uzpa6V0zaQ+RBemgF4mofqk5sJnPukAtrbsKADA+u9fcbaqnX9G/ASRIJcUK8GV0I7
	532qEOtifEm61yapn7kbqG+3FvWS4p0T37DjYqH+Zd3WzVOUPexczoRQ1+L+fSeRimVTR3JK0qB
	OsaVvygteJwdE62LiLELJ9aeYkGK1qoTV0WMDDfvI2em6PwFWbkuzZc0SHUtsYiGOUGKsBaDjL0
	WukmMYMyCmUExpsgsUmvapbxIuu4lsUDymtpX+wvjFbD/lT74XS/j3mYCOZtYUvHAACdJC1JrN8
	w==
X-Received: by 2002:a05:6300:6697:b0:3c3:c080:71ca with SMTP id adf61e73a8af0-3ccd9fef1b4mr8630122637.0.1787029320662;
        Mon, 17 Aug 2026 22:02:00 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm12840095eec.16.2026.08.17.22.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:01:59 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 9/27] libopenmpt: upgrade 0.8.7 -> 0.8.8
Date: Tue, 18 Aug 2026 17:01:04 +1200
Message-ID: <20260818050123.2901739-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
References: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 05:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129208

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also add UPSTREAM_CHECK variables to check for new releases.
Fixes:
$ devtool latest-version libopenmpt
...
WARNING: latest_versionstring: package libopenmpt-0.8.7+release.autotools.tar.gz don't match pattern
INFO: Current version: 0.8.7
INFO: Latest version:

Release Notes:
https://lib.openmpt.org/libopenmpt/2026/08/15/releases-0.8.8-0.7.20-0.6.29-0.5.43-0.4.55/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libopenmpt/{libopenmpt_0.8.7.bb => libopenmpt_0.8.8.bb}   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/libopenmpt/{libopenmpt_0.8.7.bb => libopenmpt_0.8.8.bb} (94%)

diff --git a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.7.bb b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.8.bb
similarity index 94%
rename from meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.7.bb
rename to meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.8.bb
index 3d25697c23..f7bb5be4cf 100644
--- a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.7.bb
+++ b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.8.bb
@@ -14,7 +14,9 @@ DEPENDS = "virtual/libiconv"
 SRC_URI = "https://lib.openmpt.org/files/libopenmpt/src/libopenmpt-${PV}+release.autotools.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "275c29ef47be9992f62a35fcc96f7ca05c06d2fd05c9298b8dee9f743f75b089"
+SRC_URI[sha256sum] = "d4f00ddd29eecb9594bda7be76c13aaa2de1dadc18391c3e905f728ec9af8822"
+
+UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)\+release\.autotools\.tar\.gz"
 
 S = "${UNPACKDIR}/libopenmpt-${PV}+release.autotools"
 

