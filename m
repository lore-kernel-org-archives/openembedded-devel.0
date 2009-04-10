Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LsBH0-0000pQ-H0
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Apr 2009 09:35:41 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KHV00HG9JLXYC99@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	10 Apr 2009 02:32:22 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 290A76B83A8; Fri,
	10 Apr 2009 03:32:21 -0400 (EDT)
Date: Fri, 10 Apr 2009 03:32:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090410073221.GB28918@denix.org>
References: <1239347000-27123-1-git-send-email-jeremy.laine@bolloretelecom.eu>
MIME-version: 1.0
In-reply-to: <1239347000-27123-1-git-send-email-jeremy.laine@bolloretelecom.eu>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,BAYES_00,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Jeremy Lain?? <jeremy.laine@m4x.org>
Subject: Re: [STABLE][PATCH] ppp: add patch to use LDFLAGS (fixes QA	error)
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
X-List-Received-Date: Fri, 10 Apr 2009 07:35:41 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Apr 10, 2009 at 09:03:20AM +0200, Jeremy Lain?? wrote:
> From: Jeremy Lain?? <jeremy.laine@m4x.org>
> 
> 
> Signed-off-by: Jeremy Lain?? <jeremy.laine@m4x.org>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/ppp/ppp-2.4.3/ldflags.patch |  120 +++++++++++++++++++++++++++++++++++
>  recipes/ppp/ppp_2.4.3.bb            |    3 +-
>  2 files changed, 122 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/ppp/ppp-2.4.3/ldflags.patch
> 
> diff --git a/recipes/ppp/ppp-2.4.3/ldflags.patch b/recipes/ppp/ppp-2.4.3/ldflags.patch
> new file mode 100644
> index 0000000..202c7f3
> --- /dev/null
> +++ b/recipes/ppp/ppp-2.4.3/ldflags.patch
> @@ -0,0 +1,120 @@
> +Index: ppp-2.4.3/chat/Makefile.linux
> +===================================================================
> +--- ppp-2.4.3.orig/chat/Makefile.linux	2009-04-08 10:00:38.000000000 +0200
> ++++ ppp-2.4.3/chat/Makefile.linux	2009-04-08 10:01:16.000000000 +0200
> +@@ -18,7 +18,7 @@
> + all:	chat
> + 
> + chat:	chat.o
> +-	$(CC) -o chat chat.o
> ++	$(CC) $(LDFLAGS) -o chat chat.o
> + 
> + chat.o:	chat.c
> + 	$(CC) -c $(CFLAGS) -o chat.o chat.c
> +Index: ppp-2.4.3/pppd/plugins/Makefile.linux
> +===================================================================
> +--- ppp-2.4.3.orig/pppd/plugins/Makefile.linux	2009-04-08 10:00:38.000000000 +0200
> ++++ ppp-2.4.3/pppd/plugins/Makefile.linux	2009-04-08 10:03:54.000000000 +0200
> +@@ -1,6 +1,5 @@
> + COPTS	= -O2 -g
> + CFLAGS	= $(COPTS) -I.. -I../../include -fPIC
> +-LDFLAGS	= -shared
> + INSTALL	= install
> + 
> + DESTDIR = @DESTDIR@
> +@@ -22,7 +21,7 @@
> + 	for d in $(SUBDIRS); do $(MAKE) $(MFLAGS) -C $$d all; done
> + 
> + %.so: %.c
> +-	$(CC) -o $@ $(LDFLAGS) $(CFLAGS) $^
> ++	$(CC) -o $@ $(LDFLAGS) -shared $(CFLAGS) $^
> + 
> + VERSION = $(shell awk -F '"' '/VERSION/ { print $$2; }' ../patchlevel.h)
> + 
> +Index: ppp-2.4.3/pppd/plugins/pppoatm/Makefile.linux
> +===================================================================
> +--- ppp-2.4.3.orig/pppd/plugins/pppoatm/Makefile.linux	2009-04-08 10:00:38.000000000 +0200
> ++++ ppp-2.4.3/pppd/plugins/pppoatm/Makefile.linux	2009-04-08 10:03:15.000000000 +0200
> +@@ -1,6 +1,5 @@
> + COPTS	= -O2 -g
> + CFLAGS	= $(COPTS) -I../.. -I../../../include -fPIC
> +-LDFLAGS	= -shared
> + INSTALL	= install
> + 
> + #***********************************************************************
> +@@ -32,7 +31,7 @@
> + all: $(PLUGIN)
> + 
> + $(PLUGIN): $(PLUGIN_OBJS)
> +-	$(CC) $(CFLAGS) -o $@ -shared $^ $(LIBS)
> ++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ -shared $^ $(LIBS)
> + 
> + install: all
> + 	$(INSTALL) -d -m 755 $(LIBDIR)
> +Index: ppp-2.4.3/pppd/plugins/radius/Makefile.linux
> +===================================================================
> +--- ppp-2.4.3.orig/pppd/plugins/radius/Makefile.linux	2009-04-08 10:00:38.000000000 +0200
> ++++ ppp-2.4.3/pppd/plugins/radius/Makefile.linux	2009-04-08 10:01:16.000000000 +0200
> +@@ -43,13 +43,13 @@
> + 	$(INSTALL) -m 444 pppd-radattr.8 $(MANDIR)
> + 
> + radius.so: radius.o libradiusclient.a
> +-	$(CC) -o radius.so -shared radius.o libradiusclient.a
> ++	$(CC) $(LDFLAGS) -o radius.so -shared radius.o libradiusclient.a
> + 
> + radattr.so: radattr.o
> +-	$(CC) -o radattr.so -shared radattr.o
> ++	$(CC) $(LDFLAGS) -o radattr.so -shared radattr.o
> + 
> + radrealms.so: radrealms.o
> +-	$(CC) -o radrealms.so -shared radrealms.o
> ++	$(CC) $(LDFLAGS) -o radrealms.so -shared radrealms.o
> + 
> + CLIENTOBJS = avpair.o buildreq.o config.o dict.o ip_util.o \
> + 	clientid.o sendserver.o lock.o util.o md5.o
> +Index: ppp-2.4.3/pppd/plugins/rp-pppoe/Makefile.linux
> +===================================================================
> +--- ppp-2.4.3.orig/pppd/plugins/rp-pppoe/Makefile.linux	2009-04-08 10:00:38.000000000 +0200
> ++++ ppp-2.4.3/pppd/plugins/rp-pppoe/Makefile.linux	2009-04-08 10:01:16.000000000 +0200
> +@@ -29,13 +29,13 @@
> + all: rp-pppoe.so pppoe-discovery
> + 
> + pppoe-discovery: libplugin.a pppoe-discovery.o
> +-	$(CC) -o pppoe-discovery pppoe-discovery.o libplugin.a
> ++	$(CC) $(LDFLAGS) -o pppoe-discovery pppoe-discovery.o libplugin.a
> + 
> + pppoe-discovery.o: pppoe-discovery.c
> + 	$(CC) $(CFLAGS) '-DVERSION="$(VERSION)"' -c -o pppoe-discovery.o pppoe-discovery.c
> + 
> + rp-pppoe.so: libplugin.a plugin.o
> +-	$(CC) -o rp-pppoe.so -shared plugin.o libplugin.a
> ++	$(CC) $(LDFLAGS) -o rp-pppoe.so -shared plugin.o libplugin.a
> + 
> + install: all
> + 	$(INSTALL) -d -m 755 $(LIBDIR)
> +Index: ppp-2.4.3/pppdump/Makefile.linux
> +===================================================================
> +--- ppp-2.4.3.orig/pppdump/Makefile.linux	2009-04-08 10:00:38.000000000 +0200
> ++++ ppp-2.4.3/pppdump/Makefile.linux	2009-04-08 10:01:16.000000000 +0200
> +@@ -10,7 +10,7 @@
> + all:	pppdump
> + 
> + pppdump: $(OBJS)
> +-	$(CC) -o pppdump $(OBJS)
> ++	$(CC) $(LDFLAGS) -o pppdump $(OBJS)
> + 
> + clean:
> + 	rm -f pppdump $(OBJS) *~
> +Index: ppp-2.4.3/pppstats/Makefile.linux
> +===================================================================
> +--- ppp-2.4.3.orig/pppstats/Makefile.linux	2009-04-08 10:00:38.000000000 +0200
> ++++ ppp-2.4.3/pppstats/Makefile.linux	2009-04-08 10:01:16.000000000 +0200
> +@@ -26,7 +26,7 @@
> + 	$(INSTALL) -c -m 444 pppstats.8 $(MANDIR)
> + 
> + pppstats: $(PPPSTATSRCS)
> +-	$(CC) $(CFLAGS) -o pppstats pppstats.c $(LIBS)
> ++	$(CC) $(CFLAGS) $(LDFLAGS) -o pppstats pppstats.c $(LIBS)
> + 
> + clean:
> + 	rm -f pppstats *~ #* core
> diff --git a/recipes/ppp/ppp_2.4.3.bb b/recipes/ppp/ppp_2.4.3.bb
> index f09dcac..295a3fb 100644
> --- a/recipes/ppp/ppp_2.4.3.bb
> +++ b/recipes/ppp/ppp_2.4.3.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Point-to-Point Protocol (PPP) daemon"
>  HOMEPAGE = "http://samba.org/ppp/"
>  DEPENDS = "libpcap"
>  LICENSE = "BSD GPLv2"
> -PR = "r4"
> +PR = "r5"
>  
>  SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
>          file://ppp-2.4.3-mppe-mppc-1.1.patch;patch=1 \
> @@ -14,6 +14,7 @@ SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
>  	file://pppoatm-makefile.patch;patch=1 \
>  	file://enable-ipv6.patch;patch=1 \
>  	file://makefile-remove-hard-usr-reference.patch;patch=1 \
> +	file://ldflags.patch;patch=1 \
>  	file://pon \
>  	file://poff \
>  	file://init \
> -- 
> 1.6.2.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


