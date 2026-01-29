Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24A4D358F7
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 11:17:16 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12777.1769685431968203434
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jan 2026 03:17:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l9eG7B1q;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4358fb60802so514925f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 03:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769685430; x=1770290230; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7NQOi5hCz4DU5Ow4A12pvj1Daycg5g5vc7B24x+sWDc=;
        b=l9eG7B1qKdlYFRtS/M8AZ2TMmhbUPVyuY5O3k7spTLd8U+M762Nb/vhoTR8+K7SRpe
         /eSb9+Ur35Tgnw7kphIU6gtG5Ld6UUR/bRKrDwlA5tKPEdBGSXTt1k2phF0M+BMNHdVa
         8UZ/0hxUtLsF3TRZk43PE4eNt4tppJHT1hM36OlGRKM0LK/E/7kDiNV6qopuusGeQw1r
         X5xvkGW+anKvLNQVtNz5iTAywFE+Mq9Fse3geNb4/hp1Q0kmQhUapv49UBRenosMHvr1
         d00X+woqourofsH0aMfYxRxPWws9u4LI03U3n2WsdE8dFNxIeBZTI35qLMtiRQEPFGBv
         Xmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769685430; x=1770290230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7NQOi5hCz4DU5Ow4A12pvj1Daycg5g5vc7B24x+sWDc=;
        b=jG0LfcfHD6J8OMZpvbQE85DwP55xLe/53/HZgZsxbc+ATAlOn+kdLzVPbog+ZCYaQH
         p+j3+I6d39Qw7hR5B3vCC7Z4YDQYn++5nWDAjs/RrjNSlPcSWyA00/UTiP0Tb5ylcwDs
         CiztpIr6IMLTDK+f5hJzlZ7CWXO4tghQue5c3o5hzo1Oe907e87AI8yYkS66H3BepuV5
         Hv46rxOaIMUu5Yt/UwJh44SOXh/pnolDYOgqR0b3PDmQJvXByGwe8vRio33DTrpeLb09
         W46MI4juUjP9MwMN2Eb9Jukxu+FnwfKivmCPROS3JgmYFIkupdcENssLfDBBmjK9tMDM
         3iKA==
X-Gm-Message-State: AOJu0YwtjJIOReY5tdZzMVJ168a8bxw6vqkw2rwc1yy2xsL5Z/IHEuAs
	vEXjvdo6mXDxyRmQfQYZOQ72yp3HTfsJl3+A63qWGz1xvroGlV99L9FPFSdtyw==
X-Gm-Gg: AZuq6aLhsJw/umSHuSAIgdUtkDxXXJjGQ4dFpLOCWS0HZ4IsR26PoxtSqv82TS0RZqH
	WWEvd94RJnhEWIUqUvVNomF5nkKIeFoIIEafqeB4FEemFOkC/CVobjqKerWCH4dzB6Q5ydseuXy
	4plZMhCf9VkimH/lEoiO7QIsgyeUhw91F2XxPq/a8qbOs8xPx69tCa5Qd3t4uCYWFHGCWk0/ADu
	RdxbRUIQ2HqXjxD8WBl9tuxXaD9ahYE2mxXynkEX//ui4Ip0JKxbOvGffXhPTwxVJHyrgzi9jC4
	uqDa9ktqFJ3FzGeJXElAKkc2gpDEiMY38KHeTPiI3C702cbe7qJ/fiFHWjzLz3xgWpnpxTjXKku
	onjw1SLR2dYKX9AGDuR7s790RucXgWsdL3VGIFPyatbGRAkq5x9QthKHK3DaSTdspQC+0Iu+yyy
	b/5lsZzAxJ
X-Received: by 2002:adf:e88d:0:b0:432:86e3:84ec with SMTP id ffacd0b85a97d-435ea0c3a50mr2532500f8f.23.1769685430259;
        Thu, 29 Jan 2026 03:17:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4824sm14718443f8f.1.2026.01.29.03.17.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 03:17:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 6/6] fwupd: upgrade 2.0.16 -> 2.0.19
Date: Thu, 29 Jan 2026 12:17:05 +0100
Message-ID: <20260129111706.903623-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129111706.903623-1-skandigraun@gmail.com>
References: <20260129111706.903623-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 11:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123992

Ptests passed.

Note: plugin_uefi_capsule_splash PACKAGECONFIG is broken, it fails to configure:

| ../sources/fwupd-2.0.16/plugins/uefi-capsule/meson.build:83:4: ERROR: Problem encountered: Error: missing dependency python gobject introspection (python3-gi)
| Error: missing dependency python cairo (python3-cairo)

This doesn't seem to be a regression from this update, was present before the upgrade also.
(The PACKAGECONFIG is disabled by default)

Changelogs:

2.0.19:
This release adds the following features:
    Add two commands to fwupdtool to calculate and find CRCs
    Allow systems to use the udev event source without using systemd

This release fixes the following bugs:
    Always show the correct new firmware version in 'fwupdmgr get-history'
    Fix an integer underflow when parsing a malicious PE file
    Fix a regression when enumerating the dell-dock status component
    Fix the fuzzer timeout when parsing a synaptics-rmi SBL container
    Fix updating the Intel GPU FWDATA section
    Respect 'fwupdmgr --force' when installing firmware

