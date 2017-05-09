Return-Path: <martin.sjobeck@multiq.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0103.outbound.protection.outlook.com [104.47.2.103])
	by mail.openembedded.org (Postfix) with ESMTP id 99CFE719E7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 May 2017 17:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=multiqse.onmicrosoft.com; s=selector1-multiq-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=2rMhWcPy5TabbpfbSzuuG0mAzL6KO0848OfmDgirm8M=;
	b=PwLFvWjLNAqa5oVEKIxfIKu9r9K5m343Yn2p/0nz0JCJWHg4dnlfZFDZ8ejvx+OTf/vTxpKnMLMulgmr6mmJppopRa1bFefsFGbcGRb2TnDXYhB8KbLuiX6sw4jPYXDjkeXGyzXD5wfXVkIAVgE9Li8TOpb9PvxpGZjmflGwwvI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=multiq.com;
Received: from localhost.localdomain (81.234.194.205) by
	HE1PR0501MB2010.eurprd05.prod.outlook.com (10.167.245.140) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1075.11;
	Tue, 9 May 2017 16:56:32 +0000
From: =?UTF-8?q?Martin=20Sj=C3=B6beck?= <martin.sjobeck@multiq.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 May 2017 18:56:14 +0200
Message-ID: <20170509165614.22916-1-martin.sjobeck@multiq.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [81.234.194.205]
X-ClientProxiedBy: VI1PR0802CA0005.eurprd08.prod.outlook.com (10.172.253.143)
	To HE1PR0501MB2010.eurprd05.prod.outlook.com
	(10.167.245.140)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9084f2d-c7e4-48e9-e4ce-08d496fc5876
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:HE1PR0501MB2010; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0501MB2010;
	3:Si/xDbarrUjwEun5EeYQqyaQNG82nIXh55VKqn6vo0gI47EIcV2YDnAwMJD+3Kh+CLQwabtm4XdSzBIeDmw2I/rkJiX3YZvdR7TojeXs7E6EpKIT6cbSbNrScST20zBBDbd/16LwcvGFtSQBRuv8uB81+9ddTj6VkwWl0PYpWqKtbTPFuDlPoyR1AU49ZcMLDKqHrauKBBuAL7mVbpjfuc6i5RqzAJavJJ2qK5Xd+KQH3KEytsVhdysn2JPn3NB8GiKy1lufNoEYZDfKZAPOEukuQqJotUufZ1RI0/PbfgsvLXFCzKycojkqmi6q+sey8Fd4yJQHof0SJVprigsUZg==;
	25:zVrfTUTwKFXiTp23voOfYtJFQ/MXDM1H7bOJKdkda+8wPf3XUZdPms9mr1mLCEwGRb3JSvE9YGW7V1LEycxbWKXdSlG+0cafR1MRKcqEU5EMh3qbCsh3kFD6OF+nKzqE+tEPFNy5r613CCiuKVRNAhD+QYznubxuG5qniEoSRVjEdKCm56SMATM18TdTL2/2c7jW1rnAMZU4VcDDjztEx6dP3b80L9ZgufqA3hzYwIn5Y6US5s7KksZwD/eQJE0m0mf6tfiCQ8YQQHWpaJFXZYO8C6fQeGnZWll5fdOWf5Ryje1So95JjTZ9mblNa/vpPEg377QfRo8e7fobGrql9WT5CesyH8Ii1dwb6qwcvA0nAgfWEwWWHLl3qo+wcEsjloIosEenLfJQdObwbBf/o2s6CTwbVNBxtNIMQ/gtEcxHYhxQOki4nJmka1fxEn9Ekv8APRntmgmb/xA/zC9Ee6XeAiwAIExLxgbzwUUb2FY=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0501MB2010;
	31:xyTIYoI7w1wmeIW3lPxKK6OHcDfH83j92slBvH8N7ioN4f+AM/cfQMkbaSl1ID8esZ6g8xjt4LvUbuvMUWoxHees6dlrahfZJR9nCqCix7aSpeOYqA1M4W/nsAe8yehRTQD6JBU1uuga9DfjMdutlROYxaSl7CR4wubYOhsYJOgByqH9zpPWZDnwl/Neva9Lgo49PlWZQOP8xGuYe5/oMW5yNDn8+ZxyaQ5DGYra3r+gCW2CvVzfOMlkMIoKkP+n;
	20:QsrznfuPuZsPGItN+c/uLbyRwk2uIdVv6nkjUNnjNsjEI1AijSo8rdbtbfk1zSLed5+pcZ5h3figr2VtIRUmO8YTu320o2DQ67z80r4QRt5cUKvHk58rz9ZXVS2U1xF2+tXo4uJEnDMbeUsyNGAltQRsHRBCvno5xT/Ekmk0H2a46hyDCnlLVZ2LZfB+d1R8c9eqC6uGkDDW9fLWxWsionmpESmh9LVZXLL0mwk8a9C4sZV2eKJPNMwIjMTbImoSIMSsrZsOKGOmsRpIA24q+uoPuOMPkITsz3sgDnXKunI9s1wEQSmKroZ1zYbY42ir0t+LXypKnvPJvjOo5QpRZQ==
