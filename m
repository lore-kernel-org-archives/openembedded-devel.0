Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PyVMA-0006d1-Bw
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 21:24:11 +0100
Received: by bwz10 with SMTP id 10so3307693bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Mar 2011 12:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=LhGrA+4uxb+XTxBnlA9Sy6qOfO/BN21y6se73DuAbZI=;
	b=K0t3IoWBzF4KLAD3f8hrVDr0jV0d6pyP+kSIeTL3EE3aTxIxSsAY9NYGmOFulqANvw
	GbzeLUlSGHZwHJzpzkiqkXz7PfqJLOKH+bCU6bwiOExa99Mr99JU3gpZ/d+MVOo9p9AY
	lg0Hlsab075TmHygIO1qrJ0Rx1zUR+ZJ/tYSk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=D8B3tQO+/LaAx+XhVPTcLi8p0C1+5erQkKSLAPVwxgHUlH+9gt3PGXFIqshpo7PWzi
	DoOwtQtgUvd08TPblZikthvApY+esoarxdcfXvlo8LNjnUbuuvveZYAL073/sqOMIHwG
	SAvgfzcijTOtoQLHFwQnOCDLYCUb+BmInjVbw=
MIME-Version: 1.0
Received: by 10.204.75.23 with SMTP id w23mr4179239bkj.200.1299961266378; Sat,
	12 Mar 2011 12:21:06 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.66.143 with HTTP; Sat, 12 Mar 2011 12:21:06 -0800 (PST)
In-Reply-To: <1299958038-25216-6-git-send-email-otavio@ossystems.com.br>
References: <1299958038-25216-1-git-send-email-otavio@ossystems.com.br>
	<1299958038-25216-6-git-send-email-otavio@ossystems.com.br>
Date: Sat, 12 Mar 2011 17:21:06 -0300
X-Google-Sender-Auth: Km62XGNcka3qxrgGzvpr40Px69s
Message-ID: <AANLkTimiahf+8xJ_nNePkXzB3Lhton2+5JqquPmruN24@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@openembedded.org>
Subject: Re: [PATCH 05/11] udev (165): move ConsoleKit support to udev-consolekit package
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
X-List-Received-Date: Sat, 12 Mar 2011 20:24:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 12, 2011 at 16:27, Otavio Salvador <otavio@ossystems.com.br> wr=
ote:
...
> -PACKAGES =3D+ "libudev libgudev udev-utils"
> +PACKAGES =3D+ "libudev libgudev udev-utils udev-consolekit"
...

Koen, can you take a look on this change?

It seems Angstrom is the only used of this version and seems better to
not provide support for consolekit by default so adding it as
recommends or suggests seems wrong to me.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


