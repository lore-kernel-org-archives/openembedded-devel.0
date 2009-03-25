Received: from [209.85.221.124] (helo=mail-qy0-f124.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LmJDB-0000BZ-Kr
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Mar 2009 03:51:25 +0100
Received: by qyk30 with SMTP id 30so3769282qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 19:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=1bhVzs4mUsHK1mx0iMUO+d/TsoJ5td/K/jkUERmTKAo=;
	b=YwKfOtQCcKbcVxTV9824FIq0qFVVdyqJm6JmspEj33dJCzRKyZDIIH2t5sZNeir7+U
	HSqC/+p64uX60yJBw7vSLrzxIIcjvtWnvGSDSf7L3173HuFwapqrxJkCsAsI/BrKCoTI
	96PWo7AKfr2BqVbn0pu0RPk3FY8IWM+qwTbNE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type
	:content-transfer-encoding;
	b=D413ww51kOV8hB9dEwkJdRQwidM2tFKN5ztoO5UXUGiGtNfrEEa8SQc7jsZiRMCcQ2
	jj7LILNadZDpl5m6s8C2OaY+S+OzmRqSkBuLxP6a+eSXQ2XROfjudkeHrbzrRZ07sYr3
	aK9Dk7b1ZKA24dJpK6eyDeXgfo1/+DCRPSvDI=
Received: by 10.224.20.10 with SMTP id d10mr11886357qab.34.1237949390652;
	Tue, 24 Mar 2009 19:49:50 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 33sm4828484yxr.37.2009.03.24.19.49.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 24 Mar 2009 19:49:49 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 9BF34610054; Tue, 24 Mar 2009 23:49:47 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <1236890935.6250.26.camel@northpole>
	<1237220171.4020.4.camel@faraday>
	<be7a9f3d0903161800i3f6735c8u7eafe009f2cb0b88@mail.gmail.com>
	<1237928739.20348.3.camel@northpole>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.91 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Tue, 24 Mar 2009 23:49:47 -0300
In-Reply-To: <1237928739.20348.3.camel@northpole> (Jader H. Silva's message of
	"Tue, 24 Mar 2009 18:05:39 -0300")
Message-ID: <878wmu48qc.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Subject: Re: calibrateproto git tag
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
X-List-Received-Date: Wed, 25 Mar 2009 02:51:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Jader H. Silva" <jader@2mi.com.br> writes:

> Em Seg, 2009-03-16 =C3=A0s 22:00 -0300, Otavio Salvador escreveu:
>> 2009/3/16 Marcos Amorim <marcos@2mi.com.br>:
>> > libxcalibrate_git add tag
>> >
>> >
>> > git diff packages/xorg-lib/libxcalibrate_git.bb
>> > diff --git a/packages/xorg-lib/libxcalibrate_git.bb
>> > b/packages/xorg-lib/libxcalibrate_git.bb
>> > index f9e1587..7f889df 100644
>> > --- a/packages/xorg-lib/libxcalibrate_git.bb
>> > +++ b/packages/xorg-lib/libxcalibrate_git.bb
>> > @@ -6,7 +6,7 @@ DEPENDS =3D "virtual/libx11 calibrateproto libxext"
>> >  PV =3D "0.0+gitr${SRCREV}"
>> >  PE =3D "1"
>> >
>> > -SRC_URI =3D
>> > "git://anongit.freedesktop.org/git/xorg/lib/libXCalibrate;protocol=3Dg=
it"
>> > +SRC_URI =3D
>> > "git://anongit.freedesktop.org/git/xorg/lib/libXCalibrate;protocol=3Dg=
it;tag=3Dmaster"
>>=20
>> Please use AUTOREV in conf/distro/include/insane-srcrevs.inc and a good
>> one at conf/distro/include/sane-srcrevs.inc. This makes images easier to
>> be reproducable.
>
> Add calibrateproto sane revision to sane-srcrevs.inc, corrected this bug
> in my compilation.
> Patch is attached.

[...]

Please send the patch in git format-patch; so I can queue it here in my
tree and push it together with other fixes.

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


