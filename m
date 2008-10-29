Received: from [143.182.124.36] (helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <josh@linux.intel.com>) id 1KvEJX-0000kp-UU
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Oct 2008 17:54:36 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 29 Oct 2008 09:53:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.33,507,1220252400"; d="scan'208";a="67130047"
Received: from unknown (HELO [143.185.76.216]) ([143.185.76.216])
	by azsmga001.ch.intel.com with ESMTP; 29 Oct 2008 09:53:34 -0700
Message-ID: <4908950C.6030406@linux.intel.com>
Date: Wed, 29 Oct 2008 16:53:32 +0000
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla-Thunderbird 2.0.0.17 (X11/20081018)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Small url fix for xerces-c
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
X-List-Received-Date: Wed, 29 Oct 2008 16:54:36 -0000
Content-Type: multipart/mixed; boundary="------------050807090605010200010907"

--------------050807090605010200010907
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi there,

I noticed the url in the xerces-c recipe is incorrect. Patch attached.

Cheers,

- J
-- 
	Joshua Lock
	       Intel Open Source Technology Centre

--------------050807090605010200010907
Content-Type: text/x-patch;
 name="oe_xerces_url.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="oe_xerces_url.patch"

diff --git a/packages/xerces-c/xerces-c_2.8.0.bb b/packages/xerces-c/xerces-c_2.8.0.bb
index 4f72e9d..d78bb22 100644
--- a/packages/xerces-c/xerces-c_2.8.0.bb
+++ b/packages/xerces-c/xerces-c_2.8.0.bb
@@ -5,7 +5,7 @@ PRIORITY = "optional"
 LICENSE = "MIT"
 PR = "r1"
 
-SRC_URI = "http://mirror.serversupportforum.de/apache/xerces/c/sources/xerces-c-src_2_8_0.tar.gz"
+SRC_URI = "http://mirror.serversupportforum.de/apache/xerces/c/2/sources/xerces-c-src_2_8_0.tar.gz"
 S = "${WORKDIR}/xerces-c-src_2_8_0/src/xercesc"
 
 inherit autotools pkgconfig

--------------050807090605010200010907--
