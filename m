Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1JZNVP-0000jI-NF
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Mar 2008 10:44:21 +0100
Received: from firewall.tw.openmoko.org ([124.219.5.210] helo=tamarin.local)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1JZNTQ-0001Vv-W8
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Mar 2008 10:42:13 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Mar 2008 10:42:09 +0100
User-Agent: KMail/1.9.9
References: <200803120827.29003.zecke@selfish.org>
	<200803120918.09502.zecke@selfish.org>
	<1205313475.4530.4.camel@dax.rpnet.com>
In-Reply-To: <1205313475.4530.4.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200803121042.09542.zecke@selfish.org>
X-SA-Exim-Connect-IP: 81.169.183.159
X-SA-Exim-Mail-From: zecke@selfish.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: staging ABI changes and broken idium
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Mar 2008 09:44:21 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 12 March 2008 10:17:54 Richard Purdie wrote:

> > -I/usr/include is still bad (assuming it holds your system headers).
>
> We want the -I/usr/include removed since we must not use system headers
> but we don't need any such include since sysroot or our standard CFLAGS
> will pick up staging. s:'-I$(includedir)'::g should therefore be ok.

Right, the proper fix is go to the Makefile.am and exchange -I$(includedir) 
with an empty string. I think the majority of places that sed the Makefile 
have this in mind, sure they can hit other places as well... this is why I 
didn't blindly fixed the sed's. For the configure.ac this more looks like 
paths to search for header and such, we need more care there as well.

Rolf: This sounds like a perfect weekend project to do together and go through 
the list I'm compiling and fix these and verifying that they work.

z.


