Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PJ4Qu-0003oT-T8
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 14:21:49 +0100
Received: by iwn9 with SMTP id 9so613743iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Nov 2010 05:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=FpzzmrvOwX4ZCcrKawSNDVEBTgV8Y0geFL20u3wpQuE=;
	b=vZNH1mhz8j0yMAZNXBnVavjQDK93+7ppQ8f2fvBOq9RXE5ruRPDFoADIFj0uelxSTY
	S+bvtKGQ8cTvWlid+TQKVo8PLOFlCsYMm2GORlriup7+qvNzLBL1Zecnbujuia6UIumd
	xCLnxQYyhtGmQBc9JVRT4ouTT419Oow0KI7lE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=nAy2IqAdT97N9atNDoXlITf7CEyqwKuO7q3koVsuZHZ82IWwQJJmftFUredK6q1vj2
	MtixI+xYt+ufGM0olTAqxNyX108zoYGaOAtxiVYuHuedsBKbrUQ3h2AbdGrR8zo/qF6K
	PBCLjktlHoKSDT9AjsoPXugHFcS3Z7IRcfV30=
MIME-Version: 1.0
Received: by 10.231.17.203 with SMTP id t11mr614368iba.1.1290086439761; Thu,
	18 Nov 2010 05:20:39 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Thu, 18 Nov 2010 05:20:39 -0800 (PST)
In-Reply-To: <19BBD4D8-491F-4A40-A4A9-DCE72A597E89@gmail.com>
References: <19BBD4D8-491F-4A40-A4A9-DCE72A597E89@gmail.com>
Date: Thu, 18 Nov 2010 14:20:39 +0100
Message-ID: <AANLkTi=QmKvSD3QoOt6koF1v16vLaL7hH_o197i_udS-@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: David Abdurachmanov <david.abdurachmanov@gmail.com>, 
	openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: PHP 5.2.13 on org.openembedded.dev fails to build
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
X-List-Received-Date: Thu, 18 Nov 2010 13:21:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/18 David Abdurachmanov <david.abdurachmanov@gmail.com>:
> Hi,
>
> I was looking into commit and it looks like you are maintainer of PHP rec=
ipe for some time. I am trying to work with org.openembedded version to bui=
ld apache2/modphp. I left that, modphp wasn't easy to compile and at the en=
d apache2 child processes segfauls while running with libphp5.so. So I deci=
ded to go with lighty and php via fastcgi. The problem is that for about a =
month I can not build php it just can't locate libs.
>
> I am not the only one with this problem, there is a discussion on Gumstix=
 mailing-list: http://old.nabble.com/PHP-Fails-to-build-td30110142.html
>
> I have tested multiple versions of org.oe.dev and pretty much always is n=
ot working right and requires some fixing. Any input of what might be wrong=
 in trunk version for quite some time? Missing or wrong environment variabl=
es, pkg_config not working or maybe PC files not installed, etc?
>
> P.S. In few hours I am gonna fill bug report.
>
> Cheers,
> david

Hi David,

When asking about OE issues please also sent to the mailing list.
And when reporting problems please specify:
host os, distro used, target machine, target recipe (got the last 2
from your mail not the first 2).

Wrt your php issues and your mail

I don't feel the maintainer of the php recipe.
I just happened to hack it a little bit because it didn't do what I wanted.

I've also trying to build php with apache but I gave up as well. Too
much issues.

As a test I just tried to build php locally. This *almost* works.
The issue is that php has released new versions, so the url in the
php.inc file is not correct any more.
After fixing that locally, php builds as expected on my system (both
the regular and -native recipe)

Wrt the crypto error:
what is the result of
ls -l sysroots/*/usr/lib/libcrypto.so ?
I expect that you have a file there, if not there is a missing depends.

And do you have files
/usr/lib/libcrypt.so*
on your system? If not, I guess the configure script still looks for a
host file.

BTW it is easier to debug this online. you can try to catch me online
on irc (#oe) (preferably in the evening european time)
it would be much easier to diagnose the problem interactively.

Frans


