Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RXHpG-0000k2-Na
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Dec 2011 20:34:15 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 04 Dec 2011 11:27:22 -0800
Received: by iaqq3 with SMTP id q3so3193380iaq.25
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Dec 2011 11:27:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.172.70 with SMTP id m6mr7190803icz.37.1323026842201; Sun,
	04 Dec 2011 11:27:22 -0800 (PST)
Received: by 10.50.184.166 with HTTP; Sun, 4 Dec 2011 11:27:22 -0800 (PST)
In-Reply-To: <jbgcj8$tmh$2@dough.gmane.org>
References: <cover.1322969413.git.elizabeth.flanagan@intel.com>
	<jbgcj8$tmh$2@dough.gmane.org>
Date: Sun, 4 Dec 2011 11:27:22 -0800
Message-ID: <CAPhnLPDaUb4R0PpSx6jsx3hUUEmEp4LasLMB6E+bZeCz=HKYJg@mail.gmail.com>
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
X-List-Received-Date: Sun, 04 Dec 2011 19:34:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Dec 4, 2011 at 10:02 AM, Koen Kooi <koen@dominion.thruhere.net>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 04-12-11 04:42, Beth Flanagan schreef:
> > Please see commit messages for full description: This RFC includes:
> >
> > - License manifest implementation in preparation for SPDX manifests. -
> > fixes to how licenses are collected. We now can support accurate
> > licenses during a parallel bitbake. - optional addition of license
> > manifest to the generated image. - optional addition of full
> > common-license directory to the generated image. - additional licenses,
> > more SPDX mappings. - ability to add custom license directories instead
> > of adding license files to common-licenses. - some recipe fixes to fix
> > LICENSE fields. - removal of license functionality of base-files as it's
> > now redundant.
> >
> > These patches require the included commits by Paul Eggleton in order to
> > function. Specifically, it requires list_installed_packages in rootfs_*.
> >
> > Please note. License manifest does not work with .deb packaging yet. When
> >  list_installed_packages is working in rootfs_deb, I'll patch include
> > deb.
> >
> > The following changes since commit
> > 9be6d59b78510443d0944513503d515df13caa45:
> >
> > dpkg-native: Fix perl path (2011-12-02 15:31:08 +0000)
> >
> > are available in the git repository at:
> > git://git.yoctoproject.org/poky-contrib eflanagan/license_m1
> >
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/license_m1
>
> Do
> >
> you have a version that is actually again OE so people can test it?
>

All the changes should work against OE-Core (since all the changes are to
that layer only).
I'll pull the latest OE master and test against it though to verify.


> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iEYEARECAAYFAk7btacACgkQMkyGM64RGpE0uwCgroPmuq0cAQXy/V5suGRxwR6q
> k3AAn2czaaK4EWcDacN1foA+VkWibZZV
> =I2Tj
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Elizabeth Flanagan
Yocto Project
Build and Release

