Received: from [194.158.229.24] (helo=mail-ps.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dv@vollmann.ch>) id 1IUV3R-0001ji-2L
	for openembedded-devel@openembedded.org; Mon, 10 Sep 2007 00:14:57 +0200
Received: from octo.vollmann.ch (212.98.43.140) by mail-ps.sunrise.ch (8.0.010)
	id 46CB80E300332B57 for openembedded-devel@openembedded.org;
	Mon, 10 Sep 2007 00:12:04 +0200
Received: from octo (localhost [127.0.0.1])
	by octo.vollmann.ch (8.11.2/8.11.2) with SMTP id l89MFGR32256;
	Mon, 10 Sep 2007 00:15:16 +0200
Sender: dv@vollmann.ch
Message-ID: <46E47074.391F1AA7@vollmann.ch>
Date: Mon, 10 Sep 2007 00:15:16 +0200
From: Detlef Vollmann <dv@vollmann.ch>
Organization: vollmann engineering gmbh
X-Mailer: Mozilla 3.04 (X11; U; Linux 2.4.21 i686)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <46E3264C.39BD31A5@vollmann.ch>
	<74d0deb30709090150g161e6059q99f23e2ce1336e1c@mail.gmail.com>
	<46E3E02B.22CEE170@vollmann.ch>
	<65784821.20070909143237@vanille-media.de>
	<46E43AB1.4808813@vollmann.ch>
	<19c1b8a90709091325ue7f5cf5rd3956add41e45c5@mail.gmail.com>
Subject: Re: PREFERRED_PROVIDER (was: Conditional Expressions in Python)
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
X-List-Received-Date: Sun, 09 Sep 2007 22:14:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> 
> which distro are you using. angstrom-2007.1.conf could be your problem
> 
> ./conf/distro/angstrom-2007.1.conf:335:PREFERRED_PROVIDER_virtual/powerpc-angstrom-linux-libc-for-gcc
>        = "glibc-intermediate"
Oops, sorry.
You're completely correct, it's my fault:
I searched for 'PREFERRED_PROVIDERS.*libc-for-gcc' and didn't think
of the PREFERRED_PROVIDER_.*.
Sorry again.

But now the next question:
What's the priority of the PREFERRED_PROVIDER* settings?
PREFERRED_PROVIDERS is one long list with potentially lots of
entries, possibly conflicting.
What gets priority?  The first entry for a specific target or the
last entry?

And it seems that a specific PREFERRED_PROVIDER_.* setting gets
priority over the PREFERRED_PROVIDERS list.  Is that always correct?

And as the distro.conf is read after the local.conf, there's no
way to override a setting from distro.conf in local.conf, correct?

For me that's not really a problem, as I have my own distro.conf
that includes (requires) angstrom.conf, but I think local.conf
is always more specific for the user (hance its name) than distro.conf,
so it would be nice if distro settings could be overridden in
local.conf.

  Detlef

-- 
Detlef Vollmann   vollmann engineering gmbh
Linux and C++ for Embedded Systems    http://www.vollmann.ch/


