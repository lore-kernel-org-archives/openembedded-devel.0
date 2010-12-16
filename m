Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PTFkq-00044o-Vl
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 16:28:29 +0100
Received: by wyb40 with SMTP id 40so2707856wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 07:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type:content-transfer-encoding;
	bh=gJuyXOUzdm+7t/dhwC6G85CU8ezegO0FHf5gZb0bEho=;
	b=goP4y9FxQojhgq5Zke2ElGGupK1hIQeOUxcFJmqlTVwDsL43tRD7KMdP+rgAeiXZSe
	d/TWXUJCFtEa2/iOuDCmsOjnmRJwmr0iLI96xVCGr6yyWxxJwzsGPaDlvA53aprMBZtu
	IOPV/YQxOcoNH/9Bux0qqbS5BQ0VPJ3qpshjM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=iQ55NXeqGOxM3oS9Qd7wdOSP2rc+d/MDIbyL5Zpv0vUBB6pJ+z1XF89QxF1dsTtyJ1
	Yftp7wcnUiqno9Xzfbr80czlmxK3tVTxCvMW8RthK56gkraYafAKIOshimMOthEUpRzb
	Cphk1IN1JZyq8I/A3LM9eUt8GNSbVhYDueQHU=
Received: by 10.216.165.85 with SMTP id d63mr1855432wel.12.1292513210271; Thu,
	16 Dec 2010 07:26:50 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Thu, 16 Dec 2010 07:26:30 -0800 (PST)
In-Reply-To: <E1PTBwY-0002OI-00.nyrl-mail-ru@f43.mail.ru>
References: <E1PTBwY-0002OI-00.nyrl-mail-ru@f43.mail.ru>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 16 Dec 2010 08:26:30 -0700
X-Google-Sender-Auth: jw7YZp7VZ5TSqYVd1QLWUswRSDk
Message-ID: <AANLkTinL+-LRj_6xyh-9UMkg0Npi4mMLVeSKS-5sybnY@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Local files search in overlay folders first
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
X-List-Received-Date: Thu, 16 Dec 2010 15:28:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2010/12/16 =D0=94=D0=B5=D0=BD=D0=B8=D1=81 =D0=94=D1=8B=D0=B4=D1=8B=D1=87=D0=
=BA=D0=B8=D0=BD <nyrl@mail.ru>:
> I am using OE with my own overlay and I want to adjust linux kernel setti=
ngs with minimal efforts. I have the following structure:
> oe/
> =C2=A0recipes/
> =C2=A0 =C2=A0linux/
> =C2=A0 =C2=A0 =C2=A0linux-davinci.inc
> =C2=A0 =C2=A0 =C2=A0linux-davinci_git.bb
>
> =C2=A0 =C2=A0 =C2=A0<others-includes>
> =C2=A0 =C2=A0 =C2=A0linux-davinci/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0<patches>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0omapl137/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0defconfig
> overlay/
> =C2=A0recipes/
> BBPATH=3D"<topdir>/overlay:<topdir>/oe"
>
> What I generally want is to simply replace defconfig with my own without =
changing recipe and touching other patches. I consider that having this str=
ucture could be fine for me:
> overlay/
> =C2=A0recipes/
> =C2=A0 =C2=A0linux/
> =C2=A0 =C2=A0 =C2=A0linux-davinci/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0omapl137/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0defconfig =C2=A0 =C2=A0 (modified)
>
> It does not work for release-2010.12 of OE and it does not seems to work =
in master either.
>
>
> I believe that changing FILESPATHBASE so that it will look in "recipes/li=
nux/linux-davinci/omapl137" subfolder for each entry in BBPATH in defined o=
rder would solve my problem. For given example having FILESPATHBASE defines=
 as "<topdir>/overlay/recipes/linux:<topdir>/oe/recipes/linux" would be eno=
ugh.

Yes, that's correct, and is a common approach among those utilizing
collections/layers, but I don't believe it's in OE in any form.  A
.conf for the user/distro to include would likely be a bit cleaner
than a bbclass.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


