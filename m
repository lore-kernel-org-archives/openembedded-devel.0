Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1Ra8Ae-0004zl-Cd
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Dec 2011 16:52:04 +0100
Received: by wgbds11 with SMTP id ds11so9961868wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2011 07:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Nv/ML+JfG5mhpuZjXO0vhI9sSLsqk9DSr4sWNvpdHRU=;
	b=W2EX45708IkrWhVEUe8fncwcVyICIeqXEDIDsgk/9FMNq0+X/gN6XCpIuPpSY0hRU2
	OCrlUzK0bfsI/7WD2nMl9VGCvFcUkAdQ3fCKxn6W2ZEVbzI48UBlUCr52MW2yXI3O5CW
	iBgiSjJHyhZuJuZw5Q0TOnEviD0UzVlvEsBnU=
MIME-Version: 1.0
Received: by 10.216.182.193 with SMTP id o43mr3226033wem.87.1323704709834;
	Mon, 12 Dec 2011 07:45:09 -0800 (PST)
Received: by 10.223.69.133 with HTTP; Mon, 12 Dec 2011 07:45:09 -0800 (PST)
In-Reply-To: <jc50ht$phq$1@dough.gmane.org>
References: <1323687379-25490-1-git-send-email-s.stirtzel@googlemail.com>
	<jc50ht$phq$1@dough.gmane.org>
Date: Mon, 12 Dec 2011 16:45:09 +0100
Message-ID: <CAGiJk9f8O9nwG-iEbEu2xHLWVBn-M-5c0KCeRxy5HMeogjLYog@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] florence: Initial recipe added
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
X-List-Received-Date: Mon, 12 Dec 2011 15:52:04 -0000
Content-Type: text/plain; charset=UTF-8

2011/12/12 Koen Kooi <koen@dominion.thruhere.net>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 12-12-11 11:56, Samuel Stirtzel schreef:
>> Florence is a virtual keyboard used to input text with a touchscreen.
>>
>> Tests: * Run tested on Overo Gumstix with xfce-nm-image * Build tested
>> for Qemuarm
>>
>> Known issues: * Florence cannot access the gconf settings?
>
> Does adding 'inherit gconf' fix that?
Thanks, this worked when the configuration was saved once,
it should work with a fresh installation too,
but I' couldn't test that because I could not uninstall the package with opkg.

When running "opkg remove *florence*" it shows only "no packages
removed", the same with --force-remove.
For the case it won't work I've added a notice how I got it working.
I will test it with a fresh rootfs later.

>
> For v2 don't forget to add --subject-prefix meta-oe to your git-send-email
> command.
Ok, I will send v2 out with the prefix soon.

>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iEYEARECAAYFAk7mBXoACgkQMkyGM64RGpH67QCghKjiqTVzHTcu9vmFpYvJ2cAO
> oEkAn3J+wddb2f8fIJeBkAvdwBQTkTKY
> =oknF
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



-- 
Regards
Samuel


