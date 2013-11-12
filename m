Return-Path: <akini@synapticon.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1399B6D593
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 17:36:45 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id n7so4331758lam.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 09:36:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=8I/75y3AYhOBHUYYoLjaT8CgUQWl5npCz7cLF4/BOrs=;
	b=l9CwEbHdkbi/ldyk+RnwF/7iM5drU/wUPZFPgk6c26b39HAOuIGB6QYStbP2wG1yMW
	C/xbVlqrxJ/SSohvG72swfLmkE6DfyuPzbEqUdlQnlWpNo1SOg+KyyMV0mIgJVgOQzKN
	fMU7tShFPIkxRWKifq/VuKXtSUhhlyM+YU7S4WxPXstn8VyA7rREuNy5ngFgPeC81fSe
	RZM5sMeZETUDN2hqapqhqxcovrDr0f/piN4SDv7CstjOl1433uJcZEEmKs/qJLsJBSTb
	+yG0088Yw2x1ChSLz/Z9PHFjJzCoiG+BYYDHhi6sA0vIOw78S4mVJcACFVY7oEMeQUJ9
	R8fg==
X-Gm-Message-State: ALoCoQniKsuGYMTam2+I06yB0of9yHSHzJR4EDGz/l2Ib9s6NIEc4/A2ks8cTaqhAkDDEmx/tbFB
MIME-Version: 1.0
X-Received: by 10.112.198.199 with SMTP id je7mr19355lbc.53.1384277806737;
	Tue, 12 Nov 2013 09:36:46 -0800 (PST)
Received: by 10.114.18.139 with HTTP; Tue, 12 Nov 2013 09:36:46 -0800 (PST)
In-Reply-To: <1384273172.6460.13.camel@ted>
References: <CAKS01oniO3YHFg2CAarKKaXfkSXnkEhy_JCwZNobQGqcNdM=cw@mail.gmail.com>
	<1384273172.6460.13.camel@ted>
Date: Tue, 12 Nov 2013 18:36:46 +0100
Message-ID: <CAKS01okUK2TYZ6OrnGt71wqgVinNehY8Rs9buy3JZEUrJf26kg@mail.gmail.com>
From: Anup Kini <akini@synapticon.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: how to populate sysroot with dev packages.
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
X-List-Received-Date: Tue, 12 Nov 2013 17:36:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

I did try that, but it does not add the A-dev.deb.
It will only deploy the A.deb files.

I want to populate the A-dev.deb also...


On 12 November 2013 17:19, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2013-11-12 at 16:36 +0100, Anup Kini wrote:
> > Hi All,
> >
> > I am trying to build package-B which needs a few files from package-A-dev
> > How do i deploy/install package-A-dev in sysroot such that when i build
> > package-B it can access those files.
> >
> > I know that i can install dev-pkgs in the image but i would like to know
> > how to deploy them in the sysroot.
>
> The act of building A should put its output into the sysroot. You'd
> therefore just need a DEPENDS = "A" in recipe B.
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



-- 


*Anup Kini*Systems Engineer
*------------------------------*

*Synapticon*  |  Cyber-Physical System Solutions

Mobile:

Direct:

+49 151 / 638 646 73

+49 7335 / 186 999 21

Fax:
+49 7335 / 186 999 1






synapticon.com <http://www.synapticon.com/>  |
@synapticon_co<https://twitter.com/#!/synapticon_co>

Synapticon GmbH  |  Hohlbachweg 2  |  73344 Gruibingen, DE
Secretary +49 7335 / 186 999 0  |  General Manager: Nikolai Ensslen
Registry Court Ulm HRB 725114  |  USt-ID DE271647127

This message and any files transmitted with it are confidential and
intended
solely for the use of the individual or entity to whom they are addressed.
Please notify the sender immediately if you have received this e-mail by
mistake and delete it from your system.

