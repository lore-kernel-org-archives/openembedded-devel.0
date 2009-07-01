Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MM5IB-00041n-Gl
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jul 2009 21:16:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 28DDA4F5963;
	Wed,  1 Jul 2009 15:04:31 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10747-05; Wed,  1 Jul 2009 15:04:31 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id F02C84F572C;
	Wed,  1 Jul 2009 15:04:30 -0400 (EDT)
Date: Wed, 1 Jul 2009 15:04:30 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
In-Reply-To: <1246474496-16704-4-git-send-email-marcin@juszkiewicz.com.pl>
Message-ID: <Pine.LNX.4.64.0907011500230.3731@juice.ott.cti.com>
References: <200907011818.18407.marcin@juszkiewicz.com.pl>
	<1246474496-16704-4-git-send-email-marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [STABLE][PATCH 039/125] glibc/eglibc: remove calls to obsolete base_set_filespath()
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
X-List-Received-Date: Wed, 01 Jul 2009 19:16:27 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

Hi Marcin,

On Wed, 1 Jul 2009, Marcin Juszkiewicz wrote:

> From: Michael Smith <msmith@cbnco.com>
> --- a/recipes/glibc/glibc-initial.inc
> +++ b/recipes/glibc/glibc-initial.inc
> @@ -1,7 +1,7 @@
>  SECTION = "libs"
>  DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial linux-libc-headers"
>  PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-2.4', '${FILE_DIRNAME}/glibc-${PV}', '${FILE_DIRNAME}/glibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
> +FILESPATHPKG =. "glibc-2.4:"
>  
>  PACKAGES = ""
>  PACKAGES_DYNAMIC = ""

The FILESPATHPKG =. "glibc-2.4:" broke glibc-initial-2.3.2.

I sent a patch for dev, but it's not applied. It's in patchwork:
http://patchwork.openembedded.org/patch/707/

Here's the thread that prompted it:

http://projects.linuxtogo.org/pipermail/openembedded-devel/2009-June/011692.html

Mike


