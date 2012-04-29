Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOKDq-0000MN-El
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Apr 2012 04:50:50 +0200
Received: by lagw12 with SMTP id w12so1267486lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Apr 2012 19:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=agUuEsPauD3CosKLW4OCgp+XTR4Tp+toTggwLhJSWM0=;
	b=Og+jrLH8b8HNG7IwjrnTZXU7oY27Xf7P9bOZTh+ZC6l7+vFxn9pbud71bOelC5j9Jy
	2fHuEa7dTduVIEYdT6wS/1mNCjvtBkROuFR6hWC5mr2LM/GyI+valfwCmP+3icF+zdDQ
	fud8K9YKj/5GAd4CyHpG4kZ+eOIc8TQ0n/TkgAIHwKktyGbMccUKnq1pRX/ys06ApoVc
	LWM8NqQqao7FQ31/WKJBqy+45qu8Qae2aqwnuaVIDV6V0yicZTDCOQlJG/0djnADY4Gy
	IDrVIDRkWwS60hIHALn01ByMP5AxMtAfngJRAAJbIbavQCOWI1/6nmqJ/cozKxjzWRjc
	tbWA==
Received: by 10.152.112.97 with SMTP id ip1mr15629634lab.31.1335667270230;
	Sat, 28 Apr 2012 19:41:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Sat, 28 Apr 2012 19:40:39 -0700 (PDT)
In-Reply-To: <4F9A932F.1020400@gmail.com>
References: <4F9A932F.1020400@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Apr 2012 19:40:39 -0700
Message-ID: <CAMKF1spP9gnvy7JWQhLxA7VcfhUzWS4Ra1pH3XGA8eEguTporA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Openembedded and ld-linux-armhf.so.3
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
X-List-Received-Date: Sun, 29 Apr 2012 02:50:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 27, 2012 at 5:38 AM, Martin Erts=C3=A5s <martiert@gmail.com> wr=
ote:
> Hi.
>
> I'm working on a pandaboard with OMAP4460. Were trying to use the newest
> PVR drivers, which conforms to the result that arose from
> https://wiki.linaro.org/OfficeofCTO/HardFloat/LinkerPathCallApr2012
>
> We have applied the patch at the bottom of that page gcc, and also a
> patch for making eglibc make ld-linux-armhf, and load ld-linux-armhf
> instead of ld-linux. Problem is, this gives us a kernel panic when it
> tries to run init. Linking ld-linux.so.3 to ld-linux-armhf.so.3 does not
> work, and we're kind of in the dark as to what is missing.
>
> We tried fixing this by renaming the toolchain to be
> arm-none-linux-gnueabihf instead of arm-none-linux-gnueabi, as we heard
> this might be a problem with hardfloats, but this needed a lot of extra
> patches, and some patchwork on other packages like openssl and shadow.
>
> My question is, are there any ongoing plans to fix this, and make sure
> that if we have set hard float we make ld-linux-armhf in openembedded?
>
> For the record we are using eglibc2.15 and gcc4.6 from openembedded-core.

would you show the patches so I can take a look what you did and whats goin=
g on
>
> Best regards
> Martin Ertsaas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


