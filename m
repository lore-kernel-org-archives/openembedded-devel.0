Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 3FE7565C85
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 13:11:57 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 18 Aug 2015 15:11:57 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 642E028BA20;
	Tue, 18 Aug 2015 15:11:57 +0200 (CEST)
Date: Tue, 18 Aug 2015 15:11:57 +0200
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20150818131156.GA64804@sestofb10.enea.se>
References: <1439580903-32301-1-git-send-email-vinay.k.awasthi@intel.com>
MIME-Version: 1.0
In-Reply-To: <1439580903-32301-1-git-send-email-vinay.k.awasthi@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Subject: Re: [meta-java][PATCH 1/2] OpenJDK-8u: For x86 and arm
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Aug 2015 13:11:58 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,

On Fri, Aug 14, 2015 at 12:35:03PM -0700, Vinay K. Awasthi wrote:
> From: "Vinay K. Awasthi" <vinay.k.awasthi@intel.com>
> 
> OpenJDK-8 Update Build 40b27:
> 
> This package enables OpenJDK-8 update for x86 and arm in following vm configurations.
> 
> x86: hotspot VM
> arm: interpreter mode (zero vm)
> 
> Openjdk-8u also supports compact profiles (see http://openjdk.java.net/jeps/161 for
> more details). These compact profiles can also be built by going over the comments.
> 
> oe_runmake profiles will build compact profile one two and three java runtimes (jre)
> oe_runmake images profiles will build compact profile JDKs
> 
> Signed-off-by: Vinay K. Awasthi <vinay.k.awasthi@intel.com>
> ---

#  bitbake java-test-image

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'openjdk-8-jre' (but
/media/data/fb/majo/test/poky/meta-java/recipes-images/images/java-test-image.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'openjdk-8-jre' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['openjdk-8-jre']
ERROR: Required build target 'java-test-image' has no buildable
providers.
Missing or unbuildable dependency chain was: ['java-test-image',
'openjdk-8-jre']

Please fix this build error.

Best Regards,
Maxin


