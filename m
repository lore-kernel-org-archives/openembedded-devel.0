Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id A4B836AC43
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2015 11:56:24 +0000 (UTC)
Received: by iecvj10 with SMTP id vj10so58140736iec.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2015 04:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=LPi8gx/e4ODmJHubpSEPUNUN9TXI3Xjb5EqFzcpqOO4=;
	b=wRwQGsw1PTuwafegDrJ0sNM18keZ6x/jrFAE1K12Gh/tJqdAoPbPGGpm85pbc7/VQK
	Z35SAisFiaHta8SDDOl2ZlEiyZdBuRNhUBRkSlAxagi6mHZhrspUV2yxKB4BH0OyqAAq
	2I/jf1heGfYVEd7mhitBv1fbfLQOPT8JA2T2LxEQyRdIVOiYkSFcrexD/m73CJ0+wOFW
	jQFLWMkiOS/bZZI+BZpPzgWPCdjzfVWxKwKC7YLoSb2HrCNtifvTJx5vYteAatpC9/P0
	epYjKCyGkllyIB8EuwZtReoUwSOqSdyzVFNbC1XPiwohVTMG3NTA//wbfibpJsAjBtZd
	rPow==
MIME-Version: 1.0
X-Received: by 10.42.187.7 with SMTP id cu7mr24577156icb.71.1427198185684;
	Tue, 24 Mar 2015 04:56:25 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.133.21 with HTTP; Tue, 24 Mar 2015 04:56:25 -0700 (PDT)
In-Reply-To: <CAMKF1sqm5ARrWih-TgnzFXgEGXR97o=iUU_xR-fvp_bLC=SyEQ@mail.gmail.com>
References: <1427045315-13142-1-git-send-email-raj.khem@gmail.com>
	<CAP9ODKp=x2GpWVZLB1kf2CjZpMCuBfGZxYuOAQRUsx-D+uRiVw@mail.gmail.com>
	<CAMKF1sqm5ARrWih-TgnzFXgEGXR97o=iUU_xR-fvp_bLC=SyEQ@mail.gmail.com>
Date: Tue, 24 Mar 2015 08:56:25 -0300
X-Google-Sender-Auth: 53a64X2ASaeCynNH6t8GdsRbrBs
Message-ID: <CAP9ODKoFdepGX7OZu8XxMQVr-ssUCG_Ndyyj6GROOACViiMhEw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: pnandyala <Pavan.Nandyala@lnttechservices.com>,
	Zoltan Kuscsik <zoltan.kuscsik@linaro.org>,
	knagabhirava <kalyankumar.nagabhirava@lnttechservices.com>
Subject: Re: meta-browser][PATCH V2] cef3: Add recipe for Chromium Embedded Framework
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
X-List-Received-Date: Tue, 24 Mar 2015 11:56:25 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 24, 2015 at 12:01 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Mar 23, 2015 at 1:00 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>>
>> Couldn't it reuse the Chromium recipe we use?
>
> Surely and I have thought that for as second iteration after its soaked in
> Right now they use different versions of chromium so there are some
> issues around.
> this will also mean some changes in chromium recipes.

I'd prefer to do it once and avoid adding another recipe and handle
same problems we had solved there. Also this allows for example the
use of i.MX patches on meta-fsl-arm.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

