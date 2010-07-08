Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OWjwA-0005Mq-1Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Jul 2010 07:46:21 +0200
Received: by iwn34 with SMTP id 34so546406iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jul 2010 22:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=tpXPI7Rjtx/LE/oJj0NzFcjyDy5ws0JOutv1/jq7EYU=;
	b=sI9A3NUZpnlMtYnCNTZuc8PrA+FP4Cvs6plOP2RiwtG7TTqGIq86NgIYMx+5fLFQI6
	SP/Ewv7RGIXG7vds/RqL92uL+8EpVqkKFATX0vM7vMmVSVuhWuXuQmQ3jyXCTsWyrbFy
	XVxNScc53dSVe82e/2bRNZBFYHfBAjihVfsSQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=HLL5BD8YRC28FvQQ4e4Mtkhsv5U+bNDe0d7qnP41W9vcNa9vlwffOF6TxyEjzWrfgA
	GXERtI6Nvq0u0OuFeVzCw0huwmyT1pjOy25jOQ8WOK/gpo7PE/JfIrY0ZaQ1HybQ0Oc5
	8QoinMXuWaClnyUSDTlhzHRtqy8U+x2Hhz3No=
MIME-Version: 1.0
Received: by 10.231.168.208 with SMTP id v16mr3104884iby.103.1278567682852; 
	Wed, 07 Jul 2010 22:41:22 -0700 (PDT)
Received: by 10.231.157.196 with HTTP; Wed, 7 Jul 2010 22:41:22 -0700 (PDT)
In-Reply-To: <4C356475.2060208@gmail.com>
References: <4C356475.2060208@gmail.com>
Date: Thu, 8 Jul 2010 15:11:22 +0930
Message-ID: <AANLkTinc4237EWAKJ90FI_4EKD9A17QadsHjEVn6MCWn@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Badness with -ibad, a replacement for zecke-no-host-includes.patch.
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
X-List-Received-Date: Thu, 08 Jul 2010 05:46:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

> Please note that the bitbake.conf change will break builds with
> versions of gcc that do not accept this -ibad parameter. I have
> tested that the ibad patch applies to each of the gcc versions
> in this patch, but only done functional tests for gcc-4.3.3 and
> gcc-.4.1.

That should be gcc-4.3.3 and gcc-4.4.1.


