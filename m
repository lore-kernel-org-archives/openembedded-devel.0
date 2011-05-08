Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJ6y7-0001Bb-QA
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 18:36:31 +0200
Received: by bwz5 with SMTP id 5so3929702bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 09:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=1AUpJCCxBlsPG1z2pfhdgxR/BRkmvbIVsHVcuw1UB3Q=;
	b=jgNmKiPM/myhLSrtRBK5xtuB/VRvpTxcmc3muPh9DJsAx7nwwWaVxgYGAbNmYrGzC5
	D6WOONg0Q9FtIPu+0VSNwJkzJ9FIk99Di8D6KeyoFkhAO0bPEjx3mS22Z20QYbnJWQ/2
	ooaSkbsYiFPaUMXwBbhK6+JwifSqFFh9Ha5iY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=lyakz8Bw7Js90vdmppHVXzTwGHdv1NYtPlpIAY7b1PvxDIukYNys08Ej3aFWE5GzFX
	FV2X/wh83H2EA1rNoo7abLvtnABh/tASydAKMDM95iVF9G+JD13JFlepj+Soje86aLYP
	2lOSOiJGLAelFPLl4sLacL5Vwi0UbXQJ7OaXI=
MIME-Version: 1.0
Received: by 10.204.40.70 with SMTP id j6mr2605385bke.81.1304872426529; Sun,
	08 May 2011 09:33:46 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Sun, 8 May 2011 09:33:45 -0700 (PDT)
In-Reply-To: <4DC68C80.2040506@gravedo.de>
References: <1304773638-24877-1-git-send-email-morphis@gravedo.de>
	<BANLkTik1ArwPz=B-OGrsfNWza2ad4d4g6Q@mail.gmail.com>
	<4DC68C80.2040506@gravedo.de>
Date: Sun, 8 May 2011 13:33:45 -0300
X-Google-Sender-Auth: 9OZrYLXH9KbJKei6ue9IU02xcp8
Message-ID: <BANLkTim84uVEcJRPLoZ9TmQ4-vLs9Dux5g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] qt4-libs-native: add initial recipe
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
X-List-Received-Date: Sun, 08 May 2011 16:36:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, May 8, 2011 at 09:28, Simon Busch <morphis@gravedo.de> wrote:
> On 07.05.2011 21:17, Otavio Salvador wrote:
>> On Sat, May 7, 2011 at 10:07, Simon Busch <morphis@gravedo.de> wrote:
>>> The native version of the qt4 libraries is needed by some other native =
recipes to build.
>>> It's mostly a copy of the qt4-tools-native recipes with some changed co=
nfiguration optons
>>> and is only available for version 4.7.2 now.
>>
>> I second this idea since I will be a user of it but seems better to me
>> to have a full qt4-native since this would reduce build duplication
>> time, no?
>
> You are right. As qt4-libs-native and qt4-tools-native are build mostly
> the same stuff we could merge them and create a qt4-native recipe if
> nobody else has any concerns. I will provide a patch for this.

IMO you might try to make it on qt4-x11-free recipe and add a provides
for the tools.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


