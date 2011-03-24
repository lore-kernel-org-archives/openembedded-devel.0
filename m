Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q2mLd-0008Pg-FD for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 16:21:17 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q2m0Q-0003Zs-HJ for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 15:59:22 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 15:59:22 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 15:59:22 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 24 Mar 2011 15:59:08 +0100
Message-ID: <imfm7s$cd7$1@dough.gmane.org>
References: <1300971676-31774-1-git-send-email-heroor@gmail.com>
	<1300974563.3795.29.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1300974563.3795.29.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 1/3] TI IPC: Fix License field.
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
X-List-Received-Date: Thu, 24 Mar 2011 15:21:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 24-03-11 14:49, Paul Menzel wrote:
> Am Donnerstag, den 24.03.2011, 18:31 +0530 schrieb Siddharth Heroor:
>> From: Siddharth Heroor <heroor@ti.com>
>>
>> * The correct license for TI IPC is BSD and not TI.
> 
> Was the original license a mistake or was it relicensed?

The "LICENSE = TI" bit in the recipes is 90% a copy/paste from another
recipe. For most things we use BSD, but since that is a "fill in"
license I choose "TI" or "TI BSD" while I waited for the interna;
opensource review board to tell me which term to use. While waiting for
that the original recipes got copied a lot :)

A short rundown, not 100% accurate, but a good rule of thumb:

BSD: things that gets put into the codecserver or linked to by apps
GPLv2 or GPLv2+BSD: Kernel modules
"TI": compiler, various binary only IP, etc
Eclipse: XDC

And then we have distribution license "Technology Software Publically
Available" or TSPA which means you can download it without any login or
registration. This is not a source license.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNi1w8MkyGM64RGpERApIpAJ9HAxmnM01wjgmSvNfk9j7fl1ydqgCfSZAX
V1wHf3tSSrt/4eSXXYh3Mtk=
=IudE
-----END PGP SIGNATURE-----



