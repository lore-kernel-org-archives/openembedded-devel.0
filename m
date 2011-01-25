Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PhpzM-00017P-Kj
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 21:59:45 +0100
Received: by iyj18 with SMTP id 18so6105255iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 12:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=52L8pKKceGIK4y9FYa2DrwZWKSLioOEanRk3ILqWPZY=;
	b=bsH5uY9BWc7+qy8QZ3NbwOjrchMB/kFzwlElBGNz3BUGumxbCKdDCk0PC8LievCuHe
	BSbkBZGbxkYfUK7xS5Tl15yG0Ffl8Bk1sRbZrBW4+YIwPPGnQrBueE/4JbRgwuDZ+hQ4
	8kigH66BJi582JPMdHGlEBIWEMNXyLwqWmYjk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=V3sAvx+ovmtTUMN5eQ7sbo3W75MAVS3EYT6+CTlKs6/3jAr1pXQjCIFuuUHEC/Sgze
	/0pfMZcjGEM3ccpPqDqzYs+QIU04YGW8jrFl23LV5kyn4S/NLWfozxe3QcCqTEXD41Tu
	biBLZwpGruXYCcbetrqB5JZYIzwddNkd8Kk8g=
MIME-Version: 1.0
Received: by 10.231.19.201 with SMTP id c9mr7181130ibb.183.1295989136174; Tue,
	25 Jan 2011 12:58:56 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Tue, 25 Jan 2011 12:58:56 -0800 (PST)
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F08032A16A440@dlee06.ent.ti.com>
References: <131E5DFBE7373E4C8D813795A6AA7F08032A16A440@dlee06.ent.ti.com>
Date: Tue, 25 Jan 2011 21:58:56 +0100
Message-ID: <AANLkTinyeFc_8ai783_mu0deYyFUvebhVq4sVgzbCh0v@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake does not fail when QA issues encountered
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
X-List-Received-Date: Tue, 25 Jan 2011 20:59:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/25 Maupin, Chase <chase.maupin@ti.com>:
> All,
>
> I have noticed that when building packages such as perl that while my bui=
ld will report success and no errors, the return status from the bitbake co=
mmand was "1". =A0I was able to produce this by doing:
>
> MACHINE=3Dam37x-evm bitbake perl
>
> After bitbake completed I saw:
>
> NOTE: Tasks Summary: Attempted 851 tasks of which 0 didn't need to be rer=
un and 0 failed.
>
> but checking $? yields a return status of "1".
>
> I looked into the log and noticed a lot of messages like:
>
> ERROR: QA Issue with db: package db contains bad RPATH
>
> My understanding is that recent fixes to libtool 2.4 prevent these errors=
 but I am using an older version of Angstrom which pins to libtool 2.2. =A0=
I also have found this issue with the Arago distribution which likewise use=
s libtool 2.2.
>
> So my question here is whether bitbake should be failing when it encounte=
rs these QA issues with a bad RPATH and exiting?
>
> If not then should the return status be "1"? =A0This causes issues when u=
sing a script that issues builds and then checks the return status for succ=
ess or failure. =A0If the QA issues are deemed acceptable (or should be war=
nings) then I would expect the return status to not indicate a failure.
>
> I have attached a log of my build for reference
>
> As another interesting side note which I don't know is related or not, wh=
en building Arago with bitbake 1.10.2 the return status is "1". =A0When bui=
lding the same Arago metadata with bitbake 1.8.19 the return status is "0".=
 =A0What is strange here is that since Arago uses a slightly older version =
of the OE metadata it is not seeing the RPATH errors reported above (the ch=
eck isn't in the insane.bbclass for Arago yet). =A0So for some reason bitba=
ke 1.8.19 says everything went fine and bitbake 1.10.2 reports a status of =
"1" even though there is no reported error. =A0I'm not sure if this is rela=
ted to the above in any way or if this is a separate issue.
>
> Sincerely,
> Chase Maupin
>

I've seen this on other places as well.
I'd say if a package has a QA issue the build of that package should
fail, because the resulting output is defnitely not OK.

Frans


