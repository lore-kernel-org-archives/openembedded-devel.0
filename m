Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	by mail.openembedded.org (Postfix) with ESMTP id B031D6086F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Aug 2018 00:26:51 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id l9-v6so2977910ywc.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Aug 2018 17:26:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=smhFlGDr4IYhg8qmXPfE32MW1PdN8+KyWgXZOj1H+Cw=;
	b=heoxxd31kizheaYFpMPnNdIFAQ6plOQAs4gNqqglg6Ox9T9RxTnmP6uCds7v2hQC8e
	ULkiCbYxUbKtKTR6AX/YL5JP2zkJb2wvt6o7VjW/SoO5gUZOtT9vdUOOQuHJLMFiZr8+
	x78MC77pJufiA/BMaQAHOvMMUpTQQqW5uPmBk9ST8Bdkd9/G/lWYc1JKJYsu2f7PH384
	hQ9yYd78MLVjvccn+AtQZerlI6kzlv4iSHVGcGQ01fVCwzzi/T3Qjgh7K6NvP+RLBsFL
	JgHVvLdzHCwLHgmsjZiLMIXfGZnULB9aLFKvbBN372vaKI0Vwydi6w6m9UwFXsgP2p+5
	4fRg==
X-Gm-Message-State: AOUpUlEmTeMWCIncq7XBrZirrWtQazMJkV6fdue+XeDGVskSidogglnN
	msgkhOcj+xu5EqoprAStDtToP6zm
X-Google-Smtp-Source: AA+uWPxGp+eU053hQC3nT0OyQEdi8r4cOI1YmYYIFejYpW5UoqZ5hUAoZwAk3iy8Vedo0pOPjIjzPQ==
X-Received: by 2002:a0d:cec1:: with SMTP id
	q184-v6mr2725909ywd.60.1533774412736; 
	Wed, 08 Aug 2018 17:26:52 -0700 (PDT)
Received: from tfsielt31850.jci.com (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	u67-v6sm2132354ywa.56.2018.08.08.17.26.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Aug 2018 17:26:52 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Aug 2018 01:26:44 +0100
Message-Id: <20180809002644.18549-4-git@andred.net>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180809002644.18549-1-git@andred.net>
References: <20180809002644.18549-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-java][master-next][PATCH 4/4] openjdk-8: update to work with gcc v8
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
X-List-Received-Date: Thu, 09 Aug 2018 00:26:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Similar to the existing gcc-6 and gcc-7 support, we need to
add the same specific compiler flags to avoid miscompilation
on gcc-8:
  -fno-lifetime-dse
  -fno-delete-null-pointer-checks

In addition, gcc v8 introduces new warnings (which are
treated as errors), which we can just silence for the
time being:

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

And
| <<PKGBUILDDIR>>/hotspot/src/share/vm/runtime/arguments.cpp:3811:14: error: 'char* strncat(char*, const char*, size_t)' specified bound 1 equals source length [-Werror=stringop-overflow=]
|        strncat(shared_archive_path, os::file_separator(), file_sep_len);
|        ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| <<PKGBUILDDIR>>/hotspot/src/share/vm/runtime/arguments.cpp: In static member function 'static void Arguments::fix_appclasspath()':
| <<PKGBUILDDIR>>/hotspot/src/share/vm/runtime/arguments.cpp:3433:12: error: 'char* strncpy(char*, const char*, size_t)' specified bound depends on the length of the source argument [-Werror=stringop-overflow=]
|      strncpy(copy, src, strlen(src) + 1);
|      ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| <<PKGBUILDDIR>>/hotspot/src/share/vm/runtime/arguments.cpp:3433:30: note: length computed here
|      strncpy(copy, src, strlen(src) + 1);
|                         ~~~~~~^~~~~
| <<PKGBUILDDIR>>/hotspot/src/share/vm/runtime/arguments.cpp:3433:12: error: 'char* strncpy(char*, const char*, size_t)' specified bound depends on the length of the source argument [-Werror=stringop-overflow=]
|      strncpy(copy, src, strlen(src) + 1);
|      ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| <<PKGBUILDDIR>>/hotspot/src/share/vm/runtime/arguments.cpp:3433:30: note: length computed here
|      strncpy(copy, src, strlen(src) + 1);
|                         ~~~~~~^~~~~
etc.

With this,
    bitbake -c testimage openjdk-8-test-image
works again:
RESULTS:
RESULTS - ping.PingTest.test_ping - Testcase 964: PASSED (0.12s)
RESULTS - ssh.SSHTest.test_ssh - Testcase 224: PASSED (1.20s)
RESULTS - java.JavaTest.test_java_exists - Testcase -1: PASSED (0.15s)
RESULTS - java.JavaTest.test_java_jar_comp_mode - Testcase -1: PASSED (41.98s)
RESULTS - java.JavaTest.test_java_jar_int_mode - Testcase -1: PASSED (1.76s)
RESULTS - java.JavaTest.test_java_jar_works - Testcase -1: PASSED (2.13s)
RESULTS - java.JavaTest.test_java_version - Testcase -1: PASSED (1.51s)
RESULTS - javac.JavacTest.test_javac_exists - Testcase -1: PASSED (0.11s)
RESULTS - javac.JavacTest.test_javac_works - Testcase -1: PASSED (17.64s)
SUMMARY:
openjdk-8-test-image () - Ran 9 tests in 67.112s
openjdk-8-test-image - OK - All required tests passed

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 recipes-core/openjdk/openjdk-8-common.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index 3b328e9..79af54a 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -216,6 +216,7 @@ EXTRA_OECONF_append = "\
 # of these changes.
 FLAGS_GCC6 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
 FLAGS_GCC7 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
+FLAGS_GCC8 = "-fno-lifetime-dse -fno-delete-null-pointer-checks -Wno-error=stringop-overflow -Wno-error=return-type"
 
 # All supported cross compilers support the compiler flags that were
 # added to make compilation with gcc6 work. But the host compiler for
-- 
2.18.0