X-Microsoft-Antispam-PRVS: <HE1PR0501MB20105E69BC71705CF0A85E3DF7EF0@HE1PR0501MB2010.eurprd05.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(6041248)(20161123558100)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123560025)(20161123555025)(6072148);
	SRVR:HE1PR0501MB2010; BCL:0; PCL:0; RULEID:;
	SRVR:HE1PR0501MB2010; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0501MB2010;
	4:QLdZY+qE8ErSF78mUZGfma3cJ5QQGiWS0GQUNrg5S7AVrDYMnXxM+6c+C1zvd1kEvB41ouWu7Xk0LewqG7dObzAeThlGPcqR8TqItIyyzwK98BEIhBceWZE0nK+T+T5TG1h9kr2CjSb/KDHAfLeiBQE364WRc09OT3gaE5q63tvT+di96uFPdVt2SyV+akV6o+iEp7jHij4zxdzOmplHcQ207BEWxJsFybrgM3Zo2o4OysOqUjlVcDHzcwanxHlogIJHB2pFoemIKEv0K9Z4xnsqTMWoghJiuEMjBRbLD4EXbzu9uTmQlEr1K0SgWNlas5OrUeHpi+zIJiBz4da1kTXJmFGwQg51m8tvOljHqvLymc1jy+sq/XgOzd9vJxN4ZU7LnVnBB1+LbqlDkVXqr8KSntkffh1jpxkiCIRmwDlejdh1QDXhfdGAUnDqsvpX0xWtO5aR0ekYGqXV2REOGmUxVAGu6645QuTciY0NsiDcPASwEgbdA4PO1h9G2aCA3dUbLns5Iek4H/+HlrtWkNM3VrMwCx5xfbez7l3XCPHlf6g0jJH+4n9al4yMRxpH17g6wDR9+u6Ld028Vw2SLgMAcjF21JDzUQWk+sVcv3lzojWI7dam3nkX7ALCzL349l2dRkV++5ZJKdVmpfI3Jj9LwluQgob2M+8+QBHNus6F9Vb20UXCoDs0o15W+DrDp6ZsYHpolteub4DrkYlspiryWBBTzP67VHIddJxDFICzaSAFtOlhr0vitbV7SFxbe0MXk7rWDfTV9plUJaAZaVr3FMZjxv8W3ktMd9ysnSU=
