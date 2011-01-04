Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Pa5ul-0002aw-Jt
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Jan 2011 13:22:59 +0100
Received: by bwz10 with SMTP id 10so13886798bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Jan 2011 04:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=0RfNulvUyh3Y/1S/+H+ETipQtJwPaP5xlS/07INSTJQ=;
	b=sfvJLRTpPmNINNjsy1Z9V1QNSBiKh9nBS6+dvhJKzOnmt+IZBAV9XC9BGpL2OUxYM+
	mqlvEeSA1kISZQO0JOUBTkMhaYL7tqOYzixFi9CyozxQOWgCYP2y2vPLPRDc5lDiptmO
	Hbz/RJQA2YgbDHdsJCv7f1ta8iLGrKpdmL/Xs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=gv5eUHiFnnuU7LZhfmr1nSA9vFCVyXmcm272eGh0eCpS+EMpd/+K4WI3JuhNcGiYvy
	Jy47d+CJGLqG92mLSO7YMsuI/bFhc/oylPbu3BLxOHYKG8K4t/l4i9zR9b4yNvjWtmuG
	BL3nBEhPWaYAM5yths8dZ8R1qwaRbErzrRdMA=
MIME-Version: 1.0
Received: by 10.204.101.81 with SMTP id b17mr10531416bko.126.1294143758358;
	Tue, 04 Jan 2011 04:22:38 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.59.147 with HTTP; Tue, 4 Jan 2011 04:22:38 -0800 (PST)
In-Reply-To: <4D230B5A.3030202@gmx.de>
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
	<1294084926-3115-9-git-send-email-rep.dot.nop@gmail.com>
	<201101032354.25037.roman@khimov.ru> <4D230B5A.3030202@gmx.de>
Date: Tue, 4 Jan 2011 10:22:38 -0200
X-Google-Sender-Auth: BO3dpU8xK7L9lhNZllb2kZ_BQpM
Message-ID: <AANLkTikAsHGf9H2YUVt6c7eqauOHyWuNUGC9Oy92TOBV@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 09/12] busybox: provide postrm for package mdev
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
X-List-Received-Date: Tue, 04 Jan 2011 12:22:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 4, 2011 at 09:58, Wolfgang Hauser <wohauser@gmx.de> wrote:
> Keep it simple and stupid!
> So I vote for the long, readable and less error prone version.

I usually prefer the KISS however on this specific case I disagree.

The new code avoid using test and a fork. This allows for "test"
applet removal if desired.

I prefer the ugly but more "embedded like" code.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


