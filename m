Return-Path: <zeming.liu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45671CD5BD5
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 13:47:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20860.1779889663270982272
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 06:47:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DllTB3dh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=960790e01b=zeming.liu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RCxiHU3291447
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 13:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=rqI646kSpjYDTTGL277h
	EHGl5mJMaMSWnF8eATiCco0=; b=DllTB3dhmR35H2zuNiVPaKwV+Gn6i1Wakwul
	Gno/YbL1DEDumzf6CwLG3Kn6UuMpHTNAsqdqKDskebBabMjzv6cHDQL7BJEoBjzl
	f/xRhULVKuJqkKaBeL2sPjcCKYctd+aIcWwG45iQrfto1+7xzXmIQSXAIYYo+25u
	qpnu3XjuiApc7K7mHwn7ANvJAmQAJ0yZR0wgnqH7qa/e+F2hggmrKgA1IBWozC2h
	+CxUTCQwAIGJbKYACNJx07+KVVOR49iFp3xGi7Wtmrm2MyOjppbTlADT8bUb9RRY
	ppW8TUKI+773XPU94Y/Kf3jqXevgoh0df6A8YixGJGGVnpRlgA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb1f06566-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 13:47:41 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 27 May 2026 06:47:40 -0700
Received: from pek-lpgtest20.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 27 May 2026 06:47:39 -0700
From: Zeming LIU <zeming.liu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/1] hunspell: add ptest support
Date: Wed, 27 May 2026 21:47:33 +0800
Message-ID: <20260527134733.2473888-1-zeming.liu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: UwbEhsV3yM-C6KSK4-lin7VWQvAmDPrK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEzNCBTYWx0ZWRfX3sMLMPuR8yJ7
 84GxqWvXOl/07AnMgPBoHjVm+KVj12Uw2A+pPIdyd05GLTFXNlYTQ3g/bIFusB69o3sV9q8FbKN
 s7ECk+5uBH5OXvxbQUgcY6vfl1V+Y8toMkBxijES/I/63HHfM4yPgtOpjAtswHnrdAVhtXj3HR8
 b+R9u9hAqkh5BXxGHzOOTVfh1jzBuOsMZ+cS0dwF1e4WBZDwJEZR6VVYnBIg4VPEVXKloJXcNsh
 cZqRh1kHKjUUx4M7C952Twhfedvzb5nh5GBVQXB8OOxqr4ZaxS4Rt/AefPDuAjQUPylWGiECO79
 qSRWiyYaPyrMSZ64tMAquwc7l3sswvRDk13g1ZQ/QBnbq/VC5ApDsXSehQcyHSct2qBBCeXIwn1
 ab7RS2QxVhxQYzdp/PAKqv3CQ/3DVnXdApbk/vgLb0If2qDqU9HuctLjlLvi9mhCUbZPpJTbbzC
 tcdddzqW/qrF+Pj2U8g==
X-Proofpoint-GUID: UwbEhsV3yM-C6KSK4-lin7VWQvAmDPrK
X-Authority-Analysis: v=2.4 cv=PZXPQChd c=1 sm=1 tr=0 ts=6a16f5fd cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=GDN5FIuFIqrRoJe-mZ8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270134
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 13:47:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127268

Test results:
root@qemux86-64:~# ptest-runner hunspell
START: ptest-runner
2026-05-27T07:06
BEGIN: /usr/lib/hunspell/ptest
PASS: 1463589
PASS: 1463589_utf
PASS: 1592880
PASS: 1695964
PASS: 1706659
PASS: 1748408-1
PASS: 1748408-2
PASS: 1748408-3
PASS: 1748408-4
PASS: 1975530
PASS: 2970240
PASS: 2970242
PASS: 2999225
PASS: IJ
PASS: affixes
PASS: alias
PASS: alias2
PASS: alias3
PASS: allcaps
PASS: allcaps2
PASS: allcaps3
PASS: allcaps_utf
PASS: arabic
PASS: base
PASS: base_utf
PASS: break
PASS: breakdefault
PASS: breakoff
PASS: checkcompoundcase
PASS: checkcompoundcase2
PASS: checkcompoundcaseutf
PASS: checkcompounddup
PASS: checkcompoundpattern
PASS: checkcompoundpattern2
PASS: checkcompoundpattern3
PASS: checkcompoundpattern4
PASS: checkcompoundrep
PASS: checkcompoundrep2
PASS: checkcompoundtriple
PASS: checksharps
PASS: checksharpsutf
PASS: circumfix
PASS: colons_in_words
PASS: complexprefixes
PASS: complexprefixes2
PASS: complexprefixesutf
PASS: compound_wnum_overflow
PASS: compoundaffix
PASS: compoundaffix2
PASS: compoundaffix3
PASS: compoundflag
PASS: compoundforbid
PASS: compoundrule
PASS: compoundrule2
PASS: compoundrule3
PASS: compoundrule4
PASS: compoundrule5
PASS: compoundrule6
PASS: compoundrule7
PASS: compoundrule8
PASS: condition
PASS: condition_utf
PASS: conditionalprefix
PASS: digits_in_words
PASS: dotless_i
PASS: encoding
PASS: flag
PASS: flaglong
PASS: flagnum
PASS: flagutf8
PASS: fogemorpheme
PASS: forbiddenword
PASS: forceucase
PASS: fullstrip
PASS: germancompounding
PASS: germancompoundingold
PASS: gh-hunzip-overflow
PASS: gh1002
PASS: gh1018
PASS: gh1032
PASS: gh1044
PASS: gh1058
PASS: gh1076
PASS: gh1086
PASS: gh1095
PASS: gh646
PASS: hu
PASS: i35725
PASS: i53643
PASS: i54633
PASS: i54980
PASS: i58202
PASS: i68568
PASS: i68568utf
PASS: iconv
PASS: iconv2
PASS: iconv_break_overflow
PASS: ignore
PASS: ignoresug
PASS: ignoreutf
PASS: keepcase
PASS: korean
PASS: limit-multiple-compounding
PASS: map
PASS: maputf
PASS: morph
PASS: needaffix
PASS: needaffix2
PASS: needaffix3
PASS: needaffix4
PASS: needaffix5
PASS: nepali
PASS: ngram_utf_fix
PASS: nosuggest
PASS: oconv
PASS: oconv2
PASS: ofz51432
PASS: ofz5627151457255424
PASS: onlyincompound
PASS: onlyincompound2
PASS: opentaal_cpdpat
PASS: opentaal_cpdpat2
PASS: opentaal_forbiddenword1
PASS: opentaal_forbiddenword2
PASS: opentaal_keepcase
PASS: ph
PASS: ph2
PASS: phone
PASS: rep
PASS: reputf
PASS: right_to_left_mark
PASS: simplifiedtriple
PASS: slash
PASS: sug
PASS: sug2
PASS: sugutf
PASS: timelimit
PASS: utf8
PASS: utf8_bom
PASS: utf8_bom2
PASS: utfcompound
PASS: warn
PASS: wordpair
PASS: zeroaffix
DURATION: 5
END: /usr/lib/hunspell/ptest
2026-05-27T07:06
STOP: ptest-runner

