Return-Path: <jdmason@kudzu.us>
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
	[209.85.166.179])
	by mail.openembedded.org (Postfix) with ESMTP id C82EF7FC4E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2019 02:40:38 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id g12so13423021ild.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 18:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=ufIwhoTkrpyxZykUmq2pmvPbPe6VuyVkxwdu0fD04oY=;
	b=a+ySI2ImKZbuZsPSjzB8pyS1HHwnPxYYRocJJYKWDAmccO2JKnCy/OnlJcjjfYSpop
	2cgEsWh+Sz7EbqkiH6SiNYVm9Q/+npWW0UJRuP+jeBlroEu9T+fGN1If7jCQpjAprZNV
	l9q4kgaymif8tatA42ornw4FJP90NbfDN3ThXccOflp2gxO7x9e+qjYELtsQ7igKDYYP
	FelJtiKlDWlKKndT8boRnwbN8Vewr7owfLT1yGtBlzn7Fd20DcLpHhhQGZLXO81NHRFW
	iK/csfX18OedxTodDCU+xqkP/Wj8BpMQUQxLN2h+JJU/Y/m66aEbKcHZUkLHprTGC5Ym
	0d6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=ufIwhoTkrpyxZykUmq2pmvPbPe6VuyVkxwdu0fD04oY=;
	b=dFF6hG8cly8NGass8d/EVJ1//KSRKKYNfjflqfB6drz2hbD2kmo4I8cJeTBhMsylI5
	H82bdWGxYY6aSMIzW8cmpslI5GnPQrs+z/DyAuygJWPDmE3ow4D6ogin4/1z0wicY0Ca
	8CcAF7qOCAr5+fLpEEpvGSdYNP54Ciuh7IY1jT/I994jHNS0Y0bmpjaQy54mr8vT8gWv
	SrBiMTkxJulb//xyWM507mAsnnDBSqWymjD3sBjyPTw6tqqMnGDv2CPIGoYeI/VwED8J
	FjvgYR2I25d1RcxJwGJrsVx0SBJEsDauBjhkOf8xovwPuGz7W8QDBEOnJALWCUoQh9W8
	Jdtg==
X-Gm-Message-State: APjAAAUOtFMrgoce1qPL6mU70+RvZrY7KBImszzinnbtB83tfSLtSCuy
	8+JD2aLuPdOY/HV3lWTlIREKtbBsab0YmSFPXbvbQmYfBvhaVg==
X-Google-Smtp-Source: APXvYqz+i8KpXd753hb94eNGiHvyr4+kMeGPm2RiCguxbsGvd2ixMpsVmq7kBzobQbhEtvMFWFqMZM3JU/BfOiNExQs=
X-Received: by 2002:a92:cf46:: with SMTP id c6mr28097876ilr.159.1574908839616; 
	Wed, 27 Nov 2019 18:40:39 -0800 (PST)
MIME-Version: 1.0
References: <CAPoiz9w9qWwEqMipK7iF-VLP5dFH21nZdTCpeLNncsqHHpFJxQ@mail.gmail.com>
In-Reply-To: <CAPoiz9w9qWwEqMipK7iF-VLP5dFH21nZdTCpeLNncsqHHpFJxQ@mail.gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Wed, 27 Nov 2019 21:40:27 -0500
Message-ID: <CAPoiz9yEp0xESQQYjBqAOoQTbv+CtkY+uw50_bBtV+ntQL2xPw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Yocto discussion list <yocto@yoctoproject.org>
Subject: Re: OpenEmbedded Workshop at FOSDEM20 CFP
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
X-List-Received-Date: Thu, 28 Nov 2019 02:40:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 21, 2019 at 4:12 PM Jon Mason <jdmason@kudzu.us> wrote:
>
> We are proud to announce the inaugural OpenEmbedded Workshop. It is
> being held on 03 February 2020 in Brussels, Belgium. The day after
> FOSDEM.
>
> The Call for Participation is open now. For more information, go to
> https://pretalx.com/oe-workshop-2020/cfp
>
> Early-bird tickets coming soon!
>
> Thank you,
> The OpenEmbedded Board

We forgot to mention that the deadline for the CFP is December 15th.
Please get your topic in before the deadline.

Also, look for early-bird tickets next week!

