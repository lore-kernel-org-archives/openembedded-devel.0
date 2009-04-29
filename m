Received: from [74.125.44.154] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Lz0zT-0000BC-Qo
	for openembedded-devel@openembedded.org; Wed, 29 Apr 2009 06:01:47 +0200
Received: by yx-out-1718.google.com with SMTP id 4so559727yxp.30
	for <openembedded-devel@openembedded.org>;
	Tue, 28 Apr 2009 20:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=JGl17gjPnyPPwM7Cz0+Nur8S4OAAj0/ouz/0eCRVMMg=;
	b=Im2gkvi+4+pDRLu2745iy06VZMQHiOMga1bxfLArgLekZ3tk46fnp7v13dhUyn3z87
	1sDmikLX/sTTcblooFCcsosUvUARRaSg7yRmd1dqc9IMIUTGMScXi/8jPaZjWBX5+wod
	169+uqspxEMb4f9KyqbkrX+TW9mlOPS/HOwEI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=lTNITchbRQxqCj3qOP5+5pTFCOjIzUdUq5e9zydxSYctkevvuD6hlnOUwr9CyJOxy+
	TyMJi8Viu3ExZDZCvki3uJbnvMvchGEDQFF7EmwEMOZ7eLyYT6WhZt0OHjyYLJsP0LCs
	s1Re71hqA9i1usMzdWCwCBaNBSTbHeO0iZ/Ts=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.152.12 with SMTP id z12mr11501678and.141.1240977394627; 
	Tue, 28 Apr 2009 20:56:34 -0700 (PDT)
In-Reply-To: <20090429034358.GX18788@smtp.west.cox.net>
References: <87r5zckux9.fsf@neumann.lab.ossystems.com.br>
	<20090429034358.GX18788@smtp.west.cox.net>
Date: Wed, 29 Apr 2009 00:56:34 -0300
X-Google-Sender-Auth: e22d15d078041ae8
Message-ID: <be7a9f3d0904282056s6cd809d0w71164b38720c37a0@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: Pull request from O.S. Systems tree
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
X-List-Received-Date: Wed, 29 Apr 2009 04:01:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Tom,

On Wed, Apr 29, 2009 at 12:43 AM, Tom Rini <trini@kernel.crashing.org> wrot=
e:
> To summarize our IRC chat just now:
> - cups should RRECOMMENDS in some stuff that's dynamic now and used to
> =A0be included in another package.

I'll wait to change that to hear some suggestions how we could some it
in better way. I don't like the RRECOMMENDS on this case since it
reduces the flexibility.

In our specific case we do need to not include things of cups in our
image. One idea that come to my mind was to change cups package to
really include all stuff and add a new package like cups-daemon that
depends on nothing. I just fail to see how I can do it dynamicaly for
backends.

> - GPLv2 is in licenses.conf, GPL-2 isn't, change please :)

Done and updated the branch according (I've also add two new commits
about licenses on the tree too, take a look plz).

> Otherwise, everything looks fine (and I recall Koen looking at, and I
> think agreeing with the geode optimization changes, including the glibc
> build change).

I belive I've done them all. Koen please take a look.

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


