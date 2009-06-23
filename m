Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MJ2y5-00086p-1B
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 12:11:09 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MJ2nK-0001te-U1
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 10:00:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 10:00:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 10:00:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 23 Jun 2009 11:13:58 +0200
Message-ID: <h1q6cn$a5v$9@ger.gmane.org>
References: <200906230940.05121.marcin@juszkiewicz.com.pl>
	<1245747417-11163-3-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <1245747417-11163-3-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 054/125] netpbm: Make this aware of LDFLAGS, fixes QA GNU_HASH issue
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
X-List-Received-Date: Tue, 23 Jun 2009 10:11:09 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-06-09 10:56, Marcin Juszkiewicz wrote:
> From: Tim 'timtim' Ellis<tim.ellis@foonas.org>
>
>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>   recipes/netpbm/netpbm-10.28/libgnuhash.patch |   12 ++++++++++++
>   recipes/netpbm/netpbm_10.28.bb               |    3 ++-
>   2 files changed, 14 insertions(+), 1 deletions(-)
>   create mode 100644 recipes/netpbm/netpbm-10.28/libgnuhash.patch
>
> diff --git a/recipes/netpbm/netpbm-10.28/libgnuhash.patch b/recipes/netpbm/netpbm-10.28/libgnuhash.patch
> new file mode 100644
> index 0000000..3df92ca
> --- /dev/null
> +++ b/recipes/netpbm/netpbm-10.28/libgnuhash.patch
> @@ -0,0 +1,12 @@
> +diff -urN netpbm-10.28.old/lib/Makefile netpbm-10.28/lib/Makefile
> +--- netpbm-10.28.old/lib/Makefile	2005-02-05 18:47:27.000000000 +0000
> ++++ netpbm-10.28/lib/Makefile	2009-05-12 13:33:10.000000000 +0100
> +@@ -111,7 +111,7 @@
> + 	rm -f $@
> + 	$(SYMLINK) $<  $@
> + libnetpbm.$(NETPBMLIBSUFFIX).$(MAJ).$(MIN): $(LIBOBJECTS) $(LIBOBJECTS_X)
> +-	$(LD) $(LDSHLIB) -o $@ $(LIBOBJECTS) $(LIBOBJECTS_X) \
> ++	$(LD) $(LDFLAGS) $(LDSHLIB) -o $@ $(LIBOBJECTS) $(LIBOBJECTS_X) \
> +           $(SHLIB_CLIB) $(LADD)
> + endif
> +
> diff --git a/recipes/netpbm/netpbm_10.28.bb b/recipes/netpbm/netpbm_10.28.bb
> index 8469074..2672e4a 100644
> --- a/recipes/netpbm/netpbm_10.28.bb
> +++ b/recipes/netpbm/netpbm_10.28.bb
> @@ -25,10 +25,11 @@ RDEPENDS = "perl\
>   RDEPENDS += "perl-module-exporter-heavy"
>   RDEPENDS += "perl-module-file-spec-unix"
>
> -PR = "r6"
> +PR = "r7"
>
>   SRC_URI = "${SOURCEFORGE_MIRROR}/netpbm/netpbm-${PV}.tgz \
>   	   file://ppmtojpeg.patch;patch=42 \
> +	   file://libgnuhash.patch;patch=1 \
>   	   file://Makefile.config \
>   	   file://oeendiangen"
>




