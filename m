Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8163DD5B170
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 17:36:19 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.216.1765820171673312956
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Dec 2025 09:36:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D7kPsGM6;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so26774925e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 09:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765820170; x=1766424970; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GYOi796ZOd+2QDzze08plbuVXZmZiKUgtaITwQMOI80=;
        b=D7kPsGM6VFjHsu8HLE0+N8HryTi396kPvKreGAi77KqHM53GKYYTelnoHo2MTk05jp
         PW60lcdMMm8pBU+fpSN9nRrDlBdCM5wHq6aPQxSnkeMlPpj1dRKlF1KEa67fykWdMOy7
         1zwOLSiTAcxEuccIRY2UBw+aMdBve05DUjIRB5IHnBHWVTpJYPmyatjqe5ptw5n+/wOx
         jL0wiGZEvE2MDpSoS/adq4JW9oNnlRiHuirAD1uX7j9shlzn38krakF0qMnCawM4Y2ad
         JADUGImeFH4n1ertW6LEtm0gfvLFYkTIxhQbxiSiavLJCnbBf0YV/9nfNrkhp2EZ+UvE
         E2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765820170; x=1766424970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GYOi796ZOd+2QDzze08plbuVXZmZiKUgtaITwQMOI80=;
        b=iKviWwDGJkgm4S7V8/FpDt+YUERj3J3HQP+3IaWEbKXxVuaLKB10abroc8HI869PiM
         uaK4qcZ06SWr2Zm+9DXxD/gbYggyBpU0SoIcdtKbUVgvAJOUsry5lvqVDS6CFZeXk7Gw
         NbkCNTsc3JMsYuVHEj08fb4D5LunGsa0mISJOzbSz4XElgS18Uu/qov3eRAH5Q3DrMCE
         6rILUY/Kk9DujuKWXTNBR84WFfp0jacpNtqV/5B55gEjSthY035mGwHwsBI5eI566vzk
         v5SAzvQ9OtYQsRh3FKiz5v625yfZIDbhJomz1baiN3bmbj76LcCzzSd2J7Dy8jUfghX6
         xdzA==
X-Forwarded-Encrypted: i=1; AJvYcCWda5M9D1VvhPF5aJje9v6H1T+65GyMg6UJdSDHdvDna5PnL2uKXgz4QHYpvN0arYYobhpmHD/6CIkkCkMsjez0iEg=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwHtsh4iVcQZlMN8o7GwRoojcNCvzk+jBbXq5cP5svV2iuPr0s6
	6dfdrQBTj1fz67gTt7JpnyAwcb46tWGmpUM/gb6ezc34dxgLO/j4ryO2
X-Gm-Gg: AY/fxX67J+TVUccl8txPvyVIxMSujhEKYi49BCd4jQUKBRx6o4bh+4+DeOtkHeMBruW
	BUgj38ZN9T6ok8vSTObgzdCgE0DOJghWXIp8F5cLZ2oOrgTkJzI+hQnud5nen+vqrn79rK3DzL9
	mzHUXYNZVBFz8bC0u0Oj0yQV1h/DUifpb9g004+cea1jBy5iS8inVnUWVzNwx4HzZFlQq3ynl+8
	XpJUbn+4R/yhrWnoIFakY9/2xtaID+bodUmrd+NTcqagtJQ8HqwxKKzOzjR7I4MAGsEpEUnG4xs
	V8DzuQcl0oHcLdMeMHenCbj0N9e8sgNDoNGraSxQJ2qDyx4ZCeDx0QJKEUfq20pGMjxQZcWUouT
	CRZ/RZHY6oYhuF7dZr8+MA2xLzNzcXCXvWQwvksb9KmTePvGJtA08WGhu/fePI3vHs0IVC6CIFp
	ikrjG9mV2y/ZEkv7FV9ZY=
X-Google-Smtp-Source: AGHT+IGIZtraH+amqXnmvGELI5wdX9kgxUS8n/H9W5u76xHtO5W8ddwNQceVDQYVN8o3s2vMw+3zqQ==
X-Received: by 2002:a05:600c:3151:b0:45d:dc85:c009 with SMTP id 5b1f17b1804b1-47a8f8c0a52mr135142405e9.10.1765820169805;
        Mon, 15 Dec 2025 09:36:09 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f775012sm195609895e9.7.2025.12.15.09.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 09:36:09 -0800 (PST)
