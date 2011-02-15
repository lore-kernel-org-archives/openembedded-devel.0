Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PpPfD-00030e-6m
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 19:30:15 +0100
Received: by bwz10 with SMTP id 10so700583bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 10:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=0+39wCrdJkQepwdoMrz3K5gskUyB7wFpMeoFsdN80vA=;
	b=Qy4sv6rT2l5LQs4BACEXE7QOmkyhqrCkgbY9V557Rfb9pNkzUjQTREAuKXK0cygIvJ
	D69ze9QnssDokV2tD3A5/PJG6v9TG0M9a3W1CrU9oTEYuSfx28afBSqab8+bcHtZB0zE
	vC0Cj9eNJ0f4eY/zv3IXlKKp0sfaTMyZliarI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=DcDzgRsMiNfgr5oolSAhJT55JsUoFke/iCx1aGTuC1ZQ0FynTr2jht7vTFytboz0LH
	LMh80AI+W3gHMfIVBCfi0IvjutxPDC+BFilhcNhhmIiWegNxX7Xxsyc7D4radovD9CXc
	WOFcFB9mLuMHbb764xWW0tEZXNfPB7354bHLQ=
MIME-Version: 1.0
Received: by 10.204.124.6 with SMTP id s6mr4714671bkr.51.1297794543425; Tue,
	15 Feb 2011 10:29:03 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Tue, 15 Feb 2011 10:29:03 -0800 (PST)
In-Reply-To: <AANLkTi=w3MMa77WEx6H0PWSJifDmGS7F_t+yKCdJ47oT@mail.gmail.com>
References: <AANLkTinQ9DmVt+3G3fh=-0wKKsR6Vr89dSvJUwOB8SAG@mail.gmail.com>
	<4D5ABB82.7000701@mentor.com>
	<AANLkTi=w3MMa77WEx6H0PWSJifDmGS7F_t+yKCdJ47oT@mail.gmail.com>
Date: Tue, 15 Feb 2011 18:29:03 +0000
X-Google-Sender-Auth: tNtT-IPAeEF4xvuBcCpPVLfaAb0
Message-ID: <AANLkTi=EFme7ffCJbrnqKbE=wABJ6yf7p_g35LBv0Gxv@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: gcc-cross-sdk: fail to build with 20110215 OE
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
X-List-Received-Date: Tue, 15 Feb 2011 18:30:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2011 at 18:02, Otavio Salvador <otavio@ossystems.com.br> wr=
ote:
> On Tue, Feb 15, 2011 at 17:44, Tom Rini <tom_rini@mentor.com> wrote:
>> On 02/15/2011 10:26 AM, Otavio Salvador wrote:
>>> Any idea why it fails?
>>
>> Missing host package, whatever provides libc_nonshared.a on your distro?
>
> Seems wrong since I shouldn't depend on the host library for it, should I=
?

Installing libc6-dev didn't help.

It must be something else specially because I built it fine some time
ago. (I don't know the specific hash).

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


