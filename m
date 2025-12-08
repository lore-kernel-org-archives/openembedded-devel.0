Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0798D3B7EA
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 16:28:12 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.970.1765211287997699829
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 08:28:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JLG+6p4k;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so43732295e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 08:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765211286; x=1765816086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mAjeazkcVUCEX1UxuojxJ9p+ZBXVx0tFhGzVb4KE4fk=;
        b=JLG+6p4kdw8zXzbchefkr1NvSwuV2hbx69D2NVDdokwTaPw3U0RkBgk1gZbex15Jqh
         Q861yzU8P72aFVcsqOS6/ztHL4f7v0NygYcXPFKAbmstSIWf8kxOlsZ0ymMW3ZcVf44d
         1AjrMf73en5u4LFt17hSKmKrI4c2w3H4rf24xaCDbkA50pfQVPFihkE/t5w5RyhRl0+t
         ai1kxfJKcorx1X+89ZMt1IrmDTnAoJCmnycZADjzRH2MWizl0vsCR8bDAFHtTodH0C/i
         TFMxEvdtENlXU9+FExqbppmr1l94huNAol1VKfYhHudR2ajftkvbNZ3TqzNN8xCy5oXh
         ILhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765211286; x=1765816086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mAjeazkcVUCEX1UxuojxJ9p+ZBXVx0tFhGzVb4KE4fk=;
        b=fsZUR4ZHVrSuYN34rKJqB6Ib8W5cQE5O9cT4J1ovIGBRrLOq1QyJnu8D+vC1rtpvMH
         rF97uErdMzzm0eJhgBwXWq8eoApgAlFWD3w3m+jWzIo5l/aGNtrfAYvlOEP7nSAfuWiP
         Je6OegbeSE7IgCt/0H/e6AlEQf9gEtf9mG+7fSejj/YPKMC33zhZPnu0ImQCVmF+tH3u
         txTjKv5U/tD44UIG3OVdaAa9XnRqVfggns9TTTMHkmQp9KIVwdKY0rvyw63M+MSdwJRw
         BO1PKf0Bmf4PqW04CF6uowzRmEWGvwQ5Gnp12jWbRPQxDoHzQpngaldPqSsnkLgm+NJy
         1OAw==
X-Gm-Message-State: AOJu0YxlY5TDZDfxuy7kIDg0yZDVFHkOD6eNT1CQShOwSjIxP6QG5gVp
	GR9fCDKhx5B3OaC1MDWjAXTs+L/fP3yPoTzPHXxbAha47GqCngGz/6q42GP8dQ==
X-Gm-Gg: ASbGnctIF2zfQsQLhw1ccpARsS+LhKf5tErhS+S9DOI1K4K714ckioxR+gxhGal1cPj
	sD2AvEWpa9niysoy0GbjkEaJsmHhNNmWoTR+I/lOCYCqJTqYbe8dvjowLws9SSkbZ2rf5sub/w1
	rr9C8UKeArkUtnJmgJfhXp/D/DPJbpr/SHC2f7VUZlI7zYaZ2tZC89g6MtE4Iil7FNG/C92djJg
	LqMpqH/1cdEp7jBGD5Obsoff4So5TjAITBEcIVhX0as5hp/2x2N9XeQpt60c6N8wYPGeBLVUBlj
	OUQkYjL+fBR7lgeK2yW7n7w8P8Jiek8XajVLh5Vnh9V1S0aceCGDsYsgS2r77CU/BHg1LV3mXj+
	zByU8NzophlUGwCgTJZnJwiyvikjKAIPaWGwoqvfu5TfaQHehdZ5z3fbwvTeLrdfGlvCSm3EstH
	y54F0J+Hmq8mtMvrDEU6c=
X-Google-Smtp-Source: AGHT+IFs5qRg9OwLn5g8NCn0/WGzkcFU6s81wmU3eVda42vFBUwWt6UNpPTAsgbfXT/uqjibRH5fYA==
X-Received: by 2002:a05:600c:8719:b0:477:7bca:8b3c with SMTP id 5b1f17b1804b1-47939e2828cmr88113745e9.19.1765211286239;
        Mon, 08 Dec 2025 08:28:06 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792b04d4e6sm126483955e9.6.2025.12.08.08.28.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 08:28:05 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - scarthgap - 2025-12-08
