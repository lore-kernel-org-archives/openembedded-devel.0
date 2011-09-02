Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QzN9q-00087v-5h
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Sep 2011 08:23:18 +0200
Received: by bkbzu17 with SMTP id zu17so2349671bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 23:18:21 -0700 (PDT)
Received: by 10.204.142.152 with SMTP id q24mr313363bku.207.1314944300963;
	Thu, 01 Sep 2011 23:18:20 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id zw12sm258134bkb.10.2011.09.01.23.18.19
	(version=SSLv3 cipher=OTHER); Thu, 01 Sep 2011 23:18:19 -0700 (PDT)
Message-ID: <4E60752A.6080204@dresearch-fe.de>
Date: Fri, 02 Sep 2011 08:18:18 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1314714550-29390-1-git-send-email-sherbrec@cit-ec.uni-bielefeld.de>
	<1314736499.3942.2.camel@mattotaupa>
	<4E5DE5C1.4000706@cit-ec.uni-bielefeld.de>
In-Reply-To: <4E5DE5C1.4000706@cit-ec.uni-bielefeld.de>
X-Enigmail-Version: 1.3.1
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH] gcc: Remove package libstdc++-dev and libgcc-dev from gcc-cross
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
X-List-Received-Date: Fri, 02 Sep 2011 06:23:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.08.2011 09:41, Stefan Herbrechtsmeier wrote:
> Am 30.08.2011 22:34, schrieb Paul Menzel:
>> Am Dienstag, den 30.08.2011, 16:29 +0200 schrieb Stefan Herbrechtsmeier:
>>> Remove package libstdc++-dev and libgcc-dev from gcc-cross as they
>>> already provided by gcc.
>>>
>>> Commit 8c42351519ece9ed60659a103e624d2e154b3641 add dev packages
>>> (libstdc++-dev libgcc-dev) to gcc-cross (gcc-package-cross.inc)
>>> which are already part of gcc. The libgcc-dev package both include
>>> the libgcc_s.so file which triggers a 'file is already provided by
>>> package' error on incremental builds. The libstdc++-dev package have
>>> different content and is empty on some archs (armv5te, armv7e).
>>> The empty package triggers a 'Cannot satisfy the following
>>> dependencies for task-sdk-bare' error. If an empty libstdc++-dev
>>> package is generated it triggers a '..../usr/include/c++ not exist'
>>> error as this is part of the package from gcc but not gcc-cross.
>>>
>>> Signed-off-by: Stefan Herbrechtsmeier<sherbrec@cit-ec.uni-bielefeld.de>
>>> ---
>>>   recipes/gcc/gcc-4.3.3.inc         |    2 +-
>>>   recipes/gcc/gcc-4.5.inc           |    2 +-
>>>   recipes/gcc/gcc-package-cross.inc |    4 +---
>>>   3 files changed, 3 insertions(+), 5 deletions(-)
>> So does that patch revert commit 8c423515?
> Not complete, it leaves the gcc change in gcc-package-target.inc untouched and
> although keeps the move of the gdb python helpers in gcc-package-cross.inc
> but don't ship them in any package. This keeps the intention of the commit
> and only fix the fault of adding dev packages to gcc-cross.

Thanx for the patch.

It's pushed to oe-dev master now and will make a pull request for 2011.03-maintenance branch too.

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


