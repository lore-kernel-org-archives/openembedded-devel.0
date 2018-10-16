Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id BD4C771A36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 04:40:21 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id u12-v6so10768829pfn.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 21:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oCYcmj5ysgi97JoEDFd3RX8j0ZOY82Mx38KGCgB8WFY=;
	b=CBkoPLIxCCAxZTAerCSw4VnopmuwW9/4lNL+ALK/4Ht4eongtfvk5MvqQMbxgiYDFl
	rL5TX02hBLEqVOCfGuq4Hr45kLvzW5NKWWKZwvalDwkmpWSf9FBqQd66KwMmsldckvNr
	X5dUfT2tCiXewjUkT7o2eq4T9T7XYR9TnhMZHcRcHAo93AhT8DXyrQ2cCqpXWZ+3WRzc
	44eMVY+DxEeJ+I8C7mZ1S1k30qtEwQ1SxJB/HSrAfY7xNJrRnzvUYjBJzb9rfNrS86dP
	s8nvcioN9vJSOLgtTLzavSIpvpPD/JGGJ+i+UH8ok+Hy1IUJXfRSQTHRqHF7DJGfAlm+
	4xZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oCYcmj5ysgi97JoEDFd3RX8j0ZOY82Mx38KGCgB8WFY=;
	b=OVcclVGc72WEllybRN5CcOeX5ico62jj19nWo3kO9zymqng2lhDuDt/rzODVsCIVwn
	5MErwnexZZ9JYp0lnkSQKM5ght0l+LNv92CwIyu85M5EcpVc44SxhSISe6TAhTbwha+e
	CVrj6TkL0UuFvtcgaHKGKSTFyzEu+/R6ggPmXZ6U3Psuf6RznlwIpVUPqcNbC6ZSl72+
	Zm4pJgK0gh2JI2FeiIq7VC9trPvWws/HsyrXfVJcxunfwZ1nsLQlOaFuy/KW+/wIy2Vm
	Gz/jBbTaiLDCdq74e2rWLX71voVCxl3b5xLPik1ecAmwVpmwI3dBlzh6LYTzRhzvgfDD
	Hf5g==
X-Gm-Message-State: ABuFfoiXtRf4BolDOkfnylJtzACWh5SnNxoLu6fjCk16ggbIYlkxQPpN
	BmNBl3HR+gGKa3ysnpXCg8mTjGJy1C2JddZrTX4=
X-Google-Smtp-Source: ACcGV61ZsGw2pcNea+sGWFLGjxfyDOHydVacvb7iQ+ZSNShvVeZoN/ZTqiw0Fde4wNHAGQ6l96b2MPKQs/7M8JA03JU=
X-Received: by 2002:a62:221c:: with SMTP id
	i28-v6mr20643338pfi.196.1539664822592; 
	Mon, 15 Oct 2018 21:40:22 -0700 (PDT)
MIME-Version: 1.0
References: <1538581223-13647-1-git-send-email-ankit.tarot@gmail.com>
	<b0446aaa-3f8a-54c1-539f-887f671b9cb5@gmail.com>
	<CAM_RqkOLurOJ7DSHwAeQ3OzXE4u-mVGDE02Vc5izuRgRU=SXEg@mail.gmail.com>
	<CAMKF1spEdZOse-9yh6f3ia+evHJ_+6OJni+FePF_jEDSXvE4vg@mail.gmail.com>
	<20181015031245.GB7186@denix.org>
	<CAM_RqkPb0pFu57guB7gL5NLni-+pvdwqyLS2vL1rB8-q8Jbimg@mail.gmail.com>
	<20181015181410.GF7186@denix.org>
	<CAMKF1srW5-fDXbsEsFYS3Dj1AAPCCNfEhVpeYzBod66jaZu=EA@mail.gmail.com>
	<20181015190052.GG7186@denix.org>
	<CAJTo0LYk2Z866pnf7gAt=JaqrfF+f857SDet0G-iLssvp44fVA@mail.gmail.com>
In-Reply-To: <CAJTo0LYk2Z866pnf7gAt=JaqrfF+f857SDet0G-iLssvp44fVA@mail.gmail.com>
From: Ankit Navik <ankit.tarot@gmail.com>
Date: Tue, 16 Oct 2018 10:10:11 +0530
Message-ID: <CAM_RqkM+suSb8nVeiCsbPGG2WC83Pr-QXwJz8OwFca1n9X7CpA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] opencl-headers: Initial recipe for OpenCL headers
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
X-List-Received-Date: Tue, 16 Oct 2018 04:40:21 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Ross,
On Tue, Oct 16, 2018 at 12:37 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Mon, 15 Oct 2018 at 20:01, Denys Dmytriyenko <denis@denix.org> wrote:
> > > > > > > > > > +do_install () {
> > > > > > > > > > +     install -d ${D}${includedir}/CL/
> > > > > > > > > > +     for f in ${S}/CL/*.h; do
> > > > > > > > > > +             install -m 0644 $f ${D}${includedir}/CL/
> > > > > >
> > > > > > Single file install? Not very optimized...
> > > >
> > > > > Its not a single file, Installing all the header files.
> > > >
> > > > It's a single file install in a for loop, hence my comment about being
> > > > unoptimal. Why not use "cp *.h"?
> > >
> > >  I agree its suboptimal use here. May be
> > >
> > > install [OPTION]... -t DIRECTORY SOURCE
> > >
> > > could be tamed to make it better.
> > > however cp messes the file permissions up if not used with right opts.
> > > So I would not prefer it unless used with right
> > > options to respect the file perms. Install does it correctly,
> >
> > Agree, cp would require passing correct options, but there are plenty of
> > examples alreay.
>
> If we're bikeshedding a micro-optimisation then surely this is optimal:
>
>   install -m 0644 -D -t ${D}${includedir}/CL ${S}/CL/*.h
>
> That combines the mkdir and cp in one command.
Thank you for your suggestion, but this one line command still throws
error of No such file or directory.
Following line will solve:
install -d ${D}${includedir}/CL/
install -m 0644 -t ${D}${includedir}/CL ${S}/CL/*.h

I'll send this patch in v3.

Regards, Ankit
>
> Ross
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

