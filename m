Received: from mail-yw0-f195.google.com ([209.85.211.195])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NXsFK-0006Tu-15
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 09:18:33 +0100
Received: by ywh33 with SMTP id 33so525138ywh.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 00:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=N+2dIuzWE3FbFqMxd8CwA4/iRu8tXppxWckXFoxk4ng=;
	b=a7AGyQp4ua5JFwFX8Qz80kHvEQnNgc1vEygm1FjQd/s94nJtHlZBfeJxwyxCVnt76o
	ebyCVNzsvA3ieDGP4VIDIL9D/JFvm6XTfrIuCxSMGcGeihdLMVYb9fMKLX15pNm7Y8SW
	c3BdLKsIYbyXrhpJcuA1PIj5sjkHJNPxeB2Xw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=KX04UJqtuafpTSimaZIKtWVWqiLlp4JBRmVgVm3YHvoNzJBoz4SrlSnjKpKqXd4kXw
	kP1olNVYGZsAqUCUh7Mpkyi7/Q+W8vcztu81GITfimxwORH4rcI/HvbIVIRnTN9HrnVW
	PkYLNMzRnkUDU33lLPGQb4W2AFqfBcxUTeYnY=
MIME-Version: 1.0
Received: by 10.101.213.34 with SMTP id p34mr610265anq.1.1264061772695; Thu, 
	21 Jan 2010 00:16:12 -0800 (PST)
In-Reply-To: <fca63bcf1001201424y14e75773je8d2a340317913c4@mail.gmail.com>
References: <fca63bcf1001200825q63ec4375w8d2a6f35359284c0@mail.gmail.com>
	<ac9c93b11001201348s5238e4e7h7b775e4aacd61fdf@mail.gmail.com>
	<fca63bcf1001201424y14e75773je8d2a340317913c4@mail.gmail.com>
Date: Thu, 21 Jan 2010 09:16:12 +0100
Message-ID: <ac9c93b11001210016m76a07fg45b6a10249df28ac@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.195
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
X-List-Received-Date: Thu, 21 Jan 2010 08:18:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/1/20 Michael Lippautz <michael.lippautz@gmail.com>:
> Actually, I need the perl module for some embedded work I am doing,
> and was wondering about it not being in the tree.
>
> Now, I can't find it (working on .dev branch). What do you mean with unst=
able?

If you are at the dev head you are definitely at the bleeding edge.
If you download binary packages there are two feeds.
One is the unstable feed which closely follows the head of the dev branch
The other one is the stable feed which is as it says more stable (at
the expense of some things not being there or being added later)

>
> I have already search for it in the git logs but can't find an entry
> containing =A0'libxml-libxml-...'. Maybe someone can provide me a link?

OUCH.
You got me.
When I saw your email I checked my own tree and there it was.
However if I look at
http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/perl
it is not there.

Guess I also had some issues with it and did not commit it, but left
the recipe to complete it later and got sidetracked to something else
and forgot about it.
(I needed it to build some xmltv grabbers but not he one for my
country that's why it ended up on the backburner).

Wrt your recipe:
you definitely want to add BBCLASSEXTEND=3D"native" to the bottom of it.
Also the dependencies need to be added:

See http://deps.cpantesters.org/?module=3DXML::LibXML;perl=3Dlatest

Neither XML::Sax nor XML::NamespaceSupport exist (unless they are
added by someone very recently), so guess you need to add these first.

Feel free to contact me if you have questions or want a review or so
(trough private mail or the list or on irc (I am eFfeM on #oe)

Frans

>
> Thx in advance!
>
> 2010/1/20 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
>> Michael,
>>
>> Thanks for your contribution.
>> I have no idea why things fail for you. Might be because you need the
>> native package too.
>>
>> But the real bad news is that the recipe already exist (in unstable that=
 is)
>> It is in recipes/perl/libxml-libxml-perl_1.70.bb
>>
>> Actually this one looks very identical to yours.
>> And wrt the name: the convention is that all perl lib recipe and as
>> name start with lib then followed by the name in lower case foolowed
>> by -perl and the verison number..
>> Hence XML-LibXML will be in libxml-libxml-perl_1.70.bb.
>>
>> I hope the existence of the recipe does not disappoint you. If you
>> want to have a stab at another perl module feel free to try to make a
>> perl recipe for Tk.
>> Here's a starter, but it had some issues that I forgot about:
>>
>> libtk-perl_804.028.bb
>>
>> DESCRIPTION =3D "Tk - An overview of an Object Oriented Tk8 extension fo=
r perl5"
>> SECTION =3D "libs"
>> LICENSE =3D "Unknown"
>> PR =3D "r0"
>>
>> SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/S/SR/SREZIC/Tk-${PV}=
.tar.gz"
>>
>> S =3D "${WORKDIR}/Tk-${PV}"
>>
>> inherit cpan
>>
>> BBCLASSEXTEND=3D"native"
>>
>>
>> Best regards & have fun!
>> Frans.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


