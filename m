Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QcWzk-00082Y-62
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jul 2011 08:14:28 +0200
Received: by bwf20 with SMTP id 20so2776519bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2011 23:10:44 -0700 (PDT)
Received: by 10.204.3.21 with SMTP id 21mr2701553bkl.6.1309500640913;
	Thu, 30 Jun 2011 23:10:40 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id e6sm2689808bka.23.2011.06.30.23.10.38
	(version=SSLv3 cipher=OTHER); Thu, 30 Jun 2011 23:10:39 -0700 (PDT)
Message-ID: <4E0D64DE.50804@dresearch-fe.de>
Date: Fri, 01 Jul 2011 08:10:38 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1309428937.2551.107.camel@phil-desktop>
	<1309429335-3762-1-git-send-email-sledz@dresearch-fe.de>
	<1309454880.4401.32.camel@mattotaupa>
In-Reply-To: <1309454880.4401.32.camel@mattotaupa>
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH] ppp: 2.4.5 seems to be ready for oe-dev too
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
X-List-Received-Date: Fri, 01 Jul 2011 06:14:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.06.2011 19:28, Paul Menzel wrote:
> ppp_2.4.5: remove `DP = "-1"`
> 
> is a more appropriate and precise commit summary in my opinion.

yepp

>> Oe-core is using 2.4.5 and it works OK there.
>>
>> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
>> ---
>>  recipes/ppp/ppp_2.4.5.bb |    2 --
>>  1 files changed, 0 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes/ppp/ppp_2.4.5.bb b/recipes/ppp/ppp_2.4.5.bb
>> index 2b6b6f7..86d5ae5 100644
>> --- a/recipes/ppp/ppp_2.4.5.bb
>> +++ b/recipes/ppp/ppp_2.4.5.bb
>> @@ -4,8 +4,6 @@ HOMEPAGE = "http://samba.org/ppp/"
>>  DEPENDS = "libpcap"
>>  LICENSE = "BSD GPLv2"
>>  PR = "r1"
>> -# Not well tested
>> -DEFAULT_PREFERENCE = "-1"
>>  
>>  PARALLEL_MAKE = ""
> 
> I am getting the following warning when building the recipe with
> `minimal{,-uclibc}` which I do not get with PPP 2.4.3.
> 
>         NOTE: package ppp-2.4.5-r1: task do_qa_staging: Started
>         WARNING: the following files were installed but not shipped in any package:
>         WARNING:   /usr/lib/pppd/2.4.5/pppol2tp.so
>         WARNING:   /usr/lib/pppd/2.4.5/openl2tp.so
> 
> Could you fix this in a separate patch before committing this patch?

Can please someone of the oe-core guys check if the problem is fixed there? And cherry-pick the fix to oe-dev master in that case.

Thx,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


