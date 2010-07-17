Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Oa1t5-0001v5-KH
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Jul 2010 09:32:46 +0200
Received: by pzk2 with SMTP id 2so1031600pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jul 2010 00:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=oGNYdR5UeBEFgs8PRpIRmPiV0a9NsbvgP3Srrkr/dYo=;
	b=jErZud42h4B7sTKu3GBQg6W+p4kOler25TOn+4pTWSAgfsrqQPTPEnLvtlCApENEnx
	jykqIGJ/3HGsszwkGDQf6YiQoDjpCUNTcKIVsnMq5kt6bZZ/kcHfy00DnzJXQMFadvRf
	A0FRozpoIT5HMAmHvBG3SW0SNZ0bwYAczOdwM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=NxStyO8eTVMRZvPzAtCIkqTaZJbe0GnXj3P/ev/kR1OSmcGwH/Fljh/VxJ6etCSn9S
	w6cpSQlpKWRsbUdYoih/fWkbe8HSJ55FZomqRKVeJT52+oFFYr9GWEmV7eRV0jpdXXI+
	QkPL++EWw/6QYwRcqnhH/quqMEwCsxOCRe5kE=
Received: by 10.114.36.2 with SMTP id j2mr3028184waj.88.1279351956362;
	Sat, 17 Jul 2010 00:32:36 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n32sm35753672wag.11.2010.07.17.00.32.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 17 Jul 2010 00:32:35 -0700 (PDT)
Date: Sat, 17 Jul 2010 00:32:35 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100717073235.GA19683@gmail.com>
References: <1279216536.3741.27.camel@mattotaupa>
	<1279270987.4164.29.camel@mattotaupa>
	<AANLkTimGrdHiLeLLsInSl9L-KS8SbvNt4ws2kDcpEEN1@mail.gmail.com>
	<i1qogv$i28$2@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i1qogv$i28$2@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: angstrom-2008.1, uclibc: git-native: sysroot-destdir 6, 4 GB big, since some executables are 100 MB each
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
X-List-Received-Date: Sat, 17 Jul 2010 07:32:46 -0000
X-Groupsio-MsgNum: 21079
Content-Type: multipart/mixed; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline

--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (17/07/10 01:03), Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 16-07-10 17:23, Khem Raj wrote:
> > On Fri, Jul 16, 2010 at 2:03 AM, Paul Menzel
> > <paulepanter@users.sourceforge.net> wrote:
> >> Dear OE folks,
> >>
> >>
> >> Am Donnerstag, den 15.07.2010, 19:55 +0200 schrieb Paul Menzel:
> >>
> >>> I ran out of space and noticed
> >>>
> >>>     /angstrom-dev/work/i686-linux/git-native-1.7.0.2-r4
> >>>
> >>> is 8,1G big.
> >>>
> >>> Some of the executable files in
> >>>
> >>>     /angstrom-dev/work/i686-linux/git-native-1.7.0.2-r4/sysroot-destdir/angstrom-dev/sysroots/i686-linux/usr/libexec/git-core/
> >>>
> >>> are 101 MB big.
> > 
> > its most probably the -g3/-ggdb3 bloat.
> 
> No, it's git not creating (hard)links but copies of the same app. Run an
> md5sum on the binaries, they will all match. I suggest you stop
> spreading FUD about -ggdb3, it is not being appriciated.

Hi Koen


I built minimal-image/uclibc from scratch on a ubuntu maverick (gcc 4.4.4)
host
once with -g and secong time using -ggdb3 instead
in both FULL_OPTIMIZATION and BUILD_OPTIMIZATION



Total tmp size with -g = 15G
Total tmp size with -ggdb3 = 70G

Total sysroot size with -g = 1.1G (868M is native sysroot )
Total sysroot size with -ggdb3 = 13.4G ( 12.7G is native sysroot )

Total size of cross directory with -g = 158M
Total size of cross directory with -gdb3 = 567M

Because I did not strip the binaries

Total size of deploy with -g = 135M
Total size of deploy with -ggdb3 = 521M

Attached is a list of files in sysroot which are larger than 2M in size
sorted in increasing size order for both -g and -ggdb

generated by using

find . -type f -size +2000k -exec ls -lh {} \; 2> /dev/null | awk '{ print
$NF ": " $5 }' | sort -nk 2,2

btw git-native build tree is 24G which is a problem
but if we ignore that tmp still is ~45G for a minimal-image

