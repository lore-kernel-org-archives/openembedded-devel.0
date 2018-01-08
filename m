Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9CBF57864F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jan 2018 12:16:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jan 2018 04:16:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,330,1511856000"; 
   d="scan'208";a="8713340"
Received: from pgsmsx104.gar.corp.intel.com ([10.221.44.91])
	by orsmga007.jf.intel.com with ESMTP; 08 Jan 2018 04:16:34 -0800
Received: from pgsmsx105.gar.corp.intel.com ([169.254.4.167]) by
	PGSMSX104.gar.corp.intel.com ([169.254.3.6]) with mapi id
	14.03.0319.002; Mon, 8 Jan 2018 20:16:33 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "Diaz de Grenu, Jose" <Jose.DiazdeGrenu@digi.com>, Richard Leitner
	<richard.leitner@skidata.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-java][PATCH] openjdk-7: fix compile errors with
	current poky master (gcc6)
Thread-Index: AQHTiHlRfU0+aCwVs0K46wpq7Len46NpWtwAgACIy+A=
Date: Mon, 8 Jan 2018 12:16:33 +0000
Message-ID: <C0207330DF60C5409302EC78C3FE68F34A3961@PGSMSX105.gar.corp.intel.com>
References: <1515412157-30726-1-git-send-email-Jose.DiazdeGrenu@digi.com>
	<fca0add8-d2b2-2ab1-02d1-d6232e668105@skidata.com>
	<0B2EBCD48D33654381E736352034C70C01B5E467@dor-sms-xch01.digi.com>
In-Reply-To: <0B2EBCD48D33654381E736352034C70C01B5E467@dor-sms-xch01.digi.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDMyNjBkMDItN2YxYi00ZDU3LWI0M2EtNGVlNDBlMmJiZDM0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjIuNS4xOCIsIlRydXN0ZWRMYWJlbEhhc2giOiJmT0JlRlNXQ0MxSSt6Z3R0a3RRVVoyVTdMdGVUU1dSdDNDK0lUeUtxbkdjWXVJNmxQVzc4MDhTQzlWXC9hQVc1dSJ9
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [meta-java][PATCH] openjdk-7: fix compile errors with current poky master (gcc6)
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
X-List-Received-Date: Mon, 08 Jan 2018 12:16:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of D=
iaz
> de Grenu, Jose
> Sent: Monday, January 8, 2018 8:05 PM
> To: Richard Leitner <richard.leitner@skidata.com>; openembedded-
> devel@lists.openembedded.org
> Subject: Re: [oe] [meta-java][PATCH] openjdk-7: fix compile errors with c=
urrent poky
> master (gcc6)
>=20
> Sorry, I meant to ask to merge this into the 'morty' branch.
>=20
> I am not used to using mailing lists to send patches. Could you tell me h=
ow to indicate
> the destination branch when sending a patch?

You can prefix your subject with branch name like [morty][PATCH] ...

>=20
> Thank you
>=20
> -----Original Message-----
> From: Richard Leitner [mailto:richard.leitner@skidata.com]
> Sent: Monday, January 8, 2018 12:58 PM
> To: Diaz de Grenu, Jose <Jose.DiazdeGrenu@digi.com>; openembedded-
> devel@lists.openembedded.org
> Subject: Re: [meta-java][PATCH] openjdk-7: fix compile errors with curren=
t poky
> master (gcc6)
>=20
> Hi Jose,
>=20
> On 01/08/2018 12:49 PM, Jose Diaz de Grenu wrote:
> > From: Richard Leitner <richard.leitner@skidata.com>
> >
> > Using the current poky master openjdk-7 wasn't buildable. This patch
> > fixes those problems by adding three more patches to openjdk-7.
> >
> > These patches basically add/fix GCC6 support. Furthermore the
> > LDFLAGS_HASH_STYLE variable (which was removed by the
> > icedtea-crosscompile-fix.patch) is re-introduced and set to "both" for
> > compatibility reasons.
> >
> > Following two patches were originally written by Abdur Rehman and
> > taken from meta-mentor [1]:
> > 	icedtea-flags-to-compile-with-GCC-6.patch
> > 	icedtea-specify-overloaded-variant-of-fmod.patch
> >
> > [1] https://github.com/MentorEmbedded/meta-mentor
> >
> > Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> > Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > Signed-off-by: Jose Diaz de Grenu <Jose.DiazdeGrenu@digi.com>
>=20
> AFAIK this patch was already merged to meta-java/master...
> So why the resend?
>=20
> regards;Richard.L
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

