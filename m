Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cwabbott0@gmail.com>) id 1RVWy6-0002dT-Ma
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 00:20:06 +0100
Received: by vcbfo13 with SMTP id fo13so3384941vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2011 15:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=+M4u9u5OQ/HwvWWevjZwYjf1v4fEh9C8tvh/XTUqMsg=;
	b=Xit7ZYxKXkdDh6MKzrelHTj9FskXUO8HfOL6g8/VIFUMwRjMlShsDX89VZ1/5JqGsD
	5Ax2QsNHYBMaAQRA25nmqFeNS6TQxXmPzd7T2+Y9VYJEfhcKNL7dwkfPnAFel1rKMw25
	hwE0lQGOFAgZ6LARcCufZX/znUvvH3QR9fsLM=
MIME-Version: 1.0
Received: by 10.52.94.227 with SMTP id df3mr40904749vdb.51.1322608406206; Tue,
	29 Nov 2011 15:13:26 -0800 (PST)
Received: by 10.220.203.66 with HTTP; Tue, 29 Nov 2011 15:13:26 -0800 (PST)
Received: by 10.220.203.66 with HTTP; Tue, 29 Nov 2011 15:13:26 -0800 (PST)
In-Reply-To: <jad09l$c0g$1@dough.gmane.org>
References: <1321811782-7133-1-git-send-email-cwabbott0@gmail.com>
	<jad09l$c0g$1@dough.gmane.org>
Date: Tue, 29 Nov 2011 18:13:26 -0500
Message-ID: <CACu1E7EigJom5yDg+VYZ15o6HF2cJO3BThtCLgEO1Fo1=s-URg@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-gnome][PATCH] libnotify: add 0.5.2 and make it the default
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
X-List-Received-Date: Tue, 29 Nov 2011 23:20:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Sorry, I must have had the 0.7.0 headers installed and didn't realize it.
Actually, that's a problem; if you build two different packages, one which
requires libnotify and one which requires libnotify3, then the wrong
headers can get installed in the sysroot because the packages have
different names. Anyways, it appears that 0.5.2 is actually newer than
0.6.0 anyways; I'll update the commit message then.
On Nov 21, 2011 2:58 AM, "Koen Kooi" <koen@dominion.thruhere.net> wrote:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 20-11-11 18:56, Connor Abbott schreef:
> > Versions of libnotify >= 0.6.0 have API changes that break some gnome
> > recipes.
>
> Which recipes are that? The only API breakage I know of is in libnoty >=
> 0.7.0, which is why that's called 'libnotify3'
>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iEYEARECAAYFAk7KBHAACgkQMkyGM64RGpFcmQCfXeZgqdkn76RQO6fErXYARefD
> 2zsAnAgBzS2HiSx1RQQ+hvW63Le66qsY
> =0+pG
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

