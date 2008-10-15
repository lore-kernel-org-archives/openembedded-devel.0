Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KqB06-0007UO-Ir
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Oct 2008 20:21:38 +0200
Received: from [92.116.122.37] (helo=[10.129.122.37])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KqAv6-0002VR-Ll
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Oct 2008 20:16:29 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Oct 2008 20:16:23 +0200
User-Agent: KMail/1.9.9
References: <200810151022.38477.zecke@selfish.org>
	<200810151104.29672.zecke@selfish.org> <gd4cie$16r$1@ger.gmane.org>
In-Reply-To: <gd4cie$16r$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200810152016.25038.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.116.122.37
Subject: Re: [RFC] Enable --hash-style=both for all recent gcc4 targets
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
X-List-Received-Date: Wed, 15 Oct 2008 18:21:39 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 15 October 2008 11:19:10 Koen Kooi wrote:
> On 15-10-2008 11:04, Holger Freyther wrote:
> > On Wednesday 15 October 2008 10:22:36 Holger Freyther wrote:
> >
> > Okay, I have pushed holger/hash-style and would like to test and then
> > merge this branch. Comments or better ideas welcome
> > 	z.
>
> Your PR split commit has some unrelated changes in it:
>
> +PKG_TAGS = ""
> +DEPLOY_DIR_OPK = "${DEPLOY_DIR}/opk"
> +SRCPV = "${@bb.fetch.get_srcrev(d)}"
> +OPKGBUILDCMD = "opkg-build -O -o 0 -g 0"
>
> It's also missing the actual bump for distro PR in the angstrom configs.

Okay,

do you think this version is ready to be merged?

z

PS: I forced an upgrade on the git branch


