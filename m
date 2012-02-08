Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Rv7AX-0008Nb-8s for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 14:02:41 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Rv72j-0004bu-RP for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 13:54:37 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 13:54:37 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 13:54:37 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 08 Feb 2012 13:54:23 +0100
Message-ID: <jgtra1$1u5$1@dough.gmane.org>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKpi+WWUuf7iP8QgJK2vgmM3KAgS0Fkhbu3eEy80L2eszA@mail.gmail.com>
	<4F31C45B.1010600@linux.intel.com> <jgtb5c$8oh$1@dough.gmane.org>
	<CAP9ODKpDe4Up_mCuRdTqNY6a-Kkxyz2ZR-GR9uQ+VFFW0HGsJQ@mail.gmail.com>
	<jgtl0v$gd6$1@dough.gmane.org>
	<CAP9ODKp7S2+HR3umrnd9RzT5JE0X_T_cjWPzi6S5WUdZ-SAzoQ@mail.gmail.com>
	<jgtov9$fhv$1@dough.gmane.org>
	<CALbNGRQOjKkbYCE9ky6ZfNypCO9eNEsgmjPC_LaXduWb-eptnw@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
In-Reply-To: <CALbNGRQOjKkbYCE9ky6ZfNypCO9eNEsgmjPC_LaXduWb-eptnw@mail.gmail.com>
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
X-List-Received-Date: Wed, 08 Feb 2012 13:02:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 08-02-12 13:51, Andreas Müller schreef:
> On Wed, Feb 8, 2012 at 1:14 PM, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
>> That is why I want to make an exception for polkit and udisks to keep 
>> initmanager selection an IMAGE_FEATURE combined with DISTRO_FEATURE. A 
>> distro maintainer can then choose to support one or more initmanagers
>> and in the case for multiple it can be set per image.
>> 
>> regards,
>> 
>> Koen
> I haven't the point: why do we need such quirks to keep initmager an 
> image feature? Could you please help me out here?
> 
> FYI one of my tests was to build the image I usually work with configured
> as
> 
> INIT_MANAGER = "sysvinit"
> 
> and systemd isn't build at all - so no need to take care at specific 
> recipes: They will configure for what I (or the distro) want them.
> 
> Please see INIT_MANAGER as distro feature.

It is first and foremost and IMAGE_FEATURE. With your reasoning we need to
include sysvinit in every initramfs images as well.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk8ycHwACgkQMkyGM64RGpE9ngCfd3FXoKJnk/9oFHiVKBELeHov
m5kAn1B/YA/IugTnjF5FqGs5RVA7ueWJ
=Adx3
-----END PGP SIGNATURE-----



