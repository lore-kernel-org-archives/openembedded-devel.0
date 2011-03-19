Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q11B8-0003su-47
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Mar 2011 19:47:10 +0100
Received: by pxi1 with SMTP id 1so862632pxi.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Mar 2011 11:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=zTugvSYcrxrm+PDQhnrFTtwN+BlWGwWmVtNQ1pi+kog=;
	b=bjEcuBduwYjXFqZUWYuYJ0CQRlp+/0ukOt47z0BuWxsuB1r4osZa7kPDqYhkoGst4O
	qpsvbR7FgQiJoX548xpA9Hg4sdPy5fg7S2L1S0Cd6qfj7s2HHiFbgqiWVrBZgBFEaGd6
	3nTMp4KBQdQnE7MUjTKq3MdyD7r9BhvpyhUaM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=DHJo5G6TySC/dvkKfgPgf7egDBoo4bDUg5sjiWV138XLcp1mPC974hhn2FqNQDQn8J
	mt0hwXDjMtuw1GiQsQBL5MR+2MCRSDegT+NnIBRZ0m98k7eE5CQaTjlFxl8D6nLp0DYq
	ygrEdFiCbMJKB05Mmpj5CaUPFGwZasLCTuRj8=
Received: by 10.142.112.13 with SMTP id k13mr1294880wfc.406.1300560319190;
	Sat, 19 Mar 2011 11:45:19 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w32sm4678097wfh.7.2011.03.19.11.45.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 19 Mar 2011 11:45:17 -0700 (PDT)
Date: Sat, 19 Mar 2011 11:46:26 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110319184626.GC14868@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1300441991-30490-1-git-send-email-heinold@inf.fu-berlin.de>
	<1300441991-30490-2-git-send-email-heinold@inf.fu-berlin.de>
MIME-Version: 1.0
In-Reply-To: <1300441991-30490-2-git-send-email-heinold@inf.fu-berlin.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 1/2] ti-c6accel: fix building for uclibc
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
X-List-Received-Date: Sat, 19 Mar 2011 18:47:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (18/03/11 10:53), heinold@inf.fu-berlin.de wrote:
> From: Henning Heinold <heinold@inf.fu-berlin.de>
> 
> 
> Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
> ---
>  recipes/ti/ti-c6accel.inc                   |    2 +-
>  recipes/ti/ti-c6accel/fix_time_symbol.patch |   46 +++++++++++++++++++++++++++
>  recipes/ti/ti-c6accel_1.01.00.03.bb         |    2 +
>  3 files changed, 49 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/ti/ti-c6accel/fix_time_symbol.patch
> 
> diff --git a/recipes/ti/ti-c6accel.inc b/recipes/ti/ti-c6accel.inc
> index 7d09783..216f4c2 100644
> --- a/recipes/ti/ti-c6accel.inc
> +++ b/recipes/ti/ti-c6accel.inc
> @@ -18,7 +18,7 @@ PROVIDES += "ti-c6accel-apps"
>  
>  # This recipe links statically against kernel dependant stuff, use kernel PR as base and append a local version
>  PR = "${MACHINE_KERNEL_PR}"
> -PR_append = "c"
> +PR_append = "d"
>  
>  S = "${WORKDIR}/c6accel_${PV}"
>  
> diff --git a/recipes/ti/ti-c6accel/fix_time_symbol.patch b/recipes/ti/ti-c6accel/fix_time_symbol.patch
> new file mode 100644
> index 0000000..9963669
> --- /dev/null
> +++ b/recipes/ti/ti-c6accel/fix_time_symbol.patch
> @@ -0,0 +1,46 @@
> +Index: c6accel_1_01_00_03/soc/app/benchmark.h
> +===================================================================
> +--- c6accel_1_01_00_03.orig/soc/app/benchmark.h	2011-03-12 17:45:49.640633120 +0100
> ++++ c6accel_1_01_00_03/soc/app/benchmark.h	2011-03-12 17:46:10.360988120 +0100
> +@@ -39,7 +39,7 @@
> + 
> + 
> +  extern Time_Object sTime;
> +- extern UInt32      time;
> ++ extern UInt32      timestamp;
> + 
> +  #define OPEN_LOG_FILE(Name)                                    \
> +  if ((benchmarkFd = fopen(Name,"wb")) == NULL) {                \
> +@@ -49,7 +49,7 @@
> +  #define CLOSE_LOG_FILE() fclose(benchmarkFd);
> + 
> +  #define START_BENCHMARK()                                     \
> +-           Time_delta(&sTime,&time);
> ++           Time_delta(&sTime,&timestamp);
> + 
> +  #define LOG_STRING(str)                                        \
> +        fprintf(benchmarkFd,"%s",str);
> +@@ -70,8 +70,8 @@
> + 
> + 
> +  #define END_AND_WRITE_BENCHMARK()                             \
> +-       Time_delta(&sTime,&time);                                \
> +-       fprintf(benchmarkFd,"%d",(unsigned int)time);
> ++       Time_delta(&sTime,&timestamp);                                \
> ++       fprintf(benchmarkFd,"%d",(unsigned int)timestamp);
> + 
> + 
> + 
> +Index: c6accel_1_01_00_03/soc/app/appMain.c
> +===================================================================
> +--- c6accel_1_01_00_03.orig/soc/app/appMain.c	2011-03-12 17:46:42.030148120 +0100
> ++++ c6accel_1_01_00_03/soc/app/appMain.c	2011-03-12 17:48:00.619423120 +0100
> +@@ -66,7 +66,7 @@
> + /* This object is used in MACRO in benchmark.h */
> + #include "timeObj.h"
> + Time_Object sTime;
> +-UInt32      time;
> ++UInt32      timestamp;
> + 
> + void Time_reset(Time_Object *sTime)
> + {
> diff --git a/recipes/ti/ti-c6accel_1.01.00.03.bb b/recipes/ti/ti-c6accel_1.01.00.03.bb
> index bf5f1cf..42b0cc6 100644
> --- a/recipes/ti/ti-c6accel_1.01.00.03.bb
> +++ b/recipes/ti/ti-c6accel_1.01.00.03.bb
> @@ -7,6 +7,8 @@ SRC_URI_append = "file://fix-loadmodule.patch \
>                    file://0001-soc-honour-buildsystem-CFLAGS-and-LDFLAGS-when-set.patch \
>                   "
>  
> +SRC_URI_append_libc-uclibc = "file://fix_time_symbol.patch"
                                ^^^
you might want to add a space
>  PV = "1_01_00_03"
>  
>  
> -- 
> 1.7.4.1
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


