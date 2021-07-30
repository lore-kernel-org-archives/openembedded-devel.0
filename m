Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.25832.1627660337862684241
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Jul 2021 08:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Oy6P7FPU;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3845513027=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16UDtWlx026701
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jul 2021 08:52:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=/LtLTzCe3nBPMpAk1dKLZxcbdymRbGVAd8J7PYYhqOI=;
 b=Oy6P7FPUnjfuBkiJumltkaMBRJICtsjzU1eRLqLnAsAhTJ/OM+vabsbHQP3TxP/cvI1s
 /LfDxKrSrSMiU4QRcPXtw6Uqhl0T+9/y1OzsR6mGk3XDUP6uCOuurFJMoxagIMBDvb7W
 0tFjZXto3q0wDiUatVdqgqfeX87GRmlonEQo6qPmI+pN6+ev2vDHt8bW94IFkove5kJY
 0TDzfCDJBo+GB4u+WmtKkINz+D7UJ1dMNZJD9kJ1MKlegGtscAUQ4Sw7sWxw665pcy3k
 CTP8WfBLZu+aLZG9dkpMyJCDoHYkILqrf64TXNV2Ka82nbmj/e+wn30wSObFGbrxqCJW yw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a3uu0sabh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jul 2021 08:52:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1sAoDBMPKCBLdHV4yKNYCgmXyJW6IrInjT7Bvc6gSBs3agNTR0REcdHxmWe7K1at5afLaxmjXxuJa5H8bD/v1lNvxYrwTUwEN2Zx0SnMBR5QikEV30Ht6XCfeAOUG+A0aHRPpbT4TqB2jFRlHDgnzEmY4b7BhyYAFV/23AaVo/XERDaD6ZXKBMvJhXsZjFIEqST1BxRfTJqwl8x/biEW8Q5Bmz3iCsLGxcJM535GAA2yg0CTHamhvn7XxFPlWEj/xdLFxb2AE+0Vdk8ZArwIM8r7Ykgl+Ayw/24/l52LChBE3f+94Sztu1aMtU24cxU1CFy/hPWSpa/W0WieM/ZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/LtLTzCe3nBPMpAk1dKLZxcbdymRbGVAd8J7PYYhqOI=;
 b=DSYbyfaqYj/f3PB13Up/u+QSLHfsb391O9vdAKKNeSk01AbER46WbUJfuzhKRXGPfxu7QvtAYJiIZhrha0yRFItXMZNf35hLZ8wL+qQ9XKgbowuYJkNk1JcR+kIWNw5+6LQgKWuefEFYl+ZhxR0zwg+NzvOMRWjq7gjEQtL/nfgXofLBO4tIotyZfZL6PTS0whaH2CExvf5eH2d7rCfjaoQquyo9Oy2UKLsqMoF81myYpAujHGiuEaL84RqLvSTJftD9vTEBYRpxTFUdGcnRS/ogQgrjdUmXd/prHuF/Kzy0XmcgVU+WXSmXCgwSvL0GQdQS9BXq0tqi2Ann9ud/2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM5PR11MB1674.namprd11.prod.outlook.com (2603:10b6:4:b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.25; Fri, 30 Jul 2021 15:52:14 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::d44b:60e8:b607:73f7]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::d44b:60e8:b607:73f7%7]) with mapi id 15.20.4352.035; Fri, 30 Jul 2021
 15:52:14 +0000
Subject: Re: [oe] [meta-oe][hardknott][PATCH] lmdb: add recipe
To: openembedded-devel@lists.openembedded.org
References: <20210729182156.16834-1-sakib.sajal@windriver.com>
 <31c118d9-7c29-e8f0-5f04-80ffacef09af@gmail.com>
