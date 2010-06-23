Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1ORMjQ-0001lT-1J
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 11:58:56 +0200
Received: by bwz14 with SMTP id 14so2086912bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 02:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=j802ZcAVGiMw2iIz7cGJWNlwlH38CKC9FrtUWwTTq2c=;
	b=rd7jOmusmwPIgNO0cuCoLuPgWb2Nx/XkSMZmG4r2WOWqXRVulFQ7bgftkaPZ+P6g7J
	9kk9XtcjmiuhWWzVManuWr6kloOYawBUPbxbZhSpY3aaJF7TcRAa8PVpteyl3WNv012O
	8d7rKhsZQ4kQGHTL8WnT9EOUkiS6McmwIY4AI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=NRhgE2ZNQ/o+xEJf01WTHAaSkHw9cm8alQXbSV0ALtyp++tnbAy7cO21DaQYk5JLK1
	LXgKRSqcjtyyXchzR6cAqVuJPGTriBClCe0eQom5ibnzmofLhVxX5689uR/3PdpZrB9h
	9sKmih6fPFHm58HqQjYsIgET5x78AA68j3oro=
MIME-Version: 1.0
Received: by 10.204.83.82 with SMTP id e18mr5309821bkl.138.1277286861694; Wed, 
	23 Jun 2010 02:54:21 -0700 (PDT)
Received: by 10.204.77.132 with HTTP; Wed, 23 Jun 2010 02:54:21 -0700 (PDT)
In-Reply-To: <20100623103600.77c5a6d9@xora-desktop.xora.org.uk>
References: <AANLkTimD-uu-SpcUvHIMWE1cQ5wCSyisHRwyFfasdX90@mail.gmail.com>
	<hvl1uc$bol$1@dough.gmane.org>
	<AANLkTil2-UJTgWzmXJI6eESvqjTowq0y_kZTpm0zNAN8@mail.gmail.com>
	<AANLkTikz8wGLZKz6Z-o4YpC8C62P-whW_znpSKlV8yEx@mail.gmail.com>
	<hvsjso$8bh$1@dough.gmane.org>
	<20100623103600.77c5a6d9@xora-desktop.xora.org.uk>
Date: Wed, 23 Jun 2010 11:54:21 +0200
Message-ID: <AANLkTimwSjUiEgwAU-l66u9Da5ckM4p2yD4naQq3g_ZZ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: introducing a new architecture/machine; policy ? (and a 	question)
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
X-List-Received-Date: Wed, 23 Jun 2010 09:58:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/6/23 Graeme Gregory <dp@xora.org.uk>:
>> >> Also I don't feel empowered to make changes in distribution
>> >> specific files.
>
> Why not, chances are Angstrom maintainers would be quite happy for you
> to patch angstrom*.conf if you ask us.
>
> Graeme

distribution != angstrom
There are more distributions out there.

The root cause of the problem is that a distro can specify a version
of a tool (let's take gcc as an example) that is not supported by a
specific hardware architecture.
I'd say what we really need is a way to allow a processor architecture
to specify which versions of binutls and gcc and friends are supported
for that hw architecture.
Mind you I talk about processor architectures, not boards.
(actually I guess this extends to every package that contains assembly
files or inline assembly)

The problem became more visible with nios2 as this is an architecture
that is not (yet) supported by gcc. Patches for now exist only for
4.1.2.

Frans.


