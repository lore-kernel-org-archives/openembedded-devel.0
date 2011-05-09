Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJR9F-0005Eq-DG
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 16:09:21 +0200
Received: by wye20 with SMTP id 20so4360157wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 07:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=mmMLoZvXYMAIBCpaH+YMROk1k46rkZq6tacAueTAlwQ=;
	b=ZyVoZupyrinkfFcHJLkYo+dcYL1rdA1uI4NZSgA8opQaHd+IHZNcvCbYDAsRlTpX04
	A02EJyCh9PG4SVLvbVlZr5XSnn7hIomk+S898arEZ+gAgs+xxIMHrp+OT+QedrWT1qw8
	CQ7v1sCkkO50c1dtC60AFSHzzGAkDyu/S4hbA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=vKVgybEeoi2i4VMI4iF2DlD78oynsT7FKAetn9fhs7W4wsK30BaUmdi4VO6EwHSQdJ
	CLggzGPI3iZC3ICpZTQADsubmQL6hmTuH+IO+OhMy28/xh7UMdOZWad17+KyrYroKcWX
	xH3H0QJfFRfv3Vs0leNbwHqboCrOlluozgVQE=
MIME-Version: 1.0
Received: by 10.216.232.8 with SMTP id m8mr248152weq.22.1304949996898; Mon, 09
	May 2011 07:06:36 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.93.195 with HTTP; Mon, 9 May 2011 07:06:36 -0700 (PDT)
In-Reply-To: <1304949493.8000.81.camel@phil-desktop>
References: <1304872895-21596-1-git-send-email-otavio@ossystems.com.br>
	<1304872895-21596-6-git-send-email-otavio@ossystems.com.br>
	<1304949493.8000.81.camel@phil-desktop>
Date: Mon, 9 May 2011 11:06:36 -0300
X-Google-Sender-Auth: _svjVaxYu5RupgUN70lY-QethtQ
Message-ID: <BANLkTinxZqRQKOeG47S_wSLNMitNuGywqg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v3 06/11] p910nd: add version 0.95
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
X-List-Received-Date: Mon, 09 May 2011 14:09:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 9, 2011 at 10:58, Phil Blundell <philb@gnu.org> wrote:
...
> This doesn't look like it's going to work: it tries to stop "p9100d" but
> that doesn't seem to be the correct name of the executable.

I prefer to drop the script et all. Personally I don't use it since we
handle it in our OS and so it would be easier and better to drop it
and someone add it back when need.

>> +do_compile () {
>> + =A0 =A0 ${CC} ${LDFLAGS} -o p910nd p910nd.c
>> +}
>
> Shouldn't this also mention $(CFLAGS)?

Good catch.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


