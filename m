Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q2MTl-0005Yx-3w for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 12:43:57 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q2MRz-0006Dj-Ha for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 12:42:07 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2011 12:42:07 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2011 12:42:07 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 23 Mar 2011 12:41:55 +0100
Message-ID: <imcma4$hlu$1@dough.gmane.org>
References: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>	<20110323104755.GH21392@excalibur.local>
	<20110323112448.GE3418@jama.jama.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <20110323112448.GE3418@jama.jama.net>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 01/12] libnl: rename libnl2 to libnl as used in openembedded-core
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
X-List-Received-Date: Wed, 23 Mar 2011 11:43:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 23-03-11 12:24, Martin Jansa wrote:
> On Wed, Mar 23, 2011 at 11:47:55AM +0100, Stefan Schmidt wrote:
>> Hello.
>>
>> On Fri, 2011-03-18 at 15:00, Martin Jansa wrote:
>>> * libnl1/libnl2 still conflicts even when using separate includedir so
>>>   it will be easier for distro maintainers to use only libnl1 or libnl2
>>>   by PREFERRED_VERSION
>>
>> For distros that want to support network-manager that still means that
>> both versions are being build and may clash as we have seen before.
> 
> How do you build 2 versions of same package? Whole point of this patch
> series is to force distromaintainers to use only libnl_2.0.0 or
> libnl_1.1.0 based on PREFERRED_VERSION_libnl and this way keep them away
> from shooting own foot by accident.

I don't think that's an acceptable solution just yet since angstrom
needs both iw and nm. I think the best way forward is:

1) configure libnl1 to only build a .a
2) rename that .a to libnl-old.a before installing it
3) patch nm to use -l:libnl-old.a

or

1) configure libnl1 to only build a .a
2) move that .a to ${libdir}/libnl1/
3) patch nm to use -L${STAGING_LIBDIR}/libnl1 -l:libnl.a

A lot like
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=71e69ad8b551aa06f63160232d1bd87b8d801a1d
but a bit cleaner.

>> Just a remark. Personally I would like to go this route and maybe get
>> rid of libnl1 at all.
> 
> Yes this is step in direction to get rid of libnl1 :). I'm using
> libnl_2.0.0 from oe-core in meta-shr, so this change is making diff
> between recipes in oe.dev and meta-shr smaller.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNidyDMkyGM64RGpERAtrBAJ9j+q1b4dFMXW7C0T9g55y22GO/PACfeH1O
3NU5PzIAzmtbZy5rdk7ojhs=
=Vgfx
-----END PGP SIGNATURE-----



