Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QA8u8-0005Oa-DR
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Apr 2011 00:51:20 +0200
Received: (qmail invoked by alias); 13 Apr 2011 22:49:05 -0000
Received: from p5B0A1004.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.16.4]
	by mail.gmx.net (mp007) with SMTP; 14 Apr 2011 00:49:05 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+CviJBdPCCystKSihcE4WiChMpo6QczRhpBCn44B
	Ohun4uXGanqZgE
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Apr 2011 00:46:05 +0200
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
MIME-Version: 1.0
Message-Id: <201104140046.05993.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: How to handle a http git repository
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
X-List-Received-Date: Wed, 13 Apr 2011 22:51:20 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I would like to build  u-boot for freescale iMX28 with OE.  There is u-boot 
support available at

http://opensource.freescale.com/pub/scm/imx/uboot-imx.git/

Problem is that it links to the *files* of a git repo not to the repo itself. A 
manual git clone works but I do not find a good approach fetching the repo in OE.

I could do something like

do_fetch () {
	cd ${WORKDIR}
	git clone http://opensource.freescale.com/pub/scm/imx/uboot-imx.git
	cd uboot-imx
	git checkout imx_v2009.08_10.12.01
}

but (one of) the great disadvantage(s) of this hack is fetching on every build.

Can anybody help me with a hint?

Thanks in advance

Andreas


