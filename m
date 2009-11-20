Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1NBaXN-0003CE-Mr
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 21:57:04 +0100
Received: from [85.210.2.237] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1NBaVz-0003ld-Ft
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 20:55:36 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <721719.79016.qm@web53912.mail.re2.yahoo.com>
References: <721719.79016.qm@web53912.mail.re2.yahoo.com>
Date: Fri, 20 Nov 2009 20:55:26 +0000
Message-ID: <1258750526.25369.718.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.2.237
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: pb@reciva.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Objective C cross compiler recipe?
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
X-List-Received-Date: Fri, 20 Nov 2009 20:57:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2009-11-20 at 11:42 -0800, Charlie Woloszynski wrote:
> I am working on an OMAP project and I have been asked to include some Objective-C code into the project.  
> 
> I am looking at the build process and it looks like gcc-4.3.3 is built with objective C support, but I don't see the headers or runtime library installed anywhere for cross compilation.  
> 
> GCC, as put in ./tmp/cross/armv7a/bin, seems to know objective-c but does not know where to find its header files (and I assume its runtime will be an issue right after that)

We're using gcc 4.2.4 for objective-c and it seems to work OK.  I have,
for example:

-rw-r--r-- 1 pb pb 3552 2009-06-26 13:19 tmp/cross/armv4t/lib/gcc/arm-linux/4.2.4/include/objc/Object.h

I guess it's possible that this has gotten broken in more recent
versions.  I'll try upgrading to 4.4.2 and see what happens.

p.




