Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.web10.8305.1613572885483682911
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Feb 2021 06:41:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=LeyGGXQn;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=10693; q=dns/txt;
  s=iport; t=1613572885; x=1614782485;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bCBjH/ghauQ34tIczZi3YmaSTaNsOGe9jwSE75MPWFM=;
  b=LeyGGXQnl075HrhXWDaT1H7gyxZIlxuBdawff0qKqle0XYCHisloQww8
   eRXmbHS5HyJr5y4vgVqttKU1hRcU6SgPdKM3U8sAx7cE3Bja7pFX7FKjr
   zPx+7WQfgw752Z2cK090XgrLN9HbrI/9BesYUqwursN0LHpVVZPfW/3RG
   g=;
X-IronPort-AV: E=Sophos;i="5.81,184,1610409600"; 
   d="scan'208";a="671963597"
Received: from alln-core-9.cisco.com ([173.36.13.129])
  by alln-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 17 Feb 2021 14:41:24 +0000
Received: from sjc-ads-8148.cisco.com (sjc-ads-8148.cisco.com [171.68.208.186])
	by alln-core-9.cisco.com (8.15.2/8.15.2) with ESMTPS id 11HEfO8u017878
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 17 Feb 2021 14:41:24 GMT
Received: by sjc-ads-8148.cisco.com (Postfix, from userid 500841)
	id DAE9CCC1251; Wed, 17 Feb 2021 06:41:23 -0800 (PST)
From: "Oleksiy Obitotskyy" <oobitots@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksiy Obitotskyy <oobitots@cisco.com>
Subject: [meta-oe][PATCH] wireshark-src: improve reproducibility
Date: Wed, 17 Feb 2021 06:41:21 -0800
Message-Id: <20210217144121.38364-1-oobitots@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
MIME-Version: 1.0
X-Outbound-SMTP-Client: 171.68.208.186, sjc-ads-8148.cisco.com
X-Outbound-Node: alln-core-9.cisco.com
Content-Transfer-Encoding: 8bit

What was done:
- add --noline option to flex, --no-line to bison
  and -l to lemon generators to prevent
  adding #line directives with absolute path.
- eliminate absolute source path in python code generator
  and use baseline instead.

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
---
 ...ireshark-src-improve-reproducibility.patch | 44 +++++++++++
 .../0002-flex-Remove-line-directives.patch    | 46 +++++++++++
 .../0003-bison-Remove-line-directives.patch   | 59 ++++++++++++++
 .../0004-lemon-Remove-line-directives.patch   | 77 +++++++++++++++++++
 .../wireshark/wireshark_3.4.3.bb              |  7 ++
 5 files changed, 233 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/0001-wireshark-src-improve-reproducibility.patch
 create mode 100644 meta-networking/recipes-support/wireshark/files/0002-flex-Remove-line-directives.patch
 create mode 100644 meta-networking/recipes-support/wireshark/files/0003-bison-Remove-line-directives.patch
 create mode 100644 meta-networking/recipes-support/wireshark/files/0004-lemon-Remove-line-directives.patch

