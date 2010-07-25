Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Od7mX-0000V1-Go
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Jul 2010 22:26:48 +0200
Received: by bwz10 with SMTP id 10so2686751bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jul 2010 13:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=oW0YdlIOZOzIk/ns1P7d0kYz9R108JyJrJwEdLFuSss=;
	b=p7XGG+rg4I/S/3pZZPW9KZzbM1keQ9SsWUcVg/QSln/misJbhCUQ8dGUCszevFgIGY
	LetbHulV9JhJ7Sz25+vV3acn6kVbCJ8bcb6LWVBlk2qcJ1p10VK5tINYJmrxU+JENa3x
	7GbZ3dV7iIJKtYw7jVEmW2eoacQf4zs5FNNrY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=aQ+tZUdXGrGRQN3FUH/yGQpSASQTl0l3EP2NZT3JZa89g2XP7zAgi/KqzOCoLodqzz
	WrFRC3Vd75VhsLzCilQ0cl1THG4pCfDS13kXYYCFm2AcN5JUoPoIJCsFHu29ExCepuqE
	iafM4NrF05z7Q/iBNWi/z+f7fvh4A6jnR6x8U=
MIME-Version: 1.0
Received: by 10.204.80.162 with SMTP id t34mr4932828bkk.81.1280089591142; Sun, 
	25 Jul 2010 13:26:31 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Sun, 25 Jul 2010 13:26:31 -0700 (PDT)
In-Reply-To: <4C4C9AD7.7010603@gmx.net>
References: <4C4C9AD7.7010603@gmx.net>
Date: Sun, 25 Jul 2010 22:26:31 +0200
Message-ID: <AANLkTinQG5SA2sGRj1xapuhfDCxQF4Sss7BHeS=nLesA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: could not include bb file even though it exists and directory included in BBPATH
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
X-List-Received-Date: Sun, 25 Jul 2010 20:26:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/25 Ossy <ossy1980@gmx.net>

> Dear oe mailinglist,
>
> I tried to set up oe and the sanity checker hasn't reported any anomalies.
> But when building a simple image, bitbake wasn't able to include
> console-base-image.bb.
>
> But in fact this file is present in oe/recipes/images/* and BBPATH includes
> the path to oe (which hopefully dives into recipes there).
>
> I used kom to setup a new overlay project. Since listing the images gives
> all images in oe, I'm sure that bitbake has access to those bb-files. The
> conf/bbplayers.conf includes BBFILES to oe, too.
>
> Where may I misconfigured the setup?
>
> Thanks for any hint.
>
> Kind regards,
> Marcus
>
>
>
> ossy@debian-virtual:~/buildroot/kom-dockstar$ ll
> insgesamt 0
> drwxr-xr-x 4 ossy ossy 27 23. Jul 20:37 build
> drwxr-xr-x 4 ossy ossy 53 23. Jul 00:11 conf
> drwxr-xr-x 3 ossy ossy 19 23. Jul 00:11 recipes
> ossy@debian-virtual:~/buildroot/kom-dockstar$ echo $BBPATH
>
> /home/ossy/kom/openembedded/:/home/ossy/buildroot/kom-dockstar/build:/home/ossy/buildroot/kom-dockstar
>

Why do you have the last two paths ?


> ossy@debian-virtual:~/buildroot/kom-dockstar$ ll
> /home/ossy/kom/openembedded/recipes/images/console-*
> -rw-r--r-- 1 ossy ossy 416 23. Jul 02:34
> /home/ossy/kom/openembedded/recipes/images/console-base-image.bb
> -rw-r--r-- 1 ossy ossy 184 23. Jul 02:34
> /home/ossy/kom/openembedded/recipes/images/console-image.bb
> -rw-r--r-- 1 ossy ossy 168 23. Jul 02:34
> /home/ossy/kom/openembedded/recipes/images/console-mipv6-image.bb
> ossy@debian-virtual:~/buildroot/kom-dockstar$ kom -L
> 990     oe      ${oe}/recipes/*/*.bb
> 1000    PRJDIR  ${PRJDIR}/recipes/*/*.bb
> ossy@debian-virtual:~/buildroot/kom-dockstar$ bitbake minimal-image
> NOTE: Handling BitBake files: \ (8414/8416) [99 %]ERROR: Could not include
> required file console-base-image.bb while parsing
> /home/ossy/buildroot/kom-dockstar/build/tmp/deploy/glibc/sources/MIT/console-image/
> console-image.bb
>

This suggests hat it is parsing a console-image.bb file which resides in
your tmp/deploy dir.
(and not the one in recipes/images).
No idea how it ended up there. I suggest to clean at least that file, but
preferably the whole tmp dir and build from scratch

good luck, Frans

> ERROR: Could not include required file console-base-image.bb while parsing
> /home/ossy/buildroot/kom-dockstar/build/tmp/deploy/glibc/sources/MIT/console-image/
> console-image.bb
>
> NOTE: Parsing finished. 7606 cached, 474 parsed, 334 skipped, 176 masked.
> ERROR: Parsing errors found, exiting...
>
> ossy@debian-virtual:~/buildroot/kom-dockstar$ cat conf/bblayers.conf |
> grep BBFILE
> BBFILES = " \
> BBFILE_COLLECTIONS = " oe PRJDIR"
> BBFILE_PATTERN_PRJDIR = "${PRJDIR}/recipes"
> BBFILE_PRIORITY_PRJDIR = "1000"
> BBFILE_PATTERN_oe = "recipes/*/*.bb"
> BBFILE_PRIORITY_oe = "990"
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

