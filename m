Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NnGz7-00010a-M9
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Mar 2010 20:45:30 +0100
Received: by pwi5 with SMTP id 5so1739153pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Mar 2010 11:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=eBI5d4sCN+IJVYAhHFh+kvz8YAu/N+FwzLDimPy0qtM=;
	b=iwtj/61TLC06ZiGzRqpqbZoIOIcEkY1UkWoH2duoTlsp9XusqngIXAzMoWMRzps7om
	8nvXXSd7MRwpXjXjGXztFPw7w/yBcx/RbUdLj/oGCsA0/3Vf8+mWChJw4dp1yxeIcuMR
	sBUbYTFcZ/XxsL9RtvV62sOWkjNtDWAzGbBmc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=MORvUlR4fZXQLzQF8Cj5dvkw35an0mZp2u8O7PnZSyl9nXodIpXc7PL6RHvsIonTWY
	ehhKpZAYwqhWfwXpPaq3MwNiY6ZSGkU5DPomw198o2d9fa3TxXWMK/x3119JZBGWP7rQ
	15keYRgfPwgypkVXeFabCJxgTuKVF9omliLC0=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.209.10 with SMTP id h10mr3335691wfg.278.1267731752167; 
	Thu, 04 Mar 2010 11:42:32 -0800 (PST)
In-Reply-To: <1267725265.28881.9.camel@localhost.localdomain>
References: <1267725265.28881.9.camel@localhost.localdomain>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 4 Mar 2010 13:42:12 -0600
X-Google-Sender-Auth: 845a543f47c4a356
Message-ID: <b6ebd0a51003041142n1e407a7elc8e16bcf57d0d9c5@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] Fix packaged staging for cross packages
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
X-List-Received-Date: Thu, 04 Mar 2010 19:45:30 -0000
Content-Type: text/plain; charset=UTF-8

It looks like this does fix the problem, and good job in spotting the
problem, but this fix assumes that the basename of CROSS_DIR is
BASE_PACKAGE_ARCH.  If that ever changes for whatever reason, it will break.
 I'd suggest instead changing it to continue to copy the contents of the
dir, but to change the destination to match the destination used in the
postamble (${PSTAGE_TMPDIR_STAGE}/cross/${BASE_PACKAGE_ARCH}).

On Thu, Mar 4, 2010 at 11:54 AM, Joshua Lock <josh@linux.intel.com> wrote:

> Hi,
>
> While working on packaged staging in Poky I noticed that cross packages
> where being incorrectly packaged.
>
> After spending quite some time to track down the issue and fix it I
> committed a patch to Poky master[1] to fix it.
>
> Attached is a copy of the patch for packages-staging.bbclass against
> oe.dev.
>
> Regards,
> Joshua
>
> 1.
> http://git.pokylinux.org/cgit.cgi/poky/commit/?id=538087d2036d9dd319e3a22aaa2f62e5a5285c55
> --
> Joshua Lock
>        Intel Open Source Technology Centre
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

