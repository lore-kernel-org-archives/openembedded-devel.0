Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web12.12406.1614097647863704568
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Feb 2021 08:27:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=X3mNuj8Q;
 spf=pass (domain: gherzan.com, ip: 66.111.4.25, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 3098B5C00D3;
	Tue, 23 Feb 2021 11:27:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 23 Feb 2021 11:27:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=fm1; bh=EkVCpMTWrJJTkzSiimUgujf+9U
	SLVBeX7M4osnFt3wE=; b=X3mNuj8QuSGLsiFtPLwLBAuRGm0f7VXnGfGPEJUkWh
	6Ygsd14ck1yDeqJKQNIjo7ooqyTMgomAPB5rcxgAWGJ9UFdQ2/Y6PO4w8130G5Db
	IBcKNHWEQYIydITJOhBLs1pvr+k7eEA396PQq8uqDTmwwD6NsMHADClg76JX06SC
	fQFp/tLXWHYT7A+17InsRqWUn6B6OrdTpXa4e4NX/4vnNumaOKLtQdJZwvxHr1BL
	VtroughDbNJei41gFVQJhrKrtgIgA/VJAyzP7vaFKg6aKuljjlevQejKrUtDohcE
	5AKlYNzQCQmVYgDaUjKHpkJI3RSNqUX4w2t94kSJfZhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:message-id:mime-version:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=EkVCpM
	TWrJJTkzSiimUgujf+9USLVBeX7M4osnFt3wE=; b=PXaYzdnmClyG7mmS9vHjkP
	lpouqzgWms0CfYvRRNyg/O+I1L7JSE9Ct22kJzk+/4w5m9Rv6WuCQgoVpI//q1DE
	iZlljLUx+IR7Slx6vfn47Vov6dhPw1gDvAxC+ARyZwSqCs7zsJCodPjAcQAJrL/r
	gHnm6OAZI05QvUfp9RGoyrygo8bxfIaRxu4M+7waWca4pCILSuV+RrXMb3JsnV5o
	b5MY/fgUbpmKzvxYe55J/NdfU/KrjHGKLHpzOd6l0XPLGwlj8pPcAMzLUqs9Apx4
	AstMafUgXwsHjWZev12M9ZHIyNhCeeqTl5zUwVPTHzqQ7FzPZnV6Aa8Cruzg7PvA
	==
X-ME-Sender: <xms:7iw1YGHLMT39dJAiAyItmr8il88JyblDs0hqBkEbMZBnz0SWs17j8A>
    <xme:7iw1YHXaTq5AjZ0FdCVba4Z0xuVcyj3k0WbZ2AMrm-94dme1ElvwAGcJV0C_5f0Vh
    Sf7roRP3vSYnySEmjA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeehgdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhgurhgvihcu
    ifhhvghriigrnhcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqnecuggftrfgrth
    htvghrnhepgeehjeeufefhffdttddvgfegkeduhfevheegteejjeekleetfeehieejffff
    hfegnecukfhppedutdelrddugeeirdefjedrudekvdenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtgho
    mh
X-ME-Proxy: <xmx:7iw1YAJ6FOH-0T7EYmHGtqxReXjMJvC7kP_HlLN1Yiw2zC7qsc008A>
    <xmx:7iw1YAErEbbqRQW29EuQMaxq2EKdC6F8llaSWzyr1oN3IuVrVBB67A>
    <xmx:7iw1YMX5IbFlJGb9Twcr8SnLz3Kka8FiQ0AvY_CVs_Y4uEeA0MwtuQ>
    <xmx:7yw1YPAGhh82QvbXi7rE_QkIrKuKpCUxXJbkpm1FfcKyZsQoMgmZfw>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id 63021240064;
	Tue, 23 Feb 2021 11:27:26 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH] nss: Disable Werror across all recipe types
Date: Tue, 23 Feb 2021 16:27:05 +0000
Message-Id: <20210223162705.2595483-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

We are seeing warnigs with gcc-10 even on target builds e.g.

| In file included from nsinstall.c:20:
| /usr/include/unistd.h:520:14: note: in a call to function ‘getcwd’ declared with attribute ‘write_only (1, 2)’
|   520 | extern char *getcwd (char *__buf, size_t __size) __THROW __wur
|       |              ^~~~~~
| nsinstall.c:70:16: error: argument 1 is null but the corresponding size argument 2 value is 4096 [-Werror=nonnull]
|    70 | #define GETCWD getcwd
|       |                ^
| nsinstall.c:246:13: note: in expansion of macro ‘GETCWD’
|   246 |     todir = GETCWD(0, PATH_MAX);
|       |             ^~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/nss/nss_3.51.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/nss/nss_3.51.1.bb b/meta-oe/recipes-support/nss/nss_3.51.1.bb
index 3e3c3a3fd..348c2c13f 100644
--- a/meta-oe/recipes-support/nss/nss_3.51.1.bb
+++ b/meta-oe/recipes-support/nss/nss_3.51.1.bb
@@ -62,7 +62,6 @@ do_configure_prepend_libc-musl () {
 do_compile_prepend_class-native() {
     export NSPR_INCLUDE_DIR=${STAGING_INCDIR_NATIVE}/nspr
     export NSPR_LIB_DIR=${STAGING_LIBDIR_NATIVE}
-    export NSS_ENABLE_WERROR=0
 }
 
 do_compile_prepend_class-nativesdk() {
@@ -76,6 +75,7 @@ do_compile_prepend_class-native() {
 
 do_compile() {
     export NSPR_INCLUDE_DIR=${STAGING_INCDIR}/nspr
+    export NSS_ENABLE_WERROR=0
 
     export CROSS_COMPILE=1
     export NATIVE_CC="${BUILD_CC}"
-- 
2.30.1