Date: Mon,  8 Dec 2025 17:28:03 +0100
Message-ID: <20251208162803.3599547-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 16:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122379

List of all open CVEs (196, out of which new this week: 69):

 - [NEW] accountsservice: CVE-2023-3297: https://nvd.nist.gov/vuln/detail/CVE-2023-3297
 - [NEW] apache2: CVE-2025-55753: https://nvd.nist.gov/vuln/detail/CVE-2025-55753
 - [NEW] apache2: CVE-2025-58098: https://nvd.nist.gov/vuln/detail/CVE-2025-58098
 - [NEW] apache2: CVE-2025-59775: https://nvd.nist.gov/vuln/detail/CVE-2025-59775
 - [NEW] apache2: CVE-2025-65082: https://nvd.nist.gov/vuln/detail/CVE-2025-65082
 - [NEW] apache2: CVE-2025-66200: https://nvd.nist.gov/vuln/detail/CVE-2025-66200
 - [NEW] atop: CVE-2025-31160: https://nvd.nist.gov/vuln/detail/CVE-2025-31160
 - botan: CVE-2024-39312: https://nvd.nist.gov/vuln/detail/CVE-2024-39312
 - [NEW] cifs-utils: CVE-2025-2312: https://nvd.nist.gov/vuln/detail/CVE-2025-2312
 - [NEW] civetweb: CVE-2025-9648: https://nvd.nist.gov/vuln/detail/CVE-2025-9648
 - [NEW] cups-filters: CVE-2025-57812: https://nvd.nist.gov/vuln/detail/CVE-2025-57812
 - [NEW] dante: CVE-2024-54662: https://nvd.nist.gov/vuln/detail/CVE-2024-54662
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - [NEW] dovecot: CVE-2024-23184: https://nvd.nist.gov/vuln/detail/CVE-2024-23184
 - [NEW] dovecot: CVE-2024-23185: https://nvd.nist.gov/vuln/detail/CVE-2024-23185
 - [NEW] editorconfig-core-c: CVE-2024-53849: https://nvd.nist.gov/vuln/detail/CVE-2024-53849
 - emacs: CVE-2024-53920: https://nvd.nist.gov/vuln/detail/CVE-2024-53920
 - [NEW] emacs: CVE-2025-1244: https://nvd.nist.gov/vuln/detail/CVE-2025-1244
 - ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
 - [NEW] fetchmail: CVE-2025-61962: https://nvd.nist.gov/vuln/detail/CVE-2025-61962
 - [NEW] fio: CVE-2025-10824: https://nvd.nist.gov/vuln/detail/CVE-2025-10824
 - [NEW] flatpak: CVE-2024-42472: https://nvd.nist.gov/vuln/detail/CVE-2024-42472
 - frr: CVE-2024-44070: https://nvd.nist.gov/vuln/detail/CVE-2024-44070
 - frr: CVE-2025-61099: https://nvd.nist.gov/vuln/detail/CVE-2025-61099
 - frr: CVE-2025-61100: https://nvd.nist.gov/vuln/detail/CVE-2025-61100
 - frr: CVE-2025-61101: https://nvd.nist.gov/vuln/detail/CVE-2025-61101
 - frr: CVE-2025-61102: https://nvd.nist.gov/vuln/detail/CVE-2025-61102
 - frr: CVE-2025-61103: https://nvd.nist.gov/vuln/detail/CVE-2025-61103
 - frr: CVE-2025-61104: https://nvd.nist.gov/vuln/detail/CVE-2025-61104
 - frr: CVE-2025-61105: https://nvd.nist.gov/vuln/detail/CVE-2025-61105
 - frr: CVE-2025-61106: https://nvd.nist.gov/vuln/detail/CVE-2025-61106
 - frr: CVE-2025-61107: https://nvd.nist.gov/vuln/detail/CVE-2025-61107
 - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
 - gimp: CVE-2007-3741: https://nvd.nist.gov/vuln/detail/CVE-2007-3741
 - [NEW] gimp: CVE-2025-48796: https://nvd.nist.gov/vuln/detail/CVE-2025-48796
 - [NEW] gimp: CVE-2025-48797: https://nvd.nist.gov/vuln/detail/CVE-2025-48797
 - [NEW] gimp: CVE-2025-48798: https://nvd.nist.gov/vuln/detail/CVE-2025-48798
 - gimp: CVE-2025-5473: https://nvd.nist.gov/vuln/detail/CVE-2025-5473
 - [NEW] gnome-shell: CVE-2021-3982: https://nvd.nist.gov/vuln/detail/CVE-2021-3982
 - [NEW] gsoap: CVE-2024-4227: https://nvd.nist.gov/vuln/detail/CVE-2024-4227
 - hdf5: CVE-2025-2912: https://nvd.nist.gov/vuln/detail/CVE-2025-2912
 - [NEW] hplip: CVE-2020-6923: https://nvd.nist.gov/vuln/detail/CVE-2020-6923
 - id3lib: CVE-2007-4460: https://nvd.nist.gov/vuln/detail/CVE-2007-4460
 - imagemagick: CVE-2023-5341: https://nvd.nist.gov/vuln/detail/CVE-2023-5341
 - imagemagick: CVE-2024-41817: https://nvd.nist.gov/vuln/detail/CVE-2024-41817
 - [NEW] imagemagick: CVE-2025-43965: https://nvd.nist.gov/vuln/detail/CVE-2025-43965
 - [NEW] imagemagick: CVE-2025-46393: https://nvd.nist.gov/vuln/detail/CVE-2025-46393
 - imagemagick: CVE-2025-53014: https://nvd.nist.gov/vuln/detail/CVE-2025-53014
 - imagemagick: CVE-2025-53015: https://nvd.nist.gov/vuln/detail/CVE-2025-53015
 - imagemagick: CVE-2025-53019: https://nvd.nist.gov/vuln/detail/CVE-2025-53019
 - imagemagick: CVE-2025-53101: https://nvd.nist.gov/vuln/detail/CVE-2025-53101
 - imagemagick: CVE-2025-55004: https://nvd.nist.gov/vuln/detail/CVE-2025-55004
 - imagemagick: CVE-2025-55005: https://nvd.nist.gov/vuln/detail/CVE-2025-55005
 - imagemagick: CVE-2025-55154: https://nvd.nist.gov/vuln/detail/CVE-2025-55154
 - imagemagick: CVE-2025-55160: https://nvd.nist.gov/vuln/detail/CVE-2025-55160
 - imagemagick: CVE-2025-55212: https://nvd.nist.gov/vuln/detail/CVE-2025-55212
 - imagemagick: CVE-2025-55298: https://nvd.nist.gov/vuln/detail/CVE-2025-55298
 - imagemagick: CVE-2025-57803: https://nvd.nist.gov/vuln/detail/CVE-2025-57803
 - imagemagick: CVE-2025-57807: https://nvd.nist.gov/vuln/detail/CVE-2025-57807
 - imagemagick: CVE-2025-62171: https://nvd.nist.gov/vuln/detail/CVE-2025-62171
 - imagemagick: CVE-2025-62594: https://nvd.nist.gov/vuln/detail/CVE-2025-62594
 - [NEW] jasper: CVE-2024-31744: https://nvd.nist.gov/vuln/detail/CVE-2024-31744
 - [NEW] keepalived: CVE-2024-41184: https://nvd.nist.gov/vuln/detail/CVE-2024-41184
 - [NEW] krb5: CVE-2025-3576: https://nvd.nist.gov/vuln/detail/CVE-2025-3576
 - libao: CVE-2017-11548: https://nvd.nist.gov/vuln/detail/CVE-2017-11548
 - libavif: CVE-2025-48174: https://nvd.nist.gov/vuln/detail/CVE-2025-48174
 - libcdio: CVE-2024-36600: https://nvd.nist.gov/vuln/detail/CVE-2024-36600
 - [NEW] libcoap: CVE-2025-50518: https://nvd.nist.gov/vuln/detail/CVE-2025-50518
 - [NEW] libde265: CVE-2023-43887: https://nvd.nist.gov/vuln/detail/CVE-2023-43887
 - [NEW] libde265: CVE-2023-47471: https://nvd.nist.gov/vuln/detail/CVE-2023-47471
 - [NEW] libde265: CVE-2023-51792: https://nvd.nist.gov/vuln/detail/CVE-2023-51792
 - [NEW] libmad: CVE-2018-7263: https://nvd.nist.gov/vuln/detail/CVE-2018-7263
 - libmemcached: CVE-2023-27478: https://nvd.nist.gov/vuln/detail/CVE-2023-27478
 - libtar: CVE-2013-4420: https://nvd.nist.gov/vuln/detail/CVE-2013-4420
 - libtar: CVE-2021-33643: https://nvd.nist.gov/vuln/detail/CVE-2021-33643
 - libtar: CVE-2021-33644: https://nvd.nist.gov/vuln/detail/CVE-2021-33644
 - libtar: CVE-2021-33645: https://nvd.nist.gov/vuln/detail/CVE-2021-33645
 - libtar: CVE-2021-33646: https://nvd.nist.gov/vuln/detail/CVE-2021-33646
 - libuser: CVE-2012-5644: https://nvd.nist.gov/vuln/detail/CVE-2012-5644
 - libvpx: CVE-2024-5197: https://nvd.nist.gov/vuln/detail/CVE-2024-5197
 - [NEW] libwebsockets: CVE-2025-11679: https://nvd.nist.gov/vuln/detail/CVE-2025-11679
 - [NEW] libwebsockets: CVE-2025-1866: https://nvd.nist.gov/vuln/detail/CVE-2025-1866
 - linuxptp: CVE-2024-42861: https://nvd.nist.gov/vuln/detail/CVE-2024-42861
 - [NEW] live555: CVE-2025-65408: https://nvd.nist.gov/vuln/detail/CVE-2025-65408
 - minio: CVE-2018-1000538: https://nvd.nist.gov/vuln/detail/CVE-2018-1000538
 - minio: CVE-2020-11012: https://nvd.nist.gov/vuln/detail/CVE-2020-11012
 - minio: CVE-2021-21287: https://nvd.nist.gov/vuln/detail/CVE-2021-21287
 - minio: CVE-2021-21362: https://nvd.nist.gov/vuln/detail/CVE-2021-21362
 - minio: CVE-2021-21390: https://nvd.nist.gov/vuln/detail/CVE-2021-21390
 - minio: CVE-2021-43858: https://nvd.nist.gov/vuln/detail/CVE-2021-43858
 - minio: CVE-2022-35919: https://nvd.nist.gov/vuln/detail/CVE-2022-35919
 - minio: CVE-2023-28433: https://nvd.nist.gov/vuln/detail/CVE-2023-28433
 - minio: CVE-2023-28434: https://nvd.nist.gov/vuln/detail/CVE-2023-28434
 - [NEW] mtr: CVE-2025-49809: https://nvd.nist.gov/vuln/detail/CVE-2025-49809
 - [NEW] netdata: CVE-2024-32019: https://nvd.nist.gov/vuln/detail/CVE-2024-32019
 - [NEW] networkmanager: CVE-2024-6501: https://nvd.nist.gov/vuln/detail/CVE-2024-6501
 - [NEW] nodejs: CVE-2025-23165: https://nvd.nist.gov/vuln/detail/CVE-2025-23165
 - [NEW] nodejs: CVE-2025-23166: https://nvd.nist.gov/vuln/detail/CVE-2025-23166
 - [NEW] nodejs: CVE-2025-27210: https://nvd.nist.gov/vuln/detail/CVE-2025-27210
 - [NEW] open62541: CVE-2024-53429: https://nvd.nist.gov/vuln/detail/CVE-2024-53429
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - [NEW] openh264: CVE-2025-27091: https://nvd.nist.gov/vuln/detail/CVE-2025-27091
 - openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - [NEW] openvpn: CVE-2025-13086: https://nvd.nist.gov/vuln/detail/CVE-2025-13086
 - [NEW] openvpn: CVE-2025-13751: https://nvd.nist.gov/vuln/detail/CVE-2025-13751
 - opusfile: CVE-2022-47021: https://nvd.nist.gov/vuln/detail/CVE-2022-47021
 - p7zip: CVE-2022-47069: https://nvd.nist.gov/vuln/detail/CVE-2022-47069
 - pidgin: CVE-2022-26491: https://nvd.nist.gov/vuln/detail/CVE-2022-26491
 - [NEW] polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - [NEW] postgresql: CVE-2025-12818: https://nvd.nist.gov/vuln/detail/CVE-2025-12818
 - proftpd: CVE-2023-48795: https://nvd.nist.gov/vuln/detail/CVE-2023-48795
 - [NEW] python3-django: CVE-2025-13372: https://nvd.nist.gov/vuln/detail/CVE-2025-13372
 - [NEW] python3-django: CVE-2025-64460: https://nvd.nist.gov/vuln/detail/CVE-2025-64460
 - [NEW] samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - [NEW] samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - sassc: CVE-2022-43357: https://nvd.nist.gov/vuln/detail/CVE-2022-43357
 - smarty: CVE-2020-10375: https://nvd.nist.gov/vuln/detail/CVE-2020-10375
 - sngrep: CVE-2024-35434: https://nvd.nist.gov/vuln/detail/CVE-2024-35434
 - spice: CVE-2016-0749: https://nvd.nist.gov/vuln/detail/CVE-2016-0749
 - spice: CVE-2016-2150: https://nvd.nist.gov/vuln/detail/CVE-2016-2150
 - spice-gtk: CVE-2012-4425: https://nvd.nist.gov/vuln/detail/CVE-2012-4425
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - synergy: CVE-2020-15117: https://nvd.nist.gov/vuln/detail/CVE-2020-15117
 - [NEW] tcpreplay: CVE-2025-9157: https://nvd.nist.gov/vuln/detail/CVE-2025-9157
 - tcpreplay: CVE-2025-9384: https://nvd.nist.gov/vuln/detail/CVE-2025-9384
 - tcpreplay: CVE-2025-9385: https://nvd.nist.gov/vuln/detail/CVE-2025-9385
 - tcpreplay: CVE-2025-9386: https://nvd.nist.gov/vuln/detail/CVE-2025-9386
 - tigervnc: CVE-2014-8241: https://nvd.nist.gov/vuln/detail/CVE-2014-8241
 - tigervnc: CVE-2023-6377: https://nvd.nist.gov/vuln/detail/CVE-2023-6377
 - tigervnc: CVE-2023-6478: https://nvd.nist.gov/vuln/detail/CVE-2023-6478
 - tigervnc: CVE-2024-0408: https://nvd.nist.gov/vuln/detail/CVE-2024-0408
 - tigervnc: CVE-2024-0409: https://nvd.nist.gov/vuln/detail/CVE-2024-0409
 - tigervnc: CVE-2025-26594: https://nvd.nist.gov/vuln/detail/CVE-2025-26594
 - tigervnc: CVE-2025-26595: https://nvd.nist.gov/vuln/detail/CVE-2025-26595
 - tigervnc: CVE-2025-26596: https://nvd.nist.gov/vuln/detail/CVE-2025-26596
 - tigervnc: CVE-2025-26597: https://nvd.nist.gov/vuln/detail/CVE-2025-26597
 - tigervnc: CVE-2025-26598: https://nvd.nist.gov/vuln/detail/CVE-2025-26598
 - tigervnc: CVE-2025-26599: https://nvd.nist.gov/vuln/detail/CVE-2025-26599
 - tigervnc: CVE-2025-26600: https://nvd.nist.gov/vuln/detail/CVE-2025-26600
 - tigervnc: CVE-2025-26601: https://nvd.nist.gov/vuln/detail/CVE-2025-26601
 - [NEW] unbound: CVE-2024-43167: https://nvd.nist.gov/vuln/detail/CVE-2024-43167
 - [NEW] unbound: CVE-2024-43168: https://nvd.nist.gov/vuln/detail/CVE-2024-43168
 - [NEW] unbound: CVE-2025-5994: https://nvd.nist.gov/vuln/detail/CVE-2025-5994
 - [NEW] vlc: CVE-2024-46461: https://nvd.nist.gov/vuln/detail/CVE-2024-46461
 - [NEW] vsomeip: CVE-2024-3979: https://nvd.nist.gov/vuln/detail/CVE-2024-3979
 - [NEW] webkitgtk3: CVE-2025-13502: https://nvd.nist.gov/vuln/detail/CVE-2025-13502
 - [NEW] webkitgtk3: CVE-2025-13947: https://nvd.nist.gov/vuln/detail/CVE-2025-13947
 - webkitgtk3: CVE-2025-43342: https://nvd.nist.gov/vuln/detail/CVE-2025-43342
 - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43343
 - webkitgtk3: CVE-2025-6558: https://nvd.nist.gov/vuln/detail/CVE-2025-6558
 - [NEW] webkitgtk3: CVE-2025-66287: https://nvd.nist.gov/vuln/detail/CVE-2025-66287
 - webmin: CVE-2019-12840: https://nvd.nist.gov/vuln/detail/CVE-2019-12840
 - webmin: CVE-2019-15107: https://nvd.nist.gov/vuln/detail/CVE-2019-15107
 - webmin: CVE-2019-15641: https://nvd.nist.gov/vuln/detail/CVE-2019-15641
 - webmin: CVE-2020-12670: https://nvd.nist.gov/vuln/detail/CVE-2020-12670
 - webmin: CVE-2020-35606: https://nvd.nist.gov/vuln/detail/CVE-2020-35606
 - webmin: CVE-2020-8820: https://nvd.nist.gov/vuln/detail/CVE-2020-8820
 - webmin: CVE-2020-8821: https://nvd.nist.gov/vuln/detail/CVE-2020-8821
 - webmin: CVE-2022-30708: https://nvd.nist.gov/vuln/detail/CVE-2022-30708
 - webmin: CVE-2022-36446: https://nvd.nist.gov/vuln/detail/CVE-2022-36446
 - webmin: CVE-2023-43309: https://nvd.nist.gov/vuln/detail/CVE-2023-43309
 - webmin: CVE-2023-52046: https://nvd.nist.gov/vuln/detail/CVE-2023-52046
 - webmin: CVE-2024-36450: https://nvd.nist.gov/vuln/detail/CVE-2024-36450
 - webmin: CVE-2024-36451: https://nvd.nist.gov/vuln/detail/CVE-2024-36451
 - webmin: CVE-2024-36452: https://nvd.nist.gov/vuln/detail/CVE-2024-36452
 - webmin: CVE-2024-36453: https://nvd.nist.gov/vuln/detail/CVE-2024-36453
 - webmin: CVE-2024-45692: https://nvd.nist.gov/vuln/detail/CVE-2024-45692
 - weechat: CVE-2024-46613: https://nvd.nist.gov/vuln/detail/CVE-2024-46613
 - [NEW] wolfssl: CVE-2025-7394: https://nvd.nist.gov/vuln/detail/CVE-2025-7394
 - [NEW] wolfssl: CVE-2025-7395: https://nvd.nist.gov/vuln/detail/CVE-2025-7395
 - xrdp: CVE-2024-39917: https://nvd.nist.gov/vuln/detail/CVE-2024-39917
 - yasm: CVE-2021-33454: https://nvd.nist.gov/vuln/detail/CVE-2021-33454
 - yasm: CVE-2021-33455: https://nvd.nist.gov/vuln/detail/CVE-2021-33455
 - yasm: CVE-2021-33457: https://nvd.nist.gov/vuln/detail/CVE-2021-33457
 - yasm: CVE-2021-33458: https://nvd.nist.gov/vuln/detail/CVE-2021-33458
 - yasm: CVE-2021-33459: https://nvd.nist.gov/vuln/detail/CVE-2021-33459
 - yasm: CVE-2021-33460: https://nvd.nist.gov/vuln/detail/CVE-2021-33460
 - yasm: CVE-2021-33461: https://nvd.nist.gov/vuln/detail/CVE-2021-33461
 - yasm: CVE-2021-33462: https://nvd.nist.gov/vuln/detail/CVE-2021-33462
 - yasm: CVE-2021-33463: https://nvd.nist.gov/vuln/detail/CVE-2021-33463
 - yasm: CVE-2021-33465: https://nvd.nist.gov/vuln/detail/CVE-2021-33465
 - yasm: CVE-2021-33466: https://nvd.nist.gov/vuln/detail/CVE-2021-33466
 - yasm: CVE-2021-33467: https://nvd.nist.gov/vuln/detail/CVE-2021-33467
 - yasm: CVE-2021-33468: https://nvd.nist.gov/vuln/detail/CVE-2021-33468
 - yasm: CVE-2023-30402: https://nvd.nist.gov/vuln/detail/CVE-2023-30402
 - yasm: CVE-2023-31972: https://nvd.nist.gov/vuln/detail/CVE-2023-31972
 - yasm: CVE-2023-31973: https://nvd.nist.gov/vuln/detail/CVE-2023-31973
 - yasm: CVE-2023-31974: https://nvd.nist.gov/vuln/detail/CVE-2023-31974
 - yasm: CVE-2023-51258: https://nvd.nist.gov/vuln/detail/CVE-2023-51258
 - [NEW] zabbix: CVE-2025-27232: https://nvd.nist.gov/vuln/detail/CVE-2025-27232
 - [NEW] zabbix: CVE-2025-27237: https://nvd.nist.gov/vuln/detail/CVE-2025-27237
 - [NEW] zabbix: CVE-2025-49642: https://nvd.nist.gov/vuln/detail/CVE-2025-49642
 - [NEW] zabbix: CVE-2025-49643: https://nvd.nist.gov/vuln/detail/CVE-2025-49643
 - [NEW] znc: CVE-2024-39844: https://nvd.nist.gov/vuln/detail/CVE-2024-39844

