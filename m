Return-Path: <max.oss.09@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6F4D660017
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2015 19:36:10 +0000 (UTC)
Received: by wguu7 with SMTP id u7so45234788wgu.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jul 2015 12:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:date:in-reply-to:references:content-type
	:mime-version:content-transfer-encoding;
	bh=MDsjvV+fHE/zvbLfEceyMUvcEosJ2SnNhBa6CQ5xqrg=;
	b=1FUDfiVS6JPqC0nLzJokm1DAvw9pJjopEqjKKyNg1vlKs1CFLQmeUCwmBq198FcTD2
	TcS9Z75i1Xn+NK7tTk/Auln5DAQdQ1iwAcAGoMy9Uu+EQHkNo0BjPbC/N0vlX+3iYLu/
	xm1QqROYdp9IlIak9L0SUdh/QT7bFNcztyWFWd4k27vGAGBDOZD8W9m21BUGw0qjknkO
	MfOrj3JJsNEN7rVJlaT0c1aL+IkCphXzi+aPx3WzpZjYHv2WOBsweucQQdDU3WVdPc65
	dKiCNpOtDi0UqJectitVYj4V+4zNTuu49dkKc3gMxnmAw6ryaaBBqIyQYNwYqqIQJiUa
	ckMg==
X-Received: by 10.194.2.161 with SMTP id 1mr50210790wjv.143.1435779370424;
	Wed, 01 Jul 2015 12:36:10 -0700 (PDT)
Received: from [192.168.0.7] (212-41-115-180.adsl.solnet.ch. [212.41.115.180])
	by mx.google.com with ESMTPSA id
	ul1sm4321116wjc.30.2015.07.01.12.36.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jul 2015 12:36:09 -0700 (PDT)
Message-ID: <1435779368.3007.16.camel@Saturn.local.all>
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 01 Jul 2015 21:36:08 +0200
In-Reply-To: <CAJTo0LZVwcE2JHe5CAaaXHHKKMPJdWqC2Tw_OTQfaza_2DTcCQ@mail.gmail.com>
References: <1435697730-12800-1-git-send-email-gary@mlbassoc.com>
	<5593A340.8030507@windriver.com> <5593F569.2080008@mlbassoc.com>
	<CAJTo0LZVwcE2JHe5CAaaXHHKKMPJdWqC2Tw_OTQfaza_2DTcCQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4 
Mime-Version: 1.0
Subject: Re: [meta-browser][PATCH v2] chromium: List all PACKAGECONFIG settings to avoid warning
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
X-List-Received-Date: Wed, 01 Jul 2015 19:36:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi

Am Mittwoch, den 01.07.2015, 16:47 +0100 schrieb Burton, Ross:
> On 1 July 2015 at 15:12, Gary Thomas <gary@mlbassoc.com> wrote:
> 
> > No, it's much better to use the standard mechanism (PACKAGECONFIG) rather
> > than making up something special for this recipe.  The patch is needed only
> > to suppress warnings about how it's being used.
> >
> 
> I kinda of agree with Robert here - the standard method isn't being used,
> but the variable is being used.
> 
> As the chromium recipe doesn't inherit autotools EXTRA_OECONF will only be
> set by the PACKAGECONFIG handler, so it would be an improvement if the
> enable/disable arguments were specified as usual in the flags and then
> EXTRA_OEGYP just included EXTRA_OECONF.  (untested but might work, cmake
> recipes certainly did this)
> 
> Ross

I think that this view is guided by an inside view on PACKAGECONFIG.

For the guys wanting to influencing the build of a package they want to
set a list of options and then forget about it.
So having to write in your bbappend something like

PACKAGECONFIG += "use-egl"
PACKAGECONFIG_NON_CONFIGOPTION += "component-build"

instead of
PACKAGECONFIG += "use-egl component-build"

is sort of unintutive. 

I guess the warning which now pops up when not setting a value in
PACKAGECONFIG which does not have a corresponding PACKAGECONFIG[value]
is meant to warn of a typo in setting PACKAGECONFIG.
Gary's solution would even provide the same warning mechanism for free
while when moving to a PACKAGECONFIG_NON_CONFIGOPTION one would have to
implement another test to get a warning when providing a non supported
value to PACKAGECONFIG_NON_CONFIGOPTION.

Just my two cents.

Regards
Max



