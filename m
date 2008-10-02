Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1KlWgI-0001CR-Gv
	for openembedded-devel@openembedded.org; Fri, 03 Oct 2008 00:29:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m92MPjOL008456
	for <openembedded-devel@openembedded.org>;
	Thu, 2 Oct 2008 23:25:45 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08294-04 for <openembedded-devel@openembedded.org>;
	Thu,  2 Oct 2008 23:25:39 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m92MPYhO008450
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Thu, 2 Oct 2008 23:25:34 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <gc35ba$voi$1@ger.gmane.org>
References: <gc35ba$voi$1@ger.gmane.org>
Date: Thu, 02 Oct 2008 23:25:36 +0100
Message-Id: <1222986336.5190.33.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Heads up: staging changes are going to land
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
X-List-Received-Date: Thu, 02 Oct 2008 22:29:59 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Thu, 2008-10-02 at 20:53 +0200, Koen Kooi wrote:
> The changed described in 
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2008-July/005819.html 
> are about to get committed.
> 
> The patch can be previewed at 
> http://dominion.thruhere.net/koen/OE/staging-patch.txt

I had a quick glance through that patch and you should probably rethink
the bits below:

+BUILDSDK_CPPFLAGS = "-isystem${STAGING_INCDIR}"
 export CPPFLAGS = "${TARGET_CPPFLAGS}"
 export TARGET_CPPFLAGS = "-isystem${STAGING_DIR_TARGET}${layout_includedir}"
 
 export BUILD_CFLAGS = "${BUILD_CPPFLAGS} ${BUILD_OPTIMIZATION}"
+BUILDSDK_CFLAGS = "${BUILDSDK_CPPFLAGS} ${BUILD_OPTIMIZATION}"
 export CFLAGS = "${TARGET_CFLAGS}"
 export TARGET_CFLAGS = "${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION}"


These SDK things are a bit nuts and I suspect should be removed. I added
them to fix some problem in Poky and I think they may not be needed now
but I'm not 100% and need to find time to check. OE probably doesn't
want them, at least yet.

 
@@ -404,7 +414,7 @@ FULL_OPTIMIZATION = "-fexpensive-optimiz
 ##################################################################
 
 FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
-DEBUG_OPTIMIZATION = "-O -g"
+DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer -g"


I think OE changed this for a reason and Poky never merged that change?
Maybe I don't remember right though?

Cheers,

Richard



