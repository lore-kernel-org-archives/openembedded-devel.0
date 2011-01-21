Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PgLoU-00042U-It
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 19:34:22 +0100
Received: by pwi8 with SMTP id 8so386663pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jan 2011 10:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=5z8VP71JbnLNCzMlWz7gkdJVvVmKmuAuzUc+ikjr+QM=;
	b=js7lGkqUDAlbakWIB4JKBF9RqmQg7ItgAn/MhMiIcd2z8cTxIZhPMxpTtuOykmlsMH
	5nybJCL5vnlxgEWAbzj03uFyI057jSP8uygMatXrEzysRf95du7NbfeMejPysMVyWQq/
	sir6z7px0TeflzY8vdt7avxuQHodddXt0K1xc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=nGIp6+Yp2aWJTm+f4Iptu+FriaJqaCrBXngcUCjE65gw2LvZ2Ti85msjcpulmyIVjd
	D0V2x+idA3oz4TSFu9M2WfRg2gYapkf/g9tqrs+NOicqgxiarh90nDPbnK3oemSlh5jH
	fot8PHLvUIdyp2Da3N+2SAi9XaQS9lbj/qtEY=
Received: by 10.142.11.13 with SMTP id 13mr1016369wfk.203.1295634818907;
	Fri, 21 Jan 2011 10:33:38 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id v19sm13018603wfh.0.2011.01.21.10.33.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 21 Jan 2011 10:33:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Jan 2011 10:33:31 -0800
Message-Id: <1295634811-5751-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.2.3
Subject: [PATCH 4/4] conf/distro/include/slugos.inc: Remove redundant virtuals
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
X-List-Received-Date: Fri, 21 Jan 2011 18:34:22 -0000

* Slugos now gets them correctly defined through sane-toolchain includes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/include/slugos.inc |   11 -----------
 1 files changed, 0 insertions(+), 11 deletions(-)

diff --git a/conf/distro/include/slugos.inc b/conf/distro/include/slugos.inc
index 0ed22d2..4c5b463 100644
--- a/conf/distro/include/slugos.inc
+++ b/conf/distro/include/slugos.inc
@@ -123,17 +123,6 @@ IGNORE_STRIP_ERRORS = ""
 # kernel, so there has to be a non-libc gcc to build the kernel!)
 
 # Virtuals:
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial	    = "gcc-cross-initial"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "gcc-cross-intermediate"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc		    = "gcc-cross"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++		    = "gcc-cross"
-
-# Set the preferred provider for a few toolchain-related items, otherwise
-# these may be selected from the external-toolchain instead.
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils	    = "binutils-cross"
-PREFERRED_PROVIDER_virtual/arm-linux-binutils		    = "binutils-cross"
-PREFERRED_PROVIDER_virtual/armeb-linux-binutils		    = "binutils-cross"
-PREFERRED_PROVIDER_linux-libc-headers			    = "linux-libc-headers"
 
 # Select the appropriate x11 library provider.  The diet-x11 libraries are
 # much smaller, but may not be as current as the standard x11 libraries; by
-- 
1.7.2.3



