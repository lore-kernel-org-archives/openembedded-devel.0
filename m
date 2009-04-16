Received: from [213.230.128.226] (helo=fep01-svc.tim.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gremlin@gremlin.it>) id 1LuZQG-0004dQ-AD
	for openembedded-devel@openembedded.org; Thu, 16 Apr 2009 23:47:07 +0200
Received: from sesha.loc ([217.203.144.14]) by fep01-svc.tim.it
	(InterMail vM.6.01.06.03 201-2131-130-104-20060516) with ESMTP
	id <20090416212404.WHZT3169.fep01-svc.tim.it@sesha.loc>
	for <openembedded-devel@openembedded.org>;
	Thu, 16 Apr 2009 23:24:04 +0200
Message-ID: <49E7A12F.7080008@gremlin.it>
Date: Thu, 16 Apr 2009 23:20:47 +0200
From: Alessandro GARDICH <gremlin@gremlin.it>
User-Agent: Thunderbird 2.0.0.21 (X11/20090320)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
X-SA-Exim-Connect-IP: 213.230.128.226
X-SA-Exim-Mail-From: gremlin@gremlin.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_50,RCVD_IN_DNSWL_LOW,
	RDNS_NONE autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH][STABLE] rpm-native_4.4.2.3.bb
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
X-List-Received-Date: Thu, 16 Apr 2009 21:47:07 -0000
Content-Type: multipart/mixed; boundary="------------080408070201030609010506"

--------------080408070201030609010506
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

make rpm-native don't fail on Q&A checj with "non dbg contains .debug, 
rpm-native, 
/work/i686-linux/rpm-native-4.4.2.3-r15/install/rpm-native/staging/i686-linux/usr/lib/rpm/.debug/rpmq"

also on x86_64 host




-- 
  /------------------------------------------------\
|     Alessandro Gardich : gremlin#gremlin!it      |
  >------------------------------------------------<
|  I never saw a wild thing sorry for itself.      |
|  A small bird will drop frozen dead from a bough |
|  without ever having felt sorry for itself.      |
  \------------------------------------------------/

diff --git a/recipes/rpm/rpm-native_4.4.2.3.bb b/recipes/rpm/rpm-native_4.4.2.3.bb
index 287383c..f89a0f1 100644
--- a/recipes/rpm/rpm-native_4.4.2.3.bb
+++ b/recipes/rpm/rpm-native_4.4.2.3.bb
@@ -4,5 +4,7 @@ require rpm-${PV}.inc
 
 DEPENDS = "beecrypt-native gettext-native zlib-native file-native popt-native python-native"
 
+FILES_${PN}-dbg += "${libdir}/rpm/.debug/*"
+
 export localstatedir = "${layout_localstatedir}"
 export varprefix = "${layout_localstatedir}"

--------------080408070201030609010506--
