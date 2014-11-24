Return-Path: <gary.robertson@linaro.org>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5081B72207
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 22:59:50 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id gq1so7912705obb.40
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 14:59:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=y+NuOrcuL/jqLMCmNT1A5Rhil6GFH40Nbp121XOLxc0=;
	b=iohvV2sW6Bo4eNscKSfKmfNaZ7yl7JHGNCkURwxIutrq9vZC/MKA+6fIPZVMnxPNaV
	QaJFxxQXBdyrXZjeTMHGeK0+P1EaRMhqWin2Vyoor1ZPnrtA2MDcA3/k0jHv6wW7wsrI
	L1+K8S7FkbslDrXO33Z84dRMThVPpvLmpGD1QXq/aEfxo9qtnICgGvLU+HEWxami7Tdq
	XGAOxHSIY3nbqia+feLRG0PUUD8CquqmimCOYgfsh7fPC3vQ/JvFOv7YzROXnSGXU4Ir
	Ruxo29+QuC3dIMtjf1nKXl7t5C3CM4+VxGaVD0Lam4yPoxhUTWLghFevMT5dymPF3ERm
	KS1w==
X-Gm-Message-State: ALoCoQnUDwl08Akq1jyHQ5MTxye0Ggqj+TS2YGAn8ZG1OGH4FudNQUQQph6RsGOBz4dwJuNdxcHm
X-Received: by 10.182.79.104 with SMTP id i8mr13438963obx.58.1416869991538;
	Mon, 24 Nov 2014 14:59:51 -0800 (PST)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114])
	by mx.google.com with ESMTPSA id n7sm6298616obh.25.2014.11.24.14.59.50
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 24 Nov 2014 14:59:50 -0800 (PST)
From: "Gary S. Robertson" <gary.robertson@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Nov 2014 16:59:12 -0600
Message-Id: <1416869955-13519-1-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH 0/3] libhugetlbfs: fix build problems with ix86 and armv7ab
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Nov 2014 22:59:58 -0000

OE builds of libhugetlbfs were failing for armv7ab and i586 (qemux86)
architectures.  In addition, once patched so builds completed, execution of
some tests was failing for armv7ab.

Patched OE recipe and Makefile to add support for 32-bit ix86 architectures...
(patches 1 and 2).
Then patched linker control script to include armv7ab in the set of
architectures whose text section offset and page size were corrected by
the script...(patch 3).

Patches 2 and 3 have been submitted upstream to the libhugetlbfs maintainers
and acceptance has been indicated for both...
however patch 2 has yet to appear in the upstream repository,
while patch 3 has been verified as merged.

OE builds of libhugetlbfs with these patches added have been successfully
completed here for qemux86, qemux86_64, armv7a, armv7ab, armv8, and armv8b
platforms, and tests run successfully on all except armv8b - which failed
with unrelated boot time issues.