diff --git a/meta-networking/recipes-support/wireshark/files/0001-wireshark-src-improve-reproducibility.patch b/meta-networking/recipes-support/wireshark/files/0001-wireshark-src-improve-reproducibility.patch
new file mode 100644
index 000000000..0b83ca4ae
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/0001-wireshark-src-improve-reproducibility.patch
@@ -0,0 +1,44 @@
+From 0a9ab056ce7582033a21d6bc541ece520bf2b0b6 Mon Sep 17 00:00:00 2001
+From: Oleksiy Obitotskyy <oobitots@cisco.com>
+Date: Thu, 26 Nov 2020 05:38:31 -0800
+Subject: [PATCH] wireshark-src: improve reproducibility
+
+Cut absolute path for filename in generated code
+comments.
+
+Upstream-Status: Pending
+Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
+---
+ tools/make-plugin-reg.py | 2 +-
+ tools/ncp2222.py         | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tools/make-plugin-reg.py b/tools/make-plugin-reg.py
+index 66b4656..c52b3fc 100755
+--- a/tools/make-plugin-reg.py
++++ b/tools/make-plugin-reg.py
+@@ -28,7 +28,7 @@ preamble = """\
+  *
+  * Generated automatically from %s.
+  */
+-""" % (sys.argv[0])
++""" % (os.path.basename(sys.argv[0]))
+ 
+ # Create the proper list of filenames
+ filenames = []
+diff --git a/tools/ncp2222.py b/tools/ncp2222.py
+index 1dea4ec..dc376e3 100755
+--- a/tools/ncp2222.py
++++ b/tools/ncp2222.py
+@@ -5858,7 +5858,7 @@ def produce_code():
+ 
+     print("/*")
+     print(" * Do not modify this file. Changes will be overwritten.")
+-    print(" * Generated automatically from %s" % (sys.argv[0]))
++    print(" * Generated automatically from %s" % (os.path.basename(sys.argv[0])))
+     print(" */\n")
+ 
+     print("""
+-- 
+2.26.2.Cisco
+
diff --git a/meta-networking/recipes-support/wireshark/files/0002-flex-Remove-line-directives.patch b/meta-networking/recipes-support/wireshark/files/0002-flex-Remove-line-directives.patch
new file mode 100644
index 000000000..069b5793d
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/0002-flex-Remove-line-directives.patch
@@ -0,0 +1,46 @@
+From 3e571e24c730f747d18ed02ba7451e9e00480fc7 Mon Sep 17 00:00:00 2001
+From: Oleksiy Obitotskyy <oobitots@cisco.com>
+Date: Thu, 26 Nov 2020 12:00:43 -0800
+Subject: [PATCH] flex: Remove #line directives
+
+Append --noline option to flex to not
+generate #line directives with absolute file patch.
+
+Upstream-Status: Pending
+Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
+---
+ cmake/modules/FindLEX.cmake | 18 +++++++++++++-----
+ 1 file changed, 13 insertions(+), 5 deletions(-)
+
+diff --git a/cmake/modules/FindLEX.cmake b/cmake/modules/FindLEX.cmake
+index 0008bc4..ec68f84 100644
+--- a/cmake/modules/FindLEX.cmake
++++ b/cmake/modules/FindLEX.cmake
+@@ -32,11 +32,19 @@ MACRO(ADD_LEX_FILES _source _generated)
+       SET(_outc ${CMAKE_CURRENT_BINARY_DIR}/${_basename}.c)
+       SET(_outh ${CMAKE_CURRENT_BINARY_DIR}/${_basename}_lex.h)
+ 
+-      ADD_CUSTOM_COMMAND(
+-        OUTPUT ${_outc} ${_outh}
+-        COMMAND ${LEX_EXECUTABLE} -o${_outc} --header-file=${_outh} ${_in}
+-        DEPENDS ${_in}
+-      )
++      IF (DEFINED ENV{SOURCE_DATE_EPOCH})
++        ADD_CUSTOM_COMMAND(
++          OUTPUT ${_outc} ${_outh}
++          COMMAND ${LEX_EXECUTABLE} --noline -o${_outc} --header-file=${_outh} ${_in}
++          DEPENDS ${_in}
++        )
++      ELSE ()
++        ADD_CUSTOM_COMMAND(
++          OUTPUT ${_outc} ${_outh}
++          COMMAND ${LEX_EXECUTABLE} -o${_outc} --header-file=${_outh} ${_in}
++          DEPENDS ${_in}
++        )
++      ENDIF ()
+       LIST(APPEND ${_source} ${_in})
+       LIST(APPEND ${_generated} ${_outc})
+       INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR})
+-- 
+2.26.2.Cisco
+
diff --git a/meta-networking/recipes-support/wireshark/files/0003-bison-Remove-line-directives.patch b/meta-networking/recipes-support/wireshark/files/0003-bison-Remove-line-directives.patch
new file mode 100644
index 000000000..824761a3d
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/0003-bison-Remove-line-directives.patch
@@ -0,0 +1,59 @@
+From 42abf1d299fed8e00a189f6f9c55fb344e5bb775 Mon Sep 17 00:00:00 2001
+From: Oleksiy Obitotskyy <oobitots@cisco.com>
+Date: Wed, 27 Jan 2021 04:01:34 -0800
+Subject: [PATCH] bison: Remove #line directives
+
+Append --no-lines option to bison to not
+generate #line directives with absolute file path.
+
+Upstream-Status: Pending
+Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
+---
+ cmake/modules/FindYACC.cmake | 31 ++++++++++++++++++++++---------
+ 1 file changed, 22 insertions(+), 9 deletions(-)
+
+diff --git a/cmake/modules/FindYACC.cmake b/cmake/modules/FindYACC.cmake
+index c96f87b..54a73cb 100644
+--- a/cmake/modules/FindYACC.cmake
++++ b/cmake/modules/FindYACC.cmake
+@@ -29,15 +29,28 @@ MACRO(ADD_YACC_FILES _source _generated)
+ 
+       SET(_out ${CMAKE_CURRENT_BINARY_DIR}/${_basename}.c)
+ 
+-      ADD_CUSTOM_COMMAND(
+-         OUTPUT ${_out}
+-         COMMAND ${YACC_EXECUTABLE}
+-           -d
+-           -p ${_basename}
+-           -o${_out}
+-           ${_in}
+-         DEPENDS ${_in}
+-      )
++      IF (DEFINED ENV{SOURCE_DATE_EPOCH})
++         ADD_CUSTOM_COMMAND(
++            OUTPUT ${_out}
++            COMMAND ${YACC_EXECUTABLE}
++              --no-lines
++              -d
++              -p ${_basename}
++              -o${_out}
++              ${_in}
++            DEPENDS ${_in}
++         )
++      ELSE ()
++         ADD_CUSTOM_COMMAND(
++            OUTPUT ${_out}
++            COMMAND ${YACC_EXECUTABLE}
++              -d
++              -p ${_basename}
++              -o${_out}
++              ${_in}
++            DEPENDS ${_in}
++         )
++      ENDIF ()
+       LIST(APPEND ${_source} ${_in})
+       LIST(APPEND ${_generated} ${_out})
+    ENDFOREACH (_current_FILE)
+-- 
+2.26.2.Cisco
+
diff --git a/meta-networking/recipes-support/wireshark/files/0004-lemon-Remove-line-directives.patch b/meta-networking/recipes-support/wireshark/files/0004-lemon-Remove-line-directives.patch
new file mode 100644
index 000000000..c1a528f90
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/0004-lemon-Remove-line-directives.patch
@@ -0,0 +1,77 @@
+From 17f05a8d02c589e4867906f70381e63e46a67870 Mon Sep 17 00:00:00 2001
+From: Oleksiy Obitotskyy <oobitots@cisco.com>
+Date: Wed, 27 Jan 2021 06:47:13 -0800
+Subject: [PATCH] lemon: Remove #line directives
+
+In case of reproducible build remove #line
+directives with extra option '-l'.
+
+Upstream-Status: Pending
+Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
+---
+ cmake/modules/UseLemon.cmake | 49 +++++++++++++++++++++++++-----------
+ 1 file changed, 34 insertions(+), 15 deletions(-)
+
+diff --git a/cmake/modules/UseLemon.cmake b/cmake/modules/UseLemon.cmake
+index 849ffc1..ca38ab7 100644
+--- a/cmake/modules/UseLemon.cmake
++++ b/cmake/modules/UseLemon.cmake
+@@ -7,21 +7,40 @@ MACRO(ADD_LEMON_FILES _source _generated)
+ 
+       SET(_out ${CMAKE_CURRENT_BINARY_DIR}/${_basename})
+ 
+-      ADD_CUSTOM_COMMAND(
+-         OUTPUT
+-          ${_out}.c
+-          # These files are generated as side-effect
+-          ${_out}.h
+-          ${_out}.out
+-         COMMAND lemon
+-           -T${_lemonpardir}/lempar.c
+-           -d.
+-           ${_in}
+-         DEPENDS
+-           ${_in}
+-           lemon
+-           ${_lemonpardir}/lempar.c
+-      )
++      IF (DEFINED ENV{SOURCE_DATE_EPOCH})
++        ADD_CUSTOM_COMMAND(
++          OUTPUT
++            ${_out}.c
++            # These files are generated as side-effect
++            ${_out}.h
++            ${_out}.out
++          COMMAND lemon
++            -l
++            -T${_lemonpardir}/lempar.c
++            -d.
++            ${_in}
++          DEPENDS
++            ${_in}
++            lemon
++            ${_lemonpardir}/lempar.c
++        )
++      ELSE ()
++        ADD_CUSTOM_COMMAND(
++          OUTPUT
++            ${_out}.c
++            # These files are generated as side-effect
++            ${_out}.h
++            ${_out}.out
++          COMMAND lemon
++            -T${_lemonpardir}/lempar.c
++            -d.
++            ${_in}
++          DEPENDS
++            ${_in}
++            lemon
++            ${_lemonpardir}/lempar.c
++        )
++      ENDIF ()
+ 
+       LIST(APPEND ${_source} ${_in})
+       LIST(APPEND ${_generated} ${_out}.c)
+-- 
+2.26.2.Cisco
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.3.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.3.bb
index 1c470d8bc..e730b18a0 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.3.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.3.bb
@@ -10,6 +10,13 @@ DEPENDS_append_class-target = " wireshark-native chrpath-replacement-native "
 
 SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz"
 
+SRC_URI += " \
+    file://0001-wireshark-src-improve-reproducibility.patch \
+    file://0002-flex-Remove-line-directives.patch \
+    file://0003-bison-Remove-line-directives.patch \
+    file://0004-lemon-Remove-line-directives.patch \
+"
+
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
 SRC_URI[sha256sum] = "f467cc77f0fc73fce0b854cdbc292f132d4879fca69d417eccad5f967fbf262b"
-- 
2.26.2.Cisco

