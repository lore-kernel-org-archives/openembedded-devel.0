Return-Path: <jpuhlman@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 150817E862
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 21:57:39 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id f19so15874352plr.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 14:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=F+BUDnRgTsAGjLqDSqlu1ow6BHP6xmAknpEHMkdG8lw=;
	b=HPErSuF86QPcz6YxJnyOfE+yrFK5ai+LUuzWc2Faug8puEX9Eo7L3omiYpQjG5Fi4i
	Jn3um339ghTtBocM/5Qu3G+JnEp46UHeVhJo3BnmSc4mWGyHW450vEf1GgZN/96L9Oc8
	ABsKITKRXthFW2t039u/W5ysKSmpSDNB31Cs17JFO6yuOBRrg7o8Iw/UannaDxE+yK3p
	8eFahRKLDgG9nJU6Qpq2GLLdwNOsT9CrE0lJ0AseXrXs+VRl37PV8eLLZRc7VCiqsOri
	d1wfqvLF8Gd7U14OHn0l3giqOL+DDZsWy8JVYWmKpFLkeKerlJ56TLUHGoJRrrilucs+
	EvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=F+BUDnRgTsAGjLqDSqlu1ow6BHP6xmAknpEHMkdG8lw=;
	b=puhm2N7U1VKa1VPhG5/JhDBCL3GsoM68ohLAtHFUrH9hdqXjspag8zIVHcu352BGqt
	ShUsQTOw1ekOhYMQRmJ3OEH9W7oulcvWzy2ie/BbcViynoeZGYjLRfVItAWeGs5wbgaH
	Tty6eI4egmz119fHgQTUD4odLRGp6vMZQb94/AatEdhGru14+/PMaxG7xdUBOJupmzfs
	53GeG/b8oMrOAnw7umiDK79Kx9AkFYV6N/uyugUQfefjCd53xIj0lFZvv2Ix37SlH6bd
	hI8Zhfa/HeZYHvFDvqj5eKoQ4tFn8g5gYHR7zPCsrvN3cyMQqfWEeZF1IXFzjmgYIuFB
	QdHA==
X-Gm-Message-State: APjAAAUJRKl2nB/N0ifzRP05ey2Ibn/qWOGpOKNfFRohtsSNTgpFFA6A
	rtKkAp70ztdw9e/lyW0YnyksnhMJ
X-Google-Smtp-Source: APXvYqzLHta9q+Xi3P17N7fuStuW8tPiBNusS95q/VDMFyK/9aXJD5Lxit1wrM/P1FUdIM3TsnCSrw==
X-Received: by 2002:a17:902:bf0a:: with SMTP id
	bi10mr22258127plb.185.1568584660686; 
	Sun, 15 Sep 2019 14:57:40 -0700 (PDT)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id
	p14sm33674531pfn.138.2019.09.15.14.57.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 14:57:40 -0700 (PDT)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id B1FBD2A0A1A; Sun, 15 Sep 2019 08:58:13 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Sep 2019 08:58:04 -0700
Message-Id: <20190915155804.18326-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-clang][PATCH] Turn off wchar in editline for native*
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
X-List-Received-Date: Sun, 15 Sep 2019 21:57:40 -0000
Content-Transfer-Encoding: 8bit

| In file included from /build/poky/build/tmp/work-shared/llvm-project-source-9.0.0-r0/git/lldb/source/Core/IOHandler.cpp:31:0:
| /build/poky/build/tmp/work-shared/llvm-project-source-9.0.0-r0/git/lldb/include/lldb/Host/Editline.h:36:19:
| fatal error: codecvt: No such file or directory
|  #include <codecvt>
|                    ^

wchar causes codecvt to be included, which does not exist on centos7, which
prevents clang-native from building.

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 recipes-devtools/clang/clang_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-devtools/clang/clang_git.bb b/recipes-devtools/clang/clang_git.bb
index ba69243..9278bd6 100644
--- a/recipes-devtools/clang/clang_git.bb
+++ b/recipes-devtools/clang/clang_git.bb
@@ -74,7 +74,7 @@ LLVM_BINDINGS_LIST;LLVM_ENABLE_FFI;FFI_INCLUDE_DIR;LLVM_OPTIMIZED_TABLEGEN;\
 LLVM_ENABLE_RTTI;LLVM_ENABLE_EH;LLVM_BUILD_EXTERNAL_COMPILER_RT;CMAKE_SYSTEM_NAME;\
 CMAKE_BUILD_TYPE;BUILD_SHARED_LIBS;LLVM_ENABLE_PROJECTS;LLVM_BINUTILS_INCDIR;\
 LLVM_TARGETS_TO_BUILD;LLVM_EXPERIMENTAL_TARGETS_TO_BUILD;PYTHON_EXECUTABLE;\
-PYTHON_LIBRARY;PYTHON_INCLUDE_DIR;LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN;\
+PYTHON_LIBRARY;PYTHON_INCLUDE_DIR;LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN;LLDB_EDITLINE_USE_WCHAR;\
 "
 #
 # Default to build all OE-Core supported target arches (user overridable).
@@ -114,6 +114,7 @@ EXTRA_OECMAKE_append_class-native = "\
                   -DLLVM_TARGETS_TO_BUILD='${LLVM_TARGETS_TO_BUILD}' \
                   -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD='${LLVM_EXPERIMENTAL_TARGETS_TO_BUILD}' \
                   -DPYTHON_EXECUTABLE='${PYTHON}' \
+                  -DLLDB_EDITLINE_USE_WCHAR=0 \
 "
 EXTRA_OECMAKE_append_class-nativesdk = "\
                   -DCMAKE_CROSSCOMPILING:BOOL=ON \
@@ -128,6 +129,7 @@ EXTRA_OECMAKE_append_class-nativesdk = "\
                   -DLLDB_TABLEGEN=${STAGING_BINDIR_NATIVE}/lldb-tblgen \
                   -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so \
                   -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} \
+                  -DLLDB_EDITLINE_USE_WCHAR=0 \
 "
 EXTRA_OECMAKE_append_class-target = "\
                   -DCMAKE_CROSSCOMPILING:BOOL=ON \
-- 
2.20.1


