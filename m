Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 047D0601F5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Nov 2014 14:25:40 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Xuixu-0005uU-Kh for openembedded-devel@lists.openembedded.org;
	Sat, 29 Nov 2014 15:25:38 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Nov 2014 15:25:38 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Nov 2014 15:25:38 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 29 Nov 2014 15:25:28 +0100
Message-ID: <m5cl0o$tor$1@ger.gmane.org>
References: <1417164585-46087-1-git-send-email-biannm@cn.fujitsu.com>
	<1417164585-46087-3-git-send-email-biannm@cn.fujitsu.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
In-Reply-To: <1417164585-46087-3-git-send-email-biannm@cn.fujitsu.com>
Subject: Re: [PATCH 2/3] [meta-oe] dmraid: add recipe
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
X-List-Received-Date: Sat, 29 Nov 2014 14:25:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Bian Naimeng schreef op 28-11-14 09:49:
> There is no update anymore since 2010, but is still supported by some
> distro such as Ubuntu(trusty 14.04LTS).
> 
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com> --- 
> .../recipes-extended/dmraid/dmraid_1.0.0.rc16.bb   |  71 +++++ 
> .../dmraid/files/01_fix_broken_linking.patch       | 121 +++++++++ 
> .../dmraid/files/02_disable_dmreg.patch            | 134 ++++++++++ 
> .../files/03_fix_hyphen-used-as-minus-sign.patch   | 291
> +++++++++++++++++++++ .../dmraid/files/04_promise-add-offsets.patch
> |  13 + .../dmraid/files/05_exit_code.patch                |  22 ++ 
> .../dmraid/files/06_support_virtio_devices.patch   |  13 + 
> .../dmraid/files/07_isw-probe-hpa.patch            | 144 ++++++++++ 
> .../files/08_activate_multiple_raid_sets.patch     |  12 + 
> .../dmraid/files/09_pdc_raid10_failure..patch      |  14 + 
> .../dmraid/files/10_ddf1_lsi_persistent_name.patch |  20 ++ 
> .../files/11_fix_isw_sectors_calculation.patch     |  14 + 
> .../dmraid/files/12_jmicron_namefix.patch          |  20 ++ 
> .../dmraid/files/13_fix_testing.patch              |  24 ++ 
> .../files/14_pdc_dump_extended_metadata.patch      | 147 +++++++++++ 
> .../15_drop_p_for_partition_conditional.patch      |  31 +++ 
> .../dmraid/files/16_change-uuid.patch              |  77 ++++++ 
> .../files/17_convert-dmraid45-to-dmraid.patch      | 273
> +++++++++++++++++++ .../dmraid/files/18_ignore-too-small-devices.patch |
> 39 +++ .../files/19_compile-dmraid-in-subdir-tools.patch  |  20 ++ 
> .../20_specifies-install-dir-by-DESTDIR.patch      | 123 +++++++++ 21
> files changed, 1623 insertions(+) create mode 100644
> meta-oe/recipes-extended/dmraid/dmraid_1.0.0.rc16.bb create mode 100644
> meta-oe/recipes-extended/dmraid/files/01_fix_broken_linking.patch create
> mode 100644 meta-oe/recipes-extended/dmraid/files/02_disable_dmreg.patch 
> create mode 100644
> meta-oe/recipes-extended/dmraid/files/03_fix_hyphen-used-as-minus-sign.patch
>
> 
create mode 100644
meta-oe/recipes-extended/dmraid/files/04_promise-add-offsets.patch
> create mode 100644
> meta-oe/recipes-extended/dmraid/files/05_exit_code.patch create mode
> 100644
> meta-oe/recipes-extended/dmraid/files/06_support_virtio_devices.patch 
> create mode 100644
> meta-oe/recipes-extended/dmraid/files/07_isw-probe-hpa.patch create mode
> 100644
> meta-oe/recipes-extended/dmraid/files/08_activate_multiple_raid_sets.patch
>
> 
create mode 100644
meta-oe/recipes-extended/dmraid/files/09_pdc_raid10_failure..patch
> create mode 100644
> meta-oe/recipes-extended/dmraid/files/10_ddf1_lsi_persistent_name.patch 
> create mode 100644
> meta-oe/recipes-extended/dmraid/files/11_fix_isw_sectors_calculation.patch
>
> 
create mode 100644 meta-oe/recipes-extended/dmraid/files/12_jmicron_namefix.patch
> create mode 100644
> meta-oe/recipes-extended/dmraid/files/13_fix_testing.patch create mode
> 100644
> meta-oe/recipes-extended/dmraid/files/14_pdc_dump_extended_metadata.patch
>
> 
create mode 100644
meta-oe/recipes-extended/dmraid/files/15_drop_p_for_partition_conditional.patch
> create mode 100644
> meta-oe/recipes-extended/dmraid/files/16_change-uuid.patch create mode
> 100644
> meta-oe/recipes-extended/dmraid/files/17_convert-dmraid45-to-dmraid.patch
>
> 
create mode 100644
meta-oe/recipes-extended/dmraid/files/18_ignore-too-small-devices.patch
> create mode 100644
> meta-oe/recipes-extended/dmraid/files/19_compile-dmraid-in-subdir-tools.patch
>
> 
create mode 100644
meta-oe/recipes-extended/dmraid/files/20_specifies-install-dir-by-DESTDIR.patch
> 
> diff --git a/meta-oe/recipes-extended/dmraid/dmraid_1.0.0.rc16.bb
> b/meta-oe/recipes-extended/dmraid/dmraid_1.0.0.rc16.bb new file mode
> 100644 index 0000000..281587d --- /dev/null +++
> b/meta-oe/recipes-extended/dmraid/dmraid_1.0.0.rc16.bb @@ -0,0 +1,71 @@ 
> +SUMMARY = "dmraid (Device-mapper RAID tool and library)" +DESCRIPTION =
> "DMRAID supports RAID device discovery, RAID set activation, \ +creation,
> removal, rebuild and display of properties for ATARAID/DDF1 \ +metadata
> on Linux >= 2.4 using device-mapper." +HOMEPAGE =
> "http://people.redhat.com/heinzm/sw/dmraid" +SECTION = "System
> Environment/Base" + +SRC_URI =
> "http://people.redhat.com/heinzm/sw/dmraid/src/old/${BPN}-${PV}.tar.bz2
> \ +           file://01_fix_broken_linking.patch \ +
> file://02_disable_dmreg.patch \ +
> file://03_fix_hyphen-used-as-minus-sign.patch \ +
> file://04_promise-add-offsets.patch \ +
> file://05_exit_code.patch \ +
> file://06_support_virtio_devices.patch \ +
> file://07_isw-probe-hpa.patch \ +
> file://08_activate_multiple_raid_sets.patch \ +
> file://09_pdc_raid10_failure..patch \ +
> file://10_ddf1_lsi_persistent_name.patch \ +
> file://11_fix_isw_sectors_calculation.patch \ +
> file://12_jmicron_namefix.patch \ +           file://13_fix_testing.patch
> \ +           file://14_pdc_dump_extended_metadata.patch \ +
> file://15_drop_p_for_partition_conditional.patch \ +
> file://16_change-uuid.patch \ +
> file://17_convert-dmraid45-to-dmraid.patch \ +
> file://18_ignore-too-small-devices.patch \ +
> file://19_compile-dmraid-in-subdir-tools.patch \ +
> file://20_specifies-install-dir-by-DESTDIR.patch \ +          " + 
> +SRC_URI[md5sum] = "32832c1dfd7e72cd4355490322fca68a" +SRC_URI[sha256sum]
> = "f849c44d041f8891c61419ddf906e6e34b44948939ae9e550be662ffc2492255" + 
> +LICENSE = "GPLv2+" +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=15b3012575eeffacc3cec27a6d3cb31f" + +DEPENDS =
> "lvm2" + +S = "${WORKDIR}/${BPN}/${PV}" + +CONFIGUREOPTS = "
> --build=${BUILD_SYS} \ +                  --host=${HOST_SYS} \ +
> --target=${TARGET_SYS} \ +                  --prefix=${prefix} \ +
> --exec_prefix=${exec_prefix} \ +                  --bindir=${bindir} \ +
> --sbindir=${sbindir} \ +                  --libexecdir=${libexecdir} \ +
> --datadir=${datadir} \ +                  --sysconfdir=${sysconfdir} \ +
> --sharedstatedir=${sharedstatedir} \ +
> --localstatedir=${localstatedir} \ +                  --libdir=${libdir}
> \ +                  --includedir=${includedir} \ +
> --oldincludedir=${oldincludedir} \ +
> --infodir=${infodir} \ +                  --mandir=${mandir} \ +
> " +EXTRA_OECONF += " --disable-static_link --enable-led
> --enable-intel_led --enable-debug  "

There's no previous EXTRA_OECONF, so drop the '+', but ...

> + +do_configure() { +    ./configure ${CONFIGUREOPTS} ${EXTRA_OECONF}

... what's the point of 2 vars instead of one?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFUeddYMkyGM64RGpERAjuVAJ9My2Jhee0WVjd9NriDkH4qRxRaDwCgiVLQ
WugXoDwFtwyhcK2LwBDhv5g=
=VX2H
-----END PGP SIGNATURE-----


