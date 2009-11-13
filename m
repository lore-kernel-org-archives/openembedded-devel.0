Received: from [209.85.210.175] (helo=mail-yx0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N8tSd-0001J4-75
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 11:33:02 +0100
Received: by yxe5 with SMTP id 5so2863466yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2009 02:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=myMk//VmUL0nW1q9PherXDptengVtVv7+jhLA2bcC38=;
	b=Yl/2RPZl8AmszRWwlIa6a8zZiKVeR0RKmg1Gdh25N/cKMJeSLqXl7nSAbCGYg8xHZl
	4u1ztKVV8VQWLSPTmLXdfsS3smlBc5xQfyowDvEVmou6PTnnMFxzC+qLZccO+IXQfp0P
	tZvsWrY4u/IHljdob88zw2yk5CkQpcBvFqEq4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=V84r2+EJv+xXBkvweHH99zzD3xERVhksxV1eIT4+jd88wyR20JD8GXmaLVaYdFpwJy
	DCIJK9zp5thzjg+5hcygL7QFMad/lt47FgyX1oqnTpvmZzGfS9sHc9ZCiUx8dzxjpPPG
	u9L2Y391imS13NySBa2Q8Ubej4iB5VQRnsjt4=
MIME-Version: 1.0
Received: by 10.101.165.16 with SMTP id s16mr3494372ano.60.1258108296293; Fri, 
	13 Nov 2009 02:31:36 -0800 (PST)
In-Reply-To: <alpine.LFD.2.00.0911130447260.1157@localhost>
References: <alpine.LFD.2.00.0911130447260.1157@localhost>
Date: Fri, 13 Nov 2009 11:31:36 +0100
Message-ID: <ac9c93b10911130231m2ee5bae5hadd5d2e8435922b5@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: build breakage: sqlite3_3.6.20
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
X-List-Received-Date: Fri, 13 Nov 2009 10:33:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

2009/11/13 Robert P. J. Day <rpjday@crashcourse.ca>:

> tclsh8.4: error while loading shared libraries: libtcl8.4.so.0: cannot open shared object file: No such file or directory

A good plan is to check if tcl (or libtcl) is build.
Messages like this are typically an indication of a missing dependency
(especially if it does build for others)

We don't really have a good mechanism to verify that all dependencies are there.

Actually I guess something could be done by making a minimal staging
dir, make a backup of it, then build a package, restore the staging
dir, rebuild the next package (including all dependencies.
One could even do smarter and gradually add packages to staging to
minimise rebuilding of packages like e.g. perl.
In that case a dependency tree needs to be build and only packages on
a specific node needs to be checked.
Of course this does not help for superfluous dependencies.

Frans


