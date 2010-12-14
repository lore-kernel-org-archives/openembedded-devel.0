Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PSUDb-0007N2-W9
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Dec 2010 13:43:00 +0100
Received: by fxm11 with SMTP id 11so587216fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Dec 2010 04:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=0PHOTfPKDczPIFTG4Sckg/5/hHg5nS3PxC23Cdxpg/U=;
	b=vbq2YMV3pZ57sevGRtETo9SDJjg6oo9QPhb/Np1hn2ak/HlfDW/oONv86KI/JuYMGv
	WcoLGtQ3Je70kEb4xPjATS5vYUISKi0bhMy+79PUuaXSaUoPirGZ1Wvtq9yyqbIAiN24
	W6PqsqHmATiAdstaWpWMUfOqVOcdAAvrBuw4o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=RndA1AN5nZ8umTS6eSWbX1okROCU62fdyThejh80MU3BU4JRANncPqEfEVx8KMhulf
	KahmtPYlGIAk2QnupKDAE9KQO/Um5xFsavOvDCktkCZVCdzhW9uVEuynz2winieesJ7G
	p5ZPl9w5o60cvEbZSjEsMB7DOMeZh8W7boD4U=
Received: by 10.223.87.16 with SMTP id u16mr1484056fal.138.1292330474700;
	Tue, 14 Dec 2010 04:41:14 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n3sm2103388faa.5.2010.12.14.04.41.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 14 Dec 2010 04:41:13 -0800 (PST)
Date: Tue, 14 Dec 2010 13:41:49 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101214124149.GC6662@jama>
References: <1292277061-32592-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1292277061-32592-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.42
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] eglibc/glibc: Use/add cross-localedef to generate locales
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
X-List-Received-Date: Tue, 14 Dec 2010 12:43:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 13, 2010 at 01:51:01PM -0800, Khem Raj wrote:
> * Add recipe for cross-localedef-native
> * Consolidate eglibc/glibc to share common contructs in bbclass
> * Move common code in eglibc to eglibc.inc
> * By default use cross-locaedef to generate locales now instead of qemu
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

Compiled fine, and ie eglibc-binary-localedata-cs-cz looks identical on
target :).

> ---
>  classes/glibc-package.bbclass                 |  308 -----------------
>  classes/libc-package.bbclass                  |  400 ++++++++++++++++++++++
>  recipes/eglibc/cross-localedef-native_2.12.bb |   37 ++
>  recipes/eglibc/eglibc-package.bbclass         |  448 -------------------------
>  recipes/eglibc/eglibc-package.inc             |   93 +++++
>  recipes/eglibc/eglibc.inc                     |   17 +-
>  recipes/eglibc/eglibc_2.10.bb                 |   15 +-
>  recipes/eglibc/eglibc_2.11.bb                 |   15 +-
>  recipes/eglibc/eglibc_2.12.bb                 |   21 +-
>  recipes/eglibc/eglibc_2.9.bb                  |   15 +-
>  recipes/eglibc/eglibc_svn.bb                  |   15 +-
>  recipes/glibc/glibc-package.inc               |  129 ++++----
>  12 files changed, 624 insertions(+), 889 deletions(-)
>  delete mode 100644 classes/glibc-package.bbclass
>  create mode 100644 classes/libc-package.bbclass
>  create mode 100644 recipes/eglibc/cross-localedef-native_2.12.bb
>  delete mode 100644 recipes/eglibc/eglibc-package.bbclass
>  create mode 100644 recipes/eglibc/eglibc-package.inc


