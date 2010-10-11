Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P57Ix-0005ZT-7c for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 03:35:56 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P57IW-0004s4-Qh for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 03:35:28 +0200
Received: from d75-157-9-212.bchsia.telus.net ([75.157.9.212])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 03:35:28 +0200
Received: from dfoley by d75-157-9-212.bchsia.telus.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 03:35:28 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Dallas Foley <dfoley@telus.net>
Date: Sun, 10 Oct 2010 18:35:19 -0700
Message-ID: <i8tpko$2mp$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: d75-157-9-212.bchsia.telus.net
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.12) Gecko/20100915 Thunderbird/3.0.8
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: enchant build failure
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
X-List-Received-Date: Mon, 11 Oct 2010 01:35:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I got the same build failure ashttp://tinderbox.openembedded.net/public/logs/task/8620563.txt

Could someone confirm if this is a correct fix or not.
Should I have posted this to patchwork instead ?

diff --git a/recipes/enchant/enchant_1.6.0.bb b/recipes/enchant/enchant_1.6.0.bb
index 3ef2f94..ce5da0a 100644
--- a/recipes/enchant/enchant_1.6.0.bb
+++ b/recipes/enchant/enchant_1.6.0.bb
@@ -13,7 +13,7 @@ S = "${WORKDIR}/enchant-${PV}"
  
  SRC_URI = "http://www.abisource.com/downloads/enchant/${PV}/enchant-${PV}.tar.gz"
  
-EXTRA_OECONF = "--with-aspell-prefix=${STAGING_DIR_HOST}${layout_prefix} --enable-aspell --disable-binreloc"
+EXTRA_OECONF = "--with-aspell-prefix=${STAGING_DIR_TARGET} --enable-aspell --disable-binreloc"
  
  FILES_${PN} = "${bindir} ${libdir}/*${SOLIBS} ${datadir}/${PN} ${libdir}/${PN}/*.so"
  FILES_${PN}-dev += "${libdir}/${PN}/*{SOLIBSDEV} ${libdir}/${PN}/*.la ${libdir}/${PN}/*.a"




