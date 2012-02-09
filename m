Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RvZCS-0005bs-Th for openembedded-devel@lists.openembedded.org;
	Thu, 09 Feb 2012 19:58:33 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RvZ4d-0003BX-32 for openembedded-devel@lists.openembedded.org;
	Thu, 09 Feb 2012 19:50:27 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2012 19:50:27 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2012 19:50:27 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 09 Feb 2012 19:50:09 +0100
Message-ID: <jh14h2$866$1@dough.gmane.org>
References: <4F2A97B7.2080709@opendreambox.org>
	<CAP9ODKqah-6Y6hp-beD0hUi=-r6VXJ02QD=puXFFYW2Hq8FACw@mail.gmail.com>
	<4F32CE7B.8050109@opendreambox.org>
	<CAP9ODKr+bmWJX8tjesyTvP8_4pEgFDXjOA+s2ZbSq5U+=PC4rw@mail.gmail.com>
	<4F331951.2010701@opendreambox.org>
	<4F33BF11.4010009@opendreambox.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
In-Reply-To: <4F33BF11.4010009@opendreambox.org>
X-Enigmail-Version: 1.3.5
Subject: Re: [meta-oe][PATCH] giflib: don't link against libx11, don't depend on libsm
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
X-List-Received-Date: Thu, 09 Feb 2012 18:58:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 09-02-12 13:41, Andreas Oberritter schreef:
> On 09.02.2012 01:54, Andreas Oberritter wrote:
>> On 08.02.2012 20:48, Otavio Salvador wrote:
>>> On Wed, Feb 8, 2012 at 17:35, Andreas Oberritter
>>> <obi@opendreambox.org>wrote:
>>> 
>>>> I already explained in the commit message, why a PR bump is not
>>>> needed. Can you please explain which other possible failures you're
>>>> expecting, so I can learn why my reasoning may be wrong?
>>>> 
>>>> This patch only fixes an unavailable build dependency at bitbake
>>>> level, nothing more.
>>>> 
>>> 
>>> Can the user call:
>>> 
>>> bitbake libsm
>>> 
>>> and then build giflib? in case of positive, we need to enforce have
>>> or not it linked.
>> 
>> At the time I created the patch, the user couldn't run bitbake libsm 
>> (for the same reason that it wouldn't be built automatically through 
>> giflib's DEPENDS).
>> 
>> That said, I updated the repos after your mail and ran bitbake libsm
>> in order to get the error message again, but the error vanished. 
>> Apparently, an indirect dependency on libx11 was dropped during the
>> last few weeks. I searched the logs, but didn't find the change.
>> Strange. Now, many x11 packages got built even though x11 still wasn't
>> listed in my DISTRO_FEATURES.
>> 
>> Anyway, please consider this patch obsolete. I'll probably resend an 
>> updated version together with other patches to disable some more x11 
>> libraries on demand.
> 
> I did some further research regarding giflib:
> 
> - giflib doesn't depend on libSM alone, but optionally depends on libX11.
> When linked against libX11, it also links agains libSM and libICE, under
> certain conditions. Since libSM does not depend on libX11, the current
> giflib build is non-deterministic.
> 
> - Debian's/Ubuntu's giflib gets configured with --disable-x11 
> unconditionally.
> 
> So we have two options:
> 
> 1.) Pass --disable-x11 unconditionally like Debian/Ubuntu 2.) Add
> virtual/libx11 to DEPENDS, if x11 is defined in DISTRO_FEATURES, and add
> --enable/diable-x11 to EXTRA_OECONF

I'd go for 1)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk80FV4ACgkQMkyGM64RGpF1qQCdEZNQIneqMvodDIP02X3FLWtG
xYQAnj9BM2jzRHa6mPJDy4NfcYo28vHR
=iwwe
-----END PGP SIGNATURE-----



