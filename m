Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RHEQq-00039O-6x
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 14:42:40 +0200
Received: by bkat8 with SMTP id t8so5057606bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 05:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=2cP+h9lYTxTe6C3o62Ck9Li2I1rrWh5CUFROyMcckN0=;
	b=lRYhE45Z9ow6YP0Kena8F+QNr/u1vF7kAv7aPhbWOHAOfuhkSq0y3dNtiTv6/pYy8s
	MyOGYREh+H5CRLZoLapwe196rwW6K0mGS35DNct1ETfGHXykoHYS7DtNdeK2tRvBBW5x
	G+XnG/MoUPoYzHfXmOPJDQ8cPq40KeY21rlc4=
MIME-Version: 1.0
Received: by 10.204.136.152 with SMTP id r24mr10664167bkt.5.1319200606893;
	Fri, 21 Oct 2011 05:36:46 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.205.114.204 with HTTP; Fri, 21 Oct 2011 05:36:46 -0700 (PDT)
In-Reply-To: <j7r1gt$3jk$1@dough.gmane.org>
References: <cover.1319168013.git.otavio@ossystems.com.br>
	<1d63385213ee2d6741906cf2e61ccfb6fee58270.1319168013.git.otavio@ossystems.com.br>
	<j7r1gt$3jk$1@dough.gmane.org>
Date: Fri, 21 Oct 2011 10:36:46 -0200
X-Google-Sender-Auth: j-WakVfhjwNclFe-e67MXiVpdl4
Message-ID: <CAP9ODKryW=T3KVjGu1F1sWovbpZYE5eJSRTe+f+WxbAnQEJ0Xw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 3/4] systemd: do not recommend systemd-serialgetty
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
X-List-Received-Date: Fri, 21 Oct 2011 12:42:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2011 at 03:55, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 21-10-11 05:34, Otavio Salvador schreef:
>> The service ought to be add if need. Not by default on all images.
>
> Hmmm, I disagree. If you're using sysvinit OE will add the getty to initt=
ab
> already, I see no need to make systemd behave differently.

We we don't move it to suggests?

Personally I think it is different and forcing everyone that doesn't
want it to have bad recommendations is wrong.

Someone moving to systemd will need to review everything once again
and it won't hurt to add one package if he really wants to have getty
on serial. Many won't want or use it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


