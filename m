Received: from [209.85.146.183] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JnLz4-0005wB-Tl
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Apr 2008 00:56:39 +0200
Received: by wa-out-1112.google.com with SMTP id l24so1834224waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Apr 2008 15:56:36 -0700 (PDT)
Received: by 10.114.110.12 with SMTP id i12mr4250653wac.73.1208645796409;
	Sat, 19 Apr 2008 15:56:36 -0700 (PDT)
Received: by 10.114.234.12 with HTTP; Sat, 19 Apr 2008 15:56:36 -0700 (PDT)
Message-ID: <19c1b8a90804191556k41e0413dhaca3ebcdbefdeedb@mail.gmail.com>
Date: Sat, 19 Apr 2008 15:56:36 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080416094240.GA15886@deadlock.dhs.org>
MIME-Version: 1.0
References: <20080415122902.GA13726@deadlock.dhs.org>
	<4804D346.50809@gmail.com> <20080415163930.GA14446@deadlock.dhs.org>
	<19c1b8a90804150947y484520a2j726123713ff216fa@mail.gmail.com>
	<20080416094240.GA15886@deadlock.dhs.org>
Subject: Re: How to properly enforce an ARM OABI build?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Apr 2008 22:56:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

>  The question now is - how could this be solved cleanly in Angstrom?
>
>  Would this be an option:
>  TARGET_OS ?= "${@['${TARGET_OS_UC}', 'uclinux-uclibc'][bb.data.getVar('TARGET_ARCH',d)  in ['bfin']]}"
>

looks ok.


