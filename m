Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 21B0372A78
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2015 17:54:30 +0000 (UTC)
Received: by iecrt8 with SMTP id rt8so48611161iec.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2015 10:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=OLcgM8ufieUuAN8FIjv0k61zCger5Jj7/6G+MAXz9Ws=;
	b=qqfIkg8zJkyGS6ToBCq81ShzdmNStQ6AFRRJvwEslUAv9wPaUhOVMQHsruV9VpbL3S
	3VRZ2SKoW2Hk44ojCwdix2uatd9DX0olmtIu929ZXjU+lFapjRKpnZTvdJ3O1536Nffd
	7cJ4SJh1hvZtVhIajW9owLGLp2s3+BJFKuCf82x+HZDYsrZP1xWj69k5SEZXTvVc2EAK
	/HgOUueCe40Ndmay04dPQTHH2ljVmd9nOdpsukDC7NoaZ/arsdg80XpiuVEU72jd9ctE
	gqp6FbWkEbSYG16+dsKpYLdHxqtsUDv2QezvbhPqmt1OcAm3VW33pibtwEoH75WtBZ/p
	uEKA==
MIME-Version: 1.0
X-Received: by 10.107.18.170 with SMTP id 42mr416575ios.38.1430330071574; Wed,
	29 Apr 2015 10:54:31 -0700 (PDT)
Received: by 10.50.230.178 with HTTP; Wed, 29 Apr 2015 10:54:31 -0700 (PDT)
Received: by 10.50.230.178 with HTTP; Wed, 29 Apr 2015 10:54:31 -0700 (PDT)
In-Reply-To: <5541157E.2080807@pseudoterminal.org>
References: <1430153054-1252-1-git-send-email-raj.khem@gmail.com>
	<CAJ86T=Witf+y68y_r-HtcR5FZvHGMOzOrxOYzWhLPFQd9zbdMg@mail.gmail.com>
	<DCD4D1D9-2F13-449B-9A49-43E95C4255C5@gmail.com>
	<CAP9ODKrGu5sJo9WO--7U511hOeOJKcK-W8e8vE1K2RiFkJ2fvQ@mail.gmail.com>
	<5541157E.2080807@pseudoterminal.org>
Date: Wed, 29 Apr 2015 10:54:31 -0700
Message-ID: <CAMKF1spGC+4unddLJeqCuynaBeP7h62raW2RN==EeNu=SzeYfA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: pnandyala <Pavan.Nandyala@lnttechservices.com>,
	Zoltan Kuscsik <zoltan.kuscsik@linaro.org>,
	knagabhirava <kalyankumar.nagabhirava@lnttechservices.com>,
	Otavio Salvador <otavio@ossystems.com.br>
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
X-List-Received-Date: Wed, 29 Apr 2015 17:54:32 -0000
Content-Type: text/plain; charset=UTF-8

On Apr 29, 2015 10:37 AM, "Carlos Rafael Giani" <dv@pseudoterminal.org>
wrote:
>
> The latest one (V8) seems good to me. I was initially skeptical about the
heavy chromium.inc refactoring, but these days we don't have multiple
chromium versions in meta-browser, so it is okay.
> The shared object versioning bandaid wasn't done by me, I modified other
parts, but I agree with the patch. The way it is done now is cleaner.
> Have you come across a case where there were codec package conflicts?
>

Not yet but this makes it future proof. Since I know there are packages
with same .so
>
>
> Am 2015-04-27 um 23:40 schrieb Otavio Salvador:
>>
>> On Mon, Apr 27, 2015 at 6:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>
>>>> On Apr 27, 2015, at 1:33 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>>>
>>>> Looks like some regressions may have crept back relative previous
>>>> versions of the patch?
>>>>
>>>>   - dubious indent in do_install()
>>>>   - .pak files being installed as executables
>>>>   - dev-so INSANE_SKIP shouldn't be requied
>>>>
>>> Thanks for bringing it up. I will send a followup to fix it
incrementally.
>>
>> Please wait for Carlos comments and send a new pathc revision. This is
>> not yet merged so fixes are still possible.
>>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

