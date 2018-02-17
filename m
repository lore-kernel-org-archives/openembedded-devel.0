Return-Path: <timothy.t.orling@linux.intel.com>
X-Greylist: delayed 567 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 17 Feb 2018 16:48:51 UTC
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 489A760290
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Feb 2018 16:48:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Feb 2018 08:39:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,525,1511856000"; d="scan'208";a="18920513"
Received: from gkresge-mobl.amr.corp.intel.com ([10.254.65.152])
	by orsmga008.jf.intel.com with ESMTP; 17 Feb 2018 08:39:25 -0800
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <CA+chaQcKXbteCmzE7SCZdZ5zjBnnAefyH+JdJDGChKmUpNvG+g@mail.gmail.com>
Date: Sat, 17 Feb 2018 08:39:24 -0800
Message-Id: <BA94AA8C-F764-4EC2-ABA5-6ACC1E805F90@linux.intel.com>
References: <20180216213511.117-1-Martin.Jansa@gmail.com>
	<1518819754.6900.50.camel@gmail.com>
	<CA+chaQcKXbteCmzE7SCZdZ5zjBnnAefyH+JdJDGChKmUpNvG+g@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.3273)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] waf-samba: use new oe.utils.parallel_make_argument function instead of removed get_waf_parallel_make
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
X-List-Received-Date: Sat, 17 Feb 2018 16:48:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Now libevent fails:

08:35:10=20
ERROR: ExpansionError during parsing =
/workdir/openembedded-core/../meta-openembedded/meta-networking/recipes-su=
pport/libtevent/libtevent_0.9.33.bb

08:35:10=20
Traceback (most recent call last):

08:35:10=20
bb.data_smart.ExpansionError: Failure expanding variable do_compile, =
expression was     python ./buildtools/bin/waf =
${@oe.utils.parallel_make_argument(d, '-j%d', limit=3D64)}

08:35:10  which triggered exception AttributeError: module 'oe.utils' =
has no attribute =E2=80=98parallel_make_argument'

> On Feb 16, 2018, at 3:10 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> This is just to fix the parsing ASAP, you can still send your updated
> change which removes the waf inherit completely.
>=20
> On Fri, Feb 16, 2018 at 11:22 PM, Joshua Watt <jpewhacker@gmail.com> =
wrote:
>=20
>> On Fri, 2018-02-16 at 21:35 +0000, Martin Jansa wrote:
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> ---
>>> meta-networking/classes/waf-samba.bbclass | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>=20
>>> diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-
>>> networking/classes/waf-samba.bbclass
>>> index e490176241..a63842cadc 100644
>>> --- a/meta-networking/classes/waf-samba.bbclass
>>> +++ b/meta-networking/classes/waf-samba.bbclass
>>> @@ -87,7 +87,7 @@ do_configure() {
>>> }
>>>=20
>>> do_compile () {
>>> -    python ./buildtools/bin/waf ${@get_waf_parallel_make(d)}
>>> +    python ./buildtools/bin/waf =
${@oe.utils.parallel_make_argument(d
>>> , '-j%d', limit=3D64)}
>>=20
>> Ah, beat me to it. Either way, I approve FWIW.
>>=20
>>> }
>>>=20
>>> do_install() {
>>> --
>>> 2.15.1
>>>=20
>>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


