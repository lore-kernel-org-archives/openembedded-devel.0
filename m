Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LV7Gd-0005Wg-0T
	for openembedded-devel@openembedded.org; Thu, 05 Feb 2009 17:39:57 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LV7GK-00048p-12
	for openembedded-devel@openembedded.org; Thu, 05 Feb 2009 16:39:36 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 05 Feb 2009 16:39:36 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 05 Feb 2009 16:39:36 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 05 Feb 2009 17:39:27 +0100
Message-ID: <gmf4nv$lmm$1@ger.gmane.org>
References: <200902051836.25770.roman@khimov.ru>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090131 Shredder/3.0b2pre
In-Reply-To: <200902051836.25770.roman@khimov.ru>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] New package: byacc
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
X-List-Received-Date: Thu, 05 Feb 2009 16:40:09 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05-02-09 16:36, Roman I Khimov wrote:
> Hello everyone.
>
> The package is mostly intended to be built as native and then used to build
> other packages. It's trivial and I thought it might be useful for someone
> else too, hence, trying to push.

Does 'ftp://invisible-island.net/byacc/byacc.tar.gz' change from time to 
time?

regards,

Koen



>
> diff -puraN /void/byacc_20081225.bb packages/byacc/byacc_20081225.bb
> --- a/packages/byacc/byacc_20081225.bb	1970-01-01 03:00:00.000000000 +0300
> +++ b/packages/byacc/byacc_20081225.bb	2009-02-03 22:51:24.811593078 +0300
> @@ -0,0 +1,13 @@
> +DESCRIPTION = "Berkeley Yacc"
> +SECTION = "devel"
> +LICENSE = "public domain"
> +PR = "r0"
> +
> +SRC_URI = "ftp://invisible-island.net/byacc/byacc.tar.gz"
> +EXTRA_OECONF += "--program-transform-name='s,^,b,'"
> +
> +inherit autotools
> +
> +do_configure() {
> +	oe_runconf
> +}
> diff -puraN /void/byacc-native_20081225.bb
> packages/byacc/byacc-native_20081225.bb
> --- a/packages/byacc/byacc-native_20081225.bb	1970-01-01 03:00:00.000000000
> +0300
> +++ b/packages/byacc/byacc-native_20081225.bb	2009-02-03 15:36:55.981948513
> +0300
> @@ -0,0 +1,4 @@
> +SECTION = "devel"
> +require byacc_${PV}.bb
> +S = "${WORKDIR}/byacc-${PV}"
> +inherit native
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 8339981..07e3733 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -25042,3 +25042,6 @@
> sha256=5cc1a53bb909922596bdd0fa967b654fe1bfbe0dcf1d34608f0b7c90e0c27867
>   md5=5f7b88ebb2bcd7e8044328482d079661
>   sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af
>
> +[ftp://invisible-island.net/byacc/byacc.tar.gz]
> +md5=b9715b9a2867c221176b597e8f73cbc9
> +sha256=1364c7fe382de659e8b9841a1736b645345a460d2f4302303e80c02235a2a575
>
>
>
>
> ------------------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




