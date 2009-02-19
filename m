Received: from [209.85.200.174] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LaIIt-0007mQ-95
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Feb 2009 00:27:39 +0100
Received: by wf-out-1314.google.com with SMTP id 28so704358wff.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2009 15:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=0IadMi5cfuh1XFJGb+br/tQSHaJvM+dEvGk0dPTRjc4=;
	b=IcHpcrWxCIQ4oVliqOq9EPOWpz5/MDYZnvPkE0bPd6JcLtGc0Sg5MN5Wksq1oso2ct
	8M03Xbwyt9f3k7MqgTJtGxBU38dAFGvYmSKYHRbYbL2X+uwK95ULPbD4yLrqHrWePat8
	ZRFko/BcEWiR9i6heKedwLnyulNFvjgI0VWLY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=hza3NZWc6c2Y+PxWEbDWB0G1pDtA7//1bq1l+7MiEzBtr2gSfaqPgA2JUk1gn8aRFu
	z2iCRLZqh3CHNELBxpj6myqLNbho2XE67Tx9IaaBZ2YUD8wKM7X2raIQu1R0s95kIGfm
	mlsJIzKwCA2IYEZbBmZ/XhNIcBoUo7uBSLEgo=
Received: by 10.142.174.13 with SMTP id w13mr63151wfe.49.1235085917493;
	Thu, 19 Feb 2009 15:25:17 -0800 (PST)
Received: from localhost.localdomain
	(adsl-71-146-30-62.dsl.pltn13.sbcglobal.net [71.146.30.62])
	by mx.google.com with ESMTPS id 32sm3644893wfc.29.2009.02.19.15.25.16
	(version=SSLv3 cipher=RC4-MD5); Thu, 19 Feb 2009 15:25:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Feb 2009 15:25:14 -0800
Message-Id: <1235085914-23155-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.0.4
Subject: [PATCH] preferred-om-2008-versions.inc: Use pidgin version 2.5.3
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
X-List-Received-Date: Thu, 19 Feb 2009 23:27:39 -0000

recipe for 2.2.1 pidgin does not exist therefore use 2.5.3 as PREFERRED_VERSION

---
 conf/distro/include/preferred-om-2008-versions.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/preferred-om-2008-versions.inc b/conf/distro/include/preferred-om-2008-versions.inc
index f78c804..4515248 100644
--- a/conf/distro/include/preferred-om-2008-versions.inc
+++ b/conf/distro/include/preferred-om-2008-versions.inc
@@ -1435,7 +1435,7 @@ PREFERRED_VERSION_phoneserver ?= "1.0"
 PREFERRED_VERSION_php ?= "5.2.0"
 PREFERRED_VERSION_php-native ?= "5.2.0"
 PREFERRED_VERSION_picocom ?= "1.4"
-PREFERRED_VERSION_pidgin ?= "2.2.1"
+PREFERRED_VERSION_pidgin ?= "2.5.3"
 PREFERRED_VERSION_pine ?= "4.64"
 PREFERRED_VERSION_pipeman ?= "1.0.0"
 PREFERRED_VERSION_pipepanic ?= "0.1.1"
-- 
1.6.0.4



