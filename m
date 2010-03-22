Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NtfVS-0002NY-8e
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 12:09:19 +0100
Received: by gwb10 with SMTP id 10so658073gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 04:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=+aGZhGm2/wb03ij+jWB+21IND+K7IhEPh0RqPUGPsc0=;
	b=pZeohdOmHNVZHeGY1dVjd2YECWa/ciQDmluU2O8+3DaS6oFtJ4/806j8LTpC6FQ3/L
	bjdYTh6X9HMg59eiYhpeulJ/GYYn4cSHoHPWTaV4WXdIYUfx+juL3nu/pJCi5mRlaZYi
	WYaFi6c5bc8soHYQSvr+XtQl4Rf8hCOLXwnCU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=X8GH+8XIDPtgH9vAZunVbsEQHZldXMJ6EH26B+Zxrs1bP9soDaNyKxUJbaIAn7cHRT
	VAPA2MNH+m0OvJaI2uASUKSJKExwy0Vme7euVXs79CmVaU1YO7//g57IgEsASvDzrvNQ
	UdN8VyDfPnIuS7MNscs81iR+yM+O2sYNvkl0I=
MIME-Version: 1.0
Received: by 10.101.42.12 with SMTP id u12mr16012833anj.56.1269255962303; Mon, 
	22 Mar 2010 04:06:02 -0700 (PDT)
In-Reply-To: <201003221354.10121.khimov@altell.ru>
References: <ac9c93b11001261351n4a1475c3q46d6a441a66f2e5e@mail.gmail.com>
	<201003221354.10121.khimov@altell.ru>
Date: Mon, 22 Mar 2010 12:06:02 +0100
Message-ID: <ac9c93b11003220406r666ef2a3v9059aadbe27a47cd@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: small perl initialisation patch
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
X-List-Received-Date: Mon, 22 Mar 2010 11:09:19 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

2010/3/22 Roman Khimov <khimov@altell.ru>:
> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F3=D2=C5=C4=C1 27 =D1=CE=D7=C1=D2=
=D1 2010 00:51:52 =C1=D7=D4=CF=D2 Frans Meulenbroeks =CE=C1=D0=C9=D3=C1=CC:
>> Perl file Lib/CPAN/FirstTime.pm can enter a dialog for continent which
>> never ends.
>> This problem is among others sometimes triggered by
>> libxml-namespacesupport-perl_1.10.bb
>> The patch forces the answer for manual configuration to "no" avoiding
>> that we run into this problem
>
> Package build problem can be fixed with proper dependencies (perl checks =
for
> dependencies and only if there's something missing it tries to use CPAN).
> So, this patch hides the problem. Also, I don't think it's needed for tar=
get
> Perl, there probably could be some cases when CPAN on target might be of =
use.
>
> But in general what I don't like about this situation is that when you
> encounter it while packaging yet another module the build process just ha=
ngs
> on do_configure task with 100% CPU utilization and it's unobvious what's =
going
> on until you check the ever growing log file. Then you have to kill bitba=
ke.
> All of this sucks.
>
> Also, Perl 5.10 has some different handling for this, at quick glance it
> autoconfigures by default now and really downloads everything it needs fr=
om
> CPAN, which is also bad in our case, since we need to control what instal=
led
> where.
>
> So, IMHO what could be useful is for our perl-native package to have some=
 kind
> of bouncer in FirstTime.pm that would die with something like "Error: tri=
ed to
> configure CPAN. Usually it means broken dependencies for packaged modules=
, so
> go fix your package".

Agree this is a better way to handle this problem.
However, I'm not sure if I have the perl skills to fix this, and I am
definitely lacking the time right now.

Frans


