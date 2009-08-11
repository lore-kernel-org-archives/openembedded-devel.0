Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MagTJ-0006Bu-1T
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Aug 2009 03:48:17 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id CF3EC1B10C0A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2009 01:35:09 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Aug 2009 03:31:23 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <20090810121234.GB28304@zlo.nu>
In-Reply-To: <20090810121234.GB28304@zlo.nu>
MIME-Version: 1.0
Message-Id: <200908110331.23768.holger+oe@freyther.de>
Subject: Re: curl 7.19.5 openssl algorithm problem [PATCH]
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
X-List-Received-Date: Tue, 11 Aug 2009 01:48:19 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

On Monday 10 August 2009 14:12:34 Marc Olzheim wrote:
> From curl's CVS log: http://cool.haxx.se/cvs.cgi/curl/lib/ssluse.c#rev1.229
>
> you [curl] replaced the old SSLeay_add_ssl_algorithms() call
> with OpenSSL_add_all_algorithms(), however unlike the name suggests,
> the second function is not a superset of the first. When using SSL
> both these functions will need to be called in order to offer complete
> functionality.
>
> This patch fixes the 7.19 breakage of secure (no -k or --insecure flags
> passed) https invocations of the curl binary when connecting to a server
> with certificates with a non-MD5 or SHA-1 signature algorithm, like
> SHA-2. The older curl recipes are unaffected by this.

Great. You should have bumped the PR of the recipe as well. If the content of 
the package change, the PR should be bumped so people could upgrade the 
resulting packages.


Signed-Off-By: Holger Freyther <holger+oe@freyther.de>


