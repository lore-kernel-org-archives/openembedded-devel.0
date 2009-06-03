Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MBvaH-0003Ng-BA
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 20:53:09 +0200
Received: from 88-109-34-80.dynamic.dsl.as9105.com ([88.109.34.80]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MBvRa-0006Rf-V7
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 19:44:11 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1243309454-9877-1-git-send-email-msmith@cbnco.com>
References: <Pine.LNX.4.64.0905252339270.6446@juice.ott.cti.com>
	<1243309454-9877-1-git-send-email-msmith@cbnco.com>
Date: Wed, 03 Jun 2009 19:44:09 +0100
Message-Id: <1244054649.5049.56.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH] busybox: allow building when prefix is "", not	"/usr".
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
X-List-Received-Date: Wed, 03 Jun 2009 18:53:09 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-05-25 at 23:44 -0400, Michael Smith wrote:
> There was code to handle this, but it needed a tweak to prevent copying
> a directory on top of itself. Other prefixes (besides /usr) may also
> work now, but this is untested.
> 
> busybox will also build when base_sbindir is "/bin" instead of "/sbin".
> 
> Also correct possible typo: "cp -dPr" to "cp -pPR", to match the usage
> a few lines above. -d implies -P.

I've checked this in now.  Thanks for the patch.

p.




