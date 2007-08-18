Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lenehan@twibble.org>) id 1IMK76-0005ab-Iw
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Aug 2007 10:56:56 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 032BDE349C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Aug 2007 18:56:15 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18354-02
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Aug 2007 18:56:14 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 89D56E3499
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Aug 2007 18:56:14 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 20E70B70149; Sat, 18 Aug 2007 18:56:13 +1000 (EST)
Date: Sat, 18 Aug 2007 18:56:13 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070818085613.GA28491@twibble.org>
References: <E1IK9nA-00024I-AJ@linuxtogo.org>
MIME-Version: 1.0
In-Reply-To: <E1IK9nA-00024I-AJ@linuxtogo.org>
User-Agent: Mutt/1.5.12-2006-07-14
X-Virus-Scanned: by amavisd at twibble.org
Subject: Re: [oe-commits] org.oe.dev linux-linux-headers: add 2.6.22
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
X-List-Received-Date: Sat, 18 Aug 2007 08:56:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 12, 2007 at 07:35:32PM +1000, "koen commit" wrote:
> linux-linux-headers: add 2.6.22

This prompted me try something newer then 2.6.15.99 for my sh4 builds
again. Turn out a "make allnoconfig" gets stuck in an infitinite loop
for sh (looks like it's something to do with no boards being
defined).

Anyway, the following works fine. Is there any particular problem
with doing this?


--- packages/linux-libc-headers/linux-libc-headers_2.6.22.bb    315a90b6e90272ad612070887ceec548917a74d4
+++ packages/linux-libc-headers/linux-libc-headers_2.6.22.bb    a6e80aafcd97a39d08120df35a02a98f43221432
@@ -32,7 +32,11 @@ do_configure() {
 
 do_configure() {
        set_arch
-       oe_runmake allnoconfig ARCH=$ARCH
+        if [ ${ARCH} = "sh" ]; then
+           oe_runmake allyesconfig ARCH=$ARCH
+        else
+           oe_runmake allnoconfig ARCH=$ARCH
+        fi
 }
 
 do_compile () {

-- 
 Jamie Lenehan <lenehan@twibble.org>


