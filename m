Received: from [209.85.222.197] (helo=mail-pz0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MVhF3-00033r-Tk
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jul 2009 09:36:58 +0200
Received: by pzk35 with SMTP id 35so102382pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jul 2009 00:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=dDaIRTcEmSo7L6c74Gt509MPly4n4MEHYaFOWbatUt0=;
	b=YwNGhvreeZtWfQSdWL3LwIhOblfDDWuqer8sFV6ly0cQh6EhmQkEzZv6+SZYwrDtEs
	kLTq1tRfEgz/IYBgRz9hz5lO1id2MCByeQUtXZXUT91/P4pSYvCtVcvLktSi9AOg9OUt
	zyU3o7eMRNpxnFekApCz9ZyvQsLUYnn4+prx4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=UAl9i48H4LGFoOWuYBt/Cau6iK5j0ONgtmEa3T/2ZoZPDKpONLyUmi1V6XNoM6J+hs
	cZNSAslZm1EZbmFMU/pQ1g4jGLqfFGkE1+X1IEwTWqeeNwFTpgBe+U+hf6mKsDFzx2LN
	Ftl0GNKn29ooaB/eRsx5uvoHSX7LrGoLhtvoQ=
Received: by 10.114.185.20 with SMTP id i20mr11380955waf.62.1248765729601;
	Tue, 28 Jul 2009 00:22:09 -0700 (PDT)
Received: from gmail.com (adsl-71-146-0-187.dsl.pltn13.sbcglobal.net
	[71.146.0.187])
	by mx.google.com with ESMTPS id v9sm15273909wah.36.2009.07.28.00.22.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 28 Jul 2009 00:22:08 -0700 (PDT)
Date: Tue, 28 Jul 2009 00:22:02 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090728072202.GA5422@gmail.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: [RFC] Adding TLS selection choice to metadata
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
X-List-Received-Date: Tue, 28 Jul 2009 07:36:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

Enabling TLS support on uclibc/glibc is not sound enough in out build. Reason is we depend upon
various autotools tests to find out if the software combination we chose can support it or not
and these tests are not doing the correct think many times.

TLS is a libc feature from software POV. Implementation also depends upon hardware if there is
some special support available. 

Right now we have TLS support enabled by default in toolchain which works ok for newer glibc which have
TLS support in both Linuxthreads as well as nptl but it does not work so well with uclibc
and I think same will be case with klibc.

We need to disable it in the cross compiler while building the compiler so the TLS tests in 
subsequent applications which only tests for __thread acceptence dont assume that TLS support
is available in the system. 

I thought of putting it in metadata like TARGET_FPU and which can then be set from various other 
conf files.

A cheap workaround is that we could assume that TLS is only supported for glibc and disable it
for other libc variants but then NPTL is coming (whenever it comes) in uclibc so some architectures
in uclibc will support NPTL and some wont. Therefore defining it in metadata will give us the 
fine granularity to set it.

Ideas ?

Thanks

-Khem




