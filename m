Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LrXfJ-0007LX-1v
	for openembedded-devel@openembedded.org; Wed, 08 Apr 2009 15:18:12 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LrXcM-0006fQ-8s
	for openembedded-devel@openembedded.org; Wed, 08 Apr 2009 13:15:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 08 Apr 2009 13:15:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 08 Apr 2009 13:15:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 08 Apr 2009 15:14:40 +0200
Message-ID: <gri800$a6q$2@ger.gmane.org>
References: <1239195076-4937-1-git-send-email-vhdirk@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090405 Shredder/3.0b3pre
In-Reply-To: <1239195076-4937-1-git-send-email-vhdirk@gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] add gsoap v2.7.13, generates C/C++ source codes for Web service and client applications
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
X-List-Received-Date: Wed, 08 Apr 2009 13:18:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08-04-09 14:51, Dirk 'Virk' Van Haerenborgh wrote:
> gsoap-native: unbreak self-dependency patch included
>
> FILES_${PN} includes {datadir} as soapcpp2 is some sort of compiler which needs the headers in datadir in order to be able to compile its
> soap stuff properly
>
> (third time's the charm)

This looks good enough to me to go in.

regards,

Koen

> ---
>   conf/checksums.ini                                 |    4 ++++
>   .../use-just-built-binary-2.7.13.patch             |   12 ++++++++++++
>   recipes/gsoap/gsoap-native_2.7.13.bb               |   12 ++++++++++++
>   recipes/gsoap/gsoap_2.7.13.bb                      |   15 +++++++++++++++
>   recipes/gsoap/gsoap_2.7.13.inc                     |   15 +++++++++++++++
>   5 files changed, 58 insertions(+), 0 deletions(-)
>   create mode 100644 recipes/gsoap/gsoap-native/use-just-built-binary-2.7.13.patch
>   create mode 100644 recipes/gsoap/gsoap-native_2.7.13.bb
>   create mode 100644 recipes/gsoap/gsoap_2.7.13.bb
>   create mode 100644 recipes/gsoap/gsoap_2.7.13.inc
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index ce78b83..f7f2959 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -9278,6 +9278,10 @@ sha256=5149991a219e8f2059350ed9d52bb110c0695da6eb9fe256e9e213e69f83929f
>   md5=5bfa5605d9565ff01138d7a574cc2614
>   sha256=fc029984019736eab2b0f10ce28d48ff88f8ceed7a1739cb4b71b851c4b89b91
>
> +[http://downloads.sourceforge.net/gsoap2/gsoap_2.7.13.tar.gz]
> +md5=fffb49eb1db7ff03643a4313115dc3b1
> +sha256=3d40a528b8f3309f392945dca2ecaee5a698f4ee00a6036907a57c4f25a6a479
> +
>   [http://downloads.sourceforge.net/gsoap2/gsoap_2.7.7.tar.gz]
>   md5=a0bbbfdc135034cd778537f979121df7
>   sha256=7b531f1b6481fbe1a21620a86649f42cb2de9cf086e7bdde46335137d3ca11dc
> diff --git a/recipes/gsoap/gsoap-native/use-just-built-binary-2.7.13.patch b/recipes/gsoap/gsoap-native/use-just-built-binary-2.7.13.patch
> new file mode 100644
> index 0000000..25a8ef0
> --- /dev/null
> +++ b/recipes/gsoap/gsoap-native/use-just-built-binary-2.7.13.patch
> @@ -0,0 +1,12 @@
> +diff -urN gsoap-2.7.orig/gsoap/wsdl/Makefile.am gsoap-2.7.orig/gsoap/wsdl/Makefile.am
> +--- gsoap-2.7.orig/gsoap/wsdl/Makefile.am	2009-03-21 22:24:42.000000000 +0100
> ++++ gsoap-2.7.orig/gsoap/wsdl/Makefile.am	2009-04-07 11:30:50.000000000 +0200
> +@@ -17,7 +17,7 @@ BUILT_SOURCES=$(SOAP_CPP_SRC)
> + # WSDL2H_EXTRA_LIBS=-lssl -lcrypto -lz # defined in configure.in
> +
> + $(SOAP_CPP_SRC) : $(SOAPHEADER)
> +-	$(SOAP) $(SOAP_FLAGS) $(SOAPHEADER)
> ++	../src/soapcpp2 $(SOAP_FLAGS) $(SOAPHEADER)
> +
> + #LIBS=
> +
> diff --git a/recipes/gsoap/gsoap-native_2.7.13.bb b/recipes/gsoap/gsoap-native_2.7.13.bb
> new file mode 100644
> index 0000000..3ed78d0
> --- /dev/null
> +++ b/recipes/gsoap/gsoap-native_2.7.13.bb
> @@ -0,0 +1,12 @@
> +require gsoap_${PV}.inc
> +
> +DEPENDS = ""
> +
> +SRC_URI += "file://use-just-built-binary-2.7.13.patch;patch=1"
> +
> +inherit native
> +
> +do_install() {
> +	:
> +}
> +
> diff --git a/recipes/gsoap/gsoap_2.7.13.bb b/recipes/gsoap/gsoap_2.7.13.bb
> new file mode 100644
> index 0000000..54f89c6
> --- /dev/null
> +++ b/recipes/gsoap/gsoap_2.7.13.bb
> @@ -0,0 +1,15 @@
> +require gsoap_${PV}.inc
> +
> +DEPENDS = "gsoap-native"
> +
> +do_install_append() {
> +   install -d ${D}${libdir}
> +   for lib in libgsoapssl libgsoapssl++ libgsoap libgsoapck++ libgsoap++ libgsoapck
> +   do
> +       oe_libinstall -C gsoap $lib ${D}${libdir}
> +   done
> +}
> +
> +
> +FILES_${PN} = "${bindir}/wsdl2h ${bindir}/soapcpp2"
> +FILES_${PN} += "${datadir}"
> diff --git a/recipes/gsoap/gsoap_2.7.13.inc b/recipes/gsoap/gsoap_2.7.13.inc
> new file mode 100644
> index 0000000..a6fbbb5
> --- /dev/null
> +++ b/recipes/gsoap/gsoap_2.7.13.inc
> @@ -0,0 +1,15 @@
> +DESCRIPTION = "The gSOAP toolkit provides a unique SOAP-to-C/C++ language binding \
> +for the development of SOAP Web Services and clients."
> +SECTION = "devel"
> +LICENSE = "GPL"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/gsoap2/gsoap_${PV}.tar.gz"
> +
> +inherit autotools_stage
> +
> +S = "${WORKDIR}/gsoap-2.7"
> +
> +PARALLEL_MAKE = ""
> +
> +EXTRA_OEMAKE = "SOAP=${STAGING_BINDIR_NATIVE}/soapcpp2"
> +




