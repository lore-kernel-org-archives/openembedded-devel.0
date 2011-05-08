Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJ7Mp-0003UV-QU
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 19:02:03 +0200
Received: by bwz5 with SMTP id 5so3937228bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 09:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=HKVfjuFImcvSjBgtU168vCk48/rk/t1A1GgWQFOee8Y=;
	b=FEhz4Pa97zAN2U2r5cjnFcSZE13Lk9VoiOTeHyQO1FdOSOuiJlXQehBTbw/qi5wPlM
	chGXwZo8UzEHuXIun6ReJqiaNCl2wMViBWlyozVU1N0IhNhmdaFfHwW8PzOKjO4TUz1s
	xRv5Feh8AdGOC+fOKq5WrJY2ouBu+AB83o8/Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=CmFwI0uaKCfpNYP0l+gYetr/j+FRS2o+WY2zCjsG5rUnpnMTtx4LRiiCbmIrM3/55L
	XzGBgALDyP0ON+FheGzslualGMBOAD95L7fPu069o6CcowQr9+LzeNvEblI2cH64KnUE
	5JshFj5nKkqAIqThDVL0oid0SqSVk2o5opii8=
MIME-Version: 1.0
Received: by 10.204.49.138 with SMTP id v10mr1602321bkf.108.1304873958669;
	Sun, 08 May 2011 09:59:18 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Sun, 8 May 2011 09:59:18 -0700 (PDT)
In-Reply-To: <4DC6CA02.1000009@gravedo.de>
References: <1304773638-24877-1-git-send-email-morphis@gravedo.de>
	<BANLkTik1ArwPz=B-OGrsfNWza2ad4d4g6Q@mail.gmail.com>
	<4DC68C80.2040506@gravedo.de>
	<BANLkTim84uVEcJRPLoZ9TmQ4-vLs9Dux5g@mail.gmail.com>
	<4DC6CA02.1000009@gravedo.de>
Date: Sun, 8 May 2011 13:59:18 -0300
X-Google-Sender-Auth: xiMQUUDWTDWux9aJ3BfmyPyKwsw
Message-ID: <BANLkTinafst602eBgMcMY9igWn1QA7wdJg@mail.gmail.com>
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
X-List-Received-Date: Sun, 08 May 2011 17:02:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, May 8, 2011 at 13:51, Simon Busch <morphis@gravedo.de> wrote:
...
> Hm, I need it for the embedded variant of qt4 so we should add it to
> qt4.inc which is already quite complex and very target specific. I think
> the best option is to create a qt4-native recipe which provides both
> qt4-tools-native and qt4-libs-native. This would even be the best option
> to be backward compatible (some stuff in OE is depending on
> qt4-native-tools in different versions).

The native variant does need to be the embedded one for you? I think
you just needed it to run something that uses QtCore or something
similar during the build process (my case) and then build it for the
target.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


