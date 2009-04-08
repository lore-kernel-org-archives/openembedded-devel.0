Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Lrd1k-0003T8-Th
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 21:01:44 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KHS00L3SQ11O6F7@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	08 Apr 2009 13:58:14 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B59FD6B83B5; Wed,
	08 Apr 2009 14:58:13 -0400 (EDT)
Date: Wed, 08 Apr 2009 14:58:13 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090408185813.GD14502@denix.org>
References: <1239036500-32115-1-git-send-email-jeremy.laine@bolloretelecom.eu>
	<20090408004514.GI11203@denix.org> <49DC6CB1.7080205@bolloretelecom.eu>
MIME-version: 1.0
In-reply-to: <49DC6CB1.7080205@bolloretelecom.eu>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.7
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,BAYES_00,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] gsoap: actually stage headers and	libraries..
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
X-List-Received-Date: Wed, 08 Apr 2009 19:01:44 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Apr 08, 2009 at 11:21:53AM +0200, Jeremy Lain?? wrote:
> > inherit autotools_stage?
> 
> Quite right. Attached is a better patch against stable which includes the LDFLAGS fixes
> and the staging fix.

Overall it looks Ok to me. But I have 2 questions about a proper procedure:
- should the .dev have the same fix?
- should PR be incremented by 1?

> -- 
> Jeremy LAINE
> Bollor?? telecom | 11bis, rue Scribe | F-75009 Paris

> From: Jeremy Lain?? <jeremy.laine@m4x.org>
> 
> Signed-off-by: Jeremy Lain?? <jeremy.laine@m4x.org>
> 
> diff --git a/recipes/gsoap/gsoap/rename_bogus_ldflags.patch b/recipes/gsoap/gsoap/rename_bogus_ldflags.patch
> new file mode 100644
> index 0000000..5e4a01c
> --- /dev/null
> +++ b/recipes/gsoap/gsoap/rename_bogus_ldflags.patch
> @@ -0,0 +1,12 @@
> +diff -urN gsoap-2.7.orig/soapcpp2/wsdl/Makefile.am gsoap-2.7/soapcpp2/wsdl/Makefile.am
> +--- gsoap-2.7.orig/soapcpp2/wsdl/Makefile.am	2005-07-15 21:04:42.000000000 +0000
> ++++ gsoap-2.7/soapcpp2/wsdl/Makefile.am	2009-04-06 14:22:23.000000000 +0000
> +@@ -6,7 +6,7 @@
> + AUTOMAKE_OPTIONS = foreign 1.4
> + 
> + INCLUDES=-I$(top_builddir)/soapcpp2
> +-LDFLAGS=$(INCLUDES)
> ++AM_LDFLAGS=$(INCLUDES)
> + SOAP=$(top_builddir)/soapcpp2/src/soapcpp2
> + SOAP_CPP_LIB=$(top_builddir)/soapcpp2/libgsoap++.a
> + SOAP_CPP_SRC=wsdlC.cpp
> diff --git a/recipes/gsoap/gsoap_2.7.7.bb b/recipes/gsoap/gsoap_2.7.7.bb
> index dc6ff6e..19f5751 100644
> --- a/recipes/gsoap/gsoap_2.7.7.bb
> +++ b/recipes/gsoap/gsoap_2.7.7.bb
> @@ -3,12 +3,13 @@ for the development of SOAP Web Services and clients."
>  SECTION = "devel"
>  LICENSE = "GPL"
>  DEPENDS = "gsoap-native"
> -PR = "r1"
> +PR = "r4"
>  
> -SRC_URI = "${SOURCEFORGE_MIRROR}/gsoap2/gsoap_${PV}.tar.gz"
> +SRC_URI = "${SOURCEFORGE_MIRROR}/gsoap2/gsoap_${PV}.tar.gz \
> +           file://rename_bogus_ldflags.patch;patch=1"
>  S = "${WORKDIR}/gsoap-2.7"
>  
> -inherit autotools
> +inherit autotools_stage
>  
>  PARALLEL_MAKE = ""
>  

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



