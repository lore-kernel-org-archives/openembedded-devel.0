Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f41.google.com (mail-yw1-f41.google.com
	[209.85.161.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2159078E71
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 10:09:48 +0000 (UTC)
Received: by mail-yw1-f41.google.com with SMTP id w76-v6so13146099ywg.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 03:09:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PnElX891ryfPddVzC+8HqonYiMWaD+7G1lPZr/cgC0Q=;
	b=S9fKU7nJdMLoILuJ+qCO2NUhZwhvjtvCH6Yf6j8esGK67tpRjpO/qYmTnltatfmLzs
	+ufZgu6qJkVorp7lV0UMi6bmXxaELyuRWTLyGQ/rSh2f1DBaJahT2ii0+ICZn6EVAVvq
	XmTZXzWKYh8FH63yAZu+BlQkpsSWxT2u03TwZJ5aBva2EYLhlL67Ay2dkltv3Qn8RhjL
	r8MBefv0gg3AUgkh1gazTYzaxrdq+uNkGvB83Wbrmr7oX6hiKhjqqqfdvPJB5yDgrSK+
	JcwKkRhzLJmsQgapRZcdHy0HHjGr+Ev5yMoY7KGiubp2dPxheeMhRax58/6j8hFNjrN5
	iHAA==
X-Gm-Message-State: AOUpUlF0nrI2BqgNpeYcZ/q5gfaE2fL00943tJuL51dgsk4QzW7JeKgm
	mWV91tbJVf79JagXOkIwaqUS1IRb
X-Google-Smtp-Source: AA+uWPzyFb9HDZ+igOyanNSHYhI+iAiDAxacvI+0bg0tztc248UCzkitd2XGqu0kU6SnYlscWqlZkg==
X-Received: by 2002:a0d:d981:: with SMTP id
	b123-v6mr8683635ywe.64.1534154989047; 
	Mon, 13 Aug 2018 03:09:49 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	i62-v6sm6918738ywb.54.2018.08.13.03.09.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 03:09:48 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 11:09:33 +0100
Message-Id: <20180813100936.23663-7-git@andred.net>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813100936.23663-1-git@andred.net>
References: <20180813100936.23663-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-java][PATCH 6/9] openjdk-8: gcc-8 fix #2: silence build warnings/errors (return-type)
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
X-List-Received-Date: Mon, 13 Aug 2018 10:09:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Similar to the patch just reverted, we wilence the build warnings
regarding return type of functions, but we only do this for gcc versions
where it matters, now that our infrastructure for doing so works again:

    | <<PKGBUILDDIR>>/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp:223:32: error: control reaches end of non-void function [-Werror=return-type]
    |  #define BREAKPOINT ::breakpoint()
    |                     ~~~~~~~~~~~~^~
    | <<PKGBUILDDIR>>/hotspot/src/share/vm/utilities/debug.hpp:192:3: note: in expansion of macro 'BREAKPOINT'
    |    BREAKPOINT;                                                                \
    |    ^~~~~~~~~~
    | <<PKGBUILDDIR>>/hotspot/src/cpu/aarch64/vm/c1_LIRAssembler_aarch64.cpp:197:2: note: in expansion of macro 'ShouldNotReachHere'
    |   ShouldNotReachHere();
    |   ^~~~~~~~~~~~~~~~~~
    etc.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 recipes-core/openjdk/openjdk-8-common.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index fb97e97..77d905d 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -216,6 +216,7 @@ EXTRA_OECONF_append = "\
 # of these changes.
 FLAGS_GCC6 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
 FLAGS_GCC7 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
+FLAGS_GCC8 = "-Wno-error=return-type"
 
 # All supported cross compilers support the compiler flags that were
 # added to make compilation with gcc6 work. But the host compiler for
-- 
2.18.0


