Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 by mx.groups.io with SMTP id smtpd.web10.192006.1598261913388410518
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 02:38:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=hWpuiIvD;
 spf=pass (domain: skidata.com, ip: 91.230.2.91, mailfrom: prvs=498d700d9=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1598261913; x=1629797913;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=st71YoHRQkEnr/yNK5CrDssuPwfFY9A4jvqrQTLIzEs=;
  b=hWpuiIvDKz23ogVwuM1AEogePsdtYLdu0ofKtyE00zsEy13zD/qb0TW9
   X5pSSt6i/wVndWK59r/LcUjy7WMywnN2Q3+hmmlxIL4Ot7CgvU0TXyMrO
   FWlHMupFovyYtwYSUL+4XuEDXIc0JO2T22yWxIOl6zaI98ANXY1XQMYW8
   7ACI56ay3lppHGs0q85SC2Bjbv769taOzBTcJbTVgEq6ipb++V2KgaSYZ
   ZgToJcKBlEK3Sro6Ie+udfgsfMW/Mkwtb+7A8Tf0Emz42iO8Eg3iRIl9c
   Lyqsxe7O4w/FVgwQbtgO0WQ/hYWZqvGchN8Q7OazMZZAsWuYSCWcdUuVU
   A==;
IronPort-SDR: TWDpCKhiC7V8z+8nWTxVIqnlcPHdPU9J5+tlNaHK6SxOxUeQeI7xJKQ3mKET2beprIbA8gpDYE
 R3b6SyOZ1PoU+vxrqvEQxPGJdRWkExR68gLlpSxpbqGXJCPVazW5y9IUoxGzDQirrvD9yOTOtJ
 kAwegm9D1nQS/L7a5DMxyh9tiCJlRf8SBFsyGTN4CaKMj2L7qJFbw4LuW9NV+n34KHWCkaX3I2
 9Waa9AQQ8MhnYfnP9j5kFNznOB7G9nKQfdSY4syPPB09gxv6whyu/ievzkDvknDCZ36QBqLo8f
 5x0=
X-IronPort-AV: E=Sophos;i="5.76,348,1592863200"; 
   d="scan'208";a="2649139"
Date: Mon, 24 Aug 2020 11:38:31 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Jacob Kroon <jacob.kroon@gmail.com>, OpenEmbedded Devel List
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java] Changes from master-next merged to master
Message-ID: <20200824093831.GC2286@pcleri>
References: <20200824062225.GD65616@pcleri>
 <30416287-890a-4fd1-2262-21b2a9b68ffd@gmail.com>
 <20200824083345.GG65616@pcleri>
 <CANNYZj9BA_nPnJCHDAUcxtzz9Lz3zn8WSPh7jeKJY9omCTHRaA@mail.gmail.com>
 <20200824091401.GB2286@pcleri>
 <CANNYZj_+KTOwyvBhrDQ7NuecOBFe=Poh8Khc_ntDU4M5iGL=Gg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj_+KTOwyvBhrDQ7NuecOBFe=Poh8Khc_ntDU4M5iGL=Gg@mail.gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Aug 24, 2020 at 11:19:13AM +0200, Alexander Kanavin wrote:
> On Mon, 24 Aug 2020 at 11:14, Richard Leitner <richard.leitner@skidata.com>
> wrote:
> 
> >
> > > http://deb.debian.org/debian/pool/main/o/openjdk-8/
> >
> > Are you aware of "stable" orig source archives of Debian? IIRC the ones
> > in debian/pool/main are removed/updated when the debs are updated.
> >
> 
> I usually start with that, and if the tarball is regularly removed, it is
> possible to switch over to https://snapshot.debian.org/ which is stable for
> any given timestamp (but the downside is that no new releases show up so
> the latest version check has to look elsewhere).

Thanks for the info. So snapshots.debian.org is OK for OE/YP?

> 
> But I would wait a few days; there is a high chance the official site will
> come back soon.

Yeah, looks like it works again. At least my downloads succeeded now.

> 
> Alex

regards;rl
