Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F9EDC021AA
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 05:11:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16622.1740114690168977221
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Feb 2025 21:11:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=414710b9ef=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L5BTej028126;
	Thu, 20 Feb 2025 21:11:29 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00kbb81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Feb 2025 21:11:29 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 20 Feb 2025 21:11:27 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] dlt-daemon: fix CVE-2022-39836 and CVE-2022-39837
Date: Fri, 21 Feb 2025 05:11:07 +0000
Message-ID: <20250221051107.3473027-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=N67TF39B c=1 sm=1 tr=0 ts=67b80b01 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=T2h4t0Lz3GQA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=hVcwujEvAAAA:8
 a=XIlzIUGFTEuOCCYVCCMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: wRXD9rju6flqMOxl7kNrgs3bY_xB1X-v
X-Proofpoint-GUID: wRXD9rju6flqMOxl7kNrgs3bY_xB1X-v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502210037
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Feb 2025 05:11:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115531

From: Yogita Urade <yogita.urade@windriver.com>

CVE-2022-39836:
An issue was discovered in Connected Vehicle Systems Alliance (COVESA)
dlt-daemon through 2.18.8. Due to a faulty DLT file parser, a crafted
DLT file that crashes the process can be created. This is due to missing
validation checks. There is a heap-based buffer over-read of one byte.

CVE-2022-39837:
An issue was discovered in Connected Vehicle Systems Alliance (COVESA)
dlt-daemon through 2.18.8. Due to a faulty DLT file parser, a crafted
DLT file that crashes the process can be created. This is due to missing
validation checks. There is a NULL pointer dereference.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-39836
https://nvd.nist.gov/vuln/detail/CVE-2022-39837

