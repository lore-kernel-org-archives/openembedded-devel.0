Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NKUhQ-0003V2-DA
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Dec 2009 11:32:15 +0100
Received: by yxe5 with SMTP id 5so3627821yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2009 02:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=r0sK4z4+QYrQUv8ko0qgMFW6zk+sfEygV7iluGyEb3Y=;
	b=U/sOBbVVoYPk82bTMyRQ/Fln5EDZcMaFOu1gnZ2+MLy9MWBehUVDRHS+8u97VkbfSH
	qscMKvPoNtq5H79K7vodVMtMhk9SbUnYlSKoAOUyzZ+hJWzDEcn8V+GUfNgM7uHdLDyI
	e+RV50RJNLrWwDrkELvrkzUaxrNidpeTRRggE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=xnMz/wPFdJ64HDyDFW63+1Iq8mIXtTgw/1dtPhZJmW5G3DmPBPgoYryWbHedk2yjl8
	/5NgqirUP+hJOUQNVoIEvCspUHhye/l5OBh7Yw5ORFLT4fH+hnp5+eKdearWzDUKinp3
	pfc3d69RbGx6CtWbE0dk/y8PjwVNThM7Z5Lk0=
MIME-Version: 1.0
Received: by 10.101.181.15 with SMTP id i15mr9212007anp.90.1260873022441; Tue, 
	15 Dec 2009 02:30:22 -0800 (PST)
In-Reply-To: <ac9c93b10912140401o52fa183k90819ba5fdec4b34@mail.gmail.com>
References: <ac9c93b10912140401o52fa183k90819ba5fdec4b34@mail.gmail.com>
Date: Tue, 15 Dec 2009 11:30:22 +0100
Message-ID: <ac9c93b10912150230i79083a9s65f5a7fd4376c5a7@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: bitbake -c menuconfig virtual/kernel and ncurses
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
X-List-Received-Date: Tue, 15 Dec 2009 10:32:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

2009/12/14 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> Not sure how to fix this, but I just bumped into the following:
>
> I did a bitbake -c menuconfig virtual/kernel.
> This launched an xterm which exited without me giving an opportunity
> to change settings.
> Still bitbake reported success.
>
> Cause was that this system didn't have ncurses-dev installed yet.
>
> No idea on how to fix this in a proper way.
>
> Frans
>
Addition: there is also a dependency on X11 as it wants to launch an xterm.
guess this is the only thing in oe where we rely on x11. Perhaps
better make this happen in the terminal the command is invoked (or
perhaps only if xterm is not there).

Frans


