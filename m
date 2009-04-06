Received: from [216.145.245.200] (helo=mx04.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1Lqg5f-0003hY-GK
	for openembedded-devel@openembedded.org; Mon, 06 Apr 2009 06:05:46 +0200
Received: from [209.242.7.134] (helo=[192.168.231.111])
	by mx04.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1Lqg2x-00016V-HX
	for openembedded-devel@openembedded.org; Sun, 05 Apr 2009 23:02:55 -0500
Message-ID: <49D97EF8.4040905@dls.net>
Date: Sun, 05 Apr 2009 23:03:04 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.21) Gecko/20090302 Thunderbird/2.0.0.21 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <20090403221352.GH30840@smtp.west.cox.net>	<20090403221721.GI30840@smtp.west.cox.net>	<20090403221751.GJ30840@smtp.west.cox.net>	<20090403221813.GK30840@smtp.west.cox.net>
	<20090404192517.GP30840@smtp.west.cox.net>
In-Reply-To: <20090404192517.GP30840@smtp.west.cox.net>
X-SA-Exim-Connect-IP: 216.145.245.200
X-SA-Exim-Mail-From: mwester@dls.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=AWL,BAYES_05,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Re: task-slugos-toolchain-target: Add libstdc++-dev for C++ headers, bump PR
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
X-List-Received-Date: Mon, 06 Apr 2009 04:05:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Tom Rini wrote:
> After checking with mwester, this is the correct thing to do.
> ---
> 
> task-slugos-toolchain-target: Add libstdc++-dev for C++ heades, bump PR
> 
> ---
>  recipes/tasks/task-slugos-toolchain-target.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/tasks/task-slugos-toolchain-target.bb b/recipes/tasks/task-slugos-toolchain-target.bb
> index 489a412..4f9df9b 100644
> --- a/recipes/tasks/task-slugos-toolchain-target.bb
> +++ b/recipes/tasks/task-slugos-toolchain-target.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "Packages for a standalone SDK or external toolchain"
>  LICENSE = "MIT"
>  ALLOW_EMPTY = "1"
>  
> -PR = "r1"
> +PR = "r2"
>  
>  PACKAGES = "${PN}"
>  
> @@ -18,6 +18,7 @@ RDEPENDS_${PN} = "\
>      libcrypto \
>      openssl-dev \
>      libstdc++ \
> +    libstdc++-dev \
>      "
>  
>  # Not sure if we need these or not...

Thanks!

Per our discussion on IRC, I propose the following patch for this, which
pulls in task-sdk-bare to address the problem you discovered above, as
well as the other things you pointed out.

Do you want to commit the change, or should I?

-Mike (mwester)


diff --git a/recipes/tasks/task-slugos-toolchain-target.bb b/recipes/tasks/task-slugos-toolchain-target.bb
index 489a412..fb0418f 100644
--- a/recipes/tasks/task-slugos-toolchain-target.bb
+++ b/recipes/tasks/task-slugos-toolchain-target.bb
@@ -2,31 +2,21 @@ DESCRIPTION = "Packages for a standalone SDK or external toolchain"
 LICENSE = "MIT"
 ALLOW_EMPTY = "1"

-PR = "r1"
+PR = "r2"

 PACKAGES = "${PN}"

-# Stuff contained in this SDK is largely taken from task-sdk-base.bb.
+DEPENDS = "task-sdk-bare"
+
 # This is a starting point, and nothing more at present -- please fill
 # this out with a reasonable set of development tools for a SlugOS image.
 # Also feel free to remove stuff that's silly.

 RDEPENDS_${PN} = "\
-    libgcc \
+    task-sdk-bare \
     linux-libc-headers-dev \
     libssl \
     libcrypto \
     openssl-dev \
-    libstdc++ \
-    "
-
-# Not sure if we need these or not...
-NOT_SURE_ABOUT = "\
-    libsegfault \
-    "
-
-# This one needs further investigation; seems to be some sort
-# of naming problem that breaks the SDK when it is added directly.
-ODDLY_BROKEN_PACKAGES ="\
-    libz-dev \
+    zlib-dev \
     "


