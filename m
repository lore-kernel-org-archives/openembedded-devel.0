Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1SVHyu-00012H-Fj
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 May 2012 09:52:12 +0200
Received: by lags15 with SMTP id s15so1948924lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2012 00:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=tLrzlp8v7K5GnhjLNMCDVImFA2OHjcgDogfOKPlVc3E=;
	b=XZqFUORJexOrI0dQoKsxTQUeN2ef7xbjxbuDg7o96TN/K0vtsWUA0MUOjamzKSyOKR
	z8qTUtsB6twnvHzSugaeZ5Mr/MAJSqhQu5cU3b5xUw+B9G6WkeyAVhtR+ZfuyycYaEoH
	UYYT736iLgGmjt0q/LiLdWGQsqUKxhVGvCEzXykPc0jVTYMsiWej4dgBYgJKb+mVhiVJ
	bPr8cJ6U/xarQekrmT7j/ZJdKmbHTMThZ9jtd1OQq5IN701OlKM6gtd4CEjJV5ulLoNc
	XruuZDsNwn3BKsf0VD30ufKUG2f6j1AleWEAA4ISPeHWR91P4nuS/QQh4MQzeeAoeaIc
	G+Ww==
MIME-Version: 1.0
Received: by 10.152.148.234 with SMTP id tv10mr10000072lab.41.1337326928804;
	Fri, 18 May 2012 00:42:08 -0700 (PDT)
Received: by 10.112.100.132 with HTTP; Fri, 18 May 2012 00:42:08 -0700 (PDT)
In-Reply-To: <009001cd33a6$3cc91050$b65b30f0$@slingshot.co.nz>
References: <CADZ6=asJ+xLvpodv=u9duDuWs=dp8mLamv=Sj6yJc6B5sjWMrw@mail.gmail.com>
	<jove3h$7qg$1@dough.gmane.org>
	<CADZ6=auuzv9dF1p58wVXPFdckBUmgk6nmucnarWpqdxMbyHpaw@mail.gmail.com>
	<009001cd33a6$3cc91050$b65b30f0$@slingshot.co.nz>
Date: Fri, 18 May 2012 09:42:08 +0200
Message-ID: <CADZ6=asGZbkeWhpvGgKMyTp6v+xOucvbCGLB-vmBMPnsU0eG-g@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQk7ncZpCwEjqNrttxTtPM3SY7+IIZO3pYThqSmDGjTGC5W93etYVTx2IOFBkJgEK1PTGQIM
Subject: Re: Where do I override DISTRO_FEATURES?
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
X-List-Received-Date: Fri, 18 May 2012 07:52:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Mike,

> Dear Thilo, Anyone else,
> How did you get oe-core/Angstrom-v2012x to build a working system using a=
 2.6.37 kernel?
> I'm in a similar position using TI AM3517. The latest angstrom is built a=
round systemd which requires a 2.6.38 or better kernel.
> I've had to reluctantly revert back to oe-classic and angstrom 2011.03.
> Any hints on getting oe-core/Angstrom-v2012x working with a 2.6.37 kernel=
 would be great.

Angstrom uses linux-libc-headers-3.2 for user space ABI. It's a rather
dangerous hack, but it enables you to use 2.6.37 with a state of the
art user space. If you're curious just take a look at
<https://github.com/DFE/HidaV>, that's our layer stack. The wiki has
some documentation, too:
<https://github.com/DFE/HidaV/wiki/Hidav-oe-layers>.

Basically we use everything from meta-ti, meta-oe + meta-angstrom, and
oe-core (let's not talk about meta-java ;) ). We just stick it
together in meta-hidav, and so far angstrom-v2012.x works for us.

Regards,
Thilo

--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228 =C2=A0 mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77 =C2=A0 =C2=A0http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B
Ust.-IDNr. DE273952058
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle


