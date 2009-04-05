Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LqTWj-0000e2-SY
	for openembedded-devel@openembedded.org; Sun, 05 Apr 2009 16:40:54 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LqTU3-0000xg-7R
	for openembedded-devel@openembedded.org; Sun, 05 Apr 2009 14:38:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 05 Apr 2009 14:38:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 05 Apr 2009 14:38:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 05 Apr 2009 16:37:51 +0200
Message-ID: <grafnv$2h4$1@ger.gmane.org>
References: <1238927750-17603-1-git-send-email-jeremy.laine@bolloretelecom.eu>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <1238927750-17603-1-git-send-email-jeremy.laine@bolloretelecom.eu>
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
Subject: Re: [STABLE][PATCH] libpcap: add patch to use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Sun, 05 Apr 2009 14:40:55 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05-04-09 12:35, Jeremy Lainé wrote:
> From: Jeremy Lainé<jeremy.laine@m4x.org>

Acked-by: Koen Kooi <koen@openembedded.org>

>
>
> Signed-off-by: Jeremy Lainé<jeremy.laine@m4x.org>
> ---
>   recipes/libpcap/libpcap-1.0.0/ldflags.patch |   12 ++++++++++++
>   recipes/libpcap/libpcap_1.0.0.bb            |    3 ++-
>   2 files changed, 14 insertions(+), 1 deletions(-)
>   create mode 100644 recipes/libpcap/libpcap-1.0.0/ldflags.patch
>
> diff --git a/recipes/libpcap/libpcap-1.0.0/ldflags.patch b/recipes/libpcap/libpcap-1.0.0/ldflags.patch
> new file mode 100644
> index 0000000..66ab5f7
> --- /dev/null
> +++ b/recipes/libpcap/libpcap-1.0.0/ldflags.patch
> @@ -0,0 +1,12 @@
> +diff -urN libpcap-1.0.0.orig/Makefile.in libpcap-1.0.0/Makefile.in
> +--- libpcap-1.0.0.orig/Makefile.in	2008-10-28 01:26:13.000000000 +0000
> ++++ libpcap-1.0.0/Makefile.in	2009-04-02 13:54:20.000000000 +0000
> +@@ -326,7 +326,7 @@
> + #
> + libpcap.so: $(OBJ)
> + 	@rm -f $@
> +-	$(CC) -shared -Wl,-soname,$@.1 -o $@.`cat $(srcdir)/VERSION` $(OBJ) $(DAGLIBS)
> ++	$(CC) $(LDFLAGS) -shared -Wl,-soname,$@.1 -o $@.`cat $(srcdir)/VERSION` $(OBJ) $(DAGLIBS)
> +
> + #
> + # The following rule succeeds, but the result is untested.
> diff --git a/recipes/libpcap/libpcap_1.0.0.bb b/recipes/libpcap/libpcap_1.0.0.bb
> index b85bf4c..6dfc056 100644
> --- a/recipes/libpcap/libpcap_1.0.0.bb
> +++ b/recipes/libpcap/libpcap_1.0.0.bb
> @@ -1,9 +1,10 @@
>   require libpcap.inc
>
> -PR = "r5"
> +PR = "r6"
>   SRC_URI = "http://www.tcpdump.org/release/libpcap-${PV}.tar.gz"
>   SRC_URI += "file://aclocal.patch;patch=1"
>   SRC_URI += "file://ieee80215-arphrd.patch;patch=1"
> +SRC_URI += "file://ldflags.patch;patch=1"
>
>   do_compile () {
>       oe_runmake




