Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2FECF6A5A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2013 12:58:30 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id j1so2486427oag.32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2013 05:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=yRMgUKe47DS3FCgD2yr4BOE5qElJ92rdKVi1BmENxLk=;
	b=FXUHrxTlR6IFGEJWpAmeKRjtbcYyv5tzvZwW2FbwFR/ZzeKsWt6m+V+JnDeH3GLC/z
	SqnNC+BMXWcIComDO5oHRuT0ML50K6Dz1ZXsJGqjneBde3aAbThAMwOPyW6Jgm1dHzW6
	mTuUmdxVBs2YcifH4gXpJDNUBiBFIXITOkxjgOXpPCo4i/FK0XPoiExnw+yMggNgWtGR
	AjX4Rf639votr4d7jDT8RxhQkw2mzOZ5KFJS0DytTEOuf4ZLo+uJ8ETzTrOL+GrRQrJl
	knrngi1KsD2kwDQ8r8dgSyxGWcJ8+weR0pyDS9EGKTbwVotNchtjflZ/0TYkwDgDBFaM
	C/nQ==
X-Received: by 10.182.61.46 with SMTP id m14mr2383764obr.58.1374065910349;
	Wed, 17 Jul 2013 05:58:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.126.144 with HTTP; Wed, 17 Jul 2013 05:58:09 -0700 (PDT)
In-Reply-To: <CANS_96Zyg_YLS0zXpf8vuHHSDcWMFwPzRMqSwRpzjBWSLvwBQw@mail.gmail.com>
References: <CANS_96Zyg_YLS0zXpf8vuHHSDcWMFwPzRMqSwRpzjBWSLvwBQw@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 17 Jul 2013 14:58:09 +0200
Message-ID: <CAP71WjzU1YPRfVjx3S4EuM0vRKWSvgRQr56bdEafFMPhA7gaeg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkRAhjtNeP+jN1tqVdVk1CrpR+rsrMATyCpQioAk9TWVhnQ+JYICDihC3/yfbz31/FAQZp7
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Cross-Compilation of ROOT for ARM machine
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
X-List-Received-Date: Wed, 17 Jul 2013 12:58:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 16, 2013 at 7:37 PM, Brian Kelly <bak2132@columbia.edu> wrote:

>
> I am trying to compile the Root library (ver. 5.34.09) for an arm machine
> (i.e. a gumstix verdex XL6P running the Angstrom linux distribution (a
> computer-on-module)). I attempted native compilation but I kept getting an
> internal error in the compiler program, which led to suspect that there was
> not enough memory for the library to compile (this is most likely the case
> since the library compiled fine on a debian arm emulation using qemu).
>
> Now I am attempting to the bitbake software. I followed the instructions on
> the website http://wiki.gumstix.org/index.php?title=Verdex_Git_Repositoryto
> create a working bitbake environment and verdex image was created
> successfully.
>
>
> Now I am trying to create a recipe that will allow me to run Root.
> Supposedly the libraries have been built successfully but the installation
> on the gumstix fails (see attachment).
>
> I have attached my work so far (my recipe, the terminal output from the
> computer I am running bitbake on and the terminal output from my gumstix)
> and, since I am quite inexperienced with bitbake, I would greatly
> appreciate
> any constructive feedback that will help me get the Root library working on
> the gumstix.
>
> Thank you very much in for any help that you may provide.
>

hi. i am not sure exactly what you are trying to do here. but you seem to
be using quite old instructions that relate to 'OE classic'. The wiki you
mentioned hasn't got any update from more than 2 years.

many changes have happened in OE, i suggest you start with
http://openembedded.org/wiki/OpenEmbedded-Core

you recipe as it is written wouldn't work with the OE-core, and guidelines
to migrate recipes can be found here:
http://openembedded.org/wiki/Migrating_metadata_to_OE-Core

i am not familiar with gumtix, but you might check with that community if
they release an OE  SDK you could use for cross compilation. or you can at
least get more up to date information about how to add your recipe in their
builds.

