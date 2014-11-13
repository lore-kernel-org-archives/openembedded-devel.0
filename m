Return-Path: <stunpix@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3D69B60167
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2014 22:27:05 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id mc6so14251702lab.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2014 14:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:content-type:content-transfer-encoding:subject
	:message-id:date:to:mime-version;
	bh=9u6V+881eM4sOMixPsPV/wN52jBeDFhQFh/sGY6um9U=;
	b=uRnCq241k5y4nNwMyb1CXAgQCQ9CZS4TBga0CXIX07VN8vHdCaipT0rHkR3kehV9ql
	3FJiQo4+CGSUbrHBPX3CMbvsYURi8I8vhrGDkTe9n01LnzJo0CMbDOEpvVSRXK9TC1CD
	bkodJCkdYE25M5CpKmGCb+hUsqwgadQ12oxUvs6zQjGqahEJovmGNkGueWshD84GTlkK
	urCpaellmDNm80SCFils3GAMw6c7JE65aJwRD+oJchEMD3URsmiMslslOu7ossE0HJ3C
	3wgDG0i8wqMSz10Gioo+2qrlVR8p1vYwubMA4HKccPks0C14dCsT5suzVK3G46Tq52kt
	bcYQ==
X-Received: by 10.152.121.1 with SMTP id lg1mr4237787lab.28.1415917625487;
	Thu, 13 Nov 2014 14:27:05 -0800 (PST)
Received: from [192.168.88.252] ([5.248.146.219])
	by mx.google.com with ESMTPSA id t6sm7790775lbb.23.2014.11.13.14.27.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 13 Nov 2014 14:27:04 -0800 (PST)
Sender: Alexander Shashkevych <stunpix@gmail.com>
From: Alexander Shashkevych <alex@stunpix.com>
Message-Id: <3B9CABF3-66A1-4B2A-A01B-87ABFDCB797F@stunpix.com>
Date: Fri, 14 Nov 2014 00:27:03 +0200
To: openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
X-Mailer: Apple Mail (2.1990.1)
Subject: How to organize OE environment for intermediate builds
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
X-List-Received-Date: Thu, 13 Nov 2014 22:27:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hello,

I would like to ask you how do you organize your development =
environments for OE?

Let me explain. =46rom my point of view OE build system is well suited =
for builds of released code, but not for code that is still under =
development with many intermediate builds. My case: I started a project =
for Freescale platform and due to bsp headers/libs/cross-compiling it =
can be built only within OE environment. I have already committed =
initial code to my project's repo and have already written =
layers&recipes to build project from git. That was not a problem and it =
works. Then I added new changes to my project and stuck. Before I'll =
commit them into git I need to build&test to be sure that everything is =
OK, but to build changes with bitbake they should be committed first. =
Mutual exclusive situation: can't commit without build and can't build =
without commit.

How do you escape this? How to best organize OE environment for =
intermediate builds without commits?

PS: I hope you understand that endless commit'n'push of each little =
change for just-to-test is extremely superfluous.

Regards,
Alexander=

