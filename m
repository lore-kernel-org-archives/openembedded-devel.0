Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id B915A77A88
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Apr 2017 10:53:21 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id c80so42818259lfh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Apr 2017 03:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:organization:user-agent;
	bh=Kj/W2zlpMLsgd4Et5RRxaPUC+ndNIk152DChQlpQqzc=;
	b=hQlLOvt823FfoJ2iaIUg6XhcPoDmTPMz5oBD0RNhx8XRiX6UatQpFznCVbR1IKmhJf
	FFxUXQfrfIEdPmWVOBb86OYT+qnPJEnLfQhtwVg7e/lM8ytM8NwkAOXodXAPPgEPyp8Y
	aDVS3lXjz9lDPCDfcHZjeBNU6SQuNe9AcVen0UQaOMq3B/+iAH6nVlsy7+ckTONmelg8
	PqizJ7pYfq0CHqWh4ShvRtvVdg4zRapufEY4D7zbUH7gaNehSkrP4jxVcAbBy/7HX3QH
	zZTf+keOe5G+KDe131xDKBtJ3sF2Hpmdvjb79lrOvNq8b6XWYT5q8+SjZon8Pwq0h5DF
	gYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:organization:user-agent;
	bh=Kj/W2zlpMLsgd4Et5RRxaPUC+ndNIk152DChQlpQqzc=;
	b=SHO2Q92kKUNPBLlz84x7VOhJoeIYGhF1ryJF5uHPLVROxTb4gzVIHGLUnGTHqOBxQK
	9FL/dWdOa30Al7rAmAOrZkPvNntUfzB6XSDSf4f+pwxEIRK+RWCOVgTdw0HxzRruRJrO
	govNW4t6JBxRv8SXIiBWl5BPuHWglX9qD7xjqxXCr7+JLj2DH6JWofsmSzqHbI33xopX
	fYBBBXUd/2/WX5sJrat5oLIJgKpJPn51IYPrdCFBuZ9z7He7eXm4BNTqo86ISXynoHcK
	ENvI44crZgsyaDmrjTm0tsB5P0rprnsoXM+Jot9nEO+zPIsFXvFiZvyQIqheVSup9bXA
	mfeA==
X-Gm-Message-State: AN3rC/5JzZoHkRyS/FaQtMCnZ/WU2vMsPo1t8pNiLGzSTxTV+xquknN0
	kMuFvxYDrWEq1blGPTE=
X-Received: by 10.46.77.129 with SMTP id c1mr4443778ljd.1.1492772001894;
	Fri, 21 Apr 2017 03:53:21 -0700 (PDT)
Received: from ad.chargestorm.se (194-237-220-218.customer.telia.com.
	[194.237.220.218])
	by smtp.gmail.com with ESMTPSA id x1sm1527054lfb.37.2017.04.21.03.53.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 21 Apr 2017 03:53:20 -0700 (PDT)
Date: Fri, 21 Apr 2017 12:53:19 +0200
From: Anders Darander <anders@chargestorm.se>
To: Dengke Du <dengke.du@windriver.com>
Message-ID: <20170421105319.iqgbqeydq23r4fan@ad.chargestorm.se>
Mail-Followup-To: Dengke Du <dengke.du@windriver.com>,
	openembedded-devel@lists.openembedded.org
References: <1491975746-68414-1-git-send-email-dengke.du@windriver.com>
	<20170418122031.pizafzlv7zjy5p22@ad.chargestorm.se>
	<8d85f0bf-bc54-6d78-f96b-22300fabe40b@windriver.com>
MIME-Version: 1.0
In-Reply-To: <8d85f0bf-bc54-6d78-f96b-22300fabe40b@windriver.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20170306 (1.8.0)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH V2] crash: 7.1.5 -> 7.1.8
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
X-List-Received-Date: Fri, 21 Apr 2017 10:53:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

* Dengke Du <dengke.du@windriver.com> [170421 12:18]:

> On 2017=E5=B9=B404=E6=9C=8818=E6=97=A5 20:20, Anders Darander wrote:
> > * Dengke Du <dengke.du@windriver.com> [170412 07:42]:

> > > 2. Add the "id" to HOSTTOOLS in meta-oe/layer.conf
> > Why do you need to add `id` to HOSTTOOLS?
> It's not me decide to add "id" to HOSTTOOLS, it's the crash source code
> decides:

> In ./Makefile line 563:
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> release: make_configure
>         @if [ "`id --user`" !=3D "0" ]; then \
>                 echo "make release: must be super-user"; exit 1; fi

How is this going to work? We're not running make as root, thus the
build will fail!?! Or what am I missing?

I'd say, can you try to remove those two lines instead, and see if it
builds correctly?

Besides, are we really running `make release`? I can't find anything
obvious in either the Makefile or the recipe, that calls `make release`.

> > We're normally trying to _increase_ determinism in builds, not reduce
> > it...

I've got really hard time to see why something needs to run `id` in
order to build properly...

Cheers,
Anders

--=20
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

