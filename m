Return-Path: <andreas.kling@gmail.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id C20E7754CA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Jul 2018 12:24:28 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id b15-v6so12066684qtp.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Jul 2018 05:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nxByuG/rJfVL4MUaNhfnG8xivNC/rm8M/+1FX8TJLr4=;
	b=nnEfS2tT9w4jS5jUynso4BdkW2HboTRir+EqSZiMzhh/lTrA46HCRlIzDNw+4UF4hu
	mDLBKMMU7XfFkhkV6JF+pgWBwkpYMYRdbzwl52JlSNvSkzqynkbdXuQ99agIf618kwGt
	pAkymybfydIq2OLiknIhngStNGVCOv9OyPIEi55oOemn/LJFZXPKYaHa1JtjiaUlkHfo
	aqxnKH9eOrLUbK6pH9xGo/zo6a2/PoJ1QYsv+lLpPwZkpdpbYqHERbdBmuQsb2kBJkal
	0CvumbLGmJBVWjzVbHcfiH0ctPKTNT8+orMjX1HI9K5iuhWtrNzAy06058XhDjdDvb8D
	jRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nxByuG/rJfVL4MUaNhfnG8xivNC/rm8M/+1FX8TJLr4=;
	b=mHGzf7dbV8oZwGqTOGYImrx6q8fMnH9MS5iJ2nSjuHBXytpEZetLFX/OSDDhhRnSLy
	q4+bz3wtrNx2bLbt2U2CJxt60TK/5iHrVZuHjb/fAl3bJVZy2u6CoxYxH2oXMF2ISSod
	NGbfE4jypWMtlj5pmlSeh+wwD51PUCx05cXa+s0h+O81jVb+elX0KZ9o5G75PkxpEsmf
	BKVgTUb+LBzJu4PGqZ0JoNfeKG56DKHFoxt+9liWQpnVDGabXZBxyzhirzH9MgiLv4ZO
	9AHmFQguMpxKMUKMn0a5QgPJY7IyoFlIh4q8JBXTJ65WPwFKujID4bw0A3mji+Jj1a8t
	nieQ==
X-Gm-Message-State: APt69E1N7HRWO4kS3tkk1PnEF7T/rCBd1SCdOALeZGoMJYQ52/n2253o
	MIKMV/HqNfMVO6jsiSLlnO/O+9ewNsVQINXHKu8=
X-Google-Smtp-Source: AAOMgpdX1nCuDAVpx+1CCyaloPc8u13Fb2lT/yoFTs6KyF1Fn5A4JvWJqY/b2c94p8On8800i6Tys380xk3Mjcoa9FE=
X-Received: by 2002:a0c:ab11:: with SMTP id
	h17-v6mr11517639qvb.114.1530966269585; 
	Sat, 07 Jul 2018 05:24:29 -0700 (PDT)
MIME-Version: 1.0
References: <20180706071136.21496-1-andreas.kling@gmail.com>
	<CAMKF1srsrgFSR6Xdz-NW99D3EPfSoc5zVoxi9TiD9_J_b=qhmg@mail.gmail.com>
In-Reply-To: <CAMKF1srsrgFSR6Xdz-NW99D3EPfSoc5zVoxi9TiD9_J_b=qhmg@mail.gmail.com>
From: Andy <andreas.kling@gmail.com>
Date: Sat, 7 Jul 2018 14:24:18 +0200
Message-ID: <CAE-gg=6DUex+2i1mNKiym8rWOWvQ4U1DcK1p=oD8MA3juR6UTQ@mail.gmail.com>
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] wireless-regdb: update 2016.06.10.bb -> 2018.05.31.bb
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
X-List-Received-Date: Sat, 07 Jul 2018 12:24:28 -0000
Content-Type: text/plain; charset="UTF-8"

Hi

