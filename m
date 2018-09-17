Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 25C497969C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 18:40:10 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id y207-v6so19808013oie.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 11:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=VYoOXwHuYaa+ysD/aeW6bHeDCqqnLlUOBvI6CWlzKww=;
	b=JsvQse7B5oGMk46/m9OZZVxZv/5fbxi+QYnCS4nmxQKYsF33F2HB277duAjQ12MShE
	BfuhUqw6eNR21F0E9dFNsjmrGHihFLM8G2ovVdlHK5nUNXFrwkEUfA3JOl4OtEY8yPx5
	d2Mj4h1j7XqJYelJz24WRsCiAymBlLQfyk0hXrdo/nk3gbHAJcInfu/3qG+BCbG/Z59t
	ZTrcVVG0ysyTzEA4FVNOIikTKYK+JYLBeD4Df4kTxcqPBWWthy94kcomuOQl9sQnc/mo
	JJGnu9RGVVY2cJheRv3ZrIxcpNyicMG/awqROrsmHGAFxu3JgprPx4OHXLk3BOD5BZEA
	MIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=VYoOXwHuYaa+ysD/aeW6bHeDCqqnLlUOBvI6CWlzKww=;
	b=SJbD925pkfp2Bl+9JFBuyRNMe3Vv1zLfI7DZsPypzk/Wd9h8f8zvMqkipwcXDcqXCS
	QB6sUYt+opS+ITr6rW8Fc3HHy5nXOZUS3n553m8hbJfpt8Dr891tyrPALDQRDahXpShR
	4Sjzmzn+B48OzSJYe8FY6yrCA/c54W/5AEWB9Cv+alMst1vpt5p0XPID0CxWmvtxxIyM
	o6+S6ZRlwi/nhXm/rGM57n8b6/gcvfF91MEsRKZBrxsUEsTJu9spLq7VUE9C11BEPsAh
	yVXz1sNqvCCsklInwRd9nQBJgSQcZQfISfPKZZnnWl1CvKliljVlOpjEBPooGDI2YMz5
	WnAA==
X-Gm-Message-State: APzg51Dt0y0QTSxtw9RyrFhbY9ryUMXM/pKWwCeCvssqRmv2sKCY7APV
	UZTuv6GMIVdGwkrphmhNCpE6Xc7Ah+TTJyLdE1s=
X-Google-Smtp-Source: ANB0VdZTSOm8SH5Xs/hSloLDV7HHsMJLYOdLOT4SFxCTFD3fAvvVXNkIloFdYxsxU6mb03JmDueHaNOHnWQcZR4m4sQ=
X-Received: by 2002:aca:c00a:: with SMTP id
	q10-v6mr16991490oif.4.1537209610911; 
	Mon, 17 Sep 2018 11:40:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:490c:0:0:0:0:0 with HTTP; Mon, 17 Sep 2018 11:40:10
	-0700 (PDT)
In-Reply-To: <362229a8-d5aa-e0eb-a1b6-fa3d71ff68c4@windriver.com>
References: <cover.1537199591.git.hongxu.jia@windriver.com>
	<CA+chaQdzPyhGSR=2yr6y6OvC8yKMq80nOX=WWnqdgqZkeN4Pow@mail.gmail.com>
	<362229a8-d5aa-e0eb-a1b6-fa3d71ff68c4@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 17 Sep 2018 20:40:10 +0200
Message-ID: <CALbNGRQNttTSCKZokeJ==i-kyrreQquRK7AE4ezsGY5=DZjLSg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/19] 19 recipes to split one dpg package only
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
X-List-Received-Date: Mon, 17 Sep 2018 18:40:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 17, 2018 at 6:19 PM, Hongxu Jia <hongxu.jia@windriver.com> wrot=
e:
> On 2018=E5=B9=B409=E6=9C=8818=E6=97=A5 00:02, Martin Jansa wrote:
>>
>> Would it make sense to do the same for -dev packages while you're at it?=
 I
