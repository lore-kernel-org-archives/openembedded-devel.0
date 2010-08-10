Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Oij1j-0004BS-At
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 09:13:36 +0200
Received: by pvg6 with SMTP id 6so1058693pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Aug 2010 00:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=iTT84RBzjwx8PWEtNvtEKMgJr070hFHzbkwNHLr4S7k=;
	b=dhzfQ7CNJ188qiaSTLtHXVSWAI9Pl9irev8KVKAPWtsF0XrOg0520gMrBDqIXrto06
	9HY8MSFNAmp08GeF1qlWArQBTeA2hFQ1GTZ7Jke8723qbY8LkeDDaC3DVBwWtkF6Oh5o
	b4xKEiVxFG91K4DizkWaBN45CUdctRsbkck3o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=erDw84xOgOOWQ0uhBRD6X0T+MYNnrObs97HAt+cyhjT2byt2YoiP3KS/+eAzB8tlWO
	p+rFm/jB/+UUaIwkAWqfnlov0/wDRXdBuyBKvQQ4Y1PuZMhKav68MF+CFLhSjssmJnZ/
	HIUrxu06aJzmkzzdKAJhT5u3wlFQeUWhRQ88U=
Received: by 10.114.88.18 with SMTP id l18mr19846129wab.175.1281424403899;
	Tue, 10 Aug 2010 00:13:23 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	q6sm12159290waj.22.2010.08.10.00.13.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 10 Aug 2010 00:13:22 -0700 (PDT)
Message-ID: <4C60FC0D.7040702@gmail.com>
Date: Tue, 10 Aug 2010 16:43:17 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100721 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] task-boot.bb: Don't pull in u-a if ONLINE_PACKAGE_MANAGEMENT="none".
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
X-List-Received-Date: Tue, 10 Aug 2010 07:13:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

This makes it possible to build an opkgless system, without having to set
DISTRO_UPDATE_ALTERNATIVES. In the unlikely event that someone doesn't want
opkg, but does want update-alternatives, one can set DISTRO_UPDATE_ALTERNATIVES
in the local.conf.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/tasks/task-boot.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/tasks/task-boot.bb b/recipes/tasks/task-boot.bb
index 45d50ef..d193393 100644
--- a/recipes/tasks/task-boot.bb
+++ b/recipes/tasks/task-boot.bb
@@ -17,7 +17,7 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 # u-a script used for building image which is defined with
 # PREFERRED_PROVIDER_virtual/update-alternatives-native
 
-DISTRO_UPDATE_ALTERNATIVES ?= "${PREFERRED_PROVIDER_virtual/update-alternatives}"
+DISTRO_UPDATE_ALTERNATIVES ?= "${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "${PREFERRED_PROVIDER_virtual/update-alternatives}", d)}"
 
 # Make sure we build the kernel
 DEPENDS = "virtual/kernel"
-- 
1.7.1



