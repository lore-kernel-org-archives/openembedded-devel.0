Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D88657D3CE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Aug 2019 01:28:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7L1R9Xo020689
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 20 Aug 2019 18:27:30 -0700
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 20 Aug 2019 18:27:07 -0700
To: Adrian Bunk <bunk@stusta.de>, Khem Raj <raj.khem@gmail.com>
References: <1566293810-37527-1-git-send-email-hongxu.jia@windriver.com>
	<CAMKF1soZbx6HH9d4Rhe+RpqYgiBNxpGkYu84LGaY7m+9=WahYQ@mail.gmail.com>
	<20190820164438.GB24268@localhost>
	<CAMKF1sqqUo3haTA8RpCd+8bLb2rw2OKJjVVVPk+tbPhS--tDnA@mail.gmail.com>
	<20190820201159.GA4592@localhost>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <0224715b-3c95-d1b8-4450-6b0ebdcd6d17@windriver.com>
Date: Wed, 21 Aug 2019 09:27:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820201159.GA4592@localhost>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] poppler: compile with -fpermissive to workaround code diagnostics errors on armv5
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
X-List-Received-Date: Wed, 21 Aug 2019 01:28:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 8/21/19 4:11 AM, Adrian Bunk wrote:
> On Tue, Aug 20, 2019 at 09:53:11AM -0700, Khem Raj wrote:
>> On Tue, Aug 20, 2019 at 9:44 AM Adrian Bunk <bunk@stusta.de> wrote:
>>> On Tue, Aug 20, 2019 at 09:30:36AM -0700, Khem Raj wrote:
>>>> On Tue, Aug 20, 2019 at 2:37 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>>>>> Build on qemuarmv5 failed:
>>>>> ...
>>>>> |poppler-0.79.0/splash/SplashFont.h:69:36: error: passing '    const
>>>>> SplashCoord' {aka 'const FixedPoint'} as 'this' argument discards
>>>>> qualifiers [-fpermissive]
>>>>> ...
>>>> I wonder why this warning only shows up for armv5 and not for other
>>>> arm subarches or
>>>> non-arm arches.
>>>> ...
>>> https://gitlab.freedesktop.org/poppler/poppler/issues/821
>> I see. This makes sense now. I wonder if we should just disable the
>> support instead of keeping
>> it dragging along ?
> Patch sent.

Understood, thank you very much

//Hongxu


> cu
> Adrian
>


