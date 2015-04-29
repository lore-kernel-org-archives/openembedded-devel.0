Return-Path: <dv@pseudoterminal.org>
X-Greylist: delayed 327 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 29 Apr 2015 17:37:11 UTC
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 9BCDC72A78
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2015 17:37:11 +0000 (UTC)
Received: from [192.168.178.14] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 272A3321E0;
	Wed, 29 Apr 2015 19:31:34 +0200 (CEST)
Message-ID: <5541157E.2080807@pseudoterminal.org>
Date: Wed, 29 Apr 2015 19:31:42 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <1430153054-1252-1-git-send-email-raj.khem@gmail.com>	<CAJ86T=Witf+y68y_r-HtcR5FZvHGMOzOrxOYzWhLPFQd9zbdMg@mail.gmail.com>	<DCD4D1D9-2F13-449B-9A49-43E95C4255C5@gmail.com>
	<CAP9ODKrGu5sJo9WO--7U511hOeOJKcK-W8e8vE1K2RiFkJ2fvQ@mail.gmail.com>
In-Reply-To: <CAP9ODKrGu5sJo9WO--7U511hOeOJKcK-W8e8vE1K2RiFkJ2fvQ@mail.gmail.com>
Cc: pnandyala <Pavan.Nandyala@lnttechservices.com>,
	Zoltan Kuscsik <zoltan.kuscsik@linaro.org>,
	knagabhirava <kalyankumar.nagabhirava@lnttechservices.com>
Subject: Re: [meta-browser][PATCH 1/2 V4] cef3: Add recipe for Chromium Embedded Framework
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
X-List-Received-Date: Wed, 29 Apr 2015 17:37:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

The latest one (V8) seems good to me. I was initially skeptical about 
the heavy chromium.inc refactoring, but these days we don't have 
multiple chromium versions in meta-browser, so it is okay.
The shared object versioning bandaid wasn't done by me, I modified other 
parts, but I agree with the patch. The way it is done now is cleaner.
Have you come across a case where there were codec package conflicts?


Am 2015-04-27 um 23:40 schrieb Otavio Salvador:
> On Mon, Apr 27, 2015 at 6:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Apr 27, 2015, at 1:33 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>>
>>> Looks like some regressions may have crept back relative previous
>>> versions of the patch?
>>>
>>>   - dubious indent in do_install()
>>>   - .pak files being installed as executables
>>>   - dev-so INSANE_SKIP shouldn't be requied
>>>
>> Thanks for bringing it up. I will send a followup to fix it incrementally.
> Please wait for Carlos comments and send a new pathc revision. This is
> not yet merged so fixes are still possible.
>


