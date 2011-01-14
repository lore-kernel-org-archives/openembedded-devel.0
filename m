Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PdaJO-0007T3-Bn
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 04:26:51 +0100
Received: by pzk12 with SMTP id 12so299783pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jan 2011 19:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=3KrfXCCamQe3yICxfzgA/IYj/mNLpMMaHsLUZl00sEo=;
	b=oSTmmaKhC7YIv/uXxe+sqLrRfV2eS0Blswsc/IJfW2fQiaQwxR/ePTG+gf0/oePoR3
	uwdaPpjs/LsXms56H6ayHfFrO7x4Qr7wcWzRuqxpZsHspjnsGu1jkz0IlOUnr8DbSXid
	yVCzSmYgMdfoRffz/h9Ob5tg13ibmH7pH0RR4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=CtGGQ8hI2j7xhnaQRjbr/aRwgEJWs8WbfwNk3biScY+deRweVGvNvXIml4UtZ6dwJI
	pLyuLGvtjywMUQQ76Pf6Hp1FJg+2hO63OzC9AkbVRu5uDBTjasuKTffM6RTarjC1CqwB
	JqbLxGXfGJQW6L0M+c9o5+vfAFmxfXVrvNrxE=
Received: by 10.142.53.20 with SMTP id b20mr289611wfa.251.1294975572537;
	Thu, 13 Jan 2011 19:26:12 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v19sm996991wfh.12.2011.01.13.19.26.10
	(version=SSLv3 cipher=RC4-MD5); Thu, 13 Jan 2011 19:26:11 -0800 (PST)
Message-ID: <4D2FC24F.8000700@gmail.com>
Date: Thu, 13 Jan 2011 19:26:07 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294929135-25911-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <1294929135-25911-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] gdbm: use full qualified permissions for chmod operations
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
X-List-Received-Date: Fri, 14 Jan 2011 03:26:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 1/13/2011 6:32 AM, Enrico Scholz wrote:
> From: Enrico Scholz<enrico.scholz@informatik.tu-chemnitz.de>
>
> An umask of 022 can cause 'chmod' to fail in a way like
>
> | $ chmod -w X
> | chmod: X: new permissions are r--rw-r--, not r--r--r--
>
> It is better to specify 'a-w' because chmod is not affected by the
> umask then and changes all permission bits.
>
> Signed-off-by: Enrico Scholz<enrico.scholz@sigma-chemnitz.de>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
>   recipes/gdbm/gdbm-1.8.3/chmod.patch |   23 +++++++++++++++++++++++
>   recipes/gdbm/gdbm_1.8.3.bb          |    3 ++-
>   2 files changed, 25 insertions(+), 1 deletions(-)
>   create mode 100644 recipes/gdbm/gdbm-1.8.3/chmod.patch
>
> diff --git a/recipes/gdbm/gdbm-1.8.3/chmod.patch b/recipes/gdbm/gdbm-1.8.3/chmod.patch
> new file mode 100644
> index 0000000..11c65d9
> --- /dev/null
> +++ b/recipes/gdbm/gdbm-1.8.3/chmod.patch
> @@ -0,0 +1,23 @@
> +With an umask of 022 the build might fail with
> +
> +| chmod -w gdbm.h
> +| chmod: gdbm.h: new permissions are r--rw----, not r--r-----
> +| make: *** [gdbm.h] Error 1
> +
> +Index: gdbm-1.8.3/Makefile.in
> +===================================================================
> +--- gdbm-1.8.3.orig/Makefile.in
> ++++ gdbm-1.8.3/Makefile.in
> +@@ -167,10 +167,10 @@ libgdbm_compat.la: $(C_LOBJS) gdbm.h
> + gdbm.h:	gdbm.proto gdbmerrno.h gdbm.proto2
> + 	rm -f gdbm.h
> + 	cp $(srcdir)/gdbm.proto gdbm.h
> +-	chmod +w gdbm.h
> ++	chmod u+w gdbm.h
> + 	grep _ $(srcdir)/gdbmerrno.h>>  gdbm.h
> + 	cat $(srcdir)/gdbm.proto2>>  gdbm.h
> +-	chmod -w gdbm.h
> ++	chmod a-w gdbm.h
> +
> + testgdbm: testgdbm.o libgdbm.la @LIBOBJS@
> + 	$(LIBTOOL) $(CC) $(LDFLAGS) -o testgdbm testgdbm.o libgdbm.la @LIBOBJS@
> diff --git a/recipes/gdbm/gdbm_1.8.3.bb b/recipes/gdbm/gdbm_1.8.3.bb
> index 9c91ae9..24c541a 100644
> --- a/recipes/gdbm/gdbm_1.8.3.bb
> +++ b/recipes/gdbm/gdbm_1.8.3.bb
> @@ -8,7 +8,8 @@ PR = "r5"
>
>   SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
>   	   file://makefile.patch \
> -           file://libtool-mode.patch"
> +           file://libtool-mode.patch \
> +           file://chmod.patch"
>
>   inherit autotools
>



