Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lqnql-0005qm-NK
	for openembedded-devel@openembedded.org; Mon, 06 Apr 2009 14:22:54 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1Lqno2-0002mI-BV
	for openembedded-devel@openembedded.org; Mon, 06 Apr 2009 12:20:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 06 Apr 2009 12:20:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 06 Apr 2009 12:20:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 06 Apr 2009 14:14:56 +0200
Message-ID: <grcro2$5it$2@ger.gmane.org>
References: <1239016836-30285-1-git-send-email-jeremy.laine@bolloretelecom.eu>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <1239016836-30285-1-git-send-email-jeremy.laine@bolloretelecom.eu>
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
Subject: Re: [STABLE][PATCH] tcp-wrappers: use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Mon, 06 Apr 2009 12:22:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06-04-09 13:20, Jeremy Lainé wrote:
> From: Jeremy Lainé<jeremy.laine@m4x.org>

Acked-by: Koen Kooi <koen@openembedded.org>

>
> Signed-off-by: Jeremy Lainé<jeremy.laine@m4x.org>
> ---
>   recipes/tcp-wrappers/tcp-wrappers-7.6/ldflags |   43 +++++++++++++++++++++++++
>   recipes/tcp-wrappers/tcp-wrappers_7.6.bb      |    3 +-
>   2 files changed, 45 insertions(+), 1 deletions(-)
>   create mode 100644 recipes/tcp-wrappers/tcp-wrappers-7.6/ldflags
>
> diff --git a/recipes/tcp-wrappers/tcp-wrappers-7.6/ldflags b/recipes/tcp-wrappers/tcp-wrappers-7.6/ldflags
> new file mode 100644
> index 0000000..2e89765
> --- /dev/null
> +++ b/recipes/tcp-wrappers/tcp-wrappers-7.6/ldflags
> @@ -0,0 +1,43 @@
> +Index: tcp_wrappers_7.6.orig/Makefile
> +===================================================================
> +--- tcp_wrappers_7.6.orig.orig/Makefile	2009-04-06 10:55:47.000000000 +0000
> ++++ tcp_wrappers_7.6.orig/Makefile	2009-04-06 10:57:04.000000000 +0000
> +@@ -748,31 +748,31 @@
> +
> + $(SHLIB): $(SHLIB_OBJ)
> + 	rm -f $(SHLIB)
> +-	$(CC) -o $(SHLIB) $(SHLINKFLAGS) $(SHLIB_OBJ)
> ++	$(CC) $(LDFLAGS) -o $(SHLIB) $(SHLINKFLAGS) $(SHLIB_OBJ)
> + 	ln -sf $(notdir $(SHLIB)) $(SHLIBSOMAJ)
> + 	ln -sf $(notdir $(SHLIBSOMAJ)) $(SHLIBSO)
> +
> + tcpd:	tcpd.o $(SHLIB)
> +-	$(CC) $(CFLAGS) -o $@ tcpd.o $(SHLIBFLAGS)
> ++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ tcpd.o $(SHLIBFLAGS)
> +
> + miscd:	miscd.o $(LIB)
> +-	$(CC) $(CFLAGS) -o $@ miscd.o $(LIB) $(LIBS)
> ++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ miscd.o $(LIB) $(LIBS)
> +
> + safe_finger: safe_finger.o $(SHLIB)
> +-	$(CC) $(CFLAGS) -o $@ safe_finger.o $(SHLIBFLAGS)
> ++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ safe_finger.o $(SHLIBFLAGS)
> +
> + TCPDMATCH_OBJ = tcpdmatch.o fakelog.o inetcf.o scaffold.o
> +
> + tcpdmatch: $(TCPDMATCH_OBJ) $(SHLIB)
> +-	$(CC) $(CFLAGS) -o $@ $(TCPDMATCH_OBJ) $(SHLIBFLAGS)
> ++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(TCPDMATCH_OBJ) $(SHLIBFLAGS)
> +
> + try-from: try-from.o fakelog.o $(SHLIB)
> +-	$(CC) $(CFLAGS) -o $@ try-from.o fakelog.o $(SHLIBFLAGS)
> ++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ try-from.o fakelog.o $(SHLIBFLAGS)
> +
> + TCPDCHK_OBJ = tcpdchk.o fakelog.o inetcf.o scaffold.o
> +
> + tcpdchk: $(TCPDCHK_OBJ) $(SHLIB)
> +-	$(CC) $(CFLAGS) -o $@ $(TCPDCHK_OBJ) $(SHLIBFLAGS)
> ++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(TCPDCHK_OBJ) $(SHLIBFLAGS)
> +
> + shar:	$(KIT)
> + 	@shar $(KIT)
> diff --git a/recipes/tcp-wrappers/tcp-wrappers_7.6.bb b/recipes/tcp-wrappers/tcp-wrappers_7.6.bb
> index a047c55..1f1afc1 100644
> --- a/recipes/tcp-wrappers/tcp-wrappers_7.6.bb
> +++ b/recipes/tcp-wrappers/tcp-wrappers_7.6.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Tools for monitoring and filtering incoming requests for tcp \
>   LICENSE = "tcp-wrappers"
>   PRIORITY = "optional"
>   SECTION = "console/network"
> -PR ="r2"
> +PR ="r3"
>
>
>   PACKAGES = "${PN}-dbg libwrap libwrap-doc libwrap-dev tcp-wrappers tcp-wrappers-doc"
> @@ -35,6 +35,7 @@ SRC_URI = "ftp://ftp.porcupine.org/pub/security/tcp_wrappers_${PV}.tar.gz \
>              file://siglongjmp;patch=1 \
>              file://size_t;patch=1 \
>              file://tcpdchk_libwrapped;patch=1 \
> +           file://ldflags;patch=1 \
>              \
>              file://try-from.8 \
>              file://safe_finger.8"




