Return-Path: <samuli.piippo@qt.io>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0104.outbound.protection.outlook.com [104.47.2.104])
	by mail.openembedded.org (Postfix) with ESMTP id 7CD2274F56
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 11:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Xy2FLRYmS7+cpXxApbRamiRCDB3UWf5cb17jURvrYIk=;
	b=REPOZZBPS5V+H+shBOAipGB1RvwTBmtl82LG2bUZoh2ZezGD5OYFNyjp78829s30t8eudxJi4d7zva12u/ieCoC3HT54LEfjYxKh6jjIKvdPRW+kcpa16xT/aIpxljXLBTt+szM1nXH36Go2hSeI1SGVQitzzczdVgdd59zUDqA=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@qt.io; 
Received: from piippo.intra.qt (192.89.120.53) by
	HE1PR0201MB2265.eurprd02.prod.outlook.com (2603:10a6:3:7f::8) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.735.17;
	Wed, 9 May 2018 09:32:44 +0000
From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 12:32:19 +0300
Message-Id: <20180509093219.3019-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: AM5P190CA0009.EURP190.PROD.OUTLOOK.COM
	(2603:10a6:206:14::22) To HE1PR0201MB2265.eurprd02.prod.outlook.com
	(2603:10a6:3:7f::8)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(7021125)(4534165)(7022125)(4603075)(4627221)(201702281549075)(7048125)(7024125)(7027125)(7028125)(7023125)(5600026)(2017052603328)(7153060)(7193020);
	SRVR:HE1PR0201MB2265; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0201MB2265;
	3:No79aD9SmuI/yrEBlZb1NyEOZ8IIqfNC9b2SPjn05PeDW/ccEZUBNJWyfP6ZhaR8mIcmR/DbBU+sYYnZW5IW5KmooP93XCY+fKs05ixh7xZLWNgiKUhUJBwTvplNv4vdFzObuITMy80D05FfcB+0G+FydrJaqkidXZyj2gir8IU85/zS+3XOW5Yy5JDF2JB+23DK+6/mc2NE/yute8BNXdqwJxMH5wum1fn2SkrLDos7n71IM3s4nnjM/AMRIOCl;
	25:UyP1yCgn5d1kMRPoMaCldten5hVbig1Wb6fOCkvcqD5xaezkF9f09pKg7xjr5UgKWr0VpgCkfBYZmRjKv1yyWE3QwYYIjsAOrenbnLCzGSINnHD8w4iwjVCmeYLuMGkn8YmvHCz0XpL2mLRc8ZOStJvv74qMjk5jkyHdPDGwUAkQpnNt16HjStKUKNRhYuApTLVNIrGmag4e46AKCbFU+vmUyw3d0O9QmuWSJPpsM32IePKNijIKCra99CsrReDiryXhUIv0SWepzj6jRpfDQmEdfk1TLXFnEumiXcH4pfo18XdxuH2k7EEBjCIGfYkQXCzosj6wsnGpMBWjCm58dA==;
	31:+epvooKDEagtQwugOZrysnsr1SRbUF+9+wbNRFdUeQGB2uKbQBDauUPz/P3YYM4nfHvdmtk7KZ2MGNGdd1arprT4axT/1qNQq4Ab/DynBxpypGq8eq6scFmDX4aHik8Bw4nJSEgTGNx1RunD2hudRYI1LQmKrUD4Ey5LjoiJJ+C995CyXNAZNExOzr5OL8KQplYVVZfGHYPlx2PGCCR0BgY8tTe9iyj3zaREs3Fe0ME=
X-MS-TrafficTypeDiagnostic: HE1PR0201MB2265:
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0201MB2265;
	20:0BoP8rAZoKB3MNerpUNp2AdkdptkZBpKovflKzVKMA3Gz61XLghQ780igHZF5vvjWOentie99F+w3b4OxYYrNNwEy7RfZhIzuUzLqpQTzTZyAcuIwmy8ufTKwh6fGgEdCCcic0aLN3bevkIOTAOIRNNJqJP3irjiWn/qAMNJJ0jM+/J7/hzSTwMTfbO7urXwpCdQodd9vDVI3pb+O+dZGM+NkA9U+gXSNHZlTW8s4sfTby34zgH9PKcZR9ZjH6NeXJlezgGVO6ctttjeE75/9ONHNvyd97kDs1jAZvJk36shbMArBloYVoCxLQcIO+uPpKf9KWquXjGrl6VhH640VyaA+/IyEEzrCDoYudf62JkAFhdqgP2ExaYQel8ABvasJ/XhbK9NTQCT7qzAGahDiowg6AlcL3kuNlJGShDPilgQiN4y2HbukL5fXvF5L6/iVGv71kiSBSwUNC6uFVc8hzeMLxTecgUojgHtmugazXKOOMeelU4hB9LtzJYH3rGk;
	4:b7kekNPMWwe8MovBYKfXDhozE3YWltBteq1124eY9J8VFL83KD3JysuKMr7W3+qjxn+v322KT4W2siyCAKn8TJIFwE9NlQQQU4YXBX3SSnxIy45jpSLvWmzWbbVqCco9L2cDnjUrRF7bmqJP+HGmwvAqey6GGu+e5HUUx/kj2TL+RF0MiO0NbkYdGAM+k0HBeWMKWTwhSEgfgoW86xise9jHrB7uYoVcj+Eb+Wo6xJlhYh79u+jA1ZIG4/gXisakfWp7v9GYhoweTfYZxtlR3A==
