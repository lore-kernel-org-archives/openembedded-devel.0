Received: from bsmtp3.bon.at ([213.33.87.17] helo=lbmfmo03.bon.at)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pgsellmann@portner-elektronik.at>)
	id 1QCXar-00066N-Ow for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 15:37:21 +0200
Received: from bsmtp.bon.at (unknown [192.168.181.101])
	by lbmfmo03.bon.at (Postfix) with ESMTP id 8AED1CE1DB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 15:34:57 +0200 (CEST)
Received: from aspire.localdomain (unknown [88.116.171.82])
	by bsmtp.bon.at (Postfix) with ESMTP id 9E2CFCDF91
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 15:34:44 +0200 (CEST)
From: Peter Gsellmann <pgsellmann@portner-elektronik.at>
Organization: PORTNER Elektronik
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Apr 2011 15:34:51 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.32.26-175.fc12.x86_64; KDE/4.4.5; x86_64; ;
	)
References: <20110419093343.GB2989@rhein.zuhause.netz>
In-Reply-To: <20110419093343.GB2989@rhein.zuhause.netz>
MIME-Version: 1.0
Message-Id: <201104201534.51856.pgsellmann@portner-elektronik.at>
Subject: Re: orc 0.4.13 is out
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
X-List-Received-Date: Wed, 20 Apr 2011 13:37:21 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Am Dienstag 19 April 2011, 11:33:44 schrieb Henning Heinold:
> Hi,
> 
> hm first email got to wrong mailinglist.
> 
> So here its again:
> 
> Hi,
> 
> As of today orc 0.4.13 is out with the bugs fixed we hit.
> So someone(maybee Paul) can make a new recipe.
> 
> Bye Henning
> 
Sorry, but this version breaks recipe schroedinger-1.0.9 for my build.

schroorc.c: In function '_backup_orc_add2_rshift_add_s16_22_op':
schroorc.c:93:3: error: 'int16_t' undeclared (first use in this function)

full log on http://88.116.171.82/angstrom/files/log.do_compile.12189

neither 0.4.12 nor 0.4.13 works, only 0.4.10

Build Configuration:
BB_VERSION        = "1.10.2"
METADATA_BRANCH   = "master"
METADATA_REVISION = "5fe98c8"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "pcontrol_g20"
DISTRO            = "angstrom"
DISTRO_VERSION    = "v20110420"
TARGET_FPU        = "soft"


Look also into Dirac homepage http://diracvideo.org/
There is a statement about orc 0.4.10
I suspect schroedinger is bound to this specific version.


Peter


