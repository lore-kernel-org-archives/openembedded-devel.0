Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RuxGR-000378-RV
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 03:28:08 +0100
Received: by pbcum15 with SMTP id um15so30136pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 18:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=sLXGX/9HQ7FUgHobkuvBHWJKaS0yBfNP0C9PgXBSFW0=;
	b=HUB42dmhmINO9uCtBJDNupwyoyUUyZc/XoHcu5ExS7X2RvOc3jSefF/MFk3kkJQatm
	l1eXr9oQb0UyqXx0mtmEVuWQxWCfi4rTeCiZx0sNdWxZu33oKGIhKPB2hrwXpxLJDJmE
	ebyo7FS3/ZZLofiNUjoibVSjTIvOGnblk8z54=
Received: by 10.68.224.104 with SMTP id rb8mr63675499pbc.107.1328667604067;
	Tue, 07 Feb 2012 18:20:04 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id r10sm1220677pbs.12.2012.02.07.18.20.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 18:20:02 -0800 (PST)
Date: Tue, 7 Feb 2012 18:19:54 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120208021937.GA13964@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <4F31CE69.4050107@palm.com>
MIME-Version: 1.0
In-Reply-To: <4F31CE69.4050107@palm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: bitbake confusion
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
X-List-Received-Date: Wed, 08 Feb 2012 02:28:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (07/02/12 17:22), Rich Pixley wrote:
> I've just started working with current OE, (Palm has been branched
> for several years).  And I'm a bit confused about how bitbake is
> supposed to work these days.

I would suggest you use the new layered model to start with. We still
have classic oe there but its not being developed on there is a
maintenace release of that and that it. latest bitbake has also probably
not been tested with classic oe metadata.

in the new model you will have webos as a new layer on top of existing
oe-core and other layers around it. metadata is maintained in separate
layers. You can look at angstrom or yocto for how the layers are used
for a distro.

> 
> In the output below, how do I tell where the file with the erroneous
> line might be?  I mean, I can grep, but that won't necessarily tell
> me which file bitbake thought led to the failing include.
> 
> What am I missing?

so if you still want to use oe classic you have to stick to 1.12 release
of bitbake I think


> 
> --rich
> 
> -*- mode: compilation; default-directory: "/home/rich/projects/webos/" -*-
> Compilation started at Tue Feb  7 17:17:22
> 
> time make
> BBPATH=`pwd`/build:`pwd`/openembedded `pwd`/bitbake/bin/bitbake -v
> -D bootstrap-image
> DEBUG: Removed the following variables from the environment:
> HISTFILE, LESS, SSH_CLIENT, CVS_RSH, EMACS, MAKEFLAGS, LANGUAGE,
> SFDIR, SHLVL, HISTSIZE, TMPDIR, EMACSCLIENT, MFLAGS, CVSROOT,
> NETHACKOPTIONS, EDITOR, INSIDE_EMACS, ignoreeof, XENVIRONMENT, ENV,
> COLUMNS, TERMCAP, SSH_TTY, MAKELEVEL, TAPE, GWMPATH, RNINIT, MAIL,
> SSH_CONNECTION, PAGER, MORE
> DEBUG: Clearing SRCREV cache due to cache policy of: clear
> DEBUG: Using cache in
> '/home/rich/projects/webos/tmp/cache/bb_codeparser.dat' for
> codeparser cache
> DEBUG: collecting .bb files
> DEBUG: Using cache in
> '/home/rich/projects/webos/tmp/cache/eglibc/beagleboard'
> Loading cache: 100% || ETA:  00:00:00
> Loaded 5 entries from dependency cache.
> DEBUG: Using cache in
> '/home/rich/projects/webos/tmp/cache/bb_codeparser.dat' for
> codeparser cache
> ERROR: Could not include required file abiword-2.5.inc
> ERROR: Command execution failed: Exited with 1
> 
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> make: *** [all] Error 1
> 
> real    0m2.060s
> user    0m1.764s
> sys    0m0.304s
> 
> Compilation exited abnormally with code 2 at Tue Feb  7 17:17:24
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


