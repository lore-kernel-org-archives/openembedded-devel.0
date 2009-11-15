Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1N9mZh-0002YW-He
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Nov 2009 22:24:03 +0100
Received: by bwz9 with SMTP id 9so4782155bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2009 13:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=eBVFxTdGXaWcCzhwMqNeEGoXXG22zEWSN2+b7RgwYx4=;
	b=LRG8NgPpJRstAEyw1cBnL/WsRGnOq6JBfPgD83Hr/EY+cEQMQwt+6dq5S3K8h+PC4b
	vZz7nqaytIXYYR74yGrhuR8weSrX0mIXzAU1NqD5kVJ14zkRvO3wauOkEVg2lSHoM9x3
	ddQqMd3Zl8ibgyuH0ld4/bspymml8g9F9z2xE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Dp7bWFbbtq4DfpUF+0ni39Z6FzgH8kS/2JTfLEMPPOph/k34Fk1N9xEbcsSPCZe9hT
	SlHVoVzEflAMWjCRRtmE+RGuo3ZW1GpOJjPR69owm8ynqx9CdwvO0qDbvVMcGeyrOrDW
	6kiA3LwujwBGzs9XrLmvr7selHr1TSX41HdoM=
MIME-Version: 1.0
Received: by 10.223.55.152 with SMTP id u24mr69682fag.24.1258320155141; Sun, 
	15 Nov 2009 13:22:35 -0800 (PST)
In-Reply-To: <20091115163618.GA3317@jama>
References: <20091115163618.GA3317@jama>
Date: Sun, 15 Nov 2009 22:22:35 +0100
Message-ID: <141020e30911151322m592f41e5w49f40ad90c8263ee@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: SRCPV migration
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
X-List-Received-Date: Sun, 15 Nov 2009 21:24:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Nov 15, 2009 at 5:36 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> As I sent earlier as reply to [PATCH] bitbake.conf: SRCPV always
> upgradeable
> paths for git recipes.
>
> First few changes are already in martin_jansa/srcpv branch. All changes to
> svn.bb
> recipes seems safe, so I would like to push them really soon. For git.bbchanges
> I need your advise/ack so please reply.
>
> Is there better way to create upgradeable path then bumping PE? Package
> names/.ipk filenames are a bit ugly with PE imho.
>
> Should I prepare one BIG patch for all recipes or commit them 1 by 1?
>
> XorA said that migrating all recipes at once in his xora/angstrom-srcpv
> branch was too much work to maintain and push. So I would like to push
> it directly to oe.dev or with really short lived tmp branch, if all
> agree that we should migrate all packages globally.
>

 Almost all changes for SRCPV (no SRCREV in my tree now, just few recipes
named *git.bb doesn't have SRCPV in PV yet..)
are in martin_jansa/srcpv branch please review them or even cherry-pick some
if you're maintainter of some changed recipes.

Thanks a lot

Regards

