Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6B1C001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:53:56 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.152008.1692150832281958373
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="107670292"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="107670292"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:53:49 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C7B5FCA1E4
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:53:47 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id EBDA76A3CA3
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:53:46 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6D11286E22;
	Wed, 16 Aug 2023 10:53:45 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] smartmontools: upgrade 7.3 -> 7.4
Date: Wed, 16 Aug 2023 09:51:19 +0800
Message-Id: <1692150679-6096-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27816.003
X-TMASE-Result: 10--23.830500-10.000000
X-TMASE-MatchedRID: eJonkIVGkuOjz0nOeth/yUIIxwDaU5mrMhLI/T8MgyVO2MZoFipNWzc5
	8bNLDRhcHC1H009xScJ4iMeV5qbptGhs8KF38n4wRcGHEV0WBxDeGeDcpMd5NjVjvc93O9dk3FF
	dmD0JHa+WuQC6oYEjQXwubYhFktEAvIGZUE01Uqa4u3nS+3EEDp2PthYkuzedLaKzyzWK8GRaNI
	CZ/1nRqOnopDXE2J5abFfKPqaqgui1dF0jp4sQYArcxrzwsv5u+Pj9s/c5EzfTL2GRHAc9cdgjE
	0ANqbLcYW+LSuE6vNA+XOPOgHvefQDNPxu11HXj+s0+QZYAcN9r2qJoNIuCjeCYNmjjnWCC1Ocb
	CqcD38kfHddnQM1YbC0SJhuejL+sVZsjdPpr5NgCg1rav4R3DYOeZuUUsCzCd3XtjqAaoMIm6pa
	sWrPdCZIXj0yi/PVwlHKhAJHzi8YzLiNWNsW4M1XyxzHVg5CoIF9l7eKb2JF9avChsELqKLwAmz
	0iQUL1LBfIRxNxJE1H9XJtpa3/0yqQO0zIUpynh2VzUlo4HVOPQi6pvqAdG50C6WJNXTpik/H9R
	IAQAqIECycSLz9pMD6fvE0gGqnBUA9wTuOI9FE/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR68
	O365bu/QsxUpdsNFeTjw/FyRX6QfE8yM4pjsDwtuKBGekqUpPjKoPgsq7cA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:53:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104404

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- The docker image used for CI and release builds is now based on
  Debian 12 instead of Ubuntu 18.04.
- macOS: CI and release builds are now generated for the x86_64 and arm64
  targets. 32 bit platforms will require to be compiled from the source.
- smartctl '-t short', '-t long' and '-X': NVMe support.
- smartctl '-l selftest': NVMe support.
- smartctl '-l farm': Prints Seagate's vendor-specific Field Access
  Reliability Metrics (FARM) log for ATA and SCSI drives.
- smartctl '-l error': Now also prints an error message for each entry
  of NVMe error information log.
- smartctl '-l genstats': Prints SCSI General statistics and performance
  log page.
- smartctl '-i' and '--identify': ACS-4/5/6 enhancements.
- smartctl '-c': Added NVMe 2.0 capability flags.
- smartctl '-g security': Added 'ata_security.master_password_id'
  to JSON output.  Plaintext output shows Master Password ID if set
  to a non-default value.
- smartctl '-q noserial': Now also suppresses the output of NVMe Namespace
  IEEE EUI-64.
- smartctl '-j': '-l error -l selftest' JSON output for NVMe devices.
- smartctl '-j': Avoid invalid UTF-8 sequences in JSON/YAML strings.
- smartctl '-j': Fixed a bogus exception during SCSI JSON output.
- smartctl '-j': Renamed JSON element 'scsi_temperature' back to
  'temperature' (regression).
- smartctl '-a': Now suggests '-x' for ATA devices because '-a' only
  provides legacy SMART information.
- smartd: No longer issues LOG_CRIT warnings if new entries of NVMe error
  information log do not indicate device problems.
- smartd: Now detects accidental use of smartd_warning script as
  '-M exec' parameter.
- smartd: No longer writes the 'Copyright...' line to syslog.
- smartd.conf '-M always': Sends reminder emails without any delay.
- smartd.conf '-M diminishing': Limited email delay to 32 days.
- ATA: Fixed decoding of extended self-test log on big endian hosts.
- ATA: Enhanced LBA range for device types '-d jmb39x-q,...' and
  '-d jms56x,...' from 33-62 to 1-255.
