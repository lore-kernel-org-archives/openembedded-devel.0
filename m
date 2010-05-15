Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1ODCj5-00074u-KI
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 May 2010 10:28:09 +0200
Received: from jost.swaffham-prior.co.uk ([217.154.114.20]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1ODCfG-0004Tp-Md
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 May 2010 09:24:06 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100514212330.GA11268@rhein.zuhause.netz>
References: <20100514212330.GA11268@rhein.zuhause.netz>
Date: Sat, 15 May 2010 09:24:08 +0100
Message-ID: <1273911848.4361.2.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Using tar option strip-components in do_unpack
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
X-List-Received-Date: Sat, 15 May 2010 08:28:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-05-14 at 23:23 +0200, Henning Heinold wrote:
> I discussed with pb on irc, how it would be the best way to unpack two tar
> archivs into the same directory. He pointed me to the tar strip-components
> options and attached is the outcome. Because base.bbclass is touched it is
> open for discussion here.

> +        tar_options = tar_options + ' -f'
>         if file.endswith('.tar'):
> -               cmd = 'tar x --no-same-owner -f %s' % file
> +               cmd = 'tar %s %s' % (tar_options, file)

I think it would be a good idea to try to keep "-f" and the filename
together, rather than splitting them across two strings.  It isn't
completely obvious to someone looking at this code that "-f" needs to be
the last thing in tar_options and that the filename needs to follow it
immediately.

So, I suggest not adding -f to tar_options and instead doing something
like:

cmd = 'tar %s -f %s' % (tar_options, file)

Apart from that I think your patch is good.  Thanks for looking at this.

p.




