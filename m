Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id DD43D7F93F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 15:36:18 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id c24so90127qtp.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 07:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zkROE7NAF+MTblj28OesZV96wVeODFwUfYTzXyqIwZU=;
	b=fXdZT3HdRNtb7WDP6rklBfeMHPLaNjiR4bDgs1gLvNXWi/GIOJhifpyjTPEG6AyrTE
	7+6z0M8BLZ0ubmmeZK6++foGiHRH3EHpkD5k1wVXnIH8eiZoDcfR79xsuMVfnaTBoi/f
	aF+jhWDyOYjM4iGIL6fsApQN/TpKKHnJrJUyGIpnoKZ2XGQEmcsfx6c2o7i1C1cZTLUe
	UOgt1nCfrx8p0e+4MHatSWnPkTlpopmfmnGmp9mCP78nSrTrUan5aY+AePZ4+VqlRJVa
	jblIkPg3d7gf6PW/MsEDajXjStXWKxh8+77/SZQfuNevXkaO6pXwExqmrwfI6kci+8ck
	gksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zkROE7NAF+MTblj28OesZV96wVeODFwUfYTzXyqIwZU=;
	b=lcPrZi/bMdjoR2AOKQyya/78acCM6uFU85d5WJEkyTUQGDQsK9PC4scNAHiOEwo5xA
	lBV0Y9Mx40CmaQgH2jvcLrXFoTtO+vOSubRZ1JlYp7M9D7z5YpkPSxWIg3MVqfNQhSoF
	SxWOCI7VPxJY3HHOHtok+3GZ6YX5bbub2xYiiLbsER4D2dDOH4khowivlaIzi7G5FE/p
	DuBjWcOidVslal6T6UvkDQ2J8ctRpw2axrUHmgjVGUa9P7x7QezOGc3L6vfJkSsflIkw
	odKUNYMegEXwjELv8QaJA3vgrodN+Q7mWcKdiuGILNtJ6/asneGdFQdXJIfukoxeU21o
	Apzw==
X-Gm-Message-State: APjAAAXSV/R4USxHFucSHeUrB6dBunQd57ezw9aAi4Lzge1yq0hcMGXU
	OuPVi214TZsqNmEbH7KSnGu8VKPNFGE8jwN888C+mbKq
X-Google-Smtp-Source: APXvYqyTbkBb8iwr96JX9ijenNbTOpXIJvB0ao700BjHuomW+PzdT0gJxzaArxp/BJkyi3WmlWjuB6MEG26+w/NGAes=
X-Received: by 2002:ac8:5257:: with SMTP id y23mr21151562qtn.88.1579534579447; 
	Mon, 20 Jan 2020 07:36:19 -0800 (PST)
MIME-Version: 1.0
References: <20200120003527.1518697-1-raj.khem@gmail.com>
	<20200120003527.1518697-3-raj.khem@gmail.com>
	<20200120141434.1424967b@opendreambox.org>
In-Reply-To: <20200120141434.1424967b@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Jan 2020 07:35:52 -0800
Message-ID: <CAMKF1sov+Oiwpwat02rqya8+HRaaBnte8WGodr03Tr_KhrQNSQ@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/5] meta-networking: Remove using python2
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
X-List-Received-Date: Mon, 20 Jan 2020 15:36:19 -0000
Content-Type: text/plain; charset="UTF-8"

Andreas

Thanks for looking into the partch. The initial motivation was to fix
parsing. your feedback is good. I will address it in v2

On Mon, Jan 20, 2020 at 5:14 AM Andreas Oberritter <obi@opendreambox.org> wrote:
>
> Hi Khem,
>
> On Sun, 19 Jan 2020 16:35:25 -0800
> Khem Raj <raj.khem@gmail.com> wrote:
> > diff --git a/meta-networking/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb b/meta-networking/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb
> > index 3aa41f1add..91a6edd241 100644
> > --- a/meta-networking/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb
> > +++ b/meta-networking/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb
> > @@ -8,6 +8,6 @@ SRC_URI[md5sum] = "f638d854a3639fb37c0e06d1092a771e"
> >  SRC_URI[sha256sum] = "aef1e34d98d7bec7cc368e0ca0f2e97493f9b5ebe6d7103f8f6460cfca3dc6fc"
> >
> >  PYPI_PACKAGE = "python-networkmanager"
> > -inherit pypi setuptools
> > +inherit pypi setuptools3
> >
> > -RDEPENDS_${PN} = "networkmanager python-dbus python-six"
> > +RDEPENDS_${PN} = "networkmanager python3-dbus python3-six"
>
> shouldn't this change also include a rename to python3-networkmanager?
>
> > diff --git a/meta-networking/recipes-devtools/python/python-ldap_3.2.0.bb b/meta-networking/recipes-devtools/python/python-ldap_3.2.0.bb
> > index af8961e322..2ad70ace4a 100644
> > --- a/meta-networking/recipes-devtools/python/python-ldap_3.2.0.bb
> > +++ b/meta-networking/recipes-devtools/python/python-ldap_3.2.0.bb
> > @@ -12,7 +12,7 @@ HOMEPAGE = "http://www.python-ldap.org/"
> >  DEPENDS = "python openldap cyrus-sasl"
> >
> >  PYPI_PACKAGE = "python-ldap"
> > -inherit pypi setuptools
> > +inherit pypi setuptools3
> >
> >  LIC_FILES_CHKSUM = "file://LICENCE;md5=36ce9d726d0321b73c1521704d07db1b"
> >  SRC_URI[md5sum] = "fe22522208dc9b06d16eb70f8553eaab"
>
> Same question for python3-ldap.
>
> Best regards,
> Andreas

