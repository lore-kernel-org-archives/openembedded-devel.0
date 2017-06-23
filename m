Return-Path: <amery@hanoverdisplays.com>
Received: from mail.hanoverdisplays.com (mail.hanoverdisplays.com [62.7.92.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1C97D781F8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 20:41:29 +0000 (UTC)
Received: from MAILDB.hanover.local ([fe80::6c2c:e4ad:bf0a:351d]) by
	mail.hanover.local ([fe80::1440:163c:a37d:4312%11]) with mapi id
	14.03.0319.002; Fri, 23 Jun 2017 21:41:28 +0100
From: Alejandro Mery <amery@hanoverdisplays.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [oe] [meta-oe][morty][PATCH 0/6] merge devmem2 and gitver
	fixes from master
Thread-Index: AQHS7F6nLKQZ9eFp1ESNjEK/1qrQdA==
Date: Fri, 23 Jun 2017 20:41:28 +0000
Message-ID: <CF323D845261FD4F9B1E997381250334E339B142@maildb.hanover.local>
References: <20170623202324.69194-1-amery@hanoverdisplays.com>
	<20170623203729.GY28053@denix.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [82.23.32.30]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][morty][PATCH 0/6] merge devmem2 and gitver fixes from master
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Jun 2017 20:41:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 23/06/17 21:37, Denys Dmytriyenko wrote:=0A=
> Wasn't there already a submission for devmem2 backport on the list?=0A=
=0A=
yes, I did try back in May the first time but I just realised I had =0A=
forgotten to CC morty's maintainer=0A=
=0A=
=0A=
> =0A=
> On Fri, Jun 23, 2017 at 09:23:18PM +0100, Alejandro Mery wrote:=0A=
>> The following changes have been cherry-picked from master and are=0A=
>> available in the git repository at:=0A=
>>=0A=
>> https://github.com/amery/meta-openembedded for-morty=0A=
>>=0A=
>> for you to fetch=0A=
>>=0A=
>> Alejandro Mery (4):=0A=
>>    gitver: fix try/except syntax for python3 support=0A=
>>    gitver: extend class to use EXTERNALSRC if set=0A=
>>    gitver: fix broken ${GITSHA} and recursion in S when PV=3D"${GITVER}"=
=0A=
>>    gitver: skip packages instead of panic()ing if ${GITVER} fails to=0A=
>>      expand=0A=
>>=0A=
>> Denys Dmytriyenko (1):=0A=
>>    devmem2: use different filename to avoid checksum conflicts=0A=
>>=0A=
>> Nicolas Ferre (1):=0A=
>>    devmem2: Change source URL to regain access to it=0A=
>>=0A=
>>   meta-oe/classes/gitver.bbclass             | 51 ++++++++++++++++++----=
--------=0A=
>>   meta-oe/recipes-support/devmem2/devmem2.bb | 12 ++++---=0A=
>>   2 files changed, 38 insertions(+), 25 deletions(-)=0A=
>>=0A=
>> -- =0A=
>> 2.13.0=0A=
>>=0A=
>> -- =0A=
>> _______________________________________________=0A=
>> Openembedded-devel mailing list=0A=
>> Openembedded-devel@lists.openembedded.org=0A=
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel=0A=
> =0A=
=0A=

