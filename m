Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1763A755F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 18:59:59 +0000 (UTC)
Received: by ioll68 with SMTP id l68so56861028iol.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 11:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=y4byDhrY8En7EV6KsVkWwIKDUM/A3H/7yNr87vQo/uA=;
	b=tSFU7ly6Bylqd9IR3lO63zj7o+fMU+Bo3Cc4qZuZRwGmJufZd0GeBKFmZ5qxkn/EYR
	oLd1AhNq/Yo2eSXZW8q4bEDFKrRyrQGnpqn0PKYztZ5mO3IgPV3HKjG/yopknCvXkLHC
	ZkY5I+xsQ6gH3JJQRKw0T3F7Nd7OpocAEkJp3WCXRmKngYnKx2QvpfVzdU6X6XcwtJDn
	SmlsBBD2DK9OD7Oxf078KIAhWlJGcmfVYLBbPgh3nUSjpdc5xniReF+Xaqk8qVv1ZMpk
	1Lu0b7j0qm1nXGbq+lmTAKNt2JMgerDDb5WzOnm7Y4e7dE7lGnbRHJFbQvdk7J0zZPIR
	E5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=y4byDhrY8En7EV6KsVkWwIKDUM/A3H/7yNr87vQo/uA=;
	b=Hv1jNuLthlZe33vGGgDTRy8YsIluuI6tYkc8IDhQF0H8FKyKauw2i7U9dyjN/8tJee
	PPQZ7WlWsd+LN8O5xGccYeZQ6SdaPVcWO+ojxCD577PzwNNDHK7Wrde9FDImhSonIQGC
	vRN4qxRzgj6ic32ETuYNm9J8TGDRy2sOcjKxnoLnsnhom49lQCf1PRMwCPSmgyhjE6lo
	8E79rBdDo56GT9GB0vwfMZoDkNsb3k9zGD3u4j6MdW5Gv5nredynvWe8nf2X2K0KnNtV
	DRU1QTTk0odstdbQhWIVuPZwAjjQ2bVoE6Ve4F3y7cgJ8A4r0mDwPFYKIKQd/yZhoIhW
	mIxA==
X-Gm-Message-State: ALoCoQnygktEMiPPMF5a4AL38tTMoaIXVAGsg9epWKoJ1Qz7hFHd/VzKnC45WksNxBO/9GmAE5Th
X-Received: by 10.107.12.142 with SMTP id 14mr5127773iom.78.1446145199492;
	Thu, 29 Oct 2015 11:59:59 -0700 (PDT)
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com.
	[209.85.223.182])
	by smtp.gmail.com with ESMTPSA id 71sm1452102iof.28.2015.10.29.11.59.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Oct 2015 11:59:58 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iofz202 with SMTP id z202so56378731iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 11:59:57 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.131.147 with SMTP id n19mr5463714ioi.192.1446145197597; 
	Thu, 29 Oct 2015 11:59:57 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 29 Oct 2015 11:59:57 -0700 (PDT)
In-Reply-To: <56326A97.4040107@skidata.com>
References: <D1946B41-2BFF-49FA-A4C7-19A2A1D6C731@gmail.com>
	<5631CDAD.7030703@skidata.com>
	<A34BC9F8-F519-435B-B65A-26A533F78877@gmail.com>
	<CAP9ODKrh9kxCTf3es2Oypx3rPNiKp9Fb3Nk6xafgrc=R+JEkwg@mail.gmail.com>
	<9E01DDA7-C832-4E17-B17A-25850D0B27B5@gmail.com>
	<563208F3.1040900@skidata.com>
	<CAP9ODKoUv+-WXzXNEKdFWwFDbJnQGXZtiZzqXtBzS7MmwOXkYA@mail.gmail.com>
	<56324006.8040905@skidata.com>
	<CAP9ODKrnG2biyhwNESgA8DBQcaMgYZ39kdRTFU4Cv6PgvAjg4Q@mail.gmail.com>
	<56326A97.4040107@skidata.com>
Date: Thu, 29 Oct 2015 16:59:57 -0200
Message-ID: <CAP9ODKogmLTnhkbcexo58JtSAbq74xta7OfVJ_szSYbxA2nfqg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH 4/4] openjdk-8: add recipes for openjdk-8 and openjre-8
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
X-List-Received-Date: Thu, 29 Oct 2015 19:00:01 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 29, 2015 at 4:51 PM, Richard Leitner
<richard.leitner@skidata.com> wrote:
> On 10/29/2015 05:03 PM, Otavio Salvador wrote:
>> On Thu, Oct 29, 2015 at 1:49 PM, Richard Leitner
>> <richard.leitner@skidata.com> wrote:
>>>
>>> What indentation should be chosen? Tabs? Spaces (how much)?
>>> Maybe I have also time to fix that in the recipes-core.
>>
>> I would prefer 4 spaces.
>>
>
> Generally I prefer real tabs displayed with 8 spaces width (like the
> linux kernel coding style). But of course I will stick to the formatting
> rules if we have one in OE layers ;-)
>
> Is there a generally considered rule/advisory across all OE layers or
> meta-java?
> If yes, where do I find it?
> If no, wouldn't that be a good idea? (and of course write it down!)

http://www.openembedded.org/wiki/Styleguide

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

