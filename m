Return-Path: <changhyeok.bae@lge.com>
Received: from lgeamrelo01.lge.com (lgeamrelo01.lge.com [156.147.1.125])
	by mail.openembedded.org (Postfix) with ESMTP id 0356065D21
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Apr 2014 01:32:57 +0000 (UTC)
Received: from unknown (HELO CHBae0915) (10.177.232.191)
	by 156.147.1.125 with ESMTP; 17 Apr 2014 10:32:57 +0900
X-Original-SENDERIP: 10.177.232.191
X-Original-MAILFROM: changhyeok.bae@lge.com
From: "Changhyeok Bae" <changhyeok.bae@lge.com>
To: <openembedded-devel@lists.openembedded.org>
References: <00d101cf5942$91feeb30$b5fcc190$@lge.com>	<CAMKF1srO8NBNuYbMhbwUO3df8+Q3aDoUmzHUinDy9V_WKuBsRA@mail.gmail.com>
	<CALYKT1hwGK7c9QcXMRXpMPLbP69zoa_49QBhZXpOaYec7geVRQ@mail.gmail.com>
In-Reply-To: <CALYKT1hwGK7c9QcXMRXpMPLbP69zoa_49QBhZXpOaYec7geVRQ@mail.gmail.com>
Date: Thu, 17 Apr 2014 10:33:14 +0900
Message-ID: <016b01cf59dd$003f8100$00be8300$@lge.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQDaQwCXNdUVlLlAOtaLDTQ/OCRjKgKMBVEGAekPS0Sc24pz8A==
Subject: Re: How can I get the toolchain?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Apr 2014 01:33:01 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: ko

Thanks for your help.

In summary,
1) bitbake meta-toolchain
2) bitbake [target] -c populate_sdk ...

However, those were building ...nativesdk ...
I only would like to get the cross(arm) toolchain without building SDK
toolchain.

Regards,
Changhyeok

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
Journeyer J. Joh
Sent: Wednesday, April 16, 2014 9:57 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] How can I get the toolchain?

Hi Changhyeok Bae,

I raised similar questions and received good pointers and explanations:

http://thread.gmane.org/gmane.comp.handhelds.openembedded

Find the QnA titled with:

[oe] Where can I get a arm cross toolchain for oe-core?

I only able to give you pointers to answers I received.

Good luck!

Sincerely
Journeyer

----------------------------------------
Journeyer J. Joh
o o s a p r o g r a m m e r
a t
g m a i l  d o t  c o m
----------------------------------------


2014-04-16 17:02 GMT+09:00 Khem Raj <raj.khem@gmail.com>:

> On Wed, Apr 16, 2014 at 12:07 AM, Changhyeok Bae 
> <changhyeok.bae@lge.com>
> wrote:
> > Hi,
> >
> > How can I extract the toolchain in my oe build result?
> >
>
> bitbake -cpopulate_sdk <yourimage>
> should generate a self-installer .sh script which then you can run and 
> install it
>
> > Regards,
> > Changhyeok
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel


