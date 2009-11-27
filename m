Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1NE4sZ-0000f7-4f
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Nov 2009 18:45:14 +0100
Received: by fxm8 with SMTP id 8so1579018fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Nov 2009 09:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=l8+BiLkI1ILJoHOqgkhXDG32lL9dR/aZG/6nX8snna8=;
	b=wda3AEBCNqICDf3Ge4AIfrmtna4NLyO/EKsVjQ1S+5LNHNZpRudLsuoCn3HZ9J7o7e
	9Xgw4uGATf+daqwq/Z1I0tE9qsYFFc2I4bosNn0Dvf2BXWPrJhxDVsyPuVp+URtCzuHS
	K1c62MUzRspLFTbQQfmy0CTcKHOyIbVLkDcTs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=trGHyY0doc/QgK2wyi2eci/83Jb7V+qeKt9Pyw8aNEagQ/3zEYHx+NxMtz2XgBAqUe
	4KYEsegpokx9XVUtzJjAsacxxVK+0UHhuyWRgvvEzomtWtbWgl+1zE2FOloOmMqpV08u
	1dvMuIp7nXzqIO2JBcndtc5W8eKvG2oOF13o0=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.150.79 with SMTP id m15mr125791hbb.32.1259343819621; Fri, 
	27 Nov 2009 09:43:39 -0800 (PST)
In-Reply-To: <ae9c9a1c0911270911t4569b4b9nd8607178577f3390@mail.gmail.com>
References: <ae9c9a1c0911261845m6a81efcblf372b4409fcc1185@mail.gmail.com>
	<be7a9f3d0911270248r3d2e75ffibe3cc71248d61a9e@mail.gmail.com>
	<ae9c9a1c0911270825u37d60de9h260d9507b3d44eab@mail.gmail.com>
	<be7a9f3d0911270906lc65be18vd9f42786068ecb9b@mail.gmail.com>
	<ae9c9a1c0911270911t4569b4b9nd8607178577f3390@mail.gmail.com>
Date: Fri, 27 Nov 2009 15:43:39 -0200
X-Google-Sender-Auth: 18da37a1de45be6d
Message-ID: <be7a9f3d0911270943q52856cb8q8e87dd984f099459@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Mamona: classes and configs for fist review
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
X-List-Received-Date: Fri, 27 Nov 2009 17:45:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Fri, Nov 27, 2009 at 3:11 PM, Ricardo Salveti de Araujo
<ricardo.salveti@openbossa.org> wrote:
> On Fri, Nov 27, 2009 at 2:06 PM, Otavio Salvador
>> Well but it looks like that to it properly work you need to use one
>> $TMPDIR for each "product" otherwise if this product has a patch (or
>> requires one) and the package is already built it won't get it.
>>
>> Am I missing anything?
>
> Yep, you're right, you need to do that in order to have a clean build
> for each product. At mamona we set that while configuring the
> environment, and in our case we were using a buildbot for each
> machine, doing always a clean build, so it wasn't actually a problem
> for us.

Here we use it at distro and use previous distro in override as well
reducing this diverging problem.

We do it as making a new distro for each product that include the
"base" and changes what is required providing a new distro that has
all base distro as base for settings, versions and like.

In your case it might be:

 mamona.conf
 mamona-vanilla.conf
 mamona-foo.conf

This could avoid the multiple TMPDIR issues. We added here a
DISTRO_MACHINE_ARCH so in case the configuration is specific to a
machine and distro we use it, instead of MACHINE_ARCH allowing for
speedup in compilation and sharing the TMPDIR for those.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


