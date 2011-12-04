Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RXJwQ-0008Cz-Nv
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Dec 2011 22:49:47 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 04 Dec 2011 13:41:52 -0800
Received: by iaqq3 with SMTP id q3so3321111iaq.25
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Dec 2011 13:41:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.236.5 with SMTP id uq5mr7579570igc.47.1323034910327; Sun,
	04 Dec 2011 13:41:50 -0800 (PST)
Received: by 10.50.184.166 with HTTP; Sun, 4 Dec 2011 13:41:50 -0800 (PST)
In-Reply-To: <CAPhnLPDaUb4R0PpSx6jsx3hUUEmEp4LasLMB6E+bZeCz=HKYJg@mail.gmail.com>
References: <cover.1322969413.git.elizabeth.flanagan@intel.com>
	<jbgcj8$tmh$2@dough.gmane.org>
	<CAPhnLPDaUb4R0PpSx6jsx3hUUEmEp4LasLMB6E+bZeCz=HKYJg@mail.gmail.com>
Date: Sun, 4 Dec 2011 13:41:50 -0800
Message-ID: <CAPhnLPD4fKLBgppfcCQbKS0oNMZJAL=KK85Hp2NQveJ_68kv0g@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [[RFC] 0/4] license.bbclass: License Manifest Stage 1
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
X-List-Received-Date: Sun, 04 Dec 2011 21:49:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Dec 4, 2011 at 11:27 AM, Flanagan, Elizabeth <
elizabeth.flanagan@intel.com> wrote:

>
>
> On Sun, Dec 4, 2011 at 10:02 AM, Koen Kooi <koen@dominion.thruhere.net>wrote:
>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Op 04-12-11 04:42, Beth Flanagan schreef:
>> > Please see commit messages for full description: This RFC includes:
>> >
>> > - License manifest implementation in preparation for SPDX manifests. -
>> > fixes to how licenses are collected. We now can support accurate
>> > licenses during a parallel bitbake. - optional addition of license
>> > manifest to the generated image. - optional addition of full
>> > common-license directory to the generated image. - additional licenses,
>> > more SPDX mappings. - ability to add custom license directories instead
>> > of adding license files to common-licenses. - some recipe fixes to fix
>> > LICENSE fields. - removal of license functionality of base-files as it's
>> > now redundant.
>> >
>> > These patches require the included commits by Paul Eggleton in order to
>> > function. Specifically, it requires list_installed_packages in rootfs_*.
>> >
>> > Please note. License manifest does not work with .deb packaging yet.
>> When
>> >  list_installed_packages is working in rootfs_deb, I'll patch include
>> > deb.
>> >
>> > The following changes since commit
>> > 9be6d59b78510443d0944513503d515df13caa45:
>> >
>> > dpkg-native: Fix perl path (2011-12-02 15:31:08 +0000)
>> >
>> > are available in the git repository at:
>> > git://git.yoctoproject.org/poky-contrib eflanagan/license_m1
>> >
>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/license_m1
>>
>> Do
>> >
>> you have a version that is actually again OE so people can test it?
>>
>
> All the changes should work against OE-Core (since all the changes are to
> that layer only).
> I'll pull the latest OE master and test against it though to verify.
>

Against OE-Core master, with those 4 commits cherry-picked I was able to
build core-image-minimal with what looks like the correct manifest:

http://pastebin.com/FpH1zUNP

I did have to fix a few things as I had pushed a bad branch (hence some of
the formatting issues Chris picked up on that I had thought I had fixed),
however, it all seems good now.

-b


>
>
>> -----BEGIN PGP SIGNATURE-----
>> Version: GnuPG v1.4.11 (Darwin)
>> Comment: GPGTools - http://gpgtools.org
>>
>> iEYEARECAAYFAk7btacACgkQMkyGM64RGpE0uwCgroPmuq0cAQXy/V5suGRxwR6q
>> k3AAn2czaaK4EWcDacN1foA+VkWibZZV
>> =I2Tj
>> -----END PGP SIGNATURE-----
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>
>
> --
> Elizabeth Flanagan
> Yocto Project
> Build and Release
>



-- 
Elizabeth Flanagan
Yocto Project
Build and Release

