Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qm9uL-0000Dn-Dk
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jul 2011 21:42:02 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Qm9oL-0001as-P2 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jul 2011 12:30:29 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 27 Jul 2011 12:30:29 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 27 Jul 2011 12:30:28 -0700
Message-ID: <4E30674E.2070207@mentor.com>
Date: Wed, 27 Jul 2011 12:30:22 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1311792635-17715-1-git-send-email-tom_rini@mentor.com>
	<CAMKF1sqmoDG_YGu-6-BrD2T4iekUnVXdGTyOhQkaHaGUpJTiDQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqmoDG_YGu-6-BrD2T4iekUnVXdGTyOhQkaHaGUpJTiDQ@mail.gmail.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 27 Jul 2011 19:30:29.0587 (UTC)
	FILETIME=[A4CF8A30:01CC4C93]
Subject: Re: [meta-oe][PATCH] rp-pppoe: Resync the 3.8 recipe with oe.dev and cleanup patches
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
X-List-Received-Date: Wed, 27 Jul 2011 19:42:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 07/27/2011 12:22 PM, Khem Raj wrote:
> On Wed, Jul 27, 2011 at 11:50 AM, Tom Rini <tom_rini@mentor.com> wrote:
>> - Update HOMEPAGE (from oe.dev)
>> - Bump PR to match oe.dev (will sync the next bits back over)
>> - Add Upstream-Status to all patches and a description to the ones
>>  missing descriptions.
>>
>> Signed-off-by: Tom Rini <tom_rini@mentor.com>
>> ---
>>  .../rp-pppoe/rp-pppoe-3.8/configure_in_cross.patch |    6 ++++++
>>  .../rp-pppoe-3.8/dont-swallow-errors.patch         |    4 ++++
>>  .../rp-pppoe-3.8/pppoe-src-restrictions.patch      |    2 ++
>>  .../rp-pppoe/rp-pppoe-3.8/top-autoconf.patch       |    2 ++
>>  .../rp-pppoe/rp-pppoe-3.8/update-config.patch      |    2 ++
>>  .../rp-pppoe/rp-pppoe-3.8/use-ldflags.patch        |    4 ++++
>>  .../recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb  |    6 +++---
>>  7 files changed, 23 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/configure_in_cross.patch b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/configure_in_cross.patch
>> index 381a44d..1896759 100644
>> --- a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/configure_in_cross.patch
>> +++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/configure_in_cross.patch
>> @@ -1,3 +1,9 @@
>> +Update the configure script to cross-compiling with OE.  This hard-codes
>> +a few target paths, reworks a few tests to be more friendly for cross
>> +and drops other tests.
>> +
>> +Upstream-Status: Inappropriate [build system specific changes]
>> +
>>  Index: src/configure.in
>>  ===================================================================
>>  --- rp-pppoe-3.8.orig/src/configure.in 2006-04-03 00:29:42.000000000 +1000
>> diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/dont-swallow-errors.patch b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/dont-swallow-errors.patch
>> index 81ce2db..f2f681a 100644
>> --- a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/dont-swallow-errors.patch
>> +++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/dont-swallow-errors.patch
>> @@ -1,3 +1,7 @@
>> +Further fixup to the configure scripts to not swallow errors
>> +
>> +Upstream-Status: Unsubmitted
> 
> this should be set to "Pending" to match the rest.

Bah, should have checked the wiki harder.

-- 
Tom Rini
Mentor Graphics Corporation


