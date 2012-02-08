Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Rv7LD-0001G1-3t for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 14:13:43 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Rv7DR-00012E-KR for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 14:05:41 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 14:05:41 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 14:05:41 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 08 Feb 2012 14:05:28 +0100
Message-ID: <jgtruq$6gb$1@dough.gmane.org>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKpi+WWUuf7iP8QgJK2vgmM3KAgS0Fkhbu3eEy80L2eszA@mail.gmail.com>
	<4F31C45B.1010600@linux.intel.com> <jgtb5c$8oh$1@dough.gmane.org>
	<CAP9ODKpDe4Up_mCuRdTqNY6a-Kkxyz2ZR-GR9uQ+VFFW0HGsJQ@mail.gmail.com>
	<jgtl0v$gd6$1@dough.gmane.org>
	<CAP9ODKp7S2+HR3umrnd9RzT5JE0X_T_cjWPzi6S5WUdZ-SAzoQ@mail.gmail.com>
	<jgtov9$fhv$1@dough.gmane.org>
	<CAP9ODKp7LW3f3-fKk_K_iZsfw2p7R3sH+b_8-QFXNQ89u90+dA@mail.gmail.com>
	<20120208124311.GB3647@jama.jama.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
In-Reply-To: <20120208124311.GB3647@jama.jama.net>
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
X-List-Received-Date: Wed, 08 Feb 2012 13:13:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 08-02-12 13:43, Martin Jansa schreef:
> On Wed, Feb 08, 2012 at 10:28:12AM -0200, Otavio Salvador wrote:
>> On Wed, Feb 8, 2012 at 10:14, Koen Kooi <koen@dominion.thruhere.net>
>> wrote:
>> 
>>> Images with sysvinit will be working the same as before, just with 
>>> libsystemd-logind.so.X being installed. Images with systemd get
>>> working session tracking.
>>> 
>> 
>> AFAIK polkit uses consolekit or systemd. In case you build it with
>> systemd you break consolekit support.
>> 
>> However a stronger point IMO is that some changes, for one or another
>> init system, might involve specific compilation options and thus making
>> their runtime incompatible as it's the case of polkit. Usually people
>> will want one or another init system and I see no gain in have both
>> available.
>> 
>> Forcing user to use a bbappend to have one working well is the wrong
>> way.
> 
> I think that only usable alternative _if it works_ is to build polkit 
> linked always to libsystemd-logind.so.X and force users of sysvinit to
> use small part of systemd (libsystemd-logind.so.X packaged in
> systemd-logind).
> 
> Then we could keep add --enable-systemd to polkit etc., but if this 
> breaks stuff which worked with consolekit, then distro policy would be 
> better.

This is not really directed at Martin, but at the wider audience:

For the past 6 months I have been trying to make consolekit work:

http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-support/consolekit?id=eb828308b8e721e4ad7edbd15f47ecad22ee81cf

http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-support/consolekit?id=5608a748af2c754f60137ab7c3010ccce6bf9e40

And right now it still isn't working properly. Look real close at the first
commit; oe-core developers made a serious effort to make it
non-functional[1], only linking needed to succeeded. So please stop saying
CK will break, it already is broken.

Now back to the original discussion: support setting multiple init managers
in DISTRO_FEATURES and keep the final choice an IMAGE_FEATURE. The end
result: the integrator keeps the same freedoms and when having only a single
init manager in DISTRO_FEATURES things will slightly improve.

regards,

Koen

[1] To be fair, that was not their goal, but it was the end result. No
malice there, I verified :)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk8ycxMACgkQMkyGM64RGpF/MwCfdLEnjLDnZDtN5VhPt0mDZRzi
LbcAn2aYuUZXcPkMRY2qfMYK2dgmSTC5
=sX7J
-----END PGP SIGNATURE-----



