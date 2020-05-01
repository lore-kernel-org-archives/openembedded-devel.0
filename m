Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web10.6701.1588324769075433434
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 May 2020 02:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=T8Rhb9eP;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=3837e3c93=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1588324769; x=1619860769;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QbVAbPOkprW56REmo+wZAAyimeZUnFzH6MuQOc4LHRc=;
  b=T8Rhb9ePMz13WAbDJAB1DOdtNJEnDw8/6DNMaxwPbhJ8Zf+5y7440Q/Z
   jS/8e2WchOP+m2EX4BIa4IGpWlo64HSTKBpsdearkw/bnbhkH5Y8cbF34
   S3MNgs8W/hYGhi6/Kv7n3eeG/OUbR1xJcKo9vHqTWaOLGAGnnEKJt+g2d
   7+5xiorI/qzRytEnQptICyojrR2VS9/h7HKeEmtgEgk+/uuw+1rLu+2HF
   9tBs+sIb3yADPUkt1L47NZQ/QSYx6Uinxoa/101ip83sQIrxe+eV7brHf
   jCe0juNFk8AeZbzif6EPw5x11WR+pn4oHq4uy9lbiXYr1A7Jo97caEh69
   Q==;
IronPort-SDR: gwr7eB1/UuiD8y+mXC4iaUQqQwtcwWxD1wTLlUgemEZJlZg/C4DIWHWUv8N1xMqiPzA/l3+mmF
 xBSV8FW6HsJoZmn/qSsbgEr9DT4p4Isyxn4uWeXWAtsUKq7gZMOTn5EzO+/reQnhM5kKpMZMLI
 9Eze8cCadJqClTVmDs5eoKTjqdVqC7ZJbZpeNVE3dH+tIW00H9qGexS3eGI62uVdKdcqlf60WO
 5tm48bvt8IJS0kYdSbxaZue2fcmULz1cc8GAaAgY1H+OgvyvSy7R0dfFt3l3jhsCjQFWha1TBt
 +Oc=
X-IronPort-AV: E=Sophos;i="5.73,339,1583190000"; 
   d="scan'208";a="24100680"
Date: Fri, 1 May 2020 11:19:24 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH][meta-java 3/3] openjdk-8: Fix building with GCC 10
Message-ID: <20200501091924.GA1127264@pcleri>
References: <20200430131556.2150334-1-jacob.kroon@gmail.com>
 <20200430131556.2150334-3-jacob.kroon@gmail.com>
 <20200430211019.GA410632@pcleri>
 <9f19c70e-d290-2366-a900-00ef7e8ad346@gmail.com>
MIME-Version: 1.0
In-Reply-To: <9f19c70e-d290-2366-a900-00ef7e8ad346@gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, May 01, 2020 at 09:50:21AM +0200, Jacob Kroon wrote:
> On 4/30/20 11:10 PM, Richard Leitner wrote:
> > Hi Jacob,
> > thanks for the patch!
> > 
> > On Thu, Apr 30, 2020 at 03:15:56PM +0200, Jacob Kroon wrote:
> > > Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> > > ---
> > >   recipes-core/openjdk/openjdk-8-common.inc | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
> > > index d8b30b8..5228338 100644
> > > --- a/recipes-core/openjdk/openjdk-8-common.inc
> > > +++ b/recipes-core/openjdk/openjdk-8-common.inc
> > > @@ -176,6 +176,10 @@ FLAGS_GCC6 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
> > >   FLAGS_GCC7 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
> > >   FLAGS_GCC8 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
> > >   FLAGS_GCC9 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
> > > +FLAGS_GCC10 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
> > > +
> > > +# GCC 10 defaults to -fno-common, but OpenJDK 8 is not ready for this.
> > > +FLAGS_GCC10_append = " -fcommon"
> > 
> > Does setting "-fcommon" also work for GCC version > 5 and < 10? In
> > icedtea7-native you've appended it to CFLAGS it w/o GCC version.
> > 
> > Background of the question is that I'm currently planning to drop
> > support for GCC versions < 6 in the recipes. If done so, we currently
> > have no need for version specific flags. Just want to check if that
> > would be an exception. Thanks.
> > 
> > regards;rl
> > 
> 
> A quick check shows that support for -fcommon/-fno-common exists since at
> least gcc 4.7.2:
> https://gcc.gnu.org/onlinedocs/gcc-4.7.2/gcc/Code-Gen-Options.html
> So yes, it should work for 5 < GCC version < 10.

Great. Thanks for checking.
Then I'll take your series as-it-is and will rebase my local patches on
yours.

regards;rl


> 
> /Jacob
