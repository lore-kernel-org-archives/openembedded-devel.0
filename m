Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7201278BDF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 20:59:11 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id d19-v6so439620oti.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 13:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=M3qPIMf712b6sq1TXrj8nUSEMuNB0yOS44yfyWaP2J0=;
	b=RFTpvxov4OLOIW1R1woYdoo1s6EJCS5Kpo7YpEksJg3J5CBMprQ8euZIBNqE2X+u3X
	p+Yslat0jVDSGCwdVi2sUm9uRAcTdiMSMUUb26H3rVlRHhr2BT9OY1zY+iDRNucw+/cK
	CFcTRfSmxrEZVv6H4AbslXgsDBDHNZ9TGT3E8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=M3qPIMf712b6sq1TXrj8nUSEMuNB0yOS44yfyWaP2J0=;
	b=G2uhsXKB5nEhblUVLep5xJl2oldSmFRxER0P07L1Sdamseh9U5ZAYb3vnDXPIoLGp5
	6g+iuYwk9lrxHSl45mmi2zdoWHyno+VI+7k3h2KcJ0rZhApmvOmId9F1AjN3HXJtuyDR
	ppJmFOHOkqw4ycqBs5nGCgkBspkCBZmcVp78ZF4UP83MedjKq9runO0gSRu+QwBc02V2
	fy770zT5t87phQkEBAmF+txh+dKTg/rMuVECZEKUea4lLTC6hMGyBxZ5dGKI1v5RVLKH
	aZgqyKTvzqkzgOzc/NWCJ3TQdwtbrNtjCG1ggfUrZnYjVRjg8nuJo3Ggg+jj36mdWkgp
	MCbQ==
X-Gm-Message-State: APt69E20afWNbCVPGX0bsNjhJdpanckMyKkguDlP98wG/SnLa5Fb7aXC
	q8nxMjAbfskGNwJwEM0c0pbEtIIzxssfUGckVSL1elxu
X-Google-Smtp-Source: ADUXVKKI1DXmqSlpMN6CkCOEhs0QTpigEqvAN6lk9rMPCc1Rpa7rZBMlHhKcI7pGatOkQ/LLIR4CK0ymefpGjQ6IvgM=
X-Received: by 2002:a9d:2e04:: with SMTP id
	q4-v6mr1321856otb.302.1528837152250; 
	Tue, 12 Jun 2018 13:59:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6410:0:0:0:0:0 with HTTP; Tue, 12 Jun 2018 13:59:11
	-0700 (PDT)
In-Reply-To: <22daefda-78eb-98bc-b344-ab8f93aa795d@skidata.com>
References: <10630413.xVAl2E7OaH@yow-masselst-lx1>
	<20180606204244.GA16170@mail.itconsulting-heinold.de>
	<fcaab484-d381-92f7-04d7-2a7edca6f903@skidata.com>
	<20180607132234.GA19704@mail.itconsulting-heinold.de>
	<91e19a88-1a03-b772-b6be-bf6bf27037c8@skidata.com>
	<CAP9ODKrFomJ2Rvp5mku81Op-rYCNt-AXm4TVV2-aSg6QSfEoFQ@mail.gmail.com>
	<d8462836-e655-4bb4-7b03-bce18cb3e24c@skidata.com>
	<20180611113035.GA17777@mbabyjoh-desk.ger.corp.intel.com>
	<20180611120847.GB16619@mail.itconsulting-heinold.de>
	<22daefda-78eb-98bc-b344-ab8f93aa795d@skidata.com>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Tue, 12 Jun 2018 13:59:11 -0700
Message-ID: <CADfgfoY2fJOBt0ayVUfvyt1X079kDk=pc=7pswDmV=uPvuSA_A@mail.gmail.com>
To: Richard Leitner <richard.leitner@skidata.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] maintainer status
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
X-List-Received-Date: Tue, 12 Jun 2018 20:59:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 12, 2018 at 12:23 AM, Richard Leitner <
richard.leitner@skidata.com> wrote:

> Hi Maxin, Hi Henning,
>
> thank you for your answers!
>
> On 06/11/2018 02:08 PM, Henning Heinold wrote:
> > On Mon, Jun 11, 2018 at 02:30:35PM +0300, Maxin B. John wrote:
> >>>
> >>> So here are some question that currently came to my mind:
> >>>
> >>>  * do you use some kind of patch management software (like patchwork)?
> >>
> >> meta-java doesn't use patchwork till now.
> >
> > Yes, but we are using the normal the oe mailinglist, that is why you can
> find
> > the patches with the meta-java tag in the current patchwork too.
>
> Just saw it. Thanks for that hint.
> So should we use it too?
> IMHO it's a good tool for "not forgetting patches" ;-)
>
> AFAIK I still have an account there, but according to the login it's
> "inactive".
> May someone "re-activate" it please?
>

I can help with patchwork. I'll e-mail you with a few questions.

-- 
Michael Halstead
SysAdmin