Am Fr., 6. Juli 2018 um 23:04 Uhr schrieb Khem Raj <raj.khem@gmail.com>:
>
> Hi Andreas
> On Fri, Jul 6, 2018 at 12:12 AM <andreas.kling@gmail.com> wrote:
> >
> > From: Andy Kling <andreas.kling@peiker-cee.de>
> >
> > regulatory db can now be loaded by kernel as firmware file.
> >
> Can you check if this patch fixes your issue too
>
> https://patchwork.openembedded.org/patch/152350/
>
>
> > Signed-off-by: Andy Kling <andreas.kling@peiker-cee.de>
> > ---
> >  ...ss-regdb_2016.06.10.bb => wireless-regdb_2018.05.31.bb} | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >  rename meta-networking/recipes-connectivity/wireless-regdb/{wireless-regdb_2016.06.10.bb => wireless-regdb_2018.05.31.bb} (64%)
> >
> > diff --git a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2016.06.10.bb b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
> > similarity index 64%
> > rename from meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2016.06.10.bb
> > rename to meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
> > index 64e9401e7..c51439f3a 100644
> > --- a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2016.06.10.bb
> > +++ b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
> > @@ -5,16 +5,19 @@ LICENSE = "ISC"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
> >
> >  SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
> > -SRC_URI[md5sum] = "d282cce92b6e692e8673e2bd97adf33b"
> > -SRC_URI[sha256sum] = "cfedf1c3521b3c8f32602f25ed796e96e687c3441a00e7c050fedf7fd4f1b8b7"
> > +SRC_URI[md5sum] = "0cbbdc21186c76cf58aba01b03f3dc5b"
> > +SRC_URI[sha256sum] = "e1dfbc3b97771373077f430c3c05082fae883145b37db5b2cfd12c56676fbe7b"
> >
> >  inherit bin_package
> >
> >  do_install() {
> >      install -d -m0755 ${D}${libdir}/crda
> >      install -d -m0755 ${D}${sysconfdir}/wireless-regdb/pubkeys
> > +    install -d -m0755 ${D}${base_libdir}/firmware
> >      install -m 0644 regulatory.bin ${D}${libdir}/crda/regulatory.bin
> >      install -m 0644 sforshee.key.pub.pem ${D}${sysconfdir}/wireless-regdb/pubkeys/sforshee.key.pub.pem
> > +    install -m 0644 regulatory.db ${D}${base_libdir}/firmware/regulatory.db
> > +    install -m 0644 regulatory.db.p7s ${D}${base_libdir}/firmware/regulatory.db.p7s
> >  }
> >
> >  RSUGGESTS_${PN} = "crda"
> > --
> > 2.18.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

not allowing to install crda alongside with wireless-regdb-static is a
debatable choice, I thought about the same and went the other way.
Allowing both would not harm, imo. But I get the authors point to
force this build time decision in contrast to other major distros.

In my setup, relying on user space helper, firmware load succeeds
cause of a local patch. I did not find time to submit it yet.

cfg80211: Loading compiled-in X.509 certificates for regulatory database
platform regulatory.0: Direct firmware load for regulatory.db failed
with error -2
platform regulatory.0: Falling back to user helper
...
firmware regulatory.db: firmware: requesting regulatory.db
systemd-udevd[145]: writing '/lib/firmware/regulatory.db' (4144) to
'/sys/devices/platform/regulatory.0/firmware/regulatory.db/data'

without the patch one in the same setup might see:
systemd-udevd[157]: did not find firmware file 'regulatory.db'

But this is not related to this topic. Assuming regulatory.db is
loaded correctly it is used.

# iw reg get
global
country 00: DFS-UNSET
(2402 - 2472 @ 40), (N/A, 20), (N/A)
(2457 - 2482 @ 20), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
(2474 - 2494 @ 20), (N/A, 20), (N/A), NO-OFDM, PASSIVE-SCAN
(5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
(5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW, PASSIVE-SCAN
(5490 - 5730 @ 160), (N/A, 20), (0 ms), DFS, PASSIVE-SCAN
(5735 - 5835 @ 80), (N/A, 20), (N/A), PASSIVE-SCAN
(57240 - 63720 @ 2160), (N/A, 0), (N/A)

# iw reg set DE

# iw reg get
global
country DE: DFS-ETSI
(2400 - 2483 @ 40), (N/A, 20), (N/A)
(5150 - 5250 @ 80), (N/A, 20), (N/A), NO-OUTDOOR, AUTO-BW
(5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
(5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
(5725 - 5875 @ 80), (N/A, 13), (N/A)
(57000 - 66000 @ 2160), (N/A, 40), (N/A)

To mention the counter example, without regulatory.db and without crda
present country/DFS would not change.
I did not test [meta-networking,v5,3/3].

Kind regards

Andy

