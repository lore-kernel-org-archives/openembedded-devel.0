Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P3fZM-0004da-Pv
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 03:46:54 +0200
Received: by pzk37 with SMTP id 37so36127pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 18:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=dvYXvkBANs3OuQjgZxFcyg7gPc+1KyqgiTIAu+3iRgI=;
	b=aGvee2nLxifqIwkpJnVKBzFu4R7XPsFtCVvJyM/pwDRgFVVr17fVJlOl+Up228cTRE
	ffwmHiejZVkCqQX+gw4gFWQQt3Uk9k+saSsDNL7emA5pcATWxQ8gAE7eMNo7femdwedH
	dDqESuxEgVEcfGnkZmUzaqJ+4HYKhkuhwoyXg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=N161oRMsJNZT70F/SK9YqSrNGFikVxf1PSkKvCvAncN0oSWXP1tleyFdJhXjKHyKj+
	qRE7OeYGmkasyYLU7lAK9Nly/8T6bKhvaMr7IRFwFtLX0DPrspjJQUh8yglZLJTPTawX
	6ppMk2Bn95vmwzH/G76JgslNKXAqOwQtJffUk=
Received: by 10.114.121.18 with SMTP id t18mr50901wac.209.1286415991618;
	Wed, 06 Oct 2010 18:46:31 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id q6sm2413207waj.10.2010.10.06.18.46.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 06 Oct 2010 18:46:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Oct 2010 18:46:10 -0700
Message-Id: <1286415971-9960-6-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1286415971-9960-1-git-send-email-raj.khem@gmail.com>
References: <1286415971-9960-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH, V2 5/6] insane.bbclass: If LIBTOOL_HAS_SYSROOT is set then do not check for la insanity
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
X-List-Received-Date: Thu, 07 Oct 2010 01:46:54 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/insane.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/insane.bbclass b/classes/insane.bbclass
index 9087efd..677db27 100644
--- a/classes/insane.bbclass
+++ b/classes/insane.bbclass
@@ -342,7 +342,7 @@ def package_qa_check_staged(path,d):
             if file.endswith(".la"):
                 file_content = open(path).read()
                 # Don't check installed status for native/cross packages
-                if not iscrossnative:
+                if not iscrossnative and bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, True) is "no":
                     if installed in file_content:
                         error_msg = "%s failed sanity test (installed) in path %s" % (file,root)
                         sane = package_qa_handle_error(5, error_msg, "staging", path, d)
-- 
1.7.1



