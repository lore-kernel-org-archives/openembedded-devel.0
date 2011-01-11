Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PckBv-000698-6d
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 20:47:39 +0100
Received: by eya28 with SMTP id 28so9149910eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 11:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=sIes1O8n//11Il8om+2ycR19VOMWtzehwxYX/HQlH+U=;
	b=BRKIRU7yCymind/zEVZ99MkOSTtL9lUOaCf9DprxkezC5ScQsG7xaH1y1qmTL2b19B
	BUj3OL5gC8n4zZIt2WJMkdymHXAyR90tdTUkzUMsBMNw5WIW2HUt2WsBqsZU0NxENXu+
	pjYJs4Kp7eR/FbUjcDRZOwLQrLo4akxwsYvxo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Fr5+73phiHCcxtYImQ8jdANfgYNuiP1GdFWAF8Addh7CQjddSZa826FQ147p2RjHob
	R3ld4Rjr+dAZiOLn7NV1FiA1a6jFw5sBsAAUQ18YXhqNjk6If95FaOJNBQHC14qbny2n
	nCU5SV5PZ02Y4y3ZUkqx2yUbi0czzKB3v4F1I=
Received: by 10.223.83.8 with SMTP id d8mr19169fal.94.1294775225093;
	Tue, 11 Jan 2011 11:47:05 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id z1sm7549981fau.21.2011.01.11.11.47.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 11 Jan 2011 11:47:03 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PckBJ-0001t7-Po; Tue, 11 Jan 2011 20:47:01 +0100
Date: Tue, 11 Jan 2011 20:47:01 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110111194701.GD6584@mx.loc>
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
	<1294084926-3115-5-git-send-email-rep.dot.nop@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1294084926-3115-5-git-send-email-rep.dot.nop@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 05/12] uclibc: shared-flat: put crtreloc.o into -dev package
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
X-List-Received-Date: Tue, 11 Jan 2011 19:47:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[khem, thanks alot for pushing the already ACKed hunks, i would have
only pushed them now.. |-) ]

khem, i know that flat is NIH in OE ATM but i consider this preparatory
work. I still feed my bfin with my own setup but that hunk is
potentially a step in the right direction -- towards OE. So..

ping?
cheers,

On Mon, Jan 03, 2011 at 09:01:59PM +0100, Bernhard Reutner-Fischer wrote:
>Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
>---
> recipes/uclibc/uclibc.inc |    3 ++-
> 1 files changed, 2 insertions(+), 1 deletions(-)
>
>diff --git a/recipes/uclibc/uclibc.inc b/recipes/uclibc/uclibc.inc
>index 09f5af7..1c7dfc3 100644
>--- a/recipes/uclibc/uclibc.inc
>+++ b/recipes/uclibc/uclibc.inc
>@@ -52,6 +52,7 @@ FILES_uclibc-dev_append = "\
>         ${libdir}/lib*.so \
>         ${libdir}/*_nonshared.a \
>         ${libdir}/[S]*crt[1in].o \
>+        ${libdir}/crtreloc*.o \
>         ${libdir}/lib*.a \
>         ${includedir}/*.h ${includedir}/*/*.h \
>        "
>@@ -60,7 +61,7 @@ FILES_uclibc-utils-dbg += "${bindir}/.debug ${sbindir}/.debug"
> FILES_uclibc-gconv = "${libdir}/gconv"
> FILES_uclibc-thread-db = "/lib/libthread_db*"
> RPROVIDES_uclibc-dev += "libc-dev virtual-libc-dev"
>-# uclibc does not really has libsegfault but then using the one from glibc is also not
>+# uclibc does not really have libsegfault but then using the one from glibc is also not
> # going to work. So we pretend that we have it to make bitbake not pull other recipes
> # to satisfy this dependency for the images/tasks
> RPROVIDES_${PN} += "libsegfault"
>-- 
>1.7.2.3
>