====================

Removed this week (13): 

 - hdf5: CVE-2025-6270: https://nvd.nist.gov/vuln/detail/CVE-2025-6270
 - xrdp: CVE-2022-23468: https://nvd.nist.gov/vuln/detail/CVE-2022-23468
 - xrdp: CVE-2022-23477: https://nvd.nist.gov/vuln/detail/CVE-2022-23477
 - xrdp: CVE-2022-23478: https://nvd.nist.gov/vuln/detail/CVE-2022-23478
 - xrdp: CVE-2022-23479: https://nvd.nist.gov/vuln/detail/CVE-2022-23479
 - xrdp: CVE-2022-23480: https://nvd.nist.gov/vuln/detail/CVE-2022-23480
 - xrdp: CVE-2022-23481: https://nvd.nist.gov/vuln/detail/CVE-2022-23481
 - xrdp: CVE-2022-23482: https://nvd.nist.gov/vuln/detail/CVE-2022-23482
 - xrdp: CVE-2022-23483: https://nvd.nist.gov/vuln/detail/CVE-2022-23483
 - xrdp: CVE-2022-23484: https://nvd.nist.gov/vuln/detail/CVE-2022-23484
 - xrdp: CVE-2022-23493: https://nvd.nist.gov/vuln/detail/CVE-2022-23493
 - xrdp: CVE-2023-40184: https://nvd.nist.gov/vuln/detail/CVE-2023-40184
 - xrdp: CVE-2023-42822: https://nvd.nist.gov/vuln/detail/CVE-2023-42822

