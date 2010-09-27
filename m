Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1P0Exh-0000vN-83
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 16:45:51 +0200
Received: from keemun.localnet (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id A4DAE53ED
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Sep 2010 18:45:19 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Sep 2010 18:45:18 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <AANLkTik0gS3dcnz++jr9pF-fh1ATt-f46hzGNHfbV+VU@mail.gmail.com>
In-Reply-To: <AANLkTik0gS3dcnz++jr9pF-fh1ATt-f46hzGNHfbV+VU@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201009271845.19106.khimov@altell.ru>
X-Altell-MailScanner-ID: A4DAE53ED.69438
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
Subject: Re: multiple kernels and images
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
X-List-Received-Date: Mon, 27 Sep 2010 14:45:51 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=9F=D0=BE=D0=BD=D0=B5=D0=B4=D0=B5=D0=BB=D1=8C=D0=BD=D0=B8=D0=BA 27 =D1=
=81=D0=B5=D0=BD=D1=82=D1=8F=D0=B1=D1=80=D1=8F 2010 18:15:51 =D0=B0=D0=B2=D1=
=82=D0=BE=D1=80 Frans Meulenbroeks=20
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> So far so good, but how do I now get the right kernel in my sd card image.
> Basically both recipes create a package kernel, so adding kernel to
> the image does not work.
> Anyone an idea on how to fix this?

Once upon a time, when I needed similar functionaly, I've had a patch that=
=20
splitted kernel.bbclass to kernel_base.bbclass and kernel.bbclass where=20
kernel_base.bbclass did compiling and packaging but not renamed packages to=
=20
"kernel-..." (producing "linux-recipe-name-..." packages) and kernel.bbclas=
s=20
behaved exactly the same way as it is today. So for "additional" kernels yo=
u=20
just required "kernel_base" and installed "linux-recipe-name-..." packages=
=20
while for the "main" kernel everything worked as before.

Unfortunately, that was about year and a half ago so even if I dig into my =
git=20
repos and find the patches they won't work with 100% guarantee, too many=20
changes in kernel.bbclass. I think it would be easier to reimplement that.


