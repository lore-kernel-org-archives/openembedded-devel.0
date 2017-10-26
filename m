Return-Path: <s.sonski@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1378777FC7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Oct 2017 13:47:02 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id r64so4323931qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Oct 2017 06:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2xEw9InxO4YOmo2Pf9sWy56moxUgDBpdLJNPHCNjaRA=;
	b=u3Jc/w0X97KjHP0k1xZqBJGycHBH7OdakvaQtBt67rwjscMBT/RpfoJszMzy1pGL0o
	HaFAkzOPVkbfR81S2RJPmvPk3W9PcziBTaKKeBZdcguZ7edR1Z1chw45MbHZm9FIGp6r
	DlcErFW80foNrO5JEIT7C6QAkHNmKBO6C96kq2XPxtqx85X4uTJEWxcqa4AiongAQBop
	hCE+pzUtKeSSG1f8+i4eA06D1YVsvqqwPUxWhCMDrS4BVMLg+wVBrBkuBYw9kneEMaHA
	IGq1yT358LBPMp73IJFXe49QX142voPVF9gm3ZXGLUKw+NNJdxI5qFDaWJPVPjYUnzvE
	LZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2xEw9InxO4YOmo2Pf9sWy56moxUgDBpdLJNPHCNjaRA=;
	b=A6mUL0r4ZYR/FViZaNc3/360gzrv1vmqL2MTdUj6kOv0aZiz6XfVv29KZa9u+6FF4B
	bppetjk047LmRtYjz6Ih33JnZvuTzjnEaRv0lIktiCx/mv9xf4Ur/dvahi3nyn6W0ayl
	4zvUShp1vt19Jl0NEgaQG0sYbGPHlNPsBrJYxSrS2UuyHXhvLC1335h5ocTe7TF9Imgn
	GpgveQlC+2ypXK5+E2+WPEuNLah+4XaWQoT6POYRLqGydX/tMtsDQ7Or516KKguGhLME
	3laF4hKnii4O4Rx3V9cPeLsTfDfQGYNp0Pc1fQeMuXvLHBjikLL/fmLPCnJAfOHaR1Qr
	PmLQ==
X-Gm-Message-State: AMCzsaWXRroMx7dsR0DJx/3Tb2UW9k1dgortx65OgOwI296nFmmBrg6P
	JzSJkKCtYDHGkc4UUeRAwvnrqmIFijlXYtBcMeo=
X-Google-Smtp-Source: ABhQp+QOKWg3rj2T/wnQmZUPAntm0qOyTzGoaMZrcAfPA35I1j1dwTkWJlvdunh2i0Qo/6W5CBic6msIdgelhEwoJ0M=
X-Received: by 10.55.109.131 with SMTP id i125mr7811006qkc.219.1509025624023; 
	Thu, 26 Oct 2017 06:47:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.75 with HTTP; Thu, 26 Oct 2017 06:47:03 -0700 (PDT)
In-Reply-To: <20171026133646.GX9221@denix.org>
References: <20171017195649.8657-1-s.sonski@gmail.com>
	<20171017195649.8657-2-s.sonski@gmail.com>
	<CA+chaQcK6+mS9SgBTaNdzgLdDS=nhoHNj1crFtPeirxnK1m87Q@mail.gmail.com>
	<8cfe1d21-f003-031b-ae42-024f3be91910@zonque.org>
	<20171026125505.GW9221@denix.org>
	<689fd8ec-97bf-2451-0c7a-1bc4606458e5@zonque.org>
	<20171026133646.GX9221@denix.org>
From: Stefan Sonski <s.sonski@gmail.com>
Date: Thu, 26 Oct 2017 15:47:03 +0200
Message-ID: <CAGR_wht0dmUeeK_umpjXaVP=U9K=j9P54kvnWsnZZGY=J+wtww@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: "Chris E. Rallis" <Chris.Rallis@ravenind.net>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 2/2] qmake5_base: add OE_QMAKE_OBJCOPY from OBJCOPY
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
X-List-Received-Date: Thu, 26 Oct 2017 13:47:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 26, 2017 at 3:36 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Thu, Oct 26, 2017 at 03:07:36PM +0200, Daniel Mack wrote:
>> On Thursday, October 26, 2017 02:55 PM, Denys Dmytriyenko wrote:
>> > On Tue, Oct 24, 2017 at 03:33:10PM +0200, Daniel Mack wrote:
>> >> Hi,
>> >>
>> >> On Saturday, October 21, 2017 12:54 AM, Martin Jansa wrote:
>> >>> Either this or the ptest change seems to cause:
>> >>> http://errors.yoctoproject.org/Errors/Details/157417/
>> >>
>> >> FTR, I see the same error locally. Reverting both 8fd20e8b1
>> >> ("nativesdk-qtbase Enable objcopy for qmake") and 5ec6b97a8
>> >> ("qmake5_base: add OE_QMAKE_OBJCOPY from OBJCOPY") in the master-next
>> >> branch of meta-qt5 fixes things for me.
>> >
>> > Have you tried bisecting by any chance?
>>
>> bisect what exactly? If I take your patch out of my stack, qtbase
>> builds. If I don't it doesn't. Can I provide more information somehow?
>
> That's not what you said above - we are trying to figure out which of the 2
> (*two*) patches causes the breakage, hence the question about bisecting...

OK, I misunderstood you. I will bisect it in the evening and check
which of the patches causes the failure.

