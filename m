Return-Path: <b.hutchman@gmail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2A87A61639
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Apr 2014 01:47:58 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id i11so13249793oag.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 18:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=FtNpBDsevNGdrMSdUTDgHN0a10oihMn43Dl+5B5rppQ=;
	b=R8w4BboWJ9KwJvYAby2HAvNwxKgX01sQgAl9mpw8Jqyjn7Pafs611w1cY9wS5mWzc2
	cREDtcwJ+pIbGWtmCbdW3C1d8bd0cRJH9t4CbhAmqGA/xVLpG7DBRSsFvOibvwI3gA4I
	eW/gjoSEC9oQ00Evjp8OXFd2eZq4RCxeLPvHo7OrqHrylnMlKhYMFmLiAwxEcX/4oXyK
	iywErycJrrjNteAacIUOPxUbKk2/jE4No+fEwkOzmeNcO1a95q7sxhGPaWn+gsYzQYxT
	EBy4DsmKvdzw0jj64IJAyprwyq72ErgwVL5m2J11zuc/GJcaiPDD3gKvQjBAQU75Arbr
	ZirA==
MIME-Version: 1.0
X-Received: by 10.60.125.195 with SMTP id ms3mr9391012oeb.3.1397699279508;
	Wed, 16 Apr 2014 18:47:59 -0700 (PDT)
Received: by 10.60.73.165 with HTTP; Wed, 16 Apr 2014 18:47:59 -0700 (PDT)
In-Reply-To: <CAFZh4h8FbND2paS5wjPZ_mYmYhnqk1ng1biUYHnEOsh6tYQG6w@mail.gmail.com>
References: <00d101cf5942$91feeb30$b5fcc190$@lge.com>
	<CAMKF1srO8NBNuYbMhbwUO3df8+Q3aDoUmzHUinDy9V_WKuBsRA@mail.gmail.com>
	<CALYKT1hwGK7c9QcXMRXpMPLbP69zoa_49QBhZXpOaYec7geVRQ@mail.gmail.com>
	<016b01cf59dd$003f8100$00be8300$@lge.com>
	<CAFZh4h8FbND2paS5wjPZ_mYmYhnqk1ng1biUYHnEOsh6tYQG6w@mail.gmail.com>
Date: Wed, 16 Apr 2014 21:47:59 -0400
Message-ID: <CAFZh4h87C_zjPzPSRD5YjLOthAK9SSAMiUHMmnqHM9HKM73jTw@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: How can I get the toolchain?
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
X-List-Received-Date: Thu, 17 Apr 2014 01:48:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Apr 16, 2014 at 9:42 PM, Brian Hutchinson <b.hutchman@gmail.com>wrote:

> On Wed, Apr 16, 2014 at 9:33 PM, Changhyeok Bae <changhyeok.bae@lge.com>wrote:
>
>> Thanks for your help.
>>
>> In summary,
>> 1) bitbake meta-toolchain
>> 2) bitbake [target] -c populate_sdk ...
>>
>> However, those were building ...nativesdk ...
>> I only would like to get the cross(arm) toolchain without building SDK
>> toolchain.
>>
>> Regards,
>> Changhyeok
>>
>>
> ... those do build the cross sdk/toolchain.  You take the huge script that
> is generated and install it on your PC, source the environment setup script
> and now you are setup to cross compile on your host for the target.
>
> Regards,
>
> Brian
>
>

... in your local.conf, you do have to set SDKMACHINE to something.  I have
to build toolchains that work on both 32 bit & 64 bit hosts so usually do a
build with:
SDKMACHINE ?= "x86_64" ... then do another build of sdk with:
SDKMACHINE ?= "i686"

