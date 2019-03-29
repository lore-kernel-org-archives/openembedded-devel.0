Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id DFE0F7C5C0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2019 05:09:31 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id f18so782043lja.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2019 22:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QIG0CrNr7uHLWUHxNz1j60nAbqQoe0A0Ceog8Zqa6c4=;
	b=JzbMR099CuGhVJFM+lWPrDuw23dmIEebQI42z6DSaY9mzbx56rhgAmlECoX2LdKtoI
	zarkZHljZueP5tzyow/FVdnT7zZGrgK7PtRgHxGeVES5eIsw8G1beTE5Nejy0nxtqxpa
	o0ClYgvXZTnllNDm2NkwVSv/DhrlMGFWM/415A8DsupAY/aD/f0hzH3nWdzMD9rz7e3E
	p7M07h5AXQYZstyw/7bLZ24v2kAYwDbCJ+Zmf68TcvUuN0UHPhfmolGcpBPcLxBnUNQd
	cUbFmxHIFrvddx8+wv5DHoxAOuYZv4SEtvqJgL3xfOqA67x2nHL9Lf/AjV3KmFCXV+3k
	dbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QIG0CrNr7uHLWUHxNz1j60nAbqQoe0A0Ceog8Zqa6c4=;
	b=KBfBRlaQQdDPT3sQLMm7mMofv8xG7piRI/CZMqdhuLaG7jSCCtx3b3OBzochFBORUF
	6wP+3Qql5sxKlT776MerUKA0vNOeGo3pFbgkWcqQTpiYRDivuPz7Eykbvr5CB2tvvLVf
	wvSHGPjUaIkbg6gg9HWNSPSHRp9IuhnhYjanHCdLLSyrlu31OYAzCRBQLlruKQqHExJe
	55Sdv43XI05tyxOmcsCxQvN1JZvEpNnDhz6LLn/oYFADZpHXDBamLAzPXIgL+WAiClNk
	unh57F3t1LkG2bSAppnYGrM/g7jgWYwL6A5j7ohh5nWPc1FyMbNP4gmnWY2pDJHplAYb
	SHHg==
X-Gm-Message-State: APjAAAWqMypnF+PtrFIPyQi5Txllsy3VPzQu41ZRyxuIwZz8MwDvFVGs
	t/hwJeDm8hZNN59c062dfdAXO6zIyNBi1GitxWY=
X-Google-Smtp-Source: APXvYqyR1iZaCabA/4FOpXPUvEDpPVT+CN+2ZdSanyOKm5AYmB6PD1juQIYBtABGko0/SkmWkL7fzO0Lywpb4K1+nbU=
X-Received: by 2002:a2e:85d2:: with SMTP id h18mr24414135ljj.128.1553836172458;
	Thu, 28 Mar 2019 22:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190329044956.32426-1-alistair@alistair23.me>
	<CANx9H-BkM_B=C14448U_+yOLPEVwBCVYCa-uX-ENY+XnThLQGw@mail.gmail.com>
In-Reply-To: <CANx9H-BkM_B=C14448U_+yOLPEVwBCVYCa-uX-ENY+XnThLQGw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 28 Mar 2019 22:09:04 -0700
Message-ID: <CAKmqyKPVFE2MY+axxm9fJwpT+Eoc=OAvYRcgvzAfg7g6UQss0w@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] meta-python: Initial commit of Python3 OBDII module
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
X-List-Received-Date: Fri, 29 Mar 2019 05:09:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 28, 2019 at 10:04 PM Tim Orling <ticotimo@gmail.com> wrote:
>
>
>
> On Thu, Mar 28, 2019 at 9:50 PM Alistair Francis <alistair23@gmail.com> wrote:
>>
>> Signed-off-by: Alistair Francis <alistair@alistair23.me>
>> ---
>>  meta-python/recipes-devtools/python/python-obd.inc       | 9 +++++++++
>>  meta-python/recipes-devtools/python/python3-obd_0.7.0.bb | 2 ++
>
>
> Latest version. Ack.

Thanks

>
>>
>>  2 files changed, 11 insertions(+)
>>  create mode 100644 meta-python/recipes-devtools/python/python-obd.inc
>>  create mode 100644 meta-python/recipes-devtools/python/python3-obd_0.7.0.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python-obd.inc b/meta-python/recipes-devtools/python/python-obd.inc
>> new file mode 100644
>> index 000000000..f2caf6491
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-obd.inc
>> @@ -0,0 +1,9 @@
>> +DESCRIPTION = "A python module for handling realtime sensor data from OBD-II vehicle ports"
>> +HOMEPAGE = "https://github.com/brendan-w/python-OBD"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://README.rst;md5=2988a5e913eb105fa08011135c4157d4"
>
>
> Readmes tend to change in ways not really useful from license standpoint. Why not just use the LICENSE file provided in the repo? Or is it not included in the tarball?

It's not included in the tarball unfortunately.

>>
>>
>> +
>> +SRC_URI[md5sum] = "93e04f825e13b7ebc97d06b6a6407807"
>> +SRC_URI[sha256sum] = "4b1bac95df2faac571ebf444778e4d736d050d8ed7049023c0fc929a520eba6d"
>> +
>> +inherit pypi
>> diff --git a/meta-python/recipes-devtools/python/python3-obd_0.7.0.bb b/meta-python/recipes-devtools/python/python3-obd_0.7.0.bb
>> new file mode 100644
>> index 000000000..578e38d3a
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-obd_0.7.0.bb
>> @@ -0,0 +1,2 @@
>> +inherit setuptools3
>> +require python-obd.inc
>
>
> A python2 version should be trivial, although we should be moving towards python 3 only... so I am ok with leaving python 2 up to someone who needs it.

It does support Python2, but with less then a year to go of support it
didn't seem worth adding.

Alistair

>
>>
>> --
>> 2.20.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

