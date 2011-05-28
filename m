Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1QQKX1-0007UQ-8b
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 May 2011 16:30:23 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 45BDF799021; Sat, 28 May 2011 16:27:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from [192.168.1.37] (p5489BC57.dip.t-dialin.net [84.137.188.87])
	by gravedo.de (Postfix) with ESMTPSA id 5D1C479901E;
	Sat, 28 May 2011 16:27:18 +0200 (CEST)
Message-ID: <4DE10645.9050108@gravedo.de>
Date: Sat, 28 May 2011 16:27:17 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110422 Lightning/1.0b2 Shredder/3.1.11pre
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <20110528080123.GR3222@jama.jama.net>
In-Reply-To: <20110528080123.GR3222@jama.jama.net>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: qt4-x11-free with PACKAGE_ARCH=palmpre :/
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
X-List-Received-Date: Sat, 28 May 2011 14:30:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 28.05.2011 10:01, Martin Jansa wrote:
> Hi,
> 
> 8a8dbc88232935835c1698cdf162bdf02fc1701b
> qt4-embedded: add palmpre specific profile script and bump PR
> 
> sets PACKAGE_ARCH_palmpre = "${MACHINE_ARCH}" only in 
> qt4-embedded.inc, but machine specific file
> qt4/files/palmpre/qte.sh
> is included *also* in shared qt-${PV}.inc SRC_URI
> 
> ./qt-4.7.3.inc:SRC_URI += "file://qte.sh"
> ./qt-4.6.3.inc:SRC_URI += "file://qte.sh"
> ./qt4-embedded.inc:SRC_URI += "file://qte.sh"
> 
> which makes qt4-x11-free also MACHINE_ARCH because of 
> utils.bbclass:machine_paths
> 
> I don't see qte.sh used in qt4-x11-free so I'm going to remove it from
> .inc file as well as PACKAGE_ARCH_palmpre which is detected fine by
> utils.bbclass.

Ok, I didn't that PACKAGE_ARCH is automatically set to MACHINE_ARCH when
I include a file subdirectory specific for that machine I am building for.

> I'll attach patch, please test, because I'm using qt4-x11-free only.

Will comment on the patch in a separate mail after I build the
qt4-embedded version with the patch included.

regards,
Simon


