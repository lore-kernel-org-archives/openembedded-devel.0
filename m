Return-Path: <zoltan.kuscsik@linaro.org>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id A1B4D7653B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 12:28:57 +0000 (UTC)
Received: by wmff134 with SMTP id f134so10628493wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 05:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=26vPvoRalpby6xWDlL1PFdOA6KcuVU0na5aBPRk+Cjo=;
	b=dLNmM4TAOGLJF/W9+DlIZTurpnjkuFGeGIKWXheVP09NOCoJ6Bc8/DvvyQPW5XcyLY
	mNT/wmdY+Q+oWTqCTlcmqtQuKbmchJzkFutRtemyd1rkTyxr2w8UrLX5ArwtELM/SPVh
	K5b1nEqvet2x2fQ1GQn0UCxeDIxnyZIdtpAaLlKVpQgDoINevbKTubEi6WvWasRhZnd3
	pznbc2jSEfRfBroT2BuHafdA3Sjeuo4gpg+465oMEFw0Ax1T7Cn23NdN4eHjugTF16W0
	ZJVy+ZxNbFr+klz2jiVF6LJAfQ1aHy0Eh9p+5CTwrMbiGPr+E6i814iRmKpQY78HGZGK
	4+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=26vPvoRalpby6xWDlL1PFdOA6KcuVU0na5aBPRk+Cjo=;
	b=XK3gPnjuYgyphKRWwLXQNHIYJIVr92QQkiyFiZgxNV8Y/L52Fg+Ou5gMLuedHaJzjn
	kxeT+1p0mf94cbVLFtmpPWwgZ4rlkHYUIC5c2S0fIZ/MQx3O/jX8wRPXgdaBGFSFtaET
	EZ/9wgndOG8pMV7Pi2pwtnGqBkQxgFjmDSyk0lAEn+dVog8q3DrRE9W7Ae2JHpEqN4QI
	xeofInwAqfFM6bNN0Lwg6pnYMnW5it4RUQzAi4MTuHFPlGlPbYcyNBNv0Ins2NXLXl71
	uK3fPWOG5x5mHnNirYhTS8FfRgPOv1cPWdQzEPJVY+YMA1rNQTXAM8Re83hXI6AtEXPS
	SoFw==
X-Gm-Message-State: ALoCoQkRQItWFHmAVSDbdg8AIifhmiTacI8fC0blYwhQ9XLnIoa6/XFqgDx5n5ZWDImw1UFWywUH
X-Received: by 10.28.10.142 with SMTP id 136mr3311902wmk.84.1446208137111;
	Fri, 30 Oct 2015 05:28:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.127.213 with HTTP; Fri, 30 Oct 2015 05:28:37 -0700 (PDT)
In-Reply-To: <CAJ86T=VWjYJLyF9dD6LhGFb1cVyuzxT4gSqcgGLfRsTfT6UCHQ@mail.gmail.com>
References: <CAAzKXnjdUYmLrXX4bCT9wmcH9nc3c1OL7eRsdTXXD-T70RDZmA@mail.gmail.com>
	<2f4be637747c4a7eb3f2d5dd7a0b8465@XCH-ALN-008.cisco.com>
	<CAJ86T=VWjYJLyF9dD6LhGFb1cVyuzxT4gSqcgGLfRsTfT6UCHQ@mail.gmail.com>
From: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
Date: Fri, 30 Oct 2015 13:28:37 +0100
Message-ID: <CAAzKXnjT0WeXKUsi2Lac-YDGxvZ5o5mV3oEE9cuFhJbSfi8LWQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-browser] Recipes draft for Chromium V45 and V47
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
X-List-Received-Date: Fri, 30 Oct 2015 12:28:57 -0000
Content-Type: text/plain; charset=UTF-8

Thanks for the comments. I'm going to clean up the recipes and I'm trying
to upstream some of the
patches to chromium to reduce the maintenance on meta-browser.

Z



On 24 October 2015 at 06:39, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Tue, Oct 13, 2015 at 3:12 AM, Julien Brianceau (jbriance)
> <jbriance@cisco.com> wrote:
> > Hi,
> >
> >> It still needs some cleanup before upstream, comments are welcome.
> >
> > I think it would be great to take the opportunity to clarify license
> declaration in chromium recipes.
> > Currently, LICENSE is set to BSD only for chromium recipes, through
> chromium.inc file.
> > Archives from http://gsdview.appspot.com/chromium-browser-official
> contain third party source code (ffmpeg for instance) that is not BSD
> licensed, whereas it is compiled by the recipe.
> >
> > Shouldn't licenses from 3rd party code compiled by chromium be declared
> in the recipe as well ?
>
> Yes, they should. The crosswalk browser recipe seems to do a pretty
> good job and could be a starting point for other Chromium based
> recipes.
>
>
> https://github.com/crosswalk-project/meta-crosswalk/blob/master/recipes-crosswalk/crosswalk/crosswalk_12.40.295.0.bb
>
> > Regards,
> >
> > Julien
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



-- 
Zoltan Kuscsik

Senior Software Developer, Linaro Digital Home Group
email: zoltan.kuscsik@linaro.org
IRC: zoli_ on irc.linaro.org

