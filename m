Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QmuXh-00043l-Oc
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jul 2011 23:24:25 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QmuTa-00026i-9G from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jul 2011 14:20:10 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 29 Jul 2011 14:17:10 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Fri, 29 Jul 2011 14:20:09 -0700
Message-ID: <4E332400.9030408@mentor.com>
Date: Fri, 29 Jul 2011 14:20:00 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1311844212-23277-1-git-send-email-koen@dominion.thruhere.net>
	<4E3142B3.10109@dresearch-fe.de>
In-Reply-To: <4E3142B3.10109@dresearch-fe.de>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 29 Jul 2011 21:17:10.0249 (UTC)
	FILETIME=[E0BA8D90:01CC4E34]
Subject: Re: [2011.03-maintenance] gcc-package-target: fix for gcc 4.3.x
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
X-List-Received-Date: Fri, 29 Jul 2011 21:24:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07/28/2011 04:06 AM, Steffen Sledz wrote:
> On 28.07.2011 11:10, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>>  recipes/gcc/gcc-package-target.inc |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/gcc/gcc-package-target.inc b/recipes/gcc/gcc-package-target.inc
>> index 33567da..7d3f4ae 100644
>> --- a/recipes/gcc/gcc-package-target.inc
>> +++ b/recipes/gcc/gcc-package-target.inc
>> @@ -171,5 +171,5 @@ GROUP ( libgcc_s.so.1 libgcc.a )" > ${D}${libdir}/libgcc_s.so
>>  	rm -rf ${D}${includedir}/c++/${BINV}/${TARGET_SYS}/bits/*.gch
>>  	# move the gdb python helpers to gdb auto-load directory
>>  	install -d ${D}${datadir}/gdb/auto-load/${libdir}
>> -	mv ${D}${libdir}/libstdc++.so.*-gdb.py* ${D}${datadir}/gdb/auto-load${libdir}
>> +	mv ${D}${libdir}/libstdc++.so.*-gdb.py* ${D}${datadir}/gdb/auto-load${libdir} || true
>>  }
> 
> Acked-by: Steffen Sledz <sledz@dresearch-fe.de>

Applied, thanks!

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJOMyP/AAoJEI4NMjfc3nJxiPwIAK5+QXyfAVSHzIT2urwiVGFU
T/a51P1Xty5k9HfvWneX3Nc3NbBvqlgt8KjUyw6p2mf/+hco3OYHjsrlS+KQ1s+u
c0R/yvNQpBwGD27qdHdqpmhNsO240RtllL7aedLU8vEt7HmdNtdcSDOXpOMxSTrA
EgGwwE97mrw2n/vBuFfx6AaMl3sgfw3emh29VTmXigp031Cx6KqE1Z71MnrksCee
87zNNScZCzp7Wsm2FHdXXIJxRNjORVtVcj+5XeDFeBb5As9udHU8ipFeHZI7vC4+
P9fCmdZo8UX8vHeZHx/M8WYp1cRiNVwv8nUgjoZDkRPIbS7wMzgP1JZOTLbmLU4=
=aCBC
-----END PGP SIGNATURE-----


