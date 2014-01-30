Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id D55AC6E98F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 22:10:08 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1W8zoC-0007N7-AN for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jan 2014 23:10:04 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 23:10:04 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 23:10:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 30 Jan 2014 23:07:40 +0100
Message-ID: <lceiek$4oe$1@ger.gmane.org>
References: <1391086167-31517-1-git-send-email-chase.maupin@ti.com>	<CAMKF1spT1epjxfM1Nyi86wFCk23BAZ26zun-Ju94JkcYiXwE7A@mail.gmail.com>	<EFF5E6A1D0DAA14BA6B30C755A7B0FE13131B2C8EC@BLRINMSMBX01.bglrodc.lntinfotech.com>	<1761269.AxNLyBI4PD@leo>	<EFF5E6A1D0DAA14BA6B30C755A7B0FE13131B2C8ED@BLRINMSMBX01.bglrodc.lntinfotech.com>	<EFF5E6A1D0DAA14BA6B30C755A7B0FE13131B2C8EF@BLRINMSMBX01.bglrodc.lntinfotech.com>
	<CAP71WjxE3bO7f1N9hJtY0JvLnE555z+N+jZ3mrZSWB-k6xSpCw@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
In-Reply-To: <CAP71WjxE3bO7f1N9hJtY0JvLnE555z+N+jZ3mrZSWB-k6xSpCw@mail.gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: Errors when using populate_sdk - has anyone encountered this before?
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
X-List-Received-Date: Thu, 30 Jan 2014 22:10:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Nicolas Dechesne schreef op 30-01-14 22:07:
> hi,
> 
> On Thu, Jan 30, 2014 at 10:52 AM, Ridish RA <Ridish.RA@lntinfotech.com>
> wrote:
>> I think I got the root cause of the issue, meta-linaro that we have
>> depends on openembedded-core dylan-qt5.1, but Nicolas recently updated 
>> openembedded-core to dora. And I think this is the root cause of the
>> issue of the relocatable patch being not able to apply?
>> 
>> So do we have meta-linaro layer based openembedded-core dora?
>> 
> 
> yes, the problem is a misalignment between oe-core and meta-linaro. 
> meta-linaro is using a recent qemu upstream commit, and the list of 
> patches from oe-core no longer works with meta-linaro qemu_git recipe. 
> the 2 commits in upstream qemu responsible for the misalignment are:
> 
> 53db78543e473bdf7650a406767d0901c6e26480 
> 964c6fa16f50a607f9da5068d6bf15ccc93872c0
> 
> I am cc'ing riku and koen since that needs fixing in meta-linaro 
> (nativesdk-qemu does not build).

Can you push cherry-picks for:

http://git.linaro.org/openembedded/meta-linaro.git/commit/2def4e0a5548cadfedcf9511f835af9456b40953

and

http://git.linaro.org/openembedded/meta-linaro.git/commit/fc9473336a77603edabda89ae0bac58ef652d649

to gerrit? I'm off to fosdem tomorrow and have a day off monday, so tuesday
is the earliest I can look at it.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFS6s0sMkyGM64RGpERAoqHAJsEe/DFtL4TZYq/Hx+CDA0YVwKXpACggj6+
wIlhhY8LamC7C+lf/BobULY=
=8Jo3
-----END PGP SIGNATURE-----


