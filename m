Received: from [209.85.217.206] (helo=mail-gx0-f206.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1M29Cz-0001X9-By
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 May 2009 21:24:41 +0200
Received: by gxk2 with SMTP id 2so596529gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 May 2009 12:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=puGq97KHw5egp85XSRFzXuABRoUQbgKJTaYeONDBtaY=;
	b=b5Rki3qFSToRiYXX9a339rZvOrhZ2cy5hHg/EgJqryPpFL6FlCOod89el4jClQ+imc
	SLeQAaBCHOeLORTvP4S7ero+QFNbz9Ap15qkYqCTzpCKy9b16iRshe8HUzq7djs6D6AY
	jyySsMtJuWUXMf4OxOy5t4G4fEK//6Ozrcvkc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=r58y+9hAc1OdVJJm9rTVBMP4RyjxOOjaVKdOZ0lSMoHNs8/eNv4lp7ztUlSqA1dhE9
	PIb9ko+jt7P9npUKo23tVtQ0dsWNXoAwZmtHtsl+OARyfsNlS4PknikVQCb0XA5cuGW0
	2Bb/3TUzxDOthC0D1KfOyOZ+52tcl0GzItmzk=
MIME-Version: 1.0
Received: by 10.90.106.4 with SMTP id e4mr2108944agc.88.1241723911405; Thu, 07 
	May 2009 12:18:31 -0700 (PDT)
In-Reply-To: <1241720835-17998-2-git-send-email-msmith@cbnco.com>
References: <4A03277B.1090402@cbnco.com>
	<1241720835-17998-1-git-send-email-msmith@cbnco.com>
	<1241720835-17998-2-git-send-email-msmith@cbnco.com>
Date: Thu, 7 May 2009 21:18:31 +0200
Message-ID: <c384c5ea0905071218v3978ea4cpe791a5283f05c2df@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/3] grub: use ${libdir}, not /usr/lib
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
X-List-Received-Date: Thu, 07 May 2009 19:24:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, May 7, 2009 at 8:27 PM, Michael Smith <msmith@cbnco.com> wrote:
> Signed-off-by: Michael Smith <msmith@cbnco.com>
>
> =A0do_install_append() {
> =A0 =A0 =A0 =A0 install -d ${D}/boot/
> - =A0 =A0 =A0 ln -sf ../usr/lib/grub/i386${TARGET_VENDOR}/ ${D}/boot/grub
> + =A0 =A0 =A0 ln -sf ..${libdir}/grub/i386${TARGET_VENDOR}/ ${D}/boot/gru=
b
>

Why do we install menu.cfg in ${libdir} anyway?

All desktop distro's I have seen have the menu.lst in /boot/grub/ on the ro=
otfs.

Is this a FHS thing?

Regards,
--=20
Leon


