Received: from [124.219.5.209] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john_lee@openmoko.com>) id 1JmYHP-00040k-Eq
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Apr 2008 19:52:15 +0200
Received: from [172.16.23.111] (helo=buddha.tw.openmoko.com)
	by aakash.openmoko.org with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <john_lee@openmoko.com>)
	id 1JmYHB-0003UU-DN for openembedded-devel@lists.openembedded.org;
	Fri, 18 Apr 2008 01:52:11 +0800
Received: from john by buddha.tw.openmoko.com with local (Exim 4.69)
	(envelope-from <john_lee@openmoko.com>) id 1JmYH0-0006rk-FL
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Apr 2008 01:51:50 +0800
Date: Fri, 18 Apr 2008 01:51:50 +0800
From: John Lee <john_lee@openmoko.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20080417175150.GJ31895@buddha.tw.openmoko.com>
Mail-Followup-To: openembedded-devel
	<openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
X-SA-Exim-Connect-IP: 172.16.23.111
X-SA-Exim-Mail-From: john_lee@openmoko.com
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: RDEPENDS_${PN}-dev = ${PN} badness
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Apr 2008 17:52:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Take gtk-doc-dev for example:

The gtk-doc package is empty, so it will not be created.  However, if
you install gtk-doc-dev, it RDEPENDS on gtk-doc, which cannot be
found.  The install will fail.

I think we should use

RRECOMMENDS_${PN}-dev = "${PN} (= ${DEBPV})"

instead.

We (Julian Chu and me) found this when digging the cause of
meta-toolchain-openmoko build failure.  task-openmoko-toolchain-target
contains quite a few -dev packages in it, so the opkg-cl install will
fail.  The log looks something like this:

ERROR: Cannot satisfy the following dependencies for
         task-openmoko-toolchain-target: gtk-doc (= 1.0-r1)
         util-macros (= 1:1.1.5-r1) renderproto (= 1:0.9.3-r0) xproto
         (= 1:7.0.10-r1) bigreqsproto (= 1:1.0.2-r1) xextproto (=
         1:7.0.2-r1) xtrans (= 1:1.0.4-r0) xcmiscproto (= 1:1.1.2-r1)
         xf86bigfontproto (= 1:1.1.2-r1) kbproto (= 1:1.0.3-r1)
         inputproto (= 1:1.4.2.1-r0) fixesproto (= 1:4.0-r1)
         xineramaproto (= 1:1.1.2-r1) randrproto (= 1:1.2.1-r1)
         compositeproto (= 1:0.4-r0) damageproto (= 1:1.1.0-r1)

Similiar symptoms can be found in the packages above.

Regards,
John


