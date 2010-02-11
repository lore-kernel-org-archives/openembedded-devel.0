Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NfYa3-0003Pv-0Z
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 13:55:42 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NfYXZ-0004c6-DY
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 12:53:05 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NfYXZ-0005O5-6x
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 12:53:05 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1265832780-19939-9-git-send-email-rep.dot.nop@gmail.com>
References: <1265832780-19939-1-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-2-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-3-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-4-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-5-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-6-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-7-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-8-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-9-git-send-email-rep.dot.nop@gmail.com>
Date: Thu, 11 Feb 2010 12:53:01 +0000
Message-ID: <1265892781.3777.1050.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 8/8] xz: add xz package
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
X-List-Received-Date: Thu, 11 Feb 2010 12:55:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-02-10 at 21:13 +0100, Bernhard Reutner-Fischer wrote:
> xz is the lzma successor
> tested with automake-1.11.1, autoconf-2.65

Thanks for the patch.  I think this could use a little cleanup before it
is committed, though; please see below.

> index 0000000..bc5e9ff
> --- /dev/null
> +++ b/recipes/xz/xz-native.inc
> @@ -0,0 +1,2 @@
> +inherit native
> +require xz_${PV}.bb

You could consider using BBCLASSEXTEND to eliminate the need for this
separate recipe.

> diff --git a/recipes/xz/xz-native_4.999.9beta.bb b/recipes/xz/xz-native_4.999.9beta.bb
> new file mode 100644
> index 0000000..c4f0da9
> --- /dev/null
> +++ b/recipes/xz/xz-native_4.999.9beta.bb
> @@ -0,0 +1,3 @@
> +PV = "4.999.9beta"
> +
> +require xz-native.inc

Is it necessary to set PV here?  I would have thought base.bbclass would
infer that same value from the filename.

> diff --git a/recipes/xz/xz-native_git.bb b/recipes/xz/xz-native_git.bb
> new file mode 100644
> index 0000000..006b9d7
> --- /dev/null
> +++ b/recipes/xz/xz-native_git.bb
> @@ -0,0 +1,7 @@
> +# XZ_BASE should be the latest released version of xz.
> +# It can be set in the distro file.
> +#XZ_BASE ?= "4.999.9"
> +#SRCREV = "HEAD"
> +#PV = "${XZ_BASE}+gitr${SRCREV}"

Please don't leave this sort of stuff commented out in the file.  If
it's not needed, just delete those lines.

> +#FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/xz-${PV}"

Likewise for that.

> --- /dev/null
> +++ b/recipes/xz/xz_4.999.9beta.bb
> @@ -0,0 +1,8 @@
> +PV = "4.999.9beta"

See above regarding PV.

> +
> +require xz.inc
> +PR = "${INC_PR}.0"
> +SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.bz2;name=xz"

Wouldn't that SRC_URI be better in the .inc file?  Presumably this is
the correct URI for everything except the _git version.

> +SRC_URI[xz.md5sum] = "cc4044fcc073b8bcf3164d1d0df82161"
> +SRC_URI[xz.sha256sum] = "330312c4397608d8b7be362cc7edbfeafa6101614bc2164d816ea767656aa15c"
> +EXTRA_OECONF = "--enable-shared"

Likewise for that EXTRA_OECONF, I would have thought that would also
belong in the .inc really.

p.




