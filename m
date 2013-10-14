Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2C6256D112
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 16:24:37 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id eh20so5947396lab.32
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 09:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=qv4VBdxr1PAaLQe0X28Nil5fe8vyd7GP/vwLaEnhKjw=;
	b=YkGLlNwWz//dvAmpt9RVgxCkn1Ag7RDWApd2FQLhME6EvIgv9tEdo5hz+ufA6Cq17O
	ETAfM3j4hoTMYMomASoqmcUiDcn8Or8GNEQaLBIfWRRh7c8TgqV2uhs9XT+COAK6FqSj
	/F49B8lXwoRdadexq/Yan3c5BkrzyssO24PWBQg1FIPlo/lufs/zMSSb0mUYh77+PbFw
	vJwllbdDYv738JqPmwenYsapUetx/O9K5RHyH4s8/ZZbYTmDQVWl2okLWXJAwgZueQXp
	hjuX7k4mXV2NlDtgmqm6Y8uoJykkkZRda5A9wPVj1dJYY2Qyz/FonYPkTJ2gISLRgCTt
	wnNA==
MIME-Version: 1.0
X-Received: by 10.152.170.166 with SMTP id an6mr31379077lac.20.1381767879036; 
	Mon, 14 Oct 2013 09:24:39 -0700 (PDT)
Received: by 10.112.52.74 with HTTP; Mon, 14 Oct 2013 09:24:38 -0700 (PDT)
In-Reply-To: <5529742.8LBZEpu68j@helios>
References: <1381765192-3697-1-git-send-email-andrea.adami@gmail.com>
	<5529742.8LBZEpu68j@helios>
Date: Mon, 14 Oct 2013 18:24:38 +0200
Message-ID: <CAAQYJAsvGqFZB7CjEc2txSfCxFuesk8AXqhER_EQAe7rknTe=Q@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH] h3800.conf: fix MACHINE_FEATURES
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
X-List-Received-Date: Mon, 14 Oct 2013 16:24:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Oct 14, 2013 at 5:54 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Monday 14 October 2013 17:39:52 Andrea Adami wrote:
>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ---
>>  conf/machine/h3800.conf | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/conf/machine/h3800.conf b/conf/machine/h3800.conf
>> index 0c3cf15..53f3940 100644
>> --- a/conf/machine/h3800.conf
>> +++ b/conf/machine/h3800.conf
>> @@ -2,7 +2,5 @@
>>  #@NAME: Compaq iPAQ 38xx
>>  #@DESCRIPTION: Machine configuration for the Compaq iPAQ 38xx devices
>>
>> -#this machine will be primarily focussed on the 2.6 port
>> -MACHINE_FEATURES = "touchscreen apm alsa pcmcia bluetooth irda usbgadget
>> screen vfat qvga" -
>>  require conf/machine/h3600.conf
>> +MACHINE_FEATURES += "pcmcia bluetooth"
>
> I don't particularly like this. I'd rather these files stay separate for now.
>
> Cheers,
> Paul

I understand but see, the include resets the MACHINE_FEATURES as-it-is...

Cheers

Andrea

>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

