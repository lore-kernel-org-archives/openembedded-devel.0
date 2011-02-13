Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Poier-0000Xq-9Y
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Feb 2011 21:35:01 +0100
Received: by fxm17 with SMTP id 17so4289041fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Feb 2011 12:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=EOQzoeXOCFyB3a2zbEtuVtsblg/ZiVgtK2d/OxJBNac=;
	b=YU0Z8CvRGY8T6XEsQMLJX10xBX6MK6HXqRj7h2YQMH2U3e3JCl8PPOB9H7kmtkGqhV
	joaUEZbVs7b4EXQ90EGXZGhEcM7Mf+mH8axO5gsvpxqmC7l3fDhM6QTIW2lmiKu0JUgg
	R2nTaCyGoT+grzPyCwiDTViapA6CV9wYu2MwE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=jI16hJiNf7tY/SLEzmHN1MSm+zYJKHg+FA6gnwy71knebvcTFc0cyPEo4LcJrzX657
	FJs91Qp+a9a+y4OaEf2453ndrccaxFsJaz8aH6bLnGjul2BoyUuBZe8YEl4aqYgT6mdK
	ZlkqvZ0rv2MUwCNMQWTLXRf9HnYaXdLgnLElU=
Received: by 10.223.96.199 with SMTP id i7mr3581924fan.101.1297629233023; Sun,
	13 Feb 2011 12:33:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.66.22 with HTTP; Sun, 13 Feb 2011 12:33:31 -0800 (PST)
In-Reply-To: <201102131650.17611.schnitzeltony@gmx.de>
References: <201102131650.17611.schnitzeltony@gmx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 13 Feb 2011 12:33:31 -0800
Message-ID: <AANLkTindNuCayWTyNrhSoaaVy4P9KhXnaJ2Lae_EX13V@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] insane.bbclass: fix the check for bad RPATH
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
X-List-Received-Date: Sun, 13 Feb 2011 20:35:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 13, 2011 at 7:50 AM, Andreas Mueller <schnitzeltony@gmx.de> wro=
te:
> Hi OE folks,
>
> Yesterday I merged latest head into my working branch and started a fresh=
 build for xfce46-image. I get
>
> ERROR: QA Issue with db: package db contains bad RPATH /home/Superandi/tm=
p/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib in file /home/Superandi/tm=
p/work/armv7a-angstrom-linux-gnueabi/db-5.0.21-r3/packages-split/db/usr/lib=
/libdb-5.0.so
> ERROR: QA Issue with db: package db contains bad RPATH /home/Superandi/tm=
p/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib in file /home/Superandi/tm=
p/work/armv7a-angstrom-linux-gnueabi/db-5.0.21-r3/packages-split/db/usr/lib=
/libdb-5.0.so
> ERROR: QA Issue with db-bin: package db-bin contains bad RPATH /home/Supe=
randi/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib in file /home/Supe=
randi/tmp/work/armv7a-angstrom-linux-gnueabi/db-5.0.21-r3/packages-split/db=
-bin/usr/bin/db_checkpoint
> ERROR: QA Issue with db-bin: package db-bin contains bad RPATH /home/Supe=
randi/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib in file /home/Supe=
randi/tmp/work/armv7a-angstrom-linux-gnueabi/db-5.0.21-r3/packages-split/db=
-bin/usr/bin/db_checkpoint
> ...
> FATAL: QA run found fatal errors. Please consider fixing them.
> ERROR: Error in executing python function in: /home/Superandi/data/OpenEm=
bedded/gumstix-oe/recipes/db/db_5.0.21.bb
> ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
> ERROR: Printing the environment of the function
> ERROR: Function do_package_qa failed
>
> Without having further checks I think commit 14f7dd0965f14a09169dc5a2df18=
ff0b06f8bad5 causes this behaviour.
>
> What makes me wondering:
>
> - even in case I use the -k option the build aborts at the same position.=
 Is that intended?
> - Commit 6aa31074adaccffcfd3080e8390065ab5abda2a6 brings up many undetect=
ed RPATH cases which have to be fixed. With the current situation it is not=
 possible to check which there are.
>
> How about creating a list (I know Frans did already - but I think it was =
before the latest RPATH commit) listing the packages with QA errors / the t=
ype of QA error / and (to prevent double efforts) =C2=A0a person willing to=
 take care. (Although I know nobody uses it :-) I take a look for clutter-b=
ox2d which has RPATH error)
>
> Or is there something ongoing I have missed?
>

hmm I think there are too many QA errors now it is reporting as errors
and bailing out build. While we should fix
the QA errors but I think we should not be that strict yet
> Andreas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