- ATA: Device type '-d intelliprop,N' now fails with a deprecation message.
  Added '-d intelliprop,N,force' flag to use it anyway.
- ATA/USB: Device type '-d usbasm1352r,N' for ASMedia ASM1352R USB to SATA
  RAID bridges
- SCSI: Fixed possible corruption issue with the Error Counter and
  Non medium Error log pages.
- SCSI: Added more "Informational Exceptions" strings.
- SCSI: Added initial support for REPORT SUPPORTED OPERATION command.
- SCSI: Initial rework of SCSI debug output.
- NVMe: Added error messages for NVMe status values.
- NVMe: Fixed crash after read of error information log on big endian hosts.
- HDD, SSD and USB additions to drive database.
- update-smart-drivedb: Fixed syntax for 'sed' versions which require
  ';' before '}' or do not support ';' at all.
- update-smart-drivedb: Replaced a usually not executed bashism.
- configure: Default for '--with-nvme-devicescan' is now 'yes' also on
  Darwin and FreeBSD.  It is still 'no' on NetBSD only.
- configure: Defines '_FORTIFY_SOURCE=3' if supported and not predefined.
- configure: No longer fails if libsystemd-dev is installed and
  'LDFLAGS=-static' is used.
- Compile fix for systems without legacy 'getdtablesize()'.
- Pre-releases from SVN snapshots now show "pre-VERSION" in version
  information and 'smartctl.pre_release=true' in JSON output.
- Linux: Device type '-d sssraid' for 3SNIC RAID controllers.
- Linux: Device type '-d marvell' now fails with a deprecation message.
  Added '-d marvell,force' flag to use it anyway.
- Linux: The generic SCSI code now defaults to SG_IO_V3 and does no
  longer fall back to the deprecated SCSI_IOCTL_SEND_COMMAND
  (but this ioctl is still used for '-d 3ware' and '-d marvell,force').
- Linux smartd: Now prevents systemd unit startup timeout when many
  devices are registered and then initially checked.
- Linux smartd: Systemd no longer reports a service failure if no device
  is present and a '-q *nodev0*' option is used.
- Solaris SPARC: Dropped legacy ATA support.  Dropped configure option
  '--with-solaris-sparc-ata'.
- Windows: IOCTL_STORAGE_PROTOCOL_COMMAND variant for NVMe self-tests.
- Windows: Installer now defaults to 64-bit executables.
- Windows: No longer prints bogus 'Local Time' if enhanced TZ syntax is used.
- Windows: Workaround to keep backward compatibility with old versions
  of Windows if some versions of MinGW-w64 are used.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{smartmontools_7.3.bb => smartmontools_7.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/smartmontools/{smartmontools_7.3.bb => smartmontools_7.4.bb} (95%)

diff --git a/meta-oe/recipes-extended/smartmontools/smartmontools_7.3.bb b/meta-oe/recipes-extended/smartmontools/smartmontools_7.4.bb
similarity index 95%
rename from meta-oe/recipes-extended/smartmontools/smartmontools_7.3.bb
rename to meta-oe/recipes-extended/smartmontools/smartmontools_7.4.bb
index 1bf55bfcfd..f387147412 100644
--- a/meta-oe/recipes-extended/smartmontools/smartmontools_7.3.bb
+++ b/meta-oe/recipes-extended/smartmontools/smartmontools_7.4.bb
@@ -23,7 +23,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'libcap-ng selinux', d)
 PACKAGECONFIG[libcap-ng] = "--with-libcap-ng=yes,--with-libcap-ng=no,libcap-ng"
 PACKAGECONFIG[selinux] = "--with-selinux=yes,--with-selinux=no,libselinux"
 
-SRC_URI[sha256sum] = "a544f8808d0c58cfb0e7424ca1841cb858a974922b035d505d4e4c248be3a22b"
+SRC_URI[sha256sum] = "e9a61f641ff96ca95319edfb17948cd297d0cd3342736b2c49c99d4716fb993d"
 
 inherit autotools update-rc.d systemd
 
-- 
2.34.1


