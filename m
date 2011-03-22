Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q24fb-0004ZU-37
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 17:43:00 +0100
Received: by bwz10 with SMTP id 10so5806033bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 09:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=XuCxA1rwWLygDhsjFPGUzh8P85OTXGRYyYf7ufumo6E=;
	b=drAIwQbfW5oF+GmVM31730yH0qHftv3KlX+9uhbiKRajW7Wg53TgqVj5m9ONNKnRIG
	1YQcn8J+IFZZXdO6yPhGwJJwwUld3QKoJrIml+kWsfiOvCMtogjUyEKzaFB0xuW0wBaG
	lHiC6Hf59c3b980PAqYWQ4r7ca1AXuzCF8kgY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=wBI9vE41DhUfk2Qv2oCKS6RHsdONRH67YMqKPGIXDwOu58BJEnP+pRx7tkkS+Anjbf
	P/lMkTFpx8pD/F1435g+7D7iBN6er/vBC24wGa9zsHaBGA/Z11Qo+QBiEHwLMdEZWV/r
	HG9JuZ3zxmeViMsg63SPtuWpD/MJIknswKJAM=
Received: by 10.204.165.193 with SMTP id j1mr5400642bky.11.1300812068484;
	Tue, 22 Mar 2011 09:41:08 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id t1sm5266203bkx.19.2011.03.22.09.41.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Mar 2011 09:41:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Mar 2011 17:40:57 +0100
Message-Id: <1300812057-24450-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] native.bbclass: define empty PACKAGES_DYNAMIC
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
X-List-Received-Date: Tue, 22 Mar 2011 16:43:01 -0000

* suggested by kergoth on #oe as response to similar patch limited to gtk+
  http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-March/031074.html
  15:03 < kergoth_> JaMa: pretty sure we just need PACKAGES_DYNAMIC = ""
  and PACKAGES_DYNAMIC_virtclass-native = "" in native.bbclass.
  everyone i've talked to so far as agreed that it's a sane approach,
  including RP.

* otherwise couple of errors like this are shown
  NOTE: multiple providers are available for runtime gdk-pixbuf-loader-gif (gtk+-native, gtk+, gtk+-fastscaling)
  NOTE: consider defining a PREFERRED_PROVIDER entry to match gdk-pixbuf-loader-gif
  ERROR: Trying to resolve runtime dependency gdk-pixbuf-loader-xpm resulted in conflicting PREFERRED_PROVIDER entries being found.
  The providers found were: ['/OE/dev/recipes/gtk+/gtk+_2.20.1.bb', 'virtual:native:/OE/dev/recipes/gtk+/gtk+_2.20.0.bb']
  The PREFERRED_PROVIDER entries resulting in this conflict were: ['PREFERRED_PROVIDER_gtk+ = gtk+', 'PREFERRED_PROVIDER_gdk-pixbuf-csource-native = gtk+-native']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 classes/native.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/classes/native.bbclass b/classes/native.bbclass
index b8a792f..1e7a6ec 100644
--- a/classes/native.bbclass
+++ b/classes/native.bbclass
@@ -7,6 +7,8 @@ EXCLUDE_FROM_WORLD = "1"
 
 PACKAGES = ""
 PACKAGES_virtclass-native = ""
+PACKAGES_DYNAMIC = ""
+PACKAGES_DYNAMIC_virtclass-native = ""
 PACKAGE_ARCH = "${BUILD_ARCH}"
 
 BASE_PACKAGE_ARCH = "${BUILD_ARCH}"
-- 
1.7.4.1



