Received: from [209.85.220.17] (helo=mail-fx0-f17.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay4mail@gmail.com>) id 1LXbdI-0004G9-Ik
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 14:29:36 +0100
Received: by fxm10 with SMTP id 10so1349123fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2009 05:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:message-id;
	bh=Q2EderkbOwpV2iH2z2WiN5zEXmF5Y1WWMJTA+KOASB4=;
	b=UJxfOh7dMs56jO8IfSt+tFVNw16mHKjHGLaxfK/PWi59yTqJdEhQ6U1bsE1jRd2En4
	umJkjn5s3p0GChMH7NIQQLG7W1hE+VtWD5qe5TXrSyVyVZ3xBjJhD6U7yisB2Mk47Fdr
	0/uuqVAc+QqwBaA5IWB2a+Wsz0kXMTMmHXYOI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:references:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:message-id;
	b=I4UVGsIaZRs2aBhx85E1E4K5SVM8w9KrzWmfZNUAJBsxzdRMNF7TjeY0gz8QsPVbC5
	xChEB+6cK30f2zPyCVuhWe8023psFZ4pqiK6EEEEPI2zMUaTxXoy90QYPMR2eOVLinUn
	3KKVjPuJ7NGJYPVNIDEv8RSK/xEXxskyK/AEc=
Received: by 10.103.227.13 with SMTP id e13mr362836mur.20.1234445046874;
	Thu, 12 Feb 2009 05:24:06 -0800 (PST)
Received: from is.home ([93.81.136.171])
	by mx.google.com with ESMTPS id 23sm13044mum.7.2009.02.12.05.24.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 12 Feb 2009 05:24:06 -0800 (PST)
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2009 16:24:02 +0300
User-Agent: KMail/1.9.10
References: <200902121426.26727.roman@khimov.ru>
	<200902121541.09495.roman@khimov.ru> <gn160m$8s4$1@ger.gmane.org>
In-Reply-To: <gn160m$8s4$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200902121624.02569.jay4mail@gmail.com>
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
X-List-Received-Date: Thu, 12 Feb 2009 13:29:37 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello!

> > Now another question is why OE package uses such tarball as source at
> > all. So, probably we can change the source to something like
> >
> > http://www.freebsd.org/cgi/cvsweb.cgi/%7Echeckout%7E/ports/archivers/rp
> >m2cpio/files/rpm2cpio?rev=1.2;content-type=text%2Fplain;only_with_tag=RE
> >LEASE_7_1_0
> >
> > which is the only file we need and it's rev'd tagged
> > should-be-non-volatile.
>
> Seeing the current sitation with the freebsd people this would get my
> vote.

You can grab it via cvs. E.g. (from taiwan mirror):
$ cvs -d :pserver:anoncvs@anoncvs.tw.FreeBSD.org:/home/ncvs login
Logging in to :pserver:anoncvs@anoncvs.tw.freebsd.org:2401/home/ncvs
CVS password:
$ cvs -d :pserver:anoncvs@anoncvs.tw.FreeBSD.org:/home/ncvs co rpm2cpio
cvs checkout: Updating rpm2cpio
cvs checkout: Updating rpm2cpio
U rpm2cpio/Makefile
U rpm2cpio/pkg-descr
cvs checkout: Updating rpm2cpio/files
U rpm2cpio/files/rpm2cpio

rpm2cpio/files/rpm2cpio is file you needed.

Or you can grab it from cvsweb as Roman says.

Or you cat grab precompiled package but from some release. It should not be 
changed anymore. E.g. from 7.1-RELEASE for i386 arch:
ftp://ftp6.ru.freebsd.org/pub/FreeBSD/ports/i386/packages-7.1-release/archivers/rpm2cpio-1.2_2.tbz

-- 
Yuri Bushmelev


