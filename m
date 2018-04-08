Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9A2E275596
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:25 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id y12-v6so3103425plt.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=RmjPIO2TqvxFa2vrRL0YjASE6dc1V+IayERgGAbxFZ0=;
	b=CHY8Oyo2c/psd0SB09dtCDbFyM4lH/Xgyg5lGTha/KJNDqBcqS2fVg3fN61iWh9d6T
	uzpeAjSPaDyTrkzD5gmJc4zzbl63Vtkad38SlNQoMNWq6p4I69kV84R8JcPmZ/rRNHMK
	bYIFAl/VlUNyL0t0jTnO1vVJoqIp/Dehoa5zyUMo/3skRhIPiKH1hWNofhtwp+NQ8WhE
	5OkCU8qOeM/fFxF6R0Taqkr1UFZCuumz6Uj/KhIlSmCM/yK5183PFu18MZZHOIg6UU3i
	5z4SOC2F9gaQghJwX0qXdu5olikmvc1oeUghgNiOiOk7ON4bV+FRVGLXucAn6Q4f4U2o
	xd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=RmjPIO2TqvxFa2vrRL0YjASE6dc1V+IayERgGAbxFZ0=;
	b=Mh8XzGyHE4+uQpNQrjM3MShkCzssa08ZUeqEdiaWA+nHmzt8gL/DvCJgkdAVhn2f11
	rrPar681EqhvNxTlafKKI97bxa8HF+1gyhfyDlrrdW0EiZYYm7qn4mD0+g+/9OqNVSui
	B+7XpLdEQYlbt7YOItG58HFgDCXo+Z7oMP0s9WLzRWdIW80WJmQeYEyL6UpA4gXi7OeY
	x4v34kk2C/Gs/HEH4Kwy9b71qrKmESffKjl+MpCHL9DtSLoNhgp5oLZKHK0RbP0yUOCt
	RtveoQ5Gc/w8e8rRALIyUc4HetW78PuzEJXrFYLm35RHfAcjcN3rZ0K1PcwxTVZKMAQt
	t2Uw==
X-Gm-Message-State: ALQs6tC1QvcMhWpmmAB8SeNG/8KbSpXRVdjDLUI8pitetzUGAxvUk2ya
	cJy6NvEf3lY5KXN7d6rUwC5tQw==
X-Google-Smtp-Source: AIpwx48fB4QTWn8LGfVLfv5rj2zFMSADZV6xIcg0j3orpWoFtAfZufVBMhKm3h/5VQXtxdzi4h1Gfw==
X-Received: by 2002:a17:902:4324:: with SMTP id
	i33-v6mr20906684pld.379.1523170766845; 
	Sat, 07 Apr 2018 23:59:26 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:47 -0700
Message-Id: <1523170729-26321-35-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 35/37] openipmi: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:59:25 -0000

WARNING: openipmi-2.0.24-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch include_sys_types.patch
patching file ui/ui.c
Hunk #1 succeeded at 42 with fuzz 1.

Now at patch include_sys_types.patch

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openipmi/files/fix-symlink-install-error-in-cmdlang.patch  | 10 +++++-----
 .../recipes-support/openipmi/files/include_sys_types.patch     |  8 ++++----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-networking/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch b/meta-networking/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch
index 9a568b2..449142f 100644
--- a/meta-networking/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch
+++ b/meta-networking/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch
@@ -8,11 +8,11 @@ Date:   Thu Jun 7 16:00:13 2012 -0400
     
     Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
 
-diff --git a/cmdlang/Makefile.am b/cmdlang/Makefile.am
-index 92d6e83..f6039f9 100644
---- a/cmdlang/Makefile.am
-+++ b/cmdlang/Makefile.am
-@@ -36,6 +36,7 @@ CLEANFILES = libOpenIPMIcmdlang.map
+Index: OpenIPMI-2.0.24/cmdlang/Makefile.am
+===================================================================
+--- OpenIPMI-2.0.24.orig/cmdlang/Makefile.am
++++ OpenIPMI-2.0.24/cmdlang/Makefile.am
+@@ -35,6 +35,7 @@ openipmish_LDADD =  libOpenIPMIcmdlang.l
  # compatability.
  install-data-local:
  	rm -f $(DESTDIR)$(bindir)/ipmish
diff --git a/meta-networking/recipes-support/openipmi/files/include_sys_types.patch b/meta-networking/recipes-support/openipmi/files/include_sys_types.patch
index 58ec5d8..082511a 100644
--- a/meta-networking/recipes-support/openipmi/files/include_sys_types.patch
+++ b/meta-networking/recipes-support/openipmi/files/include_sys_types.patch
@@ -3,10 +3,10 @@ include sys/types.h for u_int32_t
 ui.c:340:5: error: unknown type name 'u_int32_t'; did you mean 'uint32_t'?
      u_int32_t     addr;
      ^~~~~~~~~
-Index: OpenIPMI-2.0.22/ui/ui.c
+Index: OpenIPMI-2.0.24/ui/ui.c
 ===================================================================
---- OpenIPMI-2.0.22.orig/ui/ui.c
-+++ OpenIPMI-2.0.22/ui/ui.c
+--- OpenIPMI-2.0.24.orig/ui/ui.c
++++ OpenIPMI-2.0.24/ui/ui.c
 @@ -42,6 +42,7 @@
  #include <fcntl.h>
  #include <time.h>
@@ -14,4 +14,4 @@ Index: OpenIPMI-2.0.22/ui/ui.c
 +#include <sys/types.h>
  #include <ctype.h>
  
- #include <OpenIPMI/selector.h>
+ #include <OpenIPMI/ipmi_err.h>
-- 
2.7.4


