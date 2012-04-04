Received: from mail-qa0-f41.google.com ([209.85.216.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SFVZt-0008Km-Oe
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Apr 2012 21:09:09 +0200
Received: by qafl39 with SMTP id l39so812826qaf.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Apr 2012 11:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=3vjxJDFa8J4W63MEkdss459L1n1+J9P2Pj+PqSYExTg=;
	b=1CgpkOptozcMZ2fZDC7J2l0kEp0BDQUdJ9TaQiVqjayayn6d4BNEbZBpfOY3W5y7kK
	INMGllUsACnTtviXJZt5v91wI0T1BMA5EQeAnpA999PBWVspWeGFVmoH4aLjkFVblTSU
	G03UOEXVhx2Dulo+g+T2kTXsoQBPbgox8hxTGTmALsFEF0FWI39GkoUcROmC5SY0lv9h
	wiFpmAOs37/+So8bSWayDeQn6vLK9FPnkk3WUbmu/gZrVVd+6MDE6a6+RxnHOTSJZPqk
	2eTMCoZq6ijncpy4bYK/sUd/uzCqtO0zRBqZ9PYk3LlmMJgi5Ulf373j07mWvEX3mmls
	yU6w==
Received: by 10.224.33.134 with SMTP id h6mr201351qad.15.1333565998641; Wed,
	04 Apr 2012 11:59:58 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.79.79 with HTTP; Wed, 4 Apr 2012 11:59:38 -0700 (PDT)
In-Reply-To: <jli1uf$7nt$1@dough.gmane.org>
References: <20120404091720.4b743c5b@eb-e6520> <jli1uf$7nt$1@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 4 Apr 2012 11:59:38 -0700
X-Google-Sender-Auth: nabNp3g9QeSilQ8Q33--8Y6GF5A
Message-ID: <CABcZANngH2BSmSdBPkaPyJcG1RFuKLxc9DnJWhe7_b9xcSGjxA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: build meta-oe without systemd
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
X-List-Received-Date: Wed, 04 Apr 2012 19:09:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 4, 2012 at 10:55 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 04-04-12 00:17, Eric B=C3=A9nard schreef:
>> Hi,
>>
>> would that make sense to support systemd as a DISTRO_FEATURES ? That
>> would make builds using older udev (< 174) possible with meta-oe as this
>> actually fails because of systemd.
>
> We talked about this during the yocto bsp summit this week and I'm workin=
g
> on a patchset to send as RFC later this month (post 1.2 release):
>
> commit b98d45b1bc2d9cf9ba41629240e6c21f19ddceff
> Author: Koen Kooi <koen@dominion.thruhere.net>
> Date: =C2=A0 Tue Apr 3 14:13:59 2012 -0700
>
> =C2=A0 =C2=A0meta-systemd: move over systemd from meta-oe
>
> =C2=A0 =C2=A0Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>
> commit 59c57bd73d1f157dfada233df889852fdb4a692f
> Author: Koen Kooi <koen@dominion.thruhere.net>
> Date: =C2=A0 Tue Apr 3 14:12:42 2012 -0700
>
> =C2=A0 =C2=A0meta-systemd: create layer
>
> =C2=A0 =C2=A0Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>


Woot! We can stop using BBMASK to exclude bbappends from meta-oe when
this happens :)
--=20
Christopher Larson


