Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1PDa4f-0007Jt-9v
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 10:56:09 +0100
Received: from keemun.altell.local (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id 16DF95430;
	Wed,  3 Nov 2010 12:55:13 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: Paul Menzel <paulepanter@users.sourceforge.net>
Date: Wed, 3 Nov 2010 12:55:11 +0300
User-Agent: KMail/1.13.5 (Linux/2.6.34.7-0.3-desktop; KDE/4.4.4; x86_64; ; )
References: <1288774920.3980.29.camel@mattotaupa>
In-Reply-To: <1288774920.3980.29.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201011031255.12511.khimov@altell.ru>
X-Altell-MailScanner-ID: 16DF95430.ADED2
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
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: libprelude: minimal-uclibc: task `install` fails with `sed: can't read /oe/build-minimal-uclibc/minimal-uclibc-dev/work/armv7a-oe-linux-uclibceabi/libprelude-1.0.0-r0/image/usr/lib/perl/5.8.8/auto/Prelude/.packlist: No such file or directory`
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
X-List-Received-Date: Wed, 03 Nov 2010 09:56:10 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A1=D1=80=D0=B5=D0=B4=D0=B0 03 =D0=BD=D0=BE=D1=8F=D0=B1=D1=80=D1=8F 2010=
 12:02:00 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Paul Menzel =D0=BD=D0=B0=D0=BF=D0=
=B8=D1=81=D0=B0=D0=BB:
> testing to build `suricata_1.0.2` (commit f85795) [1] the build fails in
> the task `install` of the dependency `libprelude_1.0.0` (commit 577889)
> [2].
>=20
>         make[1]: Leaving directory
> `/oe/build-minimal-uclibc/minimal-uclibc-dev/work/armv7a-oe-linux-uclibcea
> bi/libprelude-1.0.0-r0/libprelude-1.0.0' sed: can't read
> /oe/build-minimal-uclibc/minimal-uclibc-dev/work/armv7a-oe-linux-uclibceab
> i/libprelude-1.0.0-r0/image/usr/lib/perl/5.8.8/auto/Prelude/.packlist: No
> such file or directory ERROR: Function do_install failed

=46ull logs available somewhere? Looks like it decided not to build perl=20
bindings for some reason, maybe it wants newer perl or something. I'll need=
=20
some time to replicate your build configuration to test it.


