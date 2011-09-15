Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1R492y-00005L-Q3
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 12:19:56 +0200
Received: by eya25 with SMTP id 25so1098675eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2011 03:14:45 -0700 (PDT)
Received: by 10.213.20.211 with SMTP id g19mr1081939ebb.35.1316081685091;
	Thu, 15 Sep 2011 03:14:45 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id e4sm7323540eec.10.2011.09.15.03.14.42
	(version=SSLv3 cipher=OTHER); Thu, 15 Sep 2011 03:14:43 -0700 (PDT)
Message-ID: <4E71D011.2020709@dresearch-fe.de>
Date: Thu, 15 Sep 2011 12:14:41 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110907 Thunderbird/6.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1316010999.6686.108.camel@mattotaupa>
	<1316012106-10277-1-git-send-email-sledz@dresearch-fe.de>
	<1316077683.4523.13.camel@mattotaupa>
In-Reply-To: <1316077683.4523.13.camel@mattotaupa>
X-Enigmail-Version: 1.3.1
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH v2] eglibc-2.9: allow building with newer GNU make
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
X-List-Received-Date: Thu, 15 Sep 2011 10:19:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.09.2011 11:08, Paul Menzel wrote:
> Am Mittwoch, den 14.09.2011, 16:55 +0200 schrieb Steffen Sledz:
> 
> Please amend the commit before pushing to replace »newer« with »>= 3.82«
> and the typo below.
> 
>> GNU make >= 3.82 does not allow mixed implicit and normal rules
>>
>> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
>> Acked-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  recipes/eglibc/eglibc-2.9/make-3.82.patch |   27 +++++++++++++++++++++++++++
>>  recipes/eglibc/eglibc_2.9.bb              |    3 ++-
>>  2 files changed, 29 insertions(+), 1 deletions(-)
>>  create mode 100644 recipes/eglibc/eglibc-2.9/make-3.82.patch
>>
>> diff --git a/recipes/eglibc/eglibc-2.9/make-3.82.patch b/recipes/eglibc/eglibc-2.9/make-3.82.patch
>> new file mode 100644
>> index 0000000..64cb270
>> --- /dev/null
>> +++ b/recipes/eglibc/eglibc-2.9/make-3.82.patch
>> @@ -0,0 +1,27 @@
>> +eglibc-2.9: allow building with newer GNU make
>> +    
>> +GNU make >= 3.82 does not allow mixed implicit and normal rules
>> +
>> +Because eglibc-2.9 is superseeded by newer versions it makes no sense
> 
> s/superseeded/superseded/
> 
> (I always make the same mistake.)
> 
>> +to submit this patch upstream.
>> +
>> +Upstream-Status: Inappropriate [other]
>> +
>> +Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
>> +
>> +diff -Nurd libc.orig//manual/Makefile libc/manual/Makefile
>> +--- libc.orig//manual/Makefile	2011-09-13 14:49:57.428424088 +0200
>> ++++ libc/manual/Makefile	2011-09-13 14:50:47.009620484 +0200
> 
> Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

Comment and patch header fixed and commit pushed.

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


