Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OyYJ3-00025L-V0
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 01:00:55 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OyYIx-0001T8-FC from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 16:00:47 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 22 Sep 2010 16:00:47 -0700
Received: from [172.30.80.208] ([172.30.80.208]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 22 Sep 2010 17:00:46 -0600
Message-ID: <4C9A8A9B.6000904@mentor.com>
Date: Wed, 22 Sep 2010 16:00:43 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285194952-1831-1-git-send-email-eric@eukrea.com>	<1285194952-1831-2-git-send-email-eric@eukrea.com>
	<1285194952-1831-3-git-send-email-eric@eukrea.com>
In-Reply-To: <1285194952-1831-3-git-send-email-eric@eukrea.com>
X-OriginalArrivalTime: 22 Sep 2010 23:00:46.0295 (UTC)
	FILETIME=[FDB96670:01CB5AA9]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/3] gdb-cross-sdk: use static libncurses libtinfo libz	and libexpat
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
X-List-Received-Date: Wed, 22 Sep 2010 23:00:55 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Eric Bénard wrote:
> * statically linking these libs prevents several runtime problems

Since ncurses 5.7 is default and otherwise switching down / staying down 
is hard atm, I'm OK with the -lncurses -> libncurses + libtinfo change.

Acked-by: Tom Rini <tom_rini@mentor.com>

> 
> Signed-off-by: Eric Bénard <eric@eukrea.com>
> ---
>  recipes/gdb/gdb-cross-sdk.inc |   13 ++++++++++++-
>  1 files changed, 12 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/gdb/gdb-cross-sdk.inc b/recipes/gdb/gdb-cross-sdk.inc
> index 7c85653..fbff553 100644
> --- a/recipes/gdb/gdb-cross-sdk.inc
> +++ b/recipes/gdb/gdb-cross-sdk.inc
> @@ -1,8 +1,19 @@
>  require gdb-cross.inc
>  LICENSE = "GPLv3"
>  
> -INC_PR = "r6"
> +INC_PR = "r7"
>  
>  inherit sdk
>  
>  DEPENDS = "ncurses-sdk zlib-sdk flex-native"
> +EXTRA_OEMAKE = "'SUBDIRS=intl mmalloc libiberty opcodes bfd sim gdb etc utils' LDFLAGS='${BUILD_LDFLAGS}'"
> +
> +do_configure_append () {
> +	cd ${B}
> +	oe_runmake configure-host
> +	sed -e 's,-lncurses,${STAGING_LIBDIR_NATIVE}/libncurses.a ${STAGING_LIBDIR_NATIVE}/libtinfo.a ,g' -i ${B}/gdb/Makefile
> +	sed -e 's,-lz, ${STAGING_LIBDIR_NATIVE}/libz.a ,g' -i ${B}/gdb/Makefile
> +	sed -e 's,-lexpat, ${STAGING_LIBDIR_NATIVE}/libexpat.a ,g' -i ${B}/gdb/Makefile
> +	sed -e 's,libexpat.so,libexpat.a ,g' -i ${B}/gdb/Makefile
> +	sed -e 's,-lz, ${STAGING_LIBDIR_NATIVE}/libz.a ,g' -i ${B}/sim/arm/Makefile
> +}
> \ No newline at end of file


-- 
Tom Rini
Mentor Graphics Corporation


