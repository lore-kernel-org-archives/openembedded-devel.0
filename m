Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1M7ngi-0007X1-P4
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 May 2009 11:38:44 +0200
Received: from 88-109-34-80.dynamic.dsl.as9105.com ([88.109.34.80]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1M7nZB-0006Qo-Ni
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 May 2009 10:30:58 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090523083237.GA28055@fh-wedel.de>
References: <20090523083237.GA28055@fh-wedel.de>
Date: Sat, 23 May 2009 10:30:56 +0100
Message-Id: <1243071056.4226.98.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: glibc-dbg used by anyone?
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
X-List-Received-Date: Sat, 23 May 2009 09:38:45 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-05-23 at 10:32 +0200, Martin Dietze wrote:
> In glibc-package.bbclass there is a glibc-dbg in the PACKAGES
> list. However after a build (nylon/mtx-1, glibc 2.3.3) I find
> empty binaries in the .debug dirs under install and image.
> Looking at the recipes I find that glibc is built with
> "--disable-debug".
> 
> So I'd like to know if this package can be built successfully
> and / or is used by anyone else? If not, would anyone mind just
> removing it from the list of packages in glibc-package.bbclass?

Glibc is configured --disable-debug by default because enabling the
debug build requires an additional compilation pass (and hence increases
the total build time by about 50%).  Practically speaking, most users
don't want to debug the C library and hence the shorter build time seems
like the larger net win.  However, the packaging infrastructure is there
so that you can, if you want, change the configuration flags to
--enable-debug and build a debuggable package.

Removing support for glibc-dbg altogether seems like it would be a bit
of a retrograde step since this would make it harder for those folks who
do want to debug the library to do so.  If the presence of the empty
binaries is vexing you then the right thing to do is probably to teach
package.bbclass to inhibit the generation of the debug package if there
isn't actually any debug data present.

p.




