Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1M6iYh-000297-Pa
	for openembedded-devel@openembedded.org; Wed, 20 May 2009 11:58:24 +0200
Received: (qmail 29502 invoked by uid 813007); 20 May 2009 09:50:32 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 20 May 2009 09:50:31 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2009 11:50:21 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.30-rc3-00005-g51bc6b7-dirty; KDE/4.2.2;
	x86_64; ; )
References: <8f4584b50905192359w46f238b0x85fcd709d5e30c5b@mail.gmail.com>
In-Reply-To: <8f4584b50905192359w46f238b0x85fcd709d5e30c5b@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200905201150.22222.marcin@juszkiewicz.com.pl>
Subject: Re: How to use the native package?
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
X-List-Received-Date: Wed, 20 May 2009 09:58:47 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia =C5=9Broda, 20 maja 2009 o 08:59:29 =E4=BB=A3=E5=B0=94=E6=AC=A3 napisa=
=C5=82(a):
> Hi all,
>      Is it the right place to ask? I have a question about the OE
> compile. Hope I can tell you the case clearly.
> I have a package. Let's say it "mypackage". The compile process is:
>
> When make "mypackage", it will generate a intermedia tool. Let's call
> it mytools.bin through Makefile.
>
> %.c: %.tmp
>     ./mytools.bin $< > $@
>
> Then it will use mytools.bin generate some c files.  Using those
> generated c files compile out  the final bin file.

I would hack^Wpatch makefile to build "mytools.bin" as host binary.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




