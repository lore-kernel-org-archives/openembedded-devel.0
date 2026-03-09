Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC2BEFCD8A
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 10:32:24 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11122.1773052338625750425
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 03:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iLaxLDfb;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-827270d50d4so11513869b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 03:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773052338; x=1773657138; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4y9jjjAUStT3OVgtuVV2ln9Bip7uScx4q/JNNjfzs2Q=;
        b=iLaxLDfbeA1NaiPgezqYUzc/NTJzX6eNPbosRY+WWVEZTH40d1zInwDihJ8zK0g39c
         r9Py2eAHlfoEzyI0CEU4JUy5wHFlrH6x3+qJI5n5p8t7uL5jecNmR0DcnUeCpVM6ru4+
         4Tc704SWpdE0gMMvUX/POc4C8nZ02VhSV8/HELyIDGkwaaZVX38o5wGck6rkvPf5MhKU
         b5XcuRZcKTZNFYYgoQJH8OWBtNFq7nf+NE5Vupcgzse8FuUebHBpjS4DQ9sQ0WihmbHG
         XL3roVjNSc8BiZzDi9Fk2EB4QVvHJ+Tywh1jxTJUVwya99I5sUxOZfZe2uiGU1hE+qbo
         fbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773052338; x=1773657138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4y9jjjAUStT3OVgtuVV2ln9Bip7uScx4q/JNNjfzs2Q=;
        b=IF22wyh/wyI0eiOW00cf9RE83auE+1LC35k5nlyNYiunqS5yrwpI/TwKsus5clHJqz
         JnPO+hFrn9fhGAV+icIy4HUdvOSK/tAIi497Siu3SCExk7fJXbagJXYqw63Hi61QNYop
         Ecdu9Ig4oJeFVBjiUHwrfl4u328wJZZVnx95Jl4GHjERCbvUwkdCzmmdcf+vK/jvRVX6
         zDIzWdF0zLNHSLZNfy6AkXi/30TJYbnDx/AoTAUE6ZKGSgnRm/YVZ2lDxeb729GphFU3
         DxYJELc6C9i9Y90WBC22oP30fFI7eXoY9dth3BuCx2HH28mK2LkKQiC85KFSQonVaOII
         C+Ww==
X-Gm-Message-State: AOJu0YxNhld/RFiOlI2c7lm7RrqUEgUnzg+ClvouVhUsmM9waVNL/OE6
	lObLL6AYbg2beM+AjZB0P6UO+FhRP9z/Xxo13j33+HO4X/np00OfOPyzcYtwhQ==
X-Gm-Gg: ATEYQzzABbX2ovhyA3qyIQQgzJ1eYFyg14kSfYbmrp/SRyy9OBWccY3+TKvzs2GM4jE
	+7xiJnsEdZ29HAmQMQcM+cO2XIALGF2oq9zL3D0qWPHcLCGA0/2XUtcWZDBgw2MyOumlY/aRXM6
	Fnk4/pwWFaMM/oG6iglEDsPXUOgPw2EcaEiK6XgJjbqK6jEB9emLylur76JsW3eB+l9HIUuvFP1
	ey79U2oMTyTmJF3gU/H/zUPjbUvygUwvXhsjb74V+v87+guuSCWZG9mGO3H4us4XkjDw2fF0ULn
	GrNjd8yGHz9VB/zoYBXpbIGkizS0RyFaHb7oupnvcbqREAO9rb0gJsILFrIOX6dWwzxUkYf4Ptc
	PNBZdYLNJD7ZKYmwtN+dop5gvuftzqG+JOsvTej7FAFYVnJVZR1y18ZizpZ2I51DQHl5WdUEBW1
	5LOEIlXuhSlz+gJYC9GVZHUoLgHzz5b4wClSg=
X-Received: by 2002:a05:6a00:6c9a:b0:829:8e63:fca1 with SMTP id d2e1a72fcca58-829a2f7cc49mr9549507b3a.33.1773052337877;
        Mon, 09 Mar 2026 03:32:17 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a463a1adsm9877083b3a.11.2026.03.09.03.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 03:32:14 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 3/8] nopoll: upgrade 0.4.7.b429 -> 0.4.9.b462
Date: Mon,  9 Mar 2026 23:31:48 +1300
Message-ID: <20260309103153.536284-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309103153.536284-1-ankur.tyagi85@gmail.com>
References: <20260309103153.536284-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 10:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124989

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

0.4.9
-----
Stable release with bug fixing, support for Debian Buster, Debian Bullseye and Ubuntu Focal
https://github.com/ASPLes/nopoll/blob/master/doc/release-notes/nopoll-0.4.9.txt

0.4.8
-----
Stable release with bug fixing, support for Debian Buster, Debian Bullseye and Ubuntu Focal
https://github.com/ASPLes/nopoll/blob/master/doc/release-notes/nopoll-0.4.8.txt

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../nopoll/{nopoll_0.4.7.b429.bb => nopoll_0.4.9.b462.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/nopoll/{nopoll_0.4.7.b429.bb => nopoll_0.4.9.b462.bb} (89%)

diff --git a/meta-networking/recipes-protocols/nopoll/nopoll_0.4.7.b429.bb b/meta-networking/recipes-protocols/nopoll/nopoll_0.4.9.b462.bb
similarity index 89%
rename from meta-networking/recipes-protocols/nopoll/nopoll_0.4.7.b429.bb
rename to meta-networking/recipes-protocols/nopoll/nopoll_0.4.9.b462.bb
index b4f8605136..dbe8407443 100644
--- a/meta-networking/recipes-protocols/nopoll/nopoll_0.4.7.b429.bb
+++ b/meta-networking/recipes-protocols/nopoll/nopoll_0.4.9.b462.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f0504124678c1b3158146e0630229298 \
 DEPENDS = "openssl"
 SRC_URI = "http://www.aspl.es/nopoll/downloads/nopoll-${PV}.tar.gz \
           "
-SRC_URI[sha256sum] = "d5c020fec25e3fa486c308249833d06bed0d76bde9a72fd5d73cfb057c320366"
+SRC_URI[sha256sum] = "80bfa3e0228e88e290dd23eb94d9bb1f4d726fb117c11cfb048cbdd1d71d379a"
 
 inherit autotools pkgconfig
 

