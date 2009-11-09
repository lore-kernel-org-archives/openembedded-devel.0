Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N7SUW-0006gX-LG
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Nov 2009 12:33:03 +0100
Received: by bwz9 with SMTP id 9so3108431bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Nov 2009 03:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=TuPsOJBgmkV6KLfX/nSH8jIsf2jFC7Y8PzuSvdLAJQQ=;
	b=FJ/eKDdYSUqIepmZf03yYEaYhkyaFiQ90GqhjFXLKWaUqJ9S/+fr8+gtGqRGc3GvSg
	DnvD3ICY+sVCmmb5nA5jYSG0D70r83raVUG46cLsM/UfeGr1GgcyNCPNIu2AjHOJEzSu
	95Lw64bIP2uVeBhDbkoOeYf0/QXW5ocWFbP+s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=kz7viPri1HGXdgi/W8rtKVBeuqcv/+Q+Y2W6ufOCWf1YAW/lVu0JqWnvWQwwgAR9+T
	J7JSecrCiypbu5oktJqsZHVo2PP0VAtsBwE+0/0acLb7lZi+E28i9JaSl8wdcvMyqYHL
	EE0WKgRpoH2qmh2TSs0LWL/N7ibIeeQ5EAj+A=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.130.145 with SMTP id 17mr802625hbj.52.1257766303844; Mon, 
	09 Nov 2009 03:31:43 -0800 (PST)
In-Reply-To: <20091108205654.GC16449@ibawizard.net>
References: <1257689597-31831-1-git-send-email-ynezz@true.cz>
	<1257691795.25369.229.camel@lenovo.internal.reciva.com>
	<20091108161751.GA16449@ibawizard.net>
	<20091108195635.GB16449@ibawizard.net>
	<be7a9f3d0911081233h4cd65b87x60b78f3929295d4a@mail.gmail.com>
	<20091108205654.GC16449@ibawizard.net>
Date: Mon, 9 Nov 2009 09:31:43 -0200
X-Google-Sender-Auth: 391f508ba606e07e
Message-ID: <be7a9f3d0911090331x7f362fd2v75628075a5d92e5d@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] libgsf: fix compile error, add missing dependency on 	gtk+
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
X-List-Received-Date: Mon, 09 Nov 2009 11:33:03 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

Hello,

2009/11/8 Petr =A9tetiar <ynezz@true.cz>:
> The real issue, that I just found, is that gdk-pixbuf package overwrites =
pkgconfig files
> of GTK, so it reports GTK version of gdk-pixbuf package 2.10.14 instead o=
f
> correct 2.18.3 of current GTK.

Cool; are you cooking a patch for it?

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