From: "Sakib Sajal" <sakib.sajal@windriver.com>
Message-ID: <bc42345c-faec-c656-692b-96e9d1bd8796@windriver.com>
Date: Fri, 30 Jul 2021 11:52:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <31c118d9-7c29-e8f0-5f04-80ffacef09af@gmail.com>
X-ClientProxiedBy: BL1PR13CA0241.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::6) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.28] (184.147.146.64) by BL1PR13CA0241.namprd13.prod.outlook.com (2603:10b6:208:2ba::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.12 via Frontend Transport; Fri, 30 Jul 2021 15:52:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3cd0b2a6-ea79-454b-67ef-08d95372000c
X-MS-TrafficTypeDiagnostic: DM5PR11MB1674:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB167403640BA83AE0B86969F2F2EC9@DM5PR11MB1674.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BmST/qzQHDkSv7s0J4sq3HF3mymZDyv6i/f45DGp0U5aKvp2CtKYG0Uccuy9leYoRtwpy1Vnl4Bite0CD2KYtSy5MNmgPtvV3GnwwMDWYtBKUITyvpMaJFl1715Lci8eZk9uLhIvjKq9NJEvF/fG6+GpU29rt9hpDmDbyx1lWyy4iXzveb1sJ30FXyz0Ebtnd6JsA8OW/4gyS+ukCYDCkNAh25yl0cx4hHc2kmK7MqpvRBIQtqc0qKAxwwQsEoTADwQRZEaDGSm/irfNDgfBfvEqqpgatXSMJaYN/yCL6N6ZPMhSG53+W3JHnc6yPfl+rC3OW8dBi1ck+TBc3tpUh9Pmx1g1dunTtUG+LWoiAaslccSZqowizSiu3a7A/XoAhl6FhTY0jm9eA8HcS7K7hqK5rRSQbpnTPmmSR+hAG/uCVqp3+N09K8Ie7IGL1HYYQRO4mTBLkJ4NjSFMhKexs1PLQt6QiBYkmuG4zDubgupREx66A0Hfqe1zfrxThy08XpgIezcG5h8ZMhod9VARXu6TaIeLyLJ+cvXt6/AxammDgRO4WmUAdZ4AqU40m1lFy2d2oqIsAStRoRJUdZxG9XuRNM663BwfVKQ8NfTNzqlVQE+PVhN0B2LJlxulUKRpCg/wXyYJ0T3Pl/UsMVrjTfFC2v0Dhsi0joT2duVqvLc7jsNGAXN3tfd+6r/KxJ59JORmJ5nw4FQEUmthzqwcvmu71ryKlhtYKU0v8xX0QJOOZs/BM7hJgFgYBy3hvzANibWcM5qqSmm4Df1tj9EaYjjPEW60GfqUzHAFkTukpfmu6Sf240LsIs/Hlt8doFJwKoiEnG/VoqtptxJ6AdhkH1TW6AVbi6opSZp5C7X/rgWdcp81GRIzqwNscK5tYOwo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(39850400004)(396003)(346002)(8936002)(33964004)(66476007)(6916009)(26005)(66556008)(66946007)(8676002)(5660300002)(166002)(966005)(83380400001)(956004)(16576012)(478600001)(31686004)(86362001)(2906002)(53546011)(31696002)(44832011)(52116002)(186003)(38350700002)(36756003)(316002)(38100700002)(6666004)(2616005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Vm1deCROiMhYDKeRv8cryAa08BoiqtbjAyLYTPXqAi8XTm1LZgv6pLwrXaMjXkGClnr6WULGsOsKkiAzjsMOSo1mtq/g55GhechTSzl/G1MhYpmU82TQpK8e+47NJb7NZK9i37RiNEQIMuhy4wVzHHX/nTpnAGwcV8XrtQqje34NfY74r47UkImP0E1Z7HinfFaNUV1cEevON9v6FO2c1VIMV1hRz/GyfkzLj3TkbGxUOYRbILhuGynLz5WJKiJiYAPUreiZfV4Rt6UvhyizXX6QSQmRJ30tnj5pwz5MFdcpbkGsdehPH85GX4cxQqaNcTIi5SvHg1VVVjJLGXG83mIMGYMSO+I7L1E0qDEUUG5D0GRXwRuzaCsMXGwq6gkZVtqSfGRsEbEVxE3e8YCC2L/wlKIUuyS2+k+5zUHBmujRCk4+m6NnlayHL91x2wF3TAOlptd4QN7ZrV98CFodYi3J1FGDD7U76Sk1ANYFU3VlMN3zyFocgb8kw22fAbWSTR8DqBvqNXvWq5moYE3zOQdwqT4hpJqxw94x/s+0SpEoYNPlmVkasNP9WExwB0wOCzwsgcSoxmgfJyTppu9dpjIbxXblru5F1A0zbIF5OinGyQ707PEH2RF86pP7BB/dfF1SgqQ6ocgpddPUfdkJtqNBk2nTARCwaEJJ5hvStXJIa/dTGtnBeeCc828I19VSOB3yv2dPIGktLemeBvjlBrPrGRl51orcFZzHek/tR/S5xsTg/HgU+iJ7qmfcDDbo
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd0b2a6-ea79-454b-67ef-08d95372000c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 15:52:14.4124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kUTfjqNroN2TdWxi5jSarLNH5cE9PJIwBMdsPfmxm23xhn9FdPeiGfYgVlRuy3wxn14fDX1muqbSu09M++eyDoW7X9aTLgki0vC2ZTJ0XPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1674
X-Proofpoint-GUID: tP1E0dDoxWX6Q3KLJVJ5a7FalBGHr8nG
X-Proofpoint-ORIG-GUID: tP1E0dDoxWX6Q3KLJVJ5a7FalBGHr8nG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-30_11,2021-07-30_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107300106
Content-Type: multipart/alternative;
 boundary="------------22818084EAD921704D581E1C"
Content-Language: en-US

--------------22818084EAD921704D581E1C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-07-30 9:45 a.m., Armin Kuster wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On 7/29/21 11:21 AM, Sakib Sajal wrote:
>> lmdb provides a high-performance embedded transactional
>> database in the form of a key-value store.
>>
>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Adding a new package to a stable branch is not allowed per process.
>
> Your request is denied.
>
> - Armin

Thanks for the information.

Sakib

>> ---
>>   meta-oe/recipes-dbs/lmdb/files/run-ptest | 25 +++++++++++++++
>>   meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb  | 39 ++++++++++++++++++++++++
>>   2 files changed, 64 insertions(+)
>>   create mode 100644 meta-oe/recipes-dbs/lmdb/files/run-ptest
>>   create mode 100644 meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
>>
>> diff --git a/meta-oe/recipes-dbs/lmdb/files/run-ptest b/meta-oe/recipes-dbs/lmdb/files/run-ptest
>> new file mode 100644
>> index 000000000..a6a7549b9
>> --- /dev/null
>> +++ b/meta-oe/recipes-dbs/lmdb/files/run-ptest
>> @@ -0,0 +1,25 @@
>> +#!/bin/sh
>> +
>> +cd tests
>> +
>> +retval=0
>> +for t in mtest*
>> +do
>> +    mkdir testdb
>> +    ./$t > /dev/null && ./mdb_stat testdb > /dev/null
>> +    if [ $? -ne 0 ]; then
>> +            echo "FAIL: $t"
>> +            retval=$(( ${retval} + 1))
>> +    else
>> +            echo "PASS: $t"
>> +    fi
>> +    rm -rf testdb
>> +done
>> +
>> +if [ $retval -eq 0 ] ; then
>> +    echo "PASS: lmdb"
>> +else
>> +    echo "FAIL: lmdb"
>> +fi
>> +
>> +exit $retval
>> \ No newline at end of file
>> diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
>> new file mode 100644
>> index 000000000..0746da141
>> --- /dev/null
>> +++ b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
>> @@ -0,0 +1,39 @@
>> +# SPDX-FileCopyrightText: 2017-2019 Volker Krause <vkrause@kde.org>
>> +# SPDX-FileCopyrightText: 2019 Hannah Kiekens <hannahkiekens@gmail.com>
>> +#
>> +# SPDX-License-Identifier: MIT
>> +
>> +SUMMARY = "Lightning Memory-Mapped Database (LMDB)"
>> +HOMEPAGE = "https://symas.com/lightning-memory-mapped-database/"
>> +LICENSE = "OLDAP-2.8"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972"
>> +
>> +SRC_URI = "git://github.com/LMDB/lmdb.git;nobranch=1 \
>> +           file://run-ptest \
>> +"
>> +
>> +SRCREV = "LMDB_${PV}"
>> +
>> +inherit base ptest
>> +
>> +S = "${WORKDIR}/git/libraries/liblmdb"
>> +
>> +LDFLAGS += "-Wl,-soname,lib${PN}.so.${PV}"
>> +
>> +do_compile() {
>> +    oe_runmake CC="${CC}" SOEXT=".so.${PV}" LDFLAGS="${LDFLAGS}"
>> +}
>> +
>> +do_install() {
>> +    oe_runmake CC="${CC}" DESTDIR="${D}" prefix="${prefix}" libprefix="${libdir}" manprefix="${mandir}" SOEXT=".so.${PV}" LDFLAGS="${LDFLAGS}" install
>> +    cd ${D}/${libdir}
>> +    ln -s liblmdb.so.${PV} liblmdb.so
>> +    rm liblmdb.a
>> +}
>> +
>> +do_install_ptest() {
>> +    install -d ${D}${PTEST_PATH}/tests
>> +    for test in mtest mtest2 mtest3 mtest4 mtest5 mdb_stat; do
>> +        install -m 755 ${S}/$test ${D}${PTEST_PATH}/tests
>> +    done
>> +}
>>
>>
>>
>
> 
>

--------------22818084EAD921704D581E1C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-07-30 9:45 a.m., Armin Kuster
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:31c118d9-7c29-e8f0-5f04-80ffacef09af@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

On 7/29/21 11:21 AM, Sakib Sajal wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">lmdb provides a high-performance embedded transactional
database in the form of a key-value store.

Signed-off-by: Sakib Sajal <a class="moz-txt-link-rfc2396E" href="mailto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Adding a new package to a stable branch is not allowed per process.

Your request is denied.

- Armin</pre>
    </blockquote>
    <p>Thanks for the information.</p>
    <p>Sakib<br>
    </p>
    <blockquote type="cite" cite="mid:31c118d9-7c29-e8f0-5f04-80ffacef09af@gmail.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">---
 meta-oe/recipes-dbs/lmdb/files/run-ptest | 25 +++++++++++++++
 meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb  | 39 ++++++++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/lmdb/files/run-ptest
 create mode 100644 meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb

diff --git a/meta-oe/recipes-dbs/lmdb/files/run-ptest b/meta-oe/recipes-dbs/lmdb/files/run-ptest
new file mode 100644
index 000000000..a6a7549b9
--- /dev/null
+++ b/meta-oe/recipes-dbs/lmdb/files/run-ptest
@@ -0,0 +1,25 @@
+#!/bin/sh
+
+cd tests
+
+retval=0
+for t in mtest*
+do
+    mkdir testdb
+    ./$t &gt; /dev/null &amp;&amp; ./mdb_stat testdb &gt; /dev/null
+    if [ $? -ne 0 ]; then
+            echo &quot;FAIL: $t&quot;
+            retval=$(( ${retval} + 1))
+    else
+            echo &quot;PASS: $t&quot;
+    fi
+    rm -rf testdb
+done
+
+if [ $retval -eq 0 ] ; then
+    echo &quot;PASS: lmdb&quot;
+else
+    echo &quot;FAIL: lmdb&quot;
+fi
+
+exit $retval
\ No newline at end of file
diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
new file mode 100644
index 000000000..0746da141
--- /dev/null
+++ b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
@@ -0,0 +1,39 @@
+# SPDX-FileCopyrightText: 2017-2019 Volker Krause <a class="moz-txt-link-rfc2396E" href="mailto:vkrause@kde.org">&lt;vkrause@kde.org&gt;</a>
+# SPDX-FileCopyrightText: 2019 Hannah Kiekens <a class="moz-txt-link-rfc2396E" href="mailto:hannahkiekens@gmail.com">&lt;hannahkiekens@gmail.com&gt;</a>
+#
+# SPDX-License-Identifier: MIT
+
+SUMMARY = &quot;Lightning Memory-Mapped Database (LMDB)&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://symas.com/lightning-memory-mapped-database/">&quot;https://symas.com/lightning-memory-mapped-database/&quot;</a>
+LICENSE = &quot;OLDAP-2.8&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972">&quot;file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972&quot;</a>
+
+SRC_URI = &quot;git://github.com/LMDB/lmdb.git;nobranch=1 \
+           <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
+&quot;
+
+SRCREV = &quot;LMDB_${PV}&quot;
+
+inherit base ptest
+
+S = &quot;${WORKDIR}/git/libraries/liblmdb&quot;
+
+LDFLAGS += &quot;-Wl,-soname,lib${PN}.so.${PV}&quot;
+
+do_compile() {
+    oe_runmake CC=&quot;${CC}&quot; SOEXT=&quot;.so.${PV}&quot; LDFLAGS=&quot;${LDFLAGS}&quot;
+}
+
+do_install() {
+    oe_runmake CC=&quot;${CC}&quot; DESTDIR=&quot;${D}&quot; prefix=&quot;${prefix}&quot; libprefix=&quot;${libdir}&quot; manprefix=&quot;${mandir}&quot; SOEXT=&quot;.so.${PV}&quot; LDFLAGS=&quot;${LDFLAGS}&quot; install
+    cd ${D}/${libdir}
+    ln -s liblmdb.so.${PV} liblmdb.so
+    rm liblmdb.a
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    for test in mtest mtest2 mtest3 mtest4 mtest5 mdb_stat; do
+        install -m 755 ${S}/$test ${D}${PTEST_PATH}/tests
+    done
+}



</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------22818084EAD921704D581E1C--
