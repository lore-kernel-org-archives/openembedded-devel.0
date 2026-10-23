Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12743.1792777452662999492
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2026 10:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nfHOwIiz;
 spf=pass (domain: konsulko.com, ip: 209.85.221.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c5358fc28so964668f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 10:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792777451; x=1793382251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szmE68oJ2JjZ2T7QXksKMiYQdXOqXxN/kF8J0eftq4g=;
        b=nfHOwIiztMre+4ysYtzRusRbeaQMAYMOaDAux4eSETyjRn5fjG2o3ZRdfRlj2kCawZ
         e0424aAfhPUGc7F6/4w45n5K99p9z4dS1nhIA1jjd4Xi/4C/z1YhAeSpbpT7uBxRaEJ6
         jUB6w1XlR/fIHiZHFW8LXuiUTH+779VnbBZ8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792777451; x=1793382251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=szmE68oJ2JjZ2T7QXksKMiYQdXOqXxN/kF8J0eftq4g=;
        b=CRGQbtQV+GY6j/xva/aM1gAp7BX5RKzAFchevU5zs5S+T/EaFmWvp7N58GrYwCwH9Z
         mlTwIFKPSGI+TSgM4YMTF5PzCXEavA0C9M5lrU1xBEz3BGjgf6nVwFSuEq0rURJJhYbK
         FIeVLAXmKByiijlETEK28MCImv8q8SYCxDBAzepwgC897zgj/XVy003dbcdCcAKlVvug
         e4AQ8OJf8xUpK8h9ndejex7OAgfS4uEu5ozCOqGUhbUDB0hlCOOmmdatCx5oBMTa9Uri
         Kz0I9P+lCZ6CayI9aQ7rWz9EmMV4olwAC14aFEouhZ03qYOettAN5huMDIO56NEmcG2E
         sGMQ==
X-Gm-Message-State: AFq9FYKglsmdn+H+DndKombE3GFv5r14MJuUA836JKivOOH7WQBP8iQ6
	QXgL0u3c8AdvKhAWpeGSVdlGK2IZKNUKhutBxzJY/2FJ8v7G68xlK76sWXe+TpVBtu19snU41Dz
	lWcqq
X-Gm-Gg: AYBFou1GhE2ZQxz/RVB5thFL38wNmOlkD5e/Q0h5ynaab83U7mObx+/UTxwvMbh3sjl
	Kr+IUWgEhTg0l3HNdHQdrDVngOxP20mjdgtDINfpeiCh+p2e4Uu8oLbrGTdVDMOOAlpp1WNOxN7
	SdJs5X3gIBxnHnD3wubJm6pMdCOYWX50mI8pXU3vbCbuuu5MV7rRWMSdsOUwK3QRyTNriQpkOTm
	zfU4NVVAQdnK5Th2dHbElVWA1eLA/iIimhIoUPJBPMk0FjL5L09Ug0baUxKXfGCnaLkucMSM1Rk
	dv8Tvq2mXD1QcHEz5KiXGTvNIcf+UQIcS83lxlUYbf8xbEmA0/nyvH0NYi2eQFhwgM4P1Nxu4Jh
	PbVZc+GeNd2U+A6xFbA3EmdMs4mxSMC8Yer16DeLY03TVqpJ/WozvZMyUb9Ul6d2Pg8YMrbf5lI
	T3Q8LaFarotfBII/II9O+so9tas2qt+sh3YVRzpn2jKBAraexT1UGtSAUg1VkIxKcMEFSgILpBI
	x2piNCbDbMdoOE4QdCr4GP+FF6lqB6tTyTmrtTytOjITM10xyhatYMO+XTBTlPNxK/mPgx990Bx
	8I9dGZAfp+Zjn5NnYT5UwTNgzjKG1i3W7PtcLtk22Bd4ayR5fmUXQRyACwyoJpiNqYZz7eZE+C0
	xb3HMRQ==
X-Received: by 2002:a05:6000:220d:b0:48e:eb5:4976 with SMTP id ffacd0b85a97d-48e385a7855mr6202908f8f.53.1792777450957;
        Fri, 23 Oct 2026 10:44:10 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d3ee6d8sm1147864f8f.14.2026.10.23.10.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:44:10 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/9] python3-importlib-metadata: Upgrade 9.0.1 -> 9.1.0
Date: Fri, 23 Oct 2026 20:43:59 +0300
Message-ID: <20261023174401.3617912-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023174401.3617912-1-leon.anavi@konsulko.com>
References: <20261023174401.3617912-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 17:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131386
Content-Type: text/plain; charset="utf-8"

Upgrade to release 9.1.0:

- Removed support for Python 3.10, now end-of-life.

- Where a path supplies more than one metadata directory for a
  distribution, as an interrupted or unclean upgrade may leave
  behind, discovery now prefers the greater one by reverse
  lexicographic ordering of the directory names, so the stale
  metadata no longer shadows the version in use.

- A missing required metadata field (Name or Version) now raises a
  KeyError that names the field and identifies the distribution,
  which PathDistribution renders as its metadata path.

- Restored lazy validation of EntryPoint.value, deferring the
  ValueError for an invalid value until a component is accessed or
  the entry point is loaded, so one malformed entry point no longer
  prevents entry points in other groups from being selected.

- importlib_metadata.diagnose no longer crashes on a metadata
  directory that has no metadata file or whose metadata declares no
  name. Such distributions are now reported by their location.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ib-metadata_9.0.1.bb => python3-importlib-metadata_9.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-importlib-metadata_9.0.1.bb => python3-importlib-metadata_9.1.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_9.0.1.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_9.1.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-importlib-metadata_9.0.1.bb
rename to meta-python/recipes-devtools/python/python3-importlib-metadata_9.1.0.bb
index 89fc9af824..2df4b59609 100644
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_9.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_9.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=affe5a7d8b988c3db245c01075b29e17"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "ab830580bc0ef3db61ce8fae716389e5462b67e033018bab6d8f80ef17172f99"
+SRC_URI[sha256sum] = "9607fb24f95d4e0b1c17d57ec4604357d76d3f0d154f19fd4861f2e31c8e4065"
 
 S = "${UNPACKDIR}/importlib_metadata-${PV}"
 
-- 
2.47.3

