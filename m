Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PyrwK-0006XX-Ky
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Mar 2011 21:31:00 +0100
Received: by pxi1 with SMTP id 1so1142220pxi.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Mar 2011 13:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=thmHeKhw1CWbm2oW71CzRJdPGuzFvU2i4xS6d1ZaWgo=;
	b=J25HId8+o+/mS3xOLNuXyiefCnjvGFG7owm8nj8AY37yp4Pf2xpZ2CEMrUG0Tf5fkd
	yS1ExBCiafxIZcxF86NxqLlsB6kgZVfxaQGvjX32H5Y2IMGWNc1jbryQnELtbYV8RzZ0
	yPNKa1seIZLnEVB+dES1cu5ElpThhmK4u331o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=Z24pw9Akot2sYhvvgRq675vk9XLN9yrZeveurVep5ZeEC2GT77OXJpZKs+oVRPxRPq
	0rkyIfqgIzcH97XJAFFFawjOptF/dBjLfuAnsWsMdyq9pPh4/t9vroZ2UZtAOqVN5XZ0
	kDPbJsz+i0jtTJXdyvUUnh/aXsedLqtmyWiAM=
Received: by 10.142.238.7 with SMTP id l7mr9953341wfh.242.1300048155526;
	Sun, 13 Mar 2011 13:29:15 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w11sm9172448wfh.18.2011.03.13.13.29.13
	(version=SSLv3 cipher=OTHER); Sun, 13 Mar 2011 13:29:14 -0700 (PDT)
Message-ID: <4D7D290F.1070707@gmail.com>
Date: Sun, 13 Mar 2011 13:29:03 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1300042739-17381-1-git-send-email-eric@eukrea.com>
	<1300042739-17381-6-git-send-email-eric@eukrea.com>
In-Reply-To: <1300042739-17381-6-git-send-email-eric@eukrea.com>
Subject: Re: [PATCH 6/9] libc-client: add 2007e
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
X-List-Received-Date: Sun, 13 Mar 2011 20:31:00 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/13/2011 11:58 AM, Eric Bénard wrote:
> Signed-off-by: Eric Bénard<eric@eukrea.com>

there is some tab and space intermix I think but

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
>   recipes/libc-client/libc-client_2007e.bb |   29 +++++++++++++++++++++++++++++
>   1 files changed, 29 insertions(+), 0 deletions(-)
>   create mode 100644 recipes/libc-client/libc-client_2007e.bb
>
> diff --git a/recipes/libc-client/libc-client_2007e.bb b/recipes/libc-client/libc-client_2007e.bb
> new file mode 100644
> index 0000000..743910c
> --- /dev/null
> +++ b/recipes/libc-client/libc-client_2007e.bb
> @@ -0,0 +1,29 @@
> +DESCRIPTION = "UW c-client library for mail protocols"
> +SECTION = "devel"
> +PRIORITY = "optional"
> +LICENSE = "University of Washingtons Free-Fork License"
> +DEPENDS = "libpam openssl libpam"
> +
> +SRC_URI = "ftp://ftp.cac.washington.edu/imap/imap-${PV}.tar.gz \
> +	   file://quote_cctype.patch"
> +
> +S = "${WORKDIR}/imap-${PV}"
> +
> +EXTRA_OEMAKE = "CC='${CC}'"
> +
> +HEADERS = "src/c-client/*.h src/osdep/unix/*.h c-client/auths.c c-client/linkage.c c-client/linkage.h c-client/osdep.h"
> +
> +do_compile() {
> +	echo "SSLINCLUDE=${STAGING_INCDIR} SSLLIB=${STAGING_LIBDIR}">  ${S}/SPECIALS
> +	oe_runmake lnp
> +}
> +
> +do_install() {
> +        install -d ${D}${includedir}/c-client
> +        install ${HEADERS} ${D}${includedir}/c-client
> +	install -d ${D}${libdir}
> +        install c-client/c-client.a ${D}${libdir}/libc-client.a
> +}
> +
> +SRC_URI[md5sum] = "7903800dc2604000016de070e0c55840"
> +SRC_URI[sha256sum] = "4b1137b87249782496ec3eeacaf83bbf09312a7d2ae3aead262179041b55565f"



