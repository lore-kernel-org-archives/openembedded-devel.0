Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 4769 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 06 Feb 2018 21:01:33 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0076.outbound.protection.outlook.com
	[104.47.37.76])
	by mail.openembedded.org (Postfix) with ESMTP id 8324660119
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Feb 2018 21:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=KA4jl3Ee7YwVFYwT/YCcRpWi+JsgnTqtqPdDw16CUzk=;
	b=YJYxPZBCON8zMF2vdlc20BkhLQUZtWOX6hrO+8cvvHcKf725qRwvwoihJmXdTw8QS8N8OtydOOs1LjeUqt5us2rS3iEOfIOgsLkMtSBnQXiQh+ASTgb9npszmfpaDRRJ/TcGxPLuNFb5aTnOttf0eKgKb8WV03TwTKPRffqoGNc=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from columbia.corp.xevo.com (65.122.179.226) by
	MWHPR0101MB2942.prod.exchangelabs.com (10.174.170.13) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.464.11; Tue, 6 Feb 2018 19:28:02 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Feb 2018 11:27:39 -0800
Message-Id: <20180206192739.15066-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR2201CA0043.namprd22.prod.outlook.com (10.172.59.17) To
	MWHPR0101MB2942.prod.exchangelabs.com (10.174.170.13)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 699d2104-8a5f-4c01-8d3a-08d56d97bd0c
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603307)(7153060)(7193020);
	SRVR:MWHPR0101MB2942; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2942;
	3:guxafQZpbr5p2WkeMLYLwNgnHvLSSPXs/F4H+4GRvVzINPb5WsjrFUmbptN9+DE4NsdjVH2Uv4GYAC/qake5t270g11WOrom/5hGMNE7eacxky0OF1rNG8VYSqI1f/X3goaEyKryzppaL8Sn2kaVwGBO1VXoYfySqeyJAUVM/U1nZQ7GHluPUJIVwgDpnALrvYEBvwwojlsgOAnNBzJX78aBqkS0gH06WXMQpvygTRFIYGE9s5KgtBkAKOZv1bKg;
	25:FuHoJTFTeX6TObLOhZW0lA+g3XgbXzJsbYlyllAx1MoGxyKNvDQnlShZBjYxkOkAdRtDnyHeHrRmrHWNmpvaud4VuIvWJfH4DtD8ZyfXcxmq8M4khmfWgo5cr5U1WesnPouJw2uV1prc3g1L6OLV5SU/nABoL8Zg6ZWLmYQkXwOU2ZFqw+SUsVkfoNRtVeEUfQuF8zI577618Yu6wsVGFrT5I6+eIcm0SoGDfLACL7bNUPjZw0NlmXvpNOk5pRB7fsa3KDERnd1NvwxtPq18IyLx/GOCx6uS59vzp3nX6Z50+UD1fdrW1zJ/qUUnDLTKvB3/1e7X4noEeYmh5UbXnw==;
	31:SJhPS1mgv551pgdkXH1bUPQAa7nm7Qqahc0BOqcGMV9ntoAp+yERQvA+QZtPFHD8cggrDCmzJ7g9KFG3GeAbs2EaO+dvvgLLadLGnJlzbA0a/26p9kxU8bhfexmnTbVlGd1Avxce9jdRF/7RtV3sEt97Z5voSO7ixy0pkEzc8UlomcrsZxeah2pIdcAbkdaWtDRfXACjvmPdTLHUUOvleP0xrJZm5rMm8S9uyg9Cq18=
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2942:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2942;
	20:T+MtsxYK4lJ4DAx8LKJcrLK7iQz055ZSJjYVowtWzcsEEk5PVlzk2lETPReaborYV2K5yw9Me4Gq3wuglZP2fc3ZiabUDYBo78YXFRC1tHinMZRbUMM/KC//kGizAiuTiVbiNVpTIhiyW3ISnbqJbkaWo9js6kWEqSmbA+yjJd3ulMObVe9teaaL4CeXmjkm1J0yaEt4E8JAEZaNKI6ikjXxhbXP4SWgVm04zznxLi+HcVpXRtmvyJIv8nO1iGeGcEbQ02UIP226a6hBKotyI7pfYVWncnKZeS6X1Q5LNbBb7QHlHMIyiQOaD7K8NDFu+MhdBDIb9DXsmUiqf/qRrqm1ODeK6xGtrnthEqyX9W+B8LLkSukHtcY2kxrgFvgIwPvV/fPZdciJ9vvLqDbGZqIt9TJRZdKK26PjbLMgCO4=;
	4:Wij/0pF+xKizB+17VKPlKIdHzz5dzAzR0SsKVodq/5l0e1DbCtfHpftxG7G8cgOVBTsZ/Ra2z/e+5MLAIDDCtknApVdVDZVRH6SOBrYO8kiZ6k9qLXb3xm2tDSsHQWDCmvzxfiYVUVrh7t9nco89QZ2uqD11XdTf7H/ZsvUJgKAFepTPfWHUL62xSH0eT0xhS+ZEYRWUosX5FKU3X01In/g5232rkX5qS182UrYlfn+/7fAWcqnZ4hLaHNKZuMGN/SXY5q26Qf/mR6BsJL1ZVrEKVHR/Cmxs8flzNB8QXiQgKIEH0qPelGEbuffCitKq
