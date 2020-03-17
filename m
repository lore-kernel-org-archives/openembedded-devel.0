Return-Path: <ross@burtonini.com>
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
	[209.85.167.50])
	by mail.openembedded.org (Postfix) with ESMTP id 75A826063E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 23:17:24 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id j17so18696589lfe.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 16:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=burtonini-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oFcEB4cBM4EFjObLvgwr+yg7ni81bi9Bdbf/mLTfc1M=;
	b=kihfxRpGWADl/UXe5UkWan6SoSWzMmm23kMMjw0RiG5lLH8xaefNLuBB/hFXM82y8J
	C1MDPEaeuO62Bx+TMrMLy/TUTe3iQrW0rthcJ70LxOF+rZCpOiCepXt1okx8K9KQHkr1
	nZysFUWM+nnLH4OuHx1+hIXi30FVn3CF0utl4dgDR7aiNF2JMiT16mcEKKf+f9gYsd9v
	ibS3fDz16vEADRgPOx8CYaTwoF1YHhmLG5UisXiw8iLmSUEOsVTog/Mtdmeq8jbZg4If
	/01qXLkhrr55tmNZDp/xnx4RKNW1NObCe1jj95oUcbc7qZIsUamo5+MNdrkOr1D0AAm1
	MwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oFcEB4cBM4EFjObLvgwr+yg7ni81bi9Bdbf/mLTfc1M=;
	b=SRu4ocdkqk+KMDnnQSlTbNUH5d2tGg9o/davMFW+E8HFdAZjRib7u5sGC0UMp269En
	ZCm8iP6aSXXK5B1ZB3hIRLnr52azB3z3g6VpdA2X5n2SQj33uDrLve2i/aR76GaPpcCi
	SZVXah3PGwt08F5ykAkLmT4cN41IJQiz7Sg63muCkditSfu5bFYLY4UXM2YjMhL8KzY8
	WqaNCZ7Wl+ywMvRea38+zWF4pSOCFC90gEuFqxwFnEHTQ7awxk/Vc3RXoWZjHiiHUYKz
	dy1FvtTmWNzSLMzTQPSg/rBGkiJsQOAafEaQIU55XYotN+H6kO/NJneUE8CDfCW+VW6A
	SMNw==
X-Gm-Message-State: ANhLgQ10GzdE6uaRq12r5gcS1K9Fgeob1S3qgox9k/ZTdMGojbQ26gz4
	Gq6krY+RIv7+46mCL3x54Mxh3buvseIQf3LsA4nuf6leBQWDdw==
X-Google-Smtp-Source: ADFU+vsZau66rxz7Mznhn3q8Q+Z50fcKCPNXh+CzoSCymfNoDoC4SFsCqEgvcjnvpdCOUk/S4dTjvo9wL/YXFX6Q/aM=
X-Received: by 2002:a19:f503:: with SMTP id j3mr1007745lfb.39.1584487044689;
	Tue, 17 Mar 2020 16:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LFD.2.21.2003171319540.14640@localhost.localdomain>
	<06ab2bbe-0bba-6b5c-1fd8-53ad3db16936@burtonini.com>
	<alpine.LFD.2.21.2003171856500.23572@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2003171856500.23572@localhost.localdomain>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 17 Mar 2020 23:17:12 +0000
Message-ID: <CAAnfSTu1O59FwuShBXQWTaOW7J4m1Hx5Wa_wCw6yRV-E6XNw8Q@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: should indent recipe use "${prefix}" instead of "/usr"?
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
X-List-Received-Date: Tue, 17 Mar 2020 23:17:25 -0000
Content-Type: text/plain; charset="UTF-8"

>   just to be clear, this depends on where the indent software actually
> installs the documentation, yes? i'll have to check when i get home as
> to were that stuff is actually placed. for all i know, it *could* be
> under /usr/doc.

Yes.

That FILES suggests that the makefile is installing to /usr/doc/ and
needs to be told somehow to use $docdir.

Ross

