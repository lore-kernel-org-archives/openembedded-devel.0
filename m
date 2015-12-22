Return-Path: <twoerner@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 02E366FF77
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 15:45:38 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id c96so113160754qgd.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 07:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=oHK/wi33956K0+I73J4ZG1SHYe7UrvL39qfJd0EN26Q=;
	b=BHZMTuRIDFBx9GVqioqmyrmi1dLakX5a6LLiqodK0eT7L9+ib/nfx+ezNT/FTWQzlV
	DG037yNmKyLC3dc1hZ8FChVyYdU1q2CVPSzPcS0BUk3GQCAsbnsKRuHJ/9Jz9R5Q5MqZ
	hA+HuVudJOVfyZ8OKOaSbbHBia7bjus+mtB83fairwzdKZODN1UPQ9aSKbBoCAhXHoBc
	3klBRcw+9uFxk+X1/wYKV74EDYJwUkqwq1XutGvudHmP8Eefg5k6+FdrLCknjV33BtEl
	yBi2YPdTcQVvinMn8PYJztLCcqgQElR63J9A/EmhkLgO3+KkA/e/rEAUrt5WgcyHLf+i
	zbNA==
X-Received: by 10.140.140.8 with SMTP id 8mr34494909qhm.60.1450799139000;
	Tue, 22 Dec 2015 07:45:39 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	g90sm15497728qgg.45.2015.12.22.07.45.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Dec 2015 07:45:38 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Dec 2015 10:45:24 -0500
Message-Id: <1450799125-5013-1-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.6.3.368.gf34be46
Subject: [meta-oe][PATCH v4 0/1] nodejs cleanup and update
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
X-List-Received-Date: Tue, 22 Dec 2015 15:45:40 -0000

My fourth attempt to update and cleanup the nodejs recipes.

Successfully built for:
  qemuarm, qemuarm64, qemumips, qemumips64, qemuppc, qemuppc64, qemux86,
  qemux86-64, beaglebone, intel-corei7-64, genericx86, genericx86-64

Successfully ran on:
  qemuarm64, qemumips, qemux86, qemux86-64, intel-corei7-64 (turbot)

Failed to run for:
  qemuppc:
    unhandled signal 4 at 2ee3bf48 nip 2ee3bf48 lr 2ee3ed70 code 30001
    Illegal instruction
  qemuppc64:
    I wasn't able to successfully run a qemuppc64 VM

Changes from v3:
  better link to official announcement regarding the dropping of VFP2
  instead of whitelisting machines, blacklist the unsupported ones

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
 .../nodejs/{nodejs_0.12.7.bb => nodejs_4.2.3.bb}   | 18 ++++----
 4 files changed, 11 insertions(+), 91 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/enable-armv5e-build.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs4/libev-cross-cc_0.4.12.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
 rename meta-oe/recipes-devtools/nodejs/{nodejs_0.12.7.bb => nodejs_4.2.3.bb} (84%)

-- 
2.6.0.rc3


