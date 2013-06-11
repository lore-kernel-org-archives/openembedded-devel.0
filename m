Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 957B66A9C0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 07:51:53 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id k5so12409692iea.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 00:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=VtDtn2BOaAIZ7a5DKYKlKaOuuLNUEiRYSBzqLRlb8do=;
	b=Ny7eA3vTWqUd0DyzRta7ocjDTwtDgW2T0vlaG4rJYASYVsLuUfz9Yj+6S/cZbzTaSP
	vYv80q8OpxY8gdFDixwcE13kv70EwHeGt3mxoQThDlbetpu2AFYbeqHmobYIKKwzH26G
	ZD5IDmIa1CbOSh/xRU4pRmKhwNUopnK1rYDpczUP2GzxvhkPJf2wZ/zu/1VuRyrfWfX/
	aWM+KJZxKvU3+iua9XzQ7exc1FYchKIoaWb3kn0ArMKg6iaVa5em94sIr9MYTbkc5Yph
	grrl0yla8XBuY+z4EjrAg5ATgHbZAjHwYYSL8r0xCehiQTDKsGUk9MaxYspwdqXJb1OU
	xZsA==
X-Received: by 10.50.6.51 with SMTP id x19mr310178igx.78.1370937114404; Tue,
	11 Jun 2013 00:51:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.137 with HTTP; Tue, 11 Jun 2013 00:51:24 -0700 (PDT)
In-Reply-To: <07c501ce611b$ea241e90$be6c5bb0$@oss.bmw-carit.de>
References: <1370297534-9882-1-git-send-email-danismostlikely@gmail.com>
	<07c501ce611b$ea241e90$be6c5bb0$@oss.bmw-carit.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jun 2013 00:51:24 -0700
Message-ID: <CAMKF1sqU=kU7QN3mdwYK4Tey-LdHzzYUHkzLE_4PyxUnPT=FaQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe-core][PATCH] Make Python IPv6 aware
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
X-List-Received-Date: Tue, 11 Jun 2013 07:51:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 4, 2013 at 5:06 AM, Lukas Bulwahn
<lukas.bulwahn@oss.bmw-carit.de> wrote:
> Hi Dan,
>
> in my layer, I simply activate IPv6 support for python with a simple
> bbappend file:
>
> https://github.com/bmwcarit/meta-ros/blob/master/recipes-devtools/python/=
pyt
> hon_2.7.3.bbappend

the patch is worth it only thing is it needs to go to right ml with
Pauls comments addressed

>
> Lukas
>
>> -----Urspr=C3=BCngliche Nachricht-----
>> Von: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] Im Auftrag
>> von danismostlikely@gmail.com
>> Gesendet: Dienstag, 4. Juni 2013 00:12
>> An: openembedded-devel@lists.openembedded.org
>> Betreff: [oe] [oe-core][PATCH] Make Python IPv6 aware
>>
>> I found that gateone would crash with a socket error when Python isn't
>> compiled with IPv6 support. This patch enables it when DISTRO_FEATURES
>> includes ipv6.
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

