Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C9BBCA5FF1
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 11:08:13 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6889.1791371289545713613
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2026 04:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=r7pd71es;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3a89d1ca907so724256a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 04:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371289; x=1791976089; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qAtAJ7YFgaK68jJJUKc9c/Ttdoe5gr1Ll+T/xXyzSx4=;
        b=r7pd71eszVhgIYe64naIN4ZPWHbw9uSR1vQKdbjjjk5H9gUih1XWdGhuEbH+v1aQ2x
         d6SnUvtc63PEUzCAyfGJJT2OnGqqsvVYFnK2UJUDtOM0yc4a9vxKKrwHKuMcwupKcMBu
         vCfwzQbgXXY7uOL/cpapAcAzmHeSquQMMORNGWF1p7D8TqxmfoOVY0V75R0ceW73ihn4
         J72DDd3lFqTiF/5fvODEQ7TCesjl0TkeaqH73IbPOjv/9/VGZVtBQiUfoUpIP3N9+02A
         b1aWjCCy+SQNdfltC2yEjW1HRUNS8c8Y/10CvbU7vRbOvlzKfKp+WSzk9DofBdSFoA9O
         wy5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371289; x=1791976089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qAtAJ7YFgaK68jJJUKc9c/Ttdoe5gr1Ll+T/xXyzSx4=;
        b=l5OXnPgUYx07FlIoslChMofYpxUvK2jm4Qz4faM1v9M42sJwyB75Ei0HZ0dVk/bAKP
         KJ+kHLICA5CypJW7FDoviAJiSlsr0BYRycJepyOmuuvEDi5CxrAhZtGcam1B8o4kb49a
         z+uDHfMGElsOWqoccGEXe8aIRpYn3m8QOIQp4U1X3j+SgxbAupzk8x9XFmFhqvUgQ3Sl
         B52/4VkhIAqWAL6JSMNz+2RwOV5Q4q/0lsWq+/wo966Kt0QfF8fS+C4DQi+1CzbP5RvN
         SY76PSRKpR7ihSdUWuOP/v5lrQsVblkg4aohqFPIEPXcKZkOzT5LWNgK3vPyYj7p/JQ7
         gP3A==
X-Gm-Message-State: AFq9FYL27+TTkvhSM2xyQt/qpTZlOPgRYMyWuKhxERJoAizTGNu93Udk
	ZpRLmHH+6Dj+eRyB/9bdxwqn4G0fqvoPaIwSKIL2izEWv+oOUqgfegtucmMktdkL
X-Gm-Gg: AYBFou1jjIJCXxwj/KHE0eYwMws+SG2oehjI32Om3hn+lUIeulXghMcpmRKposBcMua
	gPkhPaDGayLA0cwehcW8KonGoZB8rErJQM8GY/UvEXX7nty9jYCoDEgDp9AqVQJzDCxz2Prdkne
	GTCpIT/ylBE1nzaZBX2kkIzBwCpMxSbW+2+CbIRocbZGMP+vrcGXZHzNPtcInvRpEPCSBH6klUb
	+/EAdYrVS53KrKuTgfjD4v0ya8SsNUrPvwnUIeRg9E+hD52TjOsjr5p7JdsMI0R3yxTjSlGA3xM
	5te4XiYtqZsVyeafvVMpL/EKUIEXVJzf+IAmrawM2lhnnNNIetL8Nyx8PmQhkz80fNMwpQLr3Ot
	tcroxgoSrHz25MW8e7Ha9ipk4K/l3fP4XsC375d5iUXjT+5mKSmrspIHVyLnxcbMtRmd2eR/INk
	2jpRKBA+qgKYQJVmxxXadXPODM+SjDRZPp6/lFaFw6IWUEW3YtMiApnIpjCVUVgjClackPstPf1
	fGNkwx5qgoxea4C70dc0pqonebYREt6ZQ==
X-Received: by 2002:a17:90b:3842:b0:3a7:9ad9:68e1 with SMTP id 98e67ed59e1d1-3a8a0740497mr1803808a91.13.1791371288958;
        Wed, 07 Oct 2026 04:08:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm10862177a91.2.2026.10.07.04.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:08:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 7/15] python3-django: upgrade 6.0.8 -> 6.0.9
Date: Thu,  8 Oct 2026 00:07:32 +1300
Message-ID: <20261007110740.3179543-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
References: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 11:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130649

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://docs.djangoproject.com/en/dev/releases/6.0.9/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-django_6.0.8.bb => python3-django_6.0.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_6.0.8.bb => python3-django_6.0.9.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-django_6.0.8.bb b/meta-python/recipes-devtools/python/python3-django_6.0.9.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-django_6.0.8.bb
rename to meta-python/recipes-devtools/python/python3-django_6.0.9.bb
index 0c7fb2197d..acdd2c21d0 100644
--- a/meta-python/recipes-devtools/python/python3-django_6.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-django_6.0.9.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "cb0bd962d27fc866f3c514b20aae6a7df56ec80b488f9899da46d675cd051526"
+SRC_URI[sha256sum] = "8ce037c971f421cfb47d38c097ca233a8f6dd42d9e9501a37e02dd7d08c5cb3f"
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 6.x branch,

