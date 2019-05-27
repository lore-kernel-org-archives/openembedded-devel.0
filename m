Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id BC5F17D1F9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 15:41:58 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id g18so11805qkl.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 08:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=svY4/12VIiI37tYzOHE6UwzA+X8RJe6qraRV4y1VV5A=;
	b=Zuvx/sAcmfsJQsd7w//SlVQL46a4lx+MTyIoKI/OMu0JJSVwzllmyu5gq1J7ufor9i
	E38oxeWTJdp+qpvT1WH54jo6bmmkgyZZpNbgcXo7rbRQd6+w8XiGM/zv1f5DHquRMXpW
	ru8WkFR57f62Pbjak0Bn9lRgd7PTPCJmk3lUJ04x4Il1B6HEICQ+M1KJk/ktNT7MycWy
	2WpMmuCyohKAA3mXHjCOtJcwd0q5NQsWuuHAU1v3tHjwzLFVbs2LHMZ0jaS7qVzoiZGs
	r0ks5v6qFg8g61DroxpMPYUoK0rSdsqKrCklVhs5E3SxGqm7jNENRMnftjbW6Eki75rw
	fi/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=svY4/12VIiI37tYzOHE6UwzA+X8RJe6qraRV4y1VV5A=;
	b=QjYGHTl4GCdJpHGiiIL15t8MkPt8wINV+pyge6Y5Noew97Qqf0/eZtVru0XEkBmBrY
	hqBbdqkn1ZGXwGKISaOxWYnAjVCanTARjrJ+Uk8cy3Oie5wmjpIzuuDI0NYh02FXI6ow
	NFUqK2W4K062CzcJRmR7lp2gIfdSsgmhJ2mDbqgjAV1ZwyPpb1h6QBzsIcUvq4a+HBr6
	DM0aN+P82q4IiBPkwUSHLVa1HocT+3ZopAbzg4cqgN5/bcy6mR1ryDhOiSpaHCKsg+Zm
	2pFGSxq70zFgZ7Oi/79JBoZOl3eA+hl6g9DL8Bn0E4k+MOFqNLuCM99+KUcmC8onJjHl
	buwQ==
X-Gm-Message-State: APjAAAWTK+1I/9kChDXV6FELtmYnj3fRugrZdGkzEL8v7CXd9Uo5M7yz
	GBUKaX3aZ+LKSEgof95vUSULcRgbPsArlEVM9wY=
X-Google-Smtp-Source: APXvYqwv7iBC8hMt/c5TZpoLPiMFVVWg1FOZdpvcXw2kvpy/UPj/TU7bhWIFU++/exOxLCpmAPjJRi89VPirl/awMG4=
X-Received: by 2002:ac8:8b2:: with SMTP id v47mr60608864qth.80.1558971719416; 
	Mon, 27 May 2019 08:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190527095310.4890-1-nick83ola@gmail.com>
	<CAMKF1sob5rYA2vYTAcGEeBVX=pLHcZJg1RF3x4RDPYBjb0MP8g@mail.gmail.com>
	<CABPh3UN4fqJr0435mh9ztk3zDUaju0zCCQmwN7qVr_R+bBw8FA@mail.gmail.com>
In-Reply-To: <CABPh3UN4fqJr0435mh9ztk3zDUaju0zCCQmwN7qVr_R+bBw8FA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 May 2019 08:41:32 -0700
Message-ID: <CAMKF1srT+OBWZk9gf3vMpg4F1z4oLAgB0C2eSONZphcv4af=xQ@mail.gmail.com>
To: nick83ola <nick83ola@gmail.com>
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
X-List-Received-Date: Mon, 27 May 2019 15:41:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 27, 2019 at 8:39 AM nick83ola <nick83ola@gmail.com> wrote:
>
> Hi Khem,
> are you talking about the LIC_FILES_CHKSUM?
>

yes

> Thanks
> Nicola Lunghi
>
> On Mon, 27 May 2019 at 16:25, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Mon, May 27, 2019 at 2:54 AM Nicola Lunghi <nick83ola@gmail.com> wrote:
> > >
> > > Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
> > > ---
> > >  meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb | 6 ------
> > >  meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb | 6 ++++++
> > >  2 files changed, 6 insertions(+), 6 deletions(-)
> > >  delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
> > >  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb
> > >
> > > diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
> > > deleted file mode 100644
> > > index 5e6dc33e9..000000000
> > > --- a/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
> > > +++ /dev/null
> > > @@ -1,6 +0,0 @@
> > > -require nginx.inc
> > > -
> > > -LIC_FILES_CHKSUM = "file://LICENSE;md5=3691402cc54ce09f800ca348634a2dfe"
> > > -
> > > -SRC_URI[md5sum] = "719b2e3d416f111fecc9db6625553658"
> > > -SRC_URI[sha256sum] = "8f22ea2f6c0e0a221b6ddc02b6428a3ff708e2ad55f9361102b1c9f4142bdf93"
> > > diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb
> > > new file mode 100644
> > > index 000000000..8774a87ff
> > > --- /dev/null
> > > +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb
> > > @@ -0,0 +1,6 @@
> > > +require nginx.inc
> > > +
> > > +LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
> > > +
> >
> >
> > why is checksum different please mention it in commit msg
> >
> > > +SRC_URI[md5sum] = "56767fd62302508295b31adc48b99a59"
> > > +SRC_URI[sha256sum] = "e21b5d06cd53e86afb94f0b3678e0abb0c0f011433471fa3d895cefa65ae0fab"
> > > --
> > > 2.20.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

