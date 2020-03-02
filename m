Return-Path: <brgl@bgdev.pl>
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
	[209.85.166.47])
	by mail.openembedded.org (Postfix) with ESMTP id B1371618E8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2020 17:40:03 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id c17so309412ioc.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Mar 2020 09:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=U2NAp4Rnch/uFUcwITlmnK7kPwUF3wf/kzbLeYcUmIk=;
	b=J4rUtmZ+iQ0dgpFv8C6CaiYnsovEtzgtr2q0bpegF5iglZCjx2YxooHbBjgI4m82hH
	s+Oo8iB+HQ9zqI/hpBMPLeJZM5GccrXRqcAQwdSqgvgA8eup3XReCYTA8PFrBDc2gBaF
	7DRsAQfbjhq+TlAkduapE+aRzqs+WhWP+LVv6PGrtouG+IeU9OJWXN5zJZshwzPEtvri
	PcRd4jRgLApraEq9XCc1zcqHGmc4yEqxyWKviJp9a51DaD3ZrVOizFKs+alEcYI65UjP
	sLlCuJMyumFNLN73J9JO2IXjynDs0G2+smqpES5xH7K2LI/lFVskssvGJadhvTc85A2n
	JK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=U2NAp4Rnch/uFUcwITlmnK7kPwUF3wf/kzbLeYcUmIk=;
	b=naodP7pwqFgoOS3NDw6KoNNwFDcYbpBqJ80REk/1k8DPV2vl9uu4jpZqjHcwPPMoyP
	dl8EiLURlKndrAj8QnWiIzW9Z3IHXOA/xj8/IEVGBZvb86AaTiCVAkwv9Oon/RCnCtrl
	nfQfUsCq2dhA7pNBCjVgRyBKC3Veeh213d7+fc0ANIsBQqtolHd+fyHfYcGXRWu/AHEG
	LmXHHHu4oT9dez4fg5xTGnzpAzeB6dSdz3NgI7Kg+An8SsOPXZzG4lBhJtD43T2e477K
	HtgHKFZGXjvqNszN1zKUJ064/VTn+Hevx6BRdIlUY975eDqlrDQwfgZJlGsyWog2zO8/
	bOcw==
X-Gm-Message-State: ANhLgQ2O6SdjL6i3QYLjL6R2/ou0RIM4qalACaViSLK/PnO13zeans+y
	kZR/qcJWiu3R20O9YjQn9e027hg8TdauUn+AO4uKoA==
X-Google-Smtp-Source: ADFU+vvcvHTHBaGRG0OSvgVMYYJ7tzj13Lar4YAY4QHCzLu1gBcoa5WcSNYgV90CbLHXj2CfioHNLGMYdxDIiwMwf34=
X-Received: by 2002:a5d:8952:: with SMTP id b18mr577596iot.40.1583170804667;
	Mon, 02 Mar 2020 09:40:04 -0800 (PST)
MIME-Version: 1.0
References: <20200228150345.11829-1-brgl@bgdev.pl>
	<CAP9ODKqbfrnLUBzE+WkGceSo+qBimGPUFUcgRuZmS3vwJZqpwA@mail.gmail.com>
	<CAMRc=MftVskWMFZQhbFKZLwNAR9a1+4zbayWTbXFuSJgG-ZgbA@mail.gmail.com>
	<CAP9ODKpVW6qxw7+5oA7auBMW1ApLdqjicZf8Ahe3RhYG8QjmgQ@mail.gmail.com>
In-Reply-To: <CAP9ODKpVW6qxw7+5oA7auBMW1ApLdqjicZf8Ahe3RhYG8QjmgQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Mar 2020 18:39:53 +0100
Message-ID: <CAMRc=MeJ0R81s-ui7J78pe89JE6c-_wx3RGUZx-tzMLc3pzthQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-ota][PATCH] meta-ota: add support for binary-delta images in a new layer
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
X-List-Received-Date: Mon, 02 Mar 2020 17:40:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pon., 2 mar 2020 o 12:25 Otavio Salvador
<otavio.salvador@ossystems.com.br> napisa=C5=82(a):
>
> On Mon, Mar 2, 2020 at 4:37 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > niedz., 1 mar 2020 o 14:43 Otavio Salvador
> > <otavio.salvador@ossystems.com.br> napisa=C5=82(a):
> > This single class surely doesn't justify a new layer but I have a
> > bunch of other stuff lined up for upstreaming if this is accepted.
> > This is thematically separate from most of the recipes in meta-oe too.
>
> So please give us an idea of what are your plans, so we can understand
> it better.
>

Sure. Next steps would be:

- Adding a class for generating provisioning partition images.
Basically allowing to split parts of the rootfs into separate ext4 (or
other) image similar to what meta-mender does in its mender-dataimg
class for /data but generalized for configurable directories.

- Adding an image recipe for a factory reset system, where we would
store the provisioning rootfs on a read-only partition together with
an initramfs the role of which would be to reflash the A/B partitions
to bring the device to a known state, this is something we do a lot in
our consulting work.

- Adding standardized target-side scripts for applying binary-delta
images. This uses the fact that many OTA frameworks support extensions
to their client programs. For instance the same script could be used
for applying the vcdiff and rsync patches both as a mender update
module and a rauc handler (with a thin compatibility layer in their
respective OE layers).

It still doesn't exhaust the subject but I think this really makes
sense in a separate layer than being sprinkled all-over meta-oe.

Khem, Armin: any thoughts?

Bart

