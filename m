Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Oe150-0001Iy-6M
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 09:29:45 +0200
Received: from keemun.localnet (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id D14BC53EE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 11:33:20 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Jul 2010 11:28:37 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <4C4F6F91.8000902@mentor.com>
In-Reply-To: <4C4F6F91.8000902@mentor.com>
MIME-Version: 1.0
Message-Id: <201007281128.37653.khimov@altell.ru>
X-Altell-MailScanner-ID: D14BC53EE.95C6D
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Disable packaged-staging for perl-native
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
X-List-Received-Date: Wed, 28 Jul 2010 07:29:45 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A1=D1=80=D0=B5=D0=B4=D0=B0 28 =D0=B8=D1=8E=D0=BB=D1=8F 2010 03:45:21 =
=D0=B0=D0=B2=D1=82=D0=BE=D1=80 Tom Rini =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=
=B0=D0=BB:
> I'd like to disable packaged-staging for perl-native.  The problem here
> comes from a number of things that happen.  Some of these can only
> happen in combination with packaged-staging but others I believe could
> happen today.  The problem itself is that if we have perl-native
> available from packaged-staging it can suddenly exist very early.  What
> this means in practical terms is that now we're trying to generate say
> pod2man.pl from pod2man.pl.in and @perl@ is expanded to something beyond
> the "#!" mechanic length limit and recipes start failing to build
> (fixable by changing pod2man.pl.in to use /usr/bin/env perl (and if it
> had a -w changing to Use warnings: or whatever the perl is)).

So the problem really is that we have perl in /very-very-long-path/perl? IM=
O=20
/usr/bin/env change would be better in that case.=20


