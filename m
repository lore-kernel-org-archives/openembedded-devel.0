Received: from qw-out-1920.google.com ([74.125.92.146])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1O25Da-0003sc-Bk
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Apr 2010 18:13:34 +0200
Received: by qw-out-1920.google.com with SMTP id 4so82036qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Apr 2010 09:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:received:message-id
	:subject:to:content-type;
	bh=9ORs8iSHWb+MU3asZlnF1O058R9bmyC7VKKtnAsEcLw=;
	b=Yc2xEM0o4F/AnQwZK6kcBvnlGQfy13LXsjNyWTM9j/OiCHCW338fy1jRDWU7OAe0M/
	sgx3u3OeP1G0OspCrObklvOj9FrRCcY31VSdve1wn/V/Yl0BVat9XNAmUwO/ObbHS/f/
	xRlPSc8BXoFlgbDolKwEcges2uyjvuScrYYaw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=XOIeh0bmyact2yjIoilXALjl+kyFnECIemHFLg4ghsV1fFRTmqV3Q0p+2veg7h0Pb7
	y+xLMjp8UC8qYxebNw3sdVK9ZiSshPCvihVG/wExpi1iLQY8nZoJgJzPcOAT8L/LVaWg
	7EaFQ1vynNUm0n2jhR1LLl+OUh9vC4/pvEhLo=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.46.205 with HTTP; Wed, 14 Apr 2010 09:09:45 -0700 (PDT)
In-Reply-To: <lytyre183u.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1271238118-6524-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<lytyre183u.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 14 Apr 2010 09:09:45 -0700
X-Google-Sender-Auth: 3596d5af89db6936
Received: by 10.229.236.16 with SMTP id ki16mr1350763qcb.68.1271261405309; 
	Wed, 14 Apr 2010 09:10:05 -0700 (PDT)
Message-ID: <h2rb6ebd0a51004140909sbe71e372kf396e092deadb32c@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.146
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] package.bbclass: search for dangling links in installation directory
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
X-List-Received-Date: Wed, 14 Apr 2010 16:13:34 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 14, 2010 at 6:23 AM, Enrico Scholz <
enrico.scholz@sigma-chemnitz.de> wrote:

> Enrico Scholz <enrico.scholz@sigma-chemnitz.de> writes:
>
> > The old dangling link detection used os.stat() on the file and
> > registered it as a dangling link when it was not found. This causes
> > problems when the link is an absolute one because it will check
> > files of the host system.
> > ...
> > As this is only a QA mechanism which does not affect the resulting
> > package, there is checked for generic OSErrors only, not only for
> > ENOENT.  Other problems (e.g. EPERM) will be reported by other
> > functions.
>
> oops... forgot the
>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>

Looks reasonable to me.

Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

