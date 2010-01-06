Received: from mail-gx0-f227.google.com ([209.85.217.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NSQfx-0008QV-Nu
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jan 2010 08:51:32 +0100
Received: by gxk27 with SMTP id 27so16941510gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jan 2010 23:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=lDDDmzNJsZqrDpxdutUPTXmf9kk0Kmc8R9hkhSS/7e8=;
	b=R06NG+InoEohoplMGFKqbHa0AMvYQdMnp7q4q3KhPTJdytUopIqNOsSU/WMT6WWuQy
	wGOpUCxPoTQbmIOxYSTb1jkm+pFPt+b0bKcx0pFMizGfLgvoCX5GM9Mx5l6HTDtGlq5D
	L1wlYgN/3EnT70reFD6GLQM2qIQfrepnne6zE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=nYj/7HpJrdvqqesopGfwyqddrijh/Z4A4C1lN2OwE/PTGq6jOpQ2RTQtMIua/NmrTA
	kcfTpJsv7Tfdz+VSR/PKOsMIiv16KCyAd5m4C3AGrHvu9T/m1Sntm7wTD0dNrmu/Thmn
	786pleJjcFwxKAhHmB265FObDK/QwoSv310vQ=
MIME-Version: 1.0
Received: by 10.101.128.18 with SMTP id f18mr41204804ann.165.1262764164877; 
	Tue, 05 Jan 2010 23:49:24 -0800 (PST)
In-Reply-To: <201001060507.31754.holger+oe@freyther.de>
References: <201001060507.31754.holger+oe@freyther.de>
Date: Wed, 6 Jan 2010 08:49:23 +0100
Message-ID: <ac9c93b11001052349u285341b9p80d339ac96f73a38@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.227
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: QA Goals for OpenEmbedded
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
X-List-Received-Date: Wed, 06 Jan 2010 07:51:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/1/6 Holger Hans Peter Freyther <holger+oe@freyther.de>:
> Hi all,
>
> mostly inspired by Guo's last mail about buildbot. In one way I agree wit=
h
> Guo, we need more QA and also an attitute to not commit when the tree is
> somehow broken...
>
>
> Here is my list of short term goals and it would be cool if people sign u=
p for
> it:
>
>
> =A0 =A0 =A0 =A0*) Does bitbake world work? If not it would be cool if som=
eone could take
> =A0 =A0 =A0 =A0 =A0 =A0a look?
>
> =A0 =A0 =A0 =A0*) Fix compile errors of bitbake world for a set of config=
urations?
>
> =A0 =A0 =A0 =A0*) Koen reported that dependency loop reporting is not wor=
king anymore..
> =A0 =A0 =A0 =A0 =A0 =A0anyone cares to invest thes five minutes to fix th=
at?
>
> =A0 =A0 =A0 =A0*) Sometimes we have pretty embarassing issues like some i=
mages switching
> =A0 =A0 =A0 =A0 =A0 =A0from mdev back to udev and we don't notice for mon=
ths(!!!)
> =A0 =A0 =A0 =A0 =A0 =A0It would totally rock if one could change the root=
fs.bbclass (or
> =A0 =A0 =A0 =A0 =A0 =A0such) class and count the size of the image on the=
 first run, store
> =A0 =A0 =A0 =A0 =A0 =A0it in the temp directory and report the diff's bac=
k to the
> =A0 =A0 =A0 =A0 =A0 =A0tinderbox and then we could have a view on the tin=
derbox?
>
> =A0 =A0 =A0 =A0 =A0 =A0Inside the build summary we should see the new siz=
e of the image
> =A0 =A0 =A0 =A0 =A0 =A0and the growth compared to the first built?
>
> =A0 =A0 =A0 =A0 =A0 =A0The idea would be to have people look at the water=
fall and go OMG
> =A0 =A0 =A0 =A0 =A0 =A0why did "minimal-image" grow by 2MB?
>
> =A0 =A0 =A0 =A0 =A0*) The next step would be to transfer packet sizes as =
well
>
> =A0 =A0 =A0 =A0 =A0*) Integrate some testing into recipes. E.g. attempt t=
o boot the console-
> =A0 =A0 =A0 =A0 =A0 =A0 image and grep the Serial Console for the "Loging=
:" prompt..
> =A0 =A0 =A0 =A0 =A0 =A0 Test the toolchain to compile binaries...
>
>
>
> anyone feels like helping?
> =A0 =A0 =A0 =A0z.

Holger, I'm always open to helping (time permitting of course).

Another thing I found missing is the lack of error messages in the
classes if e.g. a file is missing. In some cases this seems to be
silently ignored.
Had a case yesterday (will report on it in a separate message) and
also saw it on a different place to report (but forgot to note it and
can't recall it, sorry).

Frans

(btw dependency testing worked for me a few days ago, but that was on
a tree that was not in the dev head).

Frans.


