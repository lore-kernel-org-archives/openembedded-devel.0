Return-Path: <leo.yan@linaro.org>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id AC28E6159D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 07:27:34 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id fa20so625852pjb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 23:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=LLSDWLVNP3Ixtu+f6md2ZMthfYvwwC9fEndSfo3v3K4=;
	b=WHlT5J/5/P5UbnJpbzw2FGz/KZtI4WJohf3thc1a5xn4UApyVbH8e03MGjd2DvLqkf
	mkAx/cnW3y+WAMzbkiZW85RAJcNJ19MCLnt9VQgluAMkevz9IDb97L15KeHredARFjmc
	xkpADIziwERATYOwywoTuqEPMEW+nuuZtyStIq6APVwTkZGtj7JWhH2A4yZQ7toATZ3V
	l3YUUf7quSY0uJqLr2HTS+6BRUllQ0g/YjCsXpWQdwTSNjKeDxdcQuKOqEZDS3zC2SOM
	5yAeZAVUiLQ/TnLc7VWLV2asqI2rXA8Vslgx47nVBZiAEP1AR6mCKohswDGhrdl68Am9
	YWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=LLSDWLVNP3Ixtu+f6md2ZMthfYvwwC9fEndSfo3v3K4=;
	b=mFemvbLvkgMQaWdU3azJLUF9CIByx1WQO5TdEGHn+7XSJ+YY5Zojb6CX9yANW8G8DM
	qifkv41wfo8ZwEvMuzWiI1Uij/D0MOcfl3KJyjUa/Qsf7CNnGvg951bqTvyoQdpW+95o
	832knnKZSCYClHxvioU5PBL4v+e+2ry++Ud2AjPYYO5mITtQ9VPB2ZNjUS8QpUS7VL75
	KvN95wpvWNJ1PKLpo6q3PmNo7lRfWxEYaYas2xuzPXMNFTqaUdZrIWfBzc45E0j9CcHV
	1mWkrBLeBVbEOTywYd+yiodJBNVgd5F471zw7vtSXg8AcBhVsfTUFctrsVe/eOEoS6aP
	m+eA==
X-Gm-Message-State: APjAAAWcc4U846m2UEEQHzPN7Ykz9piSGA/ivBfnRsNALePFLO0Y3Rgp
	ZU+esPXvUtjsbsNb5pL4DN28Hw==
X-Google-Smtp-Source: APXvYqxUty+SPUzS46k886X+PVC7xKs7WcNK+Val4jLDX+/rpZjbAMXNeC5n2CikZ/pD8cYtIfm2Aw==
X-Received: by 2002:a17:90a:f014:: with SMTP id
	bt20mr1025096pjb.31.1582010855724; 
	Mon, 17 Feb 2020 23:27:35 -0800 (PST)
Received: from leoy-ThinkPad-X240s (li1441-214.members.linode.com.
	[45.118.134.214]) by smtp.gmail.com with ESMTPSA id
	f13sm2933691pfk.64.2020.02.17.23.27.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 17 Feb 2020 23:27:34 -0800 (PST)
Date: Tue, 18 Feb 2020 15:27:26 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200218072726.GB9945@leoy-ThinkPad-X240s>
References: <20200218052544.9467-1-leo.yan@linaro.org>
	<20200218052544.9467-4-leo.yan@linaro.org>
	<CAMKF1spwQ+Y3D3MpdnV1OcNSVL=7=fENq8amqpBMq0d6WHuwiQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spwQ+Y3D3MpdnV1OcNSVL=7=fENq8amqpBMq0d6WHuwiQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v1 3/4] BCC: Add build recipe
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
X-List-Received-Date: Tue, 18 Feb 2020 07:27:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

On Mon, Feb 17, 2020 at 10:30:46PM -0800, Khem Raj wrote:

[...]

> > +DEPENDS += "bison-native \
> > +            ninja-native \
> > +            elfutils-native \
> > +            flex-native \
> > +            ${MLPREFIX}elfutils \
> > +            ${MLPREFIX}binutils \
> > +            ${MLPREFIX}flex \
> > +            luajit \
> > +            clang \
> > +            "
> > +
> 
> this will add meta-clang dependency directly into meta-oe, which is not desired
> is it possible to make it optional or perhaps marked when meta-clang
> is not in BBLAYERS

Thanks a lot for reviewing.  clang is mandotory for BCC to compile
eBPF programs, so I think we cannot build clang as optional for BCC.

For marking the recipe when meta-clang is not in BBLAYERS, I searched
with google but seems 'LAYERDEPENDS' and 'BBMASK' both are not suitable
for this case.  Could you give more detailed info for how to do this?

Thanks,
Leo

