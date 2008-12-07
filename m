Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1L99B3-0006c1-Mw
	for openembedded-devel@openembedded.org; Sun, 07 Dec 2008 03:15:22 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20081207021134.LJLK2342.fed1rmmtao102.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Sat, 6 Dec 2008 21:11:34 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id o2BZ1a00B1E665w042BZgT; Sat, 06 Dec 2008 21:11:33 -0500
X-Authority-Analysis: v=1.0 c=1 a=jD-By_5hrAxPVDh1QPoA:9
	a=kjaqCOwEaIpP3G_qaof3lgLwH2sA:4 a=b8hG5vVbyAkA:10
X-CM-Score: 0.00
Date: Sat, 6 Dec 2008 19:11:44 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20081207021144.GL16628@smtp.west.cox.net>
MIME-Version: 1.0
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Broken kernel recipes
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
X-List-Received-Date: Sun, 07 Dec 2008 02:15:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

As part of testing meta-toolchain-sbox builds on different arches, I
found that sbrsh, on ARM, brings in both the 2.6 kernel for the MACHINE
in question, as well as a 2.4 kernel.  In the case of the 2.4 kernel, it
first picks up poodle-kernel-2.4-embedix.bb on nokia800, which doesn't
work as it wants gcc-2.95, which doesn't exist.  Can I move the
following support to packages/obsolete/linux/ ?
corgi-kernel-2.4-embedix.bb
husky-kernel-2.4-embedix.bb
openzaurus-pxa_2.4.18-rmk7-pxa3-embedix20031107.bb
poodle255-kernel-2.4-embedix.bb
poodle-kernel-2.4-embedix.bb
shepherd-kernel-2.4-embedix.bb
openzaurus-pxa27x_2.4.20-rmk2-embedix20050602.bb
openzaurus-sa_2.4.18-rmk7-pxa3-embedix20030509.bb

-- 
Tom Rini


