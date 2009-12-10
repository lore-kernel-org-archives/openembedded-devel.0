Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NIqnh-00016w-VV
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Dec 2009 22:43:57 +0100
Received: by ywh8 with SMTP id 8so258227ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Dec 2009 13:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=6C1joIaEUfYG05pFd+jsKkMhqMkjBgAuhlUxDnQWgNo=;
	b=HJuVzzs5Xt26BG/OOko/kGQa7cigHtTti6spACAO2/TXpm+7ds94KgBUhrgc6sd+kG
	1Gr3OvaK9YVoOevo3UkAOqR8RBMBsjNYuxMpqJ8D1iWigngoRqwoEYrwa891TQGUFN3B
	ZLsNru9n8JozqSIRaebCDjL6R0vzndZsj7Xng=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Kn2CWfUJLpKLKBx/H+OM7pBEzjVX0aA3TCDo8XNijK34ejfvVCk88bzYhL3amjK/0l
	jp3fcjgGYI/h7Tv9kBmUj+uFnKc3R62GHBPu1WFAr0+DfyGsJAho21fFNbit96sFDwYY
	u3QiAmxoeB16+4dEbY3n2cu/AKnU3DFtl0/To=
Received: by 10.101.180.19 with SMTP id h19mr758747anp.137.1260481331260;
	Thu, 10 Dec 2009 13:42:11 -0800 (PST)
Received: from localhost (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 39sm565933yxd.9.2009.12.10.13.42.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 10 Dec 2009 13:42:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	 likewise@gmx.net
Date: Thu, 10 Dec 2009 13:42:07 -0800
Message-Id: <1260481327-20553-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] site: Move socat defines to common-linux
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Dec 2009 21:43:57 -0000

* socat ispeed is a runtime test in configure
  which wont be evaluated correctly on cross
  builds. Therefore the cashed variable should be
  pre-defined for every architecture on linux.

* Fixes PR 5320

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 site/arm-common     |    4 ----
 site/common-linux   |    4 ++++
 site/powerpc-common |    4 ----
 site/sh-common      |    4 ----
 4 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/site/arm-common b/site/arm-common
index 20de8c5..588d5d9 100644
--- a/site/arm-common
+++ b/site/arm-common
@@ -200,10 +200,6 @@ ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
 ac_cv_func_malloc_works=${ac_cv_func_malloc_works=yes}
 ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
 
-# socat
-ac_cv_ispeed_offset=${ac_cv_ispeed_offset=13}
-sc_cv_termios_ispeed=${sc_cv_termios_ispeed=yes}
-
 # ssh
 ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_dirent_have_space_d_name=yes}
 ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
diff --git a/site/common-linux b/site/common-linux
index ffb209b..eaaff66 100644
--- a/site/common-linux
+++ b/site/common-linux
@@ -25,3 +25,7 @@ bash_cv_pgrp_pipe=${bash_cv_pgrp_pipe=no}
 bash_cv_job_control_missing=${bash_cv_job_control_missing=present}
 bash_cv_sys_named_pipes=${bash_cv_sys_named_pipes=present}
 bash_cv_unusable_rtsigs=${bash_cv_unusable_rtsigs=no}
+
+# socat
+ac_cv_ispeed_offset=${ac_cv_ispeed_offset=13}
+sc_cv_termios_ispeed=${sc_cv_termios_ispeed=yes}
diff --git a/site/powerpc-common b/site/powerpc-common
index dd321c0..a3c774a 100644
--- a/site/powerpc-common
+++ b/site/powerpc-common
@@ -85,10 +85,6 @@ ac_cv_func_lstat_empty_string_bug=${ac_cv_func_lstat_empty_string_bug=no}
 ac_cv_func_stat_empty_string_bug=${ac_cv_func_stat_empty_string_bug=no}
 ac_cv_func_stat_ignores_trailing_slash=${ac_cv_func_stat_ignores_trailing_slash=no}
 
-# socat
-ac_cv_ispeed_offset=${ac_cv_ispeed_offset=13}
-sc_cv_termios_ispeed=${sc_cv_termios_ispeed=yes}
-
 # links
 ac_cv_lib_png_png_create_info_struct=${ac_cv_lib_png_png_create_info_struct=yes}
 
diff --git a/site/sh-common b/site/sh-common
index dd955d9..c00102b 100644
--- a/site/sh-common
+++ b/site/sh-common
@@ -76,10 +76,6 @@ ac_cv_func_lstat_empty_string_bug=${ac_cv_func_lstat_empty_string_bug=no}
 ac_cv_func_stat_empty_string_bug=${ac_cv_func_stat_empty_string_bug=no}
 ac_cv_func_stat_ignores_trailing_slash=${ac_cv_func_stat_ignores_trailing_slash=no}
 
-# socat
-ac_cv_ispeed_offset=${ac_cv_ispeed_offset=13}
-sc_cv_termios_ispeed=${sc_cv_termios_ispeed=yes}
-
 # links
 ac_cv_lib_png_png_create_info_struct=${ac_cv_lib_png_png_create_info_struct=yes}
 
-- 
1.5.4.3



