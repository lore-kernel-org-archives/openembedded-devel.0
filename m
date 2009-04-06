Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lqnln-0000Sv-2c
	for openembedded-devel@openembedded.org; Mon, 06 Apr 2009 14:17:47 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Lqnj2-0002Yt-M5
	for openembedded-devel@openembedded.org; Mon, 06 Apr 2009 12:14:52 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 06 Apr 2009 12:14:52 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 06 Apr 2009 12:14:52 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 06 Apr 2009 14:14:39 +0200
Message-ID: <grcrnh$5it$1@ger.gmane.org>
References: <1239016820-24813-1-git-send-email-jeremy.laine@bolloretelecom.eu>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <1239016820-24813-1-git-send-email-jeremy.laine@bolloretelecom.eu>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] libnl: use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Mon, 06 Apr 2009 12:17:47 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06-04-09 13:20, Jeremy Lainé wrote:
> From: Jeremy Lainé<jeremy.laine@m4x.org>

Acked-by: Koen Kooi <koen@openembedded.org>


>
> Signed-off-by: Jeremy Lainé<jeremy.laine@m4x.org>
> ---
>   .../local-includes-and-avoid-wrong-ldflags.patch   |   13 -------------
>   recipes/libnl/files/local-includes.patch           |   12 ++++++++++++
>   recipes/libnl/files/respect-ldflags.patch          |   12 ++++++++++++
>   recipes/libnl/libnl_1.1.bb                         |    5 +++--
>   4 files changed, 27 insertions(+), 15 deletions(-)
>   delete mode 100644 recipes/libnl/files/local-includes-and-avoid-wrong-ldflags.patch
>   create mode 100644 recipes/libnl/files/local-includes.patch
>   create mode 100644 recipes/libnl/files/respect-ldflags.patch
>
> diff --git a/recipes/libnl/files/local-includes-and-avoid-wrong-ldflags.patch b/recipes/libnl/files/local-includes-and-avoid-wrong-ldflags.patch
> deleted file mode 100644
> index 428df53..0000000
> --- a/recipes/libnl/files/local-includes-and-avoid-wrong-ldflags.patch
> +++ /dev/null
> @@ -1,13 +0,0 @@
> ---- libnl-1.0-pre8/Makefile.opts.in.orig	2007-11-21 18:25:39.000000000 +0100
> -+++ libnl-1.0-pre8/Makefile.opts.in	2008-04-04 23:38:40.000000000 +0200
> -@@ -10,8 +10,8 @@
> - #
> -
> - CC               := @CC@
> --CFLAGS           := @CFLAGS@
> --LDFLAGS          := @LDFLAGS@
> -+CFLAGS           := -I./include -I. -I../include @CFLAGS@
> -+LDFLAGS          :=
> - CPPFLAGS         := @CPPFLAGS@
> - PACKAGE_NAME     := @PACKAGE_NAME@
> - PACKAGE_VERSION  := @PACKAGE_VERSION@
> diff --git a/recipes/libnl/files/local-includes.patch b/recipes/libnl/files/local-includes.patch
> new file mode 100644
> index 0000000..85659db
> --- /dev/null
> +++ b/recipes/libnl/files/local-includes.patch
> @@ -0,0 +1,12 @@
> +diff -urN libnl-1.1.orig/Makefile.opts.in libnl-1.1/Makefile.opts.in
> +--- libnl-1.1.orig/Makefile.opts.in	2008-01-14 15:48:45.000000000 +0000
> ++++ libnl-1.1/Makefile.opts.in	2009-04-06 10:20:40.000000000 +0000
> +@@ -10,7 +10,7 @@
> + #
> +
> + CC               := @CC@
> +-CFLAGS           := @CFLAGS@
> ++CFLAGS           := -I./include -I. -I../include @CFLAGS@
> + LDFLAGS          := @LDFLAGS@
> + CPPFLAGS         := @CPPFLAGS@
> + PACKAGE_NAME     := @PACKAGE_NAME@
> diff --git a/recipes/libnl/files/respect-ldflags.patch b/recipes/libnl/files/respect-ldflags.patch
> new file mode 100644
> index 0000000..ba97dc6
> --- /dev/null
> +++ b/recipes/libnl/files/respect-ldflags.patch
> @@ -0,0 +1,12 @@
> +diff -urN libnl-1.1.orig/lib/Makefile libnl-1.1/lib/Makefile
> +--- libnl-1.1.orig/lib/Makefile	2008-01-14 15:48:45.000000000 +0000
> ++++ libnl-1.1/lib/Makefile	2009-04-06 10:16:21.000000000 +0000
> +@@ -48,7 +48,7 @@
> +
> + $(OUT_SLIB): ../Makefile.opts $(OBJ)
> + 	@echo "  LD $(OUT_SLIB)"; \
> +-	$(CC) -shared -Wl,-soname,libnl.so.1 -o $(OUT_SLIB) $(OBJ) $(LIBNL_LIB) -lc
> ++	$(CC) $(LDFLAGS) -shared -Wl,-soname,libnl.so.1 -o $(OUT_SLIB) $(OBJ) $(LIBNL_LIB) -lc
> + 	@echo "  LN $(OUT_SLIB) $(LN1_SLIB)"; \
> + 	rm -f $(LN1_SLIB) ; $(LN) -s $(OUT_SLIB) $(LN1_SLIB)
> + 	@echo "  LN $(LN1_SLIB) $(LN_SLIB)"; \
> diff --git a/recipes/libnl/libnl_1.1.bb b/recipes/libnl/libnl_1.1.bb
> index dcca3c6..5f2d6f1 100644
> --- a/recipes/libnl/libnl_1.1.bb
> +++ b/recipes/libnl/libnl_1.1.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "libnl is a library for applications dealing with netlink sockets"
>   SECTION = "libs/network"
>   LICENSE = "LGPL"
>   HOMEPAGE = "http://people.suug.ch/~tgr/libnl"
> -PR = "r1"
> +PR = "r2"
>
>   inherit autotools pkgconfig
>
> @@ -10,8 +10,9 @@ CFLAGS += '-DVLAN_FLAG_REORDER_HDR=1'
>
>   SRC_URI = "\
>     http://people.suug.ch/~tgr/libnl/files/libnl-${PV}.tar.gz \
> -  file://local-includes-and-avoid-wrong-ldflags.patch;patch=1 \
> +  file://local-includes.patch;patch=1 \
>     file://fix-includes.patch;patch=1 \
> +  file://respect-ldflags.patch;patch=1 \
>   "
>
>   do_stage () {




