Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.51])
 by mx.groups.io with SMTP id smtpd.web10.5528.1603198106399573525
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2020 05:48:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CMDGX9v7;
 spf=pass (domain: windriver.com, ip: 40.107.92.51, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMmtgLJQ9HdVGWz2HtjgjDe5C5WHrCOtQnX8D4oUgvRT44WJl+tvu9KBr2U6grxboXCpxAmSM9KLabzutmM+uHpiTD/zHrCdCPs4fJQj4bCIy6/wi0qT0ajg5uTEgdS0zNPnAIMepiPvogNQb+ZUZMzmpsZls8UPrWOiT3qev2sGthOLNGTokrAmxTSf0igKvssSurqqt/PDdBtt2oY8vKeXSQwNTHp6MpwOAWxcku7+tIEJucnOeR3oakI6xZLGBv7WebLuW5x8Kouxbf2jxGECOGz4KxVNYHEPFJjDmfSAGiUEaG4Nx4KJJO2FAuONOrq7CXu/T5VTyc9ZeWVi5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBAHOHXWxx6zZa0XlMr+SUdgibMiz9SmMRXTNlHGYPU=;
 b=dRjd1ZNFOOnmwmaeBTO//wwfKO2hMATScTXi8jO9E0Bnsd0iOidKcFA/MotAqHGcir6PAtt7l2RB/SN0PVa5/Xj7sta+KiTPGnTlJUjpGF8178VWEdLgMfTSyoIggrq3ibl1oJdNG4EnI6LtTmJP4sn/5f5ypNem7v3c4CNhV1vhQRtJ5KmYL3+TsTHPyeZoEzp52Fq7QmYKqKje+hhwP3UQv8zIJ+EQ7bpj/AEfbYgrKZJxvSJMPhbdtuGeljEPH0iGghiItdwUW3xn69FIPwePTIUHT2VVVhGP/nUElU8nwH6IZjMFf0RnVB6gkiO9PLVCYgsRLBSjoTHGChIbfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBAHOHXWxx6zZa0XlMr+SUdgibMiz9SmMRXTNlHGYPU=;
 b=CMDGX9v7J7yKVOhR0J2r73x+W0exIJI7yst4ILCop1c+0WBw5vR5cG/QBoCLxVr9mUNJRNXdK6ACHneHTpz2ZA5QqOTB64Tc1CX/mv46Xl9w0lYDWFApvMUUrs6uikbXixqrqK+zDOqXfNhumcjlKtLHqhhVth36rKIiwc1ni7U=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2703.namprd11.prod.outlook.com (2603:10b6:805:59::18)
 by SA2PR11MB4827.namprd11.prod.outlook.com (2603:10b6:806:11f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22; Tue, 20 Oct
 2020 12:48:24 +0000
Received: from SN6PR11MB2703.namprd11.prod.outlook.com
 ([fe80::cc77:c9c8:8d2b:bb35]) by SN6PR11MB2703.namprd11.prod.outlook.com
 ([fe80::cc77:c9c8:8d2b:bb35%6]) with mapi id 15.20.3499.018; Tue, 20 Oct 2020
 12:48:24 +0000
Subject: Re: [oe] [meta-python2][PATCH 1/3] package port: python-kombu version 4.6.6
To: Tim Orling <ticotimo@gmail.com>,
 Babak Sarashki <babak.sarashki@windriver.com>
CC: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20201012004603.990-1-babak.sarashki@windriver.com>
 <CANx9H-B38g=au5r6iVy8uVqCB+dq5NaxfmvCAmRnPBFQeL-LBw@mail.gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <d02b02a6-a5fa-1a85-c82c-a6995b951aef@windriver.com>
Date: Tue, 20 Oct 2020 08:48:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CANx9H-B38g=au5r6iVy8uVqCB+dq5NaxfmvCAmRnPBFQeL-LBw@mail.gmail.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: BYAPR01CA0049.prod.exchangelabs.com (2603:10b6:a03:94::26)
 To SN6PR11MB2703.namprd11.prod.outlook.com (2603:10b6:805:59::18)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BYAPR01CA0049.prod.exchangelabs.com (2603:10b6:a03:94::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.23 via Frontend Transport; Tue, 20 Oct 2020 12:48:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6023ce27-0c15-4a8d-6f67-08d874f66ea4
X-MS-TrafficTypeDiagnostic: SA2PR11MB4827:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB48273980C7DB944541FB9AF9F81F0@SA2PR11MB4827.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qdRxyd2aeRE7KamcFx0bMspjgquLzZSte+ig5STiWL3EY6LL63HVmg3xThJle9gcAQMoyFcJVWHjmEdP8sy0nc6Ke9KQFdem1X0dFgGP9oSCeflZYLx1MfTuNzuwnIVFQJsc0ln3gTmhVF5Y7gXGg2PA06157RjDu6f3RvKKKUA+f3AJ/KJlTh6Ys00HD38IMcuwkrdndFIu6VPVNaKjEWwf3sx9lOfr0BTGBOPjsixKVn4gh2329FWf93f8hcfIxYOzkkkcgZpQf4qLxe72IwiqNUHAfGp1IWdMvRxfYAb74X16VP8lQmhzv8lY7YlWIlIBxvXnpnoXkeZjtsF8rs3TQyskBpxHRE+Kva/APQ8kzsH7eS8u+10tMH1Q/rX9klx55KrlhSIfNY9MrrtbPnZQIpunEbbZEFxC1hdQixPnvBLPNxQCwpC/+kJ/+k1e0NAOitQiHpO8WiiXK5LISw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2703.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(366004)(346002)(136003)(376002)(52116002)(66476007)(66946007)(66556008)(5660300002)(16576012)(110136005)(6486002)(83380400001)(4326008)(316002)(2616005)(4001150100001)(6636002)(956004)(86362001)(31696002)(31686004)(478600001)(36756003)(2906002)(26005)(186003)(966005)(8676002)(16526019)(53546011)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	VgSphZcJgBc/7JeIEzT+ET9nPF4KIH7bcFiqtc5TUastirZqMp/DCE9m2vkn6qaZY0B9JO5k1AM/hxUa28uuNdo6w3eBwvgPXT3LilPhQZX/zHKDPD1v7EbpHCXfgvzpG25IRIX3tVRe7JD+glXhLYBlJPggTNfaoHq635TFnPrl+x5gOB1+wnKqlCQdfXuMpofdD4PfSGULzK7crw1Kjfw/LRnOPV5VLVrgZP2MdxNFnNM8RT2VMptDAJbM2rEDeapXWJlUXQm3dW5CP8uJeIil29/noRXNgjInwH4aRcWMcNb2fyk5KgrrNE0Zk04Dm4efOdmvBYPn657tMqieTV4XY0GSe8xoYFniDkrGZV4TMFDTR/33Nvas0htR7EUG+ZSr4TXtfz1v3ZmNwXcqPvWwpBfF9kaQOO6+efE3f6GKAs8pffXsBTZk+LykHuGGrb1pjdktM2DnQ+SPNEhi7Yo7i3XCScULAOX5i0e330GE1gpHj0B61jou7OowahbIkYNIAAAI2rG1Q+z1Isyb04SGKUPD/5bq0J52xqX54/ORDWnHYToKRE5WxNSS1OoDx8bsoFsxKn9UX7R/7fiK8CGMXcnB+IlatTojaohEU8Occa/z9hzO4Hz8+hYYYtSJaj5UCYoHpULJUL0CDQkJkA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6023ce27-0c15-4a8d-6f67-08d874f66ea4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2020 12:48:24.1371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /gj6B+hW5Pfr5fgWSwvOTfSc9VH5e7iCg4nY6YM+9cFop7h9f4I17ObHhTe93QSYX+bbGu1+0Q4tgeVZ/mzcCZ+6ZBQtWAh1v/UDeV8NEps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4827
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

On 2020-10-16 10:27 a.m., Tim Orling wrote:
> Please also submit a patch to add these three recipes to=20
> packagroup-meta-python2
> https://git.openembedded.org/meta-python2/tree/recipes-core/packagegroup=
s/packagegroup-meta-python2.bb
>=20
> The CI system behind this layer depends on the packagroup staying up to=
=20
> date.

Babak,

Will you be able submit the meta-python2 recipes soon as Tim asked?


../Randy
>=20
> On Sun, Oct 11, 2020 at 5:46 PM Babak Sarashki=20
> <babak.sarashki@windriver.com <mailto:babak.sarashki@windriver.com>> wro=
te:
>=20
>     Signed-off-by: Babak Sarashki <babak.sarashki@windriver.com
>     <mailto:babak.sarashki@windriver.com>>
>     ---
>      =C2=A0recipes-devtools/python/python-kombu_4.6.6.bb
>     <http://python-kombu_4.6.6.bb> | 23 +++++++++++++++++++
>      =C2=A01 file changed, 23 insertions(+)
>      =C2=A0create mode 100644 recipes-devtools/python/python-kombu_4.6.6=
.bb
>     <http://python-kombu_4.6.6.bb>
>=20
>     diff --git a/recipes-devtools/python/python-kombu_4.6.6.bb
>     <http://python-kombu_4.6.6.bb>
>     b/recipes-devtools/python/python-kombu_4.6.6.bb
>     <http://python-kombu_4.6.6.bb>
>     new file mode 100644
>     index 0000000..72a9d90
>     --- /dev/null
>     +++ b/recipes-devtools/python/python-kombu_4.6.6.bb
>     <http://python-kombu_4.6.6.bb>
>     @@ -0,0 +1,23 @@
>     +SUMMARY =3D "The aim of Kombu is to make messaging in Python as eas=
y
>     as possible by providing \
>     +an idiomatic high-level interface for the AMQ protocol, and also
>     provide proven and tested \
>     +solutions to common messaging problems."
>     +
>     +DESCRIPTION =3D "A messaging framework for Python"
>     +BUGTRACKER =3D "http://github.com/celery/kombu/issues/"
>     +HOMEPAGE =3D "http://kombu.readthedocs.org"
>     +SECTION =3D "devel/python"
>     +LICENSE =3D "BSD"
>     +LIC_FILES_CHKSUM =3D
>     "file://LICENSE;md5=3Ddaea7c168428449fbee05e644df929f4"
>     +
>     +SRC_URI[md5sum] =3D "5f751ea817b1f6a4293d4e3a01040d4f"
>     +SRC_URI[sha256sum] =3D
>     "1760b54b1d15a547c9a26d3598a1c8cdaf2436386ac1f5561934bc8a3cbbbd86"
>     +
>     +inherit setuptools pypi
>     +
>     +PYPI_PACKAGE =3D "kombu"
>     +
>     +FILES_${PN}-doc +=3D "${datadir}/${SRCNAME}"
>     +
>     +RDEPENDS_${PN} =3D " \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-amqp \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>     --=20
>     2.17.1
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20


--=20
# Randy MacLeod
# Wind River Linux
