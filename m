Received: from [213.39.232.198] (helo=mail.fh-wedel.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <di@fh-wedel.de>) id 1MDbli-0007Zt-Ld
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jun 2009 12:07:54 +0200
Received: by mail.fh-wedel.de (Postfix, from userid 959)
	id 86072547DF; Mon,  8 Jun 2009 11:58:25 +0200 (CEST)
Date: Mon, 8 Jun 2009 11:58:25 +0200
From: Martin Dietze <di@fh-wedel.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090608095825.GA14821@fh-wedel.de>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <20090607175542.GA26712@fh-wedel.de> <h0h0el$60i$1@ger.gmane.org>
	<20090607191824.GB28536@fh-wedel.de> <h0i7ub$lu6$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <h0i7ub$lu6$1@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Still not solved: glibc-dbg and insane.bbclass
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
X-List-Received-Date: Mon, 08 Jun 2009 10:07:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, June 08, 2009, Koen Kooi wrote:

> INSANE_SKIP_glibc-dbg = True
>
> In the offending glibc recipe

I modified glibc-package.bbclass as you proposed, this is the diff:

diff --git a/recipes/glibc/glibc-package.bbclass b/recipes/glibc/glibc-package.bbclass
index 793401f..2bf08ce 100644
--- a/recipes/glibc/glibc-package.bbclass
+++ b/recipes/glibc/glibc-package.bbclass
@@ -32,6 +32,8 @@ USE_LDCONFIG ?= "1"
 PACKAGES = "glibc-dbg glibc catchsegv sln nscd ldd localedef glibc-utils glibc-dev glibc-doc glibc-locale libsegfault glibc-extra-nss glibc-thread-db glibc-pcprofile"
 PACKAGES_DYNAMIC = "glibc-gconv-* glibc-charmap-* glibc-localedata-* locale-base-* glibc-binary-localedata-*"

+INSANE_SKIP_glibc-dbg = True
+
 libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${base_libdir}/libc*.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/lib

 FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${datadir}/zoneinfo ${@base_conditional('USE_LDCONFIG', '1', '/sbin/ldconfig', '', d)}"


The code works well, and if nobody objects, I may commit it later today?

Cheers,

M'bert

-- 
----------- / http://herbert.the-little-red-haired-girl.org / -------------
=+= 


