Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vhdirk@gmail.com>) id 1LrOIN-0006QJ-64
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 05:17:49 +0200
Received: by ewy20 with SMTP id 20so2683839ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Apr 2009 20:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:from:date:message-id:subject:to:cc:content-type;
	bh=sJpFQpffklaEXTbJoXL62rl46qvtAXbY++P3ANZvxS0=;
	b=c02cKbCvDXihmHvyoQ466RtsgthHDatHi+ZuGqM+lJlM6oqyZJ4kkXyF8mpHr9kKNz
	yG9l1E87SexMLJDEfQC8DuNXVmQpFJIkqMK//WYkgEu/dWYeLLvUYD5Tt0LqgvkkGhjd
	yfNfZCb3ULSq+GSU826mRP5CFPaY41uij3UaI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=MRuPMlMgolNoDxWCSNaQZdXEb6F6dO55fcYLCrvi8nZrrHJRgfvqAC0KBUH3rTI1eq
	xkOyuYDwOnPWMbSb36AcIyXSygamdm518poXWey5UT8gIWzMwQvkY8us12C36so5DF+3
	bkU1LFspFdqcFeFWzKedXorOs9sL3YuzAtTvw=
MIME-Version: 1.0
Received: by 10.216.19.68 with SMTP id m46mr204097wem.7.1239160485191; Tue, 07 
	Apr 2009 20:14:45 -0700 (PDT)
In-Reply-To: <1239159659-14713-1-git-send-email-vhdirk@gmail.com>
References: <1239159659-14713-1-git-send-email-vhdirk@gmail.com>
From: Dirk Van Haerenborgh <vhdirk@gmail.com>
Date: Wed, 8 Apr 2009 05:14:30 +0200
Message-ID: <eaa8e5210904072014l41196f45m24aa6b5e66a0fc4@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.172
X-SA-Exim-Mail-From: vhdirk@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RDNS_NONE,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
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
X-List-Received-Date: Wed, 08 Apr 2009 03:17:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

excuse me.

I should've listened: commited while tired and forgot to commit the updated
bb file.

discard this one as well please

-Dirk




2009/4/8 Dirk 'Virk' Van Haerenborgh <vhdirk@gmail.com>

> gsoap-native: unbreak self-dependency patch included
>
> FILES_${PN} includes {datadir} as soapcpp2 is some sort of compiler which
> needs the headers in datadir in order to be able to compile its
> soap stuff properly
> ---
>  conf/checksums.ini                                 |    4 ++++
>  .../use-just-built-binary-2.7.13.patch             |   12 ++++++++++++
>  recipes/gsoap/gsoap-native_2.7.13.bb               |   12 ++++++++++++
>  recipes/gsoap/gsoap_2.7.13.bb                      |    6 ++++++
>  recipes/gsoap/gsoap_2.7.13.inc                     |   15 +++++++++++++++
>  5 files changed, 49 insertions(+), 0 deletions(-)
>  create mode 100644
> recipes/gsoap/gsoap-native/use-just-built-binary-2.7.13.patch
>  create mode 100644 recipes/gsoap/gsoap-native_2.7.13.bb
>  create mode 100644 recipes/gsoap/gsoap_2.7.13.bb
>  create mode 100644 recipes/gsoap/gsoap_2.7.13.inc
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index e864714..c6300d9 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -9278,6 +9278,10 @@
> sha256=5149991a219e8f2059350ed9d52bb110c0695da6eb9fe256e9e213e69f83929f
>  md5=5bfa5605d9565ff01138d7a574cc2614
>  sha256=fc029984019736eab2b0f10ce28d48ff88f8ceed7a1739cb4b71b851c4b89b91
>
> +[http://downloads.sourceforge.net/gsoap2/gsoap_2.7.13.tar.gz]
> +md5=fffb49eb1db7ff03643a4313115dc3b1
> +sha256=3d40a528b8f3309f392945dca2ecaee5a698f4ee00a6036907a57c4f25a6a479
> +
>  [http://downloads.sourceforge.net/gsoap2/gsoap_2.7.7.tar.gz]
>  md5=a0bbbfdc135034cd778537f979121df7
>  sha256=7b531f1b6481fbe1a21620a86649f42cb2de9cf086e7bdde46335137d3ca11dc
> diff --git a/recipes/gsoap/gsoap-native/use-just-built-binary-2.7.13.patch
> b/recipes/gsoap/gsoap-native/use-just-built-binary-2.7.13.patch
> new file mode 100644
> index 0000000..25a8ef0
> --- /dev/null
> +++ b/recipes/gsoap/gsoap-native/use-just-built-binary-2.7.13.patch
> @@ -0,0 +1,12 @@
> +diff -urN gsoap-2.7.orig/gsoap/wsdl/Makefile.am
> gsoap-2.7.orig/gsoap/wsdl/Makefile.am
> +--- gsoap-2.7.orig/gsoap/wsdl/Makefile.am      2009-03-21
> 22:24:42.000000000 +0100
> ++++ gsoap-2.7.orig/gsoap/wsdl/Makefile.am      2009-04-07
> 11:30:50.000000000 +0200
> +@@ -17,7 +17,7 @@ BUILT_SOURCES=$(SOAP_CPP_SRC)
> + # WSDL2H_EXTRA_LIBS=-lssl -lcrypto -lz # defined in configure.in
> +
> + $(SOAP_CPP_SRC) : $(SOAPHEADER)
> +-      $(SOAP) $(SOAP_FLAGS) $(SOAPHEADER)
> ++      ../src/soapcpp2 $(SOAP_FLAGS) $(SOAPHEADER)
> +
> + #LIBS=
> +
> diff --git a/recipes/gsoap/gsoap-native_2.7.13.bb b/recipes/gsoap/
> gsoap-native_2.7.13.bb
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
> +       :
> +}
> +
> diff --git a/recipes/gsoap/gsoap_2.7.13.bb b/recipes/gsoap/gsoap_2.7.13.bb
> new file mode 100644
> index 0000000..c5b0ae8
> --- /dev/null
> +++ b/recipes/gsoap/gsoap_2.7.13.bb
> @@ -0,0 +1,6 @@
> +require gsoap_${PV}.bb
> +
> +DEPENDS = "gsoap-native"
> +
> +FILES_${PN} = "${bindir}/wsdl2h ${bindir}/soapcpp2"
> +FILES_${PN} += "${datadir}"
> diff --git a/recipes/gsoap/gsoap_2.7.13.inc
> b/recipes/gsoap/gsoap_2.7.13.inc
> new file mode 100644
> index 0000000..a6fbbb5
> --- /dev/null
> +++ b/recipes/gsoap/gsoap_2.7.13.inc
> @@ -0,0 +1,15 @@
> +DESCRIPTION = "The gSOAP toolkit provides a unique SOAP-to-C/C++ language
> binding \
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
> --
> 1.6.0.4
>
>

