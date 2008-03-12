Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1JZMCD-0007jY-CA
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Mar 2008 09:20:23 +0100
Received: from firewall.tw.openmoko.org ([124.219.5.210] helo=tamarin.local)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1JZMAE-0008JP-5V
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Mar 2008 09:18:18 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Mar 2008 09:18:08 +0100
User-Agent: KMail/1.9.9
References: <200803120827.29003.zecke@selfish.org>
	<fr828g$l2n$1@ger.gmane.org> <fr82hj$l2n$2@ger.gmane.org>
In-Reply-To: <fr82hj$l2n$2@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200803120918.09502.zecke@selfish.org>
X-SA-Exim-Connect-IP: 81.169.183.159
X-SA-Exim-Mail-From: zecke@selfish.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
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
X-List-Received-Date: Wed, 12 Mar 2008 08:20:24 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 12 March 2008 08:59:47 Koen Kooi wrote:
> Koen Kooi schreef:

> | (from gimp.inc)
> | do_configure_append() {
> | ~    find ${S} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
> | }
>
> Switching on my brain, the above isn't needed anymore, right?

-I/usr/include is still bad (assuming it holds your system headers).




