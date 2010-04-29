Received: from mail-iw0-f178.google.com ([209.85.223.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1O7ZNz-0001zF-Kj
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Apr 2010 21:27:00 +0200
Received: by iwn8 with SMTP id 8so8431409iwn.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Apr 2010 12:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=/mM7S2ZQ9Sn2lTznKrcEOt4gXlSt9B7oBwUyA3kWI9w=;
	b=clrMfhcQmBUZRVlsVTkbjcxh0JJF/c7dcBwQnfBAi8M1b/RJuK8oE6c1tbPWbyHqMH
	BZlsRuXwCIJvQcTfZy5v9cQgie5V4WRp8ntQKaLJtqbr0hMs0Gga151Fv2g6d7DwJkQ9
	KXrjSxZdf5k24TSnGSBtBld13BDAMN3KPxSu4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Wb1ey57fhB7kfYb/eFLZTpddbHMlisIwG8Nm97aRGo9SrU/L5JEUQ96W8T2uisNPpx
	2XNnxE/4u/a2e7IlwggP51FAUriH0F60e9k2GV40r9w8M/doWDPhAwykAEgreDuW+aF4
	CnvwRGWbdb230o0Miuw2ApeZQDaM7ViP6Niv8=
MIME-Version: 1.0
Received: by 10.231.170.143 with SMTP id d15mr669760ibz.13.1272568995727; Thu, 
	29 Apr 2010 12:23:15 -0700 (PDT)
Received: by 10.231.16.198 with HTTP; Thu, 29 Apr 2010 12:23:15 -0700 (PDT)
In-Reply-To: <h2ub7a795c81004290008z458edaf3wd76e38ed4784cd64@mail.gmail.com>
References: <h2ub7a795c81004290008z458edaf3wd76e38ed4784cd64@mail.gmail.com>
Date: Thu, 29 Apr 2010 12:23:15 -0700
Message-ID: <n2h19c1b8a91004291223qe164d1a9uc18d101db2fb839b@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Apache2 on angstrom
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
X-List-Received-Date: Thu, 29 Apr 2010 19:27:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 29, 2010 at 12:08 AM, Fabio Mauri <fabio.mauri@gmail.com> wrote=
:
> Hi all,
>
> =A0 I am trying to build an image with Apache2 and modphp installed.
> During the compilation I get this error message:
>
> http://pastebin.com/uBCr1sYE

Use permanent links if you can because emails are archived and this
link may disappear.
anyway the problem seems to be

ERROR: This autoconf log indicates errors, it looked at host includes.

Rerun configure task after fixing this. The path was
'/home/sources/OE/angstrom-dev/work/armv5te-angstrom-linux-gnueabi/apache2-=
2.2.14-r1/httpd-2.2.14/srclib/apr-util'

if you look at the log then the configure is called with
--includedir=3D/usr/include --oldincludedir=3D/usr/include
this does not seem right. Figure out why it did not use staging dir paths

-Khem


