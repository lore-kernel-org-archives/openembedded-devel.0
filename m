Return-Path: <soren.brinkmann@xilinx.com>
X-Greylist: delayed 8306 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 25 Aug 2015 05:14:43 UTC
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0055.outbound.protection.outlook.com [65.55.169.55])
	by mail.openembedded.org (Postfix) with ESMTP id 60CDD73E11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 05:14:43 +0000 (UTC)
Received: from BN1BFFO11FD004.protection.gbl (10.58.144.32) by
	BN1BFFO11HUB055.protection.gbl (10.58.144.202) with Microsoft SMTP
	Server (TLS) id 15.1.249.14; Tue, 25 Aug 2015 02:42:10 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BN1BFFO11FD004.mail.protection.outlook.com (10.58.144.67) with
	Microsoft SMTP Server (TLS) id 15.1.249.14 via Frontend Transport;
	Tue, 25 Aug 2015 02:42:10 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:35677
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>) id 1ZU4Bd-0008BF-Jj
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Aug 2015 19:42:09 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>) id 1ZU4Bd-0001sD-F4
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Aug 2015 19:42:09 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	t7P2fZba026677; Mon, 24 Aug 2015 19:41:35 -0700
Received: from [172.19.74.49] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1ZU4BY-0001rN-QT; Mon, 24 Aug 2015 19:42:04 -0700
From: Soren Brinkmann <soren.brinkmann@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Aug 2015 19:41:54 -0700
Message-ID: <1440470514-26608-1-git-send-email-soren.brinkmann@xilinx.com>
X-Mailer: git-send-email 2.5.0.3.g52d66ab
MIME-Version: 1.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-21766.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD004;
	1:kSrakOMVfnZ1FAw8IwPL+8UrL9jFkOL+Z5hZM8RukZ/0g2VC6BI3SEjlJKb7M8Bpp9kjc2D5meiWG5jQbTdaeRpY8BBHi+HX5lLA3eFRwNMU7Eke1nUrnQPm7MiaVGG6UqsguGlrIC33/r+cE2PQ0lypw0pH/EbKh0L0ZDUOLams/yeQHBZhTvI/Nk+p11dK/w/c1OtFOym5LF87aNpYhYLFr0UvaVBjE8cdY8TYbxHkYr1rJFPZ6W+31ah0Z8VMSBvc555S9s99vE4Fh1/y7WZH/EDhJmv9GZ6K2rsg8lOZoGOhZ0k6GW+lWzboErmIJeFvRVkKUeKhuaeE0ieuYw==
