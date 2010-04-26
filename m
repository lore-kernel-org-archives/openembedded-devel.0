Received: from mail-gx0-f228.google.com ([209.85.217.228])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <spyzer.abhishek0@gmail.com>)
	id 1O6JIq-00071C-ES; Mon, 26 Apr 2010 10:04:28 +0200
Received: by gxk28 with SMTP id 28so7310395gxk.7
	for <multiple recipients>; Mon, 26 Apr 2010 01:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=hMSt7Af4S+CW0R82Vwq9TIXOoWAVmkSR+gjQ96tV47Q=;
	b=IXqkQi4yHZJh+FLL5iryPAsMtS0fFbseI6U5Kw23TAQSc/op1nAuWrug63vZuiJmku
	eVANUcQfRKkDSF3EQamn/kMazRvFpEcb8xJr4cLW6gH2XVhJqDoCZJBZJj93o6ykNnK1
	6yppoqxHZqlzUScFgKDqcH5hLR+x4rVEJJEHM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=ndh/HUCFB+rwWUkDubXux6XnEbpbCdY+1tvXR0yEBOPY2EPwU3pSOWRZWCfXSyVpjV
	Pz6D0glfOHrdTyXPHxAW2w1y01Tu0zTjx0M7xvWTc8e9FoXmg16zqnMOn3G5ZkSsBit1
	OInYKBOJBXW8YKfI2yqI05pb8V+0P+NiO7N04=
Received: by 10.151.124.1 with SMTP id b1mr3838520ybn.106.1272268843592; Mon, 
	26 Apr 2010 01:00:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.150.144.11 with HTTP; Mon, 26 Apr 2010 01:00:23 -0700 (PDT)
In-Reply-To: <n2kfc0861611004260035m8d19c57ez38a19dbbe360efe8@mail.gmail.com>
References: <n2kfc0861611004260035m8d19c57ez38a19dbbe360efe8@mail.gmail.com>
From: Abhishek Sharma <spyzer.abhishek0@gmail.com>
Date: Mon, 26 Apr 2010 13:30:23 +0530
Message-ID: <r2mfc0861611004260100m6cdbd5ecudd4598fa9e8a7a9c@mail.gmail.com>
To: openembedded-users@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.228
X-SA-Exim-Mail-From: spyzer.abhishek0@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Regarding customized image with Qt embedded support.
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
X-List-Received-Date: Mon, 26 Apr 2010 08:04:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Apr 26, 2010 at 1:05 PM, Abhishek Sharma <spyzer.abhishek0@gmail.com
> wrote:

> Hello all,
>
> I am building an image for mini2440 which should support Qt embedded
> applications. I even made a test recipe of a simple Qt embedded app(namely
> "qtehelloworld") and then I wrote the image(namely qtehelloworld-image) as
> such:
>
> IMAGE_INSTALL = "qtehelloworld"
> IMAGE_BASENAME = "qtehelloworld"
> IMAGE_LINGUAS = ""
> IMAGE_LOGIN_MANAGER = ""
> IMAGE_INIT_MANAGER = ""
> IMAGE_INITSCRIPTS = ""
> IMAGE_DEV_MANAGER = ""
> RDEPENDS = "qte"
> DEPENDS = "task-base"
> require base-image.bb
> inherit image
>
> here qtehelloworld as I mentioned earlier is a simple/sample qte app.
> Before deploying to mini2440 I am testing the image for qemu by setting the
> conf to MACHINE="qemuarm". But when I run the image, I am unable to find the
> "qtehelloworld" app inside the image(to run the app). Kindly tell me, why is
> such a thing happening.
>
> Thank You.
>
> --
> Abhishek Sharma
>
>
Also even if I cannot "make" the qte application to be directly into the
image, then i could atleast do this, that I can create a minimalistic kind
of image(base-image) which has qte libraries but i don't know as to how
should i do it. Kindly help..

