Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 150807558F
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:22 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id j2so3719243pff.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=oSCmKW/vFleZzpH2nlUZS38GdheAxIRhrnAPSmbkbm0=;
	b=nAzROXbzNioen6UxtVxYF0rHqTwfQRAZebRW1PrBUrgKFwoWpgKTsCz/EWATwMJ1uo
	KFPgEZaLwfzatj/SINiW/Dsn67ZuNqNZspOUiGSiZ7EkADlW/XA4HAMfVFk/p7JefqMm
	+i/Lw10CI6pvmisffgHGp49lgJlVsajXitQr+X7lUGV48q9tduqZQtOocr0B3Yo0tbeC
	vPEnLXuQnc+dgjxJCsJiVarGRilEGVYHe/RqE/sIc/gyD3iRrKgIXbPE0cGep+FmlpRd
	H3efluUCLl+BYCq/vFlOIfhpDEW9ZVMVtZSiKzba3NcI7t22EviikWbDPmv6j7b1yshU
	Lg0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=oSCmKW/vFleZzpH2nlUZS38GdheAxIRhrnAPSmbkbm0=;
	b=DR8hEFdpcJlwXhXKSqcGDa+8NvVQngN8xWDx9VBz3K4LyA8m3x775xrH/JD1Rkw718
	nfpKOXvTub5rWLCD87bUfIb6tb+5yUiAU7hQSO7AJqW7VcJ6lBDupHfuclDsum3Fuctu
	8D+3CxBzcz+4KELZMWJiHlEgZlno1YotCQ54M/TTpUkrtI2CiLW0smVv0Cgc1ctCQFA6
	Dqx3gh2WUFCmLEBhOdZtdgYysNENVHV29NtCNwg3UFDF+YYOnZ8a0Q3NOo/DKL6BKm5y
	hA6ijosgrz0dp0L+lvbrFvSlaqxOGWyHRr5oDxeGWxvGGFjX4MQdmGurPQzKQehbPFze
	v/PQ==
X-Gm-Message-State: ALQs6tB7pofoEaI7lDKOH3ycq48KHrIR/UfciYsxersm0ZvW+7k0HFEd
	7emdUF9PrPQCuaVJYUw8Iq4=
X-Google-Smtp-Source: AIpwx49clDNkoRvgt22eMP4M1IjZCkCVauYyXA4O7cttJK6BPkSYswlgGN912x9jJRUd/Cfy7j3Tkw==
X-Received: by 10.167.134.1 with SMTP id p1mr9473212pfn.77.1523170763234;
	Sat, 07 Apr 2018 23:59:23 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:43 -0700
Message-Id: <1523170729-26321-31-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 31/37] libnetfilter-cthelper: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:59:22 -0000

WARNING: libnetfilter-cthelper-1.0.0-r0 do_patch:
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
Applying patch libnetfilter-cthelper-visibility-hidden.patch
patching file doxygen.cfg.in
patching file src/internal.h
patching file src/libnetfilter_cthelper.c
Hunk #2 succeeded at 118 with fuzz 2.

Now at patch libnetfilter-cthelper-visibility-hidden.patch

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libnetfilter-cthelper-visibility-hidden.patch  | 55 ++++++++++------------
 1 file changed, 26 insertions(+), 29 deletions(-)

diff --git a/meta-networking/recipes-filter/libnetfilter/files/libnetfilter-cthelper-visibility-hidden.patch b/meta-networking/recipes-filter/libnetfilter/files/libnetfilter-cthelper-visibility-hidden.patch
index 9377f57..e717d5b 100644
--- a/meta-networking/recipes-filter/libnetfilter/files/libnetfilter-cthelper-visibility-hidden.patch
+++ b/meta-networking/recipes-filter/libnetfilter/files/libnetfilter-cthelper-visibility-hidden.patch
@@ -20,10 +20,10 @@ Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
  src/libnetfilter_cthelper.c | 83 ++++++++++++++++++---------------------------
  3 files changed, 36 insertions(+), 54 deletions(-)
 
