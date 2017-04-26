Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id DB7526093E
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 09:44:46 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id y63so137660120qkd.1
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 02:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CfMxsqaV9qEOqfZ+h5ZF8I8DruD1SPrYRcg0hHwClvc=;
	b=1C3uRmV3Q75XH6N0LafUZD1VIxRmmj+sSkbuwEusLgIkASLUWpOsDaZq6tX09KmzMa
	q/2w78/3toWpz6h+2jtTFZfL67kfef1fnfqOjy3yziLU2psB3JRRYxkbTKz94mm43z6x
	xyC0AwxMvKnVM1M4phWwFB2iOmSgb7kB3/NdslxTjcQ457IfCwKr3TX37rA+Uq2sgyOt
	SPbk6lEqAmUQ6eRffSPztuxpITnjmSkqtvkrUobgNAwRXiw143tEMiacKjb1WrwSeLMJ
	T38ZO7aCRr5Yi+bofOVk9CkZmjYQQ4M1ZqtjaDNydLms0Jw/iL9t9j8hNWOhJtBgVOeC
	S5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CfMxsqaV9qEOqfZ+h5ZF8I8DruD1SPrYRcg0hHwClvc=;
	b=rU0XD9CpFRINumrl8h2YYVxLhQDEouMEr4Sd7ePAej6Rehaq4evtJPP0g7amrFNAyF
	DpvpSFW0T6uuqpXBO7SrpFKDgNgFQTg9CxfcyxBb3LdIhmdaI1lZ7gbLHAeeBgZYNTII
	h8kWk5uIQSSnzrDDF7cWFMUiHBM1lwmdtj5J9TF1dRI8hO5uL5b/tLKdFuDtRsVKtsP6
	GEwt/3JwyACfKlKk3J9k0aDXTQ3D3cAyJp7mUlo5aoyOhpfhnko+US7p1IDYm/T4tGgL
	bRFdQaqHxPef21vRRzcnYGVcOUnUt2DhW56kqU3h/VajnxBoqWXmF6J38/EMMf37W7Ev
	r3Ow==
X-Gm-Message-State: AN3rC/6ADbFddQvX8Effzde+1i+hkDh7fDDnB6b14xj50HaxHBGOeKN6
	4jlUrh/s8E+AHeMh8hqpUGdzkTZwIUsC
X-Received: by 10.55.17.224 with SMTP id 93mr32046749qkr.244.1493199887516;
	Wed, 26 Apr 2017 02:44:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Wed, 26 Apr 2017 02:44:27 -0700 (PDT)
In-Reply-To: <87fugwyv28.fsf@largeson.i-did-not-set--mail-host-address--so-tickle-me>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CAMKF1sqfvtQPWN5Yuz3RPYkXpneS+XWcYmit_=bcvKGo3_hx8w@mail.gmail.com>
	<CAJTo0LakaSZhJodT2KQx6u0TEaBL5Ruig3oOdfrtCzQUf1cxXg@mail.gmail.com>
	<CAJTo0La+bGDBuJ42yVy79hW2iN3ZhpeyjXrhUApLn-PAi6PYBw@mail.gmail.com>
	<87a875qxeg.fsf@largeson.i-did-not-set--mail-host-address--so-tickle-me>
	<CAJTo0LaLOhPcz8DYQ4wGzVXrP7Qs_Fa7jgrx76wCDAuR8eoWfQ@mail.gmail.com>
	<87fugwyv28.fsf@largeson.i-did-not-set--mail-host-address--so-tickle-me>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Apr 2017 10:44:27 +0100
Message-ID: <CAJTo0LY=s+q9oC6ep=aD8W29U6L4kdnQQchg3OKbM6EhH7tniQ@mail.gmail.com>
To: Nathan Lynch <nathan_lynch@mentor.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] [OE-core] [RFT] gcc7 and glibc-2.26 recipes
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
X-List-Received-Date: Wed, 26 Apr 2017 09:44:47 -0000
Content-Type: text/plain; charset=UTF-8

On 25 April 2017 at 23:35, Nathan Lynch <nathan_lynch@mentor.com> wrote:

> Done:
> http://lists.openembedded.org/pipermail/openembedded-core/
> 2017-April/136086.html
>

Thanks!

Ross

