Received: from [209.85.218.221] (helo=mail-bw0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MaG6q-0006vh-0r
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Aug 2009 23:39:20 +0200
Received: by bwz21 with SMTP id 21so2148781bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Aug 2009 14:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=PrvGE8gE3puqxlXmkWL4fBRoZDY133+TKu+LjlKHkCQ=;
	b=by4tkPhpD+hb1Y6wDBcDGcB9FXjXUl3SbwkaRsliE/Y5FQsYJbS9qSD0MitmreAdre
	4NY0Xw7epclAJq6zdvonbz9AjUV64kIQK89Mx4UEFyoijdLZcvxNPck+2wXXq+R2+xzA
	nTH/sBspt3hbHH1qE9QBwjpdRAULZXueGI9uM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=fRsXyAvRdRVb2jA31xpUQAwZfxZc2uyr3BfRxZy7o/VMNbERXcyBU7mXuy5mCjPncr
	7ikV+K/2TRWOgrGv1wrZlKJf1onAzCRkbTrwDL4dUPNv8WfR0NUE0fOF8wIrftpJce+l
	CdQ9Fu1JmDgAWH1sNfhDImUPgEGQRigrhNUl8=
MIME-Version: 1.0
Received: by 10.103.193.10 with SMTP id v10mr1540498mup.126.1249852990708; 
	Sun, 09 Aug 2009 14:23:10 -0700 (PDT)
In-Reply-To: <200908091518.20319.holger+oe@freyther.de>
References: <1249645320-4423-1-git-send-email-ihar.hrachyshka@gmail.com>
	<200908091518.20319.holger+oe@freyther.de>
Date: Mon, 10 Aug 2009 00:23:10 +0300
Message-ID: <fce2a370908091423r3b6396ecrf96c822c5372be02@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Added rcc (resource compiler) utility setup for QTE toolchain environment.
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
X-List-Received-Date: Sun, 09 Aug 2009 21:39:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2009 at 4:18 PM, Holger Hans Peter
Freyther<holger+oe@freyther.de> wrote:
> On Friday 07 August 2009 13:42:00 Ihar Hrachyshka wrote:
>> Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
>
> Thanks and in general nice work on Qt...
>
> What I have on my agenda:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0- Set QMAKE_QT_CONFIG in the environment too (=
this would make QtE and QtX11
> be installable in one SDK)

Do you mean we should have several environment-setups - for QtE and QtX11?

> =C2=A0 =C2=A0 =C2=A0 =C2=A0- Fix postgres test

Seems to be a postgresql recipe problem (no pg_config staged, and
currently it's compiled for target, not host so staging won't fix the
problem in any way). I'll look at it closer this week.

> =C2=A0 =C2=A0 =C2=A0 =C2=A0- Rename qt4-x11-free to qt4-x11

Seems reasonable for me.

> =C2=A0 =C2=A0 =C2=A0 =C2=A0- Kill qtopia from the path name..

Where should we store QtE (and Qt/X11) files then?

>
>
> z.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