Upstream patch:
https://github.com/COVESA/dlt-daemon/commit/855e0017a980d2990c16f7dbf3b4983b48fac272

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../CVE-2022-39836-CVE-2022-39837.patch       | 251 ++++++++++++++++++
 .../dlt-daemon/dlt-daemon_2.18.8.bb           |   1 +
 2 files changed, 252 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/CVE-2022-39836-CVE-2022-39837.patch

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/CVE-2022-39836-CVE-2022-39837.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/CVE-2022-39836-CVE-2022-39837.patch
new file mode 100644
index 0000000000..49fb9db3e2
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/CVE-2022-39836-CVE-2022-39837.patch
@@ -0,0 +1,251 @@
+From 855e0017a980d2990c16f7dbf3b4983b48fac272 Mon Sep 17 00:00:00 2001
+From: Bui Nguyen Quoc Thanh <49302843+thanhbnq@users.noreply.github.com>
+Date: Thu, 7 Jul 2022 11:00:34 +0700
+Subject: [PATCH] Fix handle returned value (#384)
+
+* common: Handle returned value
+
+- The returned value of supporting APIs should be checked correctly.
+- In case of extended header, the buffer of header must be checked
+before proceeding further.
+
+Signed-off-by: Bui Nguyen Quoc Thanh <thanh.buinguyenquoc@vn.bosch.com>
+
+* console: Handle returned value
+
+In case of parsing dlt file, the failed messages
+should be skipped by evaluating returned value
+
+Signed-off-by: Bui Nguyen Quoc Thanh <thanh.buinguyenquoc@vn.bosch.com>
+
+CVE: CVE-2022-39836 and CVE-2022-39837
+Upstream-Status: Backport [https://github.com/COVESA/dlt-daemon/commit/855e0017a980d2990c16f7dbf3b4983b48fac272]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ src/console/dlt-convert.c         | 18 ++++++----
+ src/console/dlt-sortbytimestamp.c |  6 ++--
+ src/shared/dlt_common.c           | 60 ++++++++++++++++++++++---------
+ 3 files changed, 59 insertions(+), 25 deletions(-)
+
+diff --git a/src/console/dlt-convert.c b/src/console/dlt-convert.c
+index b82c104..30ea09a 100644
+--- a/src/console/dlt-convert.c
++++ b/src/console/dlt-convert.c
+@@ -432,31 +432,37 @@ int main(int argc, char *argv[])
+             }
+
+             for (num = begin; num <= end; num++) {
+-                dlt_file_message(&file, num, vflag);
++                if (dlt_file_message(&file, num, vflag) < DLT_RETURN_OK)
++                    continue;
+
+                 if (xflag) {
+                     printf("%d ", num);
+-                    dlt_message_print_hex(&(file.msg), text, DLT_CONVERT_TEXTBUFSIZE, vflag);
++                    if (dlt_message_print_hex(&(file.msg), text, DLT_CONVERT_TEXTBUFSIZE, vflag) < DLT_RETURN_OK)
++                        continue;
+                 }
+                 else if (aflag) {
+                     printf("%d ", num);
+
+-                    dlt_message_header(&(file.msg), text, DLT_CONVERT_TEXTBUFSIZE, vflag);
++                    if (dlt_message_header(&(file.msg), text, DLT_CONVERT_TEXTBUFSIZE, vflag) < DLT_RETURN_OK)
++                        continue;
+
+                     printf("%s ", text);
+
+-                    dlt_message_payload(&file.msg, text, DLT_CONVERT_TEXTBUFSIZE, DLT_OUTPUT_ASCII, vflag);
++                    if (dlt_message_payload(&file.msg, text, DLT_CONVERT_TEXTBUFSIZE, DLT_OUTPUT_ASCII, vflag) < DLT_RETURN_OK)
++                        continue;
+
+                     printf("[%s]\n", text);
+                 }
+                 else if (mflag) {
+                     printf("%d ", num);
+-                    dlt_message_print_mixed_plain(&(file.msg), text, DLT_CONVERT_TEXTBUFSIZE, vflag);
++                    if (dlt_message_print_mixed_plain(&(file.msg), text, DLT_CONVERT_TEXTBUFSIZE, vflag) < DLT_RETURN_OK)
++                        continue;
+                 }
+                 else if (sflag) {
+                     printf("%d ", num);
+
+-                    dlt_message_header(&(file.msg), text, DLT_CONVERT_TEXTBUFSIZE, vflag);
++                    if (dlt_message_header(&(file.msg), text, DLT_CONVERT_TEXTBUFSIZE, vflag) < DLT_RETURN_OK)
++                        continue;
+
+                     printf("%s \n", text);
+                 }
+diff --git a/src/console/dlt-sortbytimestamp.c b/src/console/dlt-sortbytimestamp.c
+index 3e418e1..82fd5d0 100644
+--- a/src/console/dlt-sortbytimestamp.c
++++ b/src/console/dlt-sortbytimestamp.c
+@@ -160,7 +160,8 @@ void write_messages(int ohandle, DltFile *file,
+         if ((0 == i % 1001) || (i == message_count - 1))
+             verbose(2, "Writing message %d\r", i);
+
+-        dlt_file_message(file, timestamps[i].num, 0);
++        if (dlt_file_message(file, timestamps[i].num, 0) < DLT_RETURN_OK)
++            continue;
+         iov[0].iov_base = file->msg.headerbuffer;
+         iov[0].iov_len = file->msg.headersize;
+         iov[1].iov_base = file->msg.databuffer;
+@@ -402,7 +403,8 @@ int main(int argc, char *argv[]) {
+     verbose(1, "Filling %d entries\n", message_count);
+
+     for (num = begin; num <= end; num++) {
+-        dlt_file_message(&file, num, vflag);
++        if (dlt_file_message(&file, num, vflag) < DLT_RETURN_OK)
++            continue;
+         timestamp_index[num - begin].num = num;
+         timestamp_index[num - begin].systmsp = file.msg.storageheader->seconds;
+         timestamp_index[num - begin].tmsp = file.msg.headerextra.tmsp;
+diff --git a/src/shared/dlt_common.c b/src/shared/dlt_common.c
+index 427044b..4303c50 100644
+--- a/src/shared/dlt_common.c
++++ b/src/shared/dlt_common.c
+@@ -202,7 +202,10 @@ DltReturnValue dlt_print_mixed_string(char *text, int textlength, uint8_t *ptr,
+         /* Hex-Output */
+         /* It is not required to decrement textlength, as it was already checked, that
+          * there is enough space for the complete output */
+-        dlt_print_hex_string(text, textlength, (uint8_t *)(ptr + (lines * DLT_COMMON_HEX_CHARS)), DLT_COMMON_HEX_CHARS);
++        if (dlt_print_hex_string(text, textlength,
++                (uint8_t *)(ptr + (lines * DLT_COMMON_HEX_CHARS)),
++                DLT_COMMON_HEX_CHARS) < DLT_RETURN_OK)
++            return DLT_RETURN_ERROR;
+         text += ((2 * DLT_COMMON_HEX_CHARS) + (DLT_COMMON_HEX_CHARS - 1)); /* 32 characters + 15 spaces */
+
+         snprintf(text, 2, " ");
+@@ -211,8 +214,10 @@ DltReturnValue dlt_print_mixed_string(char *text, int textlength, uint8_t *ptr,
+         /* Char-Output */
+         /* It is not required to decrement textlength, as it was already checked, that
+          * there is enough space for the complete output */
+-        dlt_print_char_string(&text, textlength, (uint8_t *)(ptr + (lines * DLT_COMMON_HEX_CHARS)),
+-                              DLT_COMMON_HEX_CHARS);
++        if (dlt_print_char_string(&text, textlength,
++                (uint8_t *)(ptr + (lines * DLT_COMMON_HEX_CHARS)),
++                DLT_COMMON_HEX_CHARS) < DLT_RETURN_OK)
++            return DLT_RETURN_ERROR;
+
+         if (html == 0) {
+             snprintf(text, 2, "\n");
+@@ -240,10 +245,11 @@ DltReturnValue dlt_print_mixed_string(char *text, int textlength, uint8_t *ptr,
+         /* Hex-Output */
+         /* It is not required to decrement textlength, as it was already checked, that
+          * there is enough space for the complete output */
+-        dlt_print_hex_string(text,
++        if (dlt_print_hex_string(text,
+                              textlength,
+                              (uint8_t *)(ptr + ((size / DLT_COMMON_HEX_CHARS) * DLT_COMMON_HEX_CHARS)),
+-                             rest);
++                             rest) < DLT_RETURN_OK)
++            return DLT_RETURN_ERROR;
+         text += 2 * rest + (rest - 1);
+
+         for (i = 0; i < (DLT_COMMON_HEX_CHARS - rest); i++) {
+@@ -257,8 +263,10 @@ DltReturnValue dlt_print_mixed_string(char *text, int textlength, uint8_t *ptr,
+         /* Char-Output */
+         /* It is not required to decrement textlength, as it was already checked, that
+          * there is enough space for the complete output */
+-        dlt_print_char_string(&text, textlength,
+-                              (uint8_t *)(ptr + ((size / DLT_COMMON_HEX_CHARS) * DLT_COMMON_HEX_CHARS)), rest);
++        if (dlt_print_char_string(&text, textlength,
++                              (uint8_t *)(ptr + ((size / DLT_COMMON_HEX_CHARS) * DLT_COMMON_HEX_CHARS)),
++                              rest) < DLT_RETURN_OK)
++            return DLT_RETURN_ERROR;
+     }
+
+     return DLT_RETURN_OK;
+@@ -672,6 +680,9 @@ DltReturnValue dlt_message_header_flags(DltMessage *msg, char *text, size_t text
+     if ((msg == NULL) || (text == NULL) || (textlength <= 0))
+         return DLT_RETURN_WRONG_PARAMETER;
+
++    if ((DLT_IS_HTYP_UEH(msg->standardheader->htyp)) && (msg->extendedheader == NULL))
++        return DLT_RETURN_WRONG_PARAMETER;
++
+     if ((flags < DLT_HEADER_SHOW_NONE) || (flags > DLT_HEADER_SHOW_ALL))
+         return DLT_RETURN_WRONG_PARAMETER;
+
+@@ -3239,7 +3250,8 @@ DltReturnValue dlt_message_print_header(DltMessage *message, char *text, uint32_
+     if ((message == NULL) || (text == NULL))
+         return DLT_RETURN_WRONG_PARAMETER;
+
+-    dlt_message_header(message, text, size, verbose);
++    if (dlt_message_header(message, text, size, verbose) < DLT_RETURN_OK)
++        return DLT_RETURN_ERROR;
+     dlt_user_printf("%s\n", text);
+
+     return DLT_RETURN_OK;
+@@ -3250,9 +3262,12 @@ DltReturnValue dlt_message_print_hex(DltMessage *message, char *text, uint32_t s
+     if ((message == NULL) || (text == NULL))
+         return DLT_RETURN_WRONG_PARAMETER;
+
+-    dlt_message_header(message, text, size, verbose);
++    if (dlt_message_header(message, text, size, verbose) < DLT_RETURN_OK)
++        return DLT_RETURN_ERROR;
+     dlt_user_printf("%s ", text);
+-    dlt_message_payload(message, text, size, DLT_OUTPUT_HEX, verbose);
++
++    if (dlt_message_payload(message, text, size, DLT_OUTPUT_HEX, verbose) < DLT_RETURN_OK)
++        return DLT_RETURN_ERROR;
+     dlt_user_printf("[%s]\n", text);
+
+     return DLT_RETURN_OK;
+@@ -3263,9 +3278,12 @@ DltReturnValue dlt_message_print_ascii(DltMessage *message, char *text, uint32_t
+     if ((message == NULL) || (text == NULL))
+         return DLT_RETURN_WRONG_PARAMETER;
+
+-    dlt_message_header(message, text, size, verbose);
++    if (dlt_message_header(message, text, size, verbose) < DLT_RETURN_OK)
++        return DLT_RETURN_ERROR;
+     dlt_user_printf("%s ", text);
+-    dlt_message_payload(message, text, size, DLT_OUTPUT_ASCII, verbose);
++
++    if (dlt_message_payload(message, text, size, DLT_OUTPUT_ASCII, verbose) < DLT_RETURN_OK)
++        return DLT_RETURN_ERROR;
+     dlt_user_printf("[%s]\n", text);
+
+     return DLT_RETURN_OK;
+@@ -3276,9 +3294,12 @@ DltReturnValue dlt_message_print_mixed_plain(DltMessage *message, char *text, ui
+     if ((message == NULL) || (text == NULL))
+         return DLT_RETURN_WRONG_PARAMETER;
+
+-    dlt_message_header(message, text, size, verbose);
++    if (dlt_message_header(message, text, size, verbose) < DLT_RETURN_OK)
++        return DLT_RETURN_ERROR;
+     dlt_user_printf("%s \n", text);
+-    dlt_message_payload(message, text, size, DLT_OUTPUT_MIXED_FOR_PLAIN, verbose);
++
++    if (dlt_message_payload(message, text, size, DLT_OUTPUT_MIXED_FOR_PLAIN, verbose) < DLT_RETURN_OK)
++        return DLT_RETURN_ERROR;
+     dlt_user_printf("[%s]\n", text);
+
+     return DLT_RETURN_OK;
+@@ -3289,9 +3310,13 @@ DltReturnValue dlt_message_print_mixed_html(DltMessage *message, char *text, uin
+     if ((message == NULL) || (text == NULL))
+         return DLT_RETURN_WRONG_PARAMETER;
+
+-    dlt_message_header(message, text, size, verbose);
++    if (dlt_message_header(message, text, size, verbose) < DLT_RETURN_OK)
++        return DLT_RETURN_ERROR;
+     dlt_user_printf("%s \n", text);
+-    dlt_message_payload(message, text, size, DLT_OUTPUT_MIXED_FOR_HTML, verbose);
++
++    if (dlt_message_payload(message, text, size, DLT_OUTPUT_MIXED_FOR_HTML, verbose) < DLT_RETURN_OK)
++        return DLT_RETURN_ERROR;
++
+     dlt_user_printf("[%s]\n", text);
+
+     return DLT_RETURN_OK;
+@@ -3901,7 +3926,8 @@ DltReturnValue dlt_message_argument_print(DltMessage *msg,
+         if ((*datalength) < length)
+             return DLT_RETURN_ERROR;
+
+-        dlt_print_hex_string_delim(value_text, (int) textlength, *ptr, length, '\'');
++        if (dlt_print_hex_string_delim(value_text, (int) textlength, *ptr, length, '\'') < DLT_RETURN_OK)
++            return DLT_RETURN_ERROR;
+         *ptr += length;
+         *datalength -= length;
+     }
+--
+2.40.0
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
index b98cfadf3e..8ef056651b 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https;branch=master \
            file://0004-Modify-systemd-config-directory.patch \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
            file://0001-Fix-memory-leak.patch \
+           file://CVE-2022-39836-CVE-2022-39837.patch \
            "
 SRCREV = "6a3bd901d825c7206797e36ea98e10a218f5aad2"
 
-- 
2.40.0


