Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D42FC433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 01:42:37 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.799.1642556553068555617
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 17:42:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=duKfSksI;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642556550; i=@fujitsu.com;
	bh=4V/I3S64s4yFIAFlrv3eMCiyqSaVu09e5oc5WqtZZt8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=duKfSksIlMKBoV0MahvbVzMaMGDfctB5Yy5oEBg5d9FfShoGNxuR8xX4i4vmBwKDP
	 mdovigej00Pk9urvHeo3Or4IRqqMMj9jiYn5f5EehETmDSMrVR9Wh8IJC7jLu0h//G
	 ccMQpQ1nDLUYowrj/+Prt1UweY8u05bZ8VcimyS2e0pFchyz1qiqY7Q9v8ihxT5aql
	 HgWSHpLw7AlzYlKwNtaCX4CfIehKMy/Utky+uFC08NNsAbXtXtQGLU5IzrRYRRGvAY
	 Zcugf9EmAywX5gNMD9mahwp72W5K3+A3hQyyEHba+dOzbLE8bzctOlsJQOoQMV/aAc
	 0vwNu2WLRbwZg==
Received: from [100.115.65.13] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 E5/29-31213-68C67E16; Wed, 19 Jan 2022 01:42:30 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRWlGSWpSXmKPExsViZ8MxSbct53m
  iwb0zvBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8axN1OZCz7oVtzac4S1gfGHWhcjF4eQwBNG
  iTuffrBBOBeYJGbOXsgI4ZxglNjy5gVTFyMnB5uAmsT0WzdYQWwRAX2JpbP3MIPYzAIqEi9+9
  7CD2MICThId//eCxVkEVCVOHl8IZvMCxS9+mQxmSwgoSEx5+B7M5hRwlpj//TbQTA6gZU4Scx
  97Q5QLSpyc+YQFYryExMEXL6BaFSVmX25mgbArJGbNamOCsNUkrp7bxDyBUXAWkvZZSNoXMDK
  tYrRLKspMzyjJTczM0TU0MNA1NDTVNTPRNTIx1Uus0k3USy3VTU7NKylKBErrJZYX66UWF+sV
  V+Ym56To5aWWbGIEBnNKscPXHYzH+37qHWKU5GBSEuUVjX+eKMSXlJ9SmZFYnBFfVJqTWnyIU
  YaDQ0mClxUYH0KCRanpqRVpmTnAyIJJS3DwKInwPs0CSvMWFyTmFmemQ6ROMRpzXL4+bxEzR/
  Ok5duZhVjy8vNSpcR5O7OBSgVASjNK8+AGwSL+EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiV
  h3tcgC3ky80rg9r0COoUJ6JT+Z89ATilJREhJNTBV2ERzLer72ycZPL2zpOFN9zbXWwfWvghx
  dfMLvXVA6brOhi0xeutmNquttMtZpvH/yP6Tnl43jOriDbPenl+n6/NT/vSP2mtyxlnOe19d2
  32wqjAteHFdifGyj2r/1O/a6F390JTJOFGmpn3ftzkbZJeW1GnPl6n/9UfEaMucmU8WJc5bcH
  jeRivLMKdf73Xt9awl934tO2tfX5vy/uf/Z/Fa3x5ruhy6rfyc12uR38WZv+Z/nODyMYjDZn7
  ngRb+z0YmFYqlLpFv7VwlL36/H5Qk8Ed0svLcSa8/98Y4PZ95dsa61MY8R6eKP6dmr971pVqO
  74FZSHQ6r86kK8rn6useLP33OKDRbPrunOJIJZbijERDLeai4kQAXfu5EHMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-532.messagelabs.com!1642556549!57367!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10722 invoked from network); 19 Jan 2022 01:42:30 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Jan 2022 01:42:30 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id BE69F1000FB
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 01:42:29 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A347D100446
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 01:42:29 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 19 Jan 2022 01:42:13 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] cryptsetup: upgrade 2.4.2 -> 2.4.3
Date: Wed, 19 Jan 2022 09:41:59 +0800
Message-ID: <1642556519-18240-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642556519-18240-1-git-send-email-wangmy@fujitsu.com>
References: <1642556519-18240-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jan 2022 01:42:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94924

Changelog:
=========
Stable security bug-fix release that fixes CVE-2021-4122.

All users of cryptsetup 2.4.x must upgrade to this version.

Changes since version 2.4.2
~~~~~~~~~~~~~~~~~~~~~~~~~~~

