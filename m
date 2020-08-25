Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web10.11290.1598353427148834204
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 04:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=T7R0FvK5;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=499bf77a6=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1598353427; x=1629889427;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RDlkNve8TdiglWnSdODrI8v6t9B9ZMugmdLx4PixsFc=;
  b=T7R0FvK50f+H5WMEuXpupoN+Yuv6qzSE6CZAf7QLh4PsIzBtrJ2qmYET
   OOc6Mak6P+OB1Sk3vpQE8AxpErDJKhkjGfFPDmaIIETR+ILKE81fKnV4n
   B9VXtN2RJzEm5u8IvqcSWsvLWpQk/293zuZ8LEdJNHiJ2Bf6CzToiT3wW
   UmPqZspzTGCZjMKVPQj2lBvpdO6ehVm9BatlpFnmpf5I01DGHF7B5rEjN
   faI+9ys101ifk0zS84h3mcnj0o68MnB81Z+6qwB+yhI8Cqz/8Ezevll+A
   qMKqFQD1YrzDsYq1LkKNCeC/aiIsZ+m/V1/a/HMkWjRDeEzxBleUaPgw0
   A==;
IronPort-SDR: tnZHk4EirVfp5AyNLF4qdU9VvshvWJqbjhHaUbu2f7XSSKoh67DJhPRr4d15ZXxYK1kqkqNWls
 3I3G2hz8n4UDkm6Kw16AL6zJoAsDIcqAQOL7X6QqxlL2M7D/kXa/ogthsECux3rU/tnswGJNuc
 DU2JBQBvbbQh1tySffUlhmKH2ZBkFro+t38yCgCmpNB5bJxN1/W78NYvvyWD6wnwidpJ3oNamn
 lvo+RmNPUMXif7//TaJF0fArN2GnM3y/VxtdxfMl+mgmC8URJjCRKsAQzKObDmbOM5FjLl/1SK
 83E=
X-IronPort-AV: E=Sophos;i="5.76,352,1592863200"; 
   d="scan'208";a="26366633"
Date: Tue, 25 Aug 2020 13:03:43 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Jacob Kroon <jacob.kroon@gmail.com>, OpenEmbedded Devel List
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java] Changes from master-next merged to master
Message-ID: <20200825110343.GE37583@pcleri>
References: <20200824083345.GG65616@pcleri>
 <CANNYZj9BA_nPnJCHDAUcxtzz9Lz3zn8WSPh7jeKJY9omCTHRaA@mail.gmail.com>
 <20200824091401.GB2286@pcleri>
 <CANNYZj_+KTOwyvBhrDQ7NuecOBFe=Poh8Khc_ntDU4M5iGL=Gg@mail.gmail.com>
 <20200824093831.GC2286@pcleri>
 <CANNYZj_LT1m2gSbhL+Di1PaFGzSYGmPVYsEus0YnSx19sOZ8jw@mail.gmail.com>
 <162E2BC2BA50B6B6.12673@lists.openembedded.org>
 <CANNYZj8fWMk1Ya+G-HbC2VVbC4HWV6x=4T=ni_cdW5-qNG1YnA@mail.gmail.com>
 <20200825055800.GA37583@pcleri>
 <CANNYZj-n4T1bkX4k36B5LgG+7nJANO+sVKGXbyf1mFZTMx-t1Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj-n4T1bkX4k36B5LgG+7nJANO+sVKGXbyf1mFZTMx-t1Q@mail.gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 25, 2020 at 01:01:36PM +0200, Alexander Kanavin wrote:
> Yes - I ran this in our internal CI, and there was no problem. Now just the
> stable backports are missing.

Great. Thanks for the feedback.
dunfell-next and warrior-next are already available. I'll merge them to
the real stable branches soon.

regards;rl

> Alex
> 
> On Tue, 25 Aug 2020 at 07:58, Richard Leitner <richard.leitner@skidata.com>
> wrote:
> 
> > On Mon, Aug 24, 2020 at 09:36:42PM +0200, Alexander Kanavin wrote:
> > > I think the site and the downloads are now properly back.
> >
> > Thanks for the info and sorry for my misunderstanding regarding the
> > java.net site.
> >
> > So you are able to build 8u265 with the current master?
> >
> > regards;rl
> > >
> > > Alex
> > >
> >