>> guess that in most cases it will be used in the same recipes.
>
>
> The reason why focusing on *-dbg packages is
> [reason]
> Since `da5ec06 package: Add auto package splitting
> of .debug files' applied in oe-core, the first dbg
> package will have all debug files automatically.
>
> If there are several sub dbg packages, except the
> first one, the others are empty.
> [reason]
>
> While a sub `empty' dbg package installed, `gdb ***'
> could not finding debug symbol
>
> But dev packages do not have the similar problem.
>
> BTW, RP rethinks to improve debug package dependency
> handling in 2.7, so use one dbg package per recipe to align
> with oe-core could reduce further improvement risk.
>
> //Hongxu
>
>>
>> On Mon, Sep 17, 2018 at 5:55 PM Hongxu Jia <hongxu.jia@windriver.com
>> <mailto:hongxu.jia@windriver.com>> wrote:
>>
>>     Hi Khem,
>>
>>     As RP replied in previously oe-core mailing, one dbg package is
>>     recommended, so I tweak them in oe one by one.
>>
>>     This pull request is one patch per recipe rather than merge them as
>>     a large one, it may add your merging burden, but it is helpful for
>>     reviewing
>>     and rework any of them without resend all.
>>
>>     But if you prefer one patch, I could resend V2.
>>
>>     //Hongxu
>>     The following changes since commit
>>     a06c29be2f5bc204f965ee07298c34232c5c39fc:
>>
>>       klibc: fix build with GCC and -pie for mips, mips64, aarch64
>>     (2018-09-15 07:37:11 -0700)
>>
>>     are available in the git repository at:
>>
>>       git://git.openembedded.org/openembedded-core-contrib
>>     <http://git.openembedded.org/openembedded-core-contrib>
>>     hongxu/dbg-split
>>
>> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Dhongxu/d=
bg-split
>>
>>     Hongxu Jia (19):
>>       fuse: split one dpg package only
>>       libtevent: split one dpg package
>>       libtdb: split one dpg package
>>       libtalloc: split one dpg package
>>       isomd5sum: split one dpg package
>>       gnuplot: split one dpg package
>>       scsirastools: split one dpg package
>>       konkretcmpi: split one dpg package
>>       gpsd: split one dpg package
>>       wvstreams: split one dpg package
>>       fontforge: split one dpg package
>>       xerces-c: split one dpg package
>>       v4l-utils: split one dpg package
>>       lmsensors: split one dpg package
>>       dbench: split one dpg package
>>       postgresql: split one dpg package
>>       mariadb: split one dpg package
>>       pidgin: split one dpg package
>>       syslog-ng: split one dpg package
>>
>>      .../recipes-support/fuse/fuse_2.9.8.bb <http://fuse_2.9.8.bb>
>>            |  8 +--
>>      .../recipes-support/libtalloc/libtalloc_2.1.14.bb
>>     <http://libtalloc_2.1.14.bb> |  6 +-
>>      .../recipes-support/libtdb/libtdb_1.3.16.bb
>>     <http://libtdb_1.3.16.bb>       |  5 +-
>>      .../recipes-support/libtevent/libtevent_0.9.37.bb
>>     <http://libtevent_0.9.37.bb> |  5 +-
>>      meta-oe/recipes-benchmark/dbench/dbench_4.0.bb
>>     <http://dbench_4.0.bb>     |  5 +-
>>      meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb
>>     <http://lmsensors_3.4.0.bb> | 15 ++---
>>      .../recipes-connectivity/wvdial/wvstreams_4.6.1.bb
>>     <http://wvstreams_4.6.1.bb> | 14 ++--
>>      meta-oe/recipes-dbs/mysql/mariadb.inc              |  9 ++-
>>      meta-oe/recipes-dbs/postgresql/postgresql.inc      | 74
>>     ++++++----------------
>>      .../recipes-devtools/xerces-c/xerces-c_3.1.4.bb
>>     <http://xerces-c_3.1.4.bb>   |  8 +--
>>      meta-oe/recipes-extended/gnuplot/gnuplot_5.2.2.bb
>>     <http://gnuplot_5.2.2.bb> |  6 +-
>>      .../recipes-extended/isomd5sum/isomd5sum_1.2.3.bb
>>     <http://isomd5sum_1.2.3.bb> |  5 +-
>>      .../konkretcmpi/konkretcmpi_0.9.2.bb
>>     <http://konkretcmpi_0.9.2.bb>              |  5 +-
>>      .../scsirastools/scsirastools_1.6.6.bb
>>     <http://scsirastools_1.6.6.bb>            |  8 +--
>>      .../fontforge/fontforge_20170731.bb
>>     <http://fontforge_20170731.bb>               |  5 +-
>>      .../v4l2apps/v4l-utils_1.12.3.bb <http://v4l-utils_1.12.3.bb>
>>                  |  5 +-
>>      meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb
>>     <http://gpsd_3.17.bb>      |  6 +-
>>      meta-oe/recipes-support/pidgin/pidgin_2.12.0.bb
>>     <http://pidgin_2.12.0.bb>   |  9 +--
>>      meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |  4 +-
>>      19 files changed, 81 insertions(+), 121 deletions(-)
>>
>>     --     2.7.4
>>
You know that this explodes image size - because dbg package RDEPENDS
on all non debug packages now - or did I miss something.

E.G fontforge: We need all the python-dbg in the iamge now

With this images with dbg-packages turn into non usable.

Haven't got the point what gets better by doing so

Andreas

