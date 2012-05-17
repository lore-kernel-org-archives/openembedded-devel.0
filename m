Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SUrG4-000161-O5
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 05:20:09 +0200
Received: by eekd49 with SMTP id d49so380202eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2012 20:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=/wWqeR1kQmazgERpHCKpJXhTeav2HRQxMTfERotJosY=;
	b=zrX7Z2K22cz7gC8z6J1k89GgYNTTKUrDaphHePSpL65XCHuhZeZvg78buRPjIbJmw4
	2iGqYiLzKgYfyapPPAVXDWvrh8AimdenZULGCGH88d/vQVY1qYE32b/wiRhxDktT5q5Y
	AxkI3zARBoyeh77WLiSC5CbOhEdAns6qharmVYtunzBLnF90qjwye0ZJZh5VA/1UWMG4
	aHXVtFm5FoHhZKgOTBxLfHhevZY+YZmUh+N7hdgXZnqBfEefkW4XxJKhuOT0Fdfk3yP9
	IxrrNz5/Ux8vdsJM4A+XY8eYZ+zbJiomxniAWXYJfWkZ4LVqMJnhmCl+quH2yokLPvFW
	3YIA==
Received: by 10.213.28.3 with SMTP id k3mr1048383ebc.141.1337224206527; Wed,
	16 May 2012 20:10:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Wed, 16 May 2012 20:09:36 -0700 (PDT)
In-Reply-To: <DB8F1B3EEF94C3439BFFE674EB05E3CC02844E@HKNPRD0204MB116.apcprd02.prod.outlook.com>
References: <DB8F1B3EEF94C3439BFFE674EB05E3CC02844E@HKNPRD0204MB116.apcprd02.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 May 2012 20:09:36 -0700
Message-ID: <CAMKF1spGt5XY9vDe=TZjdDLj5N3cm=ZO1y=j0HJjniwCh_Xrzg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: base-passwd URI invalid in OE classic
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
X-List-Received-Date: Thu, 17 May 2012 03:20:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 16, 2012 at 6:55 PM, Craig McQueen
<craig.mcqueen@beamcommunications.com> wrote:
> Hello,
>
> I'm trying to build OE classic for i.MX28, following instructions at:
> http://www.imxdev.org/wiki/index.php?title=3DAll_Boards_OpenEmbedded
>
> I'm trying to run:
> =C2=A0 bitbake bootstrap-image
>
> But it's breaking on base-passwd, downloading from:
> http://snapshot.debian.net/archive/pool/b/base-passwd/base-passwd_3.5.20.=
tar.gz
> which fails MD5 because it isn't a valid link.
>
> I found this is valid:
> http://snapshot.debian.org/archive/debian/20120101T033042Z/pool/main/b/ba=
se-passwd/base-passwd_3.5.20.tar.gz


you can backport this patch

http://git.openembedded.org/openembedded-core/commit/?id=3D15e8aa4cd773022b=
36a66f70e4f6436289f3d1bc

to oe classic
>
> But is that suitable to put in SRC_URI in base-passwd_3.5.20.bb?
>
> What is a good way to fix this problem?
>
> Regards,
> Craig McQueen
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


