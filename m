Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 85D48774EE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 06:00:04 +0000 (UTC)
Received: by mail-pg0-f54.google.com with SMTP id f188so93843824pgc.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 22:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:mime-version:subject:date:references:to:in-reply-to:message-id; 
	bh=Fgp+x0lRITmxUmOPQeY4W+G7Z/zwr2fTc6NDCbZ0fNw=;
	b=LTAngIZfYU7lIgpfmMIMmBhnmADPHMQf7XnRbHcFT+A8Yz7V83BJKUO3ODttKgO23W
	C92JCswpITRsvcG8oLALNgAnOmN4KKzFqb+kiS8F2wx49OfUlKrLtPFZlcovX0PbI6hL
	T0VcrbOOCcL4UoyLCmvH3+DJThRUNxz8AnGBhGMa4Aa5igW1//BGlLO5C4HQke+ISLoo
	IEpQ9Pa7YZoddEbSsxxtiC4BETXqSX25Pfokiixxcx2ypEOiFOvOe0/A0a7B+JD8R7vR
	yfdPfpbsAWolGxXKNPb7udSc7nwtP2dIPlPhLg3qGR82turEiCc1C3OkGFNGcDv6Q4az
	MPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:subject:date:references:to
	:in-reply-to:message-id;
	bh=Fgp+x0lRITmxUmOPQeY4W+G7Z/zwr2fTc6NDCbZ0fNw=;
	b=aOhUSYxghZaY2RgvTP1UE8PWn+K5VKs+fcTWDmvLhu18Re1fJb/Vaur7tdGx+B+xAR
	gMsy4CFtn6Ko4lCHAsCRiv1dTxt4NXEN4LL94yGHhIwYjR6XRbTTcvV+vkNdO0tiylTn
	HQYONzPWGWS+haPPwM4N1LEO/UvDbrZAw2Ft2oCCDDEFIiS8EDItTb/P5yZG65tOHoOt
	/OiCR0c4A9I/YQiY8WkrSBrg7NUuCc22ZmsDGs1RRp3LDDClmbvGv4oEO9o922c4k4Tg
	s6zLwW6yZPN5hfYH1di9wHsEkHYypAev62G0WthzBRghOZEO6wj8z+PiXtszqhVRThcI
	WKaQ==
X-Gm-Message-State: AIkVDXIVGWHuerscbsWB/pMMcaE9l13x+8nIzSsDyh8pImUaogZBqA+Pjig+dMCfthW4Eg==
X-Received: by 10.99.66.198 with SMTP id p189mr14231767pga.30.1482386406378;
	Wed, 21 Dec 2016 22:00:06 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:5557:8c89:3c84:75f1?
	([2601:646:8882:b8c:5557:8c89:3c84:75f1])
	by smtp.gmail.com with ESMTPSA id
	d1sm50980786pfb.76.2016.12.21.22.00.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Dec 2016 22:00:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Date: Wed, 21 Dec 2016 22:00:04 -0800
References: <32e1bacb35684936a5f570af7030495a@asem.it>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <32e1bacb35684936a5f570af7030495a@asem.it>
Message-Id: <65F88FD8-A243-4EC7-83FE-B59F8DF721FE@gmail.com>
X-Mailer: Apple Mail (2.3259)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5] Runtime error with qt5.7
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
X-List-Received-Date: Thu, 22 Dec 2016 06:00:05 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Dec 21, 2016, at 4:50 AM, Flavio Suligoi <f.suligoi@asem.it> wrote:
>=20
> QXcbIntegration: Cannot create platform OpenGL context, neither GLX =
nor EGL are enabled
> Failed to create OpenGL context for format QSurfaceFormat(version 2.0, =
options QFlags(), depthBufferSize 24, redBufferSize -1, greenBufferSize =
-1, blueBufferSize -1, alphaBufferSize -1, stencilBufferSize 8, samples =
-1, swapBehavior 2, swapInterval 1, profile  0)
> Aborted

You might want to check if you have enabled egl in PACKAGECONFIG for =
qtbase may be you need to enable opengl in DISTRO_FEATURES and/or set
packageconfig for qtbase=

