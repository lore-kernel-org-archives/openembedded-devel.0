Received: from smtpfb1-g21.free.fr ([212.27.42.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1U0TmI-0004KK-Pu
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jan 2013 10:16:29 +0100
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id B53EF2E305
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2013 09:51:35 +0100 (CET)
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id B2FC74B00F5;
	Wed, 30 Jan 2013 09:51:28 +0100 (CET)
Date: Wed, 30 Jan 2013 09:51:27 +0100
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: koen@dominion.thruhere.net
Message-ID: <20130130095127.29acc1c8@e6520eb>
In-Reply-To: <1359532955-16954-1-git-send-email-koen@dominion.thruhere.net>
References: <1359532955-16954-1-git-send-email-koen@dominion.thruhere.net>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][[RFC][PATCH] nodejs: add 0.8.18
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
X-List-Received-Date: Wed, 30 Jan 2013 09:16:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Koen,

Le Wed, 30 Jan 2013 09:02:35 +0100,
Koen Kooi <koen@dominion.thruhere.net> a =C3=A9crit :
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Enable-NEON.patch
> @@ -0,0 +1,27 @@
> +From 8891cb4cae57a6b7db54edb33a43743c4b09c53a Mon Sep 17 00:00:00 2001
> +From: Jason Kridner <jdk@ti.com>
> +Date: Wed, 7 Nov 2012 14:43:55 -0500
> +Subject: [PATCH] Enable NEON
> +
> +Read this was necessary on a blog.
> +
> +http://www.code-with-passion.com/2012/11/07/cross-compiling-nodejs-and-n=
ode-modules-for-armbeaglebone/
> +---
> + deps/v8/build/common.gypi |    1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/deps/v8/build/common.gypi b/deps/v8/build/common.gypi
> +index 7a780cc..237f53f 100644
> +--- a/deps/v8/build/common.gypi
> ++++ b/deps/v8/build/common.gypi
> +@@ -29,6 +29,7 @@
> +=20
> + {
> +   'variables': {
> ++    'arm_neon%': 1,
> +     'use_system_v8%': 0,
> +     'msvs_use_common_release': 0,
> +     'gcc_version%': 'unknown',
> +--=20

How will that behave on CPU without neon (armv5 for example) ?
Did you test it on qemu for example ?

Eric


