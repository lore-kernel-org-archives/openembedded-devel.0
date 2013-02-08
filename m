Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pmiscml@gmail.com>) id 1U3pWb-0007LQ-4Q
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2013 16:06:49 +0100
Received: by mail-ea0-f171.google.com with SMTP id c13so1728500eaa.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Feb 2013 06:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=vMlq4GFqRxLMMAu4lZaZTyFOVRiSXa5OLCPWQow4HMk=;
	b=wc06a4v4Y7l2GnLjadH0IsR9I+dabyfC4Ena1oGkiupJzbLy2E3uNQgy+/LPYgl2K/
	rqItrCE6jUyIinixkUpGi/voG8pbQh8pUcW58yIlKdonX9kFVH/yaMJnYEFlZ7tUcQEq
	Yu3mdQ9FN/rFnwV5x7R+1v83fwXPkTkMo2ZHxdRIEkkCixHqss5SrmrzJvSeYHO+3O8w
	DDrpin+PKXVE+rYRVOilN5TO29zsBZX/bGbHTgq3Xbs7CCS0Csem7zWEluTH2zT2YVs5
	d5B3Zl5dDUNVRPYnNz/H8pzneZujc0Ku1teUuBPBCJ/r6kP+ZIama9EWigNcCnspiLKE
	exLg==
X-Received: by 10.14.215.131 with SMTP id e3mr16694969eep.32.1360335007093;
	Fri, 08 Feb 2013 06:50:07 -0800 (PST)
Received: from x34f ([95.15.206.176])
	by mx.google.com with ESMTPS id 44sm47707729eek.5.2013.02.08.06.50.03
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 08 Feb 2013 06:50:05 -0800 (PST)
Received: by x34f (sSMTP sendmail emulation); Fri, 08 Feb 2013 16:50:01 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Feb 2013 16:49:48 +0200
Message-Id: <0d914f6415e72c6d9999b0f2f5b3e6c8ec209363.1360332752.git.pfalcon@users.sourceforge.net>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1360332752.git.pfalcon@users.sourceforge.net>
References: <cover.1360332752.git.pfalcon@users.sourceforge.net>
Subject: [oe-core] [PATCH 1/1] ccache.bbclass: Allow user to override CCACHE_DIR.
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
X-List-Received-Date: Fri, 08 Feb 2013 15:06:52 -0000

For example, some users may want to use single cache directory (instead
of per-package) with known max size limit, to better control disk usage.

Signed-off-by: Paul Sokolovsky <pfalcon@users.sourceforge.net>
---
 meta/classes/ccache.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index cd06a4b..ca3ca43 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -1,5 +1,5 @@
 CCACHE = "${@bb.which(d.getVar('PATH', True), 'ccache') and 'ccache '}"
-export CCACHE_DIR = "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
+export CCACHE_DIR ?= "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
 CCACHE_DISABLE[unexport] = "1"
 
 do_configure[dirs] =+ "${CCACHE_DIR}"
-- 
1.7.9.5



