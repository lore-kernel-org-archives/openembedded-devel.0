Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MH3js-0001Al-Id
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 00:36:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 2A64E4CF58D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2009 18:25:48 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23277-10 for <openembedded-devel@lists.openembedded.org>; 
	Wed, 17 Jun 2009 18:25:48 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id E19D14AC009
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2009 18:25:47 -0400 (EDT)
Message-ID: <4A396D6B.2030505@cbnco.com>
Date: Wed, 17 Jun 2009 18:25:47 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090302)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <05DB01B9-1334-4650-873E-96B20CAC9D8C@mac.com>
In-Reply-To: <05DB01B9-1334-4650-873E-96B20CAC9D8C@mac.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: glibc_2.6.1.bb - dangling symlink to /lib/libcidn-2.6.1.so
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
X-List-Received-Date: Wed, 17 Jun 2009 22:36:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Elvis Dowson wrote:

> NOTE: the following files were installed but not shipped in any package:
> NOTE:   /lib/libmemusage.so
> NOTE:   /lib/libcidn-2.6.1.so
 > NOTE: glibc contains dangling symlink to /lib/libcidn-2.6.1.so

Hi Elvis,

I don't think it's going to hurt. Bottom line, the fix is probably to 
add ${base_libdir}/libcidn-*.so and ${base_libdir}/libcidn*.so.* to 
libc_baselibs in glibc-package.bbclass, but you aren't likely to use the 
functionality provided by this library.

libcidn is a glibc add-on that allows getaddrinfo() to resolve domain 
names with special characters. It's enabled by default in libc_2.6.1.bb:

GLIBC_ADDONS ?= "ports,nptl,libidn"

But a lot of machines override it, so I guess many people never see this 
libcidn:

conf/machine/x86.conf:GLIBC_ADDONS = "nptl"

Recently glibc-package.bbclass was changed to have a whitelist of 
libraries in order to prevent unneeded .a files from being shipped. The 
whitelist doesn't contain libcidn-*.so. It does contain "libc*.so.*" 
which is why you get the symlink (libcidn.so.1).

> NOTE: Multiple libraries (libnss_nisplus.so.2, libnss_hesiod.so.2, 
> libnss_nis.so.2) found, but LEAD_SONAME 'libc.so' doesn't match any of them
> NOTE: Running task 548 of 581 (ID: 204, 
> /tool/overo-oe/org.openembedded.dev/recipes/gcc/gcc-cross_4.3.3.bb, 
> do_configure)

LEAD_SONAME is set to "libc.so", but maybe it should be 
LEAD_SONAME_${PN} instead so it doesn't leak into glibc-extra-nss, etc. 
I don't use this feature so I can't say for sure, but I doubt it really 
breaks anything.

> NOTE: Couldn't find shared library provider for libgcc_s.so.1

Do you have /lib/libgcc_s.so.1 in your rootfs? If so, it found a way in 
somehow in spite of this warning.

You could also set:

ASSUME_SHLIBS += "libgcc_s.so.1:libgcc"

(cribbed from openwrt-sdk -- but I wonder if it should be global?)

Mike


