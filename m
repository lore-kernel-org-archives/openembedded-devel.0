Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id EDEE06093E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Apr 2017 16:52:17 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id o81so5986644wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Apr 2017 09:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=haMB2Z7ahTUsACKy7Zv1imJTdbg1B9G8SPbD9OsI9qk=;
	b=Z7ipE8ZCv1xlOvPuz9I+Qu8ZxVdmvev7f61XYKvI7GL3upQKMFxZ3QJ/EL3sFgRLSR
	Op8FyXrsWD9+HSMxjdQy9ZrsfkY2mu1VqQqqimi+i+fBi7xVBzjo3O1oMcARk1BOgHti
	S7GkwKLhc4UtaI/+2pGIvzvfmzLGSUbFF4IxyD/nJvXV3yd9/5ApXdQuzeXWanL1Nvzf
	zpLhR6ZAuvui6UpROSQ0sLzcpaWOTGNIVnIFEThdD4IP5guz8JAo8quyimfLJCePGLG5
	Lv5uiKwV9vFk2SNAxF6yBOqQ0U3RzGH8JWalu497cECXCB5rTfgxA/ioqlntZt83eccs
	hC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=haMB2Z7ahTUsACKy7Zv1imJTdbg1B9G8SPbD9OsI9qk=;
	b=U5brZSjZ8dnH6DePRIXtzD/SORAlVYiLsvfr2IFyCMvTpDMjuH3pAJ4FLN5jTEvp7x
	g1ogpdNJLke27am7vUpRtB78BiScOt/xJlBSj1k6dKt+7b/MDZ8raQqHVDMxHPIhLzjv
	JzUCTOH41+qsrhosUxk7VNTgFnOaXA6VYu8YJz9e688LrWVtDlX+TwhaXd19yDa4mokN
	vZoARpGjbn/lebUzPKKcoW+I7eOjAED4tt4WzgpIIQsMWZVo5ND0d3QYVrxcOLgZAsbc
	4Qjvxz3LqtOKTGzSu5j24G9EvKn31SwDXsREm4Yc82SfKK5gCALXSa1Y5Jp+BfRV4OIr
	G7/A==
X-Gm-Message-State: AN3rC/4exANvpMOO6uhXQrGQ82z6/KCQxcHrzb62S6x1YFeXTTCdeIbY
	Af+71MalxFbyLQtRhW2Bzy94Tc8eUg==
X-Received: by 10.28.234.205 with SMTP id g74mr19375178wmi.13.1492620738669;
	Wed, 19 Apr 2017 09:52:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.141 with HTTP; Wed, 19 Apr 2017 09:51:48 -0700 (PDT)
In-Reply-To: <20170418182142.27253-27-raj.khem@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
	<20170418182142.27253-27-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Apr 2017 09:51:48 -0700
Message-ID: <CAMKF1sqP-mQDReWq=Ttt5+RHB01DHHjdDTPKhuk4tSRT=S4qSA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][ 27/32] mosh: Upgrade to 1.3.0
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
X-List-Received-Date: Wed, 19 Apr 2017 16:52:18 -0000
Content-Type: text/plain; charset=UTF-8

I sent the series but its not showing up in patchwork again, I have no
idea whats going on. Meanwhile you can cherry-pick them from

https://github.com/kraj/meta-openembedded/tree/kraj/master

On Tue, Apr 18, 2017 at 11:21 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-connectivity/mosh/{mosh_1.2.4.bb => mosh_1.3.0.bb} | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-connectivity/mosh/{mosh_1.2.4.bb => mosh_1.3.0.bb} (93%)
>
> diff --git a/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb b/meta-oe/recipes-connectivity/mosh/mosh_1.3.0.bb
> similarity index 93%
> rename from meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
> rename to meta-oe/recipes-connectivity/mosh/mosh_1.3.0.bb
> index e4d5b69bc..9fc8435ee 100644
> --- a/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
> +++ b/meta-oe/recipes-connectivity/mosh/mosh_1.3.0.bb
> @@ -15,9 +15,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>  DEPENDS = "protobuf-native protobuf ncurses zlib libio-pty-perl openssl libutempter"
>
>  SRC_URI = "http://mosh.mit.edu/mosh-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "c2d918f4d91fdc32546e2e089f9281b2"
> -SRC_URI[sha256sum] = "e74d0d323226046e402dd469a176075fc2013b69b0e67cea49762c957175df46"
> +SRC_URI[md5sum] = "d961276995936953bf2d5a794068b076"
> +SRC_URI[sha256sum] = "320e12f461e55d71566597976bd9440ba6c5265fa68fbf614c6f1c8401f93376"
>
>  inherit autotools pkgconfig
>
> --
> 2.12.2
>

