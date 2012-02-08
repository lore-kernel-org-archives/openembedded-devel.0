Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Rv5Um-0007rJ-8Q for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 12:15:28 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Rv5My-0003lO-W1 for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 12:07:24 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 12:07:24 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 12:07:24 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 08 Feb 2012 12:07:09 +0100
Message-ID: <jgtl0v$gd6$1@dough.gmane.org>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKpi+WWUuf7iP8QgJK2vgmM3KAgS0Fkhbu3eEy80L2eszA@mail.gmail.com>
	<4F31C45B.1010600@linux.intel.com> <jgtb5c$8oh$1@dough.gmane.org>
	<CAP9ODKpDe4Up_mCuRdTqNY6a-Kkxyz2ZR-GR9uQ+VFFW0HGsJQ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
In-Reply-To: <CAP9ODKpDe4Up_mCuRdTqNY6a-Kkxyz2ZR-GR9uQ+VFFW0HGsJQ@mail.gmail.com>
X-Enigmail-Version: 1.3.5
Subject: Re: [meta-oe][RFC 00/27] systemd / initmanager rework
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
X-List-Received-Date: Wed, 08 Feb 2012 11:15:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 08-02-12 12:00, Otavio Salvador schreef:
> On Wed, Feb 8, 2012 at 06:18, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
> 
>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>> 
>> Op 08-02-12 01:39, Joshua Lock schreef:
>>> It looks like systemd provides various interfaces and API's that
>>> packages may or may not use and as more packages adopt these we're
>>> going to need to be able to enable/disable more than just some unit
>>> files/scripts for init support.
>> 
>> Most (if not all) of those APIs are designed to be used with or
>> without systemd as initmanager, that is why there are seperate shared
>> libraries. I need to double check, but polkit might be the only
>> exception to that in that it needs to have systemd actuall running. But
>> multi-seat is broken anyway currently, so not much difference for the
>> end user either way :)
>> 
> 
> Well, it being broken or not doesn't change that it explicitly depends
> on systemd. We also ought to have a design that will work when this works
> and it seems, up to now, that distro  feature is the only solution  for
> now.

If it's just polkit and udisks and image feature works well enough. Perfect
is the enemy of good and all that.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk8yV1kACgkQMkyGM64RGpHTRgCgqs4wQxV8nk2WOdAeEEtPU++f
l0cAn3vGyEwLSwLX82cZpmAHwB51LoP0
=/BQ0
-----END PGP SIGNATURE-----