X-Microsoft-Antispam-PRVS: <MWHPR0101MB2942D668426B7546A39790F9ABFD0@MWHPR0101MB2942.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(3231101)(2400082)(944501161)(10201501046)(6041288)(20161123562045)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(6072148)(201708071742011);
	SRVR:MWHPR0101MB2942; BCL:0; PCL:0; RULEID:;
	SRVR:MWHPR0101MB2942; 
X-Forefront-PRVS: 0575F81B58
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39840400004)(376002)(39380400002)(346002)(366004)(396003)(199004)(189003)(48376002)(316002)(25786009)(6666003)(6916009)(36756003)(16586007)(5660300001)(53936002)(26005)(50466002)(106356001)(50226002)(81166006)(8936002)(54906003)(4326008)(16526019)(81156014)(186003)(8676002)(59450400001)(1857600001)(386003)(6486002)(2906002)(6116002)(105586002)(39060400002)(1076002)(305945005)(7696005)(52116002)(97736004)(51416003)(7736002)(66066001)(107886003)(3846002)(2361001)(47776003)(68736007)(2351001)(86362001)(478600001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0101MB2942;
	H:columbia.corp.xevo.com; FPR:; SPF:None; PTR:InfoNoRecords; A:1;
	MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR0101MB2942;
	23:EykorgRIFJbx95uiB3j3zoYDwsYQkqz03gllR9M?=
	=?us-ascii?Q?ZVao2Ky19+U/K9u7e6EYiHO4svfdsNGku3ghWEzo2HB8I1pNdBhAkVLqKHs4?=
	=?us-ascii?Q?AJAJ774vcj0vhAyHbFwjd8HCqRseOtcs6vOWFraC5XFif5WqFLuelu8k7SyY?=
	=?us-ascii?Q?SnYeuYxPYzixuR/HeK9o7vjbsmDshh0mlMDNpo7XWO2YiaTnS/FzQqI3zxDo?=
	=?us-ascii?Q?HsPWLIH05xExhhXCFPQHojLl5Wdo1/p6WHwFTnmlNgcOVej/NIxQ4LIgnFuK?=
	=?us-ascii?Q?Y9UQFjkW8Haj8ffbf1aAPvUOvTFlkWQhUghOUunyrb/EoOi5DoWl9T/goVKx?=
	=?us-ascii?Q?1TtpoY6z+UeEafGgZ/uo5QbzBueiNvexk1M47I6Zw75tO/v8zT60HKhx/eMu?=
	=?us-ascii?Q?K2cT6TVMcU10GEqlF/y/X9qgvP/AwJPxyvP0JH4SRuFD2VCgMQ7HJ5IFP9y2?=
	=?us-ascii?Q?D5P8TXvmytZLLIdZHkr40L8PPeu+kewr2aF35B2v9yfDFR4GhKWxAYM0lHAZ?=
	=?us-ascii?Q?V300WisviBosfkvCfyQRTJakNGhHQZASWLH96ux9Jz9ranAhqUYQfyY/kzFB?=
	=?us-ascii?Q?K2mXS4vNo8bUj8Nh8uMANM0/HFNH+CUIy09taSn8M7IshzT7TCSK1WBksKB/?=
	=?us-ascii?Q?tss7rbvfzM4vh10LL/ktMsx+sO24wT1PnxOlkcoGiRRDo1Zkmj7DZIFd8irE?=
	=?us-ascii?Q?yK2SLogMecHjZ2ftG3NPyxeuZEGx7R6mlrcDhzxof6Rg+wBZScvMGG07iQAH?=
	=?us-ascii?Q?IdDCzlIZnYIbEqsA0CuDH4NT2xMeRwDMwRdVLLGDM8SI4sNBkKbD63muAYds?=
	=?us-ascii?Q?UlE4+wAtbDV8pL7BaEE+XDtt+depeFe2AxNOa2+WfYEeG9bKIHfO5FFFF70u?=
	=?us-ascii?Q?TBzLa7auqJmX60+CD3Ats51WVPoGfmtfOTkUgUeafFZ68bJLtATARAhwb3Yo?=
	=?us-ascii?Q?SXDEpK1p7BPCButNhnNRvtsJPn4qVpDdZuSQ0RH0+Shas6KRtNj3U4Xerv1H?=
	=?us-ascii?Q?9DmiWNzVn5mVeb/Hpkw2EhjXMAf8CqoEAw3+VNYm3iI8Z5GoNhfE+56gypeR?=
	=?us-ascii?Q?pCVEzPoU5bell6aFmH9Hx1eUvdmOgX+DA9TxoXj+BLP8kNK7r9PuGK6E4ZmT?=
	=?us-ascii?Q?5GFD5oGVtciUTYTskVWqUyyOhP2mHamQ4ptpOqQKOY/jDKoWNVbt6jdfgic5?=
	=?us-ascii?Q?ACivElsLtIViJMfSfLbDVZqbFTqen0XCiHC1W?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2942;
	6:Ea3quOlXkew7BMIS9d3HELiACTxVLE5v2/1UCrf5YBPjeLhp3gS7I4zMXTYPN0W5unHnNJ/oAbxj2Bdz7tr4haly2x6T2sPIo90CrWYCAdvaM0c/EOeXZGDAWi8HAlWNzAT6Yx7UIYVyO7NqBklUQPca1LSadYLWRQpE84VJuZlKH8Qt47ngqX9oQJ8FuDM2FHKsHDo34vW/fSNTiiKihnRMn0eytiWMAuzGd2NYQr5ZYW8V2PVfqup/kFXwq69lsRa/6FvY9Hm1BrhRutNyzlU3Hau5DdADKtGFysI5AxXDeiDc/+m2fLLWt7ityRYsSOzzgk0SxLUOmTJ9fQQzYmzO24poRVPK2DDeU2mIPQI=;
	5:FPhPGLCJs53pjHeFNAcW9VCIEuc2KHDxuVaOfLMUZ/LElCB3k2ezl9EFTQBHw3C8V1riA2oqj2vxCjfJHSyPwxNMij30uBDef2Mnru4UminVsli+B6muLV7j3+Bu5c/sZEf26vNfdEGU10hIYUJ63rgUXSnRxhl/vABCgUfJ4uM=;
	24:0EZmujDR5Vz2WZHqzzwrBnHOGVKjnPeDvde+MsfzqpC4JohBptjVn4xywc1IFPqrBm8P/VtgckJ8TlVRZ+EyP0lcLnKWX8lIoGgWVZreZoU=;
	7:DYW3fISgj/zFWmnWozeVpADdAWX3iyaLmM52QwzISj9G2Z/8+Jv2tkqjAWHyjJDGWg62HpgiXI68hvATru+ndeeDhO4J/jLGryyd0YSJPnyR7/+uqrqau+OsmrEp3rX+LncWIMvj/lv+gbkZ91hn9Hnbt2bYNpVAD5zChob/PZIldxFwXHQshx0Q8AEEU0xDp3ELBadMrjPHu3/Wu2HSaJ3y1wvjZhTCr5qW97PWTfnOnW5ALM8U8DiAEGq8i9wW
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2018 19:28:02.1686 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 699d2104-8a5f-4c01-8d3a-08d56d97bd0c
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2942
Subject: [meta-python][pyro][PATCH] python-cython: mangle scripts to use /usr/bin/env python
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
X-List-Received-Date: Tue, 06 Feb 2018 21:01:34 -0000
Content-Type: text/plain

From: "S. Lockwood-Childs" <sjl@vctlabs.com>

This prevents runtime failure "bad interpreter: No such file or directory"
from running native cython when the native python is installed
at a long path, exceeding the 128-character limit for shebang lines
on linux. Exceeding the limit was already possible when using a long
path for topdir, but it got easier to exceed after the switch to per-recipe
sysroots.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-python/recipes-devtools/python/python-cython.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
index 1ecdcc9fd..da39d14c0 100644
--- a/meta-python/recipes-devtools/python/python-cython.inc
+++ b/meta-python/recipes-devtools/python/python-cython.inc
@@ -17,3 +17,10 @@ RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-shell \
 "
+
+do_install_append() {
+	# Make sure we use /usr/bin/env python
+	for PYTHSCRIPT in `grep -rIl '^#!.*python' ${D}`; do
+		sed -i -e '1s|^#!.*|#!/usr/bin/env ${PYTHON_PN}|' $PYTHSCRIPT
+	done
+}
-- 
2.11.0


