Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 97C516E99A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 09:51:58 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id x13so12627495qcv.34
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 01:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=s375j7ltmCgLDh5eAf+Jsv14PUNLN37VFcS1g1fh71I=;
	b=HnOzuQw+hgMdv1K2gkei92PPn12xOznHtwRSagyLZG2tYQv+e7ovbVVFeWJL75B6F9
	dJO2Aq7VaXAymbiaKVBgVxOHG4eSZwCafnPsFkShtlqbiOMvmzkJw5mxmb5mFZmpG6hr
	10xmrHYLv88Gmq5mOFPD+OeDCbaCBnMSE8T6GMWMsGAHa+xRMYIzEg9xcj8s/zueUmz6
	hV92BvuAw/0rojuiT2FrHEg7ZDEymPVAQLNzdV59MGbSKMIrL+7Er4u04bfhyMgp7UG0
	zAtjWaV+e87WWQxFVCBDtLTHrgk0aEVMXYkEVNBLO107TKz06tqEGdLUeuSwWbELxxUM
	A6qA==
X-Received: by 10.140.31.75 with SMTP id e69mr52736484qge.76.1392112318799;
	Tue, 11 Feb 2014 01:51:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Tue, 11 Feb 2014 01:51:38 -0800 (PST)
In-Reply-To: <ldcph7$d94$1@ger.gmane.org>
References: <CAMCfZKFW8mb1d=Q2eJ9mRx8xprbN2dHUQJwZvG-UkUF5Q6TRXw@mail.gmail.com>
	<CAMCfZKFNHREoyX9L2xbwYAoxrcUq1R8-=74u2V1Aiw45QmkC6g@mail.gmail.com>
	<2E2B5ECF-3678-407E-A9DE-58A4F3B271B0@gmail.com>
	<ldcph7$d94$1@ger.gmane.org>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 11 Feb 2014 07:51:38 -0200
Message-ID: <CAMCfZKERD8d1_+x0TMJ3Hq13-qXVkMvzNC=Q7mihD7WXM_QqXA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: xbmc build failing
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
X-List-Received-Date: Tue, 11 Feb 2014 09:51:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 11, 2014 at 7:14 AM, Koen Kooi <koen@dominion.thruhere.net>wrote:

> >> To workaround the screensaver compilation error I've added
> >> "--disable-rsxs" on EXTRA_OECONF.
> >>
> >> Looking at "xbmc/screensavers/rsxs-0.9/configure" It's possible to
> >> pass "--disable-euphoria" option to configure. How can I accomplish
> >> this from xbm_git.bb recipe?
> >
> >
> > EXTRA_OECONF += "--disable-euphoria" ?
>
> It's a sub configure, so --disable-rsxs is the only way to disable euphoria
> right now.
>

That's what a thought. Is this a limitation from oe or xbmc autotools build
chain?

Regards,

--
*dS
Diego Sueiro

