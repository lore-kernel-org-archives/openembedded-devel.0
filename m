Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id DF8A6601D4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Mar 2016 23:24:38 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id n190so97928444iof.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Mar 2016 15:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Eior516HGjvFtDEegzaNJXI7fXVPpWkAt4rQ+19XBYs=;
	b=e+jQnJaU9Vn2rjrxYbEoi/6ZiPL1M1zu5OTfJWXE9Fk6nap4TxRrQ/16TSbOSa1FJk
	qSxqGST9DBIrJwAIlu5Qgy0SVtSc92qHxdq9JHRhJRLBCCBgi4khGqzoPEUNx0zyWMEl
	JTQE+oxDZOPad0YUhZDucYk2D+eyvKHj+U5m5Abv2y6ERXP/oE/qInWMoT1dLohC2a+i
	IlN17CuLPHFVITzatP7TA+g1MyM2S2+uF7HaRuUxOxFeb9LVPikAF5UMbeQ1D+2gNVwR
	ya2TkDOhHt/1RIG5k4Lf06eutZ5uEqh1nEnwV3QwEZsmY3ASpD3f8e+THV4Lzhn+8pHm
	+2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Eior516HGjvFtDEegzaNJXI7fXVPpWkAt4rQ+19XBYs=;
	b=iwcDVzPgJy3pFpgxFLt2yvGorpv/EZoEGub/1U/OIdYf5EZoZYgUddoqI7pGsx8/zO
	RbJYSaBEopRI2OkfY6de8+LI1f63pdbCzJ5yRhL/4+MyHEbipi3J9cdhFU9zgrngqcLc
	ZIOEHrwBAzfXzvrm49090RlVD3eXEYLU7itJSZK7tn8dOJx0YC9l9HpLHImcekqXTJfo
	WrX8HHxAP4sOyJWFnzeVSn1UqUSKS5RnWKVfXI0HhX0tXDP3nkcpwnanh9qjl+ieZDB1
	GOERJIF0YwXpN7fSDW2zhpg8THIXCf03NLcAMo/C/9vi4jSnd1d9s6rVkZ/wXvK9VM3w
	Vbjw==
X-Gm-Message-State: AD7BkJLzuuCPNX84mSvHb+hCKQ8f4yQXwDk06ya7CdjPFGyQnm/IbbsJFQ13TAqgEymIOX4JVrrmDAzBJmQQgMfG
X-Received: by 10.107.137.92 with SMTP id l89mr16459217iod.133.1457220278706; 
	Sat, 05 Mar 2016 15:24:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Sat, 5 Mar 2016 15:24:19 -0800 (PST)
In-Reply-To: <7C340AF3BCDD49AB919DB23371FBDEE5@RD3>
References: <AB28D54196164B23BA942EBCF3204741@RD3>
	<20160224141143.GB2892@mbabyjoh-mobl.fi.intel.com>
	<2CD39F82881F465AAD78DBB61BCA369E@RD3>
	<CAJTo0LYMO4C9+rd1NG7mMmn4YfU6vRhuOYni4vvPAugoru=uwA@mail.gmail.com>
	<E744C7D53BB7428AB0FD15C117627D11@RD3>
	<20160226093319.GA4329@ad.chargestorm.se>
	<38408F728A334E9F9A452EFD2448CC8D@RD3>
	<CAJTo0LbAoSeWVikqA4t9vXrbSnoiWwOWwLBLPtGPLwwr7E3w+g@mail.gmail.com>
	<25A507B472054F9B9002D68314A7C388@RD3>
	<CAJTo0LYqPQDVoKdFPP4onF-V+0fJ3fZU5CAk_ao3QdbgN05RRA@mail.gmail.com>
	<7C340AF3BCDD49AB919DB23371FBDEE5@RD3>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 5 Mar 2016 23:24:19 +0000
Message-ID: <CAJTo0LY1qO53qvQAhavkSY=8_4o94fsEPNGYrnJs1tMVQMteTg@mail.gmail.com>
To: winiston@futuraautomation.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Anders Darander <anders@chargestorm.se>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [linux-yocto] [OE-core] How to integrate third party application software to yocto image
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
X-List-Received-Date: Sat, 05 Mar 2016 23:24:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This thread doesn't belong on any of the lists that you were sending it to,
so I'm sending it to oe-devel now.

On 5 March 2016 at 05:49, <winiston@futuraautomation.com> wrote:

> Thanks for your valuable time...As you said, I added =E2=80=9Cmeta-oe=E2=
=80=9D layer in
> =E2=80=9Cbblayers.conf=E2=80=9D . Now that Error got disappeared. Now it =
spits out the
> following error..
>
> winiston@winiston-VirtualBox:~/poky/build$ bitbake qt4e-demo-image
> Loading cache: 100% |##########################| ETA:  00:00:00
> Loaded 2176 entries from dependency cache.
> ERROR: ParseError at
> /home/winiston/poky/meta-oe/recipes-connectivity/networkmanager/
> networkmanager_1.0.10.bb:12: Could not inherit file
> classes/bash-completion.bbclass
>
>

You're using meta-oe from git master but a release of oe-core.  Use the
corresponding release branch of meta-oe (ie jethro).


> | /home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-
> linux-gnueabi/navit/1_0.2.0+svnr5310-r11.3/navit/navit/
> vehicle/gpsd/vehicle_gpsd.c:130:40: error: 'struct gps_data_t' has no
> member named 'ss'
> |                                 if (data->ss[i] > 0)
> |                                         ^
> |
> /home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/navit/navit/vehicle/gpsd/vehicle_gpsd.c:
> In function 'vehicle_gpsd_io':
> |
> /home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/navit/navit/vehicle/gpsd/vehicle_gpsd.c:321:2=
3:
> warning: assignment discards 'const' qualifier from pointer target type
> [-Wdiscarded-qualifiers]
> |                    buf =3D gps_data(priv->gps);
> |                        ^
> | make[5]: *** [vehicle_gpsd.lo] Error 1
> | make[5]: Leaving directory
> `/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/vehicle/gpsd'
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_compile (log file is located at
> /home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/temp/log.do_compile.3665)
> ERROR: Task 268 (/home/winiston/poky/meta-oe/recipes-navigation/navit/
> navit_svn.bb, do_compile) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 3468 tasks of which 3467 didn't need to be
> rerun and 1 failed.
> No currently running tasks (3467 of 3645)
>
> Summary: 1 task failed:
>   /home/winiston/poky/meta-oe/recipes-navigation/navit/navit_svn.bb,
> do_compile
> Summary: There were 2 ERROR messages shown, returning a non-zero exit cod=
e.
> winiston@winiston-VirtualBox:~/poky/build$
>
> *I can not justify what is the error? Does =E2=80=9Cnetworkmanager_1.0.10=
.bb
> <http://networkmanager_1.0.10.bb>=E2=80=9D require for building =E2=80=9C=
Navit=E2=80=9D ?*
> *I would be very thankful, if you resolve the above problem.*
>

Looks like gpsd has changed its API and nobody updated navit.  It's quite
likely that downgrading gpsd by moving from meta-oe master to a release
branch will fix this.

Ross

