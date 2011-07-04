Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QdfDh-0003Ln-Gi
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jul 2011 11:13:33 +0200
Received: by bwf20 with SMTP id 20so4504789bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jul 2011 02:09:45 -0700 (PDT)
Received: by 10.204.136.1 with SMTP id p1mr1918643bkt.105.1309770584214;
	Mon, 04 Jul 2011 02:09:44 -0700 (PDT)
Received: from mobil-400-586.intern.dresearch.de
	(pd95cb174.dip0.t-ipconnect.de [217.92.177.116])
	by mx.google.com with ESMTPS id e16sm4723429bke.6.2011.07.04.02.09.42
	(version=SSLv3 cipher=OTHER); Mon, 04 Jul 2011 02:09:43 -0700 (PDT)
Message-ID: <4E118356.2000104@dresearch-fe.de>
Date: Mon, 04 Jul 2011 11:09:42 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1309454880.4401.32.camel@mattotaupa>
	<1309768279-4797-2-git-send-email-sledz@dresearch-fe.de>
	<1309769664.4472.26.camel@mattotaupa>
In-Reply-To: <1309769664.4472.26.camel@mattotaupa>
X-Enigmail-Version: 1.2
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH v2 2/2] ppp-2.4.5: remove `DP = "-1"`
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
X-List-Received-Date: Mon, 04 Jul 2011 09:13:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.07.2011 10:54, Paul Menzel wrote:
> Am Montag, den 04.07.2011, 10:31 +0200 schrieb Steffen Sledz:
>> Oe-core is using 2.4.5 and it works OK there.
>> 
>> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de> --- recipes/ppp/ppp_2.4.5.bb |    4 +--- 1 files changed, 1 insertions(+), 3 deletions(-)
>> 
>> diff --git a/recipes/ppp/ppp_2.4.5.bb b/recipes/ppp/ppp_2.4.5.bb index 883b695..faab816 100644 --- a/recipes/ppp/ppp_2.4.5.bb +++ b/recipes/ppp/ppp_2.4.5.bb @@ -3,9 +3,7 @@ DESCRIPTION = "Point-to-Point Protocol (PPP) daemon" HOMEPAGE = "http://samba.org/ppp/" DEPENDS = "libpcap" LICENSE = "BSD GPLv2" -PR = "r2" -# Not well tested -DEFAULT_PREFERENCE = "-1" +PR = "r3"
> 
> Is a bump of `PR` needed? The package content does not change, does it?

Not really. I'll revert that before pushing.

>> PARALLEL_MAKE = ""
> 
> Is the build still failing when doing a parallel build?

No idea. And not enough time to check it. Sorry.

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


