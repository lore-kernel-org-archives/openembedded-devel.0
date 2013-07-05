Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by mail.openembedded.org (Postfix) with ESMTP id CB92F6AFF4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 17:34:58 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id i4so3637343oah.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jul 2013 10:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=oWbQfliKbjsev5ket4wj/YfNH5y/M3lGgTBypzRHMig=;
	b=0TbGFw8eccE3x5zxbEgljXZgBCvcQ3dOUcBSwbaGK5GIoEMMKZV21yU06gz7rcB1gh
	0P6WusqIzqlKH9I1OGvQUQ/1h9UkieW3R64JdOLEBJ8Nl4COj7m+z7ub70pUGcFDj2FZ
	w+aYT1cfZL0QC3rsMzYy6sdMyE8ZcFqMuOz0Xf6LNFTeCr83gzqqJ2gI0k7bCRikH7Td
	K058L9WCqmi7CSviVptP1IfYYs6HYg8u1Fcx/yj8IUpUTV/7alX+Z5mcn5uJTonXVa44
	xPJXT7GGb9/zXtqxMET4RYHe6o1AUj8BzrWIpwZMH0rcL5bSFuexdpwv5bnVIGiSrzik
	wADg==
MIME-Version: 1.0
X-Received: by 10.182.105.99 with SMTP id gl3mr12183451obb.94.1373045699485;
	Fri, 05 Jul 2013 10:34:59 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.60.166 with HTTP; Fri, 5 Jul 2013 10:34:59 -0700 (PDT)
In-Reply-To: <2710952.otpci6RPJ6@helios>
References: <1373043676-5621-1-git-send-email-otavio@ossystems.com.br>
	<2710952.otpci6RPJ6@helios>
Date: Fri, 5 Jul 2013 14:34:59 -0300
X-Google-Sender-Auth: 8DgUTFHFnA6LX3mK1sMuGT-Pfy0
Message-ID: <CAP9ODKrRru3dQZLHn4RwWeaKimNPFMfzkjSrZXa48-JwR_rLhw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe PATCH] busybox: Follow OE-Core update to 1.12.1 version
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
X-List-Received-Date: Fri, 05 Jul 2013 17:34:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 5, 2013 at 2:29 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Friday 05 July 2013 14:01:16 Otavio Salvador wrote:
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>  .../busybox/{busybox_1.20.2.bbappend => busybox_1.21.1.bbappend}        | 2
>> -- 1 file changed, 2 deletions(-)
>>  rename meta-oe/recipes-core/busybox/{busybox_1.20.2.bbappend =>
>> busybox_1.21.1.bbappend} (91%)
>>
>> diff --git a/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
>> b/meta-oe/recipes-core/busybox/busybox_1.21.1.bbappend similarity index 91%
>> rename from meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
>> rename to meta-oe/recipes-core/busybox/busybox_1.21.1.bbappend
>> index 721ef19..7a2f0c3 100644
>> --- a/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
>> +++ b/meta-oe/recipes-core/busybox/busybox_1.21.1.bbappend
>> @@ -1,5 +1,3 @@
>> -PRINC := "${@int(PRINC) + 1}"
>> -
>>  # look for files in the layer first
>>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>
> Could someone *please* figure out what this bbappend is needed for and get it
> into OE-Core if it is still needed so we can drop it here?

I agree; the changes here are easy to upstream but without a PRINC
here it can be done when someone finds the time.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

