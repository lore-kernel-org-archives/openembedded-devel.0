Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RLtdF-0006u1-0d for openembedded-devel@lists.openembedded.org;
	Thu, 03 Nov 2011 10:30:45 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RLtXG-0004Pa-Nb for openembedded-devel@lists.openembedded.org;
	Thu, 03 Nov 2011 10:24:34 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2011 10:24:34 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2011 10:24:34 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 03 Nov 2011 10:24:17 +0100
Message-ID: <j8tmk1$jfd$1@dough.gmane.org>
References: <1318807611-16837-1-git-send-email-andrea.adami@gmail.com>
	<1318807611-16837-2-git-send-email-andrea.adami@gmail.com>
	<2904446.7I7DN7edGu@helios> <j8tjq1$o2$1@dough.gmane.org>
	<CAAQYJAt5ApbYCi9f_mNgAN7WjEEZZyAdgPkfhwxjVsePf+VaqA@mail.gmail.com>
	<CAAQYJAv=30cuGTS0rS6bYC=xMjcmxReDH=uyeV+ehBUCbuAaBA@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <CAAQYJAv=30cuGTS0rS6bYC=xMjcmxReDH=uyeV+ehBUCbuAaBA@mail.gmail.com>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-handheld][PATCH 2/3] udev: add bbappend and disable device cache as default.
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
X-List-Received-Date: Thu, 03 Nov 2011 09:30:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 03-11-11 10:22, Andrea Adami schreef:
> On Thu, Nov 3, 2011 at 10:09 AM, Andrea Adami
> <andrea.adami@gmail.com>wrote:
> 
>> On Thu, Nov 3, 2011 at 9:36 AM, Koen Kooi
>> <koen@dominion.thruhere.net>wrote:
>> 
>>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>>> 
>>> Op 02-11-11 22:00, Paul Eggleton schreef:
>>>> On Monday 17 October 2011 01:26:50 Andrea Adami wrote:
>>>>> * For some reasons when the cache is created root can still be ro
>>>>> * and as solution you would be obliged to add 'rw' to your
>>>>> commandline. * There are patches in openembedded-classic to
>>>>> correct this * (and those are still pending for meta-oe). * Until
>>>>> a solution is found disable the creation of the device cache on
>>>>> boot.
>>>>> 
>>>>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com> --- 
>>>>> recipes-core/udev/udev/default      |    4 ++++ 
>>>>> recipes-core/udev/udev_173.bbappend |    1 + 2 files changed, 5 
>>>>> insertions(+), 0 deletions(-) create mode 100644 
>>>>> recipes-core/udev/udev/default create mode 100644 
>>>>> recipes-core/udev/udev_173.bbappend
>>>>> 
>>>>> diff --git a/recipes-core/udev/udev/default 
>>>>> b/recipes-core/udev/udev/default new file mode 100644 index 
>>>>> 0000000..ba2867e --- /dev/null +++
>>>>> b/recipes-core/udev/udev/default @@ -0,0 +1,4 @@ +# Default for
>>>>> /etc/init.d/udev + +# Uncomment this out to enable device cache
>>>>> +#DEVCACHE="/etc/dev.tar" diff --git 
>>>>> a/recipes-core/udev/udev_173.bbappend 
>>>>> b/recipes-core/udev/udev_173.bbappend new file mode 100644 index 
>>>>> 0000000..72d991c --- /dev/null +++ 
>>>>> b/recipes-core/udev/udev_173.bbappend @@ -0,0 +1 @@ 
>>>>> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>>>> 
>>>> I think this is going to cause problems for distros such as
>>>> Angstrom that enable this layer without always using it. Can we
>>>> just disable the dev cache for the machines in meta-handheld?
>>> 
>>> Or get with the program and use udev 174 with systemd, no need for a 
>>> device cache in that case!
>>> 
>>> regards,
>>> 
>>> Koen
>>> 
>> 
>> Sure, this is the future...but for now oe-core doesn't implement
>> systemd as default.
>> 
>> Until then, I think we should have sane defaults allowing to build
>> with just oe-core + meta-oe + meta-handheld even without distro
>> layers.
>> 
>> Regards
>> 
>> Andrea
>> 
> 
> 
> Oh, I forgot to say that's unfortunate oe-core is still on udev_164. 
> Probably they have been scared by the note "# udev 169 and up require 
> kernel 2.6.36 for ARM:"
> 
> Is this still a problem? Maybe we should insist on the oe-core list and
> try to unify the recipes.

It's not a problem if you backport the patches udev needs :)

E.g.
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstruments/tree/recipes-kernel/linux/linux-omap4_2.6.35.7.bb



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOsl3BMkyGM64RGpERAmHPAJkBIlv7noLAr+tqSLyRRWNCRDu8JQCgsgun
62cQ+8B93YcHPBGjcd2J0rk=
=EVzO
-----END PGP SIGNATURE-----



