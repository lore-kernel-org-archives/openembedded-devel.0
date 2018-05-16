Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id A183E74853
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 17:40:33 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id n202-v6so4022415ita.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 10:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ymmxzt+8H9cx1jzOWhzSon3HH5oGNnVXAKYiVOzBwfg=;
	b=qzonJk4sMTVcy6MHZvkm1Nat1G1IA/8IYXi7SERPMpicUY3CUdh+/IYsuJPTrAZJeN
	INBSPfTyrStLC9bwI+YlRcBk4mzWApOW6MXBbPEPFiM2iawdfkDtmP91HpQqJdj+r2Rc
	5Sx+gQyGj0XLKspC/yk15adCVOcaV4tOkrvgTDrDopoM0jXubrMpVsK4x9ud3GLeQV5O
	gGMaNjfqrqYgyhxuFDtGCKuUruVc/2qKDhJN1+LtRu1z94fkkICRVvNmjxGj0ksfJ0WO
	AFaeOeqZJQjYH/60/Trq4UUOH5o9a2KBOPkfFHWu9XgIaXhvh8mxmzxik5NgLmQnJMIW
	9TXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ymmxzt+8H9cx1jzOWhzSon3HH5oGNnVXAKYiVOzBwfg=;
	b=e6l8IVoSKhqB9+RJjwJcr+BUGIkjyufFphpC9n3tFtkJi6DJ+0gJuN9tJTCJX3NYdb
	ckWRvtIShmLF8RV/ECVdOvHxKDNnkosYOtq5ybYQQ7b2mgzcQito67qjFSVVtOK267lV
	tsfKRriAOSh1p2yJC1y4/38SAKXFXDX799r2s2n2Gq06H6sdJUlj3ORLjdmSN6cHO4H6
	UZ6mFUjdQCHgCSDkjWY+4ASceh4uqHquhB2vv2AtK3/CT8Ii7LgYoSC8uViZR5+L4oAR
	SHoWQd0bEy93w/4UDF1cMsiiLTKUL5muLOaRRM3xWfU0t3L6E9jBI3+Uxr3Hm/8/N4/k
	GtsA==
X-Gm-Message-State: ALKqPwcJkENCuo1Dl+88clzP0UHidQWQ4cKg7KI7F4ZEIZW4K2svCcUF
	/kemTsFM5yU1EGCgHdvXvUHvPqPW
X-Google-Smtp-Source: AB8JxZos6crgpMOloFOOXpsCA74GB/kKWNb7R7QSfsY/WPzAd69SE4MTutAtxfgMtiQjGTfHyXuDFQ==
X-Received: by 2002:a6b:b5c:: with SMTP id v89-v6mr2376476ioi.28.1526492434699;
	Wed, 16 May 2018 10:40:34 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95]) by smtp.gmail.com with ESMTPSA id
	i76-v6sm1775402ita.33.2018.05.16.10.40.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 May 2018 10:40:33 -0700 (PDT)
Date: Wed, 16 May 2018 13:40:31 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180516174031.GA19844@linux-uys3>
References: <20180516170632.15614-1-twoerner@gmail.com>
	<CAMKF1sqAWHSmiphAcc6GvgmJaOybVVVSOB0HG_9GrU=gGmSVkw@mail.gmail.com>
	<CAHUNapSxvc4LhyfuR-VNeAaApxv0ujRddwavFCdpH59LLb+0qA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHUNapSxvc4LhyfuR-VNeAaApxv0ujRddwavFCdpH59LLb+0qA@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH v2 1/2] openh264: fix build for 32-bit intel arch
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
X-List-Received-Date: Wed, 16 May 2018 17:40:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed 2018-05-16 @ 01:32:53 PM, Trevor Woerner wrote:
> > >  EXTRA_OEMAKE_armv7a = "ARCH=arm"
> > >  EXTRA_OEMAKE_aarch64 = "ARCH=arm64"
> > > -EXTRA_OEMAKE_i386 = "ARCH=i386"
> > > +EXTRA_OEMAKE_x86 = "ARCH=i386"
> >
> > can you take another look if there are other options eg. i686 ?
> > if in literal sense it means i386 then we should not be using it
> > for newer i*86 arches.

According to the README
(https://github.com/cisco/openh264/blob/openh264v1.7/README.md#for-all-platforms)
specifying "ARCH=i386" is this project's generic way of saying "32-bit x86
builds" (which is why the recipe needs to "translate" between x86 and i386).

I'll send an updated v4 (this was actually supposed to be v3, oops!) with the
+= replaced with an _appends.

thanks for reviewing! :-)

