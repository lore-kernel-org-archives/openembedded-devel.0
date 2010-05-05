Received: from mail-qy0-f181.google.com ([209.85.221.181])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1O9ZKR-0003oK-Mv
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 May 2010 09:47:36 +0200
Received: by qyk11 with SMTP id 11so6600309qyk.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 May 2010 00:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=xz1dTREcVxzP7yzAGQRYhTnTN/X4lJ923uAyX98jxYU=;
	b=nCIB6zYOlof3RWt61Z/3yhm6pcME8mlwdx+qQvXZjzu6xr8e911pHnWGC1kC12L7vl
	beQplFVgKiD0qrlaGfVQCSWas6G2f6mXu+VlkDq7vVUvGEeEpVH41nltBt84bKCnXOsB
	KybmFGGQhVdOhr+9Y73WZSRiKDzDGFE4Snl5s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=rg/4eRE1uyxLWQuoO5jYRVv0/a2fvm0iLLyCddjIXjogDe4TIRXlm9u05VyfYz1KF8
	gciPJxIsrQh7f/b0VO0/VWTkkNtfHGpNYAKJRq6RnwyxnnMYMR04vG4F3EmpxWspQDS6
	WSh1jlNw1Nw/zpFuo/jFNF7uWulwgWUfA5K8s=
MIME-Version: 1.0
Received: by 10.224.107.65 with SMTP id a1mr6094940qap.185.1273045426685; Wed, 
	05 May 2010 00:43:46 -0700 (PDT)
Received: by 10.229.24.149 with HTTP; Wed, 5 May 2010 00:43:46 -0700 (PDT)
In-Reply-To: <20100505064527.GA2444@xora-desktop.xora.org.uk>
References: <1273041286-632-1-git-send-email-hvontres@gmail.com>
	<20100505064527.GA2444@xora-desktop.xora.org.uk>
Date: Wed, 5 May 2010 00:43:46 -0700
Message-ID: <l2ka7f8874a1005050043i52ed483fl629d6eb71326ba@mail.gmail.com>
From: Hans Henry von Tresckow <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.181
X-SA-Exim-Mail-From: hvontres@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] libtorrent / rtorrent: add latest upstream versions and fix crash on nslu2
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
X-List-Received-Date: Wed, 05 May 2010 07:47:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 4, 2010 at 11:45 PM, Graeme Gregory <dp@xora.org.uk> wrote:

> You need to add a PACKAGE_ARCH_nlus2 = "${MACHINE_ARCH}" to this as its
> now nslu2 specific.
>
> Graeme
>
>
How should I apply the optimization only for nslu2 and other xscale
machines? To make matters even more complicated, it seems that gcc > 4.3.0
doesn't need this workaround.

Any pointers would be appreciated. Also, should I fix up the older revisions
as well or just the newest version?
-- 
Henry von Tresckow (hvontres)

