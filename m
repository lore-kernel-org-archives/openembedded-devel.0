Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5EF6E60B3B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 16:45:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02HGig2C003966
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 09:44:53 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.487.0;
	Tue, 17 Mar 2020 09:44:32 -0700
From: Wenlin Kang <wenlin.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Mar 2020 09:44:32 -0700
Message-ID: <20200317164432.78643-1-wenlin.kang@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] ipmitool: fixes for CVE-2020-5208
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
X-List-Received-Date: Tue, 17 Mar 2020 16:45:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This patch is the other part of the fixes for CVE-2020-5208.

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 ...uffer-overflow-in-ipmi_spd_print_fru.patch |  53 +++++++
 ...er-overflow-in-ipmi_get_session_info.patch |  53 +++++++
 .../0003-channel-Fix-buffer-overflow.patch    |  69 +++++++++
 ...er-overflows-in-get_lan_param_select.patch |  94 ++++++++++++
 ...u-sdr-Fix-id_string-buffer-overflows.patch | 142 ++++++++++++++++++
 .../ipmitool/ipmitool_1.8.18.bb               |   5 +
 6 files changed, 416 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0001-fru-Fix-buffer-overflow-in-ipmi_spd_print_fru.patch
 create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0002-session-Fix-buffer-overflow-in-ipmi_get_session_info.patch
 create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0003-channel-Fix-buffer-overflow.patch
 create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0004-lanp-Fix-buffer-overflows-in-get_lan_param_select.patch
 create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0005-fru-sdr-Fix-id_string-buffer-overflows.patch

diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-fru-Fix-buffer-overflow-in-ipmi_spd_print_fru.patch b/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-fru-Fix-buffer-overflow-in-ipmi_spd_print_fru.patch
new file mode 100644
index 000000000..eadfb7ead
--- /dev/null
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-fru-Fix-buffer-overflow-in-ipmi_spd_print_fru.patch
@@ -0,0 +1,53 @@
+From 24aed93efb30a8f557aedc2f03b6ccec758ccbf4 Mon Sep 17 00:00:00 2001
+From: Chrostoper Ertl <chertl@microsoft.com>
+Date: Thu, 28 Nov 2019 16:44:18 +0000
+Subject: [PATCH 1/5] fru: Fix buffer overflow in ipmi_spd_print_fru
+
+Partial fix for CVE-2020-5208, see
+https://github.com/ipmitool/ipmitool/security/advisories/GHSA-g659-9qxw-p7cp
+
+The `ipmi_spd_print_fru` function has a similar issue as the one fixed
+by the previous commit in `read_fru_area_section`. An initial request is
+made to get the `fru.size`, which is used as the size for the allocation
+of `spd_data`. Inside a loop, further requests are performed to get the
+copy sizes which are not checked before being used as the size for a
+copy into the buffer.
+
+Upstream-Status: Backport[https://github.com/ipmitool/ipmitool/commit/840fb1cbb4fb365cb9797300e3374d4faefcdb10]
+CVE: CVE-2020-5208
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ lib/dimm_spd.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/lib/dimm_spd.c b/lib/dimm_spd.c
+index 91ae117..4c9c21d 100644
+--- a/lib/dimm_spd.c
++++ b/lib/dimm_spd.c
+@@ -1014,7 +1014,7 @@ ipmi_spd_print_fru(struct ipmi_intf * intf, uint8_t id)
+ 	struct ipmi_rq req;
+ 	struct fru_info fru;
+ 	uint8_t *spd_data, msg_data[4];
+-	int len, offset;
++	uint32_t len, offset;
+ 
+ 	msg_data[0] = id;
+ 
+@@ -1091,6 +1091,13 @@ ipmi_spd_print_fru(struct ipmi_intf * intf, uint8_t id)
+ 		}
+ 
+ 		len = rsp->data[0];
++		if(rsp->data_len < 1
++		   || len > rsp->data_len - 1
++		   || len > fru.size - offset)
++		{
++			printf(" Not enough buffer size");
++			return -1;
++		}
+ 		memcpy(&spd_data[offset], rsp->data + 1, len);
+ 		offset += len;
+ 	} while (offset < fru.size);
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool/0002-session-Fix-buffer-overflow-in-ipmi_get_session_info.patch b/meta-oe/recipes-kernel/ipmitool/ipmitool/0002-session-Fix-buffer-overflow-in-ipmi_get_session_info.patch
new file mode 100644
index 000000000..b8742b1a8
--- /dev/null
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool/0002-session-Fix-buffer-overflow-in-ipmi_get_session_info.patch
@@ -0,0 +1,53 @@
+From 81144cfba131b4ddbfcf9c530274b23bfc7e0ea8 Mon Sep 17 00:00:00 2001
+From: Chrostoper Ertl <chertl@microsoft.com>
+Date: Thu, 28 Nov 2019 16:51:49 +0000
+Subject: [PATCH 2/5] session: Fix buffer overflow in ipmi_get_session_info
+
+Partial fix for CVE-2020-5208, see
+https://github.com/ipmitool/ipmitool/security/advisories/GHSA-g659-9qxw-p7cp
+
+The `ipmi_get_session_info` function does not properly check the
+response `data_len`, which is used as a copy size, allowing stack buffer
+overflow.
+
+Upstream-Status: Backport[https://github.com/ipmitool/ipmitool/commit/41d7026946fafbd4d1ec0bcaca3ea30a6e8eed22]
+CVE: CVE-2020-5208
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ lib/ipmi_session.c | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/lib/ipmi_session.c b/lib/ipmi_session.c
+index 4855bc4..71bef4c 100644
+--- a/lib/ipmi_session.c
++++ b/lib/ipmi_session.c
+@@ -319,8 +319,10 @@ ipmi_get_session_info(struct ipmi_intf         * intf,
+ 		}
+ 		else
+ 		{
+-			memcpy(&session_info,  rsp->data, rsp->data_len);
+-			print_session_info(&session_info, rsp->data_len);
++			memcpy(&session_info,  rsp->data,
++			       __min(rsp->data_len, sizeof(session_info)));
++			print_session_info(&session_info,
++			                   __min(rsp->data_len, sizeof(session_info)));
+ 		}
+ 		break;
+ 		
+@@ -351,8 +353,10 @@ ipmi_get_session_info(struct ipmi_intf         * intf,
+ 				break;
+ 			}
+ 
+-			memcpy(&session_info,  rsp->data, rsp->data_len);
+-			print_session_info(&session_info, rsp->data_len);
++			memcpy(&session_info,  rsp->data,
++			       __min(rsp->data_len, sizeof(session_info)));
++			print_session_info(&session_info,
++			                   __min(rsp->data_len, sizeof(session_info)));
+ 			
+ 		} while (i <= session_info.session_slot_count);
+ 		break;
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool/0003-channel-Fix-buffer-overflow.patch b/meta-oe/recipes-kernel/ipmitool/ipmitool/0003-channel-Fix-buffer-overflow.patch
new file mode 100644
index 000000000..deebd356a
--- /dev/null
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool/0003-channel-Fix-buffer-overflow.patch
@@ -0,0 +1,69 @@
+From 5057761e30e3a7682edab60f98f631616392ddc6 Mon Sep 17 00:00:00 2001
+From: Chrostoper Ertl <chertl@microsoft.com>
+Date: Thu, 28 Nov 2019 16:56:38 +0000
+Subject: [PATCH 3/3] channel: Fix buffer overflow
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Partial fix for CVE-2020-5208, see
+https://github.com/ipmitool/ipmitool/security/advisories/GHSA-g659-9qxw-p7cp
+
+The `ipmi_get_channel_cipher_suites` function does not properly check
+the final response’s `data_len`, which can lead to stack buffer overflow
+on the final copy.
+
+Upstream-Status: Backport[https://github.com/ipmitool/ipmitool/commit/9452be87181a6e83cfcc768b3ed8321763db50e4]
+CVE: CVE-2020-5208
+
+[Make some changes to apply it]
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ include/ipmitool/ipmi_channel.h |  2 ++
+ lib/ipmi_channel.c              | 10 ++++++++--
+ 2 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/include/ipmitool/ipmi_channel.h b/include/ipmitool/ipmi_channel.h
+index b138c26..d7cce5e 100644
+--- a/include/ipmitool/ipmi_channel.h
++++ b/include/ipmitool/ipmi_channel.h
+@@ -77,6 +77,8 @@ struct channel_access_t {
+ 	uint8_t user_level_auth;
+ };
+ 
++#define MAX_CIPHER_SUITE_DATA_LEN 0x10
++
+ /*
+  * The Get Authentication Capabilities response structure
+  * From table 22-15 of the IPMI v2.0 spec
+diff --git a/lib/ipmi_channel.c b/lib/ipmi_channel.c
+index fab2e54..76ecdcd 100644
+--- a/lib/ipmi_channel.c
++++ b/lib/ipmi_channel.c
+@@ -378,7 +378,10 @@ ipmi_get_channel_cipher_suites(struct ipmi_intf *intf, const char *payload_type,
+ 		lprintf(LOG_ERR, "Unable to Get Channel Cipher Suites");
+ 		return -1;
+ 	}
+-	if (rsp->ccode > 0) {
++	if (rsp->ccode
++	    || rsp->data_len < 1
++	    || rsp->data_len > sizeof(uint8_t) + MAX_CIPHER_SUITE_DATA_LEN)
++	{
+ 		lprintf(LOG_ERR, "Get Channel Cipher Suites failed: %s",
+ 			val2str(rsp->ccode, completion_code_vals));
+ 		return -1;
+@@ -413,7 +416,10 @@ ipmi_get_channel_cipher_suites(struct ipmi_intf *intf, const char *payload_type,
+ 			lprintf(LOG_ERR, "Unable to Get Channel Cipher Suites");
+ 			return -1;
+ 		}
+-		if (rsp->ccode > 0) {
++		if (rsp->ccode
++		    || rsp->data_len < 1
++		    || rsp->data_len > sizeof(uint8_t) + MAX_CIPHER_SUITE_DATA_LEN)
++		{
+ 			lprintf(LOG_ERR, "Get Channel Cipher Suites failed: %s",
+ 					val2str(rsp->ccode, completion_code_vals));
+ 			return -1;
+-- 
+2.18.1
+
diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool/0004-lanp-Fix-buffer-overflows-in-get_lan_param_select.patch b/meta-oe/recipes-kernel/ipmitool/ipmitool/0004-lanp-Fix-buffer-overflows-in-get_lan_param_select.patch
new file mode 100644
index 000000000..b5ce9e92e
--- /dev/null
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool/0004-lanp-Fix-buffer-overflows-in-get_lan_param_select.patch
@@ -0,0 +1,94 @@
+From e6aa6076f65e71544bd6450d20d943d7baaccb9f Mon Sep 17 00:00:00 2001
+From: Chrostoper Ertl <chertl@microsoft.com>
+Date: Thu, 28 Nov 2019 17:06:39 +0000
+Subject: [PATCH 4/5] lanp: Fix buffer overflows in get_lan_param_select
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Partial fix for CVE-2020-5208, see
+https://github.com/ipmitool/ipmitool/security/advisories/GHSA-g659-9qxw-p7cp
+
+The `get_lan_param_select` function is missing a validation check on the
+response’s `data_len`, which it then returns to caller functions, where
+stack buffer overflow can occur.
+
+Upstream-Status: Backport[https://github.com/ipmitool/ipmitool/commit/d45572d71e70840e0d4c50bf48218492b79c1a10]
+CVE: CVE-2020-5208
+
+[Make some changes to apply it]
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ lib/ipmi_lanp.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/lib/ipmi_lanp.c b/lib/ipmi_lanp.c
+index 060e753..dee21ee 100644
+--- a/lib/ipmi_lanp.c
++++ b/lib/ipmi_lanp.c
+@@ -1917,7 +1917,7 @@ ipmi_lan_alert_set(struct ipmi_intf * intf, uint8_t chan, uint8_t alert,
+ 		if (p == NULL) {
+ 			return (-1);
+ 		}
+-		memcpy(data, p->data, p->data_len);
++		memcpy(data, p->data, __min(p->data_len, sizeof(data)));
+ 		/* set new ipaddr */
+ 		memcpy(data+3, temp, 4);
+ 		printf("Setting LAN Alert %d IP Address to %d.%d.%d.%d\n", alert,
+@@ -1932,7 +1932,7 @@ ipmi_lan_alert_set(struct ipmi_intf * intf, uint8_t chan, uint8_t alert,
+ 		if (p == NULL) {
+ 			return (-1);
+ 		}
+-		memcpy(data, p->data, p->data_len);
++		memcpy(data, p->data, __min(p->data_len, sizeof(data)));
+ 		/* set new macaddr */
+ 		memcpy(data+7, temp, 6);
+ 		printf("Setting LAN Alert %d MAC Address to "
+@@ -1947,7 +1947,7 @@ ipmi_lan_alert_set(struct ipmi_intf * intf, uint8_t chan, uint8_t alert,
+ 		if (p == NULL) {
+ 			return (-1);
+ 		}
+-		memcpy(data, p->data, p->data_len);
++		memcpy(data, p->data, __min(p->data_len, sizeof(data)));
+ 
+ 		if (strncasecmp(argv[1], "def", 3) == 0 ||
+ 		    strncasecmp(argv[1], "default", 7) == 0) {
+@@ -1973,7 +1973,7 @@ ipmi_lan_alert_set(struct ipmi_intf * intf, uint8_t chan, uint8_t alert,
+ 		if (p == NULL) {
+ 			return (-1);
+ 		}
+-		memcpy(data, p->data, p->data_len);
++		memcpy(data, p->data, __min(p->data_len, sizeof(data)));
+ 
+ 		if (strncasecmp(argv[1], "on", 2) == 0 ||
+ 		    strncasecmp(argv[1], "yes", 3) == 0) {
+@@ -1998,7 +1998,7 @@ ipmi_lan_alert_set(struct ipmi_intf * intf, uint8_t chan, uint8_t alert,
+ 		if (p == NULL) {
+ 			return (-1);
+ 		}
+-		memcpy(data, p->data, p->data_len);
++		memcpy(data, p->data, __min(p->data_len, sizeof(data)));
+ 
+ 		if (strncasecmp(argv[1], "pet", 3) == 0) {
+ 			printf("Setting LAN Alert %d destination to PET Trap\n", alert);
+@@ -2026,7 +2026,7 @@ ipmi_lan_alert_set(struct ipmi_intf * intf, uint8_t chan, uint8_t alert,
+ 		if (p == NULL) {
+ 			return (-1);
+ 		}
+-		memcpy(data, p->data, p->data_len);
++		memcpy(data, p->data, __min(p->data_len, sizeof(data)));
+ 
+ 		if (str2uchar(argv[1], &data[2]) != 0) {
+ 			lprintf(LOG_ERR, "Invalid time: %s", argv[1]);
+@@ -2042,7 +2042,7 @@ ipmi_lan_alert_set(struct ipmi_intf * intf, uint8_t chan, uint8_t alert,
+ 		if (p == NULL) {
+ 			return (-1);
+ 		}
+-		memcpy(data, p->data, p->data_len);
++		memcpy(data, p->data, __min(p->data_len, sizeof(data)));
+ 
+ 		if (str2uchar(argv[1], &data[3]) != 0) {
+ 			lprintf(LOG_ERR, "Invalid retry: %s", argv[1]);
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool/0005-fru-sdr-Fix-id_string-buffer-overflows.patch b/meta-oe/recipes-kernel/ipmitool/ipmitool/0005-fru-sdr-Fix-id_string-buffer-overflows.patch
new file mode 100644
index 000000000..cf8b9254c
--- /dev/null
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool/0005-fru-sdr-Fix-id_string-buffer-overflows.patch
@@ -0,0 +1,142 @@
+From 26e64ca78ae844c5ceedde89531e2924d7d4594c Mon Sep 17 00:00:00 2001
+From: Chrostoper Ertl <chertl@microsoft.com>
+Date: Thu, 28 Nov 2019 17:13:45 +0000
+Subject: [PATCH 5/5] fru, sdr: Fix id_string buffer overflows
+
+Final part of the fixes for CVE-2020-5208, see
+https://github.com/ipmitool/ipmitool/security/advisories/GHSA-g659-9qxw-p7cp
+
+9 variants of stack buffer overflow when parsing `id_string` field of
+SDR records returned from `CMD_GET_SDR` command.
+
+SDR record structs have an `id_code` field, and an `id_string` `char`
+array.
+
+The length of `id_string` is calculated as `(id_code & 0x1f) + 1`,
+which can be larger than expected 16 characters (if `id_code = 0xff`,
+then length will be `(0xff & 0x1f) + 1 = 32`).
+
+In numerous places, this can cause stack buffer overflow when copying
+into fixed buffer of size `17` bytes from this calculated length.
+
+Upstream-Status: Backport[https://github.com/ipmitool/ipmitool/commit/7ccea283dd62a05a320c1921e3d8d71a87772637]
+CVE: CVE-2020-5208
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ lib/ipmi_fru.c |  2 +-
+ lib/ipmi_sdr.c | 40 ++++++++++++++++++++++++----------------
+ 2 files changed, 25 insertions(+), 17 deletions(-)
+
+diff --git a/lib/ipmi_fru.c b/lib/ipmi_fru.c
+index b71ea23..1decea2 100644
+--- a/lib/ipmi_fru.c
++++ b/lib/ipmi_fru.c
+@@ -3038,7 +3038,7 @@ ipmi_fru_print(struct ipmi_intf * intf, struct sdr_record_fru_locator * fru)
+ 		return 0;
+ 
+ 	memset(desc, 0, sizeof(desc));
+-	memcpy(desc, fru->id_string, fru->id_code & 0x01f);
++	memcpy(desc, fru->id_string, __min(fru->id_code & 0x01f, sizeof(desc)));
+ 	desc[fru->id_code & 0x01f] = 0;
+ 	printf("FRU Device Description : %s (ID %d)\n", desc, fru->device_id);
+ 
+diff --git a/lib/ipmi_sdr.c b/lib/ipmi_sdr.c
+index fa7b082..175a86f 100644
+--- a/lib/ipmi_sdr.c
++++ b/lib/ipmi_sdr.c
+@@ -2113,7 +2113,7 @@ ipmi_sdr_print_sensor_eventonly(struct ipmi_intf *intf,
+ 		return -1;
+ 
+ 	memset(desc, 0, sizeof (desc));
+-	snprintf(desc, (sensor->id_code & 0x1f) + 1, "%s", sensor->id_string);
++	snprintf(desc, sizeof(desc), "%.*s", (sensor->id_code & 0x1f) + 1, sensor->id_string);
+ 
+ 	if (verbose) {
+ 		printf("Sensor ID              : %s (0x%x)\n",
+@@ -2164,7 +2164,7 @@ ipmi_sdr_print_sensor_mc_locator(struct ipmi_intf *intf,
+ 		return -1;
+ 
+ 	memset(desc, 0, sizeof (desc));
+-	snprintf(desc, (mc->id_code & 0x1f) + 1, "%s", mc->id_string);
++	snprintf(desc, sizeof(desc), "%.*s", (mc->id_code & 0x1f) + 1, mc->id_string);
+ 
+ 	if (verbose == 0) {
+ 		if (csv_output)
+@@ -2257,7 +2257,7 @@ ipmi_sdr_print_sensor_generic_locator(struct ipmi_intf *intf,
+ 	char desc[17];
+ 
+ 	memset(desc, 0, sizeof (desc));
+-	snprintf(desc, (dev->id_code & 0x1f) + 1, "%s", dev->id_string);
++	snprintf(desc, sizeof(desc), "%.*s", (dev->id_code & 0x1f) + 1, dev->id_string);
+ 
+ 	if (!verbose) {
+ 		if (csv_output)
+@@ -2314,7 +2314,7 @@ ipmi_sdr_print_sensor_fru_locator(struct ipmi_intf *intf,
+ 	char desc[17];
+ 
+ 	memset(desc, 0, sizeof (desc));
+-	snprintf(desc, (fru->id_code & 0x1f) + 1, "%s", fru->id_string);
++	snprintf(desc, sizeof(desc), "%.*s", (fru->id_code & 0x1f) + 1, fru->id_string);
+ 
+ 	if (!verbose) {
+ 		if (csv_output)
+@@ -2518,35 +2518,43 @@ ipmi_sdr_print_name_from_rawentry(struct ipmi_intf *intf,uint16_t id,
+ 
+    int rc =0;
+    char desc[17];
++   const char *id_string;
++   uint8_t id_code;
+    memset(desc, ' ', sizeof (desc));
+ 
+    switch ( type) {
+       case SDR_RECORD_TYPE_FULL_SENSOR:
+       record.full = (struct sdr_record_full_sensor *) raw;
+-      snprintf(desc, (record.full->id_code & 0x1f) +1, "%s",
+-               (const char *)record.full->id_string);
++      id_code = record.full->id_code;
++      id_string = record.full->id_string;
+       break;
++
+       case SDR_RECORD_TYPE_COMPACT_SENSOR:
+       record.compact = (struct sdr_record_compact_sensor *) raw	;
+-      snprintf(desc, (record.compact->id_code & 0x1f)  +1, "%s",
+-               (const char *)record.compact->id_string);
++      id_code = record.compact->id_code;
++      id_string = record.compact->id_string;
+       break;
++
+       case SDR_RECORD_TYPE_EVENTONLY_SENSOR:
+       record.eventonly  = (struct sdr_record_eventonly_sensor *) raw ;
+-      snprintf(desc, (record.eventonly->id_code & 0x1f)  +1, "%s",
+-               (const char *)record.eventonly->id_string);
+-      break;            
++      id_code = record.eventonly->id_code;
++      id_string = record.eventonly->id_string;
++      break;
++
+       case SDR_RECORD_TYPE_MC_DEVICE_LOCATOR:
+       record.mcloc  = (struct sdr_record_mc_locator *) raw ;
+-      snprintf(desc, (record.mcloc->id_code & 0x1f)  +1, "%s",
+-               (const char *)record.mcloc->id_string);		
++      id_code = record.mcloc->id_code;
++      id_string = record.mcloc->id_string;
+       break;
++
+       default:
+       rc = -1;
+-      break;
+-   }   
++   }
++   if (!rc) {
++       snprintf(desc, sizeof(desc), "%.*s", (id_code & 0x1f) + 1, id_string);
++   }
+ 
+-      lprintf(LOG_INFO, "ID: 0x%04x , NAME: %-16s", id, desc);
++   lprintf(LOG_INFO, "ID: 0x%04x , NAME: %-16s", id, desc);
+    return rc;
+ }
+ 
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
index 500d5bd0b..3de9a92a7 100644
--- a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
@@ -25,6 +25,11 @@ DEPENDS = "openssl readline ncurses"
 SRC_URI = "${SOURCEFORGE_MIRROR}/ipmitool/ipmitool-${PV}.tar.bz2 \
            file://0001-Migrate-to-openssl-1.1.patch \
            file://0001-fru-Fix-buffer-overflow-vulnerabilities.patch \
+           file://0001-fru-Fix-buffer-overflow-in-ipmi_spd_print_fru.patch \
+           file://0002-session-Fix-buffer-overflow-in-ipmi_get_session_info.patch \
+           file://0003-channel-Fix-buffer-overflow.patch \
+           file://0004-lanp-Fix-buffer-overflows-in-get_lan_param_select.patch \
+           file://0005-fru-sdr-Fix-id_string-buffer-overflows.patch \
            "
 SRC_URI[md5sum] = "bab7ea104c7b85529c3ef65c54427aa3"
 SRC_URI[sha256sum] = "0c1ba3b1555edefb7c32ae8cd6a3e04322056bc087918f07189eeedfc8b81e01"
-- 
2.23.0


