Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OyX4A-0005Vk-1d
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 23:43:16 +0200
Received: by wwb17 with SMTP id 17so360773wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Sep 2010 14:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=giWzaIL1NIWovxLforrd4DsDP59UCvstkui+ZxOOAsQ=;
	b=Pudf9FZNCxRg3EOjOb1C3jDflQyfpl1m+FGxn6s/FNQWw4V7afpZ9AKXORZs8rIprO
	KdV3D8nksQfB25Y8alY8c4fCfzgcW5nds44nvKdtjpkuzAFIquL4gAh9TbfQnR3V5L0W
	9hTLaLe3saWY5Hd6GhqDo+7Z6R2S8fmEVqBSw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=wpebO9gB5cWI+4wnG1Vr5FePUbDYZHec4c9lNhoLJnF8kxEf20bKkFwvxjsGgCwR1T
	z0SHXJFoH1CiS7JTviCZBnndCoAPsikUJJz1YTplQdtmtEbfV+VtqlGrPxd21uGLfWTa
	n8BbO2NaQz6oJUh3joXFxtUyEPjAj1s8sNV3E=
Received: by 10.216.12.8 with SMTP id 8mr7465633wey.107.1285191424558; Wed, 22
	Sep 2010 14:37:04 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.169 with HTTP; Wed, 22 Sep 2010 14:36:44 -0700 (PDT)
In-Reply-To: <1285189329-32344-1-git-send-email-raj.khem@gmail.com>
References: <1285189329-32344-1-git-send-email-raj.khem@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 22 Sep 2010 14:36:44 -0700
X-Google-Sender-Auth: Vc2V25odvo8JOQdjjeLQnN0T5JA
Message-ID: <AANLkTikRBF+0hY2ZLT7d1DZe4FF4UE+9aVopECrpROqr@mail.gmail.com>
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
Subject: Re: [PATCH] oe/patch.py: Remove series file during Clean()
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
X-List-Received-Date: Wed, 22 Sep 2010 21:43:16 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 22, 2010 at 2:02 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Currently if there is a failed do_patch the series files get appended
> so if there were two patches
>
> a.patch
> b.patch
> and b.patch failed during next run it would append a.patch again
> a.patch
> b.patch
> a.patch
>
> and this would keep growing.
>
> We can remove series file in Clean() because we populate it in Import()
> anyway
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>


Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

