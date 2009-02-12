Received: from [209.85.218.165] (helo=mail-bw0-f165.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay4mail@gmail.com>) id 1LXb9T-0006NE-Jv
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 13:58:47 +0100
Received: by bwz9 with SMTP id 9so909322bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2009 04:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:message-id;
	bh=w3coH0hrkGBZepMiXKVqFoV5AsNst0GeANUSTY1LP8U=;
	b=Rsftei+Mtznmdz6pmMdDjNSAy+HWkS2GLRqXPTUKxM60+Ce5YfMMDn5+SmupCuLhWa
	K48yJdTKnOO/onVbWzOma0GX1RIKrJ6K9GMdDB6wnCKnRUSPnHCThNkXN+mABsF9ae4k
	waziU+T+nqQujxhofu+iSD6tDIKUnk9vVT08A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:references:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:message-id;
	b=m934YSPSaofOMwdCd06HxaOrWGkXXjYu6elmoCEu7nqehuA42dPm9EZn37Owuo/EJD
	D+GKWZf/Zn2bT1T8OJ1EhuH8cTA9C1UamGjlIlGQfeSY+DhTX0PV1s7A90VlL6dUPmGX
	3lu6BR6lUnAu5QyZd7jaV6xupSlGz5PXJ7adg=
Received: by 10.103.251.3 with SMTP id d3mr340418mus.72.1234443449143;
	Thu, 12 Feb 2009 04:57:29 -0800 (PST)
Received: from is.home ([93.81.136.171])
	by mx.google.com with ESMTPS id 25sm828559mul.51.2009.02.12.04.57.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 12 Feb 2009 04:57:28 -0800 (PST)
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2009 15:57:23 +0300
User-Agent: KMail/1.9.10
References: <200902121426.26727.roman@khimov.ru>
	<4994132E.2040603@balister.org>
	<200902121547.48057.jay4mail@gmail.com>
In-Reply-To: <200902121547.48057.jay4mail@gmail.com>
MIME-Version: 1.0
Message-Id: <200902121557.23426.jay4mail@gmail.com>
Subject: Re: [PATCH] Fix rpm2cio sums
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
X-List-Received-Date: Thu, 12 Feb 2009 12:58:47 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello!

> > >> [ftp://ftp.freebsd.org/pub/FreeBSD//ports/packages/archivers/rpm2cpi
> > >>o- 1.2_2.tbz]
>
> This
> (ftp://ftp.freebsd.org/pub/FreeBSD//ports/packages/archivers/rpm2cpio-1.2
>_2.tbz) is a freebsd precompiled package, not a source tarball. It can
> change checksum after rebuild. All files in 'packages' dir are
> precompiled packages.
>
> Source tarballs are placed here (in 'distfiles' dir):
> ftp://ftp.freebsd.org/pub/FreeBSD//ports/distfiles/

Ah, sorry, rpm2cpio have no source file. It is stored directly in ports:
http://www.freebsd.org/cgi/cvsweb.cgi/ports/archivers/rpm2cpio/files/

We can grab it via cvs.

-- 
Yuri Bushmelev


