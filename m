Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pirobk@gmail.com>) id 1Oxkuj-0000Mr-7U
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 20:16:29 +0200
Received: by fxm17 with SMTP id 17so967031fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Sep 2010 11:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=CEwzCFMakkF4XXeunYERGERZkc8405RuK7hNiGa7AiQ=;
	b=x/h/z7nmYDRrqjgR+1hOQeHM9fMa/QKAQJNED4Atgy/zxkuM+bHsJ3n7IltfUSj6wd
	99o4ptvsLUXdEsbKAgSklUmjrsKul+eHBETOo9KkjMjoC9qRfh8HUMsfvUqDvrnt9xUl
	IIIh9HW9vsOzwL48fSwnFmSM+v5DjMBAexsdc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=OtFpUaJfjm/CkMTgbiQ+H6qPzHBYF5rhoa1DE2+kGOdz68NrcVIE+AlkIPJIi+EiB5
	E2xCJQydUTXdj/hNOdIAFmzZlINFF2WDIWomWlp9EtCA+AbnRIj/HqvK15KWkIxMMKP4
	akc22sewOAbCJ9KR8P6KrM2c1TEJsjUWs8d/A=
MIME-Version: 1.0
Received: by 10.102.228.7 with SMTP id a7mr570596muh.12.1285006586399; Mon, 20
	Sep 2010 11:16:26 -0700 (PDT)
Received: by 10.220.180.65 with HTTP; Mon, 20 Sep 2010 11:16:26 -0700 (PDT)
In-Reply-To: <4C9693E5.3040504@freyther.de>
References: <1284933592-4558-1-git-send-email-pirobk@gmail.com>
	<4C9693E5.3040504@freyther.de>
Date: Mon, 20 Sep 2010 20:16:26 +0200
Message-ID: <AANLkTim+VwnZH-yiNOPkQ-ZvbGLmjXpEz8U-WJOoPzt7@mail.gmail.com>
From: =?ISO-8859-1?Q?Bj=F6rn_Krombholz?= <pirobk@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: pirobk@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qt4-embedded: avoid circular dependencies for reciped providing qt4-embedded
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
X-List-Received-Date: Mon, 20 Sep 2010 18:16:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/20 Holger Freyther <holger+oe@freyther.de>
> On 09/20/2010 05:59 AM, Bj=F6rn Krombholz wrote:
> > @@ -1,4 +1,4 @@
> > -DEPENDS_prepend =3D "${@["qt4-embedded ", ""][(bb.data.getVar('PN', d,=
 1) =3D=3D 'qt4-embedded')]}"
> > +DEPENDS_prepend =3D "${@["qt4-embedded ", ""][(bb.data.getVar('PN', d,=
 1)[:12] =3D=3D 'qt4-embedded')]}"
> > =A0inherit qmake2
>
> use startsWith and avoid the extra array allocation?

Array slicing just provides a new mapping onto the original array and
doesn't copy any data.

I chose this syntax to make it consistent with qt4x11.bbclass


