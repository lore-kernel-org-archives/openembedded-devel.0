Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MJ2oL-0007l7-DF
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 12:01:05 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MJ2de-0001XS-HR
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 09:50:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 09:50:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 09:50:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 23 Jun 2009 11:13:44 +0200
Message-ID: <h1q6c8$a5v$8@ger.gmane.org>
References: <200906230940.05121.marcin@juszkiewicz.com.pl>
	<1245747417-11163-2-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <1245747417-11163-2-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 053/125] mpeg-encode: Make this aware of LDFLAGS, fixes QA GNU_HASH issue
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
X-List-Received-Date: Tue, 23 Jun 2009 10:01:05 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-06-09 10:56, Marcin Juszkiewicz wrote:
> From: Tim 'timtim' Ellis<tim.ellis@foonas.org>
>
>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>   recipes/mpeg-encode/files/fixup.patch   |   14 ++++++++------
>   recipes/mpeg-encode/mpeg-encode_1.5b.bb |    2 +-
>   2 files changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/recipes/mpeg-encode/files/fixup.patch b/recipes/mpeg-encode/files/fixup.patch
> index eda0920..a40c1bf 100644
> --- a/recipes/mpeg-encode/files/fixup.patch
> +++ b/recipes/mpeg-encode/files/fixup.patch
> @@ -1,6 +1,6 @@
>   diff -urN mpeg_encode.old/headers/libpnmrw.h mpeg_encode/headers/libpnmrw.h
>   --- mpeg_encode.old/headers/libpnmrw.h	1995-08-09 16:17:41.000000000 +0100
> -+++ mpeg_encode/headers/libpnmrw.h	2009-03-24 23:24:25.000000000 +0000
> ++++ mpeg_encode/headers/libpnmrw.h	2009-05-16 17:38:24.000000000 +0100
>   @@ -13,18 +13,7 @@
>    #ifndef _PNMRW_H_
>    #define _PNMRW_H_
> @@ -22,7 +22,7 @@ diff -urN mpeg_encode.old/headers/libpnmrw.h mpeg_encode/headers/libpnmrw.h
>
>   diff -urN mpeg_encode.old/jpeg/Makefile mpeg_encode/jpeg/Makefile
>   --- mpeg_encode.old/jpeg/Makefile	1995-08-05 00:27:00.000000000 +0100
> -+++ mpeg_encode/jpeg/Makefile	2009-03-24 23:24:25.000000000 +0000
> ++++ mpeg_encode/jpeg/Makefile	2009-05-16 17:38:24.000000000 +0100
>   @@ -20,9 +20,6 @@
>    manprefix =
>    manext = 1
> @@ -56,7 +56,7 @@ diff -urN mpeg_encode.old/jpeg/Makefile mpeg_encode/jpeg/Makefile
>    cjpeg: $(COBJECTS) libjpeg.a
>   diff -urN mpeg_encode.old/libpnmrw.c mpeg_encode/libpnmrw.c
>   --- mpeg_encode.old/libpnmrw.c	1995-08-16 23:24:26.000000000 +0100
> -+++ mpeg_encode/libpnmrw.c	2009-03-24 23:24:25.000000000 +0000
> ++++ mpeg_encode/libpnmrw.c	2009-05-16 17:38:24.000000000 +0100
>   @@ -28,6 +28,7 @@
>    #endif
>
> @@ -76,12 +76,14 @@ diff -urN mpeg_encode.old/libpnmrw.c mpeg_encode/libpnmrw.c
>      e = sys_errlist[errno];
>   diff -urN mpeg_encode.old/Makefile mpeg_encode/Makefile
>   --- mpeg_encode.old/Makefile	1995-08-16 23:16:56.000000000 +0100
> -+++ mpeg_encode/Makefile	2009-03-24 23:24:47.000000000 +0000
> -@@ -204,7 +204,7 @@
> ++++ mpeg_encode/Makefile	2009-05-16 18:56:22.000000000 +0100
> +@@ -203,8 +203,8 @@
> + ############
>
>    mpeg_encode: $(MP_ALL_OBJS) $(JPEG_LIB)
> - 	$(PURIFY) $(CC) $(CFLAGS) -o $@ $(MP_ALL_OBJS) $(LIBDIRS) $(LIBS)
> +-	$(PURIFY) $(CC) $(CFLAGS) -o $@ $(MP_ALL_OBJS) $(LIBDIRS) $(LIBS)
>   -	strip mpeg_encode
> ++	$(PURIFY) $(CC) $(CFLAGS) -o $@ $(MP_ALL_OBJS) $(LIBDIRS) $(LIBS) $(LDFLAGS)
>   +	$(STRIP) mpeg_encode
>
>    profile: $(MP_ALL_OBJS)
> diff --git a/recipes/mpeg-encode/mpeg-encode_1.5b.bb b/recipes/mpeg-encode/mpeg-encode_1.5b.bb
> index d32322a..0f851b1 100644
> --- a/recipes/mpeg-encode/mpeg-encode_1.5b.bb
> +++ b/recipes/mpeg-encode/mpeg-encode_1.5b.bb
> @@ -1,7 +1,7 @@
>   DESCRIPTION = "The Berkeley MPEG Encoder."
>   HOMEPAGE = "http://bmrc.berkeley.edu/frame/research/mpeg/mpeg_encode.html"
>   SECTION = "multimedia"
> -PR = "r1"
> +PR = "r2"
>
>   SRC_URI = "http://bmrc.berkeley.edu/ftp/pub/multimedia/mpeg/encode/mpeg_encode-${PV}-src.tar.gz \
>              file://fixup.patch;patch=1"




