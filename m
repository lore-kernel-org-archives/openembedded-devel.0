Received: from [209.85.132.242] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MPj7R-0006OP-5N
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Jul 2009 22:24:25 +0200
Received: by an-out-0708.google.com with SMTP id c5so795361anc.42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jul 2009 13:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=SOxV+PclJEJNNb2li6YE0gXNsm3AP9VxipciOXKhiK0=;
	b=nGxV3adeP+zb2HxwT/8dgO0qBvayZQiL0oT5U8uaT/ILXMnFf3vQdaa2e2n4B7phVV
	bCPnBBjEJLdp4//Llm4H8L/1a+l/up6MGxbh1h5NaXjUb8g/a2vm7psuT42KSQwbmUVL
	fY43QuFyG78eNWXwSQ545ycFEitfS1bDDeRDs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=Qxe4QVP9HvPa3pceJeBgYoUGGkdLL8o0/LOzgedfrxEZLpJmNeScU7ACm672YUC6X3
	QlMlLlQtUmVUKlzX5K7vBZq55i2ML2Gxz0O3gv/3YHJ2KxjNhvL4Vjpwxkwrcf3xVXtZ
	V107dJnJw1tTEXEzaopHTFtgfiJOBiODFoVSs=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.121.12 with SMTP id t12mr4730334anc.58.1247343084698; Sat, 
	11 Jul 2009 13:11:24 -0700 (PDT)
In-Reply-To: <4A579CA5.2090708@cbnco.com>
References: <be7a9f3d0907101039i6a58c3aeof2fc3e1f40d24dd0@mail.gmail.com>
	<4A579CA5.2090708@cbnco.com>
Date: Sat, 11 Jul 2009 17:11:24 -0300
X-Google-Sender-Auth: 32a16a58eeb3e508
Message-ID: <be7a9f3d0907111311t787312ddkea38b876829f88ad@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Mistakenly pushed changes without review, specially 	6633c4c95a
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
X-List-Received-Date: Sat, 11 Jul 2009 20:24:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Michael,

On Fri, Jul 10, 2009 at 4:55 PM, Michael Smith<msmith@cbnco.com> wrote:
> It looked good to me, but bitbake bails with:

Yes, you weren't the only one and it has already been reverted in dev.
I'd like to fix it now to get it properly pushed.

[...]
> Also -- I've seen some references to MACHINE_CLASS. I'm wondering if it was
> intended to solve a similar problem.

Similar, yes.

MACHINE_CLASS is different since it is not supported by all distros
and it has been being used for reuse a class of settings not whole
configuration like kernel defconfig, etc...

Besides that the MACHINE_FALLBACK is going to be used as MACHINE in
case MACHINE is not found. That makes quite easy to reuse kernel and
other settings. For example if you have a machine that uses geodelx
processor you might reuse the defconfig for it (quite useful specially
at began of a new board development).

> Here's the traceback for the bailout.

Please tell me more about your environment:

 - distro
 - machine

TIA,

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


