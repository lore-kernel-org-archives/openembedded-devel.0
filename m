Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P7gDn-0006t6-W9
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 05:17:13 +0200
Received: by ywl5 with SMTP id 5so164767ywl.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Oct 2010 20:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=/47WikEF5+zBgFjjVfTUwmHV9uBqoxUGg88NIozTMeo=;
	b=k6sxIVmTk76Dqx0hBcREgpvO/qc/4Vdx6U8IPJyXjLiYP3FuRWg8ytxTDBeUmU9JJo
	Gb3gc2oofeEB66GrJiBE4xZfXZE/fr4PnvGoBe7KKe6hXpqMHzfI4xOrOO2V01hpn4h3
	aUev8MJhqYhDif8c5toT7hHftrDo1OVfQCVvs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=K6npe3ujLgabyNWMeA+gZnb+oe3oXxO0aeXbrJWCFfqTecLjKCHeG7cXBezwBzLT9Z
	KVwknQZBUWiZ8xFF/pL1bjjTE9Hvg9Hfl4Xt1HXIoDBAQR9bfGGbv+s1IXP6TklVld5M
	6KDVsk7NrUyghyrVffVyfGKEvQsstLI0p/F7I=
Received: by 10.90.102.10 with SMTP id z10mr1562580agb.155.1287371796699; Sun,
	17 Oct 2010 20:16:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.6 with HTTP; Sun, 17 Oct 2010 20:16:16 -0700 (PDT)
In-Reply-To: <AANLkTi=9bQq6q8NBTPgHhGMfmLs6Ae+oiLugNd+RyK=2@mail.gmail.com>
References: <1286544852-15635-1-git-send-email-msmith@cbnco.com>
	<AANLkTi=9bQq6q8NBTPgHhGMfmLs6Ae+oiLugNd+RyK=2@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 17 Oct 2010 20:16:16 -0700
Message-ID: <AANLkTikYuii4mEWxWh7HahgFVzYgaUz-DADyUyibqa4d@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] package.bbclass: copy dotfiles in root D to PKGD
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
X-List-Received-Date: Mon, 18 Oct 2010 03:17:13 -0000
Content-Type: text/plain; charset=UTF-8

hmmm I guess I am late in responding anyway I want to request to
revert this patch as it has already been pushed.
When compiling lirc do_package hangs forever the reason is that lirc
has some files in its install tree which are named pipes
and shutils.copy* functions do not consider special functions as I see
in the documentation

http://docs.python.org/dev/library/shutil.html

 and there is this bug report

http://bugs.python.org/issue3002

which clarifies it more which means unfortunately we have to keep
using 'cp' in this case.

is revert ok ?

Thanks

-Khem

On Fri, Oct 8, 2010 at 6:16 PM, Chris Larson <clarson@kergoth.com> wrote:
> On Fri, Oct 8, 2010 at 6:34 AM, Michael Smith <msmith@cbnco.com> wrote:
>
>> Use shutil.copytree() to copy D ("image") to PKGD ("package"). The
>> previous system("cp %s/* ...") missed dotfiles/dirs at the top-level.
>>
>> Signed-off-by: Michael Smith <msmith@cbnco.com>
>>
>
>
> Acked-by: Chris Larson <chris_larson@mentor.com>
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


