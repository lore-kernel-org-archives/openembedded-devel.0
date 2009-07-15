Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1MR5vL-0004Rq-Cd
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jul 2009 16:57:35 +0200
Received: from [UNAVAILABLE] ([80.246.246.162] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1MR5iI-000AYO-HK
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jul 2009 18:44:08 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jul 2009 18:43:48 +0400
User-Agent: KMail/1.11.4 (Linux/2.6.29; KDE/4.2.4; x86_64; ; )
References: <1247662361-20485-1-git-send-email-khimov@altell.ru>
	<1247662361-20485-2-git-send-email-khimov@altell.ru>
	<1247666943.6648.285.camel@mill.internal.reciva.com>
In-Reply-To: <1247666943.6648.285.camel@mill.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <200907151843.49208.khimov@altell.ru>
X-SpamTest-Envelope-From: khimov@altell.ru
X-SpamTest-Group-ID: 00000000
X-SpamTest-Info: Profiles 9036 [Jul 15 2009]
X-SpamTest-Method: none
X-SpamTest-Rate: 0
X-SpamTest-Status: Not detected
X-SpamTest-Status-Extended: not_detected
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0284], KAS30/Release
Subject: Re: [PATCH 2/2] icecc: introduce ICECC_FALLBACK_PARALLEL
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
X-List-Received-Date: Wed, 15 Jul 2009 14:57:35 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On =D0=A1=D1=80=D0=B5=D0=B4=D0=B0 15 =D0=B8=D1=8E=D0=BB=D1=8F 2009 18:09:03=
 Phil Blundell wrote:
> On Wed, 2009-07-15 at 16:52 +0400, Roman I Khimov wrote:
> > icecc-blacklisted packages currently built not only without icecc
> > environment set but also without any parallel options enabled. The
> > original intention was not to kill the build machine, I guess, since
> > having a good icecc cluster it's easy to set '-j16' or '-j32' or whatev=
er
> > else which could do so. However as the toolchain packages are blacklist=
ed
> > for icecc they're becoming a bottleneck in the build process, while they
> > can be built with local-machine parallelism.
> >
> > So, in order to solve it, introducing ICECC_FALLBACK_PARALLEL option.
> > It's simply used as PARALLEL_MAKE for icecc-blacklisted packages.
>
> Maybe it would be better to do this the other way around: have an
> ICECC_PARALLEL_MAKE which is used instead of PARALLEL_MAKE when icecc is
> selected, and make this be the one that you set to "-j1024".  Then, if
> icecc is disabled for any reason (blacklisted package, or just because
> you stop inheriting the class) it would go back to using the regular
> PARALLEL_MAKE setting.

Yep, thought of that, should be a better solution, but I have a doubt about=
=20
recipes intentionally setting PARALLEL_MAKE to nothing (thus avoiding paral=
lel=20
build bugs in package). If we'll forcibly set PARALLEL_MAKE to=20
ICECC_PARALLEL_MAKE in icecc.bbclass, it might break such packages.


