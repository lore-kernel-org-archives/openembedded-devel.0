Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 79FFC611E0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 19:02:47 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id 11so491611qkd.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 11:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=r/4TiNQf9Z+g+PpcDGVB9Cf/VCVbGUnK72mxRZO2110=;
	b=as01LCq9J8l8fr2Orgr4CKOs0wFjSXedIte6b1JLex+CBU80UqGJJhwp+0sDgXltXy
	moFfdmWLZIqisjjtIVndGwOTbq4U2Ft6COdv8awnVW1l9W8ENJRFQoLJFxw2gAYiOTJG
	u24xHib/GFTZ8Od2XmzPuYFkVoopUqI6azZJUPyDTuQ/J7cdP0GgqOYMNwcNtG3Wcpwl
	28Qs+HqBf6lFbE+MQdQOKW5MZlHIxw46FUVeHxHzJESqPDXQdbG9HKvtkrQnbzWKta+Z
	+bNQMNn4gGoMf/ESJa6sgPlsGb7Zo3w99p5KWaQ7wo9whX7hVC+pbXhrArukcr5a2oMj
	ib2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=r/4TiNQf9Z+g+PpcDGVB9Cf/VCVbGUnK72mxRZO2110=;
	b=al9G7e8GT+TU9K4+675kscuqwPMSYU1+WggOeV41Maq8I21/bHzNsGhin0ogXhP23A
	jEPDD2Y4Eqxef1QcfWVZX8KKwlavYyN1ctqGpQpR9+14GmmYIUUxXhBCCWPLWrMRk57f
	xduNqXXC0pS/2FRuLDhSlezBZygskQgEBUvqDpPM7FezowAQ0/hbQ6NBoE0lSCvXeh1m
	x3toSoE5ZvzHBjI1vVF/FhpkQVxzG+VFQs5CFTJNaBhQj1gU63apl0cSEj64wrvzFP3l
	HUIBVzVh05/MCWd6b4N9SJXKPIx30cT6k2I2kanTm+iAGnCK0kIb1F5kpk+J1MeIShDH
	FBZw==
X-Gm-Message-State: APjAAAWmwz58znMpesoagHZDvOM7oeEcya25doc3u/jiPBJ/22hqEb7+
	D855N9V0qAySaOcq6TJLb5tCAISdi7+d7cCCh6Wk/zIT
X-Google-Smtp-Source: APXvYqxAFsmI/nrFt2EHS1SgJnufv3ac/AWw3ROcRiExAMbolOEJVPkUYN9vUHyB9C8oZGYI/ofOXmNVhUjP4INKmpo=
X-Received: by 2002:a37:47c4:: with SMTP id u187mr798774qka.165.1582830167926; 
	Thu, 27 Feb 2020 11:02:47 -0800 (PST)
MIME-Version: 1.0
References: <1581723823-21171-1-git-send-email-wangmy@cn.fujitsu.com>
	<1581723823-21171-5-git-send-email-wangmy@cn.fujitsu.com>
	<CAAaKDhE__cs1WdFWSN7_JRDfX_TzyxUr0eQpYWNTRSxvmdoZ7w@mail.gmail.com>
In-Reply-To: <CAAaKDhE__cs1WdFWSN7_JRDfX_TzyxUr0eQpYWNTRSxvmdoZ7w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Feb 2020 11:02:21 -0800
Message-ID: <CAMKF1spoR9p1UDrPHsW+MA6sK7DnUgDyxy+voZODM27rus_JfA@mail.gmail.com>
To: Ricardo Salveti <ricardo@foundries.io>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libp11: upgrade 0.4.10 -> 11
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
X-List-Received-Date: Thu, 27 Feb 2020 19:02:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 27, 2020 at 9:53 AM Ricardo Salveti <ricardo@foundries.io> wrote:
>
> Hi,
>
> On Fri, Feb 14, 2020 at 1:12 PM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
> >
> > Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> > ---
> >  .../recipes-support/libp11/{libp11_0.4.10.bb => libp11_11.bb}   | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-oe/recipes-support/libp11/{libp11_0.4.10.bb => libp11_11.bb} (93%)
> >
> > diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.10.bb b/meta-oe/recipes-support/libp11/libp11_11.bb
> > similarity index 93%
> > rename from meta-oe/recipes-support/libp11/libp11_0.4.10.bb
> > rename to meta-oe/recipes-support/libp11/libp11_11.bb
> > index 655db4907..5a0951df2 100644
> > --- a/meta-oe/recipes-support/libp11/libp11_0.4.10.bb
> > +++ b/meta-oe/recipes-support/libp11/libp11_11.bb
> > @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
> >  DEPENDS = "libtool openssl"
> >
> >  SRC_URI = "git://github.com/OpenSC/libp11.git"
> > -SRCREV = "973d31f3f58d5549ddd8b1f822ce8f72186f9d68"
> > +SRCREV = "e1210903291b1de9eabcad26e740a4b2fbcca692"
>
> Is this change really correct? The latest libp11 upstream release is
> 0.4.10, as you can see at https://github.com/OpenSC/libp11/releases.
> The next one seems that will be 0.4.11, so now sure how it was moved
> to 11 directly.
>
> Also, the SRCREV seems incorrect, as it is pointing out to the 0.4.9
> release (https://github.com/OpenSC/libp11/commit/e1210903291b1de9eabcad26e740a4b2fbcca6920).
>
> In the end this change is increasing the PV but moving SRCREV to an
> even older release.
>

you are right, and it escaped me. Would you be willing to send a patch
to correct it
since it was not long time ago.

> Thanks,
> --
> Ricardo Salveti

