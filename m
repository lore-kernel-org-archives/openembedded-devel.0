Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MDFUT-0000l6-NI
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 12:20:37 +0200
Received: from 212-139-89-247.dynamic.dsl.as9105.com ([212.139.89.247]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1MDFLP-0007N2-UU; Sun, 07 Jun 2009 11:11:16 +0100
From: Phil Blundell <pb@reciva.com>
To: Elvis Dowson <elvis.dowson@mac.com>
In-Reply-To: <75B0D99F-6176-43F7-B640-105A130ACD2E@mac.com>
References: <4E17E8CF-AA3B-4929-BC22-B9B28A757035@mac.com>
	<1244367963.4151.5.camel@lenovo.internal.reciva.com>
	<75B0D99F-6176-43F7-B640-105A130ACD2E@mac.com>
Date: Sun, 07 Jun 2009 11:11:14 +0100
Message-Id: <1244369474.4151.13.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Subject: Re: linux-omap3_git.bb doesn't work when	copied	to	user.collection
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
X-List-Received-Date: Sun, 07 Jun 2009 10:20:37 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-06-07 at 14:04 +0400, Elvis Dowson wrote:
> Hi Phil,
> 		I deleted the entire org.openembedded.dev repository, re-cloned it  
> and this time around, ran the bitbake linux-omap3 command, after  
> commenting out the DEFAULT_PREFERENCE="-1".
> 
> Still get the same error. What can I do?

Deleting the org.openembedded.dev repo probably won't help since it's
unlikely that the offending files are in that tree.  As a first step,
you need to find out where OE is putting its cloned git repositories
(see my previous email) and clean them out.  If it still fails after
that, you'll have to try running the "git clone" (not git fetch) command
by hand and see why it's failing.

p.




