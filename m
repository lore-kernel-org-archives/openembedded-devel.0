Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 403A278EAA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 18:26:00 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id u21-v6so11662883qku.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 11:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=y6rw9trIbox5m1+hH4VRuOSFVMifK+EmB/iKMrS87p0=;
	b=Y1xNb8cUM+QhXVR3rM+ooozPuV/Ppfr6xSGEp3Ddcb2IwCsbmRjfNOAhGlloICD9vk
	ytnxn8lDkA0JvkxHCrBaEeKRGwafwRXazet4dPO/8cXEqspLk9Qi8jN4HhZ4wO6pwruA
	JH3twelbtQQ6OTrByV26F/tj1K+UeB4/UFkK6r5PH2zOeBxcdlp7ZoXHjPzIuFGYyl1Z
	HKC2pPEfrmpw5z2TnNuibo4tdmJe1hg1L43qM+csJdEacmkjTmMQ9fm8psVAYCHycCaY
	xz46nwcz/nrp7hrZFVSq6W2LxqbHqBa0Qg16io/iZI0unS9+wcuCIEEwC572JtbRQnE5
	Wr5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=y6rw9trIbox5m1+hH4VRuOSFVMifK+EmB/iKMrS87p0=;
	b=GMQG0RpxoeZGzVWBxza2xFa+wPRYKTFiq42RXPlQB7KvMHSb15BCehC+BIsnAltS4q
	kk2bmgX1/8CnkK0mDjHrnADx8L+UVWrz0qDvKijy9k/hTCLsVtB7yU/qvsbH/UNIHuC2
	VhKQOAGQsuRGujQajx4QLmJQcqXDz7ZDQuY9LbVGIWcb+e3Cm4SHON69lYak6ZXk3GLK
	YsetZLdEL1qx59voPrBHMrRQ6jb6uOGhDXlzT4cZvYy8CJoE+pApmVaRMeuS71/4LEmK
	PzcsILOpNG7Zr5ERxdaPwtvBUptaTi45btx9LhLFPtLcWPn1kbKiIZMogvNHE0eItjaU
	Ivrg==
X-Gm-Message-State: AOUpUlFwhpg4NNVlTdh7OD4bdPk/VJGr/N0djVJt9AoHn4yzDK9WBhBR
	YOqTqV/Bi7R5toWZOcnRhh69YTRR2BIG7ztbFgbnaABA
X-Google-Smtp-Source: AA+uWPzLCMnMOgj4uK0IUA6H/Llc+LFIVqpY94lj2cZNIrZtltVtRzAWL5EtY9AOV+46XeBZ2bdRtMiKsfyn+VU0Z00=
X-Received: by 2002:a37:4a94:: with SMTP id
	x142-v6mr16434194qka.110.1534184760911; 
	Mon, 13 Aug 2018 11:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <MAXPR01MB03485F715FB80DCF083B704191550@MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM>
	<MAXPR01MB0348E0FB92BCD5785A4E22E391550@MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM>
	<MAXPR01MB034871D225312CE9BAE6A46D91540@MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM>
	<CAMKF1soBLh_MHbLS11MqcxFg4LjnV8y0QRMYad3m7oqYQuVGTg@mail.gmail.com>
	<MAXPR01MB03481F6A061993B140AAE82991390@MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MAXPR01MB03481F6A061993B140AAE82991390@MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Aug 2018 11:25:34 -0700
Message-ID: <CAMKF1spyiaJjHYBk=rvxG5sPFDFy7QmhGzniYZL=MxEsPAxciA@mail.gmail.com>
To: Aditya Tayade <Aditya.Tayade@kpit.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libbytesize: fix gettext not found issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Aug 2018 18:26:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 13, 2018 at 3:55 AM Aditya Tayade <Aditya.Tayade@kpit.com> wrot=
e:
>
> Hi Raj,
>
>
> Tried using said USE_NLS =3D "yes" option and it compiled successfully.
>
>
> As per my understanding this option also enables recipe to use gettext fo=
r host, hence which one should we opt?

add  USE_NLS =3D "yes"

>
>
> Sorry for delayed response.
>
>
> Regards,
>
> Aditya Tayade
>
>
>
> ________________________________
> From: Khem Raj <raj.khem@gmail.com>
> Sent: Wednesday, July 25, 2018 9:35 AM
> To: Aditya Tayade
> Cc: openembeded-devel
> Subject: Re: [oe] [meta-oe][PATCH] libbytesize: fix gettext not found iss=
ue
>
> Can you try setting
>
> USE_NLS =3D "yes" in the affected recipe ?
> On Tue, Jul 24, 2018 at 6:29 PM Aditya Tayade <Aditya.Tayade@kpit.com> wr=
ote:
> >
> > Hi,
> >
> > In Sumo branch, libbytesize_0.10.bb<https://apac01.safelinks.protection=
.outlook.com/?url=3Dhttp%3A%2F%2F10.bb&amp;data=3D02%7C01%7CAditya.Tayade%4=
0kpit.com%7C8381da62714f4666051908d5f1e3eb02%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C636680883564574908&amp;sdata=3DKLfQdOn3xMvUq0YI1MoYm9isivid5=
AVy%2B4rgUzd8G10%3D&amp;reserved=3D0> do_configure fails with error "config=
ure: error: gettext not found", hence added a dependency to gettext -native=
 for the same.
> >
> >
> > Kindly review the attached patch and integrate it with upstream if chan=
ges looks fine.
> >
> >
> > Regards,
> > Aditya Tayade
> > This message contains information that may be privileged or confidentia=
l and is the property of the KPIT Technologies Ltd. It is intended only for=
 the person to whom it is addressed. If you are not the intended recipient,=
 you are not authorized to read, print, retain copy, disseminate, distribut=
e, or use this message or any part thereof. If you receive this message in =
error, please notify the sender immediately and delete all copies of this m=
essage. KPIT Technologies Ltd. does not accept any liability for virus infe=
cted mails.
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > https://apac01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flis=
ts.openembedded.org%2Fmailman%2Flistinfo%2Fopenembedded-devel&amp;data=3D02=
%7C01%7CAditya.Tayade%40kpit.com%7C8381da62714f4666051908d5f1e3eb02%7C35394=
51eb46e4a26a242ff61502855c7%7C0%7C0%7C636680883564574908&amp;sdata=3DM1BN9Z=
8DE1223Vm2uvuNghHfaKF7jTgZWCyqojzGxL4%3D&amp;reserved=3D0
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.

