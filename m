Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web11.190002.1598251818429384731
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2020 23:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=Ym7wlrny;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=498d700d9=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1598251818; x=1629787818;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yf2YPmSqM6Oz6o+maZW3oceUeIQGol2aJoqT8RNgock=;
  b=Ym7wlrny6b9cQvI18lHpWTj55Zrn5lUHMimcRHVI8Xr7H4I6PuZ7pckd
   hZW7lw7+l5rvgWxALttZ+VFcu4mLnKPaBhJLAgPQGTUEbUplsWQX95ITu
   CNIL1XDyFW3AoHpMS0zJ2wFG6N8tzfNQ8UegQJ9jdsu4yluioO3BO9u4i
   4R+GBUHn8hy6231Ur8dqWmCHBb9gsrr9inzm/mXVAybpa3R8PNtbvS8Gl
   CbR1JmbGcm0lvxxsBtjAtvvE70ggjISCbz3tBzea9UYXKq5VEevJNnHuY
   IZKh+h8C6N3JJfZkFyFEGe7ul5yuyhkojY3b2zIAeeQkZUyFEcAX/gHh+
   Q==;
IronPort-SDR: rECVaCWbWcU9WFwS5Rl+8+1C4cuDwaepBWV5blGaa5rKwHaBTdH/rcoqyRrLN0bSTPYI5gfaDe
 9kRCN+R9dL4cAX14Os/skukZsRebawXtfMKMB60pPh8ev2adQ/HeAZ/g+BeuA01ioWdEZJVqjJ
 6HfTW4p/g76mxBKYAhd/rAUuFB9wMwgLMWHgpqRxT8Pt7z6KAqf/qHb2FOgcJUHLfJbNuBuYmL
 40HYXRs8PUaXY/xyMgtJu9pHSzZrYxXgYpSxePHZNfghD/tmYToUBkvHyg9sSV+AGAB4FFqcwB
 zSk=
X-IronPort-AV: E=Sophos;i="5.76,347,1592863200"; 
   d="scan'208";a="26327622"
Date: Mon, 24 Aug 2020 08:50:11 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Chencheng Zhang <chencheng@wittra.se>, <ricardo@ribalda.com>, Alex Kiernan
	<alex.kiernan@gmail.com>, OpenEmbedded Devel List
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] Failed to fetch URL https://bitbucket.org/cacaovm/cacao-staging/get/2d6f6c14daf9.zip
Message-ID: <20200824065011.GE65616@pcleri>
References: <CAE5diG1AoUDZrO=V7pMjvgv3Gu5cMk3dvPzM82Dem1Sc8X3Wvg@mail.gmail.com>
 <CANNYZj8dyU6LpUBiM--YNsF8of56SG4-+VxMsM2B9_SwY0+1dA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj8dyU6LpUBiM--YNsF8of56SG4-+VxMsM2B9_SwY0+1dA@mail.gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Aug 21, 2020 at 04:40:26PM +0200, Alexander Kanavin wrote:
> A fix should be arriving to meta-java shortly and a patch was already
> posted here yesterday.

fyi: I've just merged the cacao update to the master branch.

> 
> Alex
> 
> On Fri, 21 Aug 2020 at 16:32, Chencheng Zhang <chencheng@wittra.se> wrote:
> 
> > Hi,
> >
> > The source of cacao seems to be invalid which makes the repice falsified:
> > https://layers.openembedded.org/layerindex/recipe/23632/
> > And this prevents Yocto from building openjre.
> >
> > Could someone be kind enough to update the cacao recipe?
> > Thanks & Regards,
> > Chencheng