X-Forefront-Antispam-Report: CIP:149.199.60.100; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(438002)(3050300001)(164054003)(199003)(189002)(2351001)(110136002)(36386004)(62966003)(33646002)(87936001)(50226001)(86362001)(77096005)(106466001)(229853001)(5820100001)(92566002)(450100001)(15975445007)(5007970100001)(77156002)(63266004)(19580405001)(64706001)(19580395003)(57986006)(23676002)(5001960100002)(107886002)(76506005)(36756003)(46102003)(189998001)(47776003)(4001540100001)(50466002)(81156007)(5001830100001)(50986999)(6806004)(5001860100001)(107986001)(5001870100001)(4001430100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1BFFO11HUB055;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; A:1; MX:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11HUB055;
	2:06U+fkWdicWojH/lqJD2+4e08jodun47vVVZBvyEvVTP11OGdAPlsen1FnnYtk1ldfUF0ccQxC3o3m8C9UXghqgkegMBx8GZ9kny81PgkdDGghDSroIIZl9ePH9iygq7xLnawkQn4HXvSbhEcNY9hzpJcyAC/C+1/0vHmdDG14c=;
	3:HMACMck8tNaBzWvVhOFV10VBkvWwx84/poXc4mIy6cr5qJJhCq0/MQIFHXmg2xi8DNEUQVSNiahCI6Ec3oJl5TKYks+QDFig87fuKRpvYFbso8a4oF6MkHgnXMTebDDyJY1wKf/9JGvCblMDDG95Rmba84lPBsV2Ob5xEH6CEzt8aIfQLz1joxsBht9s0jwFKQnEqunFpSYtI/lsb2UwWI1cnI57sCLRTBovd83hln06Sd6vN9+H+jVjj1913eGj;
	25:NJuDtr0GdGt+m/rmfonozIQlh2cfHAX2+N29W6Pn7/hneLC01XL9FnLk6Mq2MI0uGoh9KSJ2fEkO9mRqVDT2x9AjeiTtc8hIJOtsTz0ucsJQWK1mvtLuh7S9x61KidBNNVCUqLC+qsndB0Xa4ZEoSJjRsVR4tf9aaRNHekWSposP8qO/sr9zwgLjdPECmz6lslFcdK4KqNkKw+nLJUrYUxW/z90u/dr8ugzZZO+ruJ5lbvMlYP27YpzeQ7JYEDGN2m7+XJhFQ+ZJo7RpDmPYkg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN1BFFO11HUB055;
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11HUB055;
	20:UMREcb1j1+/6WoGwXJiDRn5Lnsf23rkjKJLxNu48W2TQ39QUyarYyqjBInY6tlGvlLxDXqBVdB/yoro+CdXactTiob8oALBeMO8knYPTjtz1HjMbHEbrMDwo9uXNekQlRt7ikBRc1gK8FRVlXL+YxTqjMQMXoxLizueFdDGEqHBmDY3/9bzZ4O4UnUBm0GQkyyEbI+gLpThOi8b47Wn8qW2q8+dKSvc23LAEPpitvnMSHLKEunMJVlqICX0ijHFZUAWkXu8AfLUsnRv5lo+x+gYRa3bfF0ZIepoOtXcwlS1okDxyAYT8fkUKI5I5KUFx0aU8RhvJN5wRtz3Ch7UQG0tyBg/tnn75f3QWImWncMUhB1vh29JYKR9EEp20SuglimYdmaqXf5RxbvH6/E2mvjR6Hs5kAG/Sy8hYe9BeLqXn55fBtvWfpZ1h3TfJ+rmeIR8HI5uBMjelxp8O/x13+q9Ez5PWx9aiFobfFFvoKBZv2FaX3ukvDnt4IB5wDb9U;
	4:xmyhlkLQz1yddWEqxdQ8ivYj5xqIM+nk7DsNkHeBiq5U5+/3g76Bp1Or6n7qTU6/AEqXJAgex+nUElJGCPXhMSIqUGEgesjRKkwJvA6oQBwkN2clq/DSfVwSExAnU047tBCfeRJ1qiTrAtZZOED25AZnJ+N/EoozMG+6QygiTgatnI+tfn0OfSdUNLB2E6JDvImpYAKAEadgkboXzddvodV2rEeF5xvEmqWWqEf/cHqlMq4Rvx4qAv+Uo8LbXCwMh1XcXaVKRXqzkyWum9Ug0LWTA5cE0uSl402fs9sHkjuEg7lNHiiuLpOCD/WQDSTS
X-Microsoft-Antispam-PRVS: <BN1BFFO11HUB05528DD851C5917FAD100628C610@BN1BFFO11HUB055.protection.gbl>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(8121501046)(3002001);
	SRVR:BN1BFFO11HUB055; BCL:0; PCL:0; RULEID:;
	SRVR:BN1BFFO11HUB055; 
X-Forefront-PRVS: 06793E740F
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjFCRkZPMTFIVUIwNTU7MjM6azRNcTBzZ3d3T2ZKZERpMS9vZk1KMi9y?=
	=?utf-8?B?a3ZzdXFzZlJXVWJyRFZpSEpaVGRsNnUyVmlCQjNNSkZCQWc5cTdINWwvMjdK?=
	=?utf-8?B?dDlicldmMEk1eTd4MVQrNEVEN1FNZHRzdnBTYU9xOHhzcUpEcnllU3pneHlt?=
	=?utf-8?B?bkRVeEJsUjAzbFZSV3RGYUxReFNTclIxRWxPV2ZXQjhUcENBTWtvaDhsRUVQ?=
	=?utf-8?B?TFI3ZC9kekJZbktGWFJmVHh5c2hyZ1lybGo1alZZSGJsbmg2VEdFV25EWVVx?=
	=?utf-8?B?NmhIN2VFRmN1UHpWYmZ3dVJMc0ZGcEVxSXI5VlZ1WkkrczBFMUdnRTJ3amhu?=
	=?utf-8?B?Z0lsdURIQmswS1pDRTZVZFNZeUw3cjduUTJJb3JTYjZ3K3phSU9zMGczdzRx?=
	=?utf-8?B?WWxhcXM2ckZJcnVXbWM3cWU1eVU2QnREaFROSHBETjFxZEtxNTVNeFpEME8v?=
	=?utf-8?B?NmVnR01vdUZCRDh6aC9kMFY1R05jeWx6a2hDUVZiczd6bTY0a01uTDJMZDV3?=
	=?utf-8?B?Nzd6ODR5akNCYWFFU1BlamU1d01EVm1UL1pxbU5NUGY0VmR3MFFvdHEzWTEw?=
	=?utf-8?B?Nkc3Q0FsQ2tUc1NaUDhHakdaS3FMZ3VUVTdoWEUwdDYxM3VGeUJqOVRZUlFJ?=
	=?utf-8?B?TGNLS1RhNVlxNVQ4ZEw2UlF2cXJQaVppTUx5TmxTV0xrcThTYWZKZnNwN2hs?=
	=?utf-8?B?Z3lHREREbHkrdk5sWlJTNEJrY2hLOEJJd1BMQnhRQWRsbFNQMFdoYWRjUnd3?=
	=?utf-8?B?WFllV2t0MHJzQmo0c3FTV1JLNWhPalZieWVqVU0rN2RoYmVNaXUzUE45SEdQ?=
	=?utf-8?B?NzZGM2VmeW9odXAycldqdnA5a1A1cERiU0pWS0hkb2J5dkNkZ1RiYVlqMUwz?=
	=?utf-8?B?a0txUHBQRFpaVEd4NGg4d3BuQ0d0dGNzcXRDODRZZjcxa3IyQUlNZlVTYUJv?=
	=?utf-8?B?Q0J4VWM5SURXRlZMYUxuR0dHclB6dm4zSFlMZjB6TFR3cEdweGlpTWN5eEk2?=
	=?utf-8?B?SXRpYnBMakZTN09pRmwxQ0VWQ2FSb2o1ckE3Vkp0TUw0cFA0bWxKTXl5RGd0?=
	=?utf-8?B?aVBGY1RSei9aWU5mb0hOY01keHU4VmdyQStrMTVqcXRiQnpHN3dIRU42RTV5?=
	=?utf-8?B?S1ZGVUNuTXpzRmhNeWE0dUlEamx6cHVVZ0tya3Zmc2pUeHVwNUNxVjFBYnJ5?=
	=?utf-8?B?aFpxcERDMmI0dFQwL3BtYVptNzEyazJEQ0xvTmxnb2pSS2M4b0tZWnBHTVFW?=
	=?utf-8?B?RFhBSWYxRE92YWdkWmRURXJMeFdGcGZhWVJMdlNEV0xSemo1MnBBMktSakkw?=
	=?utf-8?B?UW9qSy8zNHVRTllydGZndTZ6NnhjNk5BQmpDckUzalBobFU5THFsK0owaTIw?=
	=?utf-8?B?S1pvMGdhY251WlZURnFtc2E1cVBWRHV5TFBMNkIvM1M2d0tUOWN4OGtBUldp?=
	=?utf-8?B?NE5HN2xUMjlwbkxhZE9ielJhM1dZUXR6eTZjUW94SHBLdytEbzk3REVOMHRB?=
	=?utf-8?B?WWluR05VSHhoVEhENWs2U0ZIc1dDTTBLTnFKVCtIczluanZ6WHNPR2hIMFFu?=
	=?utf-8?B?UHhxYXBzdU85ZVY4TFJwa3BEbjU0WW43SngwQlpaR2ZENTVrLy94UW9DZ1Ru?=
	=?utf-8?B?WG96OGtCbDZzR1A5RW95aXRjOU9YMkk2NGpWUXVBUUplRVM5M1F4ZFpvZTVt?=
	=?utf-8?Q?ueJM9Cwb2tfvy8d9FKTSlVAHwkVPaGatTFfRRwdIj?=
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11HUB055;
	5:1LmxMpKhcR15z7iARLsGPkgx9c3+dg1CR8d1DjiPTQu+iw4LT+lBsCyMtRkJMOHq2JC1JGnZq+tfElNc88IdGWtKfVRcT2+YLqgDOFKC4+QReTpvDqm69XrdIeXKZLvOzENJIcVu6yInskxe1dt6rQ==;
	24:Hk1+HaRVPy7aSlL3gJvqcytc2HpDRJXKx83Rd9CrKLqX1H4wvWabSq2uTyzkhLP5xeVwYjywAgH6mUJ6r2gZ3B0ddIQH95e7l8MYKqk6feQ=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2015 02:42:10.3500 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1BFFO11HUB055
Subject: [meta-oe][PATCH RFC] Add analyze-boot
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
X-List-Received-Date: Tue, 25 Aug 2015 05:14:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
---
Hi,

I saw a demo of the analyze_suspend.py script recently and thought it to be a
nice little utility. Hence, I'd love to have it easily added in my OE flow and
was looking for an appropriate place. I hope, to have found an OK location
with meta-oe/recipes-benchmark?

Apart from the location, the tool does depend a couple of kernel configuration
option. Could anybody provide some resources/guidance on what the best way for
specifying those would be?

	Thanks,
	Sören

 .../analyze-suspend/analyze-suspend_git.bb           | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb

diff --git a/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb b/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
new file mode 100644
index 000000000000..8ec3076ba186
--- /dev/null
+++ b/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Analyze Suspend"
+HOMEPAGE = "https://01.org/suspendresume"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
+
+RDEPENDS_${PN} += "python-core python-datetime python-stringold"
+
+SRCREV = "${AUTOREV}"
+SRC_URI = "git://github.com/01org/suspendresume.git;protocol=https"
+S = "${WORKDIR}/git"
+
+do_install() {
+	install -d -m 0755 ${D}${bindir}
+	install -m 0755 analyze_suspend.py ${D}${bindir}
+
+	install -d -m 0755 ${D}${docdir}/analyze-suspend
+	install -m 0755 README ${D}${docdir}/analyze-suspend
+}
+
+BBCLASSEXTEND = "native"
-- 
2.5.0.3.g52d66ab