X-Forefront-PRVS: 0302D4F392
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6069001)(6009001)(39830400002)(39410400002)(39400400002)(39450400003)(377424004)(5660300001)(8676002)(50466002)(33646002)(42186005)(6306002)(38730400002)(53936002)(478600001)(47776003)(6512007)(966004)(50986999)(107886003)(50226002)(81166006)(6666003)(6916009)(110136004)(23676002)(2906002)(66066001)(2870700001)(86362001)(575784001)(2351001)(305945005)(6486002)(7736002)(36756003)(3846002)(5820100001)(6116002)(1076002)(4326008)(189998001)(25786009)(6506006)(129583001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0501MB2010;
	H:localhost.localdomain; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtIRTFQUjA1MDFNQjIwMTA7MjM6TjhlYWFtK1NnMjZvUWZXY3NuNVd5VlRz?=
	=?utf-8?B?MU9kaW9XYlpIa3V3WXNiTnRXWWs2MUVvQk9HMkQ5NVFFQ0FUSXZUdEVqQ3BS?=
	=?utf-8?B?ck9rdThEdy9lWTY1bHlGV1hHaVJCaFArY3pXWjhnTGMyWG9qanAzcy9icVFQ?=
	=?utf-8?B?ZFV2aDZCZFkvOWpPeG9VcEJuT0lwaXNxaWM3Zlc2eDBGMzUzbDZzNzVXb2NX?=
	=?utf-8?B?YU9ERmFuVDhZYUNiTUt3bzdNU0p6eGZwem9Ea0RyWllXQkJLOXNmNGNLLzNQ?=
	=?utf-8?B?NXRlWVNESU5kUzlrNTRpd1pGM1VTckdhOTVhcUsxU3pGcUNlbWtVemVaZE5S?=
	=?utf-8?B?NXloTVNsb0JRMW0rcDhHdktiWG5QVDdnMFZQSkM5amcrUmFLRTliamxnakNY?=
	=?utf-8?B?bFVRdXNQTThQbzR6WUo4ZWVLVmVobmVvRVpKdmp5QUpBVy9uMTJGMjF3RXVj?=
	=?utf-8?B?Mk1xeHA1OCtueFU0VmVvcVpXbHlPV0lsUmVFSHBoTXJmN0x3M1pvN01ibjJB?=
	=?utf-8?B?U3dKWDRvNXdJUFFIbG1yc3dnNzlLaStPMUxqUHgwcDZLdzVtOWdMakZrWjdx?=
	=?utf-8?B?Wkw5WHZPNHdnUHlncHdiYW90ODdrb2tqMDNkTGxLMjByZ1hkbmlib2t5ZGs2?=
	=?utf-8?B?bENpU1Q0RVFRc2lMc1pQOWxITDd6R2tOSjRxUzR0ektlMWp4WHFUemRrNlEz?=
	=?utf-8?B?K3RMTnlOa210MU1ZTVNjTnJSMGNydEFpUUVTTGVGK05yRThhcW5OQWEvZjhS?=
	=?utf-8?B?bFVta0I3OGNLYWRpNzdGVTViQmN5aXhjQTl5MldhTDFnc1RTQzVVc2RZRWVP?=
	=?utf-8?B?eVZQaldBbllEcE9ha1djUElKWXlZZm1BVHB4VDZ1cW9ueXpFaDROb0FMdzMv?=
	=?utf-8?B?Y1pNWUhkcUE2eFBicFFPN2NLenFrd3c4R3VyRjBPaTJvU3h3SGsxc3YxQVN1?=
	=?utf-8?B?NndBWVljKzJ5d3hSRFpMZnRtc2dSbnlpRWZlcjZhNjRtNm1FTDlzRFY4WC9h?=
	=?utf-8?B?YW9hOTJwZlVGaWN6YkI3QWpob3N4MTRvV0VxdytXUCswVFVSMDRYbFBad2pv?=
	=?utf-8?B?WTZFbXdhY0dTRUtGUmYwWVoxcFZPemF4SFd5MGVTOEUzYjB0S1hxNXBFSkcr?=
	=?utf-8?B?RjROWjJuVSsxdGlTTk5MRkVxOEJRanpNYU5STVVOS21ycys1eU14VStsR3U1?=
	=?utf-8?B?Z1d4Q3pWWk14QXpWY1p1cjF0NkdDVFFkZzV4bnh0aHBMNHZOKzd4Z1NRck9i?=
	=?utf-8?B?MWRJQ0JBemxsZkZxdjZSNFcvZWZTejNtZVY0aEVkVGdrRm9zZUM0cmJCblBD?=
	=?utf-8?B?YnB2UU1rbFBGV1Z1RC9zRmtaQTM5RXdxYjI5b0hMSW91c0tHRjF2Y2pmTElR?=
	=?utf-8?B?WDQxQWp5MDVDaGdCODRQa3FnSEozRHNGdm5UWGxjUnVkRU5BVmFlOGU5M1c3?=
	=?utf-8?B?dWJuSUVPa1RaM3h5MGJOUmtXQk0yeWFBSFM0MnBBeXF4RW15WU5PNTB3cW1C?=
	=?utf-8?B?Zm9PbkJpZWN4ZVE4VVAxcW1oZCswdHpkcERXYVJ1eFRqTTFFbDI2MDB0d0F4?=
	=?utf-8?B?cTNwTUpxM1dCeUwyRm1raHBtWVVQYUpPZz09?=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0501MB2010;
	6:sivPeVMuL9L6Qbe6cUY65bNRxf7eY0AnZGP6kASVZqYNZdRLhsmWH+AMuXo8ubzZf3BBNkr5yFFHBSyAV13zEmYV7k2Z5PaQIrHWmHFixCISTRrF+V+j15TTTBa5N/gbW4eYAqNHEP5uRuLwNboQ0tr3rHachm0BQykmsaraloXGhh05z3yr6NCySLZBdlKE+0C5uIat5wcnFT2Hdw24vQUPeknpd7s7LtIkcmKSJ8PoHyFCPPbeX0aFKDmQnLwG5xjXcz7kbbMGG1yg7Kj67+DpfiO4LMCKo4ppWQhAq9GCF37cd+vfKeO0GdauFbg2JYUaXe2x/uQR8l/8Gu1amLG5hdc2ZLB4tVqXVymV5JuC5fCy/qCTnshVDblTI1DBXw9VXkKkoC9fpDH2Vy6SygtVtxi7ntQwG4uwWathZCBYxbEXzA4XPBBVrwQ7UF2Y4Ec6Plk9LWYyTJBxSJ4twfhyqumYo6gmVITU99WnxJ8g8et9Q4De98gVXnynx1tkmmRWwI/xKfp4lBsGBD58Yw==;
	5:TWCXU07jepFDM0JpsmuZc9CkrpjSk+tYNQxBQ2mnwU60ZhT3Zv6ZxooJPIYuBL8hJDR9HOGFGdax9LDoayyjaJqLL3uAT4dlgEzdig51ZAJC2n5i0ielPsVtULyHQLuFdKKE5RnCDOOGD5fO8ObCSw==;
	24:dE2mats8sANSXOIv9viAW8O4hOCFPMEYbxNZ115Hlf5r4RfvsSFHXy5Smy8FzdjVooYmLiP3eSrhbEnY/lVNvac6lTuH7tz+5KQ+kzA1KqU=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0501MB2010;
	7:xbBkI4DBzLQlb0wwUvN4+ghFccshDm/l7ebXGiTYZSh4QMWPtyg97s3d5zd+XmAhcPEWxEBI75sMfJUfMlhWOURQAcugSFtgucAvpPtOgbKyNMxibn6oQRz9cONFLROLt47HPKMuIgaaxwXWRAiaMA5R5bCNYPBFx6SHB9xfJ0B62GYdKwXaFPrrwPlcuL8r71h/z90yjsg+3LUlVE3YKVBBTfRQqppeBwm4aBF4kM3ZGgXpwpaJuPyKpHiVdFW4KxdgkeI6FXpsqlFPcfAlCEegKRlmRfrkbh2o1HHPSaqayNBxebfVhGZ2xX2wCCIg09xFmcCVf47tuupBFl7C3w==
X-OriginatorOrg: multiq.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2017 16:56:32.2981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0501MB2010
Subject: [meta-oe][PATCH] Removed blacklist for wvstream
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
X-List-Received-Date: Tue, 09 May 2017 17:11:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Added patch to make wvstream compile with gcc

Signed-off-by: Martin Sjöbeck <martin.sjobeck@multiq.com>
---
 meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb               | 1 -
 .../recipes-connectivity/wvdial/wvstreams/gcc6-compilefix.patch  | 9 +++++++++
 meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb           | 3 +--
 3 files changed, 10 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/gcc6-compilefix.patch

diff --git a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
index 80e72bd8b..47fbf0ac8 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
@@ -29,4 +29,3 @@ do_install() {
     oe_runmake prefix=${D}/usr PPPDIR=${D}/etc/ppp/peers install
 }
 
-PNBLACKLIST[wvdial] ?= "Depends on broken wvstreams - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/gcc6-compilefix.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/gcc6-compilefix.patch
new file mode 100644
index 000000000..87dca49c5
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/gcc6-compilefix.patch
@@ -0,0 +1,9 @@
+--- a/wvrules.mk 2017-01-11 09:53:36.764897285 +0100
++++ b/wvrules.mk 2017-01-11 09:56:24.227454405 +0100
+@@ -83,7 +83,7 @@
+ INCFLAGS=$(addprefix -I,$(WVSTREAMS_INC) $(XPATH))
+ CPPFLAGS+=$(INCFLAGS) \
+-	-D_BSD_SOURCE -D_GNU_SOURCE $(OSDEFINE) \
++	-D_BSD_SOURCE -D_DEFAULT_SOURCE -D_GNU_SOURCE -std=gnu++98 $(OSDEFINE) \
+ 	-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 \
+ 	-DUNSTABLE
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index fe79dc1ad..cc0023a7b 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz \
            file://05_gcc.diff \
            file://06_gcc-4.7.diff \
            file://07_buildflags.diff \
+           file://gcc6-compilefix.patch \
           "
 
 SRC_URI[md5sum] = "2760dac31a43d452a19a3147bfde571c"
@@ -47,5 +48,3 @@ FILES_libwvstreams-extras-dbg = "${libdir}/.debug/libwvbase.so.* ${libdir}/.debu
 FILES_${PN}-valgrind = "${libdir}/valgrind/wvstreams.supp"
 RDEPENDS_${PN} += "perl"
 
-# http://errors.yoctoproject.org/Errors/Details/68614/
-PNBLACKLIST[wvstreams] ?= "BROKEN: fails to build with gcc-6 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.11.0


