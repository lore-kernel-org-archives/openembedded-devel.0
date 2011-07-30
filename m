Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qn7UJ-0008I6-N7
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jul 2011 13:13:47 +0200
Received: (qmail invoked by alias); 30 Jul 2011 11:09:30 -0000
Received: from p4FDF1F3D.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.31.61]
	by mail.gmx.net (mp071) with SMTP; 30 Jul 2011 13:09:30 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+tVJtE0eitkH5Ca+p3s/av1hsNZW7gziZZ3FjvnA
	iB0rtBje/6a941
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org,
 tom_rini@mentor.com
Date: Sat, 30 Jul 2011 13:12:13 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <201107301242.41215.schnitzeltony@gmx.de>
In-Reply-To: <201107301242.41215.schnitzeltony@gmx.de>
MIME-Version: 1.0
Message-Id: <201107301312.14146.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
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
X-List-Received-Date: Sat, 30 Jul 2011 11:13:47 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Saturday, July 30, 2011 12:42:40 PM Andreas Mueller wrote:
> Hi guys,
> 
> I tried to build an image based on gumstix overo-2011 branch [1] but the
> sources for fakeroot 1.14.5 can not be downloaded.
> 
> ERROR: fakeroot-native-1.14.5:
> ftp://ftp.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.14.5.orig.tar.b
> z2 cannot check archive integrity
> 
> In [2] I saw that it is it is not there ( anymore ? ).
> 
> As far as I can see we have the same issue in mainline oe
> 2011.03-maintenance.
> 
> [1] http://gitorious.org/gumstix-oe/mainline/commits/overo-2011.03
> [2] ftp://ftp.debian.org/debian/pool/main/f/fakeroot/
> 
I don't know how to create the 'official' pull request bur I think we need to pull 

commit 085dc5e99abf98772bfb44f3f25320418d500740
Author: Florian Boor <florian.boor@kernelconcepts.de>
Date:   Thu May 5 11:28:09 2011 +0200

    fakeroot: Move from not fetchable 1.14.5 to 1.15.1
    
    Fakeroot 1.14.5 was not fetchable any more. Updating to 1.15.1.
    
    Test environment:
        BB_VERSION        = "1.10.2"
        METADATA_BRANCH   = "org.openembedded.dev"
        TARGET_ARCH       = "arm"
        TARGET_OS         = "linux-gnueabi"
        MACHINE           = "mainstone"
        DISTRO            = "minimal"
        DISTRO_VERSION    = "dev-snapshot-20110504"
        TARGET_FPU        = "soft"
    
    Signed-off-by: Florian Boor <florian.boor@kernelconcepts.de>

into 2011.03-maintenance.

Andreas


