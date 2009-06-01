Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>)
	id 1MBE5S-0002tW-Bm; Mon, 01 Jun 2009 22:26:27 +0200
Received: from 88-109-34-80.dynamic.dsl.as9105.com ([88.109.34.80]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>)
	id 1MBDwl-0008KB-0N; Mon, 01 Jun 2009 21:17:28 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <h012tn$v40$1@ger.gmane.org>
References: <gr7nfd$32a$1@ger.gmane.org>
	<20090601165809.GZ23842@smtp.west.cox.net> <h012tn$v40$1@ger.gmane.org>
Date: Mon, 01 Jun 2009 21:17:06 +0100
Message-Id: <1243887426.5049.18.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] Rebuild external kernel modules on kernel change
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
X-List-Received-Date: Mon, 01 Jun 2009 20:26:29 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-06-01 at 19:25 +0200, Koen Kooi wrote:
> 2) is *very* hard to track down, e.g. people don't expect that enabling 
> netfilter as modules breaks external wifi drivers since struct sk_buff 
> will change (ask nokia 770 tablet users).
> I bet there are a lot more cases where kernel runtime abi changes, so 
> every kernel PR bump will trigger a rebuild *and* (here's comes the most 
> important bit) an automatic PR bump for recipes using module*.bbclass.

The networking code is indeed particularly bad in that respect.  But in
general Tom is right, the vast majority of kernel config changes
(enabling drivers, adjusting command line parameters or default
settings, that kind of thing) don't have ABI impact and there is no need
to rebuild everything as a result.

The easiest way to deal with that issue is probably to have a separate
KERNEL_PACKAGE_ABIVERSION variable which is set locally in the kernel's
own .bb file, which is appended to the regular kernel-abiversion, and
which you can manually increment when making a change that causes, or is
likely to cause, an ABI change.  If you, as a kernel package maintainer,
want to take a particularly conservative line with your own kernels then
you can simply set KERNEL_PACKAGE_ABIVERSION = "${PR}" and it will act
as you describe above; other maintainers who want to avoid unnecessary
rebuilds can use their own judgement about when to increment it.  

For folks who use MODVERSIONS, it'd probably be easy enough to add an
extra check to detect when the symbol hashes have changed since the last
build and emit an error.  In an ideal world, you'd even be able to
generate a single ABI footprint by, say, taking a sha256 hash of the
catenation of all the symbol versions.  Then, your kernel package could
Provide: kernel-abi-123456abc, all your module packages could Depend: on
the same thing, and (modulo a little bit of package manager tweaking
along roughly the same lines as we use for locales) everything would
"just work".

p.




