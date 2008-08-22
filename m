Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1KWSeT-0000Xy-3M; Fri, 22 Aug 2008 11:09:50 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1KWSd4-00063r-UP; Fri, 22 Aug 2008 10:08:24 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>)
	id 1KWSd2-0007GV-6i; Fri, 22 Aug 2008 10:08:20 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a90808211825v497fc98jaf9aa6af3a2881d0@mail.gmail.com>
References: <19c1b8a90808211825v497fc98jaf9aa6af3a2881d0@mail.gmail.com>
Date: Fri, 22 Aug 2008 10:08:19 +0100
Message-Id: <1219396099.21890.20.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: provide libc-dev in glibc eglibc
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
X-List-Received-Date: Fri, 22 Aug 2008 09:09:50 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-08-21 at 18:25 -0700, Khem Raj wrote:
> This patch makes an alias for libc-dev which points to libc6-dev in
> glibc and eglibc. This makes this package have same name like uclibc.
> This helps in writing recipes which uses these dev packages to use
> just one name and do not worry about what system library is in use.

Is the existing libc-dev package (i.e. the one from uclibc) concrete or
virtual?  If the former then you should call this new alias something
like "virtual-libc-dev" and make uclibc's libc-dev provide it as well.
If libc-dev is already a pure virtual then I guess adding a direct
RPROVIDES for glibc is harmless enough, though it might still be a good
idea to use the "virtual-libc-dev" naming for clarity and to avoid any
future imbroglio with other libraries.

By the way, your diffs always seem to come out with MIME-type
"application/octet-stream" which makes them a bit tedious to view.
Could you send them as something like text/diff or text/plain in future?

p.




