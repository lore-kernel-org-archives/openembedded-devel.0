Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1O6PfJ-00066u-8k
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Apr 2010 16:52:06 +0200
Received: by vws5 with SMTP id 5so363345vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Apr 2010 07:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=7GbPX5pU65Igm6s9+KCROGQ/ADRaRBSYETRtiZ5vw7Y=;
	b=Yaywzyfbp04mc8qHCkZlJfMpkOzUu5tDSsTc6cpV6RIE8pk6b8A2IrTuiL1w+gMbL3
	hZaGaxvZZ831vcn3PCxt/Gc2uSMonw45N1O/fuPj0KuXFa9brsdFoaYNwjWTu/nbK3M+
	QzOZJ+RpP4NgMK9SdDUMeGRLZe9/qki8UXoUE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=eyFuLME2H+ri+bElnOEP6PRJKYGLEyiC9U/pk/9lTSfT7G81Plo2tV7u+pzsi/OOrs
	APBibpYDUiYuZX48SWAwj6+gqoyYwdMBADJx63/0y3beNrw1+km4Mk+7bZVcHXmjUbeV
	yjgXnynWukn9XH5xTZnmE3y+eWTb1apQsaBh0=
Received: by 10.229.97.147 with SMTP id l19mr887797qcn.24.1272293305211; Mon, 
	26 Apr 2010 07:48:25 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.188.213 with HTTP; Mon, 26 Apr 2010 07:48:05 -0700 (PDT)
In-Reply-To: <hr3pd4$akp$1@dough.gmane.org>
References: <1272274382-1983-1-git-send-email-mchazaux@adeneo-embedded.com> 
	<hr3pd4$akp$1@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 26 Apr 2010 07:48:05 -0700
X-Google-Sender-Auth: 8134a85988e99e83
Message-ID: <q2ib6ebd0a51004260748pff3b8e25n8b6d145436adacff@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] Add error handling to read_cache in stage-manager
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
X-List-Received-Date: Mon, 26 Apr 2010 14:52:06 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 26, 2010 at 3:20 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Looks good to me,
>
> Acked-By: Koen Kooi <koen@openembedded.org>
>
>
Same here.

Acked-By: Chris Larson <chris_larson@mentor.com>

Might also be worth catching ValueError there, to be safe (int("foo") raises
that :).
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

