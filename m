Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 85DA865EA5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2014 08:06:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3E86tkN021006
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2014 01:06:55 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Mon, 14 Apr 2014 01:06:54 -0700
Message-ID: <534B971C.2070401@windriver.com>
Date: Mon, 14 Apr 2014 16:06:52 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1397459226.git.Chong.Lu@windriver.com>	<2201d43b35ff3c7007ccbd3805b2d4ec0d0b9193.1397459226.git.Chong.Lu@windriver.com>
	<lig3ir$ibp$1@ger.gmane.org>
In-Reply-To: <lig3ir$ibp$1@ger.gmane.org>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH 2/2] mariadb: add perl to RDEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Apr 2014 08:06:54 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 04/14/2014 03:43 PM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Chong Lu schreef op 14-04-14 09:16:
>> Perl doesn't be installed in small image, but mariadb-server,
>> mariadb-client and mariadb-leftovers need it in runtime, so we add perl
>> to RDEPENDS.
> It doesn't need any perl modules to work?

mariadb-server, mariadb-client and mariadb-leftovers need /usr/bin/perl

rpm -qp -R mariadb-server-5.1.67-r0.core2_64.rpm
warning: mariadb-server-5.1.67-r0.core2_64.rpm: Header V4 DSA/SHA1 Signature, key ID f6cf289c: NOKEY
/usr/bin/perl
...

BR
Chong

>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com> Signed-off-by: Chong
>> Lu <Chong.Lu@windriver.com> ---
>> meta-oe/recipes-support/mysql/mariadb_5.1.67.inc | 4 ++++ 1 file changed,
>> 4 insertions(+)
>>
>> diff --git a/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
>> b/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc index 37a0f0c..e474b3c
>> 100644 --- a/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc +++
>> b/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc @@ -116,6 +116,10 @@
>> FILES_${PN} = " " RDEPENDS_${PN} = "${PN}-client ${PN}-server"
>> ALLOW_EMPTY_${PN} = "1"
>>
>> +RDEPENDS_${PN}-client = "perl" +RDEPENDS_${PN}-server = "perl"
>> +RDEPENDS_${PN}-leftovers = "perl" + FILES_libmysqlclient = "\
>> ${libdir}/libmysqlclient.so.* \ ${libdir}/plugin/*.so.*"
>>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFTS5GcMkyGM64RGpERAoYVAJ4+8cnpKMHIC7YqhO/N4QZPMAX3DACfaheN
> oB0KZz+3h0heDx7RJ5gdiT8=
> =ttpI
> -----END PGP SIGNATURE-----
>


