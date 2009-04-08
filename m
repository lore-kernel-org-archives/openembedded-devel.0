Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vhdirk@gmail.com>) id 1LrNkD-0005jC-Ig
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 04:42:32 +0200
Received: by ewy20 with SMTP id 20so2677040ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Apr 2009 19:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:from:date:message-id:subject:to:cc:content-type;
	bh=01uMp71tyBgbYXocobSOSm8BTiF1u3ujRBYPvK134yA=;
	b=fYE62vM2TqsJmpAztcODYlksJDX2oAZPbeL1Ap4DArFvj4hhDwOifC7n7b4JdWEOWj
	P706xyYU7AUHdfwGWo6kqielwhicO2FLcDFxKQlpEiGwKT0gSkhPbx4oJopJ+j2rgqtZ
	9n2ULg34k3YMPzsV9bTYOBau75t1XLyBCZt/A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=b31Ve8zMpcFiJ4b7O3CD9e8vs1nbesO2JL7AWVLYboFPH7EsABmo5d/FxJq7PwChrR
	PA4TNplsMSBo1kTXfb6BubgWHnO7ekyNNPVRKfOUOUuyib8Fv7C839jJKx0R+tpHxr8T
	t3GsvZgFiQnQAKIkJrmii8TIxEJR4JeXcFInI=
MIME-Version: 1.0
Received: by 10.216.45.71 with SMTP id o49mr196444web.57.1239158367591; Tue, 
	07 Apr 2009 19:39:27 -0700 (PDT)
In-Reply-To: <1239157879-25742-1-git-send-email-vhdirk@gmail.com>
References: <1239157879-25742-1-git-send-email-vhdirk@gmail.com>
From: Dirk Van Haerenborgh <vhdirk@gmail.com>
Date: Wed, 8 Apr 2009 04:39:12 +0200
Message-ID: <eaa8e5210904071939l6d05b88cwfc96d86faaf69eec@mail.gmail.com>
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
X-List-Received-Date: Wed, 08 Apr 2009 02:42:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Oops, please discard this one, I forgot something


-Dirk

2009/4/8 Dirk 'Virk' Van Haerenborgh <vhdirk@gmail.com>

> gsoap-native: unbreak self-dependency patch included
> FILES_${PN} includes {datadir} as soapcpp2 is some sort of compiler which
> needs the headers in datadir in order to be able to compile its
> soap stuff properly
>
>
> ---
>  .../use-just-built-binary-2.7.13.patch             |   12 ++++++++++++
>  recipes/gsoap/gsoap-native_2.7.13.bb               |   12 ++++++++++++
>  recipes/gsoap/gsoap_2.7.13.bb                      |    6 ++++++
>  recipes/gsoap/gsoap_2.7.13.inc                     |   15 +++++++++++++++
>  4 files changed, 45 insertions(+), 0 deletions(-)
>  create mode 100644
> recipes/gsoap/gsoap-native/use-just-built-binary-2.7.13.patch
>  create mode 100644 recipes/gsoap/gsoap-native_2.7.13.bb
>  create mode 100644 recipes/gsoap/gsoap_2.7.13.bb
>  create mode 100644 recipes/gsoap/gsoap_2.7.13.inc
>
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

