Received: from [74.125.44.156] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1KGxyF-0004yW-VR
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jul 2008 17:22:12 +0200
Received: by yx-out-1718.google.com with SMTP id 4so1111908yxp.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2008 08:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:reply-to:to
	:in-reply-to:references:content-type:date:message-id:mime-version
	:x-mailer:content-transfer-encoding;
	bh=TJPGwT+kaPeLnNh1RVBpR2ukAHdSIN4f6X05ditkPvk=;
	b=gLoK3E+J2EKlkW3EXj2EogLXbWiUkxiJD84K1+ielFCqGC+KdPuZXX/H46gDCIGqu9
	5WdOMiri+Nf/SRhsTDXsX09q7W78BY0CLnpt98XHjZQpD6aVnOVd/8rp6kZP7aVSpEBY
	wIVXuAfDOYmUi2lk5qlDYa9mOQykfyX3UCAvw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:reply-to:to:in-reply-to:references:content-type:date
	:message-id:mime-version:x-mailer:content-transfer-encoding;
	b=G2PTifWd3dJuxfk23yo4m3t7SxNobH/PyqRArMpL/Jek++EQOiPmZ7Yvmz4HbVfavr
	FowUOXs/kAoSvW5vbtLlJYWihq4FFaSh59F9Q/+MS764dTjgBQcQKeAkOhzf2lEm0j5z
	24MvgVfs0YHs8WAR1IJNH/YAqv8jWT2YhQiRo=
Received: by 10.115.33.1 with SMTP id l1mr11070743waj.228.1215703316174;
	Thu, 10 Jul 2008 08:21:56 -0700 (PDT)
Received: from ?192.168.1.71? ( [71.146.10.255])
	by mx.google.com with ESMTPS id 28sm214165wfg.15.2008.07.10.08.21.25
	(version=SSLv3 cipher=RC4-MD5); Thu, 10 Jul 2008 08:21:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <48761569.4080304@gmx.net>
References: <48761569.4080304@gmx.net>
Date: Thu, 10 Jul 2008 08:21:24 -0700
Message-Id: <1215703284.32070.6.camel@isis>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.2 
Subject: Re: prevent -O0 for glibc builds?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Thu, 10 Jul 2008 15:22:12 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-07-10 at 15:58 +0200, Robert Schuster wrote:
> Hi,
> recently I set the (debug) optimization flags to "-g -O0" (= really
> no-optimization and full debug infos) and got an error from the glibc
> builds because glibc's configury told me that it cannot be compiled with
> no optimization.
> 
> Would it be possible that the glibc recipes replace -O0 with something
> else and print a note about this instead of failing? The reason is that
> the current behavior prevents me from compiling a whole image without
> optimization.
> 
> The reason I want -O0 in the first place is that while debugging an
> executable gdb told me that certain variables where optimized out.

glibc expects some optimizations like inlining for loader's early
startup code because it can not make function calls as the PLT has not
yet been relocated.

Thx

-Khem

> 
> Regards
> Robert
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



