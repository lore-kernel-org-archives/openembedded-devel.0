Received: from mail-gx0-f227.google.com ([209.85.217.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NXiRp-0000Ty-5T
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jan 2010 22:50:48 +0100
Received: by gxk27 with SMTP id 27so371062gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2010 13:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=/gjr99mk5PWZ4tjadmfuWKPXmZIfy3FN+X6qgXO9C8k=;
	b=YrpzKMNAHkdII1/I9SUIGkPE9d6y1YWYlurkuUR7kUxnBMO1kHK0iKmrQK2DZGOHBP
	44MuMGO26QpIftnpapSCddoTjUTXqRyVWIHDemCxsetTP8f5X1XUN+BCbJGwwbF3er6G
	YHVAACoGdLPBUgIpHdB75RLz3A7rd7QQrv930=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=D6rYULybfvuvW64XeY15kMHCxBr7DD07zA+xrnSC+YlDpq6K0mzxwZDSUML/SvurhU
	2qrP+6u/NudJUOO98beAO9GE0UT/6/AwK/+fGzycnSxEvNtvqqZwlSweDj5lvkDQuEUR
	mZa3FvAwpat5h/OPa3fuD2wJd4iEPJRkreM38=
MIME-Version: 1.0
Received: by 10.101.138.5 with SMTP id q5mr808594ann.158.1264024107989; Wed, 
	20 Jan 2010 13:48:27 -0800 (PST)
In-Reply-To: <fca63bcf1001200825q63ec4375w8d2a6f35359284c0@mail.gmail.com>
References: <fca63bcf1001200825q63ec4375w8d2a6f35359284c0@mail.gmail.com>
Date: Wed, 20 Jan 2010 22:48:27 +0100
Message-ID: <ac9c93b11001201348s5238e4e7h7b775e4aacd61fdf@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.227
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
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
X-List-Received-Date: Wed, 20 Jan 2010 21:50:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/1/20 Michael Lippautz <michael.lippautz@gmail.com>:
> Hi all,
>
> Since oe was missing an libxml-perl module I tried to it myself. After
> looking at some other modules, I created the recipe attached.
>
> The problem is that Makefile.PL failes because of some dynamic loading error.
>
> | Can't load 'blib/arch/auto/Conftest/Conftest.so' for module
> Conftest: blib/arch/auto/Conftest/Conftest.so: wrong ELF class:
> ELFCLASS32 at /home/mlippautz/oe/tmp/staging/x86_64-linux/usr/lib/perl/5.8.8/DynaLoader.pm
> line 230.
>
> I can't think of why conftest should become a 32 bit (?) library. I am
> using 64bit gentoo as my workstation and the oe tree also contains
> x64_64 stagings dirs.
>
> regards,
> Michael

Michael,

Thanks for your contribution.
I have no idea why things fail for you. Might be because you need the
native package too.

But the real bad news is that the recipe already exist (in unstable that is)
It is in recipes/perl/libxml-libxml-perl_1.70.bb

Actually this one looks very identical to yours.
And wrt the name: the convention is that all perl lib recipe and as
name start with lib then followed by the name in lower case foolowed
by -perl and the verison number..
Hence XML-LibXML will be in libxml-libxml-perl_1.70.bb.

I hope the existence of the recipe does not disappoint you. If you
want to have a stab at another perl module feel free to try to make a
perl recipe for Tk.
Here's a starter, but it had some issues that I forgot about:

libtk-perl_804.028.bb

DESCRIPTION = "Tk - An overview of an Object Oriented Tk8 extension for perl5"
SECTION = "libs"
LICENSE = "Unknown"
PR = "r0"

SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SR/SREZIC/Tk-${PV}.tar.gz"

S = "${WORKDIR}/Tk-${PV}"

inherit cpan

BBCLASSEXTEND="native"


Best regards & have fun!
Frans.