Signed-off-by: Zeming LIU <zeming.liu@windriver.com>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 .../recipes-support/hunspell/files/run-ptest  | 30 +++++++++++++++++++
 .../hunspell/hunspell_1.7.3.bb                | 25 ++++++++++++++--
 3 files changed, 53 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/hunspell/files/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index a9cbaf6982..75b58a7683 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -23,6 +23,7 @@ PTESTS_FAST_META_OE = "\
     function2 \
     fwupd \
     gcab \
+    hunspell \
     imagemagick \
     jemalloc \
     jq \
diff --git a/meta-oe/recipes-support/hunspell/files/run-ptest b/meta-oe/recipes-support/hunspell/files/run-ptest
new file mode 100644
index 0000000000..d2671c9d4e
--- /dev/null
+++ b/meta-oe/recipes-support/hunspell/files/run-ptest
@@ -0,0 +1,30 @@
+#!/bin/bash
+
+cd tests
+
+# skip utf8 non-BMP(Basic Multilingual Plane) 
+SKIP_TESTS="utf8_nonbmp"
+
+tests=$(ls *.dic 2>/dev/null | sed 's/\.dic$//')
+
+if [ -z "$tests" ]; then
+    echo "SKIP: No test files found"
+    exit 0
+fi
+
+for test in $tests; do
+    if echo "$SKIP_TESTS" | grep -qw "$test"; then
+        continue
+    fi
+    
+    if ./test.sh "$test" > /dev/null 2>&1; then
+        echo "PASS: $test"
+    else
+        status=$?
+        if [ $status -eq 3 ]; then
+            echo "SKIP: $test"
+        else
+            echo "FAIL: $test"
+        fi
+    fi
+done
diff --git a/meta-oe/recipes-support/hunspell/hunspell_1.7.3.bb b/meta-oe/recipes-support/hunspell/hunspell_1.7.3.bb
index 94ed985c42..28136ea104 100644
--- a/meta-oe/recipes-support/hunspell/hunspell_1.7.3.bb
+++ b/meta-oe/recipes-support/hunspell/hunspell_1.7.3.bb
@@ -7,14 +7,33 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRCREV = "c5f98152a274e25b5107101104bef632b83a0cc9"
-SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-
+SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https;tag=v${PV} \
+           file://run-ptest \
+"
 
-inherit autotools pkgconfig gettext
+inherit autotools pkgconfig gettext ptest
 
 # ispellaff2myspell: A program to convert ispell affix tables to myspell format
 PACKAGES =+ "${PN}-ispell"
 FILES:${PN}-ispell = "${bindir}/ispellaff2myspell"
 RDEPENDS:${PN}-ispell = "perl"
 
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    install -m 0755 ${S}/tests/test.sh ${D}${PTEST_PATH}/tests/
+    
+    # Install test data files
+    for ext in dic aff good wrong sug morph root; do
+        find ${S}/tests -maxdepth 1 -name "*.$ext" -exec cp {} ${D}${PTEST_PATH}/tests/ \;
+    done
+    
+    # Patch test.sh to use installed binaries
+    sed -i 's|HUNSPELL="$(dirname $0)"/../src/tools/hunspell|HUNSPELL="${bindir}/hunspell"|' ${D}${PTEST_PATH}/tests/test.sh
+    sed -i 's|ANALYZE="$(dirname $0)"/../src/tools/analyze|ANALYZE="${bindir}/analyze"|' ${D}${PTEST_PATH}/tests/test.sh
+    sed -i 's|alias hunspell=.*HUNSPELL.*|alias hunspell="$HUNSPELL"|' ${D}${PTEST_PATH}/tests/test.sh
+    sed -i 's|alias analyze=.*ANALYZE.*|alias analyze="$ANALYZE"|' ${D}${PTEST_PATH}/tests/test.sh
+}
+
+RDEPENDS:${PN}-ptest += "bash glibc-gconv-iso8859-2"
+
 BBCLASSEXTEND = "native"
-- 
2.34.1


