Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SRVrM-0005vl-0W
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2012 23:52:48 +0200
Received: by wibhn14 with SMTP id hn14so34527wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 May 2012 14:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=kwW/E6zcubV0sn4pK0zjE5Ibm1uzvuMiUiNzQ6aHGmM=;
	b=lf8P5MjmY/+yjVFdKX/P6WvzsWh70OFgf+1JVEcUufakYo1CUd1ytAVJ9MzyRSCuN0
	dyZC+7lQiO/eeqdnXbu4p62DEkLjKqwU7fX2UJnHIXu0E/owOt1l8AtnKXzK+XzG6y6K
	qZJcVp60soIx7U8ZrihxBZptGMrsKK9NpxRkxF1zFOjNGgBdwgHcr8g1F2v5REJpk3tc
	E+sq4YnClC8gY4n+6pPvdcMI8Z0SKAdDBxmpuYcio3NNrxB58VRiMFBGnAwbxP5BxH8g
	1dvUNcbmylndZ6dfAIquEKa/BmJCgcuZdt8uWSMtNbLoZxwpN/Fdy51n3gp+psCA+2iw
	17KQ==
Received: by 10.180.77.4 with SMTP id o4mr9195209wiw.17.1336426977434; Mon, 07
	May 2012 14:42:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.23.66 with HTTP; Mon, 7 May 2012 14:42:27 -0700 (PDT)
In-Reply-To: <1336424471.2074.4.camel@dasty-laptop>
References: <1336391680.3417.7.camel@dasty-laptop>
	<4FA7B9DF.60304@mlbassoc.com>
	<1336394035.3417.12.camel@dasty-laptop>
	<CAMKF1sonQpWBRYNSapa16EDGyyQCiRr5AmKoSx02xnqzzn+5yA@mail.gmail.com>
	<1336424471.2074.4.camel@dasty-laptop>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 May 2012 14:42:27 -0700
Message-ID: <CAMKF1soY2jQ4Cm1wriqB+aZgPpfQqYK6BpAsSYzLZC9ovM8rkQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Simultaneous build of two intree packages
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
X-List-Received-Date: Mon, 07 May 2012 21:52:48 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 7, 2012 at 2:01 PM, Radek Dostal <rd@radekdostal.com> wrote:
> Because ln -sf first do symlink(1) unlink(2) and symlink(3) again. In
> case link is created by another process between 2 and 3 than ln fails.
>
> It is quite well described here:
> http://rcrowley.org/2010/01/06/things-unix-can-do-atomically.html
>

Do you think I don't know how ln works ?
all I was asking why are same symlinks being created
by two different packages that seems broken to me. Fix the
packages


