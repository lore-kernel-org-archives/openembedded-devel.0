Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1MRPFj-0000C2-Pb
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Jul 2009 13:35:55 +0200
Received: from [UNAVAILABLE] ([80.246.246.162] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1MRP2d-000OYW-Co
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Jul 2009 15:22:23 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jul 2009 15:22:14 +0400
User-Agent: KMail/1.11.4 (Linux/2.6.29; KDE/4.2.4; x86_64; ; )
References: <1247662361-20485-1-git-send-email-khimov@altell.ru>
	<20090715171503.GA15057@gmail.com>
In-Reply-To: <20090715171503.GA15057@gmail.com>
MIME-Version: 1.0
Message-Id: <200907161522.15171.khimov@altell.ru>
X-SpamTest-Envelope-From: khimov@altell.ru
X-SpamTest-Group-ID: 00000000
X-SpamTest-Info: Profiles 9050 [Jul 16 2009]
X-SpamTest-Method: none
X-SpamTest-Rate: 0
X-SpamTest-Status: Not detected
X-SpamTest-Status-Extended: not_detected
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0284], KAS30/Release
Subject: Re: [PATCH 1/2] icecc: remove bb.errors on un-built compilers
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
X-List-Received-Date: Thu, 16 Jul 2009 11:35:56 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On =D0=A1=D1=80=D0=B5=D0=B4=D0=B0 15 =D0=B8=D1=8E=D0=BB=D1=8F 2009 21:15:30=
 Khem Raj wrote:
> On (15/07/09 16:52), Roman I Khimov wrote:
> > Building things with icecc and BB_NUMBER_THREADS more then 1 you could
> > see a lot of messages:
> >
> > ERROR: no cross compiler built yet?
> >
> > before gcc-cross would be properly built. There is technically nothing
> > wrong, cross compiler is not there yet and it's not needed when bitbake
> > does fetch-unpack-patch and other things to prepare package build. But =
it
> > makes people uncomfortable.
> >
> > We can safely kill this messages.
>
> provided that this part of code is not executed again when cross
> compiler is really needed because then we will not get the warning
> where we should get it legitimately.

It's needed on configure-compile stages as usual, so if there'll be no cros=
s-
compiler at this stages you'll notice it anyway, I guess.


