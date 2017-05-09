Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 90DA171A91
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 May 2017 07:57:26 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id u187so14062441pgb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 May 2017 00:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hoRq3JdmRoqtAlDycGaAg0ywPZLXK9LJDA1a0IccqxA=;
	b=f8FTgxdtQGlra9GF6WjQ5SXa5oBAT5TMHfI4mGHFnigzeUvPyqzZpl1CNOpSys4g+x
	rzROFR/FwShRRujOvzFEpFFi3WrrTozZBo0tEertOceUA5tNNDLWe2SxyOAL4WNa8kkq
	X+8eD5QYx1Yev/Ea8evM0Ayf8arPZP0mb+JbJwXUNYT3dR5jNYDZcL8vNwbe2VAeo1mW
	bt2ixq+MnSR2HkT8REy1L57UmmDbmlERCO032fJlZKUjNHXGCw6137VTkUYbgsoKKnwk
	lvIKilqf+nnOlKIwD5i73yBQ82lNcLt+Qfc6SRAerg4j7Qi7awR5roYjcceo+STwoOT/
	AXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hoRq3JdmRoqtAlDycGaAg0ywPZLXK9LJDA1a0IccqxA=;
	b=mDjGBfnnZAX1jA8mVcH+m4dBEdgp4BfR72TuiKSeS7gU3nY02TB6lGV/bHE5526J5X
	g2B3gMNKTfh3I8A9NSq/J9rl+himzmzPeJeXMr3UffH5HRq2UECMBQ7fsgFBInC0mpEO
	sqhfqGFUnP++WcWshNVRC/7Z3iF2vuVLXIMvfng+npjduJ3WfPAevgWefGw9/zAel+Fx
	a8s3KzgwhO6C2Jcpr0cKxY9M24FtCRoq7PdVsHoL9g6U6q/GUAlSG4zXd4AdhG4jOXXc
	r3cxgeSza2Xqewh9U7+c5lp7KZnSNKqmZRVuSYfByaICGPwod9Xxqznx5xCjqTUhFLs9
	r+WA==
X-Gm-Message-State: AN3rC/5177kFImhCH/BICk4QeIiKEgIsCUOlyh0j00GnK8Ih85q1qRPb
	AZwx+6Tcbf50fA==
X-Received: by 10.99.105.10 with SMTP id e10mr23398031pgc.142.1494316648290;
	Tue, 09 May 2017 00:57:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::c232])
	by smtp.gmail.com with ESMTPSA id
	i67sm20250916pfk.87.2017.05.09.00.57.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 May 2017 00:57:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 May 2017 00:57:08 -0700
Message-Id: <20170509075711.1575-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170509075711.1575-1-raj.khem@gmail.com>
References: <20170509075711.1575-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 6/9] gupnp-igd: Upgrade to 0.2.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 May 2017 07:57:26 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gupnp/{gupnp-igd_0.2.2.bb => gupnp-igd_0.2.4.bb}                | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp-igd_0.2.2.bb => gupnp-igd_0.2.4.bb} (61%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.4.bb
similarity index 61%
rename from meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.4.bb
index 440e8262d..0aa594dc7 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.4.bb
@@ -6,11 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 DEPENDS = "glib-2.0 gupnp sqlite3"
 
 SRC_URI = "http://download.gnome.org/sources/${BPN}/0.2/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "f881323304185c02634034e3bda714ba"
-SRC_URI[sha256sum] = "73b6a98a0f13b29b34c3bfc07f99f78b1319211cb95a8585752873af2b9067d3"
+SRC_URI[md5sum] = "124371136b5a7b1056a3681780a62772"
+SRC_URI[sha256sum] = "38c4a6d7718d17eac17df95a3a8c337677eda77e58978129ad3182d769c38e44"
 
 inherit autotools pkgconfig gtk-doc gobject-introspection
 
 EXTRA_OECONF = "--disable-python"
-
-PNBLACKLIST[gupnp-igd] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130645/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.12.2


