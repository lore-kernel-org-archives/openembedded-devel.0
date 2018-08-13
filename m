Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
	[209.85.161.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5842878E25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 10:09:50 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id s68-v6so13143794ywg.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 03:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=C7JFBcndPpj7pmcHcdsuc3dNXWY/p22TMxWl3ha2nVQ=;
	b=P3QlI7gyE9DAKj/Yjd0SGR44M7o1CwH0ZVALsAfcoYx9KvXCANyyqtwPWctYZ7A1uU
	XOM3Svybcl8suES0FTWlSbZ0aj7uOMVADuPk5g2a/RoK2yRzjvEgBPIvsu9xPEXN4fhj
	iY98/HJOCBJTuCxTu97LzI31HY0y1LZDUAX1pF82AQ+Kpcd165eImKaRgxLm9oari7yg
	eTJEiySmTyfITIJyRePUrNw9MyLc/Lg3jq7jwrE5pjtEY78giVsIjAQW0M5GAPyGfH9T
	pH0Lo07xX1xqrLVuem4ml68jNfI1pkDpiS9DAJ6XRWRPHBnvBXyyPeWvm/Hj5fbwIs5F
	2xIg==
X-Gm-Message-State: AOUpUlFQX8USq5b2B3Vvn+4nnXWfQMErIpww1Z3RAf8ru8BbxQfeqkc6
	4jfNiZ7O7slw2uM7DpzeqjbvNcKa
X-Google-Smtp-Source: AA+uWPwX+dlaRFwGEkTaEHlFo3/PVEaOAmlM2yRKCEZKIREemlEVS6OCkXQYVxHWRYg5NcDt5da3fw==
X-Received: by 2002:a25:abac:: with SMTP id
	v41-v6mr6717731ybi.225.1534154991228; 
	Mon, 13 Aug 2018 03:09:51 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	i62-v6sm6918738ywb.54.2018.08.13.03.09.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 03:09:50 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 11:09:35 +0100
Message-Id: <20180813100936.23663-9-git@andred.net>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813100936.23663-1-git@andred.net>
References: <20180813100936.23663-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-java][PATCH 8/9] openjdk-8: gcc-8 fix #3: working binaries
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
X-List-Received-Date: Mon, 13 Aug 2018 10:09:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Similar to the existing gcc-6 and gcc-7 support, we need to
add the same specific compiler flags to avoid miscompilation
on gcc-8:
  -fno-lifetime-dse
  -fno-delete-null-pointer-checks

With this,
    bitbake -c testimage openjdk-8-test-image
works again for x86_64 and aarch64:
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

NOTE: armv5e still doesn't work with gcc v8, and other arches
weren't tested.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 recipes-core/openjdk/openjdk-8-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index 77d905d..aaa4483 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -216,7 +216,7 @@ EXTRA_OECONF_append = "\
 # of these changes.
 FLAGS_GCC6 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
 FLAGS_GCC7 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
-FLAGS_GCC8 = "-Wno-error=return-type"
+FLAGS_GCC8 = "-fno-lifetime-dse -fno-delete-null-pointer-checks -Wno-error=return-type"
 
 # All supported cross compilers support the compiler flags that were
 # added to make compilation with gcc6 work. But the host compiler for
-- 
2.18.0


