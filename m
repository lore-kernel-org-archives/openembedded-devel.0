Return-Path: <pauldotknopf@gmail.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0673D77E06
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jun 2017 18:41:47 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id p66so62518291oia.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jun 2017 11:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Q+cZobNVfBBu1kqjXbke6EZauOiB+IaQx/HZI8zq408=;
	b=gB3TlzOupNtiKzy/Y6TrfeFxheRgpxnUAJKn83fQhNC0r+g6O6dN9FFaFZ7ay7w6oj
	UZ3vXV0eIm/1WCPg/mWvMDZ6lWGp7/CWqRH+e+dcsJapIZ3k0g/nEZHHpayWdRn/BFcQ
	tUwPFNb/GDT++JUfGV3KWx5/rBOOuQ47xkmXwVSCFLNyV1+PUOFUo0XACChMkl/pqowU
	x0zBd3i0KoWmB8P9TGrQPA2GmPrQY63IONtv9rvqFMopnGiXwbHlQ3+KzpbZaSOq0iGE
	zOwxh6cqme2znr3Zu7uSW5s9gBShpAeXH1qaN0ifhH3K6l5vUKE5Ml80trEfsrDQVDkt
	5hwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Q+cZobNVfBBu1kqjXbke6EZauOiB+IaQx/HZI8zq408=;
	b=MDCPJHVPA/VR6WuHS/VR1+l0DRSPtU1bINUUWQ7bOHzBKCXREakqAeC4MAkiQ2qez3
	5MzHz3+J1w1Wj4fI0wc7A5auGAwD3UQSh/BE4vlRGOztNZ2fyp3Imu1NRZiP9lcZTHRb
	q25CUYhbwOk3+cXlVMrWGxVgFc/Qp+OEmruqig0qBoL5MyBRJ0tU21AMF4uI0/Ntc0+a
	tJsInAcs9qQHnl3iXFZtC2g3AX0xhfN7O3Ew4Woanw9pxn5/Wr0+/I+Xsnl3bVrDMqxT
	V+nWy/OtUcFfFVI6ZPqlS9gXNj2ZTi14SznHM+xGM9DexnQZDOVmiomOaeE0m1l/CjY7
	p1Wg==
X-Gm-Message-State: AKS2vOyY0jo0ONJagfueyD79sNLXW7rbNnuq14kW2o3lxFJLPm6+rRXM
	If/JvFGyKgkoXmo5mOpQWU6wckZjzA==
X-Received: by 10.202.224.134 with SMTP id x128mr19225866oig.31.1498070508016; 
	Wed, 21 Jun 2017 11:41:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.139.150 with HTTP; Wed, 21 Jun 2017 11:41:47 -0700 (PDT)
In-Reply-To: <CA+chaQe1aL95ioVkxrfaWvDz9LuyAJhr62gPiwt1caXgMatmqg@mail.gmail.com>
References: <CAKmWj-1-sXNeNBJpO1uzF+8q7sFjS3XO4m=hQL3CDa10T2H99w@mail.gmail.com>
	<CA+chaQe1aL95ioVkxrfaWvDz9LuyAJhr62gPiwt1caXgMatmqg@mail.gmail.com>
From: Paul Knopf <pauldotknopf@gmail.com>
Date: Wed, 21 Jun 2017 14:41:47 -0400
Message-ID: <CAKmWj-3PvhwPsWSshn=Ud2BOoGYLc0YCRTZm8AmXxTzUS1_z2g@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Connor Flaat <cflaat@medxchange.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-qt5 nothing provides qtdeclarative-plugins
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
X-List-Received-Date: Wed, 21 Jun 2017 18:41:48 -0000
Content-Type: text/plain; charset="UTF-8"

I'm not familiar with the qt5 build process. Do you know what PACKAGECONFIG
I need to enable?

https://github.com/meta-qt5/meta-qt5/blob/3ae86cb/recipes-qt/qt5/qtbase_git.bb

On Wed, Jun 21, 2017 at 2:37 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> My guess is that you're missing a few qtbase PACKAGECONFIGs.
>
> On Wed, Jun 21, 2017 at 8:15 PM, Paul Knopf <pauldotknopf@gmail.com>
> wrote:
>
>> When I try to use "packagegroup-qt5-qtcreator-debug", I get this error.
>>
>> nothing provides qtdeclarative-plugins needed by
>> packagegroup-qt5-qtcreator-debug-1.0-r0.noarch
>>
>> I am using poky/pyro, with meta-qt5/master
>> (3ae86cb32edd1449f702e0a094929ae9b21ce191).
>>
>> I checked the build/workspace directory for this recipe, and indeed, no
>> files are being put into the qtdeclarative-plugins package. The build
>> directory contains no plugins directory.
>>
>> I checked the morty branch and some "plugins/qmltooling/libqmldbg_*".so"
>> files were being placed inside of the "qtdeclarative-plugins" package.
>>
>> Does the "packagegroup-qt5-qtcreator-debug" need to remove the
>> "qtdeclarative-plugins" dependency, or does the qtdeclarative recipe need
>> to be fixes to include plugins in the build output?
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

