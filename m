Received: from mail-la0-f43.google.com ([209.85.215.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1URfr9-0003bP-1C
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 11:37:54 +0200
Received: by mail-la0-f43.google.com with SMTP id eg20so3374455lab.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 02:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=KoZIvQ38n0kQl/BpTWcaUoF3rYTL1ST7CITTQDrO3Oc=;
	b=m6AY9Tw/0bwWfcMAd0gHB69ULwMiodesRFMET3bnwlia1GCRvLxbDUpdS6J9usS/z4
	sT8zxc8MU/dSdaaRyvepT6iDUaIIN7AWCAqx22B9ymWYALUu7MHXhX0Q5pUL0Xto7nAL
	Gu8KPGHRMgagdmzbL9GURXmj1aD/idQ1cNiv1cugISN28J7Ezz+hKlYFV9+SQ2B2dYkD
	YXVq133fmrMSw0t/6avUJG6DcwmS6pcLBCYSscgIaPh1mFWjHnjV1177NlCVFQ09cCpB
	cRfV56knDNCgoTSnB01sXVs//60BF7364dDNjKj7E7C/Rc9d5zgpoyQQAn2mJl/iKYv8
	7nYw==
MIME-Version: 1.0
X-Received: by 10.112.132.166 with SMTP id ov6mr9906769lbb.71.1366017618438;
	Mon, 15 Apr 2013 02:20:18 -0700 (PDT)
Received: by 10.112.5.130 with HTTP; Mon, 15 Apr 2013 02:20:18 -0700 (PDT)
In-Reply-To: <20130414184047.GJ2475@jama>
References: <1365961831-6466-1-git-send-email-andrea.adami@gmail.com>
	<20130414184047.GJ2475@jama>
Date: Mon, 15 Apr 2013 11:20:18 +0200
Message-ID: <CAAQYJAuk0bW6Sg871Zs__PhcTLZq04xJtGJN8VYKuciZxVAnbg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH] linux-yocto_3.8: remove patch already upstream
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2013 09:38:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Apr 14, 2013 at 8:40 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sun, Apr 14, 2013 at 07:50:31PM +0200, Andrea Adami wrote:
>> * the spitz_pm patch was pushed upstream with commit
>> * id 510fcb0d331f314cd20d0067d56f29302846f47b
>> *
>> * remove it to unbreak do_patch
>
> Now it builds with latest oe-core, but still doesn't boot for me.

There is an outstanding regression due to the power regulators rework:
boot from SD/CF card is atm impossible on pxa Zaurus (and on collie
too, until refresh of thesing's locomo_spi patch). We are working on
it.

Thanks for your testings

Cheers

Andrea

>
>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ---
>>  .../linux/linux-yocto-3.8/akita/akita.scc          |  1 -
>>  .../linux/linux-yocto-3.8/spitz/spitz.scc          |  1 -
>>  .../linux/linux-yocto-3.8/spitz_pm.patch           | 53 ----------------------
>>  3 files changed, 55 deletions(-)
>>  delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/spitz_pm.patch
>>
>> diff --git a/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc b/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
>> index e1549ef..bad38c4 100644
>> --- a/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
>> +++ b/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
>> @@ -6,6 +6,5 @@ include ../zaurus-common.scc
>>  include ../zaurus-usb-host.scc
>>
>>  patch sharpsl_param.patch
>> -patch spitz_pm.patch
>>  patch pxa27x-sa1100-rtc.patch
>>  patch spi-pxa2xx-fix-mem.patch
>> diff --git a/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc b/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
>> index fe6aac8..f9f9381 100644
>> --- a/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
>> +++ b/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
>> @@ -5,6 +5,5 @@ include ../zaurus-common.scc
>>  include ../zaurus-usb-host.scc
>>
>>  patch sharpsl_param.patch
>> -patch spitz_pm.patch
>>  patch pxa27x-sa1100-rtc.patch
>>  patch spi-pxa2xx-fix-mem.patch
>> diff --git a/recipes-kernel/linux/linux-yocto-3.8/spitz_pm.patch b/recipes-kernel/linux/linux-yocto-3.8/spitz_pm.patch
>> deleted file mode 100644
>> index 34bcb9d..0000000
>> --- a/recipes-kernel/linux/linux-yocto-3.8/spitz_pm.patch
>> +++ /dev/null
>> @@ -1,53 +0,0 @@
>> -Subject: [PATCH] [ARM] pxa/spitz_pm.c: Fix hang under certain conditions when resuming from STR.
>> -
>> -Devices that use spitz_pm.c will fail to resume
>> -from STR (Suspend To Ram) when the charger plug is inserted
>> -or removed when a device is in STR mode. The culprit is
>> -a misconfigured gpio line - GPIO18. GPIO18 should be configured as a
>> -regular GPIO input but it gets configured as an alternate function
>> -GPIO18_RDY. And then later in postsuspend() it gets configured as
>> -a regular GPIO18 input line.
>> -
>> -Fix this by removing the GPIO18_RDY configuration so that GPIO18
>> -only gets configured as a regular gpio input.
>> -
>> -Signed-off-by: Marko Katic <dromede@gmail.com>
>> ----
>> - arch/arm/mach-pxa/spitz_pm.c |    8 ++------
>> - 1 files changed, 2 insertions(+), 6 deletions(-)
>> -
>> -diff --git a/arch/arm/mach-pxa/spitz_pm.c b/arch/arm/mach-pxa/spitz_pm.c
>> -index 438f02f..842596d 100644
>> ---- a/arch/arm/mach-pxa/spitz_pm.c
>> -+++ b/arch/arm/mach-pxa/spitz_pm.c
>> -@@ -86,10 +86,7 @@ static void spitz_discharge1(int on)
>> -     gpio_set_value(SPITZ_GPIO_LED_GREEN, on);
>> - }
>> -
>> --static unsigned long gpio18_config[] = {
>> --    GPIO18_RDY,
>> --    GPIO18_GPIO,
>> --};
>> -+static unsigned long gpio18_config = GPIO18_GPIO;
>> -
>> - static void spitz_presuspend(void)
>> - {
>> -@@ -112,7 +109,7 @@ static void spitz_presuspend(void)
>> -     PGSR3 &= ~SPITZ_GPIO_G3_STROBE_BIT;
>> -     PGSR2 |= GPIO_bit(SPITZ_GPIO_KEY_STROBE0);
>> -
>> --    pxa2xx_mfp_config(&gpio18_config[0], 1);
>> -+    pxa2xx_mfp_config(&gpio18_config, 1);
>> -     gpio_request_one(18, GPIOF_OUT_INIT_HIGH, "Unknown");
>> -     gpio_free(18);
>> -
>> -@@ -131,7 +128,6 @@ static void spitz_presuspend(void)
>> -
>> - static void spitz_postsuspend(void)
>> - {
>> --    pxa2xx_mfp_config(&gpio18_config[1], 1);
>> - }
>> -
>> - static int spitz_should_wakeup(unsigned int resume_on_alarm)
>> ---
>> -1.7.4.1
>> --
>> 1.8.1.5
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


