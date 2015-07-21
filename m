Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BE74175669
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 02:49:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6L2nlV8010990
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Jul 2015 19:49:47 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 20 Jul 2015 19:49:47 -0700
To: <openembedded-devel@lists.openembedded.org>, Koen Kooi
	<koen.kooi@linaro.org>
References: <1437119410-3462-1-git-send-email-kai.kang@windriver.com>
	<moi5hq$ahj$1@ger.gmane.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <55ADB34E.7040207@windriver.com>
Date: Tue, 21 Jul 2015 10:49:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <moi5hq$ahj$1@ger.gmane.org>
Subject: Re: [meta-oe][PATCH] dracut: upgrade from 038 to 043
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jul 2015 02:49:52 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年07月20日 14:47, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Kai Kang schreef op 17-07-15 om 09:50:
>> Upgrade dracut from 038 to 043. Update SRC_URI by replacing git with tar
>> ball.
> Why? That makes it really hard to pull in post-release fixes :(

No special reason. For most packages, if it has specfic releases, we 
often have the recipe pkg_version.bb.
For dracut, I didn't realize the necessary to keep the _git version. For 
the post-release fixes, I thought
it should be take them as backport patches.

If this change makes hard to backport patches, I'll send V2 to keep _git 
version.

--Kai

>
>
>> And update bb file name at same time.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com> ---
>> .../recipes-devtools/dracut/dracut_043.bb          | 53
>> +++++++++++++++++++++ .../recipes-devtools/dracut/dracut_git.bb
>> | 55 ---------------------- 2 files changed, 53 insertions(+), 55
>> deletions(-) create mode 100644
>> meta-initramfs/recipes-devtools/dracut/dracut_043.bb delete mode 100644
>> meta-initramfs/recipes-devtools/dracut/dracut_git.bb
>>
>> diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_043.bb
>> b/meta-initramfs/recipes-devtools/dracut/dracut_043.bb new file mode
>> 100644 index 0000000..22c6bae --- /dev/null +++
>> b/meta-initramfs/recipes-devtools/dracut/dracut_043.bb @@ -0,0 +1,53 @@
>> +SUMMARY = "Initramfs generator using udev" +DESCRIPTION = "Dracut is an
>> event driven initramfs infrastructure. dracut (the tool) is used to
>> create an initramfs image by copying tools and files from an installed
>> system and combining it with the dracut framework, usually found in
>> /usr/lib/dracut/modules.d." + +LICENSE = "GPLv2" +LIC_FILES_CHKSUM =
>> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" + +PE = "1" +
>> +SRC_URI =
>> "${KERNELORG_MIRROR}/linux/utils/boot/dracut/dracut-043.tar.xz" +
>> +SRC_URI[md5sum] = "85de75ddf00962e7bb0ae387f05794e5" +SRC_URI[sha256sum]
>> = "1484b558ed20330125aa04dcccab84da15c5689e19068285aa011f7177889cd1" +
>> +inherit distro_features_check +REQUIRED_DISTRO_FEATURES = "systemd" +
>> +EXTRA_OECONF = "--prefix=${prefix} \ +                --libdir=${libdir}
>> \ +                --datadir=${datadir} \ +
>> --sysconfdir=${sysconfdir} \ +                --sbindir=${sbindir} \ +
>> --disable-documentation \ +                --bindir=${bindir} \ +
>> --includedir=${includedir} \ +
>> --localstatedir=${localstatedir} \ +
>> --systemdsystemunitdir=${systemd_unitdir}/system" + +do_configure() { +
>> ./configure ${EXTRA_OECONF} +} + +do_install() { +    oe_runmake install
>> DESTDIR=${D} +} + +PACKAGES =+ "${PN}-bash-completion" +
>> +FILES_${PN}-bash-completion = "${datadir}/bash-completion" +
>> +FILES_${PN} += " ${libdir}/kernel \ +                ${systemd_unitdir}
>> \ +               " +CONFFILES_${PN} += "${sysconfdir}/dracut.conf" +
>> +RDEPENDS_${PN} = "systemd findutils cpio util-linux-blkid
>> util-linux-getopt bash ldd" +RDEPENDS_${PN}-bash-completion =
>> "bash-completion" + +# This could be optimized a bit, but let's avoid
>> non-booting systems :) +RRECOMMENDS_${PN} = " \ +
>> kernel-modules \ +                     busybox \ +
>> coreutils \ +                    " diff --git
>> a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
>> b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb deleted file mode
>> 100644 index 77c137c..0000000 ---
>> a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb +++ /dev/null @@
>> -1,55 +0,0 @@ -SUMMARY = "Initramfs generator using udev" -DESCRIPTION =
>> "Dracut is an event driven initramfs infrastructure. dracut (the tool) is
>> used to create an initramfs image by copying tools and files from an
>> installed system and combining it with the dracut framework, usually
>> found in /usr/lib/dracut/modules.d." - -LICENSE = "GPLv2"
>> -LIC_FILES_CHKSUM =
>> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" - -PE = "1" -PV =
>> "038" - -# v038 tag -SRCREV = "267a109a81715c8957f14659593deb7b6255d40e"
>> -SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git" - -S =
>> "${WORKDIR}/git" - -inherit distro_features_check
>> -REQUIRED_DISTRO_FEATURES = "systemd" - -EXTRA_OECONF =
>> "--prefix=${prefix} \ -                --libdir=${libdir} \ -
>> --datadir=${datadir} \ -                --sysconfdir=${sysconfdir} \ -
>> --sbindir=${sbindir} \ -                --disable-documentation \ -
>> --bindir=${bindir} \ -                --includedir=${includedir} \ -
>> --localstatedir=${localstatedir} \ -
>> --systemdsystemunitdir=${systemd_unitdir}/system" - -do_configure() { -
>> ./configure ${EXTRA_OECONF} -} - -do_install() { -    oe_runmake install
>> DESTDIR=${D} -} - -PACKAGES =+ "${PN}-bash-completion" -
>> -FILES_${PN}-bash-completion = "${datadir}/bash-completion" -
>> -FILES_${PN} += " ${libdir}/kernel \ -                ${systemd_unitdir}
>> \ -               " -CONFFILES_${PN} += "${sysconfdir}/dracut.conf" -
>> -RDEPENDS_${PN} = "systemd findutils cpio util-linux-blkid
>> util-linux-getopt bash ldd" -RDEPENDS_${PN}-bash-completion =
>> "bash-completion" - -# This could be optimized a bit, but let's avoid
>> non-booting systems :) -RRECOMMENDS_${PN} = " \ -
>> kernel-modules \ -                     busybox \ -
>> coreutils \ -                    "
>>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFVrJl6MkyGM64RGpERAjOSAJ0eXwXMBI1/z6Gy3xLv/iGi5oMZXgCdGeGG
> VmSTSLZO3ncjQ0jfrdIFa98=
> =hnRL
> -----END PGP SIGNATURE-----
>


-- 
Regards,
Neil | Kai Kang


