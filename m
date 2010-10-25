Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PAWFB-000359-Ni
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 01:14:22 +0200
Received: by wwb39 with SMTP id 39so3197572wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 16:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=iAg7ZvsQlTOofSW4tRbU4/BfHiPdmegi1XVlH2rJ00Q=;
	b=T8DifOL2Lf7ZwBrRZzO95ioglIzNfx3gvATXukzom0Jao3N/ly/GFfsNQ4aN4U3lyS
	j3hpigCYb7w504gtvZAHzDy0Tn0vV8nbWcUzFtuAYGsHpUV2i21/hxZzFjKWxWR4HWtE
	q5tJJYXo57lGMIZeoq3rLf8NstyF8SmgXWric=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=eld4tk4P1wQxp97rhv9tRWzYbAoRSmEyCKKl7NuWRmNzvRhAjQqvUgwxX0p/UKnSIy
	bKQ7qVl+yLB7D/el4UsPRtlaz4V+bEknWd6/9bkL/NbZv9nNjZBU9/pVkDYXOuH80Yz1
	YsP1x4IPk4gsBhH1vppipMrF84Ip3LjorKyjE=
Received: by 10.216.66.146 with SMTP id h18mr955711wed.106.1288048420018; Mon,
	25 Oct 2010 16:13:40 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Mon, 25 Oct 2010 16:13:18 -0700 (PDT)
In-Reply-To: <AANLkTikN3W+uJrp_0PBrA=kPWFxTiitT5rOufbZF26uE@mail.gmail.com>
References: <1287841515-19825-1-git-send-email-koen@openembedded.org>
	<AANLkTikN3W+uJrp_0PBrA=kPWFxTiitT5rOufbZF26uE@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 25 Oct 2010 16:13:18 -0700
X-Google-Sender-Auth: _KFmt9L4R2wSgfYuJvPa7NCHaUs
Message-ID: <AANLkTi=DFz-3Q_81ke_=J93ky8sDjgkjL_9Bz2-Dcw+R@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
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
X-List-Received-Date: Mon, 25 Oct 2010 23:14:22 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 25, 2010 at 4:00 PM, Khem Raj <raj.khem@gmail.com> wrote:

> > +               cmd = "PATH=\"%s\" %sobjcopy -j .modinfo -O binary %s %s"
> % (bb.data.getVar("PATH", d, 1), bb.data.getVar("HOST_PREFIX", d, 1) or "",
> file, tmpfile)
> > +               os.system(cmd)
>
>
> may be we can get rid of os.system and use subprocess popen or something


We have convenience wrappers around subprocess both in utils.bbclass and in
oe.process -- probably easiest to use one of those.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

