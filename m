Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PLSLk-00035V-Ja
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 04:18:21 +0100
Received: by pzk12 with SMTP id 12so16133pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Nov 2010 19:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=2aC8go1T0xyloK53QsnOI0a+uYnrH853FVA0RT0iKuw=;
	b=OxktaAz4BGRRzFC9aA6vRteGbAPIRcmZoGDnXbfTUHwhnMjO5UJas+wh/UOL4NWdSq
	FtFzD6ahCgzNF9dGUY1Qghvi8gWfqq134rLkAfNye+HAbAPi3Ck6oqpMP/7wPS0rToE+
	b2NctU4LG0zA0/ccJTt+CxpNzNmkS39Rfz/ww=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=Bjcjhp5jujK1nu1wS4ZeACkfrrr77J7BDb2S62CX+dW93wRS5nvSFdEy7ryG3OO8yN
	iVNh+y8ImsbmHkiAqDVV3Gtunf+u1p/Wvko4UX5zJMBZUWrVTG4uIC1g54O5L7yUsviK
	Uwy8Y5g1aIwLcPmEuAdxn06vlPYF7jEMk2+34=
Received: by 10.142.210.1 with SMTP id i1mr164364wfg.71.1290655024664;
	Wed, 24 Nov 2010 19:17:04 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id w22sm294091wfd.7.2010.11.24.19.17.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 24 Nov 2010 19:17:03 -0800 (PST)
Message-ID: <4CEDD52A.10609@gmail.com>
Date: Thu, 25 Nov 2010 13:46:58 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] task-fso-toolchain-target.bb: Fix meta-toolchain-fso.
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
X-List-Received-Date: Thu, 25 Nov 2010 03:18:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Previously, do_populate_sdk failed due to missing c++ dir.

mv: cannot stat `/var/tmp/tb-clean-build/work/mipsel-oe-linux/meta-toolchain-fso-1.0-r1/sdk/image//usr/local/minimal/mipsel/mipsel-oe-linux/usr/include/c++': No such file or directory

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/tasks/task-fso-toolchain-target.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/tasks/task-fso-toolchain-target.bb b/recipes/tasks/task-fso-toolchain-target.bb
index 0580075..509c81d 100644
--- a/recipes/tasks/task-fso-toolchain-target.bb
+++ b/recipes/tasks/task-fso-toolchain-target.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Packages for a standalone  SDK or external toolchain"
 LICENSE = "MIT"
 ALLOW_EMPTY = "1"
 
-PR = "r2"
+PR = "r3"
 
 PACKAGES = "${PN}"
 
@@ -27,6 +27,7 @@ RDEPENDS_${PN} = "\
     locale-base-en-gb \
     libgcc \
     libstdc++ \
+    libstdc++-dev \
     linux-libc-headers-dev \
     \
     libssl \
-- 
1.7.1



