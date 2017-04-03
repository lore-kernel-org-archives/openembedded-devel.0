Return-Path: <zboszor@pr.hu>
X-Greylist: delayed 1112 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 03 Apr 2017 17:20:24 UTC
Received: from mail7.pr.hu (mail7.pr.hu [87.242.0.7])
	by mail.openembedded.org (Postfix) with ESMTP id 29AE371DE8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Apr 2017 17:20:24 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>) id 1cv5Mp-0007ce-8l
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Apr 2017 19:02:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=/eAMeM2bN6fOy69E7w/5ZlNe5/riH48sQ29am3N77Z0=; 
	b=GVowB3pLUC4anxYhGY+/WcBHfhFBPDK9FDag0nORE/Z+3P61426o7oWntcmbcO6oeGsQ8n/Pcqf/hpCW2cCQ5GQ4JWsNAPhTGY2yubudP9wuca2nMd0gEiUSxWfApcpVnqkoEgl9b2CDqs4TzlQkWKytA//Pj7Pu1LVbssDo1mYy5Msfpwvi6VcktH8ZYuTn8dNe7AoNBrK0k1HgHc9MXsdhmg+A9SWJ+8o3VX+J8ggr8GUo3VX6bASNWF9ZjC9OBdFTa1VU05j07oj3MfvjJ4KJZeR4OMGBt1StpVaOpqsw80bGphefI4UX1qAaKBGuCCAAhHla313adqO05LvjVQ==;
Received: from host-87-242-51-16.prtelecom.hu ([87.242.51.16]
	helo=s002.sicom.com) by mail.pr.hu with esmtpa (Exim 4.80)
	(envelope-from <zboszor@pr.hu>)
	id 1cv5Mk-0005kg-OU; Mon, 03 Apr 2017 19:02:09 +0200
From: Zoltan Boszormenyi <zboszor@pr.hu>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Apr 2017 19:01:32 +0200
Message-Id: <20170403170132.19588-3-zboszor@pr.hu>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170403170132.19588-1-zboszor@pr.hu>
References: <20170403170132.19588-1-zboszor@pr.hu>
X-Spam-Score: 0.8 (/)
X-Scan-Signature: 9c5e05eb7b369c1b31c27083e129340a
X-Spam-Tracer: backend.mail.pr.hu 0.8 20170403170209Z
Subject: [PATCH 2/2] kernel-module-split.bbclass: kernel-modules depend on versioned modules
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
X-List-Received-Date: Mon, 03 Apr 2017 17:20:25 -0000

The kernel-modules meta-packages should depend on module subpackages
with versions to allow upgrading the kernel easier with limiting
the upgrade to selected packages.

Signed-off-by: Zoltan Boszormenyi <zboszor@pr.hu>
---
 meta/classes/kernel-module-split.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index 8233848..a36a045 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -144,7 +144,8 @@ python split_kernel_module_packages () {
     modules = do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION", True)))
     if modules:
         metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE', True)
-        d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
+        for mod in modules:
+            d.appendVar('RDEPENDS_' + metapkg, ' ' + mod + ' (>= %s)' % (d.getVar("EXTENDPKGV", True)))
 
     # If modules-load.d and modprobe.d are empty at this point, remove them to
     # avoid warnings. removedirs only raises an OSError if an empty
-- 
1.8.3.1


