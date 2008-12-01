Received: from [209.85.132.248] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1L6yIk-00082o-B1
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Dec 2008 03:14:18 +0100
Received: by an-out-0708.google.com with SMTP id d40so1207426and.42
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Nov 2008 18:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=LO4QGpcbEwSW0L92hhQm2PR5eHACApqEuajm4iwEI2s=;
	b=ocJQiA4Fr7/Y2OeL+IhRZnYRk/Rhv3lgxBXoTFHx2gRAnaTq/godNCVN2PDLWDEYMw
	04475zAFjYPiaxvHLwPxXtEb3CpmP1uUoYVJj77kuBNc3okjLY0TMunim9h0WiM8/ICB
	gy8PJG8EV2zP/qQosnNIcaos92+EY+FzpUZuk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=iGzYXPiGIEFwncrQppsw26xOIKICuBA3ZH1uZbJtNR/jbOqffW3xW7H8eIEcapNbs3
	71tTXuixpGRE9/1AoF8Hm701f5gGVFIj8bf0PkoQB81NlOSs6DPPmxIn6PaoFYmSsY2f
	bVHZGHbdgRwIX0eWqesv7Td/eZH9UBgOchZow=
Received: by 10.100.31.10 with SMTP id e10mr5445905ane.12.1228097458877;
	Sun, 30 Nov 2008 18:10:58 -0800 (PST)
Received: by 10.100.197.9 with HTTP; Sun, 30 Nov 2008 18:10:58 -0800 (PST)
Message-ID: <bc64b4640811301810y1f4fa910p704d089b40be1278@mail.gmail.com>
Date: Mon, 1 Dec 2008 05:10:58 +0300
From: Dmitry <dbaryshkov@gmail.com>
To: "Stanislav Brabec" <utx@penguin.cz>
In-Reply-To: <20081129213201.21d91e2d@zaurus>
MIME-Version: 1.0
References: <1227919728-4878-1-git-send-email-dbaryshkov@gmail.com>
	<20081129213201.21d91e2d@zaurus>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] zaurus-updater: add support for home partition reflashing
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
X-List-Received-Date: Mon, 01 Dec 2008 02:14:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

2008/11/29 Stanislav Brabec <utx@penguin.cz>:
> Dne Sat, 29 Nov 2008 03:48:48 +0300
> Dmitry Baryshkov <dbaryshkov@gmail.com> napsal(a):
>
>> Sometimes one needs to clean/reflash the home partition.
>> Add support for flashing home.bin/HOME.BIN files onto "home" mtd
>> device.
>
> Somebody may found it useful (e. g. for initial setup).
>
> Note that on models with HDD it will not do what is expected.
> It will format 2nd NAND partition, but /home is on /dev/hda2.

I don't know what it will format actually. Does the NAND have the "home"-labeled
partition on those devices?

>
> When you are discussing updater, I would like to discuss few additional
> changes:
>
> 1. Decrease number of reserved sectors while formatting the HDD. 5% is
> far too much of space unusable for packages installation. I have 5%
> free, but unable to run applications using /tmp. I propose 0% (or only
> a few blocks).

You can use tune2fs at any time, IIRC, can't you?

> 2. Support for langpacks. OE does not create langpack yet, but it would
> be nice to be able to flash localized system.

As a Russian user, it's definitely +1.

> 3. I am using post-flash customization using a combination of additional
> files and patches. It would be nice to have something like that
> directly as an updater feature.

It may be nice to have smth. like:

[snip]
if [ -x post-updater-hook.sh ]
then
  . post-updater-hook.sh
fi
[snip]

However I dunno if other developers will agree on this?

-- 
With best wishes
Dmitry


