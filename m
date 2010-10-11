Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5Gpr-0008Np-9h
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 13:46:32 +0200
Received: by iwn7 with SMTP id 7so2580541iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 04:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=xDWAGYdcUuSXA1SpDJ9jrlTwl3R0VPIJRD9WxwPD6yE=;
	b=tVJssiaUE+IrJXLBaQnYimsRCeUDz6uBmJiijXTYTEQjmP6QIhas7m2xjjA+Ie8jDR
	/aqPvIC4WnLGh0zm7Ro9DE16PiHuKbwTbpsW8dTscrzBlKzxSG9+UIZ9HkzNGU+NC0PA
	8GrsTnjNbz36CUIGLxfcVTckB5J7HMUcTZ1/U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=NwSXX457vETeSmx03jMnAiPFGkJ7yspK6DaiiR83KP07GnN6Xw1yut68/P+U5DDDkk
	qQzwzCNYep6UuUZcRe31teGqH2lsMAvp6lPCOfGe22/qky9rjGJZNWkxl4ToFObIgKMc
	r9QY+Z69P+ZUPlZbRxEaBmRio/1PG4IO3z0GI=
MIME-Version: 1.0
Received: by 10.231.32.135 with SMTP id c7mr4527995ibd.3.1286797566345; Mon,
	11 Oct 2010 04:46:06 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 11 Oct 2010 04:46:06 -0700 (PDT)
In-Reply-To: <201010111109.38439.marcin@juszkiewicz.com.pl>
References: <AANLkTi=qFpjK39fB7NzZ-aTBfasWBjq5LBxKSbG9dWec@mail.gmail.com>
	<201010111109.38439.marcin@juszkiewicz.com.pl>
Date: Mon, 11 Oct 2010 13:46:06 +0200
Message-ID: <AANLkTi=ZKTqZGhV-qK14+ckj_tNkAwDB-SAcVSvuo9Gg@mail.gmail.com>
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
Subject: Re: zsafe
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
X-List-Received-Date: Mon, 11 Oct 2010 11:46:32 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

2010/10/11 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>:
> Dnia pi=B1tek, 8 pa=BCdziernika 2010 o 22:54:20 Frans Meulenbroeks napisa=
=B3(a):
>> By incident bumped into zsafe. No idea what it is, but something in
>> the recipe drew my attention:
>>
>> FILES_zsafe =3D "zsafe"
>>
>> do_install() {
>> =A0 =A0 =A0 =A0 install -d ${D}${palmtopdir}/pics/${APPNAME}/
>> =A0 =A0 =A0 =A0 install -m 0644 ${WORKDIR}/pics/${APPNAME}/*.xpm
>> ${D}${palmtopdir}/pics/${APPNAME}/
>> =A0 =A0 =A0 =A0 install -m 0644 ${WORKDIR}/zsafe.png ${D}${palmtopdir}/p=
ics/
>> }
>>
>> Seems kinda weird, installing files like zsafe.png and *.xpm but not
>> add them to the package
>
>> maybe inherit opie (which is also in the recipe will do some things
>> with this under water, but I would expect these files to go with the
>> exe.
>
> Those files go into package. opie.bbclass uses APPNAME/APPTYPE/APPDESKTOP
> variables to check what kind of application it is and how it is supposed =
to be
> run, then it takes care of copying icon and desktop file and few other th=
ings.
> It was written years ago and I think that most of today OE developers nev=
er
> played with OPIE.
>
> Dropping that FILES_zsafe =3D "zsafe" line may be safe - but I would sugg=
est
> doing build to check it.
>

As someone who never played with opie, I'll leave it to an expert.

Frans


