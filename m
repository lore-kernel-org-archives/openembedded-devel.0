Received: from [209.85.132.246] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1M7r3F-0005wK-2p
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 May 2009 15:14:13 +0200
Received: by an-out-0708.google.com with SMTP id b6so1323359ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 May 2009 06:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=KDSQndeAi/5lNM6uBaPl6n7fAICgyE7OGa9ffpcVAnQ=;
	b=hfY0Ggf6f8z5m/qHRlAu65mIb3ZbQEbw+5+daIk8QGn21DOMW03tHj+v3FNVqRC7jt
	r9LzxxP9nxfjjWYkZ21KowgSVWXXBxkUM5geMbeVXPNoXw7wus2f3Q/oO0NhkFdlhwFd
	Znmj3XQfNF78y1Tv6y++ZNwecYt9Wc6aIhSmQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=EMCtQ9qq9CxhohXlLytoqaff2+Hx1Zbk11KhwEhe2t5CjJmd0K2onqZLuh6cprCjsQ
	ddp4E1S8Z7Rh4cXt+UwABkgvdI3OgGVC97JN06d+OaXq4BFo3Br+wxoN3VrfD/Te3FuJ
	v1aHo9FdyTV1EGGoM3iY5LE7XqJs94VcCuXMw=
MIME-Version: 1.0
Received: by 10.100.105.4 with SMTP id d4mr9284371anc.39.1243083985660; Sat, 
	23 May 2009 06:06:25 -0700 (PDT)
In-Reply-To: <20090522213142.GF23842@smtp.west.cox.net>
References: <20090522213142.GF23842@smtp.west.cox.net>
Date: Sat, 23 May 2009 15:06:25 +0200
Message-ID: <c384c5ea0905230606t48e57c58y658282e25c97fbee@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Kernel recipes with broken PRs now
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
X-List-Received-Date: Sat, 23 May 2009 13:14:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello all,

On Fri, May 22, 2009 at 11:31 PM, Tom Rini <trini@embeddedalley.com> wrote:
> Hey all. =A0With the MACHINE_KERNEL_PR stuff, the following recipes will

I don't get the use case for MACHINE_KERNEL_PR, can someone explain?

Why would a machine or local.conf want to force rebuild by increasing
this MACHINE_KERNEL_PR variable??

Why does bitbake -c rebuild fail for this use case?


Also, if it makes sense, is this patch handy?

"[oe] [PATCH 1/1] bitbake.conf: make MACHINE_KERNEL_PR defaults to PR'

Regards,
--=20
Leon


