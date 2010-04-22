Received: from fg-out-1718.google.com ([72.14.220.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1O4yDb-0003un-C3
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Apr 2010 17:21:33 +0200
Received: by fg-out-1718.google.com with SMTP id e12so346608fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Apr 2010 08:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=coiqCQsXvFc0GeBqA1MaCf9p5B7qjplv8D60HdDpiTQ=;
	b=nuVK+Owe1lKU2+ELh/xCdoJ9iIneMJPrExy87fXGsgNyN2q5bku6pAuIBETzg+BYVp
	dIhq9sp3/L+7T6b4S61iYKiXP3F0Q3HYwso56oi302xc3cw/+kLhItvhlIVQY+tqhUrz
	TnY6rnMG/DA9vIMyo0CvP0+d7diVh6QwwJEAs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=i6P9jTGvqcabPIZFPh3lZR1t+KN06hj5aFYq6wC0hREMLowtKQNJh8dSX3Jtes33y1
	XKQcGRv4UI2A5aZ3CRWtiGSzW0rY7hai1NOAJ3RVgf8AgLSbCJL/Hv4aZF+MwBYckzS+
	+ArgKItgcuMbIKveD8Q7ANapO+7PXfUghdQ5Y=
MIME-Version: 1.0
Received: by 10.223.108.72 with HTTP; Thu, 22 Apr 2010 08:15:00 -0700 (PDT)
In-Reply-To: <1271948430-30162-1-git-send-email-ospite@studenti.unina.it>
References: <1271948430-30162-1-git-send-email-ospite@studenti.unina.it>
Date: Thu, 22 Apr 2010 17:15:00 +0200
Received: by 10.223.143.67 with SMTP id t3mr78749fau.16.1271949300673; Thu, 22 
	Apr 2010 08:15:00 -0700 (PDT)
Message-ID: <k2l141020e31004220815uabf537a4k994b108f529426f6@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 72.14.220.152
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] python-2.6.4: make Modules/_ctypes/libffi configure
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
X-List-Received-Date: Thu, 22 Apr 2010 15:21:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 22, 2010 at 5:00 PM, Antonio Ospite
<ospite@studenti.unina.it> wrote:
> This fixes configure issues with recent autoconf, e.g:
> =A0autoreconf: Entering directory `Modules/_ctypes/libffi'
> =A0autoreconf: configure.ac: not using Gettext
> =A0autoreconf: running: aclocal --force
> =A0configure.ac:26: error: m4_copy: won't overwrite defined macro: \
> =A0 =A0 =A0_AC_ARG_VAR_PRECIOUS
> =A0configure.ac:26: the top level
>
> It also adjustes Makefile.am to take into account the fact that python sh=
ips
> incomplete source from libffi.
>
> Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

I'll apply soon with added PR bump.

Thanks!


