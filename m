Received: from smtplq-out12.aruba.it ([62.149.158.32] helo=smtplq03.aruba.it)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <pierluigi.passaro@phoenixsoftware.it>)
	id 1PO88E-0004uw-P5 for openembedded-devel@lists.openembedded.org;
	Thu, 02 Dec 2010 13:19:27 +0100
Received: (qmail 26910 invoked by uid 89); 2 Dec 2010 12:17:53 -0000
Received: from unknown (HELO smtp3.aruba.it) (62.149.158.223)
	by smtplq03.aruba.it with SMTP; 2 Dec 2010 12:17:53 -0000
Received: (qmail 4090 invoked by uid 89); 2 Dec 2010 12:17:53 -0000
Received: from unknown (HELO ?192.168.1.65?)
	(pierluigi.passaro@phoenixsoftware.it@94.33.39.20)
	by smtp3.ad.aruba.it with SMTP; 2 Dec 2010 12:17:53 -0000
Message-ID: <4CF78E73.7010401@phoenixsoftware.it>
Date: Thu, 02 Dec 2010 13:17:55 +0100
From: Pierluigi Passaro <pierluigi.passaro@phoenixsoftware.it>
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 62.149.158.32
X-SA-Exim-Mail-From: pierluigi.passaro@phoenixsoftware.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: release-2010.12: PHP build issues
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
X-List-Received-Date: Thu, 02 Dec 2010 12:19:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,
I still have problem compiling PHP 5.2.13 with release-2010.12 branch.

I fixed the problem with the following patch regarding iconv option. Can 
anyone confirm the issue?

Thanks
Regards
Pierluigi

--- a/recipes/php/php_5.2.13.bb
+++ b/recipes/php/php_5.2.13.bb
@@ -21,7 +21,7 @@ export LIBS=" -lpthread "
 
 EXTRA_OECONF = "    --enable-mbstring \
                     --enable-discard-path \
-                    --disable-iconv \
+                    --without-iconv \
                     --enable-sockets \
                     --enable-shared \
                     --enable-pcntl \

-- 
Ing. Pierluigi Passaro
Via Pasqualigo 31
30174 Venezia Mestre
Cel: +39 348 355 4119
Tel: +39 041 862 3373
Fax: +39 041 862 3173
Web: www.phoenixsoftware.it
P.IVA 03884060272



