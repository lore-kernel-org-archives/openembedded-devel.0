Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 51AB760196
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 13:02:32 +0000 (UTC)
Received: by mail-yh0-f43.google.com with SMTP id 29so650989yhl.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 06:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=eG6WY0U6ReDvzkHEQOywLBRvVlMhIVFUaq+fVJ96d5A=;
	b=QX9X+OMzI1WejZwUqVAdLbqDO7cA6/k5OhMt2z6pimfJstADcxoJJ2TQ1VV4P+atL0
	0Xmfa8D18pMmcewrho9P+8A7A2H4Og6Vpf/VqSeFzeC7CqbUxHdxAkt2Q28Dw8nBqN1K
	0NvH6uXQeFBDfHV/SnyoqRfTjD8K0AiGiovqK58pmyi6act4lVEGjgvCmcizh4dk/x8L
	hKW1UDax6rgNch2UyQBxXQbU82g9gttHKdrSNM+3htqp+sWIfUCBKrnpZVrPV+91aUMJ
	+Z0bhi4MKYgjyXiWS0OVIIfTzDbqJP/N7jpyLkmB6bKpK36KbkkbxDhdR/sV0eUyTauB
	2ZLA==
MIME-Version: 1.0
X-Received: by 10.236.79.230 with SMTP id i66mr2436845yhe.136.1406725353378;
	Wed, 30 Jul 2014 06:02:33 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Wed, 30 Jul 2014 06:02:33 -0700 (PDT)
In-Reply-To: <CAMKF1srBNaC9hA8Sq_-jV3qmwn+SM4-nXpmvSBfU3+VftCUEZg@mail.gmail.com>
References: <1406629327-29169-1-git-send-email-dv@pseudoterminal.org>
	<CAMKF1sqknbM=rXZCRLjPtcHG_1-D1wV+XtBDtao2kOTG9F81+g@mail.gmail.com>
	<CAP9ODKq=mNeFOf_DMTNiiT4Lj0H=zujFyad97=E1K+KGTrr5OQ@mail.gmail.com>
	<CAMKF1srBNaC9hA8Sq_-jV3qmwn+SM4-nXpmvSBfU3+VftCUEZg@mail.gmail.com>
Date: Wed, 30 Jul 2014 10:02:33 -0300
X-Google-Sender-Auth: 28DByR2AMUTXU9BsJqszX2D13fk
Message-ID: <CAP9ODKo8o-bidnDgAUQZD5Yek_9fHg2FWR=m8+xE=-pLS4ttMA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH 1/2] chromium: Add PACKAGECONFIG for disabling API keys info bar
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
X-List-Received-Date: Wed, 30 Jul 2014 13:02:41 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 29, 2014 at 11:28 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Jul 29, 2014 at 2:51 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> There are customers who don't need to use the Google APIs so they are
>> not willing to make an API key and instead they prefer to drop the
>> warning and keep using the Chromium as an application platform. We've
>> been involved in a couple of projects lately where this happened.
>>
>> Chromium's upstream advice is to generate an API and use it to deploy;
>> I think in the meta-browser's case this is sub-optimal as we'll end
>> having several products and customers using our key and not making
>> their own ones.
>
> OK then disabling the API key is in essence suppressing the problem. I
> am fine if thats the general usecase but I doubt that

As I explained, this is the requirement for some projects we've been
involved with. The idea here is to share it in a 'reusable' way and
avoid this patch to be kept private for no good reason.

I think it is fine as is.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

