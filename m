Received: from [209.85.128.190] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JJZK7-0003kM-3P
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2008 20:07:15 +0100
Received: by fk-out-0910.google.com with SMTP id 18so1372036fks.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2008 11:07:21 -0800 (PST)
Received: by 10.78.139.14 with SMTP id m14mr7950829hud.25.1201547240995;
	Mon, 28 Jan 2008 11:07:20 -0800 (PST)
Received: from widy.localdomain ( [88.231.77.184])
	by mx.google.com with ESMTPS id o36sm2303349hub.28.2008.01.28.11.07.19
	(version=SSLv3 cipher=OTHER); Mon, 28 Jan 2008 11:07:20 -0800 (PST)
Date: Mon, 28 Jan 2008 21:18:47 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080128211847.6c3f23d0@widy.localdomain>
In-Reply-To: <479E2053.6090902@student.utwente.nl>
References: <479D9AA9.8020704@student.utwente.nl>
	<20080128144821.1b6f2741@widy.localdomain>
	<20080128154022.7d4584db@cimmeria>
	<200801281828.58780.mickey@vanille-media.de>
	<479E2053.6090902@student.utwente.nl>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.1; i686-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: [oe-commits] org.oe.dev gnuplot: update 4.2.2, add 4.3.0+cvs
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
X-List-Received-Date: Mon, 28 Jan 2008 19:07:17 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 28 Jan 2008 19:34:59 +0100
Koen Kooi <k.kooi@student.utwente.nl> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Michael 'Mickey' Lauer schreef:
> | On Monday 28 January 2008 16:40:22 Graeme Gregory wrote:
> |> On Mon, 28 Jan 2008 14:48:21 +0200
> |>
> |> Paul Sokolovsky <pmiscml@gmail.com> wrote:
> |>> Hm, but why that file is in .dev branch at all? What was idea of
> |>> removing 2007 .conf and leaving preferred-versions? Doing a grep,
> it |>> is referenced only by angstrom-2007-for-openmoko.inc, so
> shouldn't it |>> be merged there or renamed to make it clear that it
> relates more to |>> openmoko?
> |> I shall rename it later when I get a chance to indicate only
> OpenMoko |> use it.
> |
> | How about making it generic-preferred-versions.inc hence
> resurrecting | the "generic" distribution until we have the default
> versions configured | enough, so that you can build without setting a
> DISTRO?
> 
> You can't build without setting a distro since among other things,
> SRCREV is broken if you do that.
> Besides not being named 'generic', what are the arguments against
> making angstrom the 'generic' distro in OE? It's the closest thing of
> showing off all features of OE *and* doing it the OE-way.

IMHO, we shouldn't ditch "generic" distro. It's purpose should be to
enforce as little policy as possible. Thus, it will be good base for
adhoc, overlay, foreign, experiment distros. For example, openwrt-sdk
distro already uses generic-uclibc (which in turn uses generic) in such
way.

> 
> regards,
> 
> Koen
> 

[]


