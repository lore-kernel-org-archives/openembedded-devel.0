Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IjyUu-0005dv-Tt
	for openembedded-devel@openembedded.org; Mon, 22 Oct 2007 16:43:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9MEaDw1030354
	for <openembedded-devel@openembedded.org>;
	Mon, 22 Oct 2007 15:36:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30081-05 for <openembedded-devel@openembedded.org>;
	Mon, 22 Oct 2007 15:36:09 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9MEa8ZD030348
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 22 Oct 2007 15:36:09 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <471C8BF4.1050206@student.utwente.nl>
References: <4510693243.20071017152524@vanille-media.de>
	<471729ED.9080208@student.utwente.nl>
	<1192708743.6158.25.camel@localhost.localdomain>
	<471C8BF4.1050206@student.utwente.nl>
Date: Mon, 22 Oct 2007 15:36:07 +0100
Message-Id: <1193063767.6088.54.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Cleaning up SDK/Toolchain
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Oct 2007 14:43:22 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-10-22 at 13:39 +0200, Koen Kooi wrote:
> Richard Purdie schreef:
> > 
> > We actually have a bigger problem. Staging uses an arm directory, not an
> > armv5te one so the armv5te binaries mix up with the armv4 ones etc.
> > 
> > This isn't a problem with images built from packages where everything
> > dynamically links since the right packages are used. The moment someone
> > tries to statically link an armv4 binary with armv5te in staging, game
> > over though.
> > 
> > So both the meta-toolchain and staging need some thought (and are
> > related since meta-toolchain has knowledge to rebuild bits of staging
> > for use in its "shortcut an OE build by skipping the toolchain" mode.
> > 
> > I agreed we probably need to add in some PACKAGE_ARCHs in places but its
> > yet another thing that needs some careful thought and we'll probably
> > break people's existing builds. I hope to look at/think about it soon if
> > nobody beats me too it...
> 
> Hopefully[1] it's as simple as:
> 
> ============================================================
> - --- conf/bitbake.conf   f410a6b3af115612f2bd104814d1035583d3518a
> +++ conf/bitbake.conf   3391cfd9df2450e4090fa01879fab5f5e7b100a8
> @@ -45,6 +45,7 @@ HOST_SYS = "${HOST_ARCH}${HOST_VENDOR}-$
>  HOST_OS = "${TARGET_OS}"
>  HOST_VENDOR = "${TARGET_VENDOR}"
>  HOST_SYS = "${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
> +STAGING_SYS = "${PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}"
>  HOST_PREFIX = "${TARGET_PREFIX}"
>  HOST_CC_ARCH = "${TARGET_CC_ARCH}"
> 
> @@ -167,16 +168,16 @@ STAGING_DIR = "${TMPDIR}/staging"
>  B = "${S}"
> 
>  STAGING_DIR = "${TMPDIR}/staging"
> - -STAGING_BINDIR = "${STAGING_DIR}/${HOST_SYS}/bin"
> +STAGING_BINDIR = "${STAGING_DIR}/${STAGING_SYS}/bin"
>  STAGING_BINDIR_CROSS = "${STAGING_DIR}/${BUILD_SYS}/bin/${HOST_SYS}"
>  STAGING_BINDIR_NATIVE = "${STAGING_DIR}/${BUILD_SYS}/bin"
> - -STAGING_LIBDIR = "${STAGING_DIR}/${HOST_SYS}/lib"
> +STAGING_LIBDIR = "${STAGING_DIR}/${STAGING_SYS}/lib"
>  STAGING_LIBDIR_NATIVE = "${STAGING_DIR}/${BUILD_SYS}/lib"
>  STAGING_ETCDIR_NATIVE = "${STAGING_DIR}/${BUILD_SYS}/etc"
> - -STAGING_INCDIR = "${STAGING_DIR}/${HOST_SYS}/include"
> - -STAGING_DATADIR = "${STAGING_DIR}/${HOST_SYS}/share"
> - -STAGING_LOADER_DIR = "${STAGING_DIR}/${HOST_SYS}/loader"
> - -STAGING_FIRMWARE_DIR = "${STAGING_DIR}/${HOST_SYS}/firmware"
> +STAGING_INCDIR = "${STAGING_DIR}/${STAGING_SYS}/include"
> +STAGING_DATADIR = "${STAGING_DIR}/${STAGING_SYS}/share"
> +STAGING_LOADER_DIR = "${STAGING_DIR}/${STAGING_SYS}/loader"
> +STAGING_FIRMWARE_DIR = "${STAGING_DIR}/${STAGING_SYS}/firmware"
>  STAGING_PYDIR = "${STAGING_DIR}/lib/python2.4"

> [1] I suspect this 'breaks' machine specific packages, but we'll see

I suspect you'll be right. This actually turns into a nightmare the more
you think about it.

Consider we have libfoo which is compiled with iwmmxt optimisations for
iwmmxt machines and without iwmmxt optimisations for other arm machines.
appfoo statically links against this. 

I can think of a few ways we could handle this and other issues
generically:

* We could have a staging lib directory per PACKAGE_ARCH and then join
them all together with CFLAGS/LDFLAGS as you suggested on irc. I think
it will get really really messy though.

* Each machine could have its own staging area. To do that you'd have to
make the populate staging stamp machine specific. That is possible
although bitbake might require some tweaks and it would have
implications for rm_work.

* We implement packaged staging and only stage the dependencies needed
for each package.

Personally, I suspect the latter two are the best options.

Cheers,

Richard




