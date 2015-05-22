Return-Path: <vomegaz@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 88EF4609B2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2015 12:50:18 +0000 (UTC)
Received: by wgfl8 with SMTP id l8so16875741wgf.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2015 05:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=OQsxJd7cMcK1j+IGaxFq8KKHK++scgjHG56ZbzCaSfM=;
	b=weEyfQEuits+pkJFWjDcutq/k5o7WoOAoxQVJqtKQZzlpc/k+a/FDSp1KEKRjOfrXr
	1HZ/MN5w6J03k9nV+TkcNUmfqyQ+68qHl5gdzLRXYSnc2x/ajR8kTi6Ev9YPP2AfjRH2
	C+qeMlSDNqj+TkqWhlF2dmn0XdTU8TYeb4QJFv4l/obNEvbX/0mY4Y24k7vTj5RZqiWk
	ZCvYrnaXQbSKN0csuTTsVbIi3UftAFRcNc5UjGDGH5mtWWpn8sm5QeSisH3E30Os5lAH
	1RRayndBTz4D3hq+cHx1P2m8kCvFl+8w0Kiwf00ufNvKcSs2R0PLoXEp2HWrW+eoPNQp
	ZNtg==
X-Received: by 10.194.173.40 with SMTP id bh8mr14212942wjc.99.1432299019188;
	Fri, 22 May 2015 05:50:19 -0700 (PDT)
MIME-Version: 1.0
Sender: vomegaz@gmail.com
Received: by 10.28.9.73 with HTTP; Fri, 22 May 2015 05:49:38 -0700 (PDT)
In-Reply-To: <555F11B1.4060600@mlbassoc.com>
References: <1432289074-1358-1-git-send-email-thomas.perrot@tupi.fr>
	<555F11B1.4060600@mlbassoc.com>
From: Thomas PERROT <thomas.perrot@tupi.fr>
Date: Fri, 22 May 2015 14:49:38 +0200
X-Google-Sender-Auth: 8tzV53t2Qxsn5AR7hROFMEhtySY
Message-ID: <CAGXeWgmdmiY0eVzpBKLbxp1QCZGSQ9HuF20PRD8ew9x96+fuug@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "[meta-raspberrypi] yocto"@yoctoproject.org
Subject: Re: [meta-raspberrypi][PATCH] If SERIAL_CONSOLE is already define by another layer, this value may not be good.
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
X-List-Received-Date: Fri, 22 May 2015 12:50:21 -0000
Content-Type: text/plain; charset=UTF-8

Hi Gary,

I know it is incorrect to define this variable in a no machine layer
but that can be possible.

For example, by using the meta-systemd layer, the recipe
systemd-serialgetty define SERIAL_CONSOLE, so when the raspberrypi
machine layer is applied, the SERIAL_CONSOLE isn't changed and the
value is invalid.

I know that it's incorrect for the meta-systemd layer to define this
variable, so I have submit a another patch to fix it.

But I think replace "?=" by "=" in raspberrypi machine layer is more robust.

I also send this patch on the rpi mailing list.

Best regards,
Thomas P.

On Fri, May 22, 2015 at 1:23 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2015-05-22 04:04, Thomas Perrot wrote:
>>
>> Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
>> ---
>>   conf/machine/include/rpi-base.inc |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/conf/machine/include/rpi-base.inc
>> b/conf/machine/include/rpi-base.inc
>> index a26803a..1dda207 100644
>> --- a/conf/machine/include/rpi-base.inc
>> +++ b/conf/machine/include/rpi-base.inc
>> @@ -7,7 +7,7 @@ include conf/machine/include/soc-family.inc
>>
>>   IMAGE_FSTYPES ?= "tar.bz2 ext3 rpi-sdimg"
>>
>> -SERIAL_CONSOLE ?= "115200 ttyAMA0"
>> +SERIAL_CONSOLE = "115200 ttyAMA0"
>>
>>   XSERVER = " \
>>       xserver-xorg \
>>
>
> Firstly, this should go to the RaspberryPi list (CC'd), not here.
>
> How can this value, which is only ever defined in this file
> when using MACHINE=raspberrypi* be affected by another layer?
> Is there is another layer which is defining this variable
> outside of the MACHINE .conf files, then that layer is incorrect,
> not this one.
>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

