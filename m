Return-Path: <chmorgan@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4D7D265D6D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 10:48:31 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id c1so6104618igq.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2014 03:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=uYqdrxRV4Dfeaoy6edmKOqYp0FJHjk570y8iI2hkChQ=;
	b=IVDQ6s7na5qZQT2723unkDpyoZEOwKnxJ+z9bPm9qrFubWO2gwXODoO32iDQ+mshFj
	65WZ916GTKYOokcoCJfGUApRPhlFO1CqNNT87cwk9A4Q4hTyS7FpSvpM+TPoyqFU9Jou
	DvxoUdMDdpyFY+3//CeYjHlH65xvMn47NjXvL78tXsOip6gUbh813DBnl5nAG39xrZmo
	YGBRNnDdGecDbHdWJ2MRZH7hUQDYzI7MzqnVfKEzlvi9xGOztoaSkoEmwIkQcVQeCGu3
	RBm2Zj1Oln3z08MJWLCGavfBF/+32bcTikfNYIzxVR1GXVJyQF/eHMwJbqiLdgBAoLFs
	mQ3w==
X-Received: by 10.50.152.38 with SMTP id uv6mr5789598igb.34.1401878912882;
	Wed, 04 Jun 2014 03:48:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.228.141 with HTTP; Wed, 4 Jun 2014 03:48:12 -0700 (PDT)
In-Reply-To: <20140604093705.GQ2426@jama>
References: <CAAPegz1J+4vrvOF3F9Rj11_0-Lhd0ybFFci-_UXgLtVBhxreYg@mail.gmail.com>
	<20140604093705.GQ2426@jama>
From: Chris Morgan <chmorgan@gmail.com>
Date: Wed, 4 Jun 2014 06:48:12 -0400
Message-ID: <CAAPegz3tVh00-VbEAyngMPbLKrmxDJDe79+s4iZhCY52fePQ7g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] dfu-util 0.7 recipe, remove old 0.1 recipe
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
X-List-Received-Date: Wed, 04 Jun 2014 10:48:32 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 4, 2014 at 5:37 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sun, Jun 01, 2014 at 01:42:34PM -0400, Chris Morgan wrote:
>> dfu-util 0.7 is the latest release of dfu-util
>>
>> Remove old dfu-util 0.1 recipe
>
> Please use git send-email, see extra line feeds you have in
> 'SRC_URI[sha256sum]' lines, this time I'll apply it manually, but next
> time I'll just reject them.
>
> Thanks
>
>> Signed-off-by: Chris Morgan <chmorgan@gmail.com>
>> ---
>>  meta-oe/recipes-support/dfu-util/dfu-util_0.1.bb | 10 ----------
>>  meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb |  6 ++++++
>>  2 files changed, 6 insertions(+), 10 deletions(-)
>>  delete mode 100644 meta-oe/recipes-support/dfu-util/dfu-util_0.1.bb
>>  create mode 100644 meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
>>
>> diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.1.bb
>> b/meta-oe/recipes-support/dfu-util/dfu-util_0.1.bb
>> deleted file mode 100644
>> index b63d74d..0000000
>> --- a/meta-oe/recipes-support/dfu-util/dfu-util_0.1.bb
>> +++ /dev/null
>> @@ -1,10 +0,0 @@
>> -require dfu-util.inc
>> -
>> -PR = "r1"
>> -
>> -DEPENDS = "virtual/libusb0 usbpath"
>> -
>> -BBCLASSEXTEND = "native"
>> -
>> -SRC_URI[md5sum] = "454b931249d29e4a6c2a2ade17858490"
>> -SRC_URI[sha256sum] =
>> "a27cc667be9b158fecf0ed066698e30eca0c0b3cd7a85aad2058d47ffe16f0e1"
>> diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
>> b/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
>> new file mode 100644
>> index 0000000..c4c030d
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
>> @@ -0,0 +1,6 @@
>> +require dfu-util.inc
>> +
>> +DEPENDS = "libusb1"
>> +
>> +SRC_URI[md5sum] = "56844020177d4db4c1ea2e926fe9d588"
>> +SRC_URI[sha256sum] =
>> "f52a2a5489fbf9f3204a6ada05e0b47ee322e19d81c712e0c58a332d80ec3eab"
>> --
>> 1.9.3
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


Sorry about that. I had switched from attaching the file to using git
imap-send but I used git send-email and gmail's smtp server for the
resubmission of removing the dfu svn recipe patch.

Chris

