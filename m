Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LYjow-0002iD-Ci
	for openembedded-devel@openembedded.org; Sun, 15 Feb 2009 17:26:18 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LYjnH-0002Ao-CL
	for openembedded-devel@openembedded.org; Sun, 15 Feb 2009 16:24:35 +0000
Received: from p5483acb9.dip0.t-ipconnect.de ([84.131.172.185])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 15 Feb 2009 16:24:35 +0000
Received: from vjensen by p5483acb9.dip0.t-ipconnect.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 15 Feb 2009 16:24:35 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Vitus Jensen <vjensen@gmx.de>
Date: Sun, 15 Feb 2009 16:24:23 +0000 (UTC)
Message-ID: <gn9fjn$4rj$1@ger.gmane.org>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF642@hiob.intern.dresearch.de>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF664@hiob.intern.dresearch.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5483acb9.dip0.t-ipconnect.de
User-Agent: Pan/0.133 (House of Butterflies)
Sender: news <news@ger.gmane.org>
Subject: Re: subversion libtool problem
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
X-List-Received-Date: Sun, 15 Feb 2009 16:26:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am Fri, 13 Feb 2009 09:41:07 +0100 schrieb Sledz, Steffen:

>> Since the saturday "apr + apr-util: merge from poky" commit by Koen i
>> almost reached my goal to build a subversion client for Angstrom. After
>> patching neon for myself there is just this last problem:
>> 
>> NOTE: Running task 422 of 578 (ID: 7,
>> /opt/openembedded/packages/subversion/subversion_1.4.5.bb, do_compile)
>> NOTE: package subversion-1.4.5: started NOTE: package
>> subversion-1.4.5-r0: task do_compile: started ERROR: function
>> do_compile failed
...
 
> Is there nobody maintaining subversion???

Probably.

Did you fix http://bugs.openembedded.net/show_bug.cgi?id=4830 when 
"patching neon for myself"?  I tried a DEPENDS = "gnutls (<2.0)" but the 
only thing which worked was a direct reference to a 1.x version.

If someone is interested, here is the change:

commit d10fe069dde68f25710250dfa295dbc88d62dfc1
Author: Vitus Jensen <vjensen@gmx.de>
Date:   Sun Feb 15 17:14:19 2009 +0100

    neon_0.25.5.bb: preliminary patch to force gnutls < 2.0

diff --git a/packages/neon/neon_0.25.5.bb b/packages/neon/neon_0.25.5.bb
index f935fdb..ef70178 100644
--- a/packages/neon/neon_0.25.5.bb
+++ b/packages/neon/neon_0.25.5.bb
@@ -2,8 +2,7 @@ DESCRIPTION = "neon is an HTTP and WebDAV client library, with a C interface."
 HOMEPAGE = "http://www.webdav.org/neon"
 SECTION = "libs"
 LICENSE = "LGPL"
-DEPENDS = "zlib libxml2 expat time gnutls"
-
+DEPENDS = "zlib libxml2 expat time gnutls-1.6.3"
 PR = "r3"
 
 SRC_URI = "http://www.webdav.org/${PN}/${P}.tar.gz \


-- 
Vitus Jensen, Hannover, Germany, Earth, Milky Way, Universe (current)



