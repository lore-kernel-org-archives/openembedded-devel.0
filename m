Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NDdyf-0002KM-Gy
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Nov 2009 14:01:45 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NDdx6-0003re-PT
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Nov 2009 13:00:04 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NDdx3-0004H0-SU
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Nov 2009 13:00:01 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ec1f3d400911252153n2cdcd3f5vb9bc29d3760bd623@mail.gmail.com>
References: <ec1f3d400911222214l37838f37i204c88bba6971d5b@mail.gmail.com>
	<1258973177.23826.231.camel@mill.internal.reciva.com>
	<ec1f3d400911252153n2cdcd3f5vb9bc29d3760bd623@mail.gmail.com>
Date: Thu, 26 Nov 2009 12:59:58 +0000
Message-Id: <1259240398.4332.118.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: cortex-a9 machine build failure at gcc
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
X-List-Received-Date: Thu, 26 Nov 2009 13:01:46 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-11-26 at 11:23 +0530, RK Raggit wrote:
> OE is trying to make a link but the directory is missing. Any ideas ? My
> binutils was built fine with version 2.18.50.0.7

Yes, that is a bit odd.  This seems to be specific to the CSL toolchain:
it has an extra block that isn't present in the regular gcc.

# staging-linkage and cross-linkage recipes don't work anymore, so do it by hand for this backwards CSL toolchain
do_compile_prepend() {
	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/crt*.o ${CROSS_DIR}/${TARGET_SYS}/lib/
	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/ld-* ${CROSS_DIR}/${TARGET_SYS}/lib/
	ln -sf ${STAGING_DIR_TARGET}/lib/libc* ${CROSS_DIR}/${TARGET_SYS}/lib/ 
	sed -i -e 's:gcc_no_link=yes:gcc_no_link=no:' ${S}/libstdc++-v3/configure
}

I'm not exactly sure what this is all about, but I suspect that this
should probably be getting applied only for the real gcc-cross, not for
the -initial version.  You could try building a different version of
gcc-cross-initial and see if you are then able to compile the CSL
toolchain as gcc-cross.  Alternatively, adding a strategic "mkdir"
command in the function above might clear it up as well.

p.




