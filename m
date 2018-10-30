Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 705B079C72
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 11:25:09 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id f16-v6so5692102ita.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 04:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TQvM7/hygcGpLhh/Y5AgB/K4jipVQPMMoNheGKgZcqQ=;
	b=1GHJD87aS9SyQTuOhl0xkWoGU6CiuJF01AWIcHHW6E5k5u3CVmh5yf7o4+MalT1FXW
	+aCG8C97VzUAMuWlTye3fPAdlyonobs1a3F6yMwfhDmYkys1sy885QYbVIjkhgtJIUeQ
	E/6VAg0mGIy5rPU21yJW4iy/xYrSGVKO2YTXsxtXHEHULAkSPZZOihbpHzXr4vQ3Cexb
	D+ydeuuWrX/pqJmgRHy0771BUORNpedu41+2WShmCUWjg8bcWWUM2e+46v4Q8StOSZ/z
	RJma8GYOpZFYxJKvHWCHaqetkBH7G7T1xMPgjfTnIk5M10dz8m6TZZZ9Fh8+dtQyw0hX
	Q55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TQvM7/hygcGpLhh/Y5AgB/K4jipVQPMMoNheGKgZcqQ=;
	b=Fs5/K8C9ihHFSXWykPedgMVs9CwiFmbPzD/LZgFggIfgrH6oIPAvnhOcjzQn/YObJF
	znG2KwiTnu1dMpMmZuVQSC93O2EJRL48S1NNKC7IkJC4lGBRRBNsyKKPAbCrBHnqQ4iu
	cuZUW65Q2qhxsX+2QCUjuz+Mm8Z2XgNjpIXnwb2kaYOMjXgZ+S6HidhZzILURLmV9I31
	tIFQSa3/fSt4CDuQ2nu4RBhHfWLHHboDs64en0Yt3HxhsBks8bLDRo9QGu86yr13bU2T
	WFSb0oTPRwAPjTGcu0ppp2isf4DXttCKkzm6ypem+myJI3xmpm1DZ2FQ+vzPeF/lV1lR
	D16A==
X-Gm-Message-State: AGRZ1gJnE858OewTFR2uhLVvwD8z3WTB00spiiFERifJ7tWKe4GOkKcn
	Dq3nRxXu4ZTOuzHmzQUEBAt8zVAGylfEIJwNAq1zLWXK
X-Google-Smtp-Source: AJdET5eiwsLi68YZ7jC25sCE302VZqtwx7pu3czI34MVvxVT0NmGDgCPW/1Gs7obNtuR2/vxgqBeKcQ0p83XIUZmkCk=
X-Received: by 2002:a24:36d2:: with SMTP id
	l201-v6mr1072668itl.130.1540898710586; 
	Tue, 30 Oct 2018 04:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<ad2a3fd59975f2af76a55c6c480bbbbc4855f49a.1540830650.git.brendank310@gmail.com>
In-Reply-To: <ad2a3fd59975f2af76a55c6c480bbbbc4855f49a.1540830650.git.brendank310@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Oct 2018 11:24:59 +0000
Message-ID: <CAJTo0LZJv8Pmoqnb5-Xb2Tjms12P_Oa4S69CxdYvHd=fRSWBNA@mail.gmail.com>
To: brendank310@gmail.com
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC meta-gnome][PATCH 02/16] ibus: add recipe for ibus to support gnome-settings-daemon and gnome-shell
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
X-List-Received-Date: Tue, 30 Oct 2018 11:25:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Oct 2018 at 16:41, brendank310 <brendank310@gmail.com> wrote:
> +DESCRIPTION = "Intelligent Input Bus for Linux/Unix"
> +LICENSE = "LGPLv2.1"
> +DEPENDS = "prelink \
> +           gtk+ \
> +          "

It depends on gtk+2?

> +S = "${WORKDIR}/${PN}-${PV}"

This is the default.

> +inherit autotools pkgconfig gtk-doc distro_features_check vala gobject-introspection

distro_features_check isn't being used.

> +FILES_${PN} += "${libdir}"

Definitely wrong.

Ross

