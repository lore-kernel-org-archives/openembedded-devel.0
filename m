Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P9hW9-0006Zj-70
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 19:04:30 +0200
Received: by wwi14 with SMTP id 14so802169wwi.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Oct 2010 10:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=dQ/OUJk6zz31CODUphSPkofeXItFad2pgO/RC/mWQWU=;
	b=w32BSeCnoUQIImx3ZocjKYwbr1PQ7ijS+TeIXFC9zqN1uxLdT8zyWHL05wOq0AXDdR
	8bfIYvvnCax36nN2B7NFIWATxWR2qDQMRSGpUVBzOkpO03+7NU+Tu9KpgJtP9KJb0XOt
	WpKlIHRfJVQ8IQAQyawXkJ0qgeZKDbkNiMtXk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=iLguLIyUXN7dDgKuUEtSZ8RZRU/LED2h9+6JxKiUufCkzUWRLUdLtVzJjGjvo9n0vY
	1gr3Hn8B8+98JLkUyIXBINtm3G/Kab5I3LPJywVHR0atDuGK1qjHzh+C0aH8tkyRwYoq
	awKnOg6ADK+qb3vfZDDHLxFkpyE6Wkrb15VNA=
Received: by 10.216.17.211 with SMTP id j61mr4181452wej.14.1287853429579; Sat,
	23 Oct 2010 10:03:49 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Sat, 23 Oct 2010 10:03:29 -0700 (PDT)
In-Reply-To: <1287841515-19825-1-git-send-email-koen@openembedded.org>
References: <1287841515-19825-1-git-send-email-koen@openembedded.org>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 23 Oct 2010 10:03:29 -0700
X-Google-Sender-Auth: VEITzq7WFObbt_WvkxGZ8hrQPcY
Message-ID: <AANLkTinLeN9pCrmwtZYxv7HhLgzfhq+HKhkBm0hLpm9x@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.41
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Koen Kooi <k-kooi@ti.com>
Subject: Re: [RFC][PATCH] module bbclass: split each module into a kernel-module-<foo> subpackage and use PN as metapackage
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
X-List-Received-Date: Sat, 23 Oct 2010 17:04:30 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Oct 23, 2010 at 6:45 AM, Koen Kooi <koen.kooi@gmail.com> wrote:

> From: Koen Kooi <k-kooi@ti.com>
>
> Signed-off-by: Koen Kooi <k-kooi@ti.com>
>
> ---
>  classes/module.bbclass |  191
> ++++++++++++++++++++++++++++++++++++++++++++++-
>  1 files changed, 186 insertions(+), 5 deletions(-)
>


How about moving the common functions into oe.module or oe.package and using
them from module.bbclass and kernel.bbclass?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

