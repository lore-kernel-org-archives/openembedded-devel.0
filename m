Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8863.1792580489081909419
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=M9wu4td+;
 spf=pass (domain: konsulko.com, ip: 209.85.221.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df4f540ebso330364f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580487; x=1793185287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EcBgFjZik10reC3AryzGyHO4tghdt+/sujJtacUvjuM=;
        b=M9wu4td+TS+uCf7V2b1OrTpWoIwm9AIElbbfVaWz7ltEmRKg1x6YxJ1H7yKp2r4VqW
         mcc7BAUOXEyE66/gAaasTz041eFocCn5b5oJPyfCrpurD0KQ1YeaUvdtXyl2GfUWpM25
         roQrsZbVuzwsDD04HkM6v6NICg5cjQIKJXJr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580487; x=1793185287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EcBgFjZik10reC3AryzGyHO4tghdt+/sujJtacUvjuM=;
        b=hUozNB0n7/IAg2SYccUEBQ/I2F1tJQueRhpKkxXDhrsHiaJKIpBc2omLcD4ERw4Uyk
         1Ch3VouJ1F7jDG+rkRmvJZHJ2OPNQg9bYhEOs2/0coJYWrTqYcwpQmlakEkN+q5D0lay
         /zsegJ5OOF6l7ctgPp1TQs4z8TwZkFM40+7Z6pCS0A8rtCJ/24UoUgyzt+hwC9WsGw2G
         mmLnk2ElzxrlAf2TYG8I9eDCUUNBOt4hW1FV4dOOJCyF0W8f5F/OadGPgjlCPkDn0TMh
         Ze18gZo2r1YEjbr7scGtIYjSabMo4xGEbVeXZaWHizQFnX4mAZfFQ7umrvmj3Yl49Mj0
         AaAg==
X-Gm-Message-State: AFq9FYKaNcoa+j2RzhG5qGZxXMVoEtUgWtcpcqbnUilT/wPJ5jGcXp9e
	/cRP47wf/x2stRpSZgEu8CB4NnZaT9vAiP3ou1Ds/J7Zr7m/lPirUm+J5WA9axKNcVKZN0yFPk+
	Znqz3
X-Gm-Gg: AYBFou3ItOpVDF0rhfozCDAz+KeDxRwlLfyVYeOQbsRSYc8qk8VxZ/+iV0mAIISdJoM
	zXD/O8QK0i6JlPFL/xmoMYJxTZhIN/3xIZ5N4lbjizqXOK1zeBH1nyEmLmYO21kSZpUEVNPsI3u
	ZVaW/uysu9kVYDPk+dm4CPnwfCT4oUjZPrk7h9/4YQruYnGV+3TbGow1Y4NzFX7EMJXPY30IC8u
	erw1RsKhKtbdoJ3w9HOBBwWiOlfWE2+NSJUQjz0uLpB5G5cfhinbDifTY0LSfFPhXX1R0g5qbAm
	PBhnx9vQ43fSbLDCIhcU+XCU+ks8flHpsHSpnVyOofk3M+KLy9lx/yhXCgG6u/+XmtVlvVIDHIH
	OrP0K9DwlMk3TlkXqFya+wZ5ZAohbvW/c5jNwGYRroHYGz7VWJmYb3ch/9XB6krPpWNktUbSDwy
	Qeb5B6geF1eEUw4fGYSmePYKWuEFBTylioqTzuoxribm61/CSiUyfdl9BGvAuLtx0x8VxcJcLn1
	n9anMBODCD32FBk6+TH2OvovaBUQlgbPChkG8snAt7/ToNZm4hA/3ooLRFaQ0HLop7cBqd6O4U2
	oLMG+ZwbCIVYrcCpgs92/AOKaUkt0BSgyTSpHsuvFBrAA1dv+NPiPvKwKfOzFG9dT51ul9h4xIM
	PE08y
X-Received: by 2002:a05:6000:25f2:b0:48e:21f7:79ff with SMTP id ffacd0b85a97d-48e264c450dmr3750453f8f.33.1792580487066;
        Wed, 21 Oct 2026 04:01:27 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:26 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/36] python3-glances: Upgrade 4.5.6 -> 4.5.8
Date: Wed, 21 Oct 2026 14:00:34 +0300
Message-ID: <20261021110103.1943456-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:01:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131269
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.5.8:

Bugs corrected:

- Stdout: CSV data blocks use the first list item's fields instead
  of each item's own #3746
- Stdout: raw selector with a dotted item key
  (network.eth0.100.bytes_recv) raises UnboundLocalError #3748
- Folders: a second configured FolderList appends its entries to
  the first instance #3750
- JSON export: --stop-after leaves an empty file, the last sample
  is lost on shutdown #3752
- DuckDB export turns the string 'False' into TRUE #3754
- InfluxDB export truncates dotted list item identifiers (VLAN
  interfaces lose their tags) #3756
- IP plugin: a non-object public IP response raises AttributeError
  in the main thread #3758
- CSV export: rows are shifted under another device's column when
  the field order changes #3760
- Export: exporters mutate the live plugin statistics when merging
  limits #3766
- Elasticsearch export: a mapping type per plugin is rejected by ES
  6/7/8+, only the first plugin is stored #3780
- Exports: an optional key missing from the config overwrote the
  module default with None #3781
- MQTT export: crash at startup when port or callback_api_version
  is omitted #3777
- Uptime: export the SNMP uptime instead of the local one #3779
- Cloud: do not report a platform whose metadata API returns
  nothing (OpenStack reported on Amazon EC2) #3778
- IRQ: divide the interrupt count by the refresh time (Rate/s was
  multiplied by the refresh time) #3771
- Programs: KeyError when a process stat is listed in [processlist]
  disable_stats #3776
- Containers: WebUI throws on a restarting container whose cpu/mem
  stats are empty #3768
- WebUI: the browser caches glances.js heuristically, revalidate
  the static files #3763
- Processes: io_old keeps one entry per pid ever seen (slow memory
  leak on hosts spawning short-lived processes)
- Smart: a missing smartctl (pySMART >= 1.4) crashes the server at
  startup

Enhancements:

- WebUI: make the container table sortable by status #3763
- Processlist: only build curses rows for the processes that fit on
  screen (performance) #3762

Continuous integration and documentation:

- Mark regression test assertions for Bandit

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-glances_4.5.6.bb => python3-glances_4.5.8.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-glances_4.5.6.bb => python3-glances_4.5.8.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-glances_4.5.6.bb b/meta-python/recipes-devtools/python/python3-glances_4.5.8.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-glances_4.5.6.bb
rename to meta-python/recipes-devtools/python/python3-glances_4.5.8.bb
index 311d38cac3..b6e718e3d5 100644
--- a/meta-python/recipes-devtools/python/python3-glances_4.5.6.bb
+++ b/meta-python/recipes-devtools/python/python3-glances_4.5.8.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://nicolargo.github.io/glances/"
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=852ecadc0ac7e6f4d7144d5544a3815b"
 
-SRC_URI[sha256sum] = "8a26329f0a25e878d53c2558f1eb0615b09acc1dce2ba523cab32dbe175fe8bf"
+SRC_URI[sha256sum] = "a1e5ed5a6488964a576d550a420c91af6f2c7c2d8df8e9fbe67c98eb38bacf3b"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.3

