Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PNBfk-0005ZX-2M
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Nov 2010 22:54:09 +0100
Received: by gxk20 with SMTP id 20so2411497gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 13:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=r494+RmQ5bejGf++i9z4TZwFSbPkCpGDfDmY6EOwmDA=;
	b=BcYTUOMIwToNBwg2hnHmqi/H1MhiWrgF8Yyv8GEAYiGPi4dp/lLy2Q42pV8w4y7bZZ
	mVMz/UTI1e9CFipzXEu32B4wNwAfeeSuO61LfAV0HJCWjF7JQaL+1L8P/60enWhSV3qZ
	pMWjW6/m5PG2xsrIWuqIEOSTOCUBC/e1Zv0LE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=TpEmSccsgBM8IbPStuILeeoCfX2Y/P9vRfeTdazlP5pfbp7B7xF47Cv96VlyAUYEvO
	5sQ456tS+VCrzaqfjDIP1yb5j8Q0q3GaopUdHY7z/lIQT8iNN9Q0nvFeCAxBIob3nHJ8
	Pkku3eZ1XLq7eb+GzvydpNe1Q/sS3sJAZyhus=
Received: by 10.90.9.22 with SMTP id 22mr9785276agi.102.1291067564298; Mon, 29
	Nov 2010 13:52:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Mon, 29 Nov 2010 13:52:23 -0800 (PST)
In-Reply-To: <AANLkTinuAXEvP8wMWyr2udp7RGDW=J=Ct8C3F31=hEj0@mail.gmail.com>
References: <AANLkTinuAXEvP8wMWyr2udp7RGDW=J=Ct8C3F31=hEj0@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Nov 2010 13:52:23 -0800
Message-ID: <AANLkTimcA8LwmqDgYv7LbtLbf39=AtVRwP2vsZ2F9c7s@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: git-native and libz
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
X-List-Received-Date: Mon, 29 Nov 2010 21:54:09 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 29, 2010 at 1:33 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Since we got git-native I am getting this warning on every git command
> I execute:
>
> git: /.../tmp/staging/x86_64-linux/lib/libz.so.1: no version
> information available (required by git)
>
> How do I get around this ..
>

It could be that while linking it used the libz from your build host
and at runtime its using libz from staging because it was built
afterwards and
you have rpaths set. Newer versions of libz has introduced the symbol
versioning scheme. So it could be that git now wants some specific
version
of zlib-native. One think you could try is to add a recipe to latest
zlib and zlib-native and see if it solves the problem

> (guess the best way is to just uninstall it then say that git-native
> is provided, but I think this is a more generic issue with git-native)
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


