Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PgpMl-0000M8-S3
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Jan 2011 03:07:47 +0100
Received: by bwz10 with SMTP id 10so2850497bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 18:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Hh7WplFCwpbg9b0Dsj9VVAP9JHjpiEpdfyxTJB2l+Nc=;
	b=FS43ebda9Gi6Hz3UbyoWSHRhTIBwdRtQPqGDEpbWr6d0+jmZJydWgdsB7WGHxLLRQm
	Ko960TJMIPyNCvKTaOqMDtS6Jviyp/TApqsrWIhA5zlb7TgnDI2vgFseIJC13JCPDUYA
	NiaPhdLEWSvUzIBTMlBNzsIUsAgAgJxlAPF00=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=J5qkmt7MEj0Q4I+9E1MOUs9VYkJMU3UPMPMh1Y7CUo546WfsVBjhLZXHEFU58qu/Lo
	HPcuqTRXjIghQAE83CgRzHv9zgDsMMm0W1Q2Np89F5p9X9IlQWs01fN7dxbdTRgH7bWS
	kxouhDf0Dt/2h9cZ8rvq5s2QlG87vAvXWiwUw=
MIME-Version: 1.0
Received: by 10.204.129.83 with SMTP id n19mr2182967bks.207.1295748348773;
	Sat, 22 Jan 2011 18:05:48 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.59.147 with HTTP; Sat, 22 Jan 2011 18:05:46 -0800 (PST)
In-Reply-To: <4D3B200B.6000909@mentor.com>
References: <1295027350.14388.6527.camel@rex>
	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>
	<4D353F81.50301@xora.org.uk>
	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>
	<4D35C5C3.60205@mentor.com> <ih4s84$gbj$1@dough.gmane.org>
	<4D35FC8B.1090404@mentor.com>
	<AANLkTinHP=9S6tAFdiWHfk8zZi0MhvfNTgW71Ugx++9w@mail.gmail.com>
	<AANLkTi=aMnnfnaQZNLpZW_8MUWq_jckou9tr_bA8NBY6@mail.gmail.com>
	<4D3B200B.6000909@mentor.com>
Date: Sun, 23 Jan 2011 00:05:46 -0200
X-Google-Sender-Auth: Xq7_yByEqTEdDQSqGYC9hMCMXn4
Message-ID: <AANLkTik-23O4mC1iGDDpkB2OR=ggGrZtPBEV22wR2Cry@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Sun, 23 Jan 2011 02:07:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 22, 2011 at 16:20, Tom Rini <tom_rini@mentor.com> wrote:
> On 01/19/2011 01:46 AM, Frans Meulenbroeks wrote:
>> Wrt the GPLv2+ version. I suggest to reflect this in the name.
>> E.g. you could have samba and samba-gplv2 (or perhaps samba-gplv2 and
>> samba-gplv3). Then it immediately becomes obvious why there are two
>> versions.
>
> Put me in the "no" camp here please, we have a LICENSE field for a reason=
.

+1

What we'd do for multi-license projects? foo-lgplv2-gplv2-mit-bsd.bb? grrr

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


