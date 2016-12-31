Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 625E5600B3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Dec 2016 21:24:38 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id v2so11870964uac.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Dec 2016 13:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=tKpypaDfYpT8KXWSkwXVeSV5SRkzZdLWxp2H7KDm7LU=;
	b=HxohggDM45WUiUNGYVtjPxiYuy2GO2x17xjtV5qfIrcMfXKNMk5Bpb9UIz1GRHtoHC
	4YfZasAbpJ37J6eiKg1QI6Xliz/8DKg8i5+NLQjRFMaO3K5WFVvRTrwG1qk3j+8Y/BQ0
	vZq8kKlOxM/GdzpYWtXWA8Xq7Ah+Y2RT1l3nCv5JU21troBuBz6hhPzu9MHEIFfltRhd
	hMDC7MqEzarwk700Jvc3aLHrdlB++rHUJqTPnf00K1//WmPZIv8tn46KZY+uBurEG3RM
	4kjjfbYVw7Rs4/vl48M/RHs7hUrXvPEs77baSprGN4IJA0jQnwKtr3QGaTXGAJkbqSWV
	rsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=tKpypaDfYpT8KXWSkwXVeSV5SRkzZdLWxp2H7KDm7LU=;
	b=pNjBlajFT2IFtyPy4DoPbUNH8pOVWPYMLBCgK1QSPytqYtghHCH+JvAAXWfZq4Aufm
	w4AIKdsjkcB8ys2Nn6S5up+kqMAUZr1N7LKbHsveUThvN40a6ZMQMOq0tTvgsD3j7lmd
	4VWyrALvgks9YPo7shjBLM3WPP3qE8Vp6/QfOQltoIA5/WB8Z+HD6NYEsFuqKmvLxBJH
	UMmwD4gd0JOp23eAkOZeEMhrjs5IWUXgwAE2m+5EX5HqMMlr6bap8qX8wXaEBOoj6QQS
	TGZQoWCRCJ3H1gJKhLrrlTHOjo3vd1Qg+FX4YS77NJi5R5gxdi11lWcr+JM5D7EtD2Kb
	ixXQ==
X-Gm-Message-State: AIkVDXIckTnbHSlJM9URZHKwT768vSqTTAo8d4PWrB/wOXuvuxNEnCFr39slnNEMyzO4HEcOLumMP4/RA6LHlA==
X-Received: by 10.176.0.197 with SMTP id 63mr32797331uaj.32.1483219479810;
	Sat, 31 Dec 2016 13:24:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Sat, 31 Dec 2016 13:24:09 -0800 (PST)
In-Reply-To: <CAKuJqM990m=kPC6c4J94vKaYjaSoOTj5yeMxeyGOFrHCwv+6Qw@mail.gmail.com>
References: <1483077771-28877-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
	<CAMKF1srr_XS4X8QOVs6f_YvKs_F7=h0Ng-+9CLHToz9ufu2_1w@mail.gmail.com>
	<CAKuJqM990m=kPC6c4J94vKaYjaSoOTj5yeMxeyGOFrHCwv+6Qw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 31 Dec 2016 13:24:09 -0800
Message-ID: <CAMKF1soV5h1xv2Dskw=zCyAt5Yxzw1RyzHP-SY-s8Ff8ENuMQA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] tcpreplay: upgrade to 4.1.2
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
X-List-Received-Date: Sat, 31 Dec 2016 21:24:40 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Dec 31, 2016 at 10:53 AM, Oleksandr Kravchuk
<oleksandr.kravchuk@pelagicore.com> wrote:
> Khem -
>
> I have the feeling you did not look at the change careful enough. It
> is extremely simple and straightforward: the package has been updated
> to next minor version.
>
> Since the tarball is physically different, the checksum is obviously
> different as well.
>
> On 31 December 2016 at 19:44, Khem Raj <raj.khem@gmail.com> wrote:
>> On Thu, Dec 29, 2016 at 10:02 PM, Oleksandr Kravchuk
>> <oleksandr.kravchuk@pelagicore.com> wrote:
>>> +SRC_URI[md5sum] = "3105b10b07dbc0b07ce2da07a2368359"
>>> +SRC_URI[sha256sum] = "da483347e83a9b5df0e0dbb0f822a2d37236e79dda35f4bc4e6684fa827f25ea"
>>
>> explain this change in commit message as well. what change is causing
>> the checksum change

ignore it. I somehow read it as a license checksum change.

>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

