Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Othmg-00075b-3h
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 16:07:31 +0200
Received: by ewy7 with SMTP id 7so898857ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 07:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=MIxXHEwKEmr86Qp57Q3dk5fg2hV2x9yeOOuczxZxj64=;
	b=UEBQhENfnkL3GNEhL/OurG5KYarg/jqXsb409KdHnJrpGObiaEmhK9kJ+nMrjWF/Xm
	g+E5IxfIciLh3ZMpWn8jwKKZEPnoB5EycQhO6NeNTq25Dm4UVYRg3CqlUcoPj1trzWaW
	l8KxiXQ3GlxfMmIE9ZrAjJNo2FNyGCc8PBqpk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=xzw1f8oiOUSlvtK0yKqYyD0Igw5euJWtJ7ix23ODjfE1k8bUducLFaAElw0BLHsEaH
	+hYfqnUxslQD4SaAtn0V/BGVrGHFTvAEsbnpUplvUZHbOEoxDivXvNQRFLr/WCUcjqEx
	zU2aP7yMCMhNpNZGgTJwHZNAFcRyI3C+8Q+/w=
Received: by 10.216.184.19 with SMTP id r19mr470555wem.36.1284041202280; Thu,
	09 Sep 2010 07:06:42 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.168 with HTTP; Thu, 9 Sep 2010 07:06:22 -0700 (PDT)
In-Reply-To: <AANLkTimLWtJhYn009OchBss+LJpNx9Pt+nDZ=GGyu=a7@mail.gmail.com>
References: <1283453522-8408-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTinC5biQ7FcBD86SUssEytzhjyiK5hEzdLdaM_6P@mail.gmail.com>
	<1284024609.28520.1446.camel@mill.internal.reciva.com>
	<AANLkTimLWtJhYn009OchBss+LJpNx9Pt+nDZ=GGyu=a7@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 9 Sep 2010 07:06:22 -0700
X-Google-Sender-Auth: KPdrSbIP5xXnRrq4Z3AWttfw7Ng
Message-ID: <AANLkTimOLsxX_hf6rsOyOCJgFdBrkrL=2LsT9ToCfazv@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: tsc@openembedded.org
Subject: Re: [PATCH] base.bbclass: fix soc-family test
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
X-List-Received-Date: Thu, 09 Sep 2010 14:07:31 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 9, 2010 at 3:11 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> Acked-by: Denys Dmytriyenko <denys@ti.com>
> Acked-by: Koen Kooi <k-kooi@ti.com>
> Signed-off-by: Koen Kooi <koen@openembedded.org>
>
> I would suggest modifying the commit policy disallowing these kind of
> things, saying the two Ack's must be from two developers not
> affiliated with the same company.
>

I'd agree with this quite strongly.  I'm generally pretty careful to let
others review the changes from my coworkers, to avoid any bias.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

