Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2BFE6787D0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jan 2018 12:32:24 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id d13so7441963iog.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jan 2018 04:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x19dYJD8FD45H3qwcLao9HVhDhwRGFx23Ud5oCowpl0=;
	b=ACk6o0t2z/g6yKk7djJFwOPcpDpnBl0mjBHRTy9r1L9y9fhepeiSP1NgButpqyleHB
	BgGfXxZ6buX3yPljTeURCFNpGAre0vAOIH6YsYWWpOplkuSO8zCb24KBaiqPqd7TDxrW
	I2XTvtTWQfNG1hywjCow2GuWHcPI1N+ZF3NdeA6kFDFExUS0gDqQ/5d23cJhB2QaDgmn
	7xYpwS0+WaO+9E4oxUMfJvyZglNG20YSBIcE9ARI+CTwVJWwq3BErCnNz5n/YQBFkZIP
	JlBKtw1BBfSPUtRFsEdd3K3thS4CzqX2E3/pLua+BA8U8naXnviIqQeq69MD1Dl189Gg
	Ftig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x19dYJD8FD45H3qwcLao9HVhDhwRGFx23Ud5oCowpl0=;
	b=DVOy0IchcwQCxyBlXMnot35TTv3jV1YLGcdkFsFsEY4C3IQkvg6lQMQVz1aZ0DrtWT
	YXRbsoPWYSecsRhs/OuIhq1++9CExHSDtVrORqxPh9shzCnQzaZCxUNetyYHzw3u1tkG
	khIENwQocwOETzMpYIRAiy5Hd27JzY43Fp1XMpxKFv+lQI2iMEkNaH/6NPIeu83rGnM/
	BZ2ktEqiLlXmtSbzwWa3C2W1dS9XNaH5aKNQbfwiQo6D9lci4H5Gghi1eulHv7nAMMmI
	6E48UDMaI7Z1FbBb7u8lHLhLr8ht+TxLfNaOXZ69i2hloZiqeXoYQLtLkSMsFfnYITAH
	wwHQ==
X-Gm-Message-State: AKwxytf+3iiYUXZkUXpL5bh55hQiP2Q5See5Edd3IbNvi+sfEE2RxC3+
	NbC43y3h/Pvw/1rE7NxcBeQU6+u1HJDUPlOLmFBFfQ==
X-Google-Smtp-Source: AH8x225srYkrjqeQOszTnUHKTOTyIKkoav0pLlNH3Jkgy12qtsGY63zKJOOk2ccMSNtqmVrhuhFAYu99fgrFGknRy+8=
X-Received: by 10.107.133.75 with SMTP id h72mr25190582iod.227.1517229146116; 
	Mon, 29 Jan 2018 04:32:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Mon, 29 Jan 2018 04:32:05 -0800 (PST)
In-Reply-To: <CAGAf8LyPoW5XORJ=uCBOVT8S2zWvQW6wkzU7yctKwR26We=aGA@mail.gmail.com>
References: <45db0f72-d93f-ebbd-83aa-80ceaeabc083@gmail.com>
	<CAGAf8LyPoW5XORJ=uCBOVT8S2zWvQW6wkzU7yctKwR26We=aGA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Jan 2018 12:32:05 +0000
Message-ID: <CAJTo0LZqeXy9FPJwi19T6f9haWKHj3nVS6dRnfhMje1KAaD5-g@mail.gmail.com>
To: Zoran Stojsavljevic <zoran.stojsavljevic@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] [RFT] Glibc 2.27
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
X-List-Received-Date: Mon, 29 Jan 2018 12:32:25 -0000
Content-Type: text/plain; charset="UTF-8"

On 29 January 2018 at 07:45, Zoran Stojsavljevic <
zoran.stojsavljevic@gmail.com> wrote:

> This one will be tough to integrate. Most of the packages depend on
> this one, which is critical one. On the very bottom. I would say, this
> is a big step, since here somewhere you should draw clear line. And
> this line will be the following: which releases you/YOCTO crew will
> support (back-port to) with Glibc 2.27, and which not?!
>

This one will be easy to integrate: it goes into master and none of the
stable releases.  Stable releases only get upgrades after release is very
limited situations.

Ross