Does that clear the FUD ? :)

anyway my point was that users know what to expect. If we put it in
minimum requirement to build a distro its fine atleast it sets expectation
on how much disk space would be needed.

btw. now may I request you for some emperical evidence on
"gcc 4.4 is slow on ARMv7" or is it another FUD or hearsay ? :)

Thanks

-Khem

ps: I also noticed that the build with -ggdb3 took noticeable longer time. I wish I
had timed it but may be next time.

--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="file-size-with-g.txt"

./x86_64-linux/usr/lib/libcrypto.so.0.9.8: 2.0M
./mipsel-oe-linux-uclibc/usr/lib/libgcrypt.a: 2.1M
./mipsel-oe-linux-uclibc/usr/lib/libgio-2.0.so.0.2400.1: 2.4M
./mipsel-oe-linux-uclibc/usr/lib/libglib-2.0.so.0.2400.1: 2.4M
./x86_64-linux/usr/lib/libncurses.a: 2.5M
./mipsel-oe-linux-uclibc/usr/lib/libgnutls.so.26.14.12: 2.6M
./x86_64-linux/usr/bin/qemu-cris: 2.8M
./x86_64-linux/usr/lib/libgio-2.0.so.0.2400.1: 2.8M
./x86_64-linux/usr/bin/qemu-sh4: 3.0M
./mipsel-oe-linux-uclibc/lib/libuClibc-0.9.32-git.so: 3.1M
./x86_64-linux/usr/bin/qemu-microblaze: 3.1M
./x86_64-linux/usr/bin/qemu-sh4eb: 3.1M
./x86_64-linux/usr/lib/libglib-2.0.so.0.2400.1: 3.1M
./x86_64-linux/usr/lib/libcrypto.a: 3.3M
./x86_64-linux/usr/bin/qemu-m68k: 3.4M
./x86_64-linux/usr/bin/qemu-sparc: 3.4M
./x86_64-linux/usr/bin/qemu-alpha: 3.5M
./x86_64-linux/usr/lib/libxml2.so.2.7.7: 3.9M
./mipsel-oe-linux-uclibc/usr/lib/libgnutls.a: 4.1M
./x86_64-linux/usr/bin/git: 4.2M
./x86_64-linux/usr/bin/git-receive-pack: 4.2M
./x86_64-linux/usr/bin/git-upload-archive: 4.2M
./x86_64-linux/usr/libexec/git-core/git: 4.2M
./x86_64-linux/usr/libexec/git-core/git-add: 4.2M
./x86_64-linux/usr/libexec/git-core/git-annotate: 4.2M
./x86_64-linux/usr/libexec/git-core/git-apply: 4.2M
./x86_64-linux/usr/libexec/git-core/git-archive: 4.2M
./x86_64-linux/usr/libexec/git-core/git-bisect--helper: 4.2M
./x86_64-linux/usr/libexec/git-core/git-blame: 4.2M
./x86_64-linux/usr/libexec/git-core/git-branch: 4.2M
./x86_64-linux/usr/libexec/git-core/git-bundle: 4.2M
./x86_64-linux/usr/libexec/git-core/git-cat-file: 4.2M
./x86_64-linux/usr/libexec/git-core/git-check-attr: 4.2M
./x86_64-linux/usr/libexec/git-core/git-checkout: 4.2M
./x86_64-linux/usr/libexec/git-core/git-checkout-index: 4.2M
./x86_64-linux/usr/libexec/git-core/git-check-ref-format: 4.2M
./x86_64-linux/usr/libexec/git-core/git-cherry: 4.2M
./x86_64-linux/usr/libexec/git-core/git-cherry-pick: 4.2M
./x86_64-linux/usr/libexec/git-core/git-clean: 4.2M
./x86_64-linux/usr/libexec/git-core/git-clone: 4.2M
./x86_64-linux/usr/libexec/git-core/git-commit: 4.2M
./x86_64-linux/usr/libexec/git-core/git-commit-tree: 4.2M
./x86_64-linux/usr/libexec/git-core/git-config: 4.2M
./x86_64-linux/usr/libexec/git-core/git-count-objects: 4.2M
./x86_64-linux/usr/libexec/git-core/git-describe: 4.2M
./x86_64-linux/usr/libexec/git-core/git-diff: 4.2M
./x86_64-linux/usr/libexec/git-core/git-diff-files: 4.2M
./x86_64-linux/usr/libexec/git-core/git-diff-index: 4.2M
./x86_64-linux/usr/libexec/git-core/git-diff-tree: 4.2M
./x86_64-linux/usr/libexec/git-core/git-fast-export: 4.2M
./x86_64-linux/usr/libexec/git-core/git-fetch: 4.2M
./x86_64-linux/usr/libexec/git-core/git-fetch-pack: 4.2M
./x86_64-linux/usr/libexec/git-core/git-fmt-merge-msg: 4.2M
./x86_64-linux/usr/libexec/git-core/git-for-each-ref: 4.2M
./x86_64-linux/usr/libexec/git-core/git-format-patch: 4.2M
./x86_64-linux/usr/libexec/git-core/git-fsck: 4.2M
./x86_64-linux/usr/libexec/git-core/git-fsck-objects: 4.2M
./x86_64-linux/usr/libexec/git-core/git-gc: 4.2M
./x86_64-linux/usr/libexec/git-core/git-get-tar-commit-id: 4.2M
./x86_64-linux/usr/libexec/git-core/git-grep: 4.2M
./x86_64-linux/usr/libexec/git-core/git-hash-object: 4.2M
./x86_64-linux/usr/libexec/git-core/git-help: 4.2M
./x86_64-linux/usr/libexec/git-core/git-index-pack: 4.2M
./x86_64-linux/usr/libexec/git-core/git-init: 4.2M
./x86_64-linux/usr/libexec/git-core/git-init-db: 4.2M
./x86_64-linux/usr/libexec/git-core/git-log: 4.2M
./x86_64-linux/usr/libexec/git-core/git-ls-files: 4.2M
./x86_64-linux/usr/libexec/git-core/git-ls-remote: 4.2M
./x86_64-linux/usr/libexec/git-core/git-ls-tree: 4.2M
./x86_64-linux/usr/libexec/git-core/git-mailinfo: 4.2M
./x86_64-linux/usr/libexec/git-core/git-mailsplit: 4.2M
./x86_64-linux/usr/libexec/git-core/git-merge: 4.2M
./x86_64-linux/usr/libexec/git-core/git-merge-base: 4.2M
./x86_64-linux/usr/libexec/git-core/git-merge-file: 4.2M
./x86_64-linux/usr/libexec/git-core/git-merge-index: 4.2M
./x86_64-linux/usr/libexec/git-core/git-merge-ours: 4.2M
./x86_64-linux/usr/libexec/git-core/git-merge-recursive: 4.2M
./x86_64-linux/usr/libexec/git-core/git-merge-subtree: 4.2M
./x86_64-linux/usr/libexec/git-core/git-merge-tree: 4.2M
./x86_64-linux/usr/libexec/git-core/git-mktag: 4.2M
./x86_64-linux/usr/libexec/git-core/git-mktree: 4.2M
./x86_64-linux/usr/libexec/git-core/git-mv: 4.2M
./x86_64-linux/usr/libexec/git-core/git-name-rev: 4.2M
./x86_64-linux/usr/libexec/git-core/git-pack-objects: 4.2M
./x86_64-linux/usr/libexec/git-core/git-pack-redundant: 4.2M
./x86_64-linux/usr/libexec/git-core/git-pack-refs: 4.2M
./x86_64-linux/usr/libexec/git-core/git-patch-id: 4.2M
./x86_64-linux/usr/libexec/git-core/git-peek-remote: 4.2M
./x86_64-linux/usr/libexec/git-core/git-prune: 4.2M
./x86_64-linux/usr/libexec/git-core/git-prune-packed: 4.2M
./x86_64-linux/usr/libexec/git-core/git-push: 4.2M
./x86_64-linux/usr/libexec/git-core/git-read-tree: 4.2M
./x86_64-linux/usr/libexec/git-core/git-receive-pack: 4.2M
./x86_64-linux/usr/libexec/git-core/git-reflog: 4.2M
./x86_64-linux/usr/libexec/git-core/git-remote: 4.2M
./x86_64-linux/usr/libexec/git-core/git-replace: 4.2M
./x86_64-linux/usr/libexec/git-core/git-repo-config: 4.2M
./x86_64-linux/usr/libexec/git-core/git-rerere: 4.2M
./x86_64-linux/usr/libexec/git-core/git-reset: 4.2M
./x86_64-linux/usr/libexec/git-core/git-revert: 4.2M
./x86_64-linux/usr/libexec/git-core/git-rev-list: 4.2M
./x86_64-linux/usr/libexec/git-core/git-rev-parse: 4.2M
./x86_64-linux/usr/libexec/git-core/git-rm: 4.2M
./x86_64-linux/usr/libexec/git-core/git-send-pack: 4.2M
./x86_64-linux/usr/libexec/git-core/git-shortlog: 4.2M
./x86_64-linux/usr/libexec/git-core/git-show: 4.2M
./x86_64-linux/usr/libexec/git-core/git-show-branch: 4.2M
./x86_64-linux/usr/libexec/git-core/git-show-ref: 4.2M
./x86_64-linux/usr/libexec/git-core/git-stage: 4.2M
./x86_64-linux/usr/libexec/git-core/git-status: 4.2M
./x86_64-linux/usr/libexec/git-core/git-stripspace: 4.2M
./x86_64-linux/usr/libexec/git-core/git-symbolic-ref: 4.2M
./x86_64-linux/usr/libexec/git-core/git-tag: 4.2M
./x86_64-linux/usr/libexec/git-core/git-tar-tree: 4.2M
./x86_64-linux/usr/libexec/git-core/git-unpack-file: 4.2M
./x86_64-linux/usr/libexec/git-core/git-unpack-objects: 4.2M
./x86_64-linux/usr/libexec/git-core/git-update-index: 4.2M
./x86_64-linux/usr/libexec/git-core/git-update-ref: 4.2M
./x86_64-linux/usr/libexec/git-core/git-update-server-info: 4.2M
./x86_64-linux/usr/libexec/git-core/git-upload-archive: 4.2M
./x86_64-linux/usr/libexec/git-core/git-var: 4.2M
./x86_64-linux/usr/libexec/git-core/git-verify-pack: 4.2M
./x86_64-linux/usr/libexec/git-core/git-verify-tag: 4.2M
./x86_64-linux/usr/libexec/git-core/git-whatchanged: 4.2M
./x86_64-linux/usr/libexec/git-core/git-write-tree: 4.2M
./x86_64-linux/usr/bin/qemu-i386: 4.3M
./x86_64-linux/usr/bin/qemu-mipsel: 4.3M
./x86_64-linux/usr/bin/qemu-sparc32plus: 4.3M
./x86_64-linux/usr/bin/qemu-arm: 4.4M
./x86_64-linux/usr/bin/qemu-sparc64: 4.4M
./x86_64-linux/usr/bin/qemu-x86_64: 4.4M
./x86_64-linux/usr/bin/qemu-mips: 4.5M
./x86_64-linux/usr/bin/qemu-armeb: 4.6M
./qemumipsel-oe-linux-uclibc/kernel/vmlinux: 5.1M
./x86_64-linux/usr/lib/libpython2.6.so.1.0: 5.1M
./x86_64-linux/usr/bin/qemu-system-cris: 5.3M
./x86_64-linux/usr/bin/qemu-system-microblaze: 5.3M
./x86_64-linux/usr/bin/qemu-system-m68k: 5.7M
./x86_64-linux/usr/bin/qemu-system-sh4: 5.7M
./x86_64-linux/usr/bin/qemu-system-sh4eb: 5.7M
./x86_64-linux/usr/bin/qemu-system-sparc: 6.1M
./x86_64-linux/usr/bin/qemu-ppc: 6.4M
./x86_64-linux/usr/lib/libxml2.a: 6.6M
./mipsel-oe-linux-uclibc/usr/lib/libc.a: 6.7M
./mipsel-oe-linux-uclibc/usr/lib/libstdc++.a: 6.9M
./x86_64-linux/usr/bin/qemu-ppc64: 7.8M
./x86_64-linux/usr/bin/qemu-ppc64abi32: 7.8M
./x86_64-linux/usr/bin/qemu-system-sparc64: 7.8M
./x86_64-linux/usr/lib/python2.6/config/libpython2.6.a: 8.3M
./x86_64-linux/usr/bin/qemu: 8.5M
./x86_64-linux/usr/bin/qemu-system-mipsel: 8.6M
./x86_64-linux/usr/bin/qemu-system-mips: 8.7M
./x86_64-linux/usr/bin/qemu-system-x86_64: 8.8M
./x86_64-linux/usr/bin/qemu-system-mips64: 9.0M
./x86_64-linux/usr/bin/qemu-system-mips64el: 9.0M
./x86_64-linux/usr/bin/qemu-system-arm: 9.1M
./x86_64-linux/usr/bin/qemu-system-ppc: 10M
./x86_64-linux/usr/bin/qemu-system-ppcemb: 10M
./x86_64-linux/usr/bin/qemu-system-ppc64: 12M

