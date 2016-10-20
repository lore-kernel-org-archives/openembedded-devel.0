Return-Path: <joelguittet@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id EE8EA71A7F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2016 21:49:35 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id n189so121155925qke.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2016 14:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=zheIlu3sY9jg7iPL+18Qgi/65Zaic+YF+WKZao+2WYo=;
	b=iVEWZmMFbF7YyYHitACRrc1WZhax8xHS3b69vYDMgGsi/AUX3C1Wm27PWZx3D5VkxK
	XklFaiJ2/7cmC59aObYNWBoDVnG1TFTVebABiFWXqPfGe53wq6l34KwPshliajMEqMz6
	jq1ZAmxfRHJJtBFOyW1KHhk9Hh2ynNwW9sTbv9fufcHCIkublmNqA+je7cRjOSlDN+pP
	zdID3VzVWeen/Fafnx6O+uNMTESHXr9ZX8lyC4VSQlWbn98fsT+FME9gxxwPQWiymK0S
	3pHdaIjPXLdiuMrk2EM7JqYRQ572eq3RBTPV2ytQyNDxkneobnU+7JWPDvc8ZzEnVLCB
	UBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=zheIlu3sY9jg7iPL+18Qgi/65Zaic+YF+WKZao+2WYo=;
	b=mKdTxKFDVYM6aJcg6ou/9jqqarsoWGd8xkZlqgxL3deKGBrzRVUdvmEuQACejygblH
	R2/XFJqOryahb2vA8c42q3+H4cvmQM2mGQ7ZwsKwM9oyXe4z50/aKiy1tsbiaW1zSwRH
	8dWIV6cKd4A7a6ic804k4ADkfeMoWVSAPOG+T6MUi+llBpeBXpa6Nk4e0oCHV834F2Z1
	ver7p1Z2JWQ8DdBEj353qZFuGvbyjnE208Od1q1vC3Gfk2N8pw3Y8WEihl6D4JZ/FEZQ
	rwi+V/f7exHP4RTpwI0z4C68tFj3G7ixatPY+H52TssYMBNrC5Kl1y5jR4jnUekxhjpe
	6LoQ==
X-Gm-Message-State: AA6/9RnUUy7VGMISok6T2AB1YEKCv5Z2+RMA2o/6PsXNbxBEXC6nsXpNl41CE+7AYGbAsxz7lQ9eLy1koxfvRA==
X-Received: by 10.194.24.163 with SMTP id v3mr1541877wjf.180.1477000176815;
	Thu, 20 Oct 2016 14:49:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.171.94 with HTTP; Thu, 20 Oct 2016 14:49:36 -0700 (PDT)
In-Reply-To: <20161020083012.GA30415@mbabyjoh-desk.ger.corp.intel.com>
References: <CAOwy=PPr-9vu=kJTSR8qJk6_31jjP1FrUO3XvO_JrSDb2-n-fQ@mail.gmail.com>
	<20161020083012.GA30415@mbabyjoh-desk.ger.corp.intel.com>
From: =?UTF-8?Q?Jo=C3=ABl_Guittet?= <joelguittet@gmail.com>
Date: Thu, 20 Oct 2016 23:49:36 +0200
Message-ID: <CAOwy=POestVnv=tRa0eR6hFHEZTa1eP1CGSV2B+2EGFQA0gpaQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-java] fails to fetch icedtea
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
X-List-Received-Date: Thu, 20 Oct 2016 21:49:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

The fix also works here, thanks!

Joel

2016-10-20 10:30 GMT+02:00 Maxin B. John <maxin.john@intel.com>:

> Hi Joel,
>
> On Thu, Oct 20, 2016 at 08:36:06AM +0200, Jo=C3=ABl Guittet wrote:
> > Hi,
> >
> > I'm building an image with OpenJDK, but fetching icedtea fails. It was
> > correctly done few weeks ago. Log indicates error on checksum, but I ha=
ve
> > reviewed changes on meta-java and I do not understand why. Anybody with
> the
> > same issue?
> >
>
> Apparently, there were some updates in the upstream servers and it
> resulted in
> change in checksums (pretty bad)
>
> Richard Leitner sent a fix for that yesterday and it is in master-next no=
w:
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/
> commit/?h=3Dmaster-next&id=3D8b028a5e67c8081a4ecd65d33fe52fed46416a1a
>
> > Log:
> >
> > WARNING: Checksum failure encountered with download of
> > http://icedtea.classpath.org/hg/release/icedtea7-forest-2.
> 1/archive/f89009ada191.tar.bz2;name=3Dopenjdk;unpack=3Dfalse
> > - will attempt other sources if available
> > WARNING: Renaming /home/kubuntu/yocto/build/
> downloads/f89009ada191.tar.bz2
> > to
> > /home/kubuntu/yocto/build/downloads/f89009ada191.tar.bz2_bad-checksum_
> 2bc941373ca4b033c9a25f972eec7858
> > ERROR: Fetcher failure for URL: '
> > http://icedtea.classpath.org/hg/release/icedtea7-forest-2.
> 1/archive/f89009ada191.tar.bz2;name=3Dopenjdk;unpack=3Dfalse'.
> > Checksum mismatch!
> > File: '/home/kubuntu/yocto/build/downloads/f89009ada191.tar.bz2' has md=
5
> > checksum 2bc941373ca4b033c9a25f972eec7858 when
> > c26bbb33addfaeb14d28a1329b4b5a3e was expected
> > File: '/home/kubuntu/yocto/build/downloads/f89009ada191.tar.bz2' has
> sha256
> > checksum 5efd8e66f18fcbf45527bcc74aa3e6ed11f66bc793c88e3841925c4acb48
> 27ba
> > when 54a0ef02b56b265b4122324e08a33c42ececbf2a300ada260611e7b6ccdba96d
> was
> > expected
> > If this change is expected (e.g. you have upgraded to a new version
> without
> > updating the checksums) then you can use these lines within the recipe:
> > SRC_URI[openjdk.md5sum] =3D "2bc941373ca4b033c9a25f972eec7858"
> > SRC_URI[openjdk.sha256sum] =3D
> > "5efd8e66f18fcbf45527bcc74aa3e6ed11f66bc793c88e3841925c4acb4827ba"
> > Otherwise you should retry the download and/or check with upstream to
> > determine if the file has become corrupted or otherwise unexpectedly
> > modified.
> >
> > ERROR: Function failed: Fetcher failure for URL: '
> > http://icedtea.classpath.org/hg/release/icedtea7-forest-2.
> 1/archive/f89009ada191.tar.bz2;name=3Dopenjdk;unpack=3Dfalse'.
> > Unable to fetch URL from any source.
> > ERROR: Logfile of failure stored in:
> > /home/kubuntu/yocto/build/tmp/work/x86_64-linux/icedtea7-
> native/2.1.3-r1.0/temp/log.do_fetch.10452
> > ERROR: Task 1258
> > (/home/kubuntu/yocto/build/../meta-java/recipes-core/icedtea/
> > icedtea7-native_2.1.3.bb, do_fetch) failed with exit code '1'
> >
> > Regards,
> > Joel
> > --
>
> Best Regards,
> Maxin
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

