Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41510CED617
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 11:14:30 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9983.1763464467988625402
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 03:14:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TNe8fnwn;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-3e7f68df436so2582586fac.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 03:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763464467; x=1764069267; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jr7aqcOMAkEPx6LqLyUu5Ukf+1Z3CtIBsA+Lzfx/Sj8=;
        b=TNe8fnwnWviP92YGgAdvvO1hdqcrNWv99cnLLy2NJpoHN7J3KElgjCAMlIj0E929BY
         RPdi2Z5edBYHHy4WraNu7uYPl8JSmd5oZjHIhY7IjxVPyDRZUupvXG5ZpKcxOGFdq2hY
         /77yZIcyRKNvPN4yj5I1l4exMwwd8AluxpyBF1R6JH+/LndpxP1XeoJUlXL7BDWm/3YV
         bbVtGXsIBGqO/T7NTAs5QT6IaT9pAVG4cF9DZTee0VGB6Ywep1GvCMcaVhg3bQI09qxx
         bXJI/6WzM9FNqpM0ccTFqMB5b86jYaSTZHSK35XesKsdlLkmRbqUuH1bwB/mK9TIbvJT
         WHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763464467; x=1764069267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jr7aqcOMAkEPx6LqLyUu5Ukf+1Z3CtIBsA+Lzfx/Sj8=;
        b=WksDGVSExLsjap1LZqKNSwpmqZGdUJ8dKCChYzYZIwVbTUkMLCqAP5SfWwSvAx0dhq
         B0v/gyIzcOMNv5oTHQ/FuqmcGvqvSV7bt4rNaQpEGbsvVuFiNiChNxI9ZTKAntpICgEF
         AV8KN5ulVBNdgvBj9+rSBcXXQ+J28Gww9aI4H4DWZ2gnWNUegtikfSgviMf628IIU2su
         OfcCIA7CKYeNc/Ra0hxvLyTTLUmVus5ufTJrQ0TNUa8DeHilZbIh0QaUCjJDJf6HbqY2
         po99n7peJHWxJELwZj3l2Bi9Mc4WvF9MbozxyFe2h6XapOvwbhOdvZiheCqOYe1Sehti
         mT9g==
X-Gm-Message-State: AOJu0YwNzX3Eu9GqxjvVAh7DuUmOT19iuWZ7j4T65u3aMkAB53vdCvsa
	mMu9XxzoC/zoRuSa2TpG+0ZRJ/dPEf9RU/qEEy2NML+YIkcUNJdEmAvKj0pvmlfjwMvHG8KSu7j
	r1kmY239x5aIfPnRvmD1knjyNxkm8Q4g=
X-Gm-Gg: ASbGncsj90jpNBOQcxmpcYy8ImbojMUwdDjrB/x1VFmFFMPDUQyDeN5U00vLnTgl5ao
	rsaCobeELDH9uswlA7kU7flO6JAR2fka5RvZ+PG+i+o4Uu43mt6HyF5aKfwMfEAMIkTfYdMRcZx
	gUj4bM/1STVq6jYDxqcMn24YSHmPIgTsxS+1HWIpiR29P2UIXEpsDeHGLYpnYmLuSfVef4QYq1n
	KDoqTu51RcuKWlOSshGDzzBXFtBBog7Z9jPSxgTnbFFNshvnV3/ZmrqGmkNnG9rg7uolLzKNczq
	0UkzkS2mLvhom7XBeqg=
X-Google-Smtp-Source: AGHT+IGyvbm1qD0VWuF6DHSAxe8XDmOGnGge8O6FeFkKhFSAHx7y/tEXN1OBVERWoTQ6JgB4qWbKQ0QhmimjxwKJh/s=
X-Received: by 2002:a05:6870:b627:b0:3e7:f71d:6c93 with SMTP id
 586e51a60fabf-3ec60d138ddmr1731726fac.12.1763464467176; Tue, 18 Nov 2025
 03:14:27 -0800 (PST)
