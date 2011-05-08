Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJ7f4-00049e-Mc
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 19:20:54 +0200
Received: by bwz5 with SMTP id 5so3942751bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 10:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=FSqW5IOOHko96XkYBMacVFPyCRSiwbPUpgkFtwUC3ao=;
	b=E9jjWAn8KQI4lC1C6/Kx4l5RJ5dwClvFTypHyS3hc9qVrnGzESgvEj3sY/dpfZkg2u
	Yyva0ZJn6+dQG/LwnhPLEVrtp3DOVhtMyJi3ZRQDS5NcEb6XI22miKBxngMBfiDXBLhZ
	U0fTKbY3W48hPf77N87HUMUyMjRPpTtnaKQy4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=q3ra8F7H6r7BMurTTg0s39JyHs7wHsCqTlYeqz+OfH8qq4hsSGZ1hI/3S2zhuIiaDX
	Q9kYN+5vQVY/xQdecXYZjP88BuzMIuhSSnbe2z8XxjfEXaemVzxkZK0Bej0Zi5BEDk89
	nnPO6YFNTWm7SE9iRxqGSEheYvyyEGac4nm1o=
MIME-Version: 1.0
Received: by 10.204.49.138 with SMTP id v10mr1613857bkf.108.1304875084653;
	Sun, 08 May 2011 10:18:04 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Sun, 8 May 2011 10:18:04 -0700 (PDT)
In-Reply-To: <1304873759-20379-1-git-send-email-morphis@gravedo.de>
References: <4DC6CA02.1000009@gravedo.de>
	<1304873759-20379-1-git-send-email-morphis@gravedo.de>
Date: Sun, 8 May 2011 14:18:04 -0300
X-Google-Sender-Auth: 270d7YFWJqlYRuUcBis6_4ZoZEk
Message-ID: <BANLkTinj7NmL9h8R3EVC78YgPUaiBGqyFg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] qt4-native: introduce the native version of qt4
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
X-List-Received-Date: Sun, 08 May 2011 17:20:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, May 8, 2011 at 13:55, Simon Busch <morphis@gravedo.de> wrote:
> The new recipe is based on the qt4-tool-native one but it even installs t=
he libraries of
> qt4 and not only the tools like moc/rcc. It will not increase the build t=
ime as most
> libraries are already build for the qt4-tool-native but not staged.

Please remove the tools recipe too.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


