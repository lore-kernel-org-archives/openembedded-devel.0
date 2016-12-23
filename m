Return-Path: <asselsm@gmail.com>
Received: from mail-yb0-f193.google.com (mail-yb0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id EB36660778
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 04:14:48 +0000 (UTC)
Received: by mail-yb0-f193.google.com with SMTP id d59so3773533ybi.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 20:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=Mz4NrRnGqXnX545G01kK7bmELD0HvkpXEcHpRsUCHts=;
	b=IKJLCX892ReJoTlYZE+eM9cOYk+9iJ/y+7QFTL1vVInx1K2bLIHdytwDiEyIiZGjSb
	8N1hHjIcFX1vEcJyzcNrvc6QD4ONn5ffkDtjVk9hPtVA5TwjJ/Cu2SQtRJFoxvfXjulU
	zR2ma2aYIVuRHDNWxvu8uM7RSkdUzpSu9m4ByJJyKhwxRiZuuSZlOWo9kb5tR2lX79E/
	4sIgkJY7dn1oJz2onTXEY6rDLTOJF4G7l01LyNVbzw4pRqgs8k2er619RikbzU7ESFtP
	3KXDvtG+nzY56JjwfzyrE8O1aHBPnr3C0RiU/s4wxubPOIWls7X8+zdcgTb8qkpV0G9y
	IJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=Mz4NrRnGqXnX545G01kK7bmELD0HvkpXEcHpRsUCHts=;
	b=KkvoF3PRklMSFUryDf9wLMxmQ90IGsTZsb/IWOagMZ/tfBmHpcas2V7daA7Ck1ioo0
	UrcW20t59Fb4wuVX3X1RhPxZ9L08RaxIc7Q7zjYQAvTrMXCTziJuAz5TRPF9qA9X+c/4
	+BYNpF6FlYtbFHek6pilBAeyDopKXRc4gCBQFKQr2QexGeke0xXiPEeLTCKxPUqmsDGE
	BEqpBDfuq5p5QxH8030U0S7ybsDlqqrxzdMPvifPhEdG3ewGVMBw/MgrMPN98vhd/EPv
	hFLeIiT4o+7kicBZTbs6BkGbHNK8gSFVOCoMfkltJQqkEj9vpnRcixCXLqOIwl5vCH3p
	J/LA==
X-Gm-Message-State: AIkVDXI1+YKgLUi5OcUki0LJ4PyDFPAz4Du/QEqviGAeIXha4r+CF3k9IjoU9DS+adQ4/4NW2USOsuu/oO5EcA==
X-Received: by 10.37.177.138 with SMTP id h10mr9000007ybj.115.1482466489438;
	Thu, 22 Dec 2016 20:14:49 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.171.82 with HTTP; Thu, 22 Dec 2016 20:14:49 -0800 (PST)
In-Reply-To: <CABcZANmtther94ZrkEwVn=JYgvLkT2CdTkCLSJPDo7gEHFdaCA@mail.gmail.com>
References: <1482357220-422-1-git-send-email-mark.asselstine@windriver.com>
	<CABcZANmtther94ZrkEwVn=JYgvLkT2CdTkCLSJPDo7gEHFdaCA@mail.gmail.com>
From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Thu, 22 Dec 2016 23:14:49 -0500
X-Google-Sender-Auth: 1JfbuMCKyrFeuKcEIWJbkwSzpnI
Message-ID: <CAPuovEK2+wPSeOzNxAipU_mDYDG9=CbaQ7M0q8-tCVv0i2VnNA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>
Subject: Re: [meta-webserver][PATCH] apache2: the download has been moved to the 'archives'
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
X-List-Received-Date: Fri, 23 Dec 2016 04:14:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 21, 2016 at 5:26 PM, Christopher Larson <clarson@kergoth.com> w=
rote:
> On Wed, Dec 21, 2016 at 2:53 PM, Mark Asselstine <
> mark.asselstine@windriver.com> wrote:
>
>> This release of apache2 is no longer found in the main downloads area
>> but has been moved to the 'archives'. We should uprev apache2 but for
>> now this will at least get the builds working again.
>>
>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>>
>
> Wouldn=E2=80=99t it make sense to do a recipe-local addition to MIRRORS t=
o
> automatically fall back to the apache archive?

Not something I thought about but as long as I can find an example I
am fine adjusting my approach.

Mark


> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

