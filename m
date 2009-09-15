Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MnSxU-0002fp-KN
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Sep 2009 10:00:20 +0200
Received: from [81.170.68.179] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MnSv6-0000ZH-Ii
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Sep 2009 08:57:48 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1252996876-782-2-git-send-email-raj.khem@gmail.com>
References: <1252996876-782-1-git-send-email-raj.khem@gmail.com>
	<1252996876-782-2-git-send-email-raj.khem@gmail.com>
Date: Tue, 15 Sep 2009 08:57:46 +0100
Message-Id: <1253001466.4490.1100.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-Broken-Reverse-DNS: no host name found for IP address 81.170.68.179
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 2/3] proxy-libintl_20080418.bb: Build shared library instead of static.
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
X-List-Received-Date: Tue, 15 Sep 2009 08:00:20 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-09-14 at 23:41 -0700, Khem Raj wrote:
> +LEAD_SONAME = "libintl.so"
>  
>  S = "${WORKDIR}"
> -FILES_${PN}-dev = "${includedir} ${libdir}"
> +FILES_${PN}-dev = "${includedir}"
> +FILES_${PN} = "${libdir}/libintl.so"

What's the reason for setting LEAD_SONAME?  It looks like it would be
unnecessary if you only have that one file in the output package.

> 
>  CFLAGS_append = " -Wall -I ../../include ${@['-DSTUB_ONLY', ''][bb.data.getVar('USE_NLS', d, 1) != 'no']}"
> @@ -32,15 +34,13 @@ do_install() {
>      install -d ${D}/usr/lib
>      
>      install -m 0644 ${WORKDIR}/include/libintl.h ${D}/${includedir}
> -    install -m 0644 ${WORKDIR}/lib/libintl.a ${D}/${libdir}
> +    install -m 0644 ${WORKDIR}/lib/libintl.so ${D}/${libdir}

I'd have thought you might as well continue to ship the .a file for
those who want it.  It won't do any harm since the linker will prefer
the shared object when both exist.

p.