MIME-Version: 1.0
References: <20251117093847.844119-1-skandigraun@gmail.com>
In-Reply-To: <20251117093847.844119-1-skandigraun@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 19 Nov 2025 00:14:15 +1300
X-Gm-Features: AWmQ_bkZnpEBHAxxjJUxjYG6OozSr7evbMCvfnxdEkIIAOLLsqDVaWa48zaNTFs
Message-ID: <CADySD0HMDbgW2jmg4SosEQhtrHZ86xPGBb36ofVC7Hf9pksHvg@mail.gmail.com>
Subject: Re: [oe] CVE report - scarthgap - 2025-11-17
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 11:14:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121857

Hi Gyorgy,

On Mon, Nov 17, 2025 at 10:38=E2=80=AFPM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> List of all open CVEs (138, out of which new this week: 1):
>
>  - apache2: CVE-2025-3891: https://nvd.nist.gov/vuln/detail/CVE-2025-3891
>  - botan: CVE-2024-39312: https://nvd.nist.gov/vuln/detail/CVE-2024-39312
>  - botan: CVE-2024-50382: https://nvd.nist.gov/vuln/detail/CVE-2024-50382
>  - botan: CVE-2024-50383: https://nvd.nist.gov/vuln/detail/CVE-2024-50383
>  - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-2=
3026
>  - emacs: CVE-2024-53920: https://nvd.nist.gov/vuln/detail/CVE-2024-53920
>  - ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-=
0887
>  - freerdp3: CVE-2025-4478: https://nvd.nist.gov/vuln/detail/CVE-2025-447=
8
>  - [NEW] frr: CVE-2024-44070: https://nvd.nist.gov/vuln/detail/CVE-2024-4=
4070

