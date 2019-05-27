Return-Path: <nick83ola@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2398D7DFE5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 15:50:57 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id r76so4293212lja.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 08:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=23uQ3Y/y7xZqRRld0zQgRk46vVflVa2FdlSPCt0l7uQ=;
	b=FmtTeUxV0jn1iOhAf2++T7nNR87Dkz75kraB8o4eYM89o6r9hnpRj0IhkqgNdsWbF9
	XkC7aRcPUWgoXHuo3mbgxH/jciNIOUG/NGoWNxkIYl2AiOkrpCU2/qeXdfL9Aw4SZjIk
	5CiX5JUKXQa3d4cXPI9iotXmnDevdlxKrHMXdoFwjp/lQ/k9NzU/zXGR7t21VIHkZicc
	hfB0DauH+w3us5xhiBFJAiYKEIPOlCQsRNxgVAyDLq+ME63XAcyXIEKNdjEbwM87P6d6
	yIfw1R/dH9j4FzgbtgFcbjFUYkBj8rRX7pnbDmSt6n3/xZYLxIffzTF/KXscP4lA9zL9
	VfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=23uQ3Y/y7xZqRRld0zQgRk46vVflVa2FdlSPCt0l7uQ=;
	b=VJEr1CpTAbMgrbqm72NSfdC+tibuEa9G7y6YTYcfxCxJgm1zjYapi7F8LCXtYP7ETX
	Wg+yQ7R0H7wZtuGBeLJeMshg3QNYmJ+gVhaAjSR+YluYBkOi3mim2DHVlslWvA+hQwgt
	fVZMzrfRgAjKpvbfNZcAwP/x+1ETJaB4nM+TJTNzalm8nSLrGm+xbjLvfZXXwY/IvXNU
	t6IDNbhe6XtkfbWRr+rMvT5u6usvsDy76PbYbgTx1rhgx2KBoGDyp8MWLKlaiarQJSb0
	ksCc0lKT758nOXX55xuo6r/p4JoJoOQc8U1ESDDmkhhExRHDpZCtm6zMMS6QJtM0eg+Z
	vGfg==
X-Gm-Message-State: APjAAAWmwNyYNMZVhFAOZndPbxFZp1yZKJ+t5MU0/0Qv6IiwI5ate6Zs
	hB6emFyW28sjaqwJNVZTXosTkK9HCfmdWdsOeVM=
X-Google-Smtp-Source: APXvYqwrmuaWRF+Q6yzvJBkl2rpMYyakoq5vLUsur0awzRyjeiup3R8OZ4Ta/T+0f1aRonHW9nFU8CX+te1oBL0K8rU=
X-Received: by 2002:a2e:249:: with SMTP id 70mr58737430ljc.178.1558972257682; 
	Mon, 27 May 2019 08:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190527095310.4890-1-nick83ola@gmail.com>
	<CAMKF1sob5rYA2vYTAcGEeBVX=pLHcZJg1RF3x4RDPYBjb0MP8g@mail.gmail.com>
	<CABPh3UN4fqJr0435mh9ztk3zDUaju0zCCQmwN7qVr_R+bBw8FA@mail.gmail.com>
	<CAMKF1srT+OBWZk9gf3vMpg4F1z4oLAgB0C2eSONZphcv4af=xQ@mail.gmail.com>
In-Reply-To: <CAMKF1srT+OBWZk9gf3vMpg4F1z4oLAgB0C2eSONZphcv4af=xQ@mail.gmail.com>
From: nick83ola <nick83ola@gmail.com>
Date: Mon, 27 May 2019 16:50:46 +0100
Message-ID: <CABPh3UNOthEo7UodqJUPF2QtwgkkkEfK+kXWmKD8+f+k7OtgOg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver][PATCH 1/2] nginx: update to version 1.17.0
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
X-List-Received-Date: Mon, 27 May 2019 15:50:57 -0000
Content-Type: text/plain; charset="UTF-8"

Done

On Mon, 27 May 2019 at 16:42, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, May 27, 2019 at 8:39 AM nick83ola <nick83ola@gmail.com> wrote:
> >
> > Hi Khem,
> > are you talking about the LIC_FILES_CHKSUM?
> >
>
> yes
>
> > Thanks
> > Nicola Lunghi
> >
> > On Mon, 27 May 2019 at 16:25, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Mon, May 27, 2019 at 2:54 AM Nicola Lunghi <nick83ola@gmail.com> wrote:
> > > >
> > > > Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
> > > > ---
> > > >  meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb | 6 ------
> > > >  meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb | 6 ++++++
> > > >  2 files changed, 6 insertions(+), 6 deletions(-)
> > > >  delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
> > > >  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb
> > > >
> > > > diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
> > > > deleted file mode 100644
> > > > index 5e6dc33e9..000000000
> > > > --- a/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
> > > > +++ /dev/null
> > > > @@ -1,6 +0,0 @@
> > > > -require nginx.inc
> > > > -
> > > > -LIC_FILES_CHKSUM = "file://LICENSE;md5=3691402cc54ce09f800ca348634a2dfe"
> > > > -
> > > > -SRC_URI[md5sum] = "719b2e3d416f111fecc9db6625553658"
> > > > -SRC_URI[sha256sum] = "8f22ea2f6c0e0a221b6ddc02b6428a3ff708e2ad55f9361102b1c9f4142bdf93"
> > > > diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb
> > > > new file mode 100644
> > > > index 000000000..8774a87ff
> > > > --- /dev/null
> > > > +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb
> > > > @@ -0,0 +1,6 @@
> > > > +require nginx.inc
> > > > +
> > > > +LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
> > > > +
> > >
> > >
> > > why is checksum different please mention it in commit msg
> > >
> > > > +SRC_URI[md5sum] = "56767fd62302508295b31adc48b99a59"
> > > > +SRC_URI[sha256sum] = "e21b5d06cd53e86afb94f0b3678e0abb0c0f011433471fa3d895cefa65ae0fab"
> > > > --
> > > > 2.20.1
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

