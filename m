Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1SqjsI-0007Gi-Su
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 13:54:03 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 96BC9F8122B; Mon, 16 Jul 2012 05:37:17 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id B6748F811FC;
	Mon, 16 Jul 2012 05:37:15 -0600 (MDT)
Message-ID: <5003FCF0.7030004@mlbassoc.com>
Date: Mon, 16 Jul 2012 05:37:20 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1342437647-815-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1342437647-815-1-git-send-email-koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] v4l-utils 0.8.8: disable qv4l2 build
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
X-List-Received-Date: Mon, 16 Jul 2012 11:54:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-07-16 05:20, Koen Kooi wrote:
> It picks up host qmake and breaks the build.

Does it still break if you have QT in your image?  If not, then perhaps
this could be made conditional rather than just removed.

>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>   .../v4l-utils/0001-disable-qv4l2-build.patch       |   39 ++++++++++++++++++++
>   .../recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb |    6 ++-
>   2 files changed, 44 insertions(+), 1 deletion(-)
>   create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-disable-qv4l2-build.patch
>
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-disable-qv4l2-build.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-disable-qv4l2-build.patch
> new file mode 100644
> index 0000000..4b11038
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-disable-qv4l2-build.patch
> @@ -0,0 +1,39 @@
> +From 1422d4c562660407919fb753dc5f074293b395e5 Mon Sep 17 00:00:00 2001
> +From: Koen Kooi <koen@dominion.thruhere.net>
> +Date: Mon, 16 Jul 2012 12:00:34 +0200
> +Subject: [PATCH] disable qv4l2 build
> +
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +---
> + utils/Makefile |   15 ---------------
> + 1 files changed, 0 insertions(+), 15 deletions(-)
> +
> +diff --git a/utils/Makefile b/utils/Makefile
> +index 014b82d..db74851 100644
> +--- a/utils/Makefile
> ++++ b/utils/Makefile
> +@@ -5,21 +5,6 @@ all install:
> + 		$(MAKE) -C $$i $@ || exit 1; \
> + 	done
> +
> +-	# Test whether qmake is installed, and whether it is for qt4.
> +-	@if which qmake-qt4 >/dev/null 2>&1; then \
> +-		QMAKE=qmake-qt4; \
> +-	else \
> +-		QMAKE=qmake; \
> +-	fi; \
> +-	if which $$QMAKE >/dev/null 2>&1; then \
> +-		if $$QMAKE --version 2>&1 | grep '4\.[0-9][0-9]*\.[0-9][0-9]*' >/dev/null; then \
> +-			if [ ! -f qv4l2/Makefile ]; then \
> +-				(cd qv4l2 && $$QMAKE) || exit 1; \
> +-			fi; \
> +-			$(MAKE) -C qv4l2 -f Makefile.install $@; \
> +-		fi \
> +-	fi
> +-
> + sync-with-kernel:
> + 	$(MAKE) -C keytable $@
> + 	$(MAKE) -C v4l2-dbg $@
> +--
> +1.7.7.6
> +
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
> index 18f361f..e5d1fc2 100644
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
> @@ -3,12 +3,16 @@ LICENSE = "GPLv2 & LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
>                       file://COPYING.LIB;md5=d749e86a105281d7a44c2328acebc4b0"
>
> +PR = "r1"
> +
>   DEPENDS = "jpeg"
>
>   # libv4l was absorbed into this, let OE know that
>   PROVIDES = "libv4l"
>
> -SRC_URI = "git://linuxtv.org/v4l-utils.git;protocol=git"
> +SRC_URI = "git://linuxtv.org/v4l-utils.git;protocol=git \
> +           file://0001-disable-qv4l2-build.patch \
> +          "
>   # 54f16ca8183dd8ae8bf4ccc07949795aff0301f5 -> v0.8.8 tag
>   SRCREV = "54f16ca8183dd8ae8bf4ccc07949795aff0301f5"
>
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------




