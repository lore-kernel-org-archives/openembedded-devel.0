Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1NXj19-0001Cd-1L
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jan 2010 23:27:18 +0100
Received: by bwz9 with SMTP id 9so4522989bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2010 14:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=vHGd1goD/vETU1A5hLlBEYcRwMKScVQtuvrJw8xvvhw=;
	b=WE2jUiXuj29ZJstFdEcXNa3Wy0kbqf+2+RiIohkZGIq415haOCv+rfRExtfvk/tj8a
	82ShICNnAKzxkra+AweDt2erbhlaEf7UmH6L2EY/io/d5jfHOGPILDWD8ASutGg+j0Pb
	nxOCr23C1Nl96gG2Hv7CAPXg+VF87EEisf918=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=fO3/8uGlmBQVqZ2CsDjwbjoAKDx8TrNZiYCO0sd0Q8tPuZ9bEUOtWiyssrAPCtPZUE
	HEM83RlAttiPAboGynDXTVnlwGW4jq1LcllNE058Y0mU45QBXi+RgBoprW0fappuujm6
	9buaiv/OlzcQO1y/Dr6/Avvl6DTvSI7/OMXZI=
MIME-Version: 1.0
Received: by 10.204.39.194 with SMTP id h2mr334205bke.67.1264026298777; Wed, 
	20 Jan 2010 14:24:58 -0800 (PST)
In-Reply-To: <ac9c93b11001201348s5238e4e7h7b775e4aacd61fdf@mail.gmail.com>
References: <fca63bcf1001200825q63ec4375w8d2a6f35359284c0@mail.gmail.com>
	<ac9c93b11001201348s5238e4e7h7b775e4aacd61fdf@mail.gmail.com>
Date: Wed, 20 Jan 2010 23:24:58 +0100
Message-ID: <fca63bcf1001201424y14e75773je8d2a340317913c4@mail.gmail.com>
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: libxml-perl (new recipe) problems (make test)
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
X-List-Received-Date: Wed, 20 Jan 2010 22:27:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

Actually, I need the perl module for some embedded work I am doing,
and was wondering about it not being in the tree.

Now, I can't find it (working on .dev branch). What do you mean with unstable?

I have already search for it in the git logs but can't find an entry
containing  'libxml-libxml-...'. Maybe someone can provide me a link?

Thx in advance!

2010/1/20 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> Michael,
>
> Thanks for your contribution.
> I have no idea why things fail for you. Might be because you need the
> native package too.
>
> But the real bad news is that the recipe already exist (in unstable that is)
> It is in recipes/perl/libxml-libxml-perl_1.70.bb
>
> Actually this one looks very identical to yours.
> And wrt the name: the convention is that all perl lib recipe and as
> name start with lib then followed by the name in lower case foolowed
> by -perl and the verison number..
> Hence XML-LibXML will be in libxml-libxml-perl_1.70.bb.
>
> I hope the existence of the recipe does not disappoint you. If you
> want to have a stab at another perl module feel free to try to make a
> perl recipe for Tk.
> Here's a starter, but it had some issues that I forgot about:
>
> libtk-perl_804.028.bb
>
> DESCRIPTION = "Tk - An overview of an Object Oriented Tk8 extension for perl5"
> SECTION = "libs"
> LICENSE = "Unknown"
> PR = "r0"
>
> SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SR/SREZIC/Tk-${PV}.tar.gz"
>
> S = "${WORKDIR}/Tk-${PV}"
>
> inherit cpan
>
> BBCLASSEXTEND="native"
>
>
> Best regards & have fun!
> Frans.


