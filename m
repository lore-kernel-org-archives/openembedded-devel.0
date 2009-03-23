Received: from [209.85.132.241] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LlrHJ-0004OS-2d
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Mar 2009 22:01:49 +0100
Received: by an-out-0708.google.com with SMTP id b2so2558179ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Mar 2009 14:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=YKH6Kc9UCXcXZD30ntjWx44CWBb5JCESm8JgCkQ1/Pc=;
	b=x6jUQNron2swpLnReEr7WeXjjRUVCHtpMjhr3Y+YRMizA39NobdWs/XkOKGdOqqOmV
	uvzJuP097u0ZwjfTgoicrYOWWu2jLa4QgD+bhQdYuHJV+fS3HtNaVoWJeIyATXjvQX3a
	0PwO09pEsqswj7M2jRultTSduje0Tc6KIMdIQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=OCyx+Y7+Grk5hVfRQ3zdxARQEUtB4bwnJQ6JhgYQm02/Xc0BUQ/Yn398DtKs3R6dxY
	duK3NZNBv9XslXkgVUlGSaYsT/DySdp0UAbnBa5lU6YM1wYMaTVTikOIQZY3XcN2c51H
	rw4AvRflK0zTIN469i3iBx4z9UMfBDS3+PxUQ=
MIME-Version: 1.0
Received: by 10.100.252.18 with SMTP id z18mr3175225anh.73.1237842024608; Mon, 
	23 Mar 2009 14:00:24 -0700 (PDT)
In-Reply-To: <1237835454.6521.9.camel@northpole>
References: <1237835454.6521.9.camel@northpole>
Date: Mon, 23 Mar 2009 14:00:24 -0700
Message-ID: <19c1b8a90903231400u397a7eg6c7bf4ef80b676ca@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: libxml2-native build against host zlib.h
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
X-List-Received-Date: Mon, 23 Mar 2009 21:01:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

2009/3/23 Jader H. Silva <jader@2mi.com.br>:
>   It seems libxml2-native is built using host zlib.h.
>   My host have a symbol redefinition in zlib.h (gzopen -> gzopen64), but
>   that symbol does not exists in OE compiled library.
>   Setting --with-zlib=${STAGING_INCIR}/zlib.h in libxml2-native.inc
>   solved it. There's a patch attached.

hmm setting --with-zlib to point to a single header file seems not
correct to me. Can you explore a bit more ? may be
--with-zlib-include=${STAGING_INCDIR} would be a better solution if
something like that exists and works.

Thx

-Khem


