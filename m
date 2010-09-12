Received: from smtp-4.concepts.nl ([213.197.30.111])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1OutoE-0007tc-7s
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Sep 2010 23:09:59 +0200
Received: from c3404277.ftth.concepts.nl ([195.64.66.119]
	helo=mx1.grimmerink.nl) by smtp-4.concepts.nl with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1OutnR-0006RR-Es
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Sep 2010 23:09:09 +0200
Received: from [10.9.0.12] (unknown [10.9.0.12])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.grimmerink.nl (Postfix) with ESMTPSA id 675626A125
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Sep 2010 23:09:04 +0200 (CEST)
From: pieterg <pieterg@gmx.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Sep 2010 23:08:59 +0200
User-Agent: KMail/1.9.9
References: <AANLkTimErvT=QwSRo25H-Bn2cjdao5x4XMbp_nz4Vc9_@mail.gmail.com>
	<i6f9uu$39o$1@dough.gmane.org> <i6fc40$90f$1@dough.gmane.org>
In-Reply-To: <i6fc40$90f$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201009122308.59800.pieterg@gmx.com>
X-Concepts-MailScanner-Information: Please contact abuse@concepts.nl for more
	information
X-Concepts-MailScanner-ID: 1OutnR-0006RR-Es
X-Concepts-MailScanner: Found to be clean
X-Concepts-MailScanner-SpamCheck: 
X-Concepts-MailScanner-From: pieterg@gmx.com
X-SA-Exim-Connect-IP: 213.197.30.111
X-SA-Exim-Mail-From: pieterg@gmx.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: patch to fix libstdc++ problem, was Re: Images no longer automatically include libstdc++6
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
X-List-Received-Date: Sun, 12 Sep 2010 21:09:59 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Saturday 11 September 2010 09:46:08 Koen Kooi wrote:
> Can people ack or nack the following please:
>
>
> diff --git a/recipes/gcc/gcc-package-cross.inc
> b/recipes/gcc/gcc-package-cross.inc
> index 0c4ea2d..59e7dde 100644
> --- a/recipes/gcc/gcc-package-cross.inc
> +++ b/recipes/gcc/gcc-package-cross.inc
> @@ -2,6 +2,8 @@ PACKAGE_STRIP ?= ""
>  OLD_PACKAGE_STRIP := "${PACKAGE_STRIP}"
>  PACKAGE_STRIP = "no"
>
> +SHLIBSDIR = "${STAGING_DIR_TARGET}/shlibs"
> +
>  PACKAGES = "libgcc libssp libstdc++ libg2c libgfortran"
>
>  # Called from within gcc-cross, so libdir is set wrong

Yes, that fixes it for me.

Rgds, Pieter


