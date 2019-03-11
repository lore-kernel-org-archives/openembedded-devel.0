Return-Path: <bassem.boubaker@actia.fr>
X-Greylist: delayed 31533 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 Mar 2019 05:30:09 UTC
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
	(mail-eopbgr120051.outbound.protection.outlook.com [40.107.12.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2E5AE748D5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Mar 2019 05:30:09 +0000 (UTC)
Received: from MR2P264MB0371.FRAP264.PROD.OUTLOOK.COM (52.134.37.143) by
	PR0P264MB0379.FRAP264.PROD.OUTLOOK.COM (52.133.68.23) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1686.19; Tue, 12 Mar 2019 04:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=actia.fr; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=mV7oHEKRRgReuBrFhqTNZLnx09lRlGWEM56zGkiExv8=;
	b=VfumeYMi2OWbV3mmu+p9Qzy7/MUAqF8H2hfRzAF+TpSKdbEzuWMPeybfT8kezkfelVxE5iWdtlpnn2a69a0S5i8DcXwQXEhctsjEMd61wkViFQKutMO4lMqfXEVt8/gpjsImqw27pmanshRst+WjbSrIDjt5GTziq9g8XRW++vc=
Received: from MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM (52.134.38.15) by
	MR2P264MB0371.FRAP264.PROD.OUTLOOK.COM (52.134.37.143) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1686.17; Mon, 11 Mar 2019 20:20:41 +0000
Received: from MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM
	([fe80::4124:2bff:600f:6fe2]) by MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM
	([fe80::4124:2bff:600f:6fe2%5]) with mapi id 15.20.1686.021;
	Mon, 11 Mar 2019 20:20:41 +0000
From: BOUBAKER Bassem <bassem.boubaker@actia.fr>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH v2] cpulimit: introduce support for this package
Thread-Index: AQHU2Eahj4ClB3IlBU+gojBElig/JKYG3zoA
Date: Mon, 11 Mar 2019 20:20:41 +0000
Message-ID: <20190311202038.GB15019@bboubake>
References: <1552335085-13742-1-git-send-email-bassem.boubaker@actia.fr>
In-Reply-To: <1552335085-13742-1-git-send-email-bassem.boubaker@actia.fr>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR02CA0034.eurprd02.prod.outlook.com
	(2603:10a6:6:15::47) To MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM
	(2603:10a6:500:c::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [185.69.189.94]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63b3a683-2bb0-47e2-11fa-08d6a65f0834
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(49563074)(7193020);
	SRVR:MR2P264MB0371; 
X-MS-TrafficTypeDiagnostic: MR2P264MB0371:|MR2P264MB0371:|PR0P264MB0379:
x-ms-exchange-purlcount: 1
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; MR2P264MB0371;
	23:uo0I4/Vtu+K/7pORT5k6Nd5I4y3tRS5lAHpVxnX?=
	=?iso-8859-1?Q?Aoob5554nNkNiBO6D7X5gaaKRAuS3pWIX4AvrFjDcWD0rapKa1GNV2Q8i5?=
	=?iso-8859-1?Q?YBrjPSIarnf4GvNz7/azkO/imD37bMntsLzKeU0GsNIlMHu9SV74KKOLGY?=
	=?iso-8859-1?Q?0wylbWJPJhPNqtUpV2FknhtCcG4v9UGsBkdG8O9nUt4QtI8o5dS64fe6Z9?=
	=?iso-8859-1?Q?0H/bduSwpl7dYwSGVou398d3vF67rrRPv0KMAqUsXNUEiM+03NJv78rx2b?=
	=?iso-8859-1?Q?GrMPXoW3f3f+/6RroyGVtzGsxDQzckiFWrmUnX5AOS3Qps5ayKTZAnNjxB?=
	=?iso-8859-1?Q?Agq5QPyMUOjsBMTxJANwenLohjdyORQ6F3i2KhrFFXbDibWFn9d/ZwyXDI?=
	=?iso-8859-1?Q?mOL4ZQjMpe9c5He321Ivc5+RHP/zeOpJqH6kV+6dpzVFaHexdj5wToru0I?=
	=?iso-8859-1?Q?Ntmz25GUB2PShGpD7U4RI7HMU2qz/6RwcxL6HsG/s9xQ//QDKSqY8oIZmG?=
	=?iso-8859-1?Q?yev4y3u6gyn6Wa75jjrndA267PBa3NSPtKK6qmRcdeucj7IpWeZ55IPJ8/?=
	=?iso-8859-1?Q?8h0T48asYRVph/sl6Zv3L88x7nQTNwsNF7hZsLrYnKlAcMt15b9wyZROAu?=
	=?iso-8859-1?Q?S1QV4LJGsHSG4KWUQDl4scVnJmghqjAf9in6wk9yAYrErVC8Jx2X/kZ4yl?=
	=?iso-8859-1?Q?vQHcHJAer666aybvcfEmXibH/kOIEkmyjfAzZFDFV/d0O3YzuCegjpflDl?=
	=?iso-8859-1?Q?aA5iTSXP/57/e8AmBtmSnOBwmhaDt34RcGL/y/WlXCqTcwADNzDe203/Ca?=
	=?iso-8859-1?Q?kcGCixqFMzavU925bj2ijJv3bjLsluWU8JxJl/15/oujwomyicLuQ26/1H?=
	=?iso-8859-1?Q?bnaJJJNm9HA+tk6MvqNViXXsv2kD0A1B0JRsohtolJzOFK063hnmc7z5Oz?=
	=?iso-8859-1?Q?zdRLGCNsMjEI525ppVXS6ryTHwNwQwed66bg38iOCQeLqVKE+xtmb8G7tv?=
	=?iso-8859-1?Q?WlNgok+h4iwUGl30MMFWDsuykWlIRi6gupS30qCTifaUPL7LnPILcAnTR6?=
	=?iso-8859-1?Q?V90KjLluifK6oKGEtmfL39W8bNFiek2oDrpx3fSP1fgHBIacXESqrSCqib?=
	=?iso-8859-1?Q?5wOqyt8ku+OlQqFGqGShpUeCLFziFjrE/8mWoziQ0SKCZuUjqBvrhHBPFw?=
	=?iso-8859-1?Q?++dNPyLLZMy/zOjTIU6dg7f9tC64pZ0KMlatSXEFADbtjtfWqYRfqj6nTB?=
	=?iso-8859-1?Q?vQURCzdptqkd5KOuJG1/2O3nZwFnyQq1Wif9czjdyFus0HBuf02sH4zAxe?=
	=?iso-8859-1?Q?nSYdAgQhuRXjgwrJWIiLzONtkTLqJ+luVzOeuHx0c1X4h91ZkETBF9ES/q?=
	=?iso-8859-1?Q?tRzM0I8UJTapP+znQR0oJ5xxbvqA8f8856outBsgknFb8wqE/k1kwbCxnL?=
	=?iso-8859-1?Q?jy5wM3shB+DhZjq+Oc00rVn067xh7dUmQu1?=
x-microsoft-antispam-prvs: <MR2P264MB03711E948DD154A7BF6261999C480@MR2P264MB0371.FRAP264.PROD.OUTLOOK.COM>
x-forefront-prvs: 09730BD177
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(7916004)(376002)(136003)(396003)(366004)(346002)(39850400004)(189003)(199004)(106356001)(9686003)(446003)(105586002)(476003)(7736002)(71200400001)(99936001)(486006)(6512007)(305945005)(2351001)(14444005)(6306002)(11346002)(256004)(6486002)(229853002)(2906002)(25786009)(6116002)(3846002)(71190400001)(5640700003)(86362001)(33656002)(68736007)(6346003)(5660300002)(81156014)(2501003)(102836004)(6436002)(6506007)(386003)(53386004)(33716001)(186003)(97736004)(316002)(53936002)(26005)(6246003)(76176011)(14454004)(8676002)(8936002)(52116002)(99286004)(478600001)(1076003)(66066001)(74482002)(81166006)(6916009);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MR2P264MB0371;
	H:MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: actia.fr does not designate
	permitted sender hosts)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bassem.boubaker@actia.fr; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rCrCn895rRj474oYfMvq/680dJUwgXph9Q550XBxXYcj+Ooqve/XgNctL1TRjA3SVdwWcZV3E9SVzzI5LJw2izOvNg+BKKQLDvhTL8rH0RvTLCheo8Ego7kdp1T2eCQNlL0naEfD78HFWYPU4ltSJLmFlI9de/0jDkX0nbTuDGJzpjb24aY6ypeH53M8QkDnc6Z8EI/9Eg2rstlgDgp7zs3PeBKyKd+2hVaBKeek6aOG+FMOqgPZPRJcy3f4VLhbfrfgo0+fYsURMVyhsZgcsUEvUYzCJ9jBftidl3ZwCSmCbP2I2NdFo9Fzpv3HfcbiCg8WLJLBlg9tbwENreLWhAzziy1yDu8krScg4SRrojx6IKLHDxc/zzQeYVE0U+1ZGCNUOTYN48loiG9ewIiEGbNY6IXa5a2Iltyw3Wb9wjo=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b3a683-2bb0-47e2-11fa-08d6a65f0834
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2019 20:20:41.1539 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 86314f06-03e8-4460-82f3-a44f992a19c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0371
X-Microsoft-Exchange-Diagnostics: 1; PR0P264MB0379;
	23:GjHeEMKCi7Q2SwfjocYSLvKfSjCl0xM4XM/G/THSY7rT+3ZpUDoymja3K94S7gHEuijKk6EqaTULruhBIx8HacHw/dT8vKYY/52Ly2cJdwP8NKPG8xZB+iLBbvzYBG1aZyFq/I4GmXc8gZEfG31i4Q==
X-OriginatorOrg: actia.fr
Subject: Re: [meta-oe][PATCH v2] cpulimit: introduce support for this package
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
X-List-Received-Date: Tue, 12 Mar 2019 05:30:10 -0000
X-Groupsio-MsgNum: 76721
Content-Language: en-US
Content-Type: multipart/mixed; boundary="_002_20190311202038GB15019bboubake_"

--_002_20190311202038GB15019bboubake_
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5CE94968C04B3C46AB3F8969C9B96BFF@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable

On Monday 11 Mar 2019 =E0 21:11:36 (+0100), BOUBAKER Bassem wrote:
> * Now, cpulimit recipe is put under recipes-support. Binary will be insta=
lled by the recipe under /usr/sbin
>=20
>          # cpulimit -h
>          Usage: cpulimit [OPTIONS...] TARGET
>                  OPTIONS
>                  -l, --limit=3DN          percentage of cpu allowed from =
0 to 100 (required)
>                  -v, --verbose          show control statistics
>                  -z, --lazy             exit if there is no target proces=
s, or if it dies
>                  -i, --include-children limit also the children processes
>                  -h, --help             display this help and exit
>                  TARGET must be exactly one of these:
>                  -p, --pid=3DN            pid of the process (implies -z)
>                  -e, --exe=3DFILE         name of the executable program =
file or path name
>                  COMMAND [ARGS]         run this command and limit it (im=
plies -z)
>=20
>                  Report bugs to <marlonx80@hotmail.com>.
>=20
> Signed-off-by: Bassem Boubaker <bassem.boubaker@actia.fr>
> ---
>  meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb | 19 ++++++++++++++++++=
+
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
>=20
> diff --git a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb b/meta-oe/r=
ecipes-support/cpulimit/cpulimit_0.2.bb
> new file mode 100644
> index 0000000..8eaa928
> --- /dev/null
> +++ b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
> @@ -0,0 +1,19 @@
> +SUMMARY =3D "cpulimit is a tool which limits the CPU usage of a process"
> +HOMEPAGE =3D "http://cpulimit.sourceforge.net"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86c1c0d961a437e529db93aa3bb32=
dc4"
> +SRCREV ?=3D "f4d2682804931e7aea02a869137344bb5452a3cd"
> +
> +SRC_URI =3D "git://git@github.com/opsengine/cpulimit.git;protocol=3Dhttp=
s"
> +
> +S =3D "${WORKDIR}/git"
> +
> +do_compile() {
> +    oe_runmake all
> +}
> +do_install() {
> +    install -d ${D}${sbindir}
> +    install -m 0755 ${B}/src/${PN} ${D}${sbindir}/
> +}
> +
> +CFLAGS +=3D "${LDFLAGS}"

oooups didn't see it. will be fixed
> \ No newline at end of file

> --=20
> 2.7.4
>=20

--_002_20190311202038GB15019bboubake_
Content-Type: text/x-diff;
	name="0001-cpulimit-introduce-support-for-this-package.patch"
Content-Description: 0001-cpulimit-introduce-support-for-this-package.patch
Content-Disposition: attachment;
	filename="0001-cpulimit-introduce-support-for-this-package.patch"; size=2261;
	creation-date="Mon, 11 Mar 2019 20:20:40 GMT";
	modification-date="Mon, 11 Mar 2019 20:20:40 GMT"
Content-ID: <F061ECC16944E74CA67C595B1632F0FE@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

RnJvbSAzNWU2ODZiNmNmNDQzZDRkZTQ0ZGQ0MzFlYmVhNWNmYWRjOWU1ODgwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogQmFzc2VtIEJvdWJha2VyIDxiYXNzZW0uYm91YmFrZXJAYWN0
aWEuZnI+DQpEYXRlOiBGcmksIDggTWFyIDIwMTkgMTc6MzA6MDQgKzAxMDANClN1YmplY3Q6IFtQ
QVRDSF0gICAgIGNwdWxpbWl0OiBpbnRyb2R1Y2Ugc3VwcG9ydCBmb3IgdGhpcyBwYWNrYWdlDQoN
CiAgICAqIE5vdywgY3B1bGltaXQgcmVjaXBlIGlzIHB1dCB1bmRlciByZWNpcGVzLXN1cHBvcnQu
IEJpbmFyeSB3aWxsIGJlIGluc3RhbGxlZCBieSB0aGUgcmVjaXBlIHVuZGVyIC91c3Ivc2Jpbg0K
DQoJIyBjcHVsaW1pdCAtaA0KCVVzYWdlOiBjcHVsaW1pdCBbT1BUSU9OUy4uLl0gVEFSR0VUDQoJ
CU9QVElPTlMNCgkJLWwsIC0tbGltaXQ9TiAgICAgICAgICBwZXJjZW50YWdlIG9mIGNwdSBhbGxv
d2VkIGZyb20gMCB0byAxMDAgKHJlcXVpcmVkKQ0KCQktdiwgLS12ZXJib3NlICAgICAgICAgIHNo
b3cgY29udHJvbCBzdGF0aXN0aWNzDQoJCS16LCAtLWxhenkgICAgICAgICAgICAgZXhpdCBpZiB0
aGVyZSBpcyBubyB0YXJnZXQgcHJvY2Vzcywgb3IgaWYgaXQgZGllcw0KCQktaSwgLS1pbmNsdWRl
LWNoaWxkcmVuIGxpbWl0IGFsc28gdGhlIGNoaWxkcmVuIHByb2Nlc3Nlcw0KCQktaCwgLS1oZWxw
ICAgICAgICAgICAgIGRpc3BsYXkgdGhpcyBoZWxwIGFuZCBleGl0DQoJCVRBUkdFVCBtdXN0IGJl
IGV4YWN0bHkgb25lIG9mIHRoZXNlOg0KCQktcCwgLS1waWQ9TiAgICAgICAgICAgIHBpZCBvZiB0
aGUgcHJvY2VzcyAoaW1wbGllcyAteikNCgkJLWUsIC0tZXhlPUZJTEUgICAgICAgICBuYW1lIG9m
IHRoZSBleGVjdXRhYmxlIHByb2dyYW0gZmlsZSBvciBwYXRoIG5hbWUNCgkJQ09NTUFORCBbQVJH
U10gICAgICAgICBydW4gdGhpcyBjb21tYW5kIGFuZCBsaW1pdCBpdCAoaW1wbGllcyAteikNCg0K
CQlSZXBvcnQgYnVncyB0byA8bWFybG9ueDgwQGhvdG1haWwuY29tPi4NCg0KU2lnbmVkLW9mZi1i
eTogQmFzc2VtIEJvdWJha2VyIDxiYXNzZW0uYm91YmFrZXJAYWN0aWEuZnI+DQotLS0NCiBtZXRh
LW9lL3JlY2lwZXMtc3VwcG9ydC9jcHVsaW1pdC9jcHVsaW1pdF8wLjIuYmIgfCAyMiArKysrKysr
KysrKysrKysrKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykNCiBjcmVh
dGUgbW9kZSAxMDA2NDQgbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvY3B1bGltaXQvY3B1bGltaXRf
MC4yLmJiDQoNCmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9jcHVsaW1pdC9j
cHVsaW1pdF8wLjIuYmIgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9jcHVsaW1pdC9jcHVsaW1p
dF8wLjIuYmINCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwLi5kMGM1MjRlDQot
LS0gL2Rldi9udWxsDQorKysgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9jcHVsaW1pdC9jcHVs
aW1pdF8wLjIuYmINCkBAIC0wLDAgKzEsMjIgQEANCitERVNDUklQVElPTiA9ICJjcHVsaW1pdCBp
cyBhIHRvb2wgd2hpY2ggbGltaXRzIHRoZSBDUFUgdXNhZ2Ugb2YgYSBwcm9jZXNzIGZyb20gYmFz
aCBwcmVzcGVjdGl2ZSINCitIT01FUEFHRSA9ICJodHRwOi8vY3B1bGltaXQuc291cmNlZm9yZ2Uu
bmV0LyINCitMSUNFTlNFID0gIkdQTHYyIg0KK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJ
Q0VOU0U7bWQ1PTg2YzFjMGQ5NjFhNDM3ZTUyOWRiOTNhYTNiYjMyZGM0Ig0KKw0KK1BSID0gInIw
Ig0KKw0KK1NSQ1JFViA/PSAiZjRkMjY4MjgwNDkzMWU3YWVhMDJhODY5MTM3MzQ0YmI1NDUyYTNj
ZCINCisNCitTUkNfVVJJID0gImdpdDovL2dpdEBnaXRodWIuY29tL29wc2VuZ2luZS9jcHVsaW1p
dC5naXQ7cHJvdG9jb2w9aHR0cHMiDQorDQorU1JDX1VSSVttZDVzdW1dID0gIjRmODA1ZmUyNmM4
Y2YyOGU4MjUxZDY0ZDBhY2UyMWQ0Ig0KK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1NDQ1MTZkMGQ4
MGM2ODViMWRmMTM0NGE3MWM5MDBlODQ1MjcwNTUxY2YyMTAzMDBmYTRkMTM4NzZlMTA4MTdhIg0K
Kw0KK2luaGVyaXQgYXV0b3Rvb2xzDQorDQorUyA9ICIke1dPUktESVJ9L2dpdCINCisNCitkb19p
bnN0YWxsKCkgew0KKyAgICAgICAgaW5zdGFsbCAtZCAke0R9JHtzYmluZGlyfQ0KKyAgICAgICAg
aW5zdGFsbCAtbSAwNzU1ICR7U30vc3JjLyR7UE59ICR7RH0ke3NiaW5kaXJ9Lw0KK30NClwgTm8g
bmV3bGluZSBhdCBlbmQgb2YgZmlsZQ0KLS0gDQoyLjcuNA0KDQo=

--_002_20190311202038GB15019bboubake_--
