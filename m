Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OPjei-0006Hg-Hw
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Jun 2010 00:03:35 +0200
Received: by iwn5 with SMTP id 5so1551516iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jun 2010 14:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=m6ND1LJIAcwW3noDBRfCbs1BNLunMGhCMHSMxtMff8E=;
	b=Jul1ah6MgKVaCgWyu7M02PLEW6HRE/RkqEOG55kdmdZv6pxO0aOG1NjE9SXKFg8pwi
	yAko2jPu8q7LQHonhBS5a9d+D4apf9fZRSrYhuitorypnX7MKE++e3H295PwYK0UyGzW
	Sp/zcPqg8FjHlBKdC4KDyH5aJCFJojo6x6T9Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=YDYVXubnPFfypNcYGuxcMhc02/eM+xqF3MAN30IeMdMaY6E5nGz5q7NjtwQYCb/Z4N
	LiyMFJCwv3XAMQFQKV++t0UAb+OXrXsNTKVr1hZBMaGKFBL+jHxUCpsOF5pAECH0OafV
	kjvcygQeS6vQtMyGFCwMFoublrae3LqG6K9rI=
Received: by 10.231.191.66 with SMTP id dl2mr1834891ibb.101.1276898321248; 
	Fri, 18 Jun 2010 14:58:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.17.130 with HTTP; Fri, 18 Jun 2010 14:58:21 -0700 (PDT)
In-Reply-To: <AANLkTil99t7nC8GYAqysbXybTApi_2QF9lg7mWTXulHu@mail.gmail.com>
References: <AANLkTil99t7nC8GYAqysbXybTApi_2QF9lg7mWTXulHu@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Jun 2010 14:58:21 -0700
Message-ID: <AANLkTimvVAj809LPJxo3nLek_kOKGNkt8l1hWlLyWys-@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Building Angstrom for Beagleboard
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
X-List-Received-Date: Fri, 18 Jun 2010 22:03:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 16, 2010 at 6:12 AM, Raseel Bhagat <raseelbhagat@gmail.com> wro=
te:
> Hi,
>
> I'm trying to build Angstrom from scratch for the BeagleBoard.
>
> Now, I've already faced a lot of issues , local as well as related to the
> build and managed to go past various stages in multiple attempt :-)
>
> Currently, I am bitbaking nano and I see that more than 7 GB space is bei=
ng
> utilised and its been over an hour and the build =A0is still going on.

angstrom uses -ggdb3 option to emit most possible debug information.
This will increase the
disk consumption and also time to compile. you could lower the amount
of debug info level
in distro/include/angstrom-<libc>.inc
where you should modify FULL_OPTIMIZATION and BUILD_OPTIMIZATION to
use -g instead of
-ggdb3

-Khem


