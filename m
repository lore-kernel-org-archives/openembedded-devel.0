Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PK5te-00018L-Bi
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Nov 2010 10:07:42 +0100
Received: by qwi4 with SMTP id 4so878457qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Nov 2010 01:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:received
	:in-reply-to:references:date:message-id:subject:from:to:content-type;
	bh=IDOnbDpC8bQynvCrbY2RB+mdnAoYSvZLD7pYVgXafCY=;
	b=du8/1G0Ef68zcdrktCjiOh1AH/Czh1SXTjxWbLN4VYqfdSJPm/Kc/lQKG5+GnPSAj4
	+LUlTd+NmlSpakB8TBn+JvVbw4wq0iIRS9Y7Q5LQWYWw9E6pzt9mds6d+ey8JcYpf6Tb
	dnXrPm6XcDXk0JZCTjOjVgKysYeV/U3CmfZq4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=v+zWXBE9QiBhOX18OkjzujniuIxvgbyU5HKc2OkjkeXrXfTOIs89bYwDpECMjHkYi1
	bLfSuMDFteRQhkUwSsjzwR5EAO6lDuB3ceDDBUr4dnvxyRxu1jUBwPmZ62uHXEheQxFp
	mCryt4XVIx9LpoKAQ+B9VgZB3Jv/I3YhnaGwo=
MIME-Version: 1.0
Received: by 10.229.233.74 with SMTP id jx10mr3716517qcb.96.1290330391587;
	Sun, 21 Nov 2010 01:06:31 -0800 (PST)
Received: by 10.220.193.4 with HTTP; Sun, 21 Nov 2010 01:06:28 -0800 (PST)
Received: by 10.220.193.4 with HTTP; Sun, 21 Nov 2010 01:06:28 -0800 (PST)
In-Reply-To: <20101119210007.GC8017@gmail.com>
References: <1290179402-28793-1-git-send-email-fransmeulenbroeks@gmail.com>
	<20101119210007.GC8017@gmail.com>
Date: Sun, 21 Nov 2010 10:06:28 +0100
Message-ID: <AANLkTikJXyQVUc9cis3xfSZJ4NT2L5FXvFcTDGexBZn9@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] uclibc++: moved to git head
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
X-List-Received-Date: Sun, 21 Nov 2010 09:07:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

FYI, I have proper fixes for all of them here, will push them this evening
so oe can use pristine master.
Thanks,

On 21 Nov 2010 01:27, "Khem Raj" <raj.khem@gmail.com> wrote:

On (19/11/10 16:10), Frans Meulenbroeks wrote:
> Removed the 0.1.9 version as it is quite old and do...
ok I think this is due to conflict with function prototypes from libstdc++
I would suggest look into installed cstring and make them match.


> | WRAPPER_INCLUDEDIR=-I../include ../bin/g++-uc -ansi -fPIC -o eh_alloc.o
-c eh_alloc.cpp
> |...

