Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 99EA16B079
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Nov 2018 09:17:44 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id v6so2215307wrr.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Nov 2018 01:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zC/qA3wSYRnm5j1Kc6NaK1jm665YcwOzojyuaqaizRM=;
	b=MARtoDHBkttAoQX05q2ss5qhbMVknPOWntPW9EK8L+GdPe4qLPMFBw0xfEWqYmbaD4
	zt0AZlzAUQ0GyhnDfh5xSBthKcs4X1kY/TACSKQd3AZaAtHjea165367d6PcTS0KwLW9
	dOSxuXO6/k3kYa7U6TxuK4IMUbPtCv9hdVuhYZmU33m3AppUU/ZUrTsEx0443fN0teJK
	Rte8Y83L1nkvnsNv0iSDbURHQkkg6x4T/6I9Sm6dsm/71cqgMOtpQ1anUDV/1+4gXefX
	wsYQggT/LHXFFLTmS8RYEkfsCZIoyzW27b5Kbmlf3jBhQ54hNzBd1KypyV5MurqFd8us
	B0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zC/qA3wSYRnm5j1Kc6NaK1jm665YcwOzojyuaqaizRM=;
	b=llCDXelbo99IuU2feFG3jmx/yNq21wFs5s2txjpAC6bGtMkTj1Soje3Nauiham3ikF
	C4BEE5udYQAEmTp0W8Jz9gnKJefUhopE513EPo/dBfvisA574mrNVGBIeI4ABVeyj3Yi
	gMRZkjDRorZv3xCD6AhGuQVDhYy7O8gYQqhQNTK9lcObditX3pBhjNIqdXN4vt9IQYca
	lclBBtbtuLPXGUbBAq1Sw3A5zWBC8/1PzMmUL2ukQRebnn3fTsVEthdTXTnb/AXffUKD
	wvsMbhFe9tMWGfzYe+VXfQW6ORqSR7iCAPSdawZhvNqVnUCWnUa6Hycttdl8uZJDXqZQ
	GZoA==
X-Gm-Message-State: AGRZ1gKrk1Ssg80Lbwlf1k/WMtQNp21Ha64VnRT7u4ix58jjJcTYD7TA
	t+ASGuHnEU750RYZu2If4LPebIUPhK6h/C0K2r0=
X-Google-Smtp-Source: AJdET5dszHpc7DqLvxdS25r6RkIbfmYMZ93KEppt0EKTnsSwZSVnAyAEr0daNrNabqkjfKwE5abhh4H9+DRwGS8vNcE=
X-Received: by 2002:adf:da41:: with SMTP id
	r1-v6mr8960376wrl.129.1542359865173; 
	Fri, 16 Nov 2018 01:17:45 -0800 (PST)
MIME-Version: 1.0
References: <1542002391-62018-1-git-send-email-changqing.li@windriver.com>
	<896c9962-2e7b-9ede-272e-2d6751ddb491@gmail.com>
	<eb5a64ca-614f-bf81-5e80-6ac9d790ddf6@windriver.com>
In-Reply-To: <eb5a64ca-614f-bf81-5e80-6ac9d790ddf6@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 16 Nov 2018 10:17:34 +0100
Message-ID: <CA+chaQfVj1-0dfffh_D+ZHLrZmhwQrzNR_2JMQjDE3S_LWwdvA@mail.gmail.com>
To: changqing.li@windriver.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] geoip: update GeoLite Database checksum
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
X-List-Received-Date: Fri, 16 Nov 2018 09:17:45 -0000
Content-Type: text/plain; charset="UTF-8"

Can you please add downloadfilename parameter adding some suffix to the
downloaded archive (e.g. the date when the checksums were updated in the
recipe), so that they don't conflict on MIRRORS and PREMIRRORS?

Because changing only the checksum won't cause the archive to be
re-downloaded if it was already fetched before and if there is "old"
archive on some PREMIRROR then it will continue to fetch this one instead
the new one from upstream.

Even with downloadfilename set in the recipe it will require everybody to
delete old archives from all their PREMIRRORs and local downloads
directories, but at least for next time they will use different filename
each time.

On Fri, Nov 16, 2018 at 4:09 AM Changqing Li <changqing.li@windriver.com>
wrote:

