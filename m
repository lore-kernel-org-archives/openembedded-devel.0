Received: from mail-bk0-f44.google.com ([209.85.214.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <takeshi.ken.hamasaki@gmail.com>) id 1UJwkQ-00050B-Ob
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Mar 2013 03:03:50 +0100
Received: by mail-bk0-f44.google.com with SMTP id j4so2609399bkw.31
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Mar 2013 18:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=DGJfG1LxCHGLSAx7GvjMLiy7c4aaP5eaDJVj9na65Q8=;
	b=Ab4eUwmrczsFy/ETaJyZq4DHpFN6hSGpXbgSEHPdxXCIiptD/edWbvq7QQYIFlOPW0
	ebqQmuaYH6TGOwANlmajWlA0ARRFYNwsX0ZrCisa0TOPI6Al0a5A5ks5pl35bcxpzoPE
	ypFlknXAaKDCeZ6cAGHJZBbg2mi07yKUwgn/e4mAZ4OaAWFe9tw8IwTZWc+knbbEu0kc
	bSK6zNFLpUN4DJ005ywGaVNuxc1NFR0fOk3ELJpzORC8Qw7s3OKjIVHTyynvKmPtErF1
	RCNC4Q1RZgGkFHyxAevhLhGSy/wxs34oCOiuk0abK7QVbFt9JxbW7HT72nGC+VJxrGwp
	/1Ng==
X-Received: by 10.205.7.72 with SMTP id on8mr4442401bkb.122.1364175957087;
	Sun, 24 Mar 2013 18:45:57 -0700 (PDT)
MIME-Version: 1.0
Sender: takeshi.ken.hamasaki@gmail.com
Received: by 10.204.25.141 with HTTP; Sun, 24 Mar 2013 18:45:37 -0700 (PDT)
In-Reply-To: <1364150558.389@bughunter.ca>
References: <1364150558.389@bughunter.ca>
From: Takeshi Hamasaki <hmatrjp@users.sourceforge.jp>
Date: Mon, 25 Mar 2013 10:45:37 +0900
X-Google-Sender-Auth: lzW2-ooLaU7thuRbGM35dMcGmr8
Message-ID: <CAPESJy7JcSJXQE6vCEKxxPhZcVi69jW7EOr+t=LS=n+evoS_mw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: ATNGW100
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
X-List-Received-Date: Mon, 25 Mar 2013 02:03:56 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Justin,

according to the DISTRO name,
you have to specify something exists in
source/meta-angstrom/conf/distro/ directory.

I guess you can find angstrom-v2012.05.conf or something there.
Thus
DISTRO=3D"angstrom-v2012.05"
helps you to walk one step forward.
--=20
Takeshi Hamasaki

2013/3/25 Justin Seitz <jms@bughunter.ca>:
> Hey all,
>
> I am pretty new to OE, and having followed some scattered instructions on=
 building the ATNGW100 I have been unsuccessful with the new OE core. My lo=
cal.conf includes the directives:
>
> TARGET_OS =3D =93linux-uclibc=94
> MACHINE =3D =93atngw100&#8243;
> DISTRO =3D =93angstrom-2008.1&#8243;
> ANGSTROMLIBC =3D =93uclibc=94
>
> Which it complains that angstrom-2008.1 cannot be found as a distro. Is t=
his a case that I can just pull the configs from the OE-classic repo over o=
r is there a guide somewhere that I can't find in YOCTO that describes how =
I can move the ATNGW100 build over to the new OE-core?
>
> Thanks in advance,
>
> JMS
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


