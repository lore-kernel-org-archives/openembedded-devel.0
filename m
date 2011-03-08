Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pww7E-0006hT-Vd for openembedded-devel@lists.openembedded.org;
	Tue, 08 Mar 2011 13:34:20 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pwvm1-0006pp-H6 for openembedded-devel@lists.openembedded.org;
	Tue, 08 Mar 2011 13:12:21 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Mar 2011 13:12:21 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Mar 2011 13:12:21 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 08 Mar 2011 13:12:08 +0100
Message-ID: <il56eo$vfc$1@dough.gmane.org>
References: <1299515323-2246-1-git-send-email-sledz@dresearch.de>	<1299516187-27151-1-git-send-email-sledz@dresearch.de>	<1299517044.2132.203.camel@phil-desktop>	<4D751D09.6000808@mentor.com>
	<4D7617B5.1060509@dresearch.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4D7617B5.1060509@dresearch.de>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH v2] gupnp_0.13.4/gupnp-av_0.5.9: disable introspection
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
X-List-Received-Date: Tue, 08 Mar 2011 12:34:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08-03-11 12:49, Steffen Sledz wrote:
> Am 07.03.2011 18:59, schrieb Tom Rini:
>> On 03/07/2011 09:57 AM, Phil Blundell wrote:
>>> On Mon, 2011-03-07 at 17:43 +0100, Steffen Sledz wrote:
>>>> --- a/recipes/upnp/gupnp_0.13.4.bb
>>>> +++ b/recipes/upnp/gupnp_0.13.4.bb
>>>> @@ -2,13 +2,14 @@ LICENSE = "LGPL"
>>>>   DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2 gtk-doc-native libgee"
>>>>
>>>>   require gupnp.inc
>>>> +PR = "1"
>>
>> "r1"
>>
>>>>
>>>>   SRC_URI[md5sum] = "0d562f5f02534c70c3743b2c514db8ba"
>>>>   SRC_URI[sha256sum] = "7974953f38a41236c875c3df509abc43e8218b5925fdc18212a73b1ae0d0e7e8"
>>>>
>>>>   inherit autotools pkgconfig
>>>>
>>>> -EXTRA_OECONF = "--disable-gtk-doc"
>>>> +EXTRA_OECONF = "--disable-gtk-doc --enable-introspection=no"
>>>
>>> I can't help thinking that there must be a better place to put this,
>>> maybe even autotools.bbclass.  We basically want those options for all
>>> packages that will take them, right?
>>
>> Usually this is just in "gnome" stuff and gnome or gnomebase does handle this.  But indeed, perhaps this is something that should be more widely passed in to avoid semi-random breakage.
> 
> Can i get some acks for my patch at least as an interim solution? Currently the build is broken! This really is a blocker. :(

NAK, fix the PRs first
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNdh0YMkyGM64RGpERArXvAJ4yt7VoI/RK4hA6cvmx5ReKJY9HdgCfTcEv
iTy/5tw2fyZNUrND8EU0U8Y=
=JAUx
-----END PGP SIGNATURE-----



