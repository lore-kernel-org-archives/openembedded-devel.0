Received: from mail-iw0-f179.google.com ([209.85.223.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NjzI0-0006oa-Kg
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 19:15:23 +0100
Received: by iwn9 with SMTP id 9so3555329iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 10:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Vlyo+7SBxflGLuYt6x27tQR23gZeKgE2QurLpaHKOAg=;
	b=W4SP9jumCS4E8TfnNEwtwivJ5odFpghJo2IQ+bdwMqVL6WtmpOAsOxQc6PBa3NuQaf
	uaMnDMIjrlYA/12Dx/qlM2cD+cWp5CJ+0gBXtd2Xy0TrVV0L9zQbNfNDq0DZZvjuCTjr
	/CjAPxGPHqGz2gz+ROfwejSjnXIMaKFv5tPzk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Z1F3xjiKmYCVo+sD9Q5AC+wPp1uYKeSe9vRUkgTbCBp4bfJLy29Ou4FJiNOU1s1snr
	sQSEyEn7SVjv6RP3nNHtFZla7Aa/n/uYxBrbLo+9swwl2WV11FpLF/4+AJUqQBoVnQpW
	EKaY7og8J9+f0uH1Pu6MU+Y4zUzBjZJsNOzs0=
MIME-Version: 1.0
Received: by 10.231.153.1 with SMTP id i1mr1317920ibw.35.1266948750083; Tue, 
	23 Feb 2010 10:12:30 -0800 (PST)
In-Reply-To: <4B83DD5C.8050408@tycoelectronics.com>
References: <mailman.5.1266922802.8892.openembedded-devel@lists.openembedded.org>
	<4B83DD5C.8050408@tycoelectronics.com>
Date: Tue, 23 Feb 2010 10:12:30 -0800
Message-ID: <19c1b8a91002231012g3fc28e18ib2999dc5963208a3@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.179
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: How to build g++ to run on target?
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
X-List-Received-Date: Tue, 23 Feb 2010 18:15:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2010 at 5:51 AM, Jay Snyder
<jay.snyder@tycoelectronics.com> wrote:
> I was able to build gcc for installation directly onto the OE target with
> "bitbake gcc". =A0 =A0 "bitbake g++" gives me "nothing provides g++".
>
> What is the magic bitbake command to provide this?

you already have built g++ when you bitbaked gcc recipe. You can look
under your ipk directory for the resulting package for g++
a recipe can build multiple packages

>
> Thank you,
> Jay Snyder
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


