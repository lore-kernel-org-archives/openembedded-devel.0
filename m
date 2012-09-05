Received: from outrightsolutions.nl ([194.145.201.26]
	helo=mail.outrightsolutions.nl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sander@outrightsolutions.nl>) id 1T9HkZ-0001tf-AY
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 17:42:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.outrightsolutions.nl (Postfix) with ESMTP id 9E6FD5BC388
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2012 17:30:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at outrightsolutions.nl
Received: from mail.outrightsolutions.nl ([127.0.0.1])
	by localhost (hydrogen.outrightsolutions.nl [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id DmLesejg7xDr
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2012 17:30:18 +0200 (CEST)
Received: from [IPv6:2a02:2308::1ab:f800:2] (unknown
	[IPv6:2a02:2308::1ab:f800:2])
	by mail.outrightsolutions.nl (Postfix) with ESMTPSA id C778B5BC332
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2012 17:30:18 +0200 (CEST)
Message-ID: <50476FFC.1030206@outrightsolutions.nl>
Date: Wed, 05 Sep 2012 17:30:04 +0200
From: Sander van Grieken <sander@outrightsolutions.nl>
Organization: Outright Solutions
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1346852108-16462-1-git-send-email-sander@outrightsolutions.nl>
	<1346852108-16462-2-git-send-email-sander@outrightsolutions.nl>
	<k27l12$e10$2@ger.gmane.org>
In-Reply-To: <k27l12$e10$2@ger.gmane.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH 2/2] ifuse: add recipe to expose files on Apple devices via fuse
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
X-List-Received-Date: Wed, 05 Sep 2012 15:42:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 09/05/2012 03:45 PM, Koen Kooi wrote:
> Op 05-09-12 15:35, Sander van Grieken schreef:
> > Signed-off-by: Sander van Grieken <sander@outrightsolutions.nl> ---
> > meta-oe/recipes-connectivity/ifuse/ifuse_1.1.2.bb |   16
> > ++++++++++++++++ 1 file changed, 16 insertions(+) create mode 100644
> > meta-oe/recipes-connectivity/ifuse/ifuse_1.1.2.bb
>
> > diff --git a/meta-oe/recipes-connectivity/ifuse/ifuse_1.1.2.bb
> > b/meta-oe/recipes-connectivity/ifuse/ifuse_1.1.2.bb new file mode 100644
> > index 0000000..07131d6 --- /dev/null +++
> > b/meta-oe/recipes-connectivity/ifuse/ifuse_1.1.2.bb @@ -0,0 +1,16 @@
>
> Missing DESCRIPTION
>
> > +LICENSE = "LGPLv2.1" +LIC_FILES_CHKSUM =
> > "file://COPYING;md5=6ab17b41640564434dda85c06b7124f7" +HOMEPAGE
> > ="http://www.libimobiledevice.org/" + +DEPENDS = "fuse libimobiledevice"
> > + +PR = "r0"
>
> Default, drop that
>
> > + +SRC_URI = " \ +
> > http://www.libimobiledevice.org/downloads/ifuse-${PV}.tar.bz2 \ +    " +
> > +SRC_URI[md5sum] = "4152526b2ac3c505cb41797d997be14d"
> +SRC_URI[sha256sum]
> > = "47835c8afb72588b3202fe0b206d7ea37a68663d9aa4eaf73f0a4bcb6215fc05" +
> > +inherit autotools pkgconfig
>
> And I suspect you need to add:
>
> RRECOMMENDS_${PN} =+ "kernel-module-fuse"
>
Isn't that done by 'fuse' ?

>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



