Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rgen1-0004L6-1I
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Dec 2011 16:54:39 +0100
Received: by eeit10 with SMTP id t10so8755206eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2011 07:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=TSpS9v6Yrmz8rvWBFt9AJ8otOdJT3V6/3jlVhC8Eykk=;
	b=Yb4IqjbmigeLVuY2sg6uW/c/Pfl+X3abYcVL9xRqS5xOuaaxVNgd6jPXwjxaha+3uo
	1fvfPQk5q6saoOE0kKjfcjyCk9MdNpr7/6y8Kx+WBxD/QxzYbOAX6imLfXc0vHRKd8zV
	K9FZgZpfLRzkA6KmRy+cpTdNjSSOQmZEFQPAg=
MIME-Version: 1.0
Received: by 10.205.42.130 with SMTP id ty2mr4395991bkb.55.1325260038745; Fri,
	30 Dec 2011 07:47:18 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.79 with HTTP; Fri, 30 Dec 2011 07:47:18 -0800 (PST)
In-Reply-To: <20111230130026.GH16885@jama.jama.net>
References: <cover.1325248824.git.otavio@ossystems.com.br>
	<06b8fd4ed68ad3e735b54d661f66737048ce9597.1325248824.git.otavio@ossystems.com.br>
	<20111230130026.GH16885@jama.jama.net>
Date: Fri, 30 Dec 2011 13:47:18 -0200
X-Google-Sender-Auth: 4pitvgycGZgT7MXACy1y9EPLiG4
Message-ID: <CAP9ODKredoCdpROP-4xjYMo5RAjj9Ctj_tGmET9ptTXgX4gaZQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH 3/3] task-x11: use xserver-nodm-init-systemd
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
X-List-Received-Date: Fri, 30 Dec 2011 15:54:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 30, 2011 at 11:00, Martin Jansa <martin.jansa@gmail.com> wrote:

> >  # elsa, xserver-nodm-init
> > -VIRTUAL-RUNTIME_graphical_init_manager ?= "xserver-nodm-init"
> > +VIRTUAL-RUNTIME_graphical_init_manager ?= "xserver-nodm-init-systemd"
>
> There are still people not using systemd _only_ and I belive that this
> change drops sysvinit script completely (xserver-nodm-init-systemd
> correctly doesn't rdepend on xserver-nodm-init, because is using only
> xinit and xserver-common provider).
>

I added it because the task-basic depends on systemd-compat-units so it is
clearly forcing systemd use. So anyone using sysv will need to avoid
task-basic et all.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

