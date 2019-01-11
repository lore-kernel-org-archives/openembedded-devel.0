Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 525657C113
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2019 10:54:45 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id t6so14632370wrr.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2019 02:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ugBSIbvPwq4EEOOboz/3BfIW4HAj8znUGChGtj8ruY8=;
	b=o2KOD4I+APiCqwcf45C/Y0/mo+eLUvS967c1TSjh/M1PChC+CL+0QWji36vZbhgkMo
	SNAbtq8ZWMT3RIWGFng5LQKvOGMwKpkiCn1EFU6F1YamT+Mu9Jj03iUEkWpewgY3Me26
	HuNujpD/fB0QkFhOGr9xTLCPHDnmLNuna9wvoL7eYcISnJYS7THEB4iqorhBLmIU4+Rp
	D+4FGd8aPbezXiZYVIlKPQEYnjrI169sNHhCtL1dm+uLBsdNBEAWze+ZRBbt1Gmfdt2M
	6FsKiSqyfi3W1auN/EF3g2rK8bGodhxIjCTLza96FKXXG0JSoCLhQbcAD9ZXUMpyc+kE
	Gw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ugBSIbvPwq4EEOOboz/3BfIW4HAj8znUGChGtj8ruY8=;
	b=szMjAzb7KdVaI+5m97O5YysZH905KFQM2zj3qpu+0AFUhPTOzHeq339pEfsIvo54hk
	0wLyVWSH18juJn/v+7vF5e2vfUPXfwkGUvJUKm5TMoRPGXqj4XV/k+bFddcVxHxC8xQf
	+Jw7Hdr/RZ6RXXoIAX5nTi27aL4kcN3I1tuhUjQyIoJRmlJq1o8Cba6opgR7/uw3xxf8
	RChRlHWNzFpXVOrzGZopkoTVdDrG/GgbJnEbvBdeb5AbGZLIrmWymVW7HwuizBeRRNQs
	uwOZ69VeLvHdzgIlx/Cm1K0GKvAgqE4xOebpaRHGwd09ZhPWwZ05mQvuAHSYBQpHTUBh
	gJBQ==
X-Gm-Message-State: AJcUuke79iPM1NL8QD8gsGKQIYhWg98l5aCVQiV26es920fFeodl/wLc
	5RDupbgn/JJ1gVUuQUE2NKmbvBrU
X-Google-Smtp-Source: ALg8bN7J1LMel3E2gUfnYp4itwgHXKyeGqhjWJDIqP1Vdzr406FSL6+mijcjO831ms/iDjVllbfZYQ==
X-Received: by 2002:a05:6000:8a:: with SMTP id
	m10mr12625037wrx.79.1547204085806; 
	Fri, 11 Jan 2019 02:54:45 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	x10sm72616360wrn.29.2019.01.11.02.54.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Jan 2019 02:54:45 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Jan 2019 11:54:36 +0100
Message-Id: <20190111105437.35023-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190111105437.35023-1-alex.kanavin@gmail.com>
References: <20190111105437.35023-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/3] postgresql: correctly build against target perl
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
X-List-Received-Date: Fri, 11 Jan 2019 10:54:45 -0000

Previously perl-native headers were erroneously included,
which was causing issues with the new perl recipe.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index dc8522454..85f19170b 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -37,7 +37,7 @@ LEAD_SONAME = "libpq.so"
 # LDFLAGS for shared libraries
 export LDFLAGS_SL = "${LDFLAGS}"
 
-inherit autotools pkgconfig perlnative pythonnative useradd update-rc.d systemd gettext
+inherit autotools pkgconfig perlnative pythonnative useradd update-rc.d systemd gettext cpan-base
 
 CFLAGS += "-I${STAGING_INCDIR}/${PYTHON_DIR} -I${STAGING_INCDIR}/tcl8.6"
 
@@ -106,6 +106,10 @@ python populate_packages_prepend() {
 
 }
 
+# This will make native perl use target settings (for include dirs etc.)
+export PERLCONFIGTARGET = "${@is_target(d)}"
+export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl5/${@get_perl_version(d)}/${@get_perl_arch(d)}"
+
 do_configure() {
     # do_configure
     autotools_do_configure
@@ -119,7 +123,7 @@ do_configure() {
     BLIBNA="\${STAGING_BASE_LIBDIR_NATIVE}"
     sed -i -e "/^perl_archlibexp/s:${LIBPNA}:${STAGING_LIBDIR}:g" \
         ${B}/src/Makefile.global
-    sed -i -e "/^perl_privlibexp/s:${LIBPNA}:${STAGING_LIBDIR}:g" \
+    sed -i -e "/^perl_privlibexp/s:${libdir}:${STAGING_LIBDIR}:g" \
         ${B}/src/Makefile.global
     # remove the rpath, replace with correct lib path
     sed -i \
-- 
2.17.1


