Return-Path: <ian@boundarydevices.com>
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 88F7962134
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 16:56:44 +0000 (UTC)
Received: by mail-vk0-f49.google.com with SMTP id t129so123636716vka.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 09:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=boundarydevices-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=2CsXYcncEuLKWOuzcFl9Mc7SYfYMcNE7eDrSI2llj0I=;
	b=R3S8DGlYT01RuZ164yiycg2zFPrfj/dCr+5TBhgRwsBrgAf3nFdRXFJdFQD/N4s5lX
	bUowYI2zgmhpFpNJJKJTX1K25JLLU7yIvnFXSnlzcsq3nLQqVISlLcNPDI/sRxyM913+
	0+hPms9Jb9Tls2zD/lFIXKYKWIunacZjB8YA/Azac4op4PRwaMLfA9vOhwuDI+kLW/SH
	eR24t1vqmDWAH3+ACW8wxOM2fJIULBkySgSsK1MfyjoMJm8i2gFORaN18kCPfCG82FZE
	sSZ5H3YmMdw1HKxi+GbT0k8GSugp418f0TrTb2t36jGWBCpxzqwDsBXjDw+LsB5jCA3D
	lSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=2CsXYcncEuLKWOuzcFl9Mc7SYfYMcNE7eDrSI2llj0I=;
	b=hBS1H2uMDFmqf7gjU6zhqEGDFS3f+X0wjfAdki4Cp9Wh8mprIdgaqvM2drb+Vmuca0
	ATRCWpX137YIi5hc5Autp+9o1P/AMaXkN/3u6wdrRlXEYfaFErnVO9jlCcCc2ot04Lvy
	HdLL6txZy985ZdfZ3ZGnVErqinzkuSFxL06j4WAHc2AjjA63FlEB+/YB2mcUxN31+/SP
	DaiguIv3jBtQ+5880qjUW/bQ0nR3bjWxki3zSwVbUVsuAzndl9ELZ9kVflqKurWWx6bH
	XXBUXhPIaqgq0y6GOAbs3AiSF4PZoiE4vdqYw0XiwD7cZ9S4th73wdD9VapSBwfN/9ZW
	odGg==
X-Gm-Message-State: ALyK8tILlfXsrlysjJRqVWG5ESJGyGH5AVkiRbb57mABRLCGl5bm9jre3OcUsOvaQZA/lLecTUn957t7SP9JIw==
MIME-Version: 1.0
X-Received: by 10.176.6.165 with SMTP id g34mr1157788uag.130.1466182605335;
	Fri, 17 Jun 2016 09:56:45 -0700 (PDT)
Received: by 10.159.32.16 with HTTP; Fri, 17 Jun 2016 09:56:45 -0700 (PDT)
In-Reply-To: <3500964.FV5XFluSRj@localhost.localdomain>
References: <57625081.8000304@mlbassoc.com> <20160616090833.GA2563@jama>
	<3500964.FV5XFluSRj@localhost.localdomain>
Date: Fri, 17 Jun 2016 09:56:45 -0700
Message-ID: <CADseiPnqtEB_m4jgoZtTJ-8AjM29X0nOiGa51phUpZg4_VN_Ww@mail.gmail.com>
From: Ian Coolidge <ian@boundarydevices.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-browser] Browser blacklists
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
X-List-Received-Date: Fri, 17 Jun 2016 16:56:46 -0000
Content-Type: text/plain; charset=UTF-8

>
> I ran into this as well and had to spend some time figuring out how to get
> around it.


How'd you get around it?

On Thu, Jun 16, 2016 at 6:32 AM, Davis, Michael <michael.davis@essvote.com>
wrote:

> I ran into this as well and had to spend some time figuring out how to get
> around it.
> Some sort of note in the readme or even commit message about how to get
> around it would have been nice.
>
> On a related side note it would be nice to get krogoth branch/tag before
> this blacklist.
> I saw there isn't one currently and it would give people a working tag
> that isn't as old as jethro.
>
>
> On Thursday, June 16, 2016 11:08:33 AM Martin Jansa wrote:
> > On Thu, Jun 16, 2016 at 09:08:49AM +0200, Gary Thomas wrote:
> > > I notice that both firefox and chromium are currently blacklisted
> > > as "fails to build with gcc-6".  What about those of us that aren't
> > > using gcc-6?  This seems an overly broad blacklisting :-(
> >
> > You can easily unblacklist them in your configuration where you also
> > change the gcc version, but they are broken in default configuration, so
> > they are blacklisted.
> >
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

