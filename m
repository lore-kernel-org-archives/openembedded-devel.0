Received: from [74.125.92.148] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MZgnC-0006FR-UA
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 Aug 2009 09:56:43 +0200
Received: by qw-out-1920.google.com with SMTP id 4so756496qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Aug 2009 00:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wv/EHjnnGedocvLnRLZS56QZyLePE/6ZGz8dqzwQSKQ=;
	b=VWiuFdq+JnZIOMNeGffmfbXPv/YB7BKU8iWYE/wyrKuI+w//lfgBVnHOv+3HCi0rdN
	kG/XDqkorifcbPF7TmNRiEPuHavRbHDZMr0mKpKpENJkJDbBKiBJBRdntaoVaPUsR9VB
	JbtRZYkFQ+g8XD3AVaQRZ4ZOAkkZBbi24RBVQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=LlfpOBkRgOwuNLDA2AQckcxqNk0PFZ+BZlXCIo4o4q6aaDF+/baz3InLsc0+mpL7BQ
	9MMYSQjiput07ltR4dxKCm8wpzEfTwIaX+m0ob4cTSaeZDRL2L9sgTHtnR4eSsHXoG5v
	B+MqWObxUHbBo269Z17I378JmVcmsKEkESMeE=
MIME-Version: 1.0
Received: by 10.229.84.209 with SMTP id k17mr880296qcl.61.1249717245596; Sat, 
	08 Aug 2009 00:40:45 -0700 (PDT)
In-Reply-To: <91283b620908080011k650f76f2w297e40b333f9b4e3@mail.gmail.com>
References: <91283b620908080011k650f76f2w297e40b333f9b4e3@mail.gmail.com>
Date: Sat, 8 Aug 2009 00:40:45 -0700
Message-ID: <19c1b8a90908080040l3f31ea26l1ce5eba7b98d968a@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Sat, 08 Aug 2009 07:56:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2009 at 12:11 AM, Stuart Gray<stuart68@gmail.com> wrote:
> Hi,
>
> I have added the package for lighttpd to my omap3-comsole-image bitbake f=
ile
> and re-built my image. This all works fine, but when I boot my Gumstix Ov=
ero
> I get an error stating that it cannot open the "/usr/lib/mod_" =C2=A0file=
s. I do
> not have the full file names, but on checking what is built in my
> tmp/arm7a..../...../lighttpd/image/usr/lib directory there are all of the
> mod_*.so files and some others.
>
> When I look at the /usr/lib folder on the device none of these files have
> been installed.
>
> Does anyone have any experience on getting this webserver to work.
>
> Sorry for the patchy information I am working away from home at present a=
nd
> do not have access to my machine on which I am building.

each module is emitted as a separate ipk lighttpd-module-*
you need to specify them in your image recipe.

>
> Thanks,
> Stuart
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


