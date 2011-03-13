Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pyrwk-0006Xv-Js
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Mar 2011 21:31:26 +0100
Received: by pwj9 with SMTP id 9so748010pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Mar 2011 13:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=2wwjTmXGfEJi3GE4xbQ+pi/1sl0Idxr68DHPR0DEdWw=;
	b=SruiceaLc4CbkNTos+w7sKEcC+2bmcLiY/GOlAXXppQ6JpbihhBKcaBhNtk3bh4p7Q
	FdguA2exac74vwGB6Wmh8N8Iuj4k5sKgitT2eD4U6inVIvTjSsQ1QgT1rYXdUvQ04ZPv
	MrQ6hRV8D7XMLezGAoCCap84GPUe6K1+poTxE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=XX4vgIokVg4N9XHhHe76jDm3b0/Nbc8++rStgXcPzKFDMviIOdSnHWaYUYiUg8rprT
	IDLnHknRjiy3iIvxsuzjoPZ2VEb5Nvk6dd3nuE2WXAwTdivkDRHSqkwZ6SS/rbwu+CTP
	1GgWsPxgV5tYmK4FIDjZuDWJrQIlzaWlL/IXQ=
Received: by 10.143.27.20 with SMTP id e20mr4002583wfj.338.1300048184716;
	Sun, 13 Mar 2011 13:29:44 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n4sm9176973wfl.2.2011.03.13.13.29.43
	(version=SSLv3 cipher=OTHER); Sun, 13 Mar 2011 13:29:43 -0700 (PDT)
Message-ID: <4D7D292C.2030102@gmail.com>
Date: Sun, 13 Mar 2011 13:29:32 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1300042739-17381-1-git-send-email-eric@eukrea.com>
	<1300042739-17381-7-git-send-email-eric@eukrea.com>
In-Reply-To: <1300042739-17381-7-git-send-email-eric@eukrea.com>
Subject: Re: [PATCH 7/9] libc-client: remove 2007b
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
X-List-Received-Date: Sun, 13 Mar 2011 20:31:26 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/13/2011 11:58 AM, Eric Bénard wrote:
> Signed-off-by: Eric Bénard<eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
>   recipes/libc-client/libc-client_2007b.bb |   30 ------------------------------
>   1 files changed, 0 insertions(+), 30 deletions(-)
>   delete mode 100644 recipes/libc-client/libc-client_2007b.bb
>
> diff --git a/recipes/libc-client/libc-client_2007b.bb b/recipes/libc-client/libc-client_2007b.bb
> deleted file mode 100644
> index dbcda08..0000000
> --- a/recipes/libc-client/libc-client_2007b.bb
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -DESCRIPTION = "UW c-client library for mail protocols"
> -SECTION = "devel"
> -PRIORITY = "optional"
> -LICENSE = "University of Washingtons Free-Fork License"
> -DEPENDS = "libpam openssl libpam"
> -
> -SRC_URI = "ftp://ftp.cac.washington.edu/imap/imap-${PV}.tar.Z \
> -	   file://quote_cctype.patch"
> -
> -S = "${WORKDIR}/imap-${PV}"
> -
> -EXTRA_OEMAKE = "CC='${CC}'"
> -
> -HEADERS = "src/c-client/*.h src/osdep/unix/*.h c-client/auths.c c-client/linkage.c c-client/linkage.h c-client/osdep.h"
> -
> -do_compile() {
> -	echo "SSLINCLUDE=${STAGING_INCDIR} SSLLIB=${STAGING_LIBDIR}">  ${S}/SPECIALS
> -	oe_runmake lnp
> -}
> -
> -do_install() {
> -        install -d ${D}${includedir}/c-client
> -        install ${HEADERS} ${D}${includedir}/c-client
> -	install -d ${D}${libdir}
> -        install c-client/c-client.a ${D}${libdir}/libc-client.a
> -}
> -
> -
> -SRC_URI[md5sum] = "4d59ce6303cf8ef93ff51341b1ce2df7"
> -SRC_URI[sha256sum] = "b3170bef59f416be1f710be58333f9b0c2c8b0fe137062accd4f5f13a3785cd0"



