Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Rv2rs-0006WC-GY for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 09:27:08 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Rv2k4-0004vg-Lw for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 09:19:04 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 09:19:04 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 09:19:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 08 Feb 2012 09:18:48 +0100
Message-ID: <jgtb5c$8oh$1@dough.gmane.org>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKpi+WWUuf7iP8QgJK2vgmM3KAgS0Fkhbu3eEy80L2eszA@mail.gmail.com>
	<4F31C45B.1010600@linux.intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
In-Reply-To: <4F31C45B.1010600@linux.intel.com>
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
X-List-Received-Date: Wed, 08 Feb 2012 08:27:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 08-02-12 01:39, Joshua Lock schreef:
> On 07/02/12 07:55, Otavio Salvador wrote:
>> On Tue, Feb 7, 2012 at 13:12, Andreas Müller 
>> <schnitzeltony@googlemail.com>wrote:
>> 
>>> * These are my first python experiences - suggestions welcome. * In
>>> local.conf (or in distro) the configuration variable INIT_MANAGER 
>>> selects the initmanager to be build into an image. When changing the
>>> selection, a build from scratch is required. INIT_MANAGER currently
>>> defaults to systemd (see image.bbclass and initmanager.bbclass) * In
>>> systemd.bbclass debug messages were left in to have a better
>>> overview what's going on. * An additional patch series goes out for
>>> meta-angstrom. * This is a huge RFC which might cause serious
>>> impacts. What I have already detected after a build from scatch is
>>> that /var/lib/opkg is missing in the image (although it can be found
>>> in libopkg.ipk). I will spend the next days with my new friend
>>> buildhistory (thanks for this!!).
>>> 
>> 
>> I've looked at your changes and they does seem to be a good base for 
>> further work:
> 
> I agree, good job!
> 
>> * The init system ought to be a DISTRO_FEATURE (as sysvinit ought to be
>> too IMO)
> 
> I know there's some disagreement with the suggestion that the init
> system ought to be a DISTRO_FEATURE but my (admittedly uninformed)
> opinion is that I can't see how we can avoid it.
> 
> It looks like systemd provides various interfaces and API's that packages
> may or may not use and as more packages adopt these we're going to need
> to be able to enable/disable more than just some unit files/scripts for
> init support.

Most (if not all) of those APIs are designed to be used with or without
systemd as initmanager, that is why there are seperate shared libraries. I
need to double check, but polkit might be the only exception to that in that
it needs to have systemd actuall running. But multi-seat is broken anyway
currently, so not much difference for the end user either way :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk8yL+UACgkQMkyGM64RGpGzNgCfc5P0yfHki4nm47iNNQhAIPs9
xnMAnidOD1px6uM6stwY47LP7oA+4O29
=zO5G
-----END PGP SIGNATURE-----