This release adds support for the following hardware:
    Lenovo Sapphire Folio Keyboard

2.0.18:
This release adds the following features:
    Add a MOTD message for devices needing reboot after staged updates
    Create the reboot-required file when a firmware update requires reboot
    Record the system state for each composite emulation
    Update USI docking station firmware without requiring a manual replug

This release fixes the following bugs:
    Add a MTD device problem if the Intel SPI BIOS lock is set
    Allow changing the child name when using PARENT_NAME_PREFIX
    Allow UpdateCapsule to work on systems that do not support SecureBoot
    Correctly parse the EFI_CAPSULE_RESULT_VARIABLE_HEADER
    Fall back to the SMBIOS version for BIOS MTD devices
    Fix a crash when trying to record an i2c emulation
    Fixed Huddly upgrade problems with major version changes
    Fix man page compatibility with apropos and whatis
    Fix parsing USB BOS descriptors
    Fix up the x86_64-specific capsule flags when deploying UEFI firmware
    Improve firmware stream searching speed by a huge amount
    Only convert the release uint32_t to device version format for UEFI devices
    Only handle SIGINT in fwupdtool when required
    Refactor the hypervisor and container detection to be usable from plugins
    Set PlatformArchitecture as the CPU architecture for RISC-V machines
    Use a sensible timeout when doing qc-s5gen2 HID requests

This release adds support for the following hardware:
    HP Portable USB-C 4K HDMI Hub
    Lenovo Legion Go 2 (as a HID device)
    Synaptics HapticsPad

2.0.17:
This release adds the following features:
    Add support for client-side phased update deployment
    Add support for post-quantum signatures
    Allow clearing the cache dirirectory
    Allow fwupdtpmevlog to dump the raw eventlog data
    Build a NVMe GUID derived from the serial number
    Make fwupdtool extract work with deeply nested images
    Parse VSS and FTW variable stores from EFI volumes
    Reintroduce the FreeBSD CI target
    Support very old versions of UDisks

This release fixes the following bugs:
    Add 'fwupdmgr hwids' by exposing another daemon property
    Add offline hashes for the Microsoft 20250902 dbx
    Add the Framework-specific KEK and db hashes
    Allow updating IFD BIOS region via parent MTD
    Avoid showing reinstall prompts for composite devices
    Clean up the fwupdtool lock file in all cases
    Correctly match the correct historical composite component
    Do not allow PK or KEK updates when system has a test key installed
    Do not allow reinstalling when using ONLY_VERSION_UPGRADE
    Do not require AC power to run the installed tests
    Do not scan EFI volumes when constructing MTD BIOS devices
    Ensure REGION is always set for MTD IFD children
    Ensure SCSI instance IDs are valid ASCII values
    Fix a critical warning when parsing invalid Jabra firmware
    Fix an Ilitek parsing crash found when fuzzing
    Fix an inotify race when refreshing metadata
    Fix a pending-activation problem with Dell docking stations
    Fix a potential hang when creating a chunk array with aligned sizes
    Fix MTD emulation recording for PCI-backed devices
    Fix the device order when the parent specifies install-parent-first
    Fix the FLMSTR layout when reading IFD partitions
    Fix the thunderbolt controller rushing to finalize before onlining retimers
    Fix writing Intel GPU OptionROM data and OptionROM code
    Flush stale events to make the Logitech Rallybar more reliable
    Ignore all the Intel GPU MTD devices
    Ignore errors when writing the last page of Dell dock firmware
    Make an error message more specific
    Modify the Dell dock needs-activation flag after updates are installed
    Only add one devlink device for each PCI card
    Parse the FMAP SBOM area as uSWID when required
    Relax the USI dock DMC child device checks for new firmware
    Revert back to the flashrom deprecated API as the new API is unusable
    Rewrite the fwupdmgr manpage to be more useful
    Use higher delay when update status for Logitech peripheral devices

This release adds support for the following hardware:
    ASUS CX9406 (touch controller)
    Framework Copilot keyboard
    Genesys GL352530 and GL352360
    Huddly C1
    Lexar and Maxio NVMe SSDs
    Primax Ryder mouse 2

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-bsp/fwupd/{fwupd_2.0.16.bb => fwupd_2.0.19.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-bsp/fwupd/{fwupd_2.0.16.bb => fwupd_2.0.19.bb} (97%)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_2.0.16.bb b/meta-oe/recipes-bsp/fwupd/fwupd_2.0.19.bb
similarity index 97%
rename from meta-oe/recipes-bsp/fwupd/fwupd_2.0.16.bb
rename to meta-oe/recipes-bsp/fwupd/fwupd_2.0.19.bb
index 31b17486cb..586f7ad1f9 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_2.0.16.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_2.0.19.bb
@@ -19,7 +19,7 @@ SRC_URI = "\
     https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "79cce6b61d9ea531de0ef3b13e7f2682c699901b11f410b2ed91192618e1620e"
+SRC_URI[sha256sum] = "3bb7a4a1e2d00f0ab513e4c667d7bf5a3ff34a9802757849d3fedf07dd40ddbb"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"

