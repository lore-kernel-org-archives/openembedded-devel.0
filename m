Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MI7pa-0001fw-8O
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Jun 2009 23:10:34 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MI7f9-0001Jm-ED
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Jun 2009 21:59:47 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ADFDB08F-9C2B-4156-8FE2-48C9C53DA921@mac.com>
References: <B7B72D38-62FD-4B6B-9856-DF4F470F832F@mac.com>
	<1245521341.29153.288.camel@lenovo.internal.reciva.com>
	<3186A9DE-F7A1-4400-8B6B-ABE119EDA16A@mac.com>
	<1245523070.29153.290.camel@lenovo.internal.reciva.com>
	<B7C10C35-361B-469B-975E-B80AA8B7ED6A@mac.com>
	<1245527560.29153.295.camel@lenovo.internal.reciva.com>
	<ADFDB08F-9C2B-4156-8FE2-48C9C53DA921@mac.com>
Date: Sat, 20 Jun 2009 21:59:40 +0100
Message-Id: <1245531580.29153.303.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: Recipe for libserial_0.6.0rc1
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
X-List-Received-Date: Sat, 20 Jun 2009 21:10:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-06-21 at 00:20 +0400, Elvis Dowson wrote:
> Hi,
> 	My only gripe with this autotools_stage, is that all the headers just  
> go flat under
> 
> /tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include
> 
> instead of nicely packaging it under a libserial folder within /tool/ 
> overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include
> 
> Anyway to fix this?

Not easily.  The autotools class just installs the headers whereever the
package's Makefile is set up to put them.  If the library's authors have
written their makefiles to dump the headers in /usr/include rather than
in a subdirectory, that's what will happen.  (This isn't at all
uncommon, particularly for libraries with just one or two headers, and
it isn't necessarily any cause for concern.)

Plus, if this is where the package is set up to install its headers,
that's probably where other distributions are going to put them and
hence where other software is going to expect to find them.  So,
although obviously you can write a custom do_stage method to put the
headers somewhere else, it's not a good idea to do this unless you have
a particular reason to believe either that the library's authors were
seriously misguided, or that the Makefile is malfunctioning for some
reason and not putting the headers where they expected it would.

p.




