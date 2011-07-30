Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QnHAw-0003p4-Uz
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jul 2011 23:34:27 +0200
Received: by pzk1 with SMTP id 1so8664553pzk.16
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jul 2011 14:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:organization:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=ridUNAcUBALNFZRaLb/MUizauS7SJo0bvp32rMNqv/A=;
	b=BWBjgSdLUuq/aFPDlIZ35q/XXlcyrm88oIBmrAiwpnH1n7bRnEJ9Dtpu5aJV5M6yeq
	98ktZv+LGGJqThDINFGFUxhmcJrcb0RMK6aLX36oy7dS68UYV/3IdWXK53spY9gSOc3V
	pBs3I7aN6jD/kPGcoqnKsLxUPEclsKZCqc1VE=
Received: by 10.142.50.4 with SMTP id x4mr1685782wfx.426.1312061407294;
	Sat, 30 Jul 2011 14:30:07 -0700 (PDT)
Received: from perseus.localnet (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id s6sm2039912wff.15.2011.07.30.14.30.06
	(version=SSLv3 cipher=OTHER); Sat, 30 Jul 2011 14:30:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Jul 2011 14:30:04 -0700
Message-ID: <2410415.MY7JojhZIT@perseus>
Organization: Sakrah
User-Agent: KMail/4.7.0  (Linux/2.6.38-10-generic; KDE/4.7.0; i686; ; )
In-Reply-To: <4E341FDD.7020500@mentor.com>
References: <201107301242.41215.schnitzeltony@gmx.de>
	<201107301312.14146.schnitzeltony@gmx.de>
	<4E341FDD.7020500@mentor.com>
MIME-Version: 1.0
Subject: Re: fakeroot 1.14.5 source is missing
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
X-List-Received-Date: Sat, 30 Jul 2011 21:34:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, July 30, 2011 08:14:37 AM Tom Rini wrote:
> On 07/30/2011 04:12 AM, Andreas Mueller wrote:
> > On Saturday, July 30, 2011 12:42:40 PM Andreas Mueller wrote:
> >> Hi guys,
> >> 
> >> I tried to build an image based on gumstix overo-2011 branch [1] but
> >> the
> >> sources for fakeroot 1.14.5 can not be downloaded.
> >> 
> >> ERROR: fakeroot-native-1.14.5:
> >> ftp://ftp.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.14.5.orig.
> >> tar.b z2 cannot check archive integrity
> >> 
> >> In [2] I saw that it is it is not there ( anymore ? ).
> >> 
> >> As far as I can see we have the same issue in mainline oe
> >> 2011.03-maintenance.
> >> 
> >> [1] http://gitorious.org/gumstix-oe/mainline/commits/overo-2011.03
> >> [2] ftp://ftp.debian.org/debian/pool/main/f/fakeroot/
> > 
> > I don't know how to create the 'official' pull request bur I think we
> > need to pull
> > 
> > commit 085dc5e99abf98772bfb44f3f25320418d500740
> > Author: Florian Boor <florian.boor@kernelconcepts.de>
> > Date:   Thu May 5 11:28:09 2011 +0200
> > 
> >     fakeroot: Move from not fetchable 1.14.5 to 1.15.1
> >     
> >     Fakeroot 1.14.5 was not fetchable any more. Updating to 1.15.1.
> >     
> >     Test environment:
> >         BB_VERSION        = "1.10.2"
> >         METADATA_BRANCH   = "org.openembedded.dev"
> >         TARGET_ARCH       = "arm"
> >         TARGET_OS         = "linux-gnueabi"
> >         MACHINE           = "mainstone"
> >         DISTRO            = "minimal"
> >         DISTRO_VERSION    = "dev-snapshot-20110504"
> >         TARGET_FPU        = "soft"
> >     
> >     Signed-off-by: Florian Boor <florian.boor@kernelconcepts.de>
> > 
> > into 2011.03-maintenance.
> 
> 2011.03-maintenance expects you to have a source mirror available as
> there are a number of cases like this.  

this is stashed on source.openembedded.org now



