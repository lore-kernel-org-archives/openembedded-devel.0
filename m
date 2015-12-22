Return-Path: <twoerner@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8A7F1731DE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:27:26 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id c96so103021171qgd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2015 20:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=zwdZ97/KGoFztPBObROvDILwy002wR4aSlI5qppvJso=;
	b=jvGqmQOjY0ngx0aAk3UN7SamxdH7CremT2cL7nS0Q3Tbf/ICxDl8z9VEFxWjo7FfWr
	syi2TPRR2E1wqHThCobTnPzrIcTBBCGV9FAy9UnIWgafjT5IwVk+Wj91o2BEQRuiRavS
	/RSeKCPKz8DjzJ9RNKOVW56z1zxkDc6VBChnun7oVkk3zoS43SWRVDP7d3UXqf1xOJQi
	+teR3a4fEzdheDPGhteYnO4NBXx/39Xkj/UiebTVBz+sfV7Q60zwn6t1yoQBmppZA5s0
	ncajl/yTh7bNZNgSB42TUPEdq7Hngt5/aX/OpM9N6TUz9NxfEOmLWIzcLV7iHtIpxZoU
	vB5g==
X-Received: by 10.140.32.194 with SMTP id h60mr29643087qgh.79.1450758446815;
	Mon, 21 Dec 2015 20:27:26 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	h188sm15314206qhh.23.2015.12.21.20.27.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Dec 2015 20:27:26 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Dec 2015 23:27:10 -0500
Message-Id: <1450758431-18974-1-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.6.3.368.gf34be46
Subject: [meta-oe][PATCH v3 0/1] nodejs cleanup and update
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
X-List-Received-Date: Tue, 22 Dec 2015 04:27:26 -0000

My third attempt to update and cleanup the nodejs recipes.

This patch removes the older nodejs recipes and replaces them with a recipe
for nodejs 4.2.3 (the latest stable at this time).

Nodejs is picky about which architectures it supports. Add COMPATIBLE_MACHINE
and cleanup the architecture mapping function to reflect what is currently
supported. Nodejs dropped support for ARMv5 around V8 version 3.22. Also, gcc
no longer supports -mfpu=vfpv2 (which is what the nodejs build thinks it
should be using).

Successfully built for:
  qemuarm, qemuarm64, qemumips, qemumips64, qemuppc, qemuppc64, qemux86,
  qemux86-64, beaglebone, intel-corei7-64, genericx86, genericx86-64

Successfully ran on:
  qemuarm64, qemumips, qemux86, qemux86-64

Failed to run for:
  qemuppc:
    unhandled signal 4 at 2ee3bf48 nip 2ee3bf48 lr 2ee3ed70 code 30001
    Illegal instruction
  qemuppc64:
    I wasn't able to successfully run a qemuppc64 VM

Changes from v2:
  handle qemuarm build failure

Changes from v1:
  don't try to keep and unite the old recipe versions, just replace them with
  the latest stable

Trevor Woerner (1):
  nodejs: cleanup and update

 .../nodejs/nodejs/enable-armv5e-build.patch        | 22 ----------
 .../nodejs/nodejs4/libev-cross-cc_0.4.12.patch     | 13 ------
 meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb  | 49 ----------------------
 .../nodejs/{nodejs_0.12.7.bb => nodejs_4.2.3.bb}   | 23 ++++++----
 4 files changed, 16 insertions(+), 91 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/enable-armv5e-build.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs4/libev-cross-cc_0.4.12.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
 rename meta-oe/recipes-devtools/nodejs/{nodejs_0.12.7.bb => nodejs_4.2.3.bb} (81%)

-- 
2.6.0.rc3


