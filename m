Received: from [209.85.220.216] (helo=mail-fx0-f216.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stuart68@gmail.com>) id 1MZhLe-0004Sm-AA
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 Aug 2009 10:32:18 +0200
Received: by fxm12 with SMTP id 12so1696176fxm.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Aug 2009 01:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=GHaghS70RgzKaUuWyO4jgTP5qeF0LfUbGvEDjgRMkVk=;
	b=ZiEKuT9E3rEv8T9RSBNNogyQ69hCYeT0iZuSMI5gNKUFJgEMRpnOXExPBfKaIE6QG1
	0a28x5X7sUU/sUVCd1pcDGePAnaH2Ya5+0y9cSh9AAZ+0scLOnXctIdSSlBohKiFFfTN
	reSED0P8IujKwxOgy0/MYbhxqi6timwNnIOx0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=IwqXcekUm2N8l5mV1K/Bnjm61Jr5+hy7ad6lVCzqh1hrTnyCv14Rg8GAr6GbxN/mdu
	g+p4SrjADRoNDxlho46MF4v1/ML1/NDZgjsLa2z4J7s8IreBeP+prZjMXNf7z4kxRAfr
	Xkuw6rzB6EGlY+RFY0BTJ4HbHwFGI6XaQOEec=
MIME-Version: 1.0
Received: by 10.204.122.78 with SMTP id k14mr3812093bkr.201.1249719379071; 
	Sat, 08 Aug 2009 01:16:19 -0700 (PDT)
In-Reply-To: <19c1b8a90908080040l3f31ea26l1ce5eba7b98d968a@mail.gmail.com>
References: <91283b620908080011k650f76f2w297e40b333f9b4e3@mail.gmail.com>
	<19c1b8a90908080040l3f31ea26l1ce5eba7b98d968a@mail.gmail.com>
Date: Sat, 8 Aug 2009 09:16:19 +0100
Message-ID: <91283b620908080116w426680e0y93f2bf5303b66fc2@mail.gmail.com>
From: Stuart Gray <stuart68@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: lighttpd - compile but the install does not seem to be correct
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
X-List-Received-Date: Sat, 08 Aug 2009 08:32:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Thanks I 'll let you know how it goes.

Stuart

2009/8/8 Khem Raj <raj.khem@gmail.com>

> On Sat, Aug 8, 2009 at 12:11 AM, Stuart Gray<stuart68@gmail.com> wrote:
> > Hi,
> >
> > I have added the package for lighttpd to my omap3-comsole-image bitbake
> file
> > and re-built my image. This all works fine, but when I boot my Gumstix
> Overo
> > I get an error stating that it cannot open the "/usr/lib/mod_"  files. I
> do
> > not have the full file names, but on checking what is built in my
> > tmp/arm7a..../...../lighttpd/image/usr/lib directory there are all of the
> > mod_*.so files and some others.
> >
> > When I look at the /usr/lib folder on the device none of these files have
> > been installed.
> >
> > Does anyone have any experience on getting this webserver to work.
> >
> > Sorry for the patchy information I am working away from home at present
> and
> > do not have access to my machine on which I am building.
>
> each module is emitted as a separate ipk lighttpd-module-*
> you need to specify them in your image recipe.
>
> >
> > Thanks,
> > Stuart
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

