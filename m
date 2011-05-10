Received: from ibawizard.net ([82.208.49.253] helo=mengele.ibawizard.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1QJtgr-0002Di-IN
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 22:37:57 +0200
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 3DA351D36124; Tue, 10 May 2011 22:35:06 +0200 (CEST)
Date: Tue, 10 May 2011 22:35:05 +0200
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110510203505.GD1544@ibawizard.net>
References: <1304243449-12028-1-git-send-email-heroor@ti.com>
	<20110501173015.GI27708@ibawizard.net>
	<BANLkTimKHp5M5VvMR21+C_rSRBiu2M0BKQ@mail.gmail.com>
	<20110506090243.GE26466@ibawizard.net>
	<BANLkTikt+X9ocYn-0bsfwzbCcZDQFnm_ww@mail.gmail.com>
	<20110508180923.GG26466@ibawizard.net>
	<BANLkTikQ81NTULOMEu9k9+nvkpB4m3iSrw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <BANLkTikQ81NTULOMEu9k9+nvkpB4m3iSrw@mail.gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH 1/2] zeromq: Add zeromq socket library.
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
X-List-Received-Date: Tue, 10 May 2011 20:37:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Siddharth Heroor <heroor@gmail.com> [2011-05-10 15:04:04]:

> I tried to build it and it fails. The error is as follows -
> 
> ERROR: Logfile of failure stored in:
> /swcoe/sdk/sid/arago/build-oe/angstrom-setup-scripts/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/zeromq-2.1.6-r0/temp/log.do_configure.10701
> Log data follows:
> | + do_configure
> | + ./autogen.sh
> | autogen.sh: error: could not find libtool.  libtool is required to
> run autogen.sh.
> NOTE: package zeromq-2.1.6-r0: task do_configure: Failed

Hm sorry, but this is strange. I don't know why it shoudln't find libtool...
Log here:

	+ cd /opt/devel/oe/ts72xx-test/tmp-uclibc-angstrom-2010.x/work/armv4t-angstrom-linux-uclibceabi/zeromq-2.1.6-r0/zeromq-2.1.6
	+ do_configure
	+ ./autogen.sh
	autoreconf: Entering directory `.'
	autoreconf: configure.in: not using Gettext
	autoreconf: running: aclocal -I config -I config --force -I config
	...

> By removing do_configure_prepend() from the recipe, I am able to build zeromq.
> Why do we need to run autogen.sh to regenerate the configure script?
> Won't the shipped configure work?

It apparently wasn't working quite correctly in some scenario, that's why it's
there. Maybe automake or something was complaining about the shipped version
of the macros? Sorry, I don't remember it correctly now, but it was tested by
Craig also, so I've pushed it as it is.

Anyone with the better knowledge of the autofoo stuff, who could shed some
light on this?

> Also, shouldn't most the recipe be in an .inc file and the checksums
> in a version.bb?

AFAIK, there's no such guideline. If you do plan to add for example package
which would track the git version of zeromq, then yes, it would be good idea
to split it and reuse the common parts.

-- ynezz


