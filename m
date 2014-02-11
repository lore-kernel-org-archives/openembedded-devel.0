Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 5F51B6E8E6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 10:24:34 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WDAW0-000064-Us for openembedded-devel@lists.openembedded.org;
	Tue, 11 Feb 2014 11:24:32 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 11:24:32 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 11:24:32 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 11 Feb 2014 11:26:06 +0100
Message-ID: <ldcto9$v43$1@ger.gmane.org>
References: <CAMCfZKFW8mb1d=Q2eJ9mRx8xprbN2dHUQJwZvG-UkUF5Q6TRXw@mail.gmail.com>	<CAMCfZKFNHREoyX9L2xbwYAoxrcUq1R8-=74u2V1Aiw45QmkC6g@mail.gmail.com>	<2E2B5ECF-3678-407E-A9DE-58A4F3B271B0@gmail.com>	<ldcph7$d94$1@ger.gmane.org>
	<CAMCfZKERD8d1_+x0TMJ3Hq13-qXVkMvzNC=Q7mihD7WXM_QqXA@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
In-Reply-To: <CAMCfZKERD8d1_+x0TMJ3Hq13-qXVkMvzNC=Q7mihD7WXM_QqXA@mail.gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: xbmc build failing
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
X-List-Received-Date: Tue, 11 Feb 2014 10:24:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Diego Sueiro schreef op 11-02-14 10:51:
> On Tue, Feb 11, 2014 at 7:14 AM, Koen Kooi
> <koen@dominion.thruhere.net>wrote:
> 
>>>> To workaround the screensaver compilation error I've added 
>>>> "--disable-rsxs" on EXTRA_OECONF.
>>>> 
>>>> Looking at "xbmc/screensavers/rsxs-0.9/configure" It's possible to 
>>>> pass "--disable-euphoria" option to configure. How can I
>>>> accomplish this from xbm_git.bb recipe?
>>> 
>>> 
>>> EXTRA_OECONF += "--disable-euphoria" ?
>> 
>> It's a sub configure, so --disable-rsxs is the only way to disable
>> euphoria right now.
>> 
> 
> That's what a thought. Is this a limitation from oe or xbmc autotools
> build chain?

Both :)

Give http://dominion.thruhere.net/koen/angstrom/xbmc_12.9.12.bb a try, it
builds but segfaults on x86 and x86_32 (just like the current recipe).

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFS+fq+MkyGM64RGpERAkyxAKCZRGu5izOshsfyABASNUhJ4yy2tACdHtgh
9xBdwK+Jk++tUmLkHeZ03Vg=
=KWuA
-----END PGP SIGNATURE-----


