Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@vanille-media.de>) id 1JPz1f-0003BP-Qi
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2008 12:46:46 +0100
Received: from andromeda (e180186145.adsl.alicedsl.de [85.180.186.145])
	by drlauer-research.com (Postfix) with ESMTP id E9115584BC8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2008 12:51:34 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Feb 2008 12:46:44 +0100
User-Agent: KMail/1.9.7
References: <200802131340.02616.mickey@vanille-media.de>
	<200802131432.42455.mickey@vanille-media.de>
	<47B3075F.4000703@student.utwente.nl>
In-Reply-To: <47B3075F.4000703@student.utwente.nl>
MIME-Version: 1.0
Message-Id: <200802151246.44196.mickey@vanille-media.de>
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: tinylogin vs. busybox
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
X-List-Received-Date: Fri, 15 Feb 2008 11:46:46 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 13 February 2008 16:06:07 Koen Kooi wrote:
> Michael 'Mickey' Lauer schreef:
> | On Wednesday 13 February 2008 13:53:18 Koen Kooi wrote:
> |> Michael 'Mickey' Lauer schreef:
> |> | I just realized that we are still using tinylogin which has bugs and
> |>
> |> is dead.
> |>
> |> | Newer busybox releases contain all the functionality. Anyone know a
> |> | compelling reason to keep using tinylogin as the default in
>
> task-base? If
>
> |> | not, I'd like to switch to busybox (after changing its defconfig)
> |> | soon.
> |>
> |> Using busybox as login requires it being setuid root, with all the nasty
> |> security implications stemming from that.
> |
> | http://www.busybox.net/lists/busybox/2004-May/011551.html give me the
>
> opinion
>
> | that this is not a problem.
>
> If that email is true, we could dump tinylogin

Excellent. I will look into this and do some tests.

> , but frankly, I trust 
> busybox as far as I can throw a piano (and toybox as far as I can throw
> a 21" crt) and SUID root binaries make my skin crawl, so we must be very
> carefull and do thorough tests before making this change.
> The last thing we want is $bigcompany to blame OE for the exploitabilty
> of their devices.

Sure, better safe than sorry. Of course this would not be the default in 
OE.dev without being tested for quite some time.

:M:
-- 
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de


