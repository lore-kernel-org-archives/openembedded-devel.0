Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id DA09671C1F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jun 2017 17:21:54 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y7so11054299pfd.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jun 2017 10:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KV2Mi1xUFgdgPWtpBtEW3LrI4dy2CbuJlfuioRZuRzg=;
	b=GfF0oLE7KqCOpyadxeFLRsevht/KPOmGV+tdLeC1rr0zegAu0KsP6/Vrk5onJP8Bt1
	JvfoIavlR0+manJfRe+3U/fl+G4VgoAdQ8Tmdoi0/bCTiRTYJMEtbepGC/KTxsLysXuG
	MC6tUlZRg5lxUpN2qFjlMyN4AD+71aNO6HGDbckeXycT8M6zYUPF6gC3z9q6QTqWgX5G
	1RzL9qvr5K8lnR8EAoHu7WWC4SStuQHeflxZoDbJON/q8jbrc2iKB1QsKPcgnFwQMSNk
	L1YosA2RGAkzoMwIm26Y5W5V8fiW8a7qtk7MKfQqARZPPC1BtT7AyH/k3Xq5mW4SVxzL
	DeLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KV2Mi1xUFgdgPWtpBtEW3LrI4dy2CbuJlfuioRZuRzg=;
	b=gOD2v+G3beF5jFxLhflpwRtWeG+hi9VXVkk3hZBH/wufWQT/Oa8bIdAL12NIRRsxUX
	msDS54orpebWSRBG3y4xY0o+StnIdrfZz6Bt1gf/pe5OmWqiu+Ggo2BIU/zZxStomwBO
	R1/lz8+cNFM6CGZFUuJgdjvHeHnjLcXYg2Z2/ylGKWRiqFPKxX7ojqt2/kNgNru38IhX
	oQN+7kd08svo2Kd4rIC4+/y9+v/t84CoFJTi/hNLRG7++sCTLWrvzQnTzUxNLB7JB6QD
	70NTq41zqr745aBqYT92cFlRapsul0RdTHV68HQA0j2mojQ9Od8hNre+qR071Oqte/os
	zt6g==
X-Gm-Message-State: AKS2vOw+sB98Hym0z79gJdFsJfaTc3Mb6iFWooVdbFBED6blRixbdapl
	777eeb2DXsWFUF5V
X-Received: by 10.98.71.84 with SMTP id u81mr17130894pfa.102.1497720115176;
	Sat, 17 Jun 2017 10:21:55 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::36d3])
	by smtp.gmail.com with ESMTPSA id
	o12sm12201226pfi.9.2017.06.17.10.21.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Jun 2017 10:21:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Jun 2017 10:21:36 -0700
Message-Id: <20170617172142.1311-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170617172142.1311-1-raj.khem@gmail.com>
References: <20170617172142.1311-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/9] ssiapi: Fix build with gcc7 and musl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 17 Jun 2017 17:21:55 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Use-pragma-once-unconditionally.patch     | 872 +++++++++++++++++++++
 .../0002-Convert-macros-into-functions.patch       | 123 +++
 ...-canonicalize_file_name-with-realpath-API.patch |  33 +
 ...ne-Fix-indentation-and-missing-semi-colon.patch |  54 ++
 .../ssiapi/0005-engine-Define-SENTINEL.patch       |  40 +
 ...issing-includes-and-use-realpath-instead-.patch |  40 +
 meta-oe/recipes-support/ssiapi/ssiapi_1.0.1.bb     |   9 +-
 7 files changed, 1170 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/ssiapi/ssiapi/0001-Use-pragma-once-unconditionally.patch
 create mode 100644 meta-oe/recipes-support/ssiapi/ssiapi/0002-Convert-macros-into-functions.patch
 create mode 100644 meta-oe/recipes-support/ssiapi/ssiapi/0003-Replace-canonicalize_file_name-with-realpath-API.patch
 create mode 100644 meta-oe/recipes-support/ssiapi/ssiapi/0004-engine-Fix-indentation-and-missing-semi-colon.patch
 create mode 100644 meta-oe/recipes-support/ssiapi/ssiapi/0005-engine-Define-SENTINEL.patch
 create mode 100644 meta-oe/recipes-support/ssiapi/ssiapi/0006-tools-Add-missing-includes-and-use-realpath-instead-.patch

diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0001-Use-pragma-once-unconditionally.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0001-Use-pragma-once-unconditionally.patch
new file mode 100644
index 000000000..ef6ae00e3
--- /dev/null
+++ b/meta-oe/recipes-support/ssiapi/ssiapi/0001-Use-pragma-once-unconditionally.patch
@@ -0,0 +1,872 @@
+From 3100e23c50e38bff0c2ec77bc30049c113c29414 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 16 Jun 2017 20:44:31 -0700
+Subject: [PATCH 1/6] Use pragma once unconditionally
+
+in OE we do not worry about supporting
+gcc 3.4 anyway
+
+Upstream-Status: Inappropriate[Bumps required gcc to be > 3.4]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/efi/efi.h                     | 2 --
+ lib/engine/ahci.h                 | 2 --
+ lib/engine/ahci_cdrom.h           | 2 --
+ lib/engine/ahci_disk.h            | 2 --
+ lib/engine/ahci_multiplier.h      | 2 --
+ lib/engine/ahci_multiplier_phy.h  | 2 --
+ lib/engine/ahci_multiplier_port.h | 2 --
+ lib/engine/ahci_phy.h             | 2 --
+ lib/engine/ahci_port.h            | 2 --
+ lib/engine/ahci_raid_info.h       | 2 --
+ lib/engine/ahci_tape.h            | 2 --
+ lib/engine/array.h                | 2 --
+ lib/engine/block_device.h         | 2 --
+ lib/engine/cache.h                | 2 --
+ lib/engine/container.h            | 2 --
+ lib/engine/context_manager.h      | 2 --
+ lib/engine/controller.h           | 2 --
+ lib/engine/enclosure.h            | 2 --
+ lib/engine/end_device.h           | 2 --
+ lib/engine/event.h                | 2 --
+ lib/engine/event_manager.h        | 2 --
+ lib/engine/exception.h            | 2 --
+ lib/engine/filesystem.h           | 2 --
+ lib/engine/isci.h                 | 2 --
+ lib/engine/isci_cdrom.h           | 2 --
+ lib/engine/isci_disk.h            | 2 --
+ lib/engine/isci_expander.h        | 2 --
+ lib/engine/isci_expander_phy.h    | 2 --
+ lib/engine/isci_expander_port.h   | 2 --
+ lib/engine/isci_phy.h             | 2 --
+ lib/engine/isci_port.h            | 2 --
+ lib/engine/isci_raid_info.h       | 2 --
+ lib/engine/isci_tape.h            | 2 --
+ lib/engine/list.h                 | 2 --
+ lib/engine/mdadm_config.h         | 2 --
+ lib/engine/multimedia_device.h    | 2 --
+ lib/engine/nondisk_device.h       | 2 --
+ lib/engine/object.h               | 2 --
+ lib/engine/pci_header.h           | 2 --
+ lib/engine/phy.h                  | 2 --
+ lib/engine/port.h                 | 2 --
+ lib/engine/raid_device.h          | 2 --
+ lib/engine/raid_info.h            | 2 --
+ lib/engine/remote_port.h          | 2 --
+ lib/engine/routing_device.h       | 2 --
+ lib/engine/session.h              | 2 --
+ lib/engine/session_manager.h      | 2 --
+ lib/engine/storage_device.h       | 2 --
+ lib/engine/stream_device.h        | 2 --
+ lib/engine/string.h               | 2 --
+ lib/engine/unique_id_manager.h    | 2 --
+ lib/engine/utils.h                | 2 --
+ lib/engine/volume.h               | 2 --
+ lib/log/log.h                     | 2 --
+ lib/mpb/machine_bytes.h           | 2 --
+ lib/mpb/mpb.h                     | 2 --
+ lib/orom/orom.h                   | 2 --
+ 57 files changed, 114 deletions(-)
+
+diff --git a/lib/efi/efi.h b/lib/efi/efi.h
+index 9e7e41b..804e567 100644
+--- a/lib/efi/efi.h
++++ b/lib/efi/efi.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __EFI_H__INCLUDED__
+ #define __EFI_H__INCLUDED__
+diff --git a/lib/engine/ahci.h b/lib/engine/ahci.h
+index e883d1a..80a9699 100644
+--- a/lib/engine/ahci.h
++++ b/lib/engine/ahci.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __AHCI_H__INCLUDED__
+ #define __AHCI_H__INCLUDED__
+diff --git a/lib/engine/ahci_cdrom.h b/lib/engine/ahci_cdrom.h
+index 442f301..d8ca042 100644
+--- a/lib/engine/ahci_cdrom.h
++++ b/lib/engine/ahci_cdrom.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __AHCI_CDROM_H__INCLUDED__
+ #define __AHCI_CDROM_H__INCLUDED__
+diff --git a/lib/engine/ahci_disk.h b/lib/engine/ahci_disk.h
+index 7892a53..1bad9ad 100644
+--- a/lib/engine/ahci_disk.h
++++ b/lib/engine/ahci_disk.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __AHCI_DISK_H__INCLUDED__
+ #define __AHCI_DISK_H__INCLUDED__
+diff --git a/lib/engine/ahci_multiplier.h b/lib/engine/ahci_multiplier.h
+index d63e9bc..1029af2 100644
+--- a/lib/engine/ahci_multiplier.h
++++ b/lib/engine/ahci_multiplier.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __AHCI_MULTIPLIER_H__INCLUDED__
+ #define __AHCI_MULTIPLIER_H__INCLUDED__
+diff --git a/lib/engine/ahci_multiplier_phy.h b/lib/engine/ahci_multiplier_phy.h
+index 58ecebc..2132c23 100644
+--- a/lib/engine/ahci_multiplier_phy.h
++++ b/lib/engine/ahci_multiplier_phy.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __AHCI_MULTIPLIER_PHY_H__INCLUDED__
+ #define __AHCI_MULTIPLIER_PHY_H__INCLUDED__
+diff --git a/lib/engine/ahci_multiplier_port.h b/lib/engine/ahci_multiplier_port.h
+index 5ff4cf7..2402473 100644
+--- a/lib/engine/ahci_multiplier_port.h
++++ b/lib/engine/ahci_multiplier_port.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __AHCI_MULTIPLIER_PORT_H__INCLUDED__
+ #define __AHCI_MULTIPLIER_PORT_H__INCLUDED__
+diff --git a/lib/engine/ahci_phy.h b/lib/engine/ahci_phy.h
+index e2254e7..a44dae0 100644
+--- a/lib/engine/ahci_phy.h
++++ b/lib/engine/ahci_phy.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __AHCI_PHY_H__INCLUDED__
+ #define __AHCI_PHY_H__INCLUDED__
+diff --git a/lib/engine/ahci_port.h b/lib/engine/ahci_port.h
+index f9e3308..03c109b 100644
+--- a/lib/engine/ahci_port.h
++++ b/lib/engine/ahci_port.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __AHCI_PORT_H__INCLUDED__
+ #define __AHCI_PORT_H__INCLUDED__
+diff --git a/lib/engine/ahci_raid_info.h b/lib/engine/ahci_raid_info.h
+index e1c81ae..c70e63e 100644
+--- a/lib/engine/ahci_raid_info.h
++++ b/lib/engine/ahci_raid_info.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __AHCI_RAID_INFO_H__INCLUDED__
+ #define __AHCI_RAID_INFO_H__INCLUDED__
+diff --git a/lib/engine/ahci_tape.h b/lib/engine/ahci_tape.h
+index cdd9f13..a91fd2c 100644
+--- a/lib/engine/ahci_tape.h
++++ b/lib/engine/ahci_tape.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __AHCI_TAPE_H__INCLUDED__
+ #define __AHCI_TAPE_H__INCLUDED__
+diff --git a/lib/engine/array.h b/lib/engine/array.h
+index 36fb4a4..0986ce3 100644
+--- a/lib/engine/array.h
++++ b/lib/engine/array.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __ARRAY_H__INCLUDED__
+ #define __ARRAY_H__INCLUDED__
+diff --git a/lib/engine/block_device.h b/lib/engine/block_device.h
+index 4503914..45dd3db 100644
+--- a/lib/engine/block_device.h
++++ b/lib/engine/block_device.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __BLOCK_DEVICE_H__INCLUDED__
+ #define __BLOCK_DEVICE_H__INCLUDED__
+diff --git a/lib/engine/cache.h b/lib/engine/cache.h
+index 72cf521..72da20b 100644
+--- a/lib/engine/cache.h
++++ b/lib/engine/cache.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3,4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __CACHE_H__INCLUDED__
+ #define __CACHE_H__INCLUDED__
+diff --git a/lib/engine/container.h b/lib/engine/container.h
+index 53867b0..c71180c 100644
+--- a/lib/engine/container.h
++++ b/lib/engine/container.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3,4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __CONTAINER_H__INCLUDED__
+ #define __CONTAINER_H__INCLUDED__
+diff --git a/lib/engine/context_manager.h b/lib/engine/context_manager.h
+index fe9c256..6b4a2e7 100644
+--- a/lib/engine/context_manager.h
++++ b/lib/engine/context_manager.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3,4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __CONTEXT_H__INCLUDED__
+ #define __CONTEXT_H__INCLUDED__
+diff --git a/lib/engine/controller.h b/lib/engine/controller.h
+index a2f188a..6bd078f 100644
+--- a/lib/engine/controller.h
++++ b/lib/engine/controller.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __CONTROLLER_H__INCLUDED__
+ #define __CONTROLLER_H__INCLUDED__
+diff --git a/lib/engine/enclosure.h b/lib/engine/enclosure.h
+index 3faef0c..f4b13cc 100644
+--- a/lib/engine/enclosure.h
++++ b/lib/engine/enclosure.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __ENCLOSURE_H__INCLUDED__
+ #define __ENCLOSURE_H__INCLUDED__
+diff --git a/lib/engine/end_device.h b/lib/engine/end_device.h
+index f147e41..269b236 100644
+--- a/lib/engine/end_device.h
++++ b/lib/engine/end_device.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __END_DEVICE_H__INCLUDED__
+ #define __END_DEVICE_H__INCLUDED__
+diff --git a/lib/engine/event.h b/lib/engine/event.h
+index cf9bb4f..11a4926 100644
+--- a/lib/engine/event.h
++++ b/lib/engine/event.h
+@@ -12,9 +12,7 @@ Redistribution and use in source and binary forms, with or without modification,
+ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __EVENT_H__INCLUDED__
+ #define __EVENT_H__INCLUDED__
+diff --git a/lib/engine/event_manager.h b/lib/engine/event_manager.h
+index 65007b9..a7a8fc3 100644
+--- a/lib/engine/event_manager.h
++++ b/lib/engine/event_manager.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __EVENT_MANAGER_H__INCLUDED__
+ #define __EVENT_MANAGER_H__INCLUDED__
+diff --git a/lib/engine/exception.h b/lib/engine/exception.h
+index 171e45d..183ebb5 100644
+--- a/lib/engine/exception.h
++++ b/lib/engine/exception.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __EXCEPTION_H__INCLUDED__
+ #define __EXCEPTION_H__INCLUDED__
+diff --git a/lib/engine/filesystem.h b/lib/engine/filesystem.h
+index 9c2ce39..b49df07 100644
+--- a/lib/engine/filesystem.h
++++ b/lib/engine/filesystem.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __FILESYSTEM_H__INCLUDED__
+ #define __FILESYSTEM_H__INCLUDED__
+diff --git a/lib/engine/isci.h b/lib/engine/isci.h
+index ea35cd4..0fa602a 100644
+--- a/lib/engine/isci.h
++++ b/lib/engine/isci.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __ISCI_H__INCLUDED__
+ #define __ISCI_H__INCLUDED__
+diff --git a/lib/engine/isci_cdrom.h b/lib/engine/isci_cdrom.h
+index 87b7e7b..25637f9 100644
+--- a/lib/engine/isci_cdrom.h
++++ b/lib/engine/isci_cdrom.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __ISCI_CDROM_H__INCLUDED__
+ #define __ISCI_CDROM_H__INCLUDED__
+diff --git a/lib/engine/isci_disk.h b/lib/engine/isci_disk.h
+index 596c3cf..8dd0dae 100644
+--- a/lib/engine/isci_disk.h
++++ b/lib/engine/isci_disk.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __ISCI_DISK_H__INCLUDED__
+ #define __ISCI_DISK_H__INCLUDED__
+diff --git a/lib/engine/isci_expander.h b/lib/engine/isci_expander.h
+index ca7c2f1..7dc1920 100644
+--- a/lib/engine/isci_expander.h
++++ b/lib/engine/isci_expander.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __ISCI_EXPANDER_H__INCLUDED__
+ #define __ISCI_EXPANDER_H__INCLUDED__
+diff --git a/lib/engine/isci_expander_phy.h b/lib/engine/isci_expander_phy.h
+index c9cd770..d3d2832 100644
+--- a/lib/engine/isci_expander_phy.h
++++ b/lib/engine/isci_expander_phy.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __ISCI_EXPANDER_PHY_H__INCLUDED__
+ #define __ISCI_EXPANDER_PHY_H__INCLUDED__
+diff --git a/lib/engine/isci_expander_port.h b/lib/engine/isci_expander_port.h
+index e65a124..4fc9310 100644
+--- a/lib/engine/isci_expander_port.h
++++ b/lib/engine/isci_expander_port.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __ISCI_EXPANDER_PORT_H__INCLUDED__
+ #define __ISCI_EXPANDER_PORT_H__INCLUDED__
+diff --git a/lib/engine/isci_phy.h b/lib/engine/isci_phy.h
+index 767a5b2..105c697 100644
+--- a/lib/engine/isci_phy.h
++++ b/lib/engine/isci_phy.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __ISCI_PHY_H__INCLUDED__
+ #define __ISCI_PHY_H__INCLUDED__
+diff --git a/lib/engine/isci_port.h b/lib/engine/isci_port.h
+index b80be7f..5ccc151 100644
+--- a/lib/engine/isci_port.h
++++ b/lib/engine/isci_port.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __ISCI_PORT_H__INCLUDED__
+ #define __ISCI_PORT_H__INCLUDED__
+diff --git a/lib/engine/isci_raid_info.h b/lib/engine/isci_raid_info.h
+index 1df6477..b0b046a 100644
+--- a/lib/engine/isci_raid_info.h
++++ b/lib/engine/isci_raid_info.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __ISCI_RAID_INFO_H__INCLUDED__
+ #define __ISCI_RAID_INFO_H__INCLUDED__
+diff --git a/lib/engine/isci_tape.h b/lib/engine/isci_tape.h
+index 985f767..a2cef2d 100644
+--- a/lib/engine/isci_tape.h
++++ b/lib/engine/isci_tape.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __ISCI_TAPE_H__INCLUDED__
+ #define __ISCI_TAPE_H__INCLUDED__
+diff --git a/lib/engine/list.h b/lib/engine/list.h
+index 9a7c3c3..6395830 100644
+--- a/lib/engine/list.h
++++ b/lib/engine/list.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __LIST_H__INCLUDED__
+ #define __LIST_H__INCLUDED__
+diff --git a/lib/engine/mdadm_config.h b/lib/engine/mdadm_config.h
+index c94020f..e415b4f 100644
+--- a/lib/engine/mdadm_config.h
++++ b/lib/engine/mdadm_config.h
+@@ -11,9 +11,7 @@ Redistribution and use in source and binary forms, with or without modification,
+ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __MDADM_CONFIG_H__INCLUDED__
+ #define __MDADM_CONFIG_H__INCLUDED__
+diff --git a/lib/engine/multimedia_device.h b/lib/engine/multimedia_device.h
+index 533370e..694e2a5 100644
+--- a/lib/engine/multimedia_device.h
++++ b/lib/engine/multimedia_device.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __MULTIMEDIA_DEVICE_H__INCLUDED__
+ #define __MULTIMEDIA_DEVICE_H__INCLUDED__
+diff --git a/lib/engine/nondisk_device.h b/lib/engine/nondisk_device.h
+index 70ebb32..0f00e52 100644
+--- a/lib/engine/nondisk_device.h
++++ b/lib/engine/nondisk_device.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __CHARACTER_DEVICE_H__INCLUDED__
+ #define __CHARACTER_DEVICE_H__INCLUDED__
+diff --git a/lib/engine/object.h b/lib/engine/object.h
+index b52d3d3..345d58c 100644
+--- a/lib/engine/object.h
++++ b/lib/engine/object.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __OBJECT_H__INCLUDED__
+ #define __OBJECT_H__INCLUDED__
+diff --git a/lib/engine/pci_header.h b/lib/engine/pci_header.h
+index 376f296..c5129a0 100644
+--- a/lib/engine/pci_header.h
++++ b/lib/engine/pci_header.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __PCI_HEADER_H__INCLUDED__
+ #define __PCI_HEADER_H__INCLUDED__
+diff --git a/lib/engine/phy.h b/lib/engine/phy.h
+index f5730a0..c59f7c8 100644
+--- a/lib/engine/phy.h
++++ b/lib/engine/phy.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __PHY_H__INCLUDED__
+ #define __PHY_H__INCLUDED__
+diff --git a/lib/engine/port.h b/lib/engine/port.h
+index 2f33876..cc48c7c 100644
+--- a/lib/engine/port.h
++++ b/lib/engine/port.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3,4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __PORT_H__INCLUDED__
+ #define __PORT_H__INCLUDED__
+diff --git a/lib/engine/raid_device.h b/lib/engine/raid_device.h
+index 998e80c..2174162 100644
+--- a/lib/engine/raid_device.h
++++ b/lib/engine/raid_device.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __RAID_DEVICE_H__INCLUDED__
+ #define __RAID_DEVICE_H__INCLUDED__
+diff --git a/lib/engine/raid_info.h b/lib/engine/raid_info.h
+index 174698a..302be9b 100644
+--- a/lib/engine/raid_info.h
++++ b/lib/engine/raid_info.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __RAID_INFO_H__INCLUDED__
+ #define __RAID_INFO_H__INCLUDED__
+diff --git a/lib/engine/remote_port.h b/lib/engine/remote_port.h
+index c086656..4ddfee3 100644
+--- a/lib/engine/remote_port.h
++++ b/lib/engine/remote_port.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __REMOTE_PORT_H__INCLUDED__
+ #define __REMOTE_PORT_H__INCLUDED__
+diff --git a/lib/engine/routing_device.h b/lib/engine/routing_device.h
+index 5f857a6..284621e 100644
+--- a/lib/engine/routing_device.h
++++ b/lib/engine/routing_device.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __ROUTING_DEVICE_H__INCLUDED__
+ #define __ROUTING_DEVICE_H__INCLUDED__
+diff --git a/lib/engine/session.h b/lib/engine/session.h
+index a901d1c..3200da1 100644
+--- a/lib/engine/session.h
++++ b/lib/engine/session.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __SESSION_H__INCLUDED__
+ #define __SESSION_H__INCLUDED__
+diff --git a/lib/engine/session_manager.h b/lib/engine/session_manager.h
+index 7177064..87e16c3 100644
+--- a/lib/engine/session_manager.h
++++ b/lib/engine/session_manager.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __SESSION_MANAGER_H__INCLUDED__
+ #define __SESSION_MANAGER_H__INCLUDED__
+diff --git a/lib/engine/storage_device.h b/lib/engine/storage_device.h
+index ddeb66f..20bdab2 100644
+--- a/lib/engine/storage_device.h
++++ b/lib/engine/storage_device.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __STORAGE_DEVICE_H__INCLUDED__
+ #define __STORAGE_DEVICE_H__INCLUDED__
+diff --git a/lib/engine/stream_device.h b/lib/engine/stream_device.h
+index 9bc111a..b29bd68 100644
+--- a/lib/engine/stream_device.h
++++ b/lib/engine/stream_device.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __STREAM_DEVICE_H__INCLUDED__
+ #define __STREAM_DEVICE_H__INCLUDED__
+diff --git a/lib/engine/string.h b/lib/engine/string.h
+index 3007dc7..6f348c9 100644
+--- a/lib/engine/string.h
++++ b/lib/engine/string.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __STRING_H__INCLUDED__
+ #define __STRING_H__INCLUDED__
+diff --git a/lib/engine/unique_id_manager.h b/lib/engine/unique_id_manager.h
+index fe79eac..4a13627 100644
+--- a/lib/engine/unique_id_manager.h
++++ b/lib/engine/unique_id_manager.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __UNIQUE_ID_MANAGER_H__INCLUDED__
+ #define __UNIQUE_ID_MANAGER_H__INCLUDED__
+diff --git a/lib/engine/utils.h b/lib/engine/utils.h
+index 86c20cf..5525303 100644
+--- a/lib/engine/utils.h
++++ b/lib/engine/utils.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __UTILS_H__INCLUDED__
+ #define __UTILS_H__INCLUDED__
+diff --git a/lib/engine/volume.h b/lib/engine/volume.h
+index 9a63cbf..3347b31 100644
+--- a/lib/engine/volume.h
++++ b/lib/engine/volume.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ // Forward declarations
+ class Array;
+diff --git a/lib/log/log.h b/lib/log/log.h
+index c0bd63e..8b5f171 100644
+--- a/lib/log/log.h
++++ b/lib/log/log.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __LOG_H__INCLUDED__
+ #define __LOG_H__INCLUDED__
+diff --git a/lib/mpb/machine_bytes.h b/lib/mpb/machine_bytes.h
+index 7fbb0e9..800b120 100644
+--- a/lib/mpb/machine_bytes.h
++++ b/lib/mpb/machine_bytes.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __ENDIAN_H__INCLUDED__
+ #define __ENDIAN_H__INCLUDED__
+diff --git a/lib/mpb/mpb.h b/lib/mpb/mpb.h
+index 01782af..c42cdfb 100644
+--- a/lib/mpb/mpb.h
++++ b/lib/mpb/mpb.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __MPB_H__INCLUDED__
+ #define __MPB_H__INCLUDED__
+diff --git a/lib/orom/orom.h b/lib/orom/orom.h
+index f76e3ee..e10311d 100644
+--- a/lib/orom/orom.h
++++ b/lib/orom/orom.h
+@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ 
+ 
+ 
+-#if __GNUC_PREREQ(3, 4)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
+ 
+ #ifndef __OROM_H__INCLUDED__
+ #define __OROM_H__INCLUDED__
+-- 
+2.13.1
+
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0002-Convert-macros-into-functions.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0002-Convert-macros-into-functions.patch
new file mode 100644
index 000000000..351301cdc
--- /dev/null
+++ b/meta-oe/recipes-support/ssiapi/ssiapi/0002-Convert-macros-into-functions.patch
@@ -0,0 +1,123 @@
+From 1338ee4e69c465f8f381ec3bfe5058080236edba Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 16 Jun 2017 22:08:35 -0700
+Subject: [PATCH 2/6] Convert macros into functions
+
+This helps in fixing the security format warnings
+add -fno-builtin-log
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/engine/Makefile.am |  3 ++-
+ lib/log/Makefile.am    |  2 ++
+ lib/log/log.h          | 34 +++++++++++++++++++++-------------
+ src/Makefile.am        |  3 ++-
+ 4 files changed, 27 insertions(+), 15 deletions(-)
+
+Index: ssiapi.1.0.1/lib/engine/Makefile.am
+===================================================================
+--- ssiapi.1.0.1.orig/lib/engine/Makefile.am
++++ ssiapi.1.0.1/lib/engine/Makefile.am
+@@ -113,4 +113,5 @@ libengine_la_SOURCES =          \
+ libengine_la_CPPFLAGS =         \
+         -I$(top_srcdir)         \
+         -I$(top_srcdir)/include \
+-        -I$(top_srcdir)/lib
++        -I$(top_srcdir)/lib     \
++        -fno-builtin-log
+Index: ssiapi.1.0.1/lib/log/Makefile.am
+===================================================================
+--- ssiapi.1.0.1.orig/lib/log/Makefile.am
++++ ssiapi.1.0.1/lib/log/Makefile.am
+@@ -5,3 +5,5 @@ noinst_LTLIBRARIES = liblog.la
+ liblog_la_SOURCES =     \
+         log.c           \
+         log.h
++
++liblog_la_CPPFLAGS = -fno-builtin-log
+Index: ssiapi.1.0.1/lib/log/log.h
+===================================================================
+--- ssiapi.1.0.1.orig/lib/log/log.h
++++ ssiapi.1.0.1/lib/log/log.h
+@@ -23,7 +23,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIG
+ #if defined(__cplusplus)
+ extern "C" {
+ #endif /* __cplusplus */
+-
++#include <stdarg.h>
+ /* */
+ enum log_level {
+     LOG_FIRST = 0,
+@@ -37,26 +37,34 @@ enum log_level {
+ };
+ 
+ /* */
+-#define log(__level, __format, ...)                             \
+-    do { if (log_get_level() >= (enum log_level)(__level))      \
+-        __log(__level, __format, ## __VA_ARGS__);               \
+-    } while (0)
+-
+-#define dlog(__format, ...)                             \
+-	log(LOG_DEBUG, __format, ## __VA_ARGS__);
++void __log(enum log_level level, const char *format, ...)
++    __attribute__((format(printf, 2, 3)));
+ 
+ /* */
+-void log_init(enum log_level level, const char *path);
++enum log_level log_get_level(void);
+ 
+ /* */
+-void log_fini(void);
+-
++static inline void log(enum log_level __level, const char* __format, ...) {
++    va_list ap;
++    va_start(ap, __format);
++    do {
++         if (log_get_level() >= (enum log_level)(__level))
++            __log(__level, __format, ap);
++    } while (0);
++    va_end(ap);
++}
++
++static inline void dlog(const char* __format, ...) {
++    va_list ap;
++    va_start(ap, __format);
++	log(LOG_DEBUG, __format, ap);
++    va_end(ap);
++}
+ /* */
+-void __log(enum log_level level, const char *format, ...)
+-    __attribute__((format(printf, 2, 3)));
++void log_init(enum log_level level, const char *path);
+ 
+ /* */
+-enum log_level log_get_level(void);
++void log_fini(void);
+ 
+ /* */
+ void log_set_level(enum log_level level);
+Index: ssiapi.1.0.1/src/Makefile.am
+===================================================================
+--- ssiapi.1.0.1.orig/src/Makefile.am
++++ ssiapi.1.0.1/src/Makefile.am
+@@ -7,7 +7,8 @@ lib_LTLIBRARIES = libssi.la
+ libssi_la_CPPFLAGS =                    \
+         -I$(top_srcdir)                 \
+         -I$(top_srcdir)/include         \
+-        -I$(top_srcdir)/lib
++        -I$(top_srcdir)/lib             \
++        -fno-builtin-log
+ 
+ libssi_la_LDFLAGS =                     \
+         $(SGUTILS_LDFLAGS)              \
+Index: ssiapi.1.0.1/lib/efi/Makefile.am
+===================================================================
+--- ssiapi.1.0.1.orig/lib/efi/Makefile.am
++++ ssiapi.1.0.1/lib/efi/Makefile.am
+@@ -5,3 +5,4 @@ noinst_LTLIBRARIES = libefi.la
+ libefi_la_SOURCES =             \
+     efi.cpp                       \
+     efi.h
++libefi_la_CPPFLAGS = -fno-builtin-log
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0003-Replace-canonicalize_file_name-with-realpath-API.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0003-Replace-canonicalize_file_name-with-realpath-API.patch
new file mode 100644
index 000000000..98cd40c84
--- /dev/null
+++ b/meta-oe/recipes-support/ssiapi/ssiapi/0003-Replace-canonicalize_file_name-with-realpath-API.patch
@@ -0,0 +1,33 @@
+From 781288d6307002cce70ddafb6efb200b7f60294d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 16 Jun 2017 22:12:43 -0700
+Subject: [PATCH 3/6] Replace canonicalize_file_name with realpath() API
+
+Fixed build on musl where canonicalize_file_name is not implemented
+
+filesystem.cpp:46:15: error: 'canonicalize_file_name' was not declared in this scope
+     char *p = canonicalize_file_name(path);
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/engine/filesystem.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/engine/filesystem.cpp b/lib/engine/filesystem.cpp
+index b99257e..6064837 100644
+--- a/lib/engine/filesystem.cpp
++++ b/lib/engine/filesystem.cpp
+@@ -43,7 +43,7 @@ void CanonicalPath::__canonicalize_path_name(const char *path)
+     if (path == 0) {
+         throw E_NULL_POINTER;
+     }
+-    char *p = canonicalize_file_name(path);
++    char *p = realpath(path, NULL);
+     assign(p);
+     if (p) {
+         free(p);
+-- 
+2.13.1
+
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0004-engine-Fix-indentation-and-missing-semi-colon.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0004-engine-Fix-indentation-and-missing-semi-colon.patch
new file mode 100644
index 000000000..7dce0da40
--- /dev/null
+++ b/meta-oe/recipes-support/ssiapi/ssiapi/0004-engine-Fix-indentation-and-missing-semi-colon.patch
@@ -0,0 +1,54 @@
+From 04e8b99d8195a0e39982ecd27802421610633724 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 16 Jun 2017 22:18:31 -0700
+Subject: [PATCH 4/6] engine: Fix indentation and missing semi-colon
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/engine/mdadm_config.cpp      | 5 +++--
+ lib/engine/unique_id_manager.cpp | 2 +-
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/lib/engine/mdadm_config.cpp b/lib/engine/mdadm_config.cpp
+index 1914ddc..e40c2c7 100644
+--- a/lib/engine/mdadm_config.cpp
++++ b/lib/engine/mdadm_config.cpp
+@@ -118,9 +118,10 @@ void check_configuration()
+         attr >> config;
+         configOk = correct_config(config);
+     } catch (Exception ex) {
+-        if (ex != E_NOT_FOUND)
++        if (ex != E_NOT_FOUND) {
+             dlog("Warning: mdadm config file cannot be read, new one will be written");
+             backup = false;
++        }
+     }
+ 
+     if (configOk && monitor_running()) {
+@@ -134,7 +135,7 @@ void check_configuration()
+             dlog("Warning: failed to update mdadm.conf");
+     }
+     if (restart_monitor() == 0)
+-        dlog("Monitor restarted successfully")
++        dlog("Monitor restarted successfully");
+     else
+         dlog("Error starting Monitor");
+ }
+diff --git a/lib/engine/unique_id_manager.cpp b/lib/engine/unique_id_manager.cpp
+index 99c153c..87d6ddc 100644
+--- a/lib/engine/unique_id_manager.cpp
++++ b/lib/engine/unique_id_manager.cpp
+@@ -185,7 +185,7 @@ void UniqueIdManager::refresh()
+         keyFile >> keyList;
+         keyList += "\n";
+     } catch (...) {
+-        dlog("ssi.keys file missing")
++        dlog("ssi.keys file missing");
+         /* no file? that's ok */
+     }
+     /* process the list to update IdCaches */
+-- 
+2.13.1
+
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0005-engine-Define-SENTINEL.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0005-engine-Define-SENTINEL.patch
new file mode 100644
index 000000000..6f4dbf18e
--- /dev/null
+++ b/meta-oe/recipes-support/ssiapi/ssiapi/0005-engine-Define-SENTINEL.patch
@@ -0,0 +1,40 @@
+From a2e3a2e332c406ea3c56a8d74b61978107df68e6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 16 Jun 2017 22:23:08 -0700
+Subject: [PATCH 5/6] engine: Define SENTINEL
+
+Fix warnings with gcc7
+test.cpp:12: warning: missing sentinel in function call
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/engine/utils.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/engine/utils.cpp b/lib/engine/utils.cpp
+index 44579a1..8812a8c 100644
+--- a/lib/engine/utils.cpp
++++ b/lib/engine/utils.cpp
+@@ -35,7 +35,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ #include "filesystem.h"
+ #include "utils.h"
+ #include "log/log.h"
+-
++#define SENTINEL (const char *)0
+ /**
+  * @brief capture shell output as binary data
+  *
+@@ -139,7 +139,7 @@ int shell(const String &s)
+          * Before switching into new executable close all non standard
+          * file handlers.*/
+         close_parent_fds();
+-        execl("/bin/sh", "sh", "-c", cmd.get(), NULL);
++        execl("/bin/sh", "sh", "-c", cmd.get(), SENTINEL);
+         /* If we're here then execl failed*/
+         exit(-1);
+         break;
+-- 
+2.13.1
+
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0006-tools-Add-missing-includes-and-use-realpath-instead-.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0006-tools-Add-missing-includes-and-use-realpath-instead-.patch
new file mode 100644
index 000000000..a7b70e3f4
--- /dev/null
+++ b/meta-oe/recipes-support/ssiapi/ssiapi/0006-tools-Add-missing-includes-and-use-realpath-instead-.patch
@@ -0,0 +1,40 @@
+From df1d56d6b6a6b15d0137619eb8a4b623de6c9633 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 16 Jun 2017 22:28:59 -0700
+Subject: [PATCH 6/6] tools: Add missing includes and use realpath() instead of
+ canonicalize_file_name
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/ssieventmonitor.cpp | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/tools/ssieventmonitor.cpp b/tools/ssieventmonitor.cpp
+index 0553386..f04b8f0 100644
+--- a/tools/ssieventmonitor.cpp
++++ b/tools/ssieventmonitor.cpp
+@@ -18,7 +18,9 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+ #include <unistd.h>
+ #include <dirent.h>
+ #include <errno.h>
+-#include <sys/fcntl.h>
++#include <limits.h>
++#include <fcntl.h>
++#include <libgen.h>
+ #include <sys/select.h>
+ #include <sys/wait.h>
+ #include <sys/inotify.h>
+@@ -99,7 +101,7 @@ static int _exec_ssimsg(void)
+     int status;
+     switch (pid) {
+ 	case 0: {
+-	    cp = canonicalize_file_name("/proc/self/exe");
++	    cp = realpath("/proc/self/exe", NULL);
+ 	    if (cp) {
+ 		strcpy(buffer, cp);
+ 		free(cp);
+-- 
+2.13.1
+
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi_1.0.1.bb b/meta-oe/recipes-support/ssiapi/ssiapi_1.0.1.bb
index 5b951eb26..f3c1fc43a 100644
--- a/meta-oe/recipes-support/ssiapi/ssiapi_1.0.1.bb
+++ b/meta-oe/recipes-support/ssiapi/ssiapi_1.0.1.bb
@@ -10,7 +10,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0413ff365e0bd733c4869a6797551c6f"
 
 DEPENDS += "sg3-utils"
 
-SRC_URI = "http://sourceforge.net/projects/irstessi/files/${BPN}.${PV}.tgz"
+SRC_URI = "http://sourceforge.net/projects/irstessi/files/${BPN}.${PV}.tgz \
+           file://0001-Use-pragma-once-unconditionally.patch \
+           file://0002-Convert-macros-into-functions.patch \
+           file://0003-Replace-canonicalize_file_name-with-realpath-API.patch \
+           file://0004-engine-Fix-indentation-and-missing-semi-colon.patch \
+           file://0005-engine-Define-SENTINEL.patch \
+           file://0006-tools-Add-missing-includes-and-use-realpath-instead-.patch \
+"
 SRC_URI[md5sum] = "02f16d7cbd30d28034093212906591f5"
 SRC_URI[sha256sum] = "e10d283b0f211afb8ebd0bde87c097769613d30a052cdf164753e35e803264c7"
 
-- 
2.13.1