>
> On 11/16/18 5:35 AM, akuster808 wrote:
> >
> > On 11/11/18 9:59 PM, changqing.li@windriver.com wrote:
> >> From: Changqing Li <changqing.li@windriver.com>
> >>
> >> GeoLite Database checksum changed again recently, so
> >> update it.
> >>
> >> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> >> ---
> >>   meta-networking/recipes-support/geoip/geoip_1.6.12.bb | 8 ++++----
> >>   1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> >> index 0657369..1e1a7ff 100644
> >> --- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> >> +++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> >> @@ -20,14 +20,14 @@ SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
> >>   SRC_URI[GeoIP-dat.md5sum] = "d538e57ad9268fdc7955c6cf9a37c4a9"
> >>   SRC_URI[GeoIP-dat.sha256sum] =
> "b9c05eb8bfcf90a6ddfdc6815caf40a8db2710f0ce3dd48fbd6c24d485ae0449"
> >>
> >> -SRC_URI[GeoIPv6-dat.md5sum] = "a685e71ab129b6ca4cba75f7eaeb5335"
> >> -SRC_URI[GeoIPv6-dat.sha256sum] =
> "a94398430701c8458fedbd20aa2a5d460858441f2ca495f32621f6d16154171f"
> >> +SRC_URI[GeoIPv6-dat.md5sum] = "00dc3b3f53eb5f7bf6915f939998f12c"
> >> +SRC_URI[GeoIPv6-dat.sha256sum] =
> "e72221fc630094d7256521b307e9142fb77d2167a27de2c11da536a2ba1d1480"
> >>
> >>   SRC_URI[GeoLiteCity-dat.md5sum] = "d700c137232f8e077ac8db8577f699d9"
> >>   SRC_URI[GeoLiteCity-dat.sha256sum] =
> "90db2e52195e3d1bcdb2c2789209006d09de5c742812dbd9a1b36c12675ec4cd"
> >>
> >> -SRC_URI[GeoLiteCityv6-dat.md5sum] = "f6dff70c99f8449af1b7a33073eaa743"
> >> -SRC_URI[GeoLiteCityv6-dat.sha256sum] =
> "8b6f065ed68bed2a03d61b8d6c7e2f1c52ebd00c0d4a00f6cdc04195c03e32e3"
> >> +SRC_URI[GeoLiteCityv6-dat.md5sum] = "7f6333d433d8127181ea3c5828287c98"
> >> +SRC_URI[GeoLiteCityv6-dat.sha256sum] =
> "c339e20cdf326c18aa3571bcd27845e6daf41ca5bfe9401bc472908aaeb42ac7"
> > I am seeing this with stable/thud-nmut ( mainly master)
> >
> > ERROR: geoip-1.6.12-r0 do_fetch: Checksum failure fetching
> >
> http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat
> > ERROR: geoip-1.6.12-r0 do_fetch: Fetcher failure for URL:
> > '
> http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat
> '.
> > Checksum mismatch!
> > File: '/build/downloads/thud/GeoIPv6.dat.gz' has md5 checksum
> > e75b84a4044e81d6d4484e33816bc762 when 00dc3b3f53eb5f7bf6915f939998f12c
> > was expected
> > File: '/build/downloads/thud/GeoIPv6.dat.gz' has sha256 checksum
> > a009b0f21968d2868e6dd19d14f3c3b8cd60ae84a4bfc2970df34d771a04811e when
> > e72221fc630094d7256521b307e9142fb77d2167a27de2c11da536a2ba1d1480 was
> > expected
> > If this change is expected (e.g. you have upgraded to a new version
> > without updating the checksums) then you can use these lines within the
> > recipe:
> > SRC_URI[GeoIPv6-dat.md5sum] = "e75b84a4044e81d6d4484e33816bc762"
> > SRC_URI[GeoIPv6-dat.sha256sum] =
> > "a009b0f21968d2868e6dd19d14f3c3b8cd60ae84a4bfc2970df34d771a04811e"
> > Otherwise you should retry the download and/or check with upstream to
> > determine if the file has become corrupted or otherwise unexpectedly
> > modified.
> >
> > - armin
>
> Hi,
>
> This recipe is special, it use git to download GeoLite databse from
>
> https://dev.maxmind.com/geoip/legacy/geolite/,  but the database is
>
> not versioned,  and the database, eg, GeoIPv6.dat.gz  ,  checksum changes
>
> frequently.  I have change it two times recently. and today, I checked the
>
> checksum changed again,  also different with report checksum above.
>
>
> we need to figure out a solution to reslove this instead change the
> checksum
>
> again and again.   Especially,  the database will be deleted from the
> web from
>
> 2019. 2.
>
>
> >>
> >>   LICENSE = "LGPL-2.1"
> >>
> >
> --
> BRs
>
> Sandy(Li Changqing)
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

