Received: from [213.39.232.198] (helo=mail.fh-wedel.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <di@fh-wedel.de>) id 1LxJhV-0001HY-BM
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Apr 2009 13:36:14 +0200
Received: by mail.fh-wedel.de (Postfix, from userid 959)
	id 764D9547D3; Fri, 24 Apr 2009 13:31:28 +0200 (CEST)
Date: Fri, 24 Apr 2009 13:31:28 +0200
From: Martin Dietze <di@fh-wedel.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090424113128.GA13714@fh-wedel.de>
References: <20090424092913.GA8700@fh-wedel.de>
	<200904241145.28702.marcin@juszkiewicz.com.pl>
	<20090424112301.GI12936@fh-wedel.de>
MIME-Version: 1.0
In-Reply-To: <20090424112301.GI12936@fh-wedel.de>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: modprobe: invalid lines in etc/modutils/hostap_cs.conf?
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
X-List-Received-Date: Fri, 24 Apr 2009 11:36:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, April 24, 2009, Martin Dietze wrote:

> On Fri, April 24, 2009, Marcin Juszkiewicz wrote:
> 
> > That was done for 2.6 kernel.
> 
> ... which means that we could actually make this configuration
> file kernel version dependent and provide none or a different
> version of it for 2.4 kernels? Actually in my case the file

How about this patch?

> ---------- SNIP ----------

diff --git a/recipes/hostap/hostap-conf_1.0.bb b/recipes/hostap/hostap-conf_1.0.bb
index e0909dd..b13eb1d 100644
--- a/recipes/hostap/hostap-conf_1.0.bb
+++ b/recipes/hostap/hostap-conf_1.0.bb
@@ -7,20 +7,23 @@ PACKAGE_ARCH = "all"
 PR = "r9"

 SRC_URI = "file://hostap_cs.conf \
-           file://hostap_cs.modalias \
            file://hostap_cs.conf-upstream"

+SRC_URI_append = '${@base_conditional("KERNEL_MAJOR_VERSION", "2.6", " file://hostap_cs.modalias  ", "",d)}'
+
 do_compile() {
 }

 do_install() {
         install -d ${D}${sysconfdir}/pcmcia
-        install -d ${D}${sysconfdir}/modutils

         install -m 0644 ${WORKDIR}/hostap_cs.conf-upstream ${D}${sysconfdir}/pcmcia/hostap_cs.conf
        cat ${WORKDIR}/hostap_cs.conf >>${D}${sysconfdir}/pcmcia/hostap_cs.conf

-       install -m 0644 ${WORKDIR}/hostap_cs.modalias ${D}${sysconfdir}/modutils/hostap_cs.conf
+        if [ -r ${WORKDIR}/hostap_cs.modalias ]; then
+               install -d ${D}${sysconfdir}/modutils
+               install -m 0644 ${WORKDIR}/hostap_cs.modalias ${D}${sysconfdir}/modutils/hostap_cs.conf
+       fi
 }

 pkg_postinst () {

> ---------- SNIP ----------

Cheers,

Martin

-- 
----------- / http://herbert.the-little-red-haired-girl.org / -------------
=+= 
Wie verhindert man, dass einem die Geige gestohlen wird?
Man legt sie in einen Bratschenkasten...


