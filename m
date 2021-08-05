Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.4416.1628134525151687463
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 20:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=rEIqO68v;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1628134522; i=@fujitsu.com;
	bh=L05V08IisbebVohinipotzSdDSeaH78gVLPhIzjpT0U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=rEIqO68vOo4xYBWBEqeTH73gseM5z/RUqzNMvG0jqH7jMYwzDhW5DjQ5IF2KljXbn
	 nmlrGD4hpS1+Zjp0+vyspcCuv7tKkHXyCkVgVYoNg016kKjuPVcsgFGMqzrgdiDDzB
	 +A9yWB3N90RgLIqY8mkQjktj21iYQo9C38NlAgVKI8jiGxT5RWnYEmVaXs9iu+XWK7
	 95tRxfJypM2smxjb9sCw/IN1b+28fqFYRgum4/n8XhQZVRpg9LYMflQEW2AkzK3i1r
	 Vlx1WPoPzvlFI8CAZxzqnWp/VvAPCKEjyZL1pIk/ix/v/4y7STzWmD5pYV4w/az+4c
	 eUe1peuDuPGjw==
Received: from [100.113.0.182] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 08/4F-16478-A7C5B016; Thu, 05 Aug 2021 03:35:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBIsWRWlGSWpSXmKPExsViZ8MRolsVw51
  o0PGH1+Li4aXMDowe5zauYAxgjGLNzEvKr0hgzZg3+z5bwXXhinXN+5kaGFcJdjFycQgJzGKS
  +LZpLlMXIyeQc5xRYsJnMJtNQE1i+q0brCC2iIC+xNLZe5hBbGYBFYkXv3vYQWxhAUeJCfd+g
  sVZgOJPT90Ds3mB4i+3P2cDsSUEFCSmPHwPFReUODnzCQvEHFWJ7iNPmSBseYnmrbOZIeoVJW
  ZfbmaBsCskZs1qY5rAyDcLSfssJO2zkLQvYGRexWiZVJSZnlGSm5iZo2toYKBraGisa6xraGm
  il1ilm6iXWqqbnJpXUpQIlNVLLC/WK67MTc5J0ctLLdnECAzIlELmQzsYn7z+oHeIUZKDSUmU
  94MEd6IQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd6CaKCcYFFqempFWmYOMDpg0hIcPEoivEvDg
  NK8xQWJucWZ6RCpU4yZHCdXLVnEzPFmLYh8Cybf7QGRbffuAsl2MDlzwcHVzByzwOT99kNA8g
  GYPP/202ZmIZa8/LxUKXHeAJD9AiALMkrz4NbDEsQlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hy
  MSsK8M0Cm8GTmlcBd+QroASagBy7EcoI8UJKIkJJqYBLL/nd293n27N9dOsx1M+TUnqn3m3SH
  dLNwzVrSyyR6JDwoU3/1cpeQra5zNP6wGrbwRXsdCLKTkxToDMxat0RLeTqnRaBg37Hug04XI
  5O9paZFWL8L7/vW8OZRaIqdj3H5YXcP1p7Iu6KnBDX+p1wS33igva2o7rvFh+JPzHPW8cyPTO
  +S/iIhs/bFAzP7e/NPrzop9Xv+iYcnPjFWnIrxmhd07ZFV3lr7gM9/nr1YsmhN0Z6P00zXRP7
  pOvZ/d0X/zoyOk1/E+Wo6z+QZRFknH7W8dWpSTlnnloZXj7x9LK0fXg6p1A9skvUy3TD5c719
  9T6zgocRsxtadkXprLq19NsV590n7CK+iej4KrEUZyQaajEXFScCAOJklIeLAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-232.messagelabs.com!1628134521!91066!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31925 invoked from network); 5 Aug 2021 03:35:22 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-22.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Aug 2021 03:35:22 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1753ZGJo017343
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Aug 2021 04:35:21 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 5 Aug 2021 04:35:14 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libblockdev: upgrade 2.25 -> 2.26
Date: Thu, 5 Aug 2021 11:34:49 +0800
Message-ID: <1628134490-5097-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable

New minor release of the libblockdev library with multiple fixes. See below for details.

Full list of changes

Manuel Wassermann (1):

exec: Fix deprecated glib function call Glib will rename "g_spawn_check_exit_status()" to "g_spawn_check_wait_status()" in version 2.69.
Tomasz Pawe=C5=82 Gajc (1):

remove unused variable and fix build with LLVM/clang
Vojtech Trefny (22):

NEWS.rts: Fix markup
crypto: Fix default key size for non XTS ciphers
vdo: Do not use g_memdup in bd_vdo_stats_copy
fs: Allow using empty label for vfat with newest dosfstools
tests: Call fs_vfat_mkfs with "--mbr=3Dn" extra option in tests
kbd: Fix memory leak
crypto: Fix memory leak
dm: Fix memory leak in the DM plugin and DM logging redirect function
fs: Fix memory leak
kbd: Fix memory leak
lvm-dbus: Fix memory leak
mdraid: Fix memory leak
swap: Fix memory leak
tests: Make sure the test temp mount is always unmounted
tests: Do not check that XFS shrink fails with xfsprogs >=3D 5.12
tests: Temporarily skip test_snapshotcreate_lvorigin_snapshotmerge
Fix skipping tests on Debian testing
crypto: Let cryptsetup autodect encryption sector size when not specified
tests: Do not try to remove VG before removing the VDO pool
tests: Force remove LVM VG /dev/ entry not removed by vgremove
tests: Tag LvmPVVGLVcachePoolCreateRemoveTestCase as unstable
Add missing plugins to the default config

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libblockdev/{libblockdev_2.25.bb =3D> libblockdev_2.26.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libblockdev/{libblockdev_2.25.bb =3D> libblockdev_2.26.bb} (97%)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_2.25.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_2.26.bb
similarity index 97%
rename from meta-oe/recipes-extended/libblockdev/libblockdev_2.25.bb
rename to meta-oe/recipes-extended/libblockdev/libblockdev_2.26.bb
index e18a28e91..14168e6bb 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_2.25.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_2.26.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc07cb499d259452f324bb90c3067d85c"
 inherit autotools gobject-introspection
 
 SRC_URI =3D "git://github.com/storaged-project/libblockdev;branch=3D2.x-branch"
-SRCREV =3D "c50869272b54bf4b4bc3825e8c3332a54678b43f"
+SRCREV =3D "47ff12242c89e36a33259d18b7068b26c3bb1c64"
 S =3D "${WORKDIR}/git"
 
 FILES:${PN} +=3D "${libdir}/python2.7/dist-packages ${libdir}/python3.*/site-packages"
-- 
2.25.1

