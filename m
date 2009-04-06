Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LqpZE-0005Be-1M
	for openembedded-devel@openembedded.org; Mon, 06 Apr 2009 16:13:20 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LqpWU-00007s-Q2
	for openembedded-devel@openembedded.org; Mon, 06 Apr 2009 14:10:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 06 Apr 2009 14:10:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 06 Apr 2009 14:10:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 06 Apr 2009 16:03:05 +0200
Message-ID: <grd22p$rdt$4@ger.gmane.org>
References: <1239020353-6991-1-git-send-email-jeremy.laine@bolloretelecom.eu>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <1239020353-6991-1-git-send-email-jeremy.laine@bolloretelecom.eu>
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
Subject: Re: [STABLE][PATCH] pth: use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Mon, 06 Apr 2009 14:13:26 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06-04-09 14:19, Jeremy Lainé wrote:
> From: Jeremy Lainé<jeremy.laine@m4x.org>

You're fixing stuff faster than my buildmachine can build :) Anyway, it 
has caught up, so:

Acked-by: Koen Kooi <koen@openembedded.org>


>
>
> Signed-off-by: Jeremy Lainé<jeremy.laine@m4x.org>
> ---
>   recipes/pth/files/ldflags.patch |   16 ++++++++++++++++
>   recipes/pth/pth_2.0.2.bb        |    3 ++-
>   2 files changed, 18 insertions(+), 1 deletions(-)
>   create mode 100644 recipes/pth/files/ldflags.patch
>
> diff --git a/recipes/pth/files/ldflags.patch b/recipes/pth/files/ldflags.patch
> new file mode 100644
> index 0000000..9537ca8
> --- /dev/null
> +++ b/recipes/pth/files/ldflags.patch
> @@ -0,0 +1,16 @@
> +diff -urN pth-2.0.2.orig/Makefile.in pth-2.0.2/Makefile.in
> +--- pth-2.0.2.orig/Makefile.in	2004-07-13 10:48:10.000000000 +0000
> ++++ pth-2.0.2/Makefile.in	2009-04-06 12:12:37.000000000 +0000
> +@@ -168,10 +168,10 @@
> +
> + #   build the static and possibly shared libraries
> + libpth.la: $(LOBJS)
> +-	$(LIBTOOL) --mode=link --quiet $(CC) -o libpth.la $(LOBJS) \
> ++	$(LIBTOOL) --mode=link --quiet $(CC) $(LDFLAGS) -o libpth.la $(LOBJS) \
> + 	-rpath $(libdir) -version-info `$(SHTOOL) version -lc -dlibtool $(_VERSION_FILE)`
> + libpthread.la: pthread.lo $(LOBJS)
> +-	$(LIBTOOL) --mode=link --quiet $(CC) -o libpthread.la pthread.lo $(LOBJS) \
> ++	$(LIBTOOL) --mode=link --quiet $(CC) $(LDFLAGS) -o libpthread.la pthread.lo $(LOBJS) \
> + 	-rpath $(libdir) -version-info `$(SHTOOL) version -lc -dlibtool $(_VERSION_FILE)`
> +
> + #   build the manual pages
> diff --git a/recipes/pth/pth_2.0.2.bb b/recipes/pth/pth_2.0.2.bb
> index 81b8a71..2583e03 100644
> --- a/recipes/pth/pth_2.0.2.bb
> +++ b/recipes/pth/pth_2.0.2.bb
> @@ -2,10 +2,11 @@ DESCRIPTION = "GNU Portable Threads"
>   SECTION = "libs"
>   PRIORITY = "optional"
>   LICENSE = "GPL LGPL FDL"
> -PR = "r1"
> +PR = "r2"
>
>   SRC_URI = "${GNU_MIRROR}/pth/pth-${PV}.tar.gz \
>   	   file://m4-warning.patch;patch=1 \
> +	   file://ldflags.patch;patch=1 \
>   	  "
>
>   PARALLEL_MAKE=""