X-Microsoft-Antispam-PRVS: <HE1PR0201MB2265BA53EDB5F6BFADF65F19E9990@HE1PR0201MB2265.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3231254)(944501410)(52105095)(10201501046)(93006095)(93001095)(3002001)(149027)(150027)(6041310)(2016111802025)(20161123564045)(20161123560045)(20161123562045)(20161123558120)(6072148)(6043046)(201708071742011);
	SRVR:HE1PR0201MB2265; BCL:0; PCL:0; RULEID:;
	SRVR:HE1PR0201MB2265; 
X-Forefront-PRVS: 0667289FF8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(396003)(39380400002)(376002)(39850400004)(366004)(346002)(189003)(199004)(74482002)(2351001)(53416004)(50226002)(97736004)(476003)(486006)(1076002)(8936002)(25786009)(316002)(51416003)(2906002)(16526019)(7736002)(81166006)(8676002)(575784001)(2616005)(186003)(6666003)(36756003)(3846002)(81156014)(956004)(86362001)(47776003)(52116002)(305945005)(6116002)(6916009)(16586007)(59450400001)(2361001)(66066001)(1857600001)(5660300001)(53936002)(69596002)(386003)(6506007)(68736007)(106356001)(478600001)(33896004)(50466002)(6486002)(26005)(44832011)(105586002)(48376002)(6512007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0201MB2265;
	H:piippo.intra.qt; FPR:; SPF:None; LANG:en; PTR:InfoNoRecords;
	MX:1; A:1; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; HE1PR0201MB2265;
	23:PRJYZWpoJKN6cUEilpDoEL6rTkIkuBzzVbGPp6K?=
	=?us-ascii?Q?+m+00Bmatk4JLFk+v38LkmJpL6oy95rG/16MB56hqsflObrj1BBOU2egLowV?=
	=?us-ascii?Q?Gzy9EDJfmD6r5wyjVzTpPMTetzsSf62WFNMZx1xcmKfaE+HrZjocAGkAIY80?=
	=?us-ascii?Q?2ucA5mRTX117ThsYRawGffKm7kp8U8/6MNhGHZS40Kzh+lePXIWFDhUxoOaV?=
	=?us-ascii?Q?vds9gajSJvTXgrQ1xfKnUVjdhhQOasztD0OOchVYF7ir65Z0UOWz4FMiAJw/?=
	=?us-ascii?Q?fR1tCiHBu31frlIKNMC13B7iZkG058PL/weAPR3eG1TTYWFnBC5qN3QvrUjx?=
	=?us-ascii?Q?jJ1vDsXUSnUeQ7Snyrwb4Tf1PlwFg23urRgzzMr/Iihe6bDWy5h2e34jdc3e?=
	=?us-ascii?Q?T99pPeVrpKvhEYhBfDdytPUXdaCoPC9nJrJEq3AW0EgxSfvOK+/ooEmsHEJM?=
	=?us-ascii?Q?Mz+qHBNvMZjDPZSuKFcZAPYNjmnWZ8ApXjAigwjddcqjISOYXRax2P8qQ9XL?=
	=?us-ascii?Q?Q436s5GDt2OxlY5njL120W/33smoysV7wH8FVEQpNv8DmKh/QOAjbfy9iWCK?=
	=?us-ascii?Q?S7MTbZruh35AN3VsXSKRPDmXgk9KxB7RHy0pmhLPgcZBBSVh/yZpEqhjyQWk?=
	=?us-ascii?Q?aTAuocBwtXwdft7qOm6khRY34DC6ONN9Ah/aoXAYZRTzqvX/g6Vb9xCnbY3V?=
	=?us-ascii?Q?0rbmyKu/az8jFhwtuMxQwG1S3RLw6mcvDFluM4BFQvP2Y7+yYRwfCptNPYG8?=
	=?us-ascii?Q?S9ooGhayvCg5nKNYMLrjPPNYXtAIxnVWelO3g+XPbAFqWwHiqlo6j6dcbFCw?=
	=?us-ascii?Q?++603yjlqxnZq9qqHmfdlW+qLKakrjtnnVW+V/3mNJhbgJuH80wov74mY6wo?=
	=?us-ascii?Q?sZLEu88QIBhqkWrNFfaeFpOi5sHJs4X8O4sy1oNQ5A372ezJ9f0c61NIOet6?=
	=?us-ascii?Q?VyHKiQ9ZzI9QmMklFvGBBw2JaXg/fNClUcpPAvg2t7ZiA0ZOmyUiz2D0Wc5D?=
	=?us-ascii?Q?1DKpaQLqYZ+i0BRDpXgxcIUMFTSw+ptRaGh0ncx6A03LteYLUQOQ2FuV8hwA?=
	=?us-ascii?Q?4xc2dDky+/BAsnBEo8FqRC0jWmgGrXuzm7oNLhdOmBx9QUjYpZaxCm/LQobO?=
	=?us-ascii?Q?xUC7jytMMMpm3OcwxEUYIEx4PrDjCdoLXNTjN3NcpaZPJQ7JZGBfe6I93HZQ?=
	=?us-ascii?Q?PVHQoCGDY+7i8jck0zSuY83b1vBOnbVQ+irGwOtf4SM00PTn+ijpe0RgRQaC?=
	=?us-ascii?Q?mLLGcF3XIHBSGEK8mKk6SM4HzxFMZcvySfCWeqsuCfGugkUmNN2jwQHosDAZ?=
	=?us-ascii?Q?n2GoNQz9/6fo5j9JxUeEf/pN+YsSxYL8YcRgh/B+4fUGg?=
X-Microsoft-Antispam-Message-Info: y5mq/wcOC1xriOqgA1F5/75n++jsEvTCj9Md+59iSc/8slXI+Wc+ZRFXwB4fEVBB65sxaGNnPyALQMUlwPKvvarJPrCQR3wqhNiIC/txA8QESHhQNKmvOCL5A9M6UhfRH//JXJ4o+nYbMGTAdlQy2VkAd4ymdxyg6kdpDHdBwkXfOIqb4qVqx8NYEPKEmwa/
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0201MB2265;
	6:WDPRDwr/MevqfWqNqc0FKRDa6wFFpEFHycX0iUHvQNNYiKh6ESReq5+Rxxc7IANbtFN3d/NjnC9+3Mcl2yibIUkmJc4ATuicz7C5lwe9Mb8SV4G0E8AAN/vDcujrlPxWEwKo9rVMoFlkAkxEiei2FtG7onbBO+IzdokY09ka577cWMyN9FmJGHAvt4dTZ0qM0z2QKQnk65mKpc+tAcpEr0rZsJ9p9tbVl2zkggt8trSdfD0hKAYU9YHQGyNbXSiNcNuLacyG/sobUVJ/HABrVS9QKY7uqhbf9D3MeUtQwfFEIXYFkaNBI+m/cG3lDPBTvMhRCWhHGhUJwdteQfHz/drBEh8qoxTTGEja1FM5fU8OBYmNiemu/rTD6Q/lxPHe1W+NgS91S9AH+WqDixB9ikl3+PyNxPajB01zhj1thsl8LKLxijTuofmgS2T4j/mwfdGHk7rTh+3g7yyiZBtYcA==;
	5:0aSzLwo+XFKg33U20yC+a3BUY31lp7xmTFuOJxwM4/1xqgJzeMASPuG3A4PkSH1jTKq3gU/ZOeJjsnbjMsylbV0Gp07u7EBC+vl3K2P5rv9Gw+JguVvgnFGMBprggC6mJMpfNPmBbhgQRnPMmGKBhB2xoTt5dQQFjn5tr4XTNNo=;
	24:boQcfyfanuVSczawJ6VxULblVBCQwpsM9d4nvuSIUqDKh8rgizLBSOKFJxask1MQqUxW6d86LsI5QBK5HnHtC9v8k2jUBtLwyhb9MUCJt+E=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0201MB2265;
	7:8WG9h6K+azpO5db0LH+qGKPP/ET51uTyI+p/bapqgMKUGFAzy2KsPLL27kJ8LKJmFoD4fTIA6F31K75ica2J2sjFjWPeC+SOEWXVq1CSWOfJBFPLAq052kMoJV5O/D0m+UNB9dgglWB7SX9mJ6b4Nqea0B+rjZ51S3EVHcdQ4vpN3O4c2ECN7rEi7tZyOh5uIdV7OHBTfPOv2BLMRE+X0ooVmTNxDBMBoCkGk1eSpSeXjxk7cXFnRzwwZi7e04Wz
X-MS-Office365-Filtering-Correlation-Id: dc7837b5-44bd-4022-85c1-08d5b58fd1cf
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2018 09:32:44.4500 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc7837b5-44bd-4022-85c1-08d5b58fd1cf
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0201MB2265
Subject: [meta-qt5][PATCH] qtbase: don't pass empty filename to function
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
X-List-Received-Date: Wed, 09 May 2018 11:06:26 -0000
Content-Type: text/plain

The environment variable is empty when running qmake from SDK or
in device, which gives 'Empty filename passed to function' warning.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 ...3-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index d0d5390..83011d6 100644
--- a/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -29,7 +29,7 @@ index 422d08f..a59df4f 100644
 -    QString qtconfig = qmake_libraryInfoFile();
 +    QByteArray config = getenv("OE_QMAKE_QTCONF_PATH");
 +    QString qtconfig = QFile::decodeName(config);
-+    if(!QFile::exists(qtconfig))
++    if(qtconfig.isEmpty() || !QFile::exists(qtconfig))
 +        qtconfig = qmake_libraryInfoFile();
      if (QFile::exists(qtconfig))
          return new QSettings(qtconfig, QSettings::IniFormat);
-- 
2.17.0