-diff --git a/doxygen.cfg.in b/doxygen.cfg.in
-index cac9b05..190b7cd 100644
---- a/doxygen.cfg.in
-+++ b/doxygen.cfg.in
+Index: libnetfilter_cthelper-1.0.0/doxygen.cfg.in
+===================================================================
+--- libnetfilter_cthelper-1.0.0.orig/doxygen.cfg.in
++++ libnetfilter_cthelper-1.0.0/doxygen.cfg.in
 @@ -72,7 +72,7 @@ RECURSIVE              = YES
  EXCLUDE                = 
  EXCLUDE_SYMLINKS       = NO
@@ -33,10 +33,10 @@ index cac9b05..190b7cd 100644
  EXAMPLE_PATH           = 
  EXAMPLE_PATTERNS       = 
  EXAMPLE_RECURSIVE      = NO
-diff --git a/src/internal.h b/src/internal.h
-index 3a88d1a..5d78171 100644
---- a/src/internal.h
-+++ b/src/internal.h
+Index: libnetfilter_cthelper-1.0.0/src/internal.h
+===================================================================
+--- libnetfilter_cthelper-1.0.0.orig/src/internal.h
++++ libnetfilter_cthelper-1.0.0/src/internal.h
 @@ -3,10 +3,9 @@
  
  #include "config.h"
@@ -50,10 +50,10 @@ index 3a88d1a..5d78171 100644
  #endif
  
  #endif
