Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1NtfK9-0003Qm-SX
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 11:57:39 +0100
Received: from keemun.localnet (unknown [192.168.1.125])
	by mail.altell.local (Postfix) with ESMTPS id F09F268778
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 13:29:22 +0300 (MSK)
From: Roman Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 13:54:09 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.1-desktop; KDE/4.3.5; x86_64; ; )
References: <ac9c93b11001261351n4a1475c3q46d6a441a66f2e5e@mail.gmail.com>
In-Reply-To: <ac9c93b11001261351n4a1475c3q46d6a441a66f2e5e@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201003221354.10121.khimov@altell.ru>
X-Altell-MailScanner-ID: F09F268778.EDB58
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Mon, 22 Mar 2010 10:57:39 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A1=D1=80=D0=B5=D0=B4=D0=B0 27 =D1=8F=D0=BD=D0=B2=D0=B0=D1=80=D1=8F 2010=
 00:51:52 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Frans Meulenbroeks =D0=BD=D0=B0=D0=
=BF=D0=B8=D1=81=D0=B0=D0=BB:
> Perl file Lib/CPAN/FirstTime.pm can enter a dialog for continent which
> never ends.
> This problem is among others sometimes triggered by
> libxml-namespacesupport-perl_1.10.bb
> The patch forces the answer for manual configuration to "no" avoiding
> that we run into this problem

Package build problem can be fixed with proper dependencies (perl checks fo=
r=20
dependencies and only if there's something missing it tries to use CPAN).=20
So, this patch hides the problem. Also, I don't think it's needed for targe=
t=20
Perl, there probably could be some cases when CPAN on target might be of us=
e.

But in general what I don't like about this situation is that when you=20
encounter it while packaging yet another module the build process just hang=
s=20
on do_configure task with 100% CPU utilization and it's unobvious what's go=
ing=20
on until you check the ever growing log file. Then you have to kill bitbake=
=2E=20
All of this sucks.

Also, Perl 5.10 has some different handling for this, at quick glance it=20
autoconfigures by default now and really downloads everything it needs from=
=20
CPAN, which is also bad in our case, since we need to control what installe=
d=20
where.

So, IMHO what could be useful is for our perl-native package to have some k=
ind=20
of bouncer in FirstTime.pm that would die with something like "Error: tried=
 to=20
configure CPAN. Usually it means broken dependencies for packaged modules, =
so=20
go fix your package".