Message-ID: <e320c507-b272-4649-8e52-d6533f612f7e@gmail.com>
Date: Mon, 15 Dec 2025 18:36:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] CVE report - scarthgap - 2025-12-15
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20251215160506.2697309-1-skandigraun@gmail.com>
 <AS1PR10MB5697BEF5FBCA7CBF47927E90FDADA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <AS1PR10MB5697BEF5FBCA7CBF47927E90FDADA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 17:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122666

On 12/15/25 18:13, Marko, Peter wrote:
> Neither of the libwebsockets CVEs reported below are good.
> AI correctly guessed the component, but version 4.3.3 is not yet vulnerable.

Thank you for looking at it. I have an exclusion list of known-wrong LLM
guesses, that I filter out from the report - going to add these to
Scarthgap and Kirkstone, so they won't appear starting the next time.

> Since NVD does not report a version, updating CVE_STATUS is probably not the correct solution.
> This may be a general problem for AI enrichment.

This is indeed a general limitation unfortunately - and in this case
it's not only that NVD has no CPE info, even the description lacks all
version information. Not sure what could be solution (beside going
through the CVEs, and fixing them manually... or dropping LLM completely
without prior correction). I could indicate maybe in the list which
entry was derived on what way?

> Peter
>
> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org> On Behalf Of Gyorgy Sarvari via lists.openembedded.org
> Sent: Monday, December 15, 2025 17:05
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] CVE report - scarthgap - 2025-12-15
>
> List of all open CVEs (206, out of which new this week: 20):
>
>  - accountsservice: CVE-2023-3297: https://nvd.nist.gov/vuln/detail/CVE-2023-3297
>  - atop: CVE-2025-31160: https://nvd.nist.gov/vuln/detail/CVE-2025-31160
>  - [NEW] botan: CVE-2024-34702: https://nvd.nist.gov/vuln/detail/CVE-2024-34702
>  - botan: CVE-2024-39312: https://nvd.nist.gov/vuln/detail/CVE-2024-39312
>  - cifs-utils: CVE-2025-2312: https://nvd.nist.gov/vuln/detail/CVE-2025-2312
>  - civetweb: CVE-2025-9648: https://nvd.nist.gov/vuln/detail/CVE-2025-9648
>  - cups-filters: CVE-2025-57812: https://nvd.nist.gov/vuln/detail/CVE-2025-57812
>  - [NEW] cups-filters: CVE-2025-64524: https://nvd.nist.gov/vuln/detail/CVE-2025-64524
>  - dante: CVE-2024-54662: https://nvd.nist.gov/vuln/detail/CVE-2024-54662
>  - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
>  - dovecot: CVE-2024-23184: https://nvd.nist.gov/vuln/detail/CVE-2024-23184
>  - dovecot: CVE-2024-23185: https://nvd.nist.gov/vuln/detail/CVE-2024-23185
>  - [NEW] dovecot: CVE-2025-30189: https://nvd.nist.gov/vuln/detail/CVE-2025-30189
>  - editorconfig-core-c: CVE-2024-53849: https://nvd.nist.gov/vuln/detail/CVE-2024-53849
>  - emacs: CVE-2024-53920: https://nvd.nist.gov/vuln/detail/CVE-2024-53920
>  - emacs: CVE-2025-1244: https://nvd.nist.gov/vuln/detail/CVE-2025-1244
>  - ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
>  - fetchmail: CVE-2025-61962: https://nvd.nist.gov/vuln/detail/CVE-2025-61962
>  - fio: CVE-2025-10824: https://nvd.nist.gov/vuln/detail/CVE-2025-10824
>  - flatpak: CVE-2024-42472: https://nvd.nist.gov/vuln/detail/CVE-2024-42472
>  - frr: CVE-2024-44070: https://nvd.nist.gov/vuln/detail/CVE-2024-44070
>  - frr: CVE-2025-61099: https://nvd.nist.gov/vuln/detail/CVE-2025-61099
>  - frr: CVE-2025-61100: https://nvd.nist.gov/vuln/detail/CVE-2025-61100
>  - frr: CVE-2025-61101: https://nvd.nist.gov/vuln/detail/CVE-2025-61101
>  - frr: CVE-2025-61102: https://nvd.nist.gov/vuln/detail/CVE-2025-61102
>  - frr: CVE-2025-61103: https://nvd.nist.gov/vuln/detail/CVE-2025-61103
>  - frr: CVE-2025-61104: https://nvd.nist.gov/vuln/detail/CVE-2025-61104
>  - frr: CVE-2025-61105: https://nvd.nist.gov/vuln/detail/CVE-2025-61105
>  - frr: CVE-2025-61106: https://nvd.nist.gov/vuln/detail/CVE-2025-61106
>  - frr: CVE-2025-61107: https://nvd.nist.gov/vuln/detail/CVE-2025-61107
>  - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
>  - gimp: CVE-2007-3741: https://nvd.nist.gov/vuln/detail/CVE-2007-3741
>  - gimp: CVE-2025-48796: https://nvd.nist.gov/vuln/detail/CVE-2025-48796
>  - gimp: CVE-2025-48797: https://nvd.nist.gov/vuln/detail/CVE-2025-48797
>  - gimp: CVE-2025-48798: https://nvd.nist.gov/vuln/detail/CVE-2025-48798
>  - gimp: CVE-2025-5473: https://nvd.nist.gov/vuln/detail/CVE-2025-5473
>  - gnome-shell: CVE-2021-3982: https://nvd.nist.gov/vuln/detail/CVE-2021-3982
>  - gsoap: CVE-2024-4227: https://nvd.nist.gov/vuln/detail/CVE-2024-4227
>  - hplip: CVE-2020-6923: https://nvd.nist.gov/vuln/detail/CVE-2020-6923
>  - id3lib: CVE-2007-4460: https://nvd.nist.gov/vuln/detail/CVE-2007-4460
>  - imagemagick: CVE-2023-5341: https://nvd.nist.gov/vuln/detail/CVE-2023-5341
>  - imagemagick: CVE-2024-41817: https://nvd.nist.gov/vuln/detail/CVE-2024-41817
>  - imagemagick: CVE-2025-43965: https://nvd.nist.gov/vuln/detail/CVE-2025-43965
>  - imagemagick: CVE-2025-46393: https://nvd.nist.gov/vuln/detail/CVE-2025-46393
>  - imagemagick: CVE-2025-53014: https://nvd.nist.gov/vuln/detail/CVE-2025-53014
>  - imagemagick: CVE-2025-53015: https://nvd.nist.gov/vuln/detail/CVE-2025-53015
>  - imagemagick: CVE-2025-53019: https://nvd.nist.gov/vuln/detail/CVE-2025-53019
>  - imagemagick: CVE-2025-53101: https://nvd.nist.gov/vuln/detail/CVE-2025-53101
>  - imagemagick: CVE-2025-55004: https://nvd.nist.gov/vuln/detail/CVE-2025-55004
>  - imagemagick: CVE-2025-55005: https://nvd.nist.gov/vuln/detail/CVE-2025-55005
>  - imagemagick: CVE-2025-55154: https://nvd.nist.gov/vuln/detail/CVE-2025-55154
>  - imagemagick: CVE-2025-55160: https://nvd.nist.gov/vuln/detail/CVE-2025-55160
>  - imagemagick: CVE-2025-55212: https://nvd.nist.gov/vuln/detail/CVE-2025-55212
>  - imagemagick: CVE-2025-55298: https://nvd.nist.gov/vuln/detail/CVE-2025-55298
>  - imagemagick: CVE-2025-57803: https://nvd.nist.gov/vuln/detail/CVE-2025-57803
>  - imagemagick: CVE-2025-57807: https://nvd.nist.gov/vuln/detail/CVE-2025-57807
>  - imagemagick: CVE-2025-62171: https://nvd.nist.gov/vuln/detail/CVE-2025-62171
>  - imagemagick: CVE-2025-62594: https://nvd.nist.gov/vuln/detail/CVE-2025-62594
>  - [NEW] imagemagick: CVE-2025-65955: https://nvd.nist.gov/vuln/detail/CVE-2025-65955
>  - [NEW] influxdb: CVE-2024-30896: https://nvd.nist.gov/vuln/detail/CVE-2024-30896
>  - keepalived: CVE-2024-41184: https://nvd.nist.gov/vuln/detail/CVE-2024-41184
>  - krb5: CVE-2025-3576: https://nvd.nist.gov/vuln/detail/CVE-2025-3576
>  - libao: CVE-2017-11548: https://nvd.nist.gov/vuln/detail/CVE-2017-11548
>  - libcdio: CVE-2024-36600: https://nvd.nist.gov/vuln/detail/CVE-2024-36600
>  - [NEW] libcoap: CVE-2023-51847: https://nvd.nist.gov/vuln/detail/CVE-2023-51847
>  - [NEW] libcoap: CVE-2024-46304: https://nvd.nist.gov/vuln/detail/CVE-2024-46304
>  - libcoap: CVE-2025-50518: https://nvd.nist.gov/vuln/detail/CVE-2025-50518
>  - [NEW] libcoap: CVE-2025-59391: https://nvd.nist.gov/vuln/detail/CVE-2025-59391
>  - libde265: CVE-2023-43887: https://nvd.nist.gov/vuln/detail/CVE-2023-43887
>  - libde265: CVE-2023-47471: https://nvd.nist.gov/vuln/detail/CVE-2023-47471
>  - libde265: CVE-2023-51792: https://nvd.nist.gov/vuln/detail/CVE-2023-51792
>  - [NEW] libiec61850: CVE-2024-45969: https://nvd.nist.gov/vuln/detail/CVE-2024-45969
>  - libmad: CVE-2018-7263: https://nvd.nist.gov/vuln/detail/CVE-2018-7263
>  - libmemcached: CVE-2023-27478: https://nvd.nist.gov/vuln/detail/CVE-2023-27478
>  - libtar: CVE-2013-4420: https://nvd.nist.gov/vuln/detail/CVE-2013-4420
>  - libtar: CVE-2021-33643: https://nvd.nist.gov/vuln/detail/CVE-2021-33643
>  - libtar: CVE-2021-33644: https://nvd.nist.gov/vuln/detail/CVE-2021-33644
>  - libtar: CVE-2021-33645: https://nvd.nist.gov/vuln/detail/CVE-2021-33645
>  - libtar: CVE-2021-33646: https://nvd.nist.gov/vuln/detail/CVE-2021-33646
>  - libuser: CVE-2012-5644: https://nvd.nist.gov/vuln/detail/CVE-2012-5644
>  - libvpx: CVE-2024-5197: https://nvd.nist.gov/vuln/detail/CVE-2024-5197
>  - libwebsockets: CVE-2025-11679: https://nvd.nist.gov/vuln/detail/CVE-2025-11679
>  - [NEW] libwebsockets: CVE-2025-11680: https://nvd.nist.gov/vuln/detail/CVE-2025-11680
>  - libwebsockets: CVE-2025-1866: https://nvd.nist.gov/vuln/detail/CVE-2025-1866
>  - linuxptp: CVE-2024-42861: https://nvd.nist.gov/vuln/detail/CVE-2024-42861
>  - [NEW] live555: CVE-2025-65405: https://nvd.nist.gov/vuln/detail/CVE-2025-65405
>  - [NEW] live555: CVE-2025-65407: https://nvd.nist.gov/vuln/detail/CVE-2025-65407
>  - live555: CVE-2025-65408: https://nvd.nist.gov/vuln/detail/CVE-2025-65408
>  - minio: CVE-2018-1000538: https://nvd.nist.gov/vuln/detail/CVE-2018-1000538
>  - minio: CVE-2020-11012: https://nvd.nist.gov/vuln/detail/CVE-2020-11012
>  - minio: CVE-2021-21287: https://nvd.nist.gov/vuln/detail/CVE-2021-21287
>  - minio: CVE-2021-21362: https://nvd.nist.gov/vuln/detail/CVE-2021-21362
>  - minio: CVE-2021-21390: https://nvd.nist.gov/vuln/detail/CVE-2021-21390
>  - minio: CVE-2021-43858: https://nvd.nist.gov/vuln/detail/CVE-2021-43858
>  - minio: CVE-2022-35919: https://nvd.nist.gov/vuln/detail/CVE-2022-35919
>  - minio: CVE-2023-28433: https://nvd.nist.gov/vuln/detail/CVE-2023-28433
>  - minio: CVE-2023-28434: https://nvd.nist.gov/vuln/detail/CVE-2023-28434
>  - [NEW] minio: CVE-2024-36107: https://nvd.nist.gov/vuln/detail/CVE-2024-36107
>  - mtr: CVE-2025-49809: https://nvd.nist.gov/vuln/detail/CVE-2025-49809
>  - netdata: CVE-2024-32019: https://nvd.nist.gov/vuln/detail/CVE-2024-32019
>  - networkmanager: CVE-2024-6501: https://nvd.nist.gov/vuln/detail/CVE-2024-6501
>  - [NEW] nodejs: CVE-2024-27982: https://nvd.nist.gov/vuln/detail/CVE-2024-27982
>  - nodejs: CVE-2025-23165: https://nvd.nist.gov/vuln/detail/CVE-2025-23165
>  - nodejs: CVE-2025-23166: https://nvd.nist.gov/vuln/detail/CVE-2025-23166
>  - nodejs: CVE-2025-27210: https://nvd.nist.gov/vuln/detail/CVE-2025-27210
>  - open62541: CVE-2024-53429: https://nvd.nist.gov/vuln/detail/CVE-2024-53429
>  - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
>  - openh264: CVE-2025-27091: https://nvd.nist.gov/vuln/detail/CVE-2025-27091
>  - openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
>  - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
>  - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
>  - openvpn: CVE-2025-13086: https://nvd.nist.gov/vuln/detail/CVE-2025-13086
>  - openvpn: CVE-2025-13751: https://nvd.nist.gov/vuln/detail/CVE-2025-13751
>  - opusfile: CVE-2022-47021: https://nvd.nist.gov/vuln/detail/CVE-2022-47021
>  - p7zip: CVE-2022-47069: https://nvd.nist.gov/vuln/detail/CVE-2022-47069
>  - pidgin: CVE-2022-26491: https://nvd.nist.gov/vuln/detail/CVE-2022-26491
>  - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
>  - [NEW] postgresql: CVE-2025-12817: https://nvd.nist.gov/vuln/detail/CVE-2025-12817
>  - postgresql: CVE-2025-12818: https://nvd.nist.gov/vuln/detail/CVE-2025-12818
>  - [NEW] proftpd: CVE-2024-48651: https://nvd.nist.gov/vuln/detail/CVE-2024-48651
>  - python3-django: CVE-2025-13372: https://nvd.nist.gov/vuln/detail/CVE-2025-13372
>  - python3-django: CVE-2025-64460: https://nvd.nist.gov/vuln/detail/CVE-2025-64460
>  - [NEW] redis: CVE-2025-46686: https://nvd.nist.gov/vuln/detail/CVE-2025-46686
>  - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
>  - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
>  - sassc: CVE-2022-43357: https://nvd.nist.gov/vuln/detail/CVE-2022-43357
>  - sngrep: CVE-2024-35434: https://nvd.nist.gov/vuln/detail/CVE-2024-35434
>  - spice: CVE-2016-0749: https://nvd.nist.gov/vuln/detail/CVE-2016-0749
>  - spice: CVE-2016-2150: https://nvd.nist.gov/vuln/detail/CVE-2016-2150
>  - spice-gtk: CVE-2012-4425: https://nvd.nist.gov/vuln/detail/CVE-2012-4425
>  - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
>  - synergy: CVE-2020-15117: https://nvd.nist.gov/vuln/detail/CVE-2020-15117
>  - tcpreplay: CVE-2025-9157: https://nvd.nist.gov/vuln/detail/CVE-2025-9157
>  - tcpreplay: CVE-2025-9384: https://nvd.nist.gov/vuln/detail/CVE-2025-9384
>  - tcpreplay: CVE-2025-9385: https://nvd.nist.gov/vuln/detail/CVE-2025-9385
>  - tcpreplay: CVE-2025-9386: https://nvd.nist.gov/vuln/detail/CVE-2025-9386
>  - tigervnc: CVE-2014-8241: https://nvd.nist.gov/vuln/detail/CVE-2014-8241
>  - tigervnc: CVE-2023-6377: https://nvd.nist.gov/vuln/detail/CVE-2023-6377
>  - tigervnc: CVE-2023-6478: https://nvd.nist.gov/vuln/detail/CVE-2023-6478
>  - tigervnc: CVE-2024-0408: https://nvd.nist.gov/vuln/detail/CVE-2024-0408
>  - tigervnc: CVE-2024-0409: https://nvd.nist.gov/vuln/detail/CVE-2024-0409
>  - tigervnc: CVE-2025-26594: https://nvd.nist.gov/vuln/detail/CVE-2025-26594
>  - tigervnc: CVE-2025-26595: https://nvd.nist.gov/vuln/detail/CVE-2025-26595
>  - tigervnc: CVE-2025-26596: https://nvd.nist.gov/vuln/detail/CVE-2025-26596
>  - tigervnc: CVE-2025-26597: https://nvd.nist.gov/vuln/detail/CVE-2025-26597
>  - tigervnc: CVE-2025-26598: https://nvd.nist.gov/vuln/detail/CVE-2025-26598
>  - tigervnc: CVE-2025-26599: https://nvd.nist.gov/vuln/detail/CVE-2025-26599
>  - tigervnc: CVE-2025-26600: https://nvd.nist.gov/vuln/detail/CVE-2025-26600
>  - tigervnc: CVE-2025-26601: https://nvd.nist.gov/vuln/detail/CVE-2025-26601
>  - unbound: CVE-2024-43167: https://nvd.nist.gov/vuln/detail/CVE-2024-43167
>  - unbound: CVE-2024-43168: https://nvd.nist.gov/vuln/detail/CVE-2024-43168
>  - unbound: CVE-2025-5994: https://nvd.nist.gov/vuln/detail/CVE-2025-5994
>  - vlc: CVE-2024-46461: https://nvd.nist.gov/vuln/detail/CVE-2024-46461
>  - vsomeip: CVE-2024-3979: https://nvd.nist.gov/vuln/detail/CVE-2024-3979
>  - webkitgtk3: CVE-2025-13502: https://nvd.nist.gov/vuln/detail/CVE-2025-13502
>  - webkitgtk3: CVE-2025-13947: https://nvd.nist.gov/vuln/detail/CVE-2025-13947
>  - webkitgtk3: CVE-2025-43342: https://nvd.nist.gov/vuln/detail/CVE-2025-43342
>  - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43343
>  - webkitgtk3: CVE-2025-6558: https://nvd.nist.gov/vuln/detail/CVE-2025-6558
>  - webkitgtk3: CVE-2025-66287: https://nvd.nist.gov/vuln/detail/CVE-2025-66287
>  - webmin: CVE-2019-12840: https://nvd.nist.gov/vuln/detail/CVE-2019-12840
>  - webmin: CVE-2019-15107: https://nvd.nist.gov/vuln/detail/CVE-2019-15107
>  - webmin: CVE-2019-15641: https://nvd.nist.gov/vuln/detail/CVE-2019-15641
>  - webmin: CVE-2020-12670: https://nvd.nist.gov/vuln/detail/CVE-2020-12670
>  - webmin: CVE-2020-35606: https://nvd.nist.gov/vuln/detail/CVE-2020-35606
>  - webmin: CVE-2020-8820: https://nvd.nist.gov/vuln/detail/CVE-2020-8820
>  - webmin: CVE-2020-8821: https://nvd.nist.gov/vuln/detail/CVE-2020-8821
>  - webmin: CVE-2022-30708: https://nvd.nist.gov/vuln/detail/CVE-2022-30708
>  - webmin: CVE-2022-36446: https://nvd.nist.gov/vuln/detail/CVE-2022-36446
>  - webmin: CVE-2023-43309: https://nvd.nist.gov/vuln/detail/CVE-2023-43309
>  - webmin: CVE-2023-52046: https://nvd.nist.gov/vuln/detail/CVE-2023-52046
>  - webmin: CVE-2024-36450: https://nvd.nist.gov/vuln/detail/CVE-2024-36450
>  - webmin: CVE-2024-36451: https://nvd.nist.gov/vuln/detail/CVE-2024-36451
>  - webmin: CVE-2024-36452: https://nvd.nist.gov/vuln/detail/CVE-2024-36452
>  - webmin: CVE-2024-36453: https://nvd.nist.gov/vuln/detail/CVE-2024-36453
>  - webmin: CVE-2024-45692: https://nvd.nist.gov/vuln/detail/CVE-2024-45692
>  - [NEW] webmin: CVE-2025-67738: https://nvd.nist.gov/vuln/detail/CVE-2025-67738
>  - weechat: CVE-2024-46613: https://nvd.nist.gov/vuln/detail/CVE-2024-46613
>  - [NEW] wolfssl: CVE-2025-13912: https://nvd.nist.gov/vuln/detail/CVE-2025-13912
>  - wolfssl: CVE-2025-7394: https://nvd.nist.gov/vuln/detail/CVE-2025-7394
>  - wolfssl: CVE-2025-7395: https://nvd.nist.gov/vuln/detail/CVE-2025-7395
>  - xrdp: CVE-2024-39917: https://nvd.nist.gov/vuln/detail/CVE-2024-39917
>  - yasm: CVE-2021-33454: https://nvd.nist.gov/vuln/detail/CVE-2021-33454
>  - yasm: CVE-2021-33455: https://nvd.nist.gov/vuln/detail/CVE-2021-33455
>  - yasm: CVE-2021-33457: https://nvd.nist.gov/vuln/detail/CVE-2021-33457
>  - yasm: CVE-2021-33458: https://nvd.nist.gov/vuln/detail/CVE-2021-33458
>  - yasm: CVE-2021-33459: https://nvd.nist.gov/vuln/detail/CVE-2021-33459
>  - yasm: CVE-2021-33460: https://nvd.nist.gov/vuln/detail/CVE-2021-33460
>  - yasm: CVE-2021-33461: https://nvd.nist.gov/vuln/detail/CVE-2021-33461
>  - yasm: CVE-2021-33462: https://nvd.nist.gov/vuln/detail/CVE-2021-33462
>  - yasm: CVE-2021-33463: https://nvd.nist.gov/vuln/detail/CVE-2021-33463
>  - yasm: CVE-2021-33465: https://nvd.nist.gov/vuln/detail/CVE-2021-33465
>  - yasm: CVE-2021-33466: https://nvd.nist.gov/vuln/detail/CVE-2021-33466
>  - yasm: CVE-2021-33467: https://nvd.nist.gov/vuln/detail/CVE-2021-33467
>  - yasm: CVE-2021-33468: https://nvd.nist.gov/vuln/detail/CVE-2021-33468
>  - yasm: CVE-2023-30402: https://nvd.nist.gov/vuln/detail/CVE-2023-30402
>  - yasm: CVE-2023-31972: https://nvd.nist.gov/vuln/detail/CVE-2023-31972
>  - yasm: CVE-2023-31973: https://nvd.nist.gov/vuln/detail/CVE-2023-31973
>  - yasm: CVE-2023-31974: https://nvd.nist.gov/vuln/detail/CVE-2023-31974
>  - yasm: CVE-2023-51258: https://nvd.nist.gov/vuln/detail/CVE-2023-51258
>  - zabbix: CVE-2025-27232: https://nvd.nist.gov/vuln/detail/CVE-2025-27232
>  - [NEW] zabbix: CVE-2025-27234: https://nvd.nist.gov/vuln/detail/CVE-2025-27234
>  - zabbix: CVE-2025-27237: https://nvd.nist.gov/vuln/detail/CVE-2025-27237
>  - zabbix: CVE-2025-49642: https://nvd.nist.gov/vuln/detail/CVE-2025-49642
>  - zabbix: CVE-2025-49643: https://nvd.nist.gov/vuln/detail/CVE-2025-49643
>  - znc: CVE-2024-39844: https://nvd.nist.gov/vuln/detail/CVE-2024-39844
>
> ====================
>
> Removed this week (10): 
>
>  - apache2: CVE-2025-55753: https://nvd.nist.gov/vuln/detail/CVE-2025-55753
>  - apache2: CVE-2025-58098: https://nvd.nist.gov/vuln/detail/CVE-2025-58098
>  - apache2: CVE-2025-59775: https://nvd.nist.gov/vuln/detail/CVE-2025-59775
>  - apache2: CVE-2025-65082: https://nvd.nist.gov/vuln/detail/CVE-2025-65082
>  - apache2: CVE-2025-66200: https://nvd.nist.gov/vuln/detail/CVE-2025-66200
>  - hdf5: CVE-2025-2912: https://nvd.nist.gov/vuln/detail/CVE-2025-2912
>  - jasper: CVE-2024-31744: https://nvd.nist.gov/vuln/detail/CVE-2024-31744
>  - libavif: CVE-2025-48174: https://nvd.nist.gov/vuln/detail/CVE-2025-48174
>  - proftpd: CVE-2023-48795: https://nvd.nist.gov/vuln/detail/CVE-2023-48795
>  - smarty: CVE-2020-10375: https://nvd.nist.gov/vuln/detail/CVE-2020-10375


