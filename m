Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N6qX7-0008NL-0I
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Nov 2009 20:01:12 +0100
Received: by bwz9 with SMTP id 9so2112755bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2009 10:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=AYPfNQvmd4ikgObpWOpKDy7ayr2JK0yr1q9hAtCKSHU=;
	b=kUXilfalvR/tlp1xqdwqqj8BKjHTQJfTyFXI97vX/sZhzmznM/O4V7nKdzcRvF32Gj
	Bf9DFmcyfjyeKgABlvX+7nks3CpYEGFwjYwNEv5Zm7FfT7Z/+Yi5Wh86tLZAeAWTdTTj
	fW26iTMArkcRTHahDxMGj5cRLexEOum2zcXrs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=Omp1kGhKzTvpoaZYuuFIknczZ77enOKiqFVgTc5WUIuT8284kD/g78ZfzQqizLb781
	Be924D6khYgSQS1zaVyrRx78fn4oJYXYgRMjtogzCMAUV0V71kzkL8WYhejD7Dvt0JAP
	Na8DEQM54EOE3tPul6//yzssucM26pITvbif8=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.182.153 with SMTP id q25mr580827hbg.138.1257620393704; 
	Sat, 07 Nov 2009 10:59:53 -0800 (PST)
In-Reply-To: <20091107180118.GD25214@ibawizard.net>
References: <1257536522-11924-1-git-send-email-ynezz@true.cz>
	<1257536522-11924-2-git-send-email-ynezz@true.cz>
	<1257536522-11924-3-git-send-email-ynezz@true.cz>
	<be7a9f3d0911070843w78f620abtbb4ee96db6e5f6c0@mail.gmail.com>
	<20091107180118.GD25214@ibawizard.net>
Date: Sat, 7 Nov 2009 16:59:53 -0200
X-Google-Sender-Auth: 6d989dec36971e96
Message-ID: <be7a9f3d0911071059p3535556eoe83e88989f8efbf4@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] xf86-video-geode: update to 2.11.6
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
X-List-Received-Date: Sat, 07 Nov 2009 19:01:12 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

Hello Petr,

Look at my reply to your machine definition and ignore this one ;-)

2009/11/7 Petr =A9tetiar <ynezz@true.cz>:
> Otavio Salvador <otavio@ossystems.com.br> [2009-11-07 14:43:43]:
>
>> Hello,
>
> Hi,
>
>> On Fri, Nov 6, 2009 at 5:42 PM, Petr =A9tetiar <ynezz@true.cz> wrote:
>> > +COMPATIBLE_HOST =3D 'i.86.*-linux'
>> > +DESCRIPTION =3D "X.org server -- Geode GX2/LX display driver"
>> > +
>> > +RDEPENDS_append_iei-nanogx-466 +=3D "xserver-xorg-module-libint10 xse=
rver-xorg-module-xaa "
>>
>> IMO it could be added as regular RDEPENDS since the driver depends on
>> that when running on GX and exa when on LX (exa might be added here
>> too).
>
> Ok. Should I update older packages also? Since I've copy&pasted it from t=
here.
>
> -- ynezz
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


