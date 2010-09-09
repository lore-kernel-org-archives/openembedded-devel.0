Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OtiPy-0004A1-2X
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 16:48:02 +0200
Received: by gxk2 with SMTP id 2so672187gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 07:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=rkYH/96e2yTyWZWWTBNlQiQ1k66FKan+h2SpXw/9CQc=;
	b=BWkEK+aryTVNeDm38ebtQI5QH9KUy76VPnyIwsSUrJVbEkc06viGZuz0U5a3wgbnbT
	fox85YYmEljV0vDLmT3cAvYJz5Mrxugs0M7oPnm2a1CqeUWm6bUqxWRoQOu9aFJtszaX
	dHXNtpsbReqOvvOt50sh9m1BbjqhKlA5RFcEw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=H6zMvqbhaBs3bDTHlDts5XTkRoD89g1yEOm09slO1vwREsDQYmis/m/NWrpOZs+4wD
	vPjDkPhBySkNSXUWJvTcvj73ydW3+1nSSr7IAeFdCDO5B/q7Ar68JvOW6kx5VBFgh5OU
	jvCUIHCCv9L+5f6dnuvaXO3QeKf6r2lrEntvw=
Received: by 10.100.209.9 with SMTP id h9mr1545438ang.189.1284043638514; Thu,
	09 Sep 2010 07:47:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Thu, 9 Sep 2010 07:46:58 -0700 (PDT)
In-Reply-To: <AANLkTikamPAk9W64hf3HYX4effDwOovU=rvs=CiwccgS@mail.gmail.com>
References: <AANLkTikamPAk9W64hf3HYX4effDwOovU=rvs=CiwccgS@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Sep 2010 07:46:58 -0700
Message-ID: <AANLkTikxykdyukc+Qak3q-LnfH08TBADVmPbsXX2XVJk@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: slugos/nslu2le/binutils build: fail
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
X-List-Received-Date: Thu, 09 Sep 2010 14:48:03 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 9, 2010 at 2:42 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> I was asked to give slugos as spin on the autobuilder, and as slugos
> still occupies a sweet spot in me I gave it a spin.
> Unfoprtunately things did not build:
>
> distro: slugos
> machine: nslu2le
> bitbake target: binutils
> libc: glibc.

as I can see slugos uses eglibc 2.11 is there any special reason you
chose glibc 2.10 ?
I would suggest to try the defaults and subject of this email is wrong.

>
> Failure is in building glibc.c:
>
> | /home/hudson/jobs/FM_test/workspace/tmp/work/armv5te-linux-gnueabi/glibc-2.10.1-r36.1/build-arm-linux-gnueabi/libc_pic.os:
> In function `faccessat':
> | find_exidx.c:(.text+0x900e8): undefined reference to `fstatat64'
> | collect2: ld returned 1 exit status
> | make[1]: *** [/home/hudson/jobs/FM_test/workspace/tmp/work/armv5te-linux-gnueabi/glibc-2.10.1-r36.1/build-arm-linux-gnueabi/libc.so]
> Error 1
> | make[1]: Leaving directory
> `/home/hudson/jobs/FM_test/workspace/tmp/work/armv5te-linux-gnueabi/glibc-2.10.1-r36.1/glibc-2.10.1'
> | make: *** [all] Error 2
> | FATAL: oe_runmake failed
> NOTE: package glibc-2.10.1-r36.1: task do_compile: Failed
>
> I can imagine this has something to do with kernel headers, but didn't
> investigate.
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
-Khem


