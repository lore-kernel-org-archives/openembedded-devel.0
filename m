Received: from smarthost.techfak.uni-bielefeld.de ([129.70.137.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sherbrec@cit-ec.uni-bielefeld.de>)
	id 1QyfWU-0008Vc-Nt for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 09:47:46 +0200
Received: from [129.70.144.11] (hooge.TechFak.Uni-Bielefeld.DE [129.70.144.11])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: sherbrec)
	by smarthost.TechFak.Uni-Bielefeld.DE (Postfix) with ESMTPSA id F3A57BB;
	Wed, 31 Aug 2011 09:42:51 +0200 (CEST)
Message-ID: <4E5DE5C1.4000706@cit-ec.uni-bielefeld.de>
Date: Wed, 31 Aug 2011 09:41:53 +0200
From: Stefan Herbrechtsmeier <sherbrec@cit-ec.uni-bielefeld.de>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1314714550-29390-1-git-send-email-sherbrec@cit-ec.uni-bielefeld.de>
	<1314736499.3942.2.camel@mattotaupa>
In-Reply-To: <1314736499.3942.2.camel@mattotaupa>
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
X-List-Received-Date: Wed, 31 Aug 2011 07:47:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Am 30.08.2011 22:34, schrieb Paul Menzel:
> Am Dienstag, den 30.08.2011, 16:29 +0200 schrieb Stefan Herbrechtsmeier:
>> Remove package libstdc++-dev and libgcc-dev from gcc-cross as they
>> already provided by gcc.
>>
>> Commit 8c42351519ece9ed60659a103e624d2e154b3641 add dev packages
>> (libstdc++-dev libgcc-dev) to gcc-cross (gcc-package-cross.inc)
>> which are already part of gcc. The libgcc-dev package both include
>> the libgcc_s.so file which triggers a 'file is already provided by
>> package' error on incremental builds. The libstdc++-dev package have
>> different content and is empty on some archs (armv5te, armv7e).
>> The empty package triggers a 'Cannot satisfy the following
>> dependencies for task-sdk-bare' error. If an empty libstdc++-dev
>> package is generated it triggers a '..../usr/include/c++ not exist'
>> error as this is part of the package from gcc but not gcc-cross.
>>
>> Signed-off-by: Stefan Herbrechtsmeier<sherbrec@cit-ec.uni-bielefeld.de>
>> ---
>>   recipes/gcc/gcc-4.3.3.inc         |    2 +-
>>   recipes/gcc/gcc-4.5.inc           |    2 +-
>>   recipes/gcc/gcc-package-cross.inc |    4 +---
>>   3 files changed, 3 insertions(+), 5 deletions(-)
> So does that patch revert commit 8c423515?
Not complete, it leaves the gcc change in gcc-package-target.inc 
untouched and
although keeps the move of the gdb python helpers in gcc-package-cross.inc
but don't ship them in any package. This keeps the intention of the commit
and only fix the fault of adding dev packages to gcc-cross.