-diff --git a/src/libnetfilter_cthelper.c b/src/libnetfilter_cthelper.c
-index f8f58e6..af543a1 100644
---- a/src/libnetfilter_cthelper.c
-+++ b/src/libnetfilter_cthelper.c
+Index: libnetfilter_cthelper-1.0.0/src/libnetfilter_cthelper.c
+===================================================================
+--- libnetfilter_cthelper-1.0.0.orig/src/libnetfilter_cthelper.c
++++ libnetfilter_cthelper-1.0.0/src/libnetfilter_cthelper.c
 @@ -99,17 +99,16 @@ struct nfct_helper {
   * In case of success, this function returns a valid pointer, otherwise NULL
   * s returned and errno is appropriately set.
@@ -74,9 +74,9 @@ index f8f58e6..af543a1 100644
  {
  	int i;
  
-@@ -119,7 +118,6 @@ void nfct_helper_free(struct nfct_helper *h)
+@@ -119,7 +118,6 @@ void nfct_helper_free(struct nfct_helper
+ 			free(h->expect_policy[i]);
  	}
- 	free(h);
  }
 -EXPORT_SYMBOL(nfct_helper_free);
  
@@ -115,7 +115,7 @@ index f8f58e6..af543a1 100644
  nfct_helper_policy_attr_set(struct nfct_helper_policy *p,
  			    enum nfct_helper_policy_attr_type type,
  			    const void *data)
-@@ -170,7 +166,6 @@ nfct_helper_policy_attr_set(struct nfct_helper_policy *p,
+@@ -170,7 +166,6 @@ nfct_helper_policy_attr_set(struct nfct_
  		break;
  	}
  }
@@ -123,7 +123,7 @@ index f8f58e6..af543a1 100644
  
  /**
   * nfct_helper_attr_set_str - set one attribute the helper object
-@@ -178,23 +173,21 @@ EXPORT_SYMBOL(nfct_helper_policy_attr_set);
+@@ -178,23 +173,21 @@ EXPORT_SYMBOL(nfct_helper_policy_attr_se
   * \param type attribute type you want to set
   * \param name string that will be used to set this attribute
   */
@@ -149,7 +149,7 @@ index f8f58e6..af543a1 100644
  
  /**
   * nfct_helper_attr_set - set one attribute of the helper object
-@@ -202,7 +195,7 @@ EXPORT_SYMBOL(nfct_helper_policy_attr_set_u32);
+@@ -202,7 +195,7 @@ EXPORT_SYMBOL(nfct_helper_policy_attr_se
   * \param type attribute type you want to set
   * \param data pointer to data that will be used to set this attribute
   */
@@ -158,7 +158,7 @@ index f8f58e6..af543a1 100644
  nfct_helper_attr_set(struct nfct_helper *h,
  		     enum nfct_helper_attr_type type, const void *data)
  {
-@@ -250,7 +243,6 @@ nfct_helper_attr_set(struct nfct_helper *h,
+@@ -250,7 +243,6 @@ nfct_helper_attr_set(struct nfct_helper
  		break;
  	}
  }
@@ -216,7 +216,7 @@ index f8f58e6..af543a1 100644
  nfct_helper_attr_unset(struct nfct_helper *nfct_helper, enum nfct_helper_attr_type type)
  {
  	switch(type) {
-@@ -307,7 +295,6 @@ nfct_helper_attr_unset(struct nfct_helper *nfct_helper, enum nfct_helper_attr_ty
+@@ -307,7 +295,6 @@ nfct_helper_attr_unset(struct nfct_helpe
  		break;
  	}
  }
@@ -236,7 +236,7 @@ index f8f58e6..af543a1 100644
  {
  	const void *ret = NULL;
  
-@@ -358,7 +346,6 @@ const void *nfct_helper_attr_get(struct nfct_helper *helper,
+@@ -358,7 +346,6 @@ const void *nfct_helper_attr_get(struct
  	}
  	return ret;
  }
@@ -321,7 +321,7 @@ index f8f58e6..af543a1 100644
  {
  	int ret;
  
-@@ -454,7 +441,6 @@ int nfct_helper_snprintf(char *buf, size_t size,
+@@ -454,7 +441,6 @@ int nfct_helper_snprintf(char *buf, size
  
  	return ret;
  }
@@ -338,7 +338,7 @@ index f8f58e6..af543a1 100644
  nfct_helper_nlmsg_build_hdr(char *buf, uint8_t cmd,
  			    uint16_t flags, uint32_t seq)
  {
-@@ -509,7 +495,6 @@ nfct_helper_nlmsg_build_hdr(char *buf, uint8_t cmd,
+@@ -509,7 +495,6 @@ nfct_helper_nlmsg_build_hdr(char *buf, u
  
  	return nlh;
  }
@@ -346,7 +346,7 @@ index f8f58e6..af543a1 100644
  
  static void
  nfct_helper_nlmsg_build_policy(struct nlmsghdr *nlh,
-@@ -530,7 +515,7 @@ nfct_helper_nlmsg_build_policy(struct nlmsghdr *nlh,
+@@ -530,7 +515,7 @@ nfct_helper_nlmsg_build_policy(struct nl
   * \param nlh: netlink message that you want to use to add the payload.
   * \param nfct_helper: pointer to a helper object
   */
@@ -355,7 +355,7 @@ index f8f58e6..af543a1 100644
  nfct_helper_nlmsg_build_payload(struct nlmsghdr *nlh, struct nfct_helper *h)
  {
  	struct nlattr *nest;
-@@ -593,7 +578,6 @@ nfct_helper_nlmsg_build_payload(struct nlmsghdr *nlh, struct nfct_helper *h)
+@@ -593,7 +578,6 @@ nfct_helper_nlmsg_build_payload(struct n
  	if (h->bitset & (1 << NFCTH_ATTR_STATUS))
  		mnl_attr_put_u32(nlh, NFCTH_STATUS, ntohl(h->status));
  }
@@ -363,7 +363,7 @@ index f8f58e6..af543a1 100644
  
  static int
  nfct_helper_nlmsg_parse_tuple_cb(const struct nlattr *attr, void *data)
-@@ -795,7 +779,7 @@ nfct_helper_nlmsg_parse_attr_cb(const struct nlattr *attr, void *data)
+@@ -795,7 +779,7 @@ nfct_helper_nlmsg_parse_attr_cb(const st
   * This function returns -1 in case that some mandatory attributes are
   * missing. On sucess, it returns 0.
   */
@@ -372,7 +372,7 @@ index f8f58e6..af543a1 100644
  nfct_helper_nlmsg_parse_payload(const struct nlmsghdr *nlh,
  				struct nfct_helper *h)
  {
-@@ -832,7 +816,6 @@ nfct_helper_nlmsg_parse_payload(const struct nlmsghdr *nlh,
+@@ -832,7 +816,6 @@ nfct_helper_nlmsg_parse_payload(const st
  	}
  	return 0;
  }
@@ -380,6 +380,3 @@ index f8f58e6..af543a1 100644
  
  /**
   * @}
--- 
-cgit v1.1
-
-- 
2.7.4


