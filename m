Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5FCAA74DB1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 21:05:37 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id az12-v6so5252422plb.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 14:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Oo2aBxdXZkUC3trmeXpK0Lp0deI1AXgtBEzcLqVAV00=;
	b=NNvR/JK9VotWnQjE9ODSxJlBXLsIfVHJn84ryLsodFqfGHwfpO/2Y1uufaiFBN2yZe
	fR4s8wl3yDHs7IUxdd3nFu2/jhREmlyOd8vziNZPFXuRo+/C6FHmzj9tIqpyKjGD2q/+
	nl88GDuLh7B3dZ4Te9I/OpOh2iU9htTFENoZrxuTFBhrKKvMSA27pC4QCZdWEf54prAj
	RwA1744CHVFZDZsRlUhqx3/LwyxIZledL0txpxyJAAdMzsN7KKLH3aitIklJSwULYF5X
	wHM/6mS5Az2820pPa/n/exTK4ZTgmDWIfh0NgI96S1AI8869HQRUC76UEZuCh5gJqOS9
	9g4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Oo2aBxdXZkUC3trmeXpK0Lp0deI1AXgtBEzcLqVAV00=;
	b=hLcru6Bo4CF3We/wnm4Azgdne1liMai6dj3pHvwk6r/MiSxOsAFIZl9VW6ErhEieGc
	Kc1iNzNQT2dYBxqdeyTYuY9CGBtnN3ahawWR+mtAdXtadBo1Ka6Wc8h1RV25Nb5Nfo2o
	RupqCcByvlim/Xg281aOAJGSkv1IJW3u7SRqJVDwLBe8swZzRhYMP455GIbJ7xhwkDeQ
	iFv8bnxwvEZ8B6oLAW8I332FxX+jRnhXo9kB12+Xgsn+N5K1saX5dpc49FT5U3/f3Wxa
	BIhG6Pj9/r8fCfYJXyi2VI6BLs6KE1ySomxql8u9dap0C0K511CIMLB3YEleZFxFYU64
	ZA+g==
X-Gm-Message-State: ALKqPwetVmFjuZogj5cEmEadRhOFVzPwX2gYjaEMbYieipWQ+K3IDzSI
	iXE5w8NPK5WzASzjR/IvAfYZ7mE7qk+DisMkgJk=
X-Google-Smtp-Source: AB8JxZooJRp63VOVOG3kJHJBVzANeWbt3da2DVHJMdvhSdS0C7DgFGaUoBJaKNZnMpy99k/vF30jO5+9P7mwHGgN57E=
X-Received: by 2002:a17:902:10c:: with SMTP id
	12-v6mr11102843plb.252.1526677538869; 
	Fri, 18 May 2018 14:05:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:8b91:0:0:0:0 with HTTP; Fri, 18 May 2018 14:05:08
	-0700 (PDT)
In-Reply-To: <de72c540487e4c0298a8fcad894a00d4@XBOX02.axis.com>
References: <20180518200554.30205-1-raj.khem@gmail.com>
	<20180518200554.30205-2-raj.khem@gmail.com>
	<de72c540487e4c0298a8fcad894a00d4@XBOX02.axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 May 2018 14:05:08 -0700
Message-ID: <CAMKF1srUEUz+5d7vNCQgv8J1DXXBbT44intPH1QLPE2AHZ69VQ@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] stm32flash: Fix packaging errors
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
X-List-Received-Date: Fri, 18 May 2018 21:05:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 18, 2018 at 1:43 PM, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Khem Raj
>> Sent: den 18 maj 2018 22:06
>> To: openembedded-devel@lists.openembedded.org
>> Subject: [oe] [meta-oe][PATCH] stm32flash: Fix packaging errors
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb b/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
>> index d401981ff9..59bd1b60e1 100644
>> --- a/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
>> +++ b/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
>> @@ -1,16 +1,16 @@
>>  SUMMARY = "Open source flash program for STM32 using the ST serial bootloader"
>>  HOMEPAGE = "https://sourceforge.net/projects/stm32flash/"
>>  BUGTRACKER = "https://sourceforge.net/p/stm32flash/tickets/"
>> -LICENSE = "GPLv2"
>> +LICENSE = "GPL-2.0+"
>>  LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>>
>> -inherit autotools-brokensep
>> -
>>  S = "${WORKDIR}/${PN}"
>
> I missed it in my comments, but Anuj had already pointed it out,
> That ${PN} above should be changed to ${BPN}.

right, I will do that in v2