--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="file-size-with-ggdb3.txt"

./x86_64-linux/usr/lib/libcrypto.so.0.9.8: 2.0M
./mipsel-oe-linux-uclibc/usr/lib/libacl.so.1.1.0: 2.1M
./x86_64-linux/usr/bin/dir: 2.1M
./x86_64-linux/usr/bin/ls: 2.1M
./x86_64-linux/usr/bin/rm: 2.1M
./x86_64-linux/usr/bin/stdbuf: 2.1M
./x86_64-linux/usr/bin/vdir: 2.1M
./mipsel-oe-linux-uclibc/lib/librt-0.9.32-git.so: 2.2M
./mipsel-oe-linux-uclibc/usr/lib/libacl.a: 2.3M
./mipsel-oe-linux-uclibc/usr/lib/libgobject-2.0.so.0.2400.1: 2.4M
./x86_64-linux/usr/bin/sort: 2.4M
./x86_64-linux/usr/bin/df: 2.5M
./x86_64-linux/usr/lib/libform.so.5.0.4: 2.5M
./x86_64-linux/usr/lib/libgobject-2.0.so.0.2400.1: 2.5M
./mipsel-oe-linux-uclibc/usr/lib/libform.so.5.0.4: 2.7M
./x86_64-linux/usr/bin/du: 2.8M
./mipsel-oe-linux-uclibc/usr/lib/libform.a: 2.9M
./x86_64-linux/usr/lib/libform.a: 2.9M
./mipsel-oe-linux-uclibc/usr/lib/liblzo.so.1.0.0: 3.1M
./mipsel-oe-linux-uclibc/usr/lib/liblzo.a: 3.3M
./x86_64-linux/usr/lib/libcrypto.a: 3.3M
./x86_64-linux/usr/bin/cp: 3.5M
./x86_64-linux/usr/bin/mv: 3.5M
./x86_64-linux/usr/bin/m4: 3.6M
./x86_64-linux/usr/lib/libopkg.so.0.0.0: 3.7M
./x86_64-linux/usr/bin/install: 3.8M
./x86_64-linux/usr/lib/libgettextsrc-0.18.so: 3.8M
./mipsel-oe-linux-uclibc/usr/lib/libopkg.so.0.0.0: 4.0M
./x86_64-linux/usr/bin/qemu-img: 4.1M
./x86_64-linux/usr/bin/qemu-nbd: 4.1M
./x86_64-linux/usr/bin/qemu-io: 4.2M
./mipsel-oe-linux-uclibc/usr/lib/libopkg.a: 4.3M
./x86_64-linux/usr/lib/libopkg.a: 4.3M
./mipsel-oe-linux-uclibc/lib/libm-0.9.32-git.so: 4.5M
./mipsel-oe-linux-uclibc/usr/lib/libm.a: 4.9M
./x86_64-linux/usr/lib/libelf.so.0.8.13: 5.0M
./qemumipsel-oe-linux-uclibc/kernel/vmlinux: 5.1M
./x86_64-linux/usr/lib/libpython2.6.so.1.0: 5.1M
./x86_64-linux/usr/lib/libelf.a: 5.5M
./x86_64-linux/usr/bin/qemu-cris: 5.7M
./mipsel-oe-linux-uclibc/usr/lib/libgcrypt.so.11.4.4: 5.9M
./x86_64-linux/usr/bin/qemu-sh4: 6.1M
./x86_64-linux/usr/bin/qemu-microblaze: 6.2M
./x86_64-linux/usr/bin/qemu-sparc: 6.2M
./x86_64-linux/usr/bin/qemu-sh4eb: 6.3M
./x86_64-linux/usr/bin/qemu-alpha: 6.5M
./x86_64-linux/usr/bin/qemu-m68k: 6.6M
./x86_64-linux/usr/lib/libgettextpo.so.0.5.0: 6.6M
./mipsel-oe-linux-uclibc/usr/lib/libgcrypt.a: 6.7M
./mipsel-oe-linux-uclibc/usr/lib/libthread_db.a: 6.7M
./mipsel-oe-linux-uclibc/usr/lib/libstdc++.a: 6.9M
./x86_64-linux/usr/bin/qemu-sparc32plus: 7.1M
./x86_64-linux/usr/bin/qemu-sparc64: 7.3M
./x86_64-linux/usr/bin/qemu-mipsel: 7.4M
./x86_64-linux/usr/lib/libgettextpo.a: 7.4M
./x86_64-linux/usr/bin/qemu-mips: 7.6M
./x86_64-linux/usr/bin/qemu-x86_64: 7.6M
./x86_64-linux/usr/bin/qemu-i386: 7.7M
./mipsel-oe-linux-uclibc/usr/lib/libblkid.so.1.1.0: 8.0M
./x86_64-linux/usr/lib/python2.6/config/libpython2.6.a: 8.3M
./mipsel-oe-linux-uclibc/usr/lib/libblkid.a: 8.4M
./x86_64-linux/usr/lib/libxml2.a: 8.4M
./x86_64-linux/usr/lib/libgettextlib-0.18.so: 8.8M
./x86_64-linux/usr/bin/qemu-arm: 9.0M
./x86_64-linux/usr/bin/qemu-armeb: 9.2M
./x86_64-linux/usr/bin/qemu-ppc: 9.6M
./x86_64-linux/usr/lib/libxml2.so.2.7.7: 9.9M
./x86_64-linux/usr/bin/qemu-ppc64: 11M
./x86_64-linux/usr/bin/qemu-ppc64abi32: 11M
./mipsel-oe-linux-uclibc/usr/lib/libgnutls.so.26.14.12: 14M
./x86_64-linux/usr/lib/libglib-2.0.so.0.2400.1: 14M
./mipsel-oe-linux-uclibc/usr/lib/libglib-2.0.so.0.2400.1: 15M
./mipsel-oe-linux-uclibc/usr/lib/libgnutls.a: 16M
./x86_64-linux/usr/lib/libncurses.so.5.0.4: 16M
./mipsel-oe-linux-uclibc/usr/lib/libgio-2.0.so.0.2400.1: 17M
./mipsel-oe-linux-uclibc/usr/lib/libncurses.a: 17M
./mipsel-oe-linux-uclibc/usr/lib/libncurses.so.5.0.4: 17M
./x86_64-linux/usr/lib/libgio-2.0.so.0.2400.1: 17M
./x86_64-linux/usr/lib/libncurses.a: 17M
./mipsel-oe-linux-uclibc/lib/libpthread-0.9.32-git.so: 22M
./mipsel-oe-linux-uclibc/usr/lib/libpthread.a: 23M
./x86_64-linux/usr/bin/qemu-system-cris: 24M
./x86_64-linux/usr/bin/qemu-system-m68k: 24M
./x86_64-linux/usr/bin/qemu-system-microblaze: 24M
./x86_64-linux/usr/bin/qemu-system-sh4: 25M
./x86_64-linux/usr/bin/qemu-system-sh4eb: 25M
./x86_64-linux/usr/bin/qemu-system-sparc: 25M
./x86_64-linux/usr/bin/qemu-system-sparc64: 27M
./x86_64-linux/usr/bin/qemu: 32M
./x86_64-linux/usr/bin/qemu-system-mips: 32M
./x86_64-linux/usr/bin/qemu-system-mips64: 32M
./x86_64-linux/usr/bin/qemu-system-mips64el: 32M
./x86_64-linux/usr/bin/qemu-system-mipsel: 32M
./x86_64-linux/usr/bin/qemu-system-x86_64: 32M
./x86_64-linux/usr/bin/qemu-system-ppc: 34M
./x86_64-linux/usr/bin/qemu-system-ppcemb: 34M
./x86_64-linux/usr/bin/qemu-system-arm: 36M
./x86_64-linux/usr/bin/qemu-system-ppc64: 36M
./x86_64-linux/usr/bin/git-shell: 41M
./x86_64-linux/usr/libexec/git-core/git-daemon: 41M
./x86_64-linux/usr/libexec/git-core/git-http-backend: 41M
./x86_64-linux/usr/libexec/git-core/git-imap-send: 41M
./x86_64-linux/usr/libexec/git-core/git-shell: 41M
./x86_64-linux/usr/bin/git-upload-pack: 42M
./x86_64-linux/usr/libexec/git-core/git-fast-import: 42M
./x86_64-linux/usr/libexec/git-core/git-http-fetch: 42M
./x86_64-linux/usr/libexec/git-core/git-http-push: 42M
./x86_64-linux/usr/libexec/git-core/git-upload-pack: 42M
./x86_64-linux/usr/libexec/git-core/git-remote-ftp: 43M
./x86_64-linux/usr/libexec/git-core/git-remote-ftps: 43M
./x86_64-linux/usr/libexec/git-core/git-remote-http: 43M
./x86_64-linux/usr/libexec/git-core/git-remote-https: 43M
./x86_64-linux/usr/bin/git: 103M
./x86_64-linux/usr/bin/git-receive-pack: 103M
./x86_64-linux/usr/bin/git-upload-archive: 103M
./x86_64-linux/usr/libexec/git-core/git: 103M
./x86_64-linux/usr/libexec/git-core/git-add: 103M
./x86_64-linux/usr/libexec/git-core/git-annotate: 103M
./x86_64-linux/usr/libexec/git-core/git-apply: 103M
./x86_64-linux/usr/libexec/git-core/git-archive: 103M
./x86_64-linux/usr/libexec/git-core/git-bisect--helper: 103M
./x86_64-linux/usr/libexec/git-core/git-blame: 103M
./x86_64-linux/usr/libexec/git-core/git-branch: 103M
./x86_64-linux/usr/libexec/git-core/git-bundle: 103M
./x86_64-linux/usr/libexec/git-core/git-cat-file: 103M
./x86_64-linux/usr/libexec/git-core/git-check-attr: 103M
./x86_64-linux/usr/libexec/git-core/git-checkout: 103M
./x86_64-linux/usr/libexec/git-core/git-checkout-index: 103M
./x86_64-linux/usr/libexec/git-core/git-check-ref-format: 103M
./x86_64-linux/usr/libexec/git-core/git-cherry: 103M
./x86_64-linux/usr/libexec/git-core/git-cherry-pick: 103M
./x86_64-linux/usr/libexec/git-core/git-clean: 103M
./x86_64-linux/usr/libexec/git-core/git-clone: 103M
./x86_64-linux/usr/libexec/git-core/git-commit: 103M
./x86_64-linux/usr/libexec/git-core/git-commit-tree: 103M
./x86_64-linux/usr/libexec/git-core/git-config: 103M
./x86_64-linux/usr/libexec/git-core/git-count-objects: 103M
./x86_64-linux/usr/libexec/git-core/git-describe: 103M
./x86_64-linux/usr/libexec/git-core/git-diff: 103M
./x86_64-linux/usr/libexec/git-core/git-diff-files: 103M
./x86_64-linux/usr/libexec/git-core/git-diff-index: 103M
./x86_64-linux/usr/libexec/git-core/git-diff-tree: 103M
./x86_64-linux/usr/libexec/git-core/git-fast-export: 103M
./x86_64-linux/usr/libexec/git-core/git-fetch: 103M
./x86_64-linux/usr/libexec/git-core/git-fetch-pack: 103M
./x86_64-linux/usr/libexec/git-core/git-fmt-merge-msg: 103M
./x86_64-linux/usr/libexec/git-core/git-for-each-ref: 103M
./x86_64-linux/usr/libexec/git-core/git-format-patch: 103M
./x86_64-linux/usr/libexec/git-core/git-fsck: 103M
./x86_64-linux/usr/libexec/git-core/git-fsck-objects: 103M
./x86_64-linux/usr/libexec/git-core/git-gc: 103M
./x86_64-linux/usr/libexec/git-core/git-get-tar-commit-id: 103M
./x86_64-linux/usr/libexec/git-core/git-grep: 103M
./x86_64-linux/usr/libexec/git-core/git-hash-object: 103M
./x86_64-linux/usr/libexec/git-core/git-help: 103M
./x86_64-linux/usr/libexec/git-core/git-index-pack: 103M
./x86_64-linux/usr/libexec/git-core/git-init: 103M
./x86_64-linux/usr/libexec/git-core/git-init-db: 103M
./x86_64-linux/usr/libexec/git-core/git-log: 103M
./x86_64-linux/usr/libexec/git-core/git-ls-files: 103M
./x86_64-linux/usr/libexec/git-core/git-ls-remote: 103M
./x86_64-linux/usr/libexec/git-core/git-ls-tree: 103M
./x86_64-linux/usr/libexec/git-core/git-mailinfo: 103M
./x86_64-linux/usr/libexec/git-core/git-mailsplit: 103M
./x86_64-linux/usr/libexec/git-core/git-merge: 103M
./x86_64-linux/usr/libexec/git-core/git-merge-base: 103M
./x86_64-linux/usr/libexec/git-core/git-merge-file: 103M
./x86_64-linux/usr/libexec/git-core/git-merge-index: 103M
./x86_64-linux/usr/libexec/git-core/git-merge-ours: 103M
./x86_64-linux/usr/libexec/git-core/git-merge-recursive: 103M
./x86_64-linux/usr/libexec/git-core/git-merge-subtree: 103M
./x86_64-linux/usr/libexec/git-core/git-merge-tree: 103M
./x86_64-linux/usr/libexec/git-core/git-mktag: 103M
./x86_64-linux/usr/libexec/git-core/git-mktree: 103M
./x86_64-linux/usr/libexec/git-core/git-mv: 103M
./x86_64-linux/usr/libexec/git-core/git-name-rev: 103M
./x86_64-linux/usr/libexec/git-core/git-pack-objects: 103M
./x86_64-linux/usr/libexec/git-core/git-pack-redundant: 103M
./x86_64-linux/usr/libexec/git-core/git-pack-refs: 103M
./x86_64-linux/usr/libexec/git-core/git-patch-id: 103M
./x86_64-linux/usr/libexec/git-core/git-peek-remote: 103M
./x86_64-linux/usr/libexec/git-core/git-prune: 103M
./x86_64-linux/usr/libexec/git-core/git-prune-packed: 103M
./x86_64-linux/usr/libexec/git-core/git-push: 103M
./x86_64-linux/usr/libexec/git-core/git-read-tree: 103M
./x86_64-linux/usr/libexec/git-core/git-receive-pack: 103M
./x86_64-linux/usr/libexec/git-core/git-reflog: 103M
./x86_64-linux/usr/libexec/git-core/git-remote: 103M
./x86_64-linux/usr/libexec/git-core/git-replace: 103M
./x86_64-linux/usr/libexec/git-core/git-repo-config: 103M
./x86_64-linux/usr/libexec/git-core/git-rerere: 103M
./x86_64-linux/usr/libexec/git-core/git-reset: 103M
./x86_64-linux/usr/libexec/git-core/git-revert: 103M
./x86_64-linux/usr/libexec/git-core/git-rev-list: 103M
./x86_64-linux/usr/libexec/git-core/git-rev-parse: 103M
./x86_64-linux/usr/libexec/git-core/git-rm: 103M
./x86_64-linux/usr/libexec/git-core/git-send-pack: 103M
./x86_64-linux/usr/libexec/git-core/git-shortlog: 103M
./x86_64-linux/usr/libexec/git-core/git-show: 103M
./x86_64-linux/usr/libexec/git-core/git-show-branch: 103M
./x86_64-linux/usr/libexec/git-core/git-show-ref: 103M
./x86_64-linux/usr/libexec/git-core/git-stage: 103M
./x86_64-linux/usr/libexec/git-core/git-status: 103M
./x86_64-linux/usr/libexec/git-core/git-stripspace: 103M
./x86_64-linux/usr/libexec/git-core/git-symbolic-ref: 103M
./x86_64-linux/usr/libexec/git-core/git-tag: 103M
./x86_64-linux/usr/libexec/git-core/git-tar-tree: 103M
./x86_64-linux/usr/libexec/git-core/git-unpack-file: 103M
./x86_64-linux/usr/libexec/git-core/git-unpack-objects: 103M
./x86_64-linux/usr/libexec/git-core/git-update-index: 103M
./x86_64-linux/usr/libexec/git-core/git-update-ref: 103M
./x86_64-linux/usr/libexec/git-core/git-update-server-info: 103M
./x86_64-linux/usr/libexec/git-core/git-upload-archive: 103M
./x86_64-linux/usr/libexec/git-core/git-var: 103M
./x86_64-linux/usr/libexec/git-core/git-verify-pack: 103M
./x86_64-linux/usr/libexec/git-core/git-verify-tag: 103M
./x86_64-linux/usr/libexec/git-core/git-whatchanged: 103M
./x86_64-linux/usr/libexec/git-core/git-write-tree: 103M
./mipsel-oe-linux-uclibc/lib/libuClibc-0.9.32-git.so: 104M
./mipsel-oe-linux-uclibc/usr/lib/libc.a: 108M

--qMm9M+Fa2AknHoGS--
