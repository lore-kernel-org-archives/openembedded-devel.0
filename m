Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Nzp23-0008SQ-G4
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 12:32:23 +0200
Received: from keemun.localnet (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id 62E8368265
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Apr 2010 14:28:43 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Thu, 8 Apr 2010 14:28:07 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <1270719003-6168-1-git-send-email-ospite@studenti.unina.it>
In-Reply-To: <1270719003-6168-1-git-send-email-ospite@studenti.unina.it>
MIME-Version: 1.0
Message-Id: <201004081428.07413.khimov@altell.ru>
X-Altell-MailScanner-ID: 62E8368265.A80FD
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/2] Updates to tzcode-native and tzdata
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
X-List-Received-Date: Thu, 08 Apr 2010 10:32:24 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 08 =D0=B0=D0=BF=D1=80=D0=B5=D0=
=BB=D1=8F 2010 13:30:01 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Antonio Ospite =D0=
=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> Here are some updates to tzcode-native and tzdata as tzdata_2010g is no
>  longer available at the default location.

As there is no reliable tzcode/tzdata mirror (there is one for old archives:
ftp://munnari.oz.au/pub/oldtz/ but it only has old versions, not current), =
and=20
as I've touched this too and asked myself what to do with old recipes (some=
 of=20
them are unbuildable for the same reason of missing archives), maybe we sho=
uld=20
adopt some policy wrt tzcode/tzdata.

I don't see any value in old tzdata/tzcode-native recipes as tzcode is only=
=20
used to compile tzdata and compiled tzdata should be compatible with any=20
version of glibc and it's good to have it latest. So I think we should only=
=20
leave latest tzdata version and move that forward whenever someone discover=
s=20
that elsie.nci.nih.gov dropped that version. Same for tzcode.


