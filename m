Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <spyzer.abhishek0@gmail.com>)
	id 1O6TJ0-00080w-JZ; Mon, 26 Apr 2010 20:45:19 +0200
Received: by pwj5 with SMTP id 5so7767654pwj.6
	for <multiple recipients>; Mon, 26 Apr 2010 11:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type;
	bh=KuDmUW7aBXYacLDnicwFn1kCxtOhyR2nyk3siAhT6qc=;
	b=eq+SYuaK8B89wVT852kdcis2FLI2UW3WoifQouCL+5EUR8WLClOrcggAdWTHzNhGNz
	uRnDsVoBtK7sgow5XpHkN7eSGQn0rLW6xwIcqipoDFcrQxKocT6eUE0vF333lOnw+WaT
	VJdOG+SBq/7e2E921GWl4g0Df2sZ3l5DXM0Jo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=chISu4jZP1oRzRBo73hH55PtlEECXfubloTqwIm7Ji+7H9PFRJin2paNyeKd/Fd53w
	Pik6ZNaxEmufu6r3sJaZp6R0G4h6fhw75zOQ5+dPC3QEgvh466TL/zwdfzKjxQSE3fZu
	WO6TL9edx4S2CVhwdQ4Kc6JWgcYA9INRQlHKM=
Received: by 10.115.134.11 with SMTP id l11mr4995189wan.160.1272307297676; 
	Mon, 26 Apr 2010 11:41:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.150.144.11 with HTTP; Mon, 26 Apr 2010 11:41:17 -0700 (PDT)
In-Reply-To: <hr3im2$gf6$1@dough.gmane.org>
References: <n2kfc0861611004260035m8d19c57ez38a19dbbe360efe8@mail.gmail.com> 
	<v2hfc0861611004260046za2daa3a4ve91f93ab88e72d8e@mail.gmail.com> 
	<hr3im2$gf6$1@dough.gmane.org>
From: Abhishek Sharma <spyzer.abhishek0@gmail.com>
Date: Tue, 27 Apr 2010 00:11:17 +0530
Message-ID: <x2rfc0861611004261141u68a0ad71icfc12c12c3053c23@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: spyzer.abhishek0@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-users@lists.openembedded.org
Subject: Re: Regarding customized image with Qt embedded support.
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
X-List-Received-Date: Mon, 26 Apr 2010 18:45:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Apr 26, 2010 at 1:55 PM, Koen Kooi <k.kooi@student.utwente.nl>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 26-04-10 09:46, Abhishek Sharma wrote:
> > Hello all,
> >
> > I am building an image for mini2440 which should support Qt embedded
> > applications. I even made a test recipe of a simple Qt embedded
> app(namely
> > "qtehelloworld") and then I wrote the image(namely qtehelloworld-image)
> as
> > such:
> >
> > IMAGE_INSTALL = "qtehelloworld"
>
> So here you add it to IMAGE_INSTALL...
>
> [..]
>
> > require base-image.bb
>
> And here you let base-image remove it from IMAGE_INSTALL again. Move the
> require statement to the top of your images and try again.
>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFL1U4BMkyGM64RGpERAgr+AJ4tU9VDcdBwNvEq2sSFaVHBzCvEsgCfSEbN
> 9oe41c9donlLxJxWfr8KaOc=
> =UUH1
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Thanks for the previous response. I did as suggested, but now the image
built gives this sort of an error.
kernel panic - not syncing: No init found. Try passing init= option to
kernel

I don't have a clue as to why this is happening, do i need to set something
in my image-recipe or the app-recipe???
Kindly help!!!

Thanks

-- 
Abhishek Sharma

