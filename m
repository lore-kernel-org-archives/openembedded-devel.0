Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 813BF746D3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 12:00:11 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id k206-v6so13348776ite.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 05:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6z3FObvxiOKZf/S2UgA0yfTxmfrNT5vQ3x6bkmEgok8=;
	b=U1hjvOd/PW/vD4j5lFNfmRQeJlXiUCMf/FNtijzSDyFE/atQKaRYcSHYmNqhggs14T
	xxFYb7F4sxtuOkbdBfL5GbrT2UG+vwdkimMtWMGpTvkITjuxzttHNE+M/uy0rfWTFNPM
	BZQWOHkTtqfmKoahtB20dGXvtAdbdvnjZ49B6FIqdZ4yF556VRmpAUsyNMh9GR1TF/S/
	9OxJowQ49sQenGF6zHA2pSOgKp2mpR8rovVLhS/wSTCSgRUE1PETL4Mv7Dl/JO0TdxBN
	BWnLk74NMblbki7DbPYa2U0sh7BV9iBxp0ZGiwzVcnt7zH9ii3U81UPMvLllnjbXLOry
	Qe2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6z3FObvxiOKZf/S2UgA0yfTxmfrNT5vQ3x6bkmEgok8=;
	b=H0OQhavWtXfSdanI85G93aiHcNn5IBHrYWaqAAfUoOuJMqW/pIhHQlb7dyAgFzNWot
	WTcKSF+N2R2GkACZvQR0Tq+YnBJIo+hGBsu3NjQ1oMAvZblZaz+GQHDB7zejHuDQdm6L
	T2EtylcVvdp1bKEvHrtzrSO+QTGNmeyyRyAKVp3JJ9tbAm9+cC0+OCLBlIRujjIlnkuE
	c0L5NADOvJ28WQoOnGtnhJn06WwKE/qS9YTfNgOxGBjZ3NhURHWI5M34BReRjr29f/8V
	Dw+9i2ovuehkkaSML3IwKYgZjIlAE19qNYDBNinPdX0BHMRwhZ0GhPRF1prbFLuRVzzE
	Kazg==
X-Gm-Message-State: AGRZ1gLTOGEoTjtku9y8pRXh2slD7OtzBZoA+/U0e9p27E20lRtaM7zz
	+YL5G1A39d6oykxBYefZjmjpan8I5P7dL7JHb5tk7A==
X-Google-Smtp-Source: AJdET5cl9YFYTkpjIwkrzLO4nGXsPAF87/RC8wKhlno67yf92GG5QVyurglxHEMVe7lxKjQPwEhSPXtOEyrJUXv9ocY=
X-Received: by 2002:a02:601c:: with SMTP id
	i28-v6mr13703467jac.105.1540900812459; 
	Tue, 30 Oct 2018 05:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<9f5b028fdf90a7650a62e538889580dc31864a6b.1540830650.git.brendank310@gmail.com>
In-Reply-To: <9f5b028fdf90a7650a62e538889580dc31864a6b.1540830650.git.brendank310@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Oct 2018 12:00:01 +0000
Message-ID: <CAJTo0LYZ8fX_70zxUkL+ASUDKxEeS+Qx=EmwjcmzWFkB2HC+7g@mail.gmail.com>
To: brendank310@gmail.com
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC meta-gnome][PATCH 14/16] packagegroup-gnome3-base: add packagegroup for installing gnome3/gnome-shell
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
X-List-Received-Date: Tue, 30 Oct 2018 12:00:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Oct 2018 at 16:43, brendank310 <brendank310@gmail.com> wrote:
> +LICENSE = "MIT"

Implied by packagegroup.bbclass.

> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

Not required.

> +RDEPENDS_${PN} = " \
> +    packagegroup-core-x11 \
> +    xinit \
> +    atk \
> +    at-spi2-core \
> +    at-spi2-atk \
> +    cairo \
> +    gnome-shell \
> +    gnome-bluetooth \
> +    upower \
> +    pulseaudio \
> +    librsvg \
> +    ibus \
> +    gnome-desktop3 \
> +    accountsservice \
> +    gnome-settings-daemon \
> +"

A large proportion of those are libraries that will be pulled in
automatically (atk, cairo, librsvg, etc).  These can be removed.

Ross

