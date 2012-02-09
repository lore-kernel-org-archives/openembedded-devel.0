Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RvTXe-0001j7-6x
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Feb 2012 13:56:02 +0100
Received: by eaal10 with SMTP id l10so457422eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2012 04:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=zzvRrwka0dlDzfadN3YKXxB9194focrH/qXt2XcNw6E=;
	b=Y6/pAWWuPkyHbkg6ihNscUBKSTI1IftRz9He2qxIFC5AUa9CFCi6iXqcS7KcM8myCn
	dZEcAXj79JfXzkKsC0eJVyuQT7BCtv4bi3uAdIE8uBPQWXsjCrvGV7zEnosRNa1HIKFp
	Ha9GDVeadAjzBFTpCZWz5SH+uNBPxqRO48KNc=
MIME-Version: 1.0
Received: by 10.213.26.8 with SMTP id b8mr3503606ebc.88.1328791677699; Thu, 09
	Feb 2012 04:47:57 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Thu, 9 Feb 2012 04:47:57 -0800 (PST)
In-Reply-To: <4F33BF11.4010009@opendreambox.org>
References: <4F2A97B7.2080709@opendreambox.org>
	<CAP9ODKqah-6Y6hp-beD0hUi=-r6VXJ02QD=puXFFYW2Hq8FACw@mail.gmail.com>
	<4F32CE7B.8050109@opendreambox.org>
	<CAP9ODKr+bmWJX8tjesyTvP8_4pEgFDXjOA+s2ZbSq5U+=PC4rw@mail.gmail.com>
	<4F331951.2010701@opendreambox.org>
	<4F33BF11.4010009@opendreambox.org>
Date: Thu, 9 Feb 2012 10:47:57 -0200
X-Google-Sender-Auth: BfK3oVUNIGHDSIxPzpYLTK3f6s8
Message-ID: <CAP9ODKpNCgBoUwtW6geXOj1wNBCd5ocu39S1p3wNyaq08n875g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH] giflib: don't link against libx11, don't depend on libsm
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
X-List-Received-Date: Thu, 09 Feb 2012 12:56:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 9, 2012 at 10:41, Andreas Oberritter <obi@opendreambox.org>wrote:

> 1.) Pass --disable-x11 unconditionally like Debian/Ubuntu
> 2.) Add virtual/libx11 to DEPENDS, if x11 is defined in
> DISTRO_FEATURES, and add --enable/diable-x11 to EXTRA_OECONF
>
> Because the current recipe didn't depend on libX11 and no one
> complained about it, I question the usefulness of linking giflib
> against x11. Therefore I vote for option 1 (see patch below).
>

I voce for 1 too.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

