Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@vanille-media.de>) id 1JJZ5Y-0003XY-6J
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2008 19:52:12 +0100
Received: from [192.168.1.105] (e180149035.adsl.alicedsl.de [85.180.149.35])
	by drlauer-research.com (Postfix) with ESMTP id 91EA5584BB6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2008 19:55:55 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jan 2008 19:52:16 +0100
User-Agent: KMail/1.9.7
References: <479D9AA9.8020704@student.utwente.nl>
	<200801281828.58780.mickey@vanille-media.de>
	<479E2053.6090902@student.utwente.nl>
In-Reply-To: <479E2053.6090902@student.utwente.nl>
MIME-Version: 1.0
Message-Id: <200801281952.16588.mickey@vanille-media.de>
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
X-List-Received-Date: Mon, 28 Jan 2008 18:52:12 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 28 January 2008 19:34:59 Koen Kooi wrote:
> Michael 'Mickey' Lauer schreef:
> | On Monday 28 January 2008 16:40:22 Graeme Gregory wrote:
> |> On Mon, 28 Jan 2008 14:48:21 +0200
> |>
> |> Paul Sokolovsky <pmiscml@gmail.com> wrote:
> |>> Hm, but why that file is in .dev branch at all? What was idea of
> |>> removing 2007 .conf and leaving preferred-versions? Doing a grep, it
> |>> is referenced only by angstrom-2007-for-openmoko.inc, so shouldn't it
> |>> be merged there or renamed to make it clear that it relates more to
> |>> openmoko?
> |>
> |> I shall rename it later when I get a chance to indicate only OpenMoko
> |> use it.
> |
> | How about making it generic-preferred-versions.inc hence resurrecting
> | the "generic" distribution until we have the default versions configured
> | enough, so that you can build without setting a DISTRO?
>
> You can't build without setting a distro since among other things,
> SRCREV is broken if you do that.
> Besides not being named 'generic', what are the arguments against making
> angstrom the 'generic' distro in OE? It's the closest thing of showing
> off all features of OE *and* doing it the OE-way.

It's the message it sends. By all means I want to keep the difference between 
OE as a distribution building environment and the actual distributions. If we 
lose this distinction OE becomes OE/Angstrom and people will think OE is just 
about/for one distribution -- which it is not.

-- 
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de


