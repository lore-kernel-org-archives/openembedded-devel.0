Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rangers.av@gmail.com>) id 1TT6T8-0000Bu-3f
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Oct 2012 08:42:38 +0100
Received: by mail-lb0-f175.google.com with SMTP id y2so3588996lbk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2012 00:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=D4aJOpCfUMuMP2YeQgeBZS74yw6VnZ0pZ6eJSdsC2lU=;
	b=w+LRNLTC1Lv6ASQI/RKaUh9U/T7plS/knbWpVSrb9MNn/iEbA164d9SSTVs33aG+Bl
	9f7Vvp5K7oQRSG8MvgE//B02oGi8CXeIbdow0x8vnKsOxKXHr0KLJ7OtolBrkCW7T10Q
	jYXI53ZC6oFrVIVzvLByfAy+qC67gMLq87WPHahboupWRsThFOI6ke2TH2KbcK5SAiaw
	cLVG08qfhkUOMA+UJCz7TMfyCg9ajR2OoGrbwdN6DmvqT048FZ/Apr5kvzfQyzb2jhvY
	28RQ/ed1xnNRak6FFQ/abURkAk2lOlXE07KXfMv7I8Qb4LD+bSQCY+Q8Y70UQ+LT2K9q
	xibQ==
MIME-Version: 1.0
Received: by 10.112.9.199 with SMTP id c7mr1312046lbb.70.1351582142771; Tue,
	30 Oct 2012 00:29:02 -0700 (PDT)
Received: by 10.112.28.8 with HTTP; Tue, 30 Oct 2012 00:29:02 -0700 (PDT)
In-Reply-To: <8894147.TkBjTbKHcp@helios>
References: <CAMQ5J2a8zLVVDPNw6vHhgsQ1pRhz_QdqaJJz7U_aQv2MwEg5zQ@mail.gmail.com>
	<1514371.ACA88Gs2zU@helios>
	<CAMQ5J2bC+3514kz1sNsqL_zb10P5rdnsCy_Xd2Z9-Gm1-WdTSg@mail.gmail.com>
	<8894147.TkBjTbKHcp@helios>
Date: Tue, 30 Oct 2012 12:59:02 +0530
Message-ID: <CAMQ5J2ZX6ktGvdWRT8K-MPgQdMdYkZqEjSbiTLSMkL8EWDmsUA@mail.gmail.com>
From: RaNgErS <rangers.av@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Kernal build errors
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Oct 2012 07:42:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

I found  a .config file in the path

/oe/build/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/kernel

and it is a pre-built item,right?


i just done

$bitbake virtual/kernel -c clean
$bitbake defconfig -c clean
$bitbake beagleboard-demo-image


it results in some more error and descriptions. one of them were
unsatisfied dependency for qt-x11..... ,libqt.... etc.

Thanks
RaNgErS

On Mon, Oct 29, 2012 at 5:27 PM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Monday 29 October 2012 16:49:59 RaNgErS wrote:
> > could you please explain how should i check the kernel configuration?
>
> There will probably be a defconfig for your kernel somewhere, in a
> directory
> next to the kernel recipe.
>
> > and changing RRECOMMENDS to RDEPENDS
>
> Have a look at the recipe (I guess recipes/tasks/task-picop-demo.bb), you
> will
> see some lines that use RDEPENDS to bring in the kernel modules.
>
> Cheers,
> Paul
>
> PS: please CC the mailing list on reply, thanks.
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>



-- 
     RaNgErS
THIS IS STRANGE