* Fix possible attacks against data confidentiality through LUKS2 online
  reencryption extension crash recovery (CVE-2021-4122).

  An attacker can modify on-disk metadata to simulate decryption in
  progress with crashed (unfinished) reencryption step and persistently
  decrypt part of the LUKS device.

  This attack requires repeated physical access to the LUKS device but
  no knowledge of user passphrases.

  The decryption step is performed after a valid user activates
  the device with a correct passphrase and modified metadata.
  There are no visible warnings for the user that such recovery happened
  (except using the luksDump command). The attack can also be reversed
  afterward (simulating crashed encryption from a plaintext) with
  possible modification of revealed plaintext.

  The size of possible decrypted data depends on configured LUKS2 header
  size (metadata size is configurable for LUKS2).
  With the default parameters (16 MiB LUKS2 header) and only one
  allocated keyslot (512 bit key for AES-XTS), simulated decryption with
  checksum resilience SHA1 (20 bytes checksum for 4096-byte blocks),
  the maximal decrypted size can be over 3GiB.

  The attack is not applicable to LUKS1 format, but the attacker can
  update metadata in place to LUKS2 format as an additional step.
  For such a converted LUKS2 header, the keyslot area is limited to
  decrypted size (with SHA1 checksums) over 300 MiB.

  The issue is present in all cryptsetup releases since 2.2.0.
  Versions 1.x, 2.0.x, and 2.1.x are not affected, as these do not
  contain LUKS2 reencryption extension.

  The problem was caused by reusing a mechanism designed for actual
  reencryption operation without reassessing the security impact for new
  encryption and decryption operations. While the reencryption requires
  calculating and verifying both key digests, no digest was needed to
  initiate decryption recovery if the destination is plaintext (no
  encryption key). Also, some metadata (like encryption cipher) is not
  protected, and an attacker could change it. Note that LUKS2 protects
  visible metadata only when a random change occurs. It does not protect
  against intentional modification but such modification must not cause
  a violation of data confidentiality.

  The fix introduces additional digest protection of reencryption
  metadata. The digest is calculated from known keys and critical
  reencryption metadata. Now an attacker cannot create correct metadata
  digest without knowledge of a passphrase for used keyslots.
  For more details, see LUKS2 On-Disk Format Specification version 1.1.0.

  The former reencryption operation (without the additional digest) is no
  longer supported (reencryption with the digest is not backward
  compatible). You need to finish in-progress reencryption before
  updating to new packages. The alternative approach is to perform
  a repair command from the updated package to recalculate reencryption
  digest and fix metadata.
  The reencryption repair operation always require a user passphrase.

  WARNING: Devices with older reencryption in progress can be no longer
  activated without performing the action mentioned above.

  Encryption in progress can be detected by running the luksDump command
  (output includes reencrypt keyslot with reencryption parameters). Also,
  during the active reencryption, no keyslot operations are available
  (change of passphrases, etc.).

  The issue was found by Milan Broz as cryptsetup maintainer.

Other changes
~~~~~~~~~~~~~
* Add configure option --disable-luks2-reencryption to completely disable
  LUKS2 reencryption code.

  When used, the libcryptsetup library can read metadata with
  reencryption code, but all reencryption API calls and cryptsetup
  reencrypt commands are disabled.

  Devices with online reencryption in progress cannot be activated.
  This option can cause some incompatibilities. Please use with care.

* Improve internal metadata validation code for reencryption metadata.

* Add updated documentation for LUKS2 On-Disk Format Specification
  version 1.1.0 (with reencryption extension description and updated
  metadata description). See docs/on-disk-format-luks2.pdf or online
  version in https://gitlab.com/cryptsetup/LUKS2-docs repository.

* Fix support for bitlk (BitLocker compatible) startup key with new
  metadata entry introduced in Windows 11.

* Fix space restriction for LUKS2 reencryption with data shift.
  The code required more space than was needed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cryptsetup/{cryptsetup_2.4.2.bb => cryptsetup_2.4.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.4.2.bb => cryptsetup_2.4.3.bb} (97%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.2.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
similarity index 97%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.2.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
index 621ac0f2f..8f9f663a3 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.2.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
@@ -21,7 +21,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 LDFLAGS:append:libc-musl = " -largp"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "170cc2326a9daeeeb578579176bd10d4a60ee5c4fc5bc69018ce67dafc540b9c"
+SRC_URI[sha256sum] = "fc0df945188172264ec5bf1d0bda08264fadc8a3f856d47eba91f31fe354b507"
 
 inherit autotools gettext pkgconfig
 
-- 
2.25.1


