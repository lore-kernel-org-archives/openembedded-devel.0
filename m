Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C0BDB78715
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jan 2018 18:11:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jan 2018 10:11:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,315,1511856000"; d="scan'208";a="18231880"
Received: from lattal-mobl6.amr.corp.intel.com ([10.254.35.187])
	by fmsmga004.fm.intel.com with ESMTP; 04 Jan 2018 10:11:02 -0800
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <959a3d8f-9d9e-bd45-083d-46a9605dab68@gmail.com>
Date: Thu, 4 Jan 2018 10:11:01 -0800
Message-Id: <936BE9F8-E8C6-4836-B70D-F632792F08D3@linux.intel.com>
References: <20180104160623.23830-1-rjpdasilva@gmail.com>
	<C86C34FA-F934-44CA-8A2B-64478F87AD82@linux.intel.com>
	<048780aa-783c-21f8-d54e-afca1545d943@gmail.com>
	<1E32C484-99E3-4DDB-B996-2C85D07D79AB@linux.intel.com>
	<959a3d8f-9d9e-bd45-083d-46a9605dab68@gmail.com>
To: Ricardo Silva <rjpdasilva@gmail.com>
X-Mailer: Apple Mail (2.3273)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] pycrypto: Add recipe to have support on python3
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
X-List-Received-Date: Thu, 04 Jan 2018 18:11:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Jan 4, 2018, at 9:27 AM, Ricardo Silva <rjpdasilva@gmail.com> =
wrote:
>=20
> Hi Tim,
>=20
> On 01/04/2018 04:56 PM, Tim Orling wrote:
>>=20
>>> On Jan 4, 2018, at 8:51 AM, Ricardo Silva <rjpdasilva@gmail.com> =
wrote:
>>>=20
>>>>=20
>>>> Rather than duplicate the SRC_URI in both python2- and python3- =
recipes, we should add them to python-pycrypto.inc and add the following =
to python-pycrypto.inc
>>>>=20
>>>> FILESEXTRAPATHS_prepend :=3D "${THISDIR}/python-pycrypto:=E2=80=9D
>>>>=20
>>>=20
>>> Agree.
>>> Shall I send a v2 with your suggested changes?
>>>=20
>>=20
>> Yes, please. If you don=E2=80=99t mind (it will need to remove the =
extra SRC_URI lines from python2 recipe, add the SRC_URI lines and =
FILESEXTRAPATHS to .inc and then add the python3 recipe).
>=20
> Glad to. You mean the changes should be split over a patch series, or =
OK
> to have a single patch with all the changes?
>=20

Single patch touching all three files is fine.

> Also note that the .inc file already had :
> 	FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> so I would just change that to:
> 	FILESEXTRAPATHS_prepend :=3D "${THISDIR}/python-pycrypto:=E2=80=9D=

>=20

Correct. As ${PN} would resolve to python3-pycrypto and not work as =
intended :)


> Regards,
>=20
> Ricardo Silva


