Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1MeUEg-00008h-TS
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Aug 2009 15:32:55 +0200
Received: from [UNAVAILABLE] ([80.246.246.162] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1MeTxo-00031i-3T
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Aug 2009 17:15:28 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Aug 2009 17:15:26 +0400
User-Agent: KMail/1.12.0 (Linux/2.6.30-1-amd64; KDE/4.3.0; x86_64; ; )
References: <1241617115-21929-1-git-send-email-msmith@cbnco.com>
	<200908210825.32355.khimov@altell.ru>
	<Pine.LNX.4.64.0908210701430.3621@juice.ott.cti.com>
In-Reply-To: <Pine.LNX.4.64.0908210701430.3621@juice.ott.cti.com>
MIME-Version: 1.0
Message-Id: <200908211715.26217.khimov@altell.ru>
X-SpamTest-Envelope-From: khimov@altell.ru
X-SpamTest-Group-ID: 00000000
X-SpamTest-Info: Profiles 9431 [Aug 21 2009]
X-SpamTest-Method: none
X-SpamTest-Rate: 0
X-SpamTest-Status: Not detected
X-SpamTest-Status-Extended: not_detected
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0284], KAS30/Release
Subject: Re: [PATCH] kernel.bbclass: stage more include files for x86 in	2.6.27+
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
X-List-Received-Date: Fri, 21 Aug 2009 13:32:55 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=9F=D1=8F=D1=82=D0=BD=D0=B8=D1=86=D0=B0 21 =D0=B0=D0=B2=D0=B3=D1=83=D1=
=81=D1=82=D0=B0 2009 16:47:20 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Michael Smith =
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> On Fri, 21 Aug 2009, Roman I Khimov wrote:
> >> OK to commit?
> >>
> >>> -	rm -f $ASMDIR ${STAGING_KERNEL_DIR}/include/asm
> >>> +
> >>> +	rm -f ${STAGING_KERNEL_DIR}/include/asm
> >
> > Not sure why this is needed
>
> $ASMDIR is a directory name like "asm-x86" meant to be relative to
> "include". It doesn't exist under the work directory, so "rm -f $ASMDIR"
> tries to remove a file that isn't there. Doesn't hurt anything, but I had
> to stare at it for a bit, so I took it out. :)
>
> > though you copy to asm-x86 and mine was to $ASMDIR:
> > http://lists.linuxtogo.org/pipermail/openembedded-devel/2009-June/01194=
5.
> >html
>
> Yeah, I think in your patch you did:
>
> cp -fR arch/x86/include/asm/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
>
> But on another platform, let's say arm, wouldn't that copy
> arch/x86/include/* to include/asm-arm? The x86 files should only go to
> asm-x86.

OK.

Acked-by: Roman I Khimov <khimov@altell.ru>


