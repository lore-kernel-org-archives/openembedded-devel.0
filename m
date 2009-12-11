Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NJET2-0007Rl-JX
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Dec 2009 00:00:11 +0100
Received: by fxm25 with SMTP id 25so1510509fxm.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2009 14:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=0Owf0/UalVHH63LbMmxpov7Z3mJ+Z6JkCt9ecYH8Qvw=;
	b=ZQI8GLByQK58W4Q9L8pM1bXMjdyrZgT+sIN+AfE7FujDjQZ3c77Nk4L0AZftEWP8YP
	2CVaJA8vbtOzigsyyQXFPkHVckLcMZHoGYHFpHvTEnJzqaw3k5PG3RaF1m+MbrLhqvm9
	A4NeFGF1LVsjyB+J6rbdZud1AXsugfCFM2Png=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ptuZPSQanbrX7XKdW8LFiJG4idIb4P9kYJb8T87VxVYf/ZBeMB4Gg0WnfA/sYfzUDK
	k3bfGOAr3wBw6geeXF3T/7yD5yt+kX/H4xT1a5+K90Cqthe78Wpll2ZHalvwjbBZykYG
	cSkrXDWnPlUrIPhfG/3TnNTYV8X/1LaH4mCsM=
MIME-Version: 1.0
Received: by 10.239.179.97 with SMTP id c33mr194994hbg.157.1260572304765; Fri, 
	11 Dec 2009 14:58:24 -0800 (PST)
In-Reply-To: <hfim4t$osr$5@ger.gmane.org>
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>
	<1260139496-21442-5-git-send-email-leon@sidebranch.com>
	<1260139496-21442-6-git-send-email-leon@sidebranch.com>
	<1260139496-21442-7-git-send-email-leon@sidebranch.com>
	<1260139496-21442-8-git-send-email-leon@sidebranch.com>
	<1260139496-21442-9-git-send-email-leon@sidebranch.com>
	<1260139496-21442-10-git-send-email-leon@sidebranch.com>
	<1260139496-21442-11-git-send-email-leon@sidebranch.com>
	<1260139496-21442-12-git-send-email-leon@sidebranch.com>
	<hfim4t$osr$5@ger.gmane.org>
Date: Fri, 11 Dec 2009 23:58:24 +0100
Message-ID: <c384c5ea0912111458q22c6da86p79a68a835a0331d0@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] angstrom-2008.1.conf: Use ?= on PREFERRED_VERSION_linux-libc-headers.
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
X-List-Received-Date: Fri, 11 Dec 2009 23:00:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Koen,

On Mon, Dec 7, 2009 at 11:41 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>
> That way we know that it is nios that needs an older kernel. The actual
> preferred solution is to patch nios2 support into linux-libc-headers-2.6.31.
>
The first fix is in my local branch.

I will do the second fix when I attack the MMU variant of the architecture.

Thanks,

Regards,
-- 
Leon