This CVE was fixed in version 9.1.2
(https://github.com/FRRouting/frr/releases/tag/frr-9.1.2) and current
recipe version is 9.1.3
I believe CPE is incorrect in this case
(https://nvd.nist.gov/vuln/search#/nvd/home?cpeFilterMode=3Dcpe&cpeName=3Dc=
pe:2.3:a:frrouting:frrouting:9.1.3:*:*:*:*:*:*:*&resultType=3Drecords)

If we agree then I'll send a patch for this.

>  - frr: CVE-2025-61099: https://nvd.nist.gov/vuln/detail/CVE-2025-61099
>  - frr: CVE-2025-61100: https://nvd.nist.gov/vuln/detail/CVE-2025-61100
>  - frr: CVE-2025-61101: https://nvd.nist.gov/vuln/detail/CVE-2025-61101
>  - frr: CVE-2025-61102: https://nvd.nist.gov/vuln/detail/CVE-2025-61102
>  - frr: CVE-2025-61103: https://nvd.nist.gov/vuln/detail/CVE-2025-61103
>  - frr: CVE-2025-61104: https://nvd.nist.gov/vuln/detail/CVE-2025-61104
>  - frr: CVE-2025-61105: https://nvd.nist.gov/vuln/detail/CVE-2025-61105
>  - frr: CVE-2025-61106: https://nvd.nist.gov/vuln/detail/CVE-2025-61106
>  - frr: CVE-2025-61107: https://nvd.nist.gov/vuln/detail/CVE-2025-61107
>  - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-4599=
3
>  - gimp: CVE-2007-3741: https://nvd.nist.gov/vuln/detail/CVE-2007-3741
>  - gimp: CVE-2025-5473: https://nvd.nist.gov/vuln/detail/CVE-2025-5473
>  - hdf5: CVE-2025-2912: https://nvd.nist.gov/vuln/detail/CVE-2025-2912
>  - hdf5: CVE-2025-2926: https://nvd.nist.gov/vuln/detail/CVE-2025-2926
>  - hdf5: CVE-2025-6270: https://nvd.nist.gov/vuln/detail/CVE-2025-6270
>  - id3lib: CVE-2007-4460: https://nvd.nist.gov/vuln/detail/CVE-2007-4460
>  - imagemagick: CVE-2023-5341: https://nvd.nist.gov/vuln/detail/CVE-2023-=
5341
>  - imagemagick: CVE-2024-41817: https://nvd.nist.gov/vuln/detail/CVE-2024=
-41817
>  - imagemagick: CVE-2025-53014: https://nvd.nist.gov/vuln/detail/CVE-2025=
-53014
>  - imagemagick: CVE-2025-53015: https://nvd.nist.gov/vuln/detail/CVE-2025=
-53015
>  - imagemagick: CVE-2025-53019: https://nvd.nist.gov/vuln/detail/CVE-2025=
-53019
>  - imagemagick: CVE-2025-53101: https://nvd.nist.gov/vuln/detail/CVE-2025=
-53101
>  - imagemagick: CVE-2025-55004: https://nvd.nist.gov/vuln/detail/CVE-2025=
-55004
>  - imagemagick: CVE-2025-55005: https://nvd.nist.gov/vuln/detail/CVE-2025=
-55005
>  - imagemagick: CVE-2025-55154: https://nvd.nist.gov/vuln/detail/CVE-2025=
-55154
>  - imagemagick: CVE-2025-55160: https://nvd.nist.gov/vuln/detail/CVE-2025=
-55160
>  - imagemagick: CVE-2025-55212: https://nvd.nist.gov/vuln/detail/CVE-2025=
-55212
>  - imagemagick: CVE-2025-55298: https://nvd.nist.gov/vuln/detail/CVE-2025=
-55298
>  - imagemagick: CVE-2025-57803: https://nvd.nist.gov/vuln/detail/CVE-2025=
-57803
>  - imagemagick: CVE-2025-57807: https://nvd.nist.gov/vuln/detail/CVE-2025=
-57807
>  - imagemagick: CVE-2025-62171: https://nvd.nist.gov/vuln/detail/CVE-2025=
-62171
>  - imagemagick: CVE-2025-62594: https://nvd.nist.gov/vuln/detail/CVE-2025=
-62594
>  - iptraf-ng: CVE-2024-52949: https://nvd.nist.gov/vuln/detail/CVE-2024-5=
2949
>  - libao: CVE-2017-11548: https://nvd.nist.gov/vuln/detail/CVE-2017-11548
>  - libavif: CVE-2025-48174: https://nvd.nist.gov/vuln/detail/CVE-2025-481=
74
>  - libcdio: CVE-2024-36600: https://nvd.nist.gov/vuln/detail/CVE-2024-366=
00
>  - libmemcached: CVE-2023-27478: https://nvd.nist.gov/vuln/detail/CVE-202=
3-27478
>  - libtar: CVE-2013-4420: https://nvd.nist.gov/vuln/detail/CVE-2013-4420
>  - libtar: CVE-2021-33643: https://nvd.nist.gov/vuln/detail/CVE-2021-3364=
3
>  - libtar: CVE-2021-33644: https://nvd.nist.gov/vuln/detail/CVE-2021-3364=
4
>  - libtar: CVE-2021-33645: https://nvd.nist.gov/vuln/detail/CVE-2021-3364=
5
>  - libtar: CVE-2021-33646: https://nvd.nist.gov/vuln/detail/CVE-2021-3364=
6
>  - libvpx: CVE-2024-5197: https://nvd.nist.gov/vuln/detail/CVE-2024-5197
>  - libwmf: CVE-2009-1364: https://nvd.nist.gov/vuln/detail/CVE-2009-1364
>  - libwmf: CVE-2015-0848: https://nvd.nist.gov/vuln/detail/CVE-2015-0848
>  - libwmf: CVE-2015-4588: https://nvd.nist.gov/vuln/detail/CVE-2015-4588
>  - libwmf: CVE-2015-4695: https://nvd.nist.gov/vuln/detail/CVE-2015-4695
>  - libwmf: CVE-2015-4696: https://nvd.nist.gov/vuln/detail/CVE-2015-4696
>  - libwmf: CVE-2016-9011: https://nvd.nist.gov/vuln/detail/CVE-2016-9011
>  - links: CVE-2008-3319: https://nvd.nist.gov/vuln/detail/CVE-2008-3319
>  - linuxptp: CVE-2024-42861: https://nvd.nist.gov/vuln/detail/CVE-2024-42=
861
>  - minio: CVE-2018-1000538: https://nvd.nist.gov/vuln/detail/CVE-2018-100=
0538
>  - minio: CVE-2020-11012: https://nvd.nist.gov/vuln/detail/CVE-2020-11012
>  - minio: CVE-2021-21287: https://nvd.nist.gov/vuln/detail/CVE-2021-21287
>  - minio: CVE-2021-21362: https://nvd.nist.gov/vuln/detail/CVE-2021-21362
>  - minio: CVE-2021-21390: https://nvd.nist.gov/vuln/detail/CVE-2021-21390
>  - minio: CVE-2021-43858: https://nvd.nist.gov/vuln/detail/CVE-2021-43858
>  - minio: CVE-2022-35919: https://nvd.nist.gov/vuln/detail/CVE-2022-35919
>  - minio: CVE-2023-28433: https://nvd.nist.gov/vuln/detail/CVE-2023-28433
>  - minio: CVE-2023-28434: https://nvd.nist.gov/vuln/detail/CVE-2023-28434
>  - nbdkit: CVE-2025-47711: https://nvd.nist.gov/vuln/detail/CVE-2025-4771=
1
>  - nbdkit: CVE-2025-47712: https://nvd.nist.gov/vuln/detail/CVE-2025-4771=
2
>  - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-=
1000155
>  - openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39=
327
>  - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39=
328
>  - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39=
329
>  - opusfile: CVE-2022-47021: https://nvd.nist.gov/vuln/detail/CVE-2022-47=
021
>  - p7zip: CVE-2022-47069: https://nvd.nist.gov/vuln/detail/CVE-2022-47069
>  - pidgin: CVE-2022-26491: https://nvd.nist.gov/vuln/detail/CVE-2022-2649=
1
>  - proftpd: CVE-2023-48795: https://nvd.nist.gov/vuln/detail/CVE-2023-487=
95
>  - redis: CVE-2022-0543: https://nvd.nist.gov/vuln/detail/CVE-2022-0543
>  - redis: CVE-2025-27151: https://nvd.nist.gov/vuln/detail/CVE-2025-27151
>  - sassc: CVE-2022-43357: https://nvd.nist.gov/vuln/detail/CVE-2022-43357
>  - smarty: CVE-2020-10375: https://nvd.nist.gov/vuln/detail/CVE-2020-1037=
5
>  - sngrep: CVE-2024-35434: https://nvd.nist.gov/vuln/detail/CVE-2024-3543=
4
>  - spice: CVE-2016-0749: https://nvd.nist.gov/vuln/detail/CVE-2016-0749
>  - spice: CVE-2016-2150: https://nvd.nist.gov/vuln/detail/CVE-2016-2150
>  - spice-gtk: CVE-2012-4425: https://nvd.nist.gov/vuln/detail/CVE-2012-44=
25
>  - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-268=
43
>  - synergy: CVE-2020-15117: https://nvd.nist.gov/vuln/detail/CVE-2020-151=
17
>  - tcpreplay: CVE-2025-9384: https://nvd.nist.gov/vuln/detail/CVE-2025-93=
84
>  - tcpreplay: CVE-2025-9385: https://nvd.nist.gov/vuln/detail/CVE-2025-93=
85
>  - tcpreplay: CVE-2025-9386: https://nvd.nist.gov/vuln/detail/CVE-2025-93=
86
>  - uw-imap: CVE-2018-19518: https://nvd.nist.gov/vuln/detail/CVE-2018-195=
18
>  - webkitgtk3: CVE-2025-6558: https://nvd.nist.gov/vuln/detail/CVE-2025-6=
558
>  - webmin: CVE-2017-15644: https://nvd.nist.gov/vuln/detail/CVE-2017-1564=
4
>  - webmin: CVE-2017-15645: https://nvd.nist.gov/vuln/detail/CVE-2017-1564=
5
>  - webmin: CVE-2017-15646: https://nvd.nist.gov/vuln/detail/CVE-2017-1564=
6
>  - webmin: CVE-2017-17089: https://nvd.nist.gov/vuln/detail/CVE-2017-1708=
9
>  - webmin: CVE-2019-12840: https://nvd.nist.gov/vuln/detail/CVE-2019-1284=
0
>  - webmin: CVE-2019-15107: https://nvd.nist.gov/vuln/detail/CVE-2019-1510=
7
>  - webmin: CVE-2019-15641: https://nvd.nist.gov/vuln/detail/CVE-2019-1564=
1
>  - webmin: CVE-2019-15642: https://nvd.nist.gov/vuln/detail/CVE-2019-1564=
2
>  - webmin: CVE-2020-12670: https://nvd.nist.gov/vuln/detail/CVE-2020-1267=
0
>  - webmin: CVE-2020-35606: https://nvd.nist.gov/vuln/detail/CVE-2020-3560=
6
>  - webmin: CVE-2020-8820: https://nvd.nist.gov/vuln/detail/CVE-2020-8820
>  - webmin: CVE-2020-8821: https://nvd.nist.gov/vuln/detail/CVE-2020-8821
>  - webmin: CVE-2022-0824: https://nvd.nist.gov/vuln/detail/CVE-2022-0824
>  - webmin: CVE-2022-0829: https://nvd.nist.gov/vuln/detail/CVE-2022-0829
>  - webmin: CVE-2022-30708: https://nvd.nist.gov/vuln/detail/CVE-2022-3070=
8
>  - webmin: CVE-2022-36446: https://nvd.nist.gov/vuln/detail/CVE-2022-3644=
6
>  - webmin: CVE-2023-43309: https://nvd.nist.gov/vuln/detail/CVE-2023-4330=
9
>  - webmin: CVE-2023-52046: https://nvd.nist.gov/vuln/detail/CVE-2023-5204=
6
>  - webmin: CVE-2024-36450: https://nvd.nist.gov/vuln/detail/CVE-2024-3645=
0
>  - webmin: CVE-2024-36451: https://nvd.nist.gov/vuln/detail/CVE-2024-3645=
1
>  - webmin: CVE-2024-36452: https://nvd.nist.gov/vuln/detail/CVE-2024-3645=
2
>  - webmin: CVE-2024-36453: https://nvd.nist.gov/vuln/detail/CVE-2024-3645=
3
>  - webmin: CVE-2024-45692: https://nvd.nist.gov/vuln/detail/CVE-2024-4569=
2
>  - weechat: CVE-2024-46613: https://nvd.nist.gov/vuln/detail/CVE-2024-466=
13
>  - yasm: CVE-2021-33454: https://nvd.nist.gov/vuln/detail/CVE-2021-33454
>  - yasm: CVE-2021-33455: https://nvd.nist.gov/vuln/detail/CVE-2021-33455
>  - yasm: CVE-2021-33456: https://nvd.nist.gov/vuln/detail/CVE-2021-33456
>  - yasm: CVE-2021-33457: https://nvd.nist.gov/vuln/detail/CVE-2021-33457
>  - yasm: CVE-2021-33458: https://nvd.nist.gov/vuln/detail/CVE-2021-33458
>  - yasm: CVE-2021-33459: https://nvd.nist.gov/vuln/detail/CVE-2021-33459
>  - yasm: CVE-2021-33460: https://nvd.nist.gov/vuln/detail/CVE-2021-33460
>  - yasm: CVE-2021-33461: https://nvd.nist.gov/vuln/detail/CVE-2021-33461
>  - yasm: CVE-2021-33462: https://nvd.nist.gov/vuln/detail/CVE-2021-33462
>  - yasm: CVE-2021-33463: https://nvd.nist.gov/vuln/detail/CVE-2021-33463
>  - yasm: CVE-2021-33464: https://nvd.nist.gov/vuln/detail/CVE-2021-33464
>  - yasm: CVE-2021-33465: https://nvd.nist.gov/vuln/detail/CVE-2021-33465
>  - yasm: CVE-2021-33466: https://nvd.nist.gov/vuln/detail/CVE-2021-33466
>  - yasm: CVE-2021-33467: https://nvd.nist.gov/vuln/detail/CVE-2021-33467
>  - yasm: CVE-2021-33468: https://nvd.nist.gov/vuln/detail/CVE-2021-33468
>  - yasm: CVE-2023-30402: https://nvd.nist.gov/vuln/detail/CVE-2023-30402
>  - yasm: CVE-2023-31972: https://nvd.nist.gov/vuln/detail/CVE-2023-31972
>  - yasm: CVE-2023-31973: https://nvd.nist.gov/vuln/detail/CVE-2023-31973
>  - yasm: CVE-2023-31974: https://nvd.nist.gov/vuln/detail/CVE-2023-31974
>  - yasm: CVE-2023-51258: https://nvd.nist.gov/vuln/detail/CVE-2023-51258
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Removed this week (18):
>
>  - audiofile: CVE-2018-13440: https://nvd.nist.gov/vuln/detail/CVE-2018-1=
3440
>  - audiofile: CVE-2018-17095: https://nvd.nist.gov/vuln/detail/CVE-2018-1=
7095
>  - audiofile: CVE-2019-13147: https://nvd.nist.gov/vuln/detail/CVE-2019-1=
3147
>  - audiofile: CVE-2020-18781: https://nvd.nist.gov/vuln/detail/CVE-2020-1=
8781
>  - audiofile: CVE-2022-24599: https://nvd.nist.gov/vuln/detail/CVE-2022-2=
4599
>  - hostapd: CVE-2022-37660: https://nvd.nist.gov/vuln/detail/CVE-2022-376=
60
>  - jasper: CVE-2023-51257: https://nvd.nist.gov/vuln/detail/CVE-2023-5125=
7
>  - proftpd: CVE-2001-0027: https://nvd.nist.gov/vuln/detail/CVE-2001-0027
>  - pure-ftpd: CVE-2024-48208: https://nvd.nist.gov/vuln/detail/CVE-2024-4=
8208
>  - redis: CVE-2022-3734: https://nvd.nist.gov/vuln/detail/CVE-2022-3734
>  - redis: CVE-2025-21605: https://nvd.nist.gov/vuln/detail/CVE-2025-21605
>  - redis: CVE-2025-46817: https://nvd.nist.gov/vuln/detail/CVE-2025-46817
>  - redis: CVE-2025-46818: https://nvd.nist.gov/vuln/detail/CVE-2025-46818
>  - redis: CVE-2025-46819: https://nvd.nist.gov/vuln/detail/CVE-2025-46819
>  - rsyslog: CVE-2015-3243: https://nvd.nist.gov/vuln/detail/CVE-2015-3243
>  - rtmpdump: CVE-2015-8270: https://nvd.nist.gov/vuln/detail/CVE-2015-827=
0
>  - rtmpdump: CVE-2015-8271: https://nvd.nist.gov/vuln/detail/CVE-2015-827=
1
>  - rtmpdump: CVE-2015-8272: https://nvd.nist.gov/vuln/detail/CVE-2015-827=
2
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121769): https://lists.openembedded.org/g/openembedde=
d-devel/message/121769
> Mute This Topic: https://lists.openembedded.org/mt/116334907/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

