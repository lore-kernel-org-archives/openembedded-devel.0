Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PAgeX-00052y-Pi
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 12:21:15 +0200
Received: by iwn42 with SMTP id 42so794017iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 03:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=0o/fyGJLlXLXXTGLld5LEHvSU09xj4fV3PB02OuubVY=;
	b=AD/wlfaA4z9o1ZoZ2RV4NeULq7hqg5xbUM3iuWWbsb2FlnZ6YOwaiFmDi/EROAkqtC
	4MzifTnx10v2ieTLeAZyoxChgfkGa+oXmZ0+cz9ZH9DAdYwpRZMv4aRUV4byd33np+3E
	JrrFBrBm+x20KUMTpr3W5VdO7jGtsBJ1H8njc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=aKrOWea03qKzNWRNel+9Gtzkd6Q18Zw/XUomn/br5pYjMhgWycMNkyDGvQEVkPGrzJ
	PUvcJ3NZsVV/Hz7sqkR7J1kTfhejhHgbuB8+lAU5LYI8IvUB2HqUYvXLJIlsUtV+tI6N
	vcZnrJDz8dpN/fP2hH9xyle3CvyLHADAPn6Fs=
MIME-Version: 1.0
Received: by 10.231.145.16 with SMTP id b16mr7006192ibv.198.1288088428806;
	Tue, 26 Oct 2010 03:20:28 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 26 Oct 2010 03:20:28 -0700 (PDT)
In-Reply-To: <AANLkTimztx6DMH76DrzVaY6oXEb1GF2HA5Us5r+1aDVb@mail.gmail.com>
References: <AANLkTimztx6DMH76DrzVaY6oXEb1GF2HA5Us5r+1aDVb@mail.gmail.com>
Date: Tue, 26 Oct 2010 12:20:28 +0200
Message-ID: <AANLkTik3PX27t5u7mhS=KRTCW4N44An5mJp+-gMZVVOw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-25
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
X-List-Received-Date: Tue, 26 Oct 2010 10:21:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/25 Cliff Brake <cliff.brake@gmail.com>:
> I apologize the testing-next branch did not get created last Thurs.
> I'll try to create a cron job so this happens automatically in the
> future.
>
> The master branch has been merged to testing-next branch, and
> testing-next is ready for clean builds.
>
> Last testing cycle:
> http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=tested_2010-10-14
>
> For more information on the OE testing effort:
> http://wiki.openembedded.org/index.php/Testing
>
> Thanks,
> Cliff
>
> --
> =================
> http://bec-systems.com

Not a very succesful branch yet:

minimal fails on libgee native (see my email titled libgee
introspection problem).
And slugos-image runs into an endless loop:

 5429 ?        S      0:00 python
/home/hudson/jobs/FM_TEST/workspace/bitbake-1.10.0/bin/bitbake
slugos-image
 5435 ?        S      0:00 sh -e
/home/hudson/jobs/FM_TEST/workspace/tmp/work/armv5te-linux-gnueabi/e2fsprogs-1.41.9-r24/temp/run.do_install.5429
 5436 ?        S      0:00 make
DESTDIR=/home/hudson/jobs/FM_TEST/workspace/tmp/work/armv5te-linux-gnueabi/e2fsprogs-1.41.9-r24/image
install
 5901 ?        S      0:00 /bin/sh -c test -d doc && cd doc && make
install-doc-libs
 5902 ?        S      0:00 make install-doc-libs
 5904 ?        S      0:00 /bin/sh /usr/bin/texi2dvi ./libext2fs.texinfo
 6021 ?        S      0:00 /bin/sh /usr/bin/texi2dvi ./libext2fs.texinfo
 6022 ?        D    301:18 etex txiversion.tex

Frans.


