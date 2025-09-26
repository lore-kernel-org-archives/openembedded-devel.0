Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F59CAC5BC
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 11:44:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15375.1758887083660984535
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 04:44:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rjcyrhcX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1364ba7040=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58QAnn8T1346203
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 04:44:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=EIFkQvGuF+CdMPddoQeWZ+77kx67NLqQQRmupAKVJ2c=; b=rjcyrhcXozTF
	2yvN63ttBUiL7HI6cbvsBKYU/ykBjjCkVadRHyq9XAMkIFqw/Xt3kUSiWCFYwfvc
	9Ityn1Qg5m12h/3/SOtHgkILNkdP/5rVG2LbMvA9PvZfifJotmSudS9m3/JkGdcE
	yFCVikRJ9ePZjmXxjTaKOrXpL8Tr1foc1uFRJgzjwaWyLBWc5rT1jIuWTZSxYT1R
	aesPC2GTMGtheheEW51RDhtuEoGV0Rxt3sveynhWDLhhDvQdQfYTj3qjpdCV3WkP
	WBb60SrUMOBsmmkOQ6DrdWUashcVLw+fb9FWnhbCF3/q33qpxTqpYzke24t7YwC2
	EI1KCBytgQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbse0r7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 04:44:43 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 26 Sep 2025 04:44:42 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 26 Sep 2025 04:44:41 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 3/3] iperf3: Fix CVE-2024-53580
Date: Fri, 26 Sep 2025 17:14:30 +0530
Message-ID: <20250926114430.2425208-3-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250926114430.2425208-1-soumya.sambu@windriver.com>
References: <20250926114430.2425208-1-soumya.sambu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: nMku2iuFI-YinM0nn7eGzLMYWEKilPUe
X-Authority-Analysis: v=2.4 cv=NanrFmD4 c=1 sm=1 tr=0 ts=68d67cab cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=vtXoPY2jAAAA:8 a=EDhlG9hj55tZ7ykOT9UA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=s4FxMMpuSwg4a78zj2vJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDEwOCBTYWx0ZWRfXwuvlTTNci4H7
 gvt7GJU7MDn5SU2mRP6jxn+ivG78Zqw62yNCfntqWgRgcKP+1vuTXkIsPwHktznD/u7AYIIo5v1
 TTX/ZJhH6bGlI1hPozB5z1oGa6ColIdt37i2jC3aBkKaW9D5CCdFKezUpePvN3IxdEflbvUJeIk
 DkvsRDomGig5E6aF7kxVfcBqEkzVLycRCaAiQTwfylci6sL7LLhyGmu2OcgKnEd08qVHmiTDavY
 NIj3OSxw5owqQV6Y0nXy8GlQGlb7gUyutFHhXsljNRzbpuZQ7HVTYpoqFJIkiK5t4/5YaqUAXBG
 KIWr/1tutcOqEkPJ0dQ0jjL+JgwZWv5AeKcHaoBOqDAyktnuqEzIT+PFtKmTlTRZws7ZLdXGHeo
 YmMZMyaq7tEr7Esi+Ef6Ae/tWAN7dQ==
X-Proofpoint-ORIG-GUID: nMku2iuFI-YinM0nn7eGzLMYWEKilPUe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2509260108
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 11:44:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119907

From: Soumya Sambu <soumya.sambu@windriver.com>

iperf v3.17.1 was discovered to contain a segmentation violation via
the iperf_exchange_parameters() function.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-53580
https://security-tracker.debian.org/tracker/CVE-2024-53580

Upstream patch:
https://github.com/esnet/iperf/commit/3f66f604df7f1038a49108c48612c2f4fe71331f

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../iperf3/iperf3/CVE-2024-53580.patch        | 276 ++++++++++++++++++
 .../recipes-benchmark/iperf3/iperf3_3.14.bb   |   1 +
 2 files changed, 277 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2024-53580.patch

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2024-53580.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2024-53580.patch
new file mode 100644
index 0000000000..99ef69aea0
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2024-53580.patch
@@ -0,0 +1,276 @@
+From 3f66f604df7f1038a49108c48612c2f4fe71331f Mon Sep 17 00:00:00 2001
+From: Sarah Larsen <swlarsen@es.net>
+Date: Fri, 15 Nov 2024 23:23:05 +0000
+Subject: [PATCH] Add a variant of cJSON_GetObjectItem that does type-checking.
+
+This avoids a potential server crash with malformed iperf3
+parameter sets. (CVE-2024-53580)
+
+Vulnerability report submitted by Leonid Krolle Bi.Zone.
+
+Original version of fix by @dopheide-esnet.
+
+CVE: CVE-2024-53580
+
+Upstream-Status: Backport [https://github.com/esnet/iperf/commit/3f66f604df7f1038a49108c48612c2f4fe71331f]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/iperf_api.c   | 96 +++++++++++++++++++++++------------------------
+ src/iperf_error.c |  2 +-
+ src/iperf_util.c  | 36 ++++++++++++++++++
+ src/iperf_util.h  |  1 +
+ 4 files changed, 86 insertions(+), 49 deletions(-)
+
+diff --git a/src/iperf_api.c b/src/iperf_api.c
+index 3915884..786af29 100644
+--- a/src/iperf_api.c
++++ b/src/iperf_api.c
+@@ -2264,72 +2264,72 @@ get_parameters(struct iperf_test *test)
+             cJSON_free(str);
+ 	}
+ 
+-	if ((j_p = cJSON_GetObjectItem(j, "tcp")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "tcp", cJSON_True)) != NULL)
+ 	    set_protocol(test, Ptcp);
+-	if ((j_p = cJSON_GetObjectItem(j, "udp")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "udp", cJSON_True)) != NULL)
+ 	    set_protocol(test, Pudp);
+-        if ((j_p = cJSON_GetObjectItem(j, "sctp")) != NULL)
++        if ((j_p = iperf_cJSON_GetObjectItemType(j, "sctp", cJSON_True)) != NULL)
+             set_protocol(test, Psctp);
+-	if ((j_p = cJSON_GetObjectItem(j, "omit")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "omit", cJSON_Number)) != NULL)
+ 	    test->omit = j_p->valueint;
+-	if ((j_p = cJSON_GetObjectItem(j, "server_affinity")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "server_affinity", cJSON_Number)) != NULL)
+ 	    test->server_affinity = j_p->valueint;
+-	if ((j_p = cJSON_GetObjectItem(j, "time")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "time", cJSON_Number)) != NULL)
+ 	    test->duration = j_p->valueint;
+         test->settings->bytes = 0;
+-	if ((j_p = cJSON_GetObjectItem(j, "num")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "num", cJSON_Number)) != NULL)
+ 	    test->settings->bytes = j_p->valueint;
+         test->settings->blocks = 0;
+-	if ((j_p = cJSON_GetObjectItem(j, "blockcount")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "blockcount", cJSON_Number)) != NULL)
+ 	    test->settings->blocks = j_p->valueint;
+-	if ((j_p = cJSON_GetObjectItem(j, "MSS")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "MSS", cJSON_Number)) != NULL)
+ 	    test->settings->mss = j_p->valueint;
+-	if ((j_p = cJSON_GetObjectItem(j, "nodelay")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "nodelay", cJSON_True)) != NULL)
+ 	    test->no_delay = 1;
+-	if ((j_p = cJSON_GetObjectItem(j, "parallel")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "parallel", cJSON_Number)) != NULL)
+ 	    test->num_streams = j_p->valueint;
+-	if ((j_p = cJSON_GetObjectItem(j, "reverse")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "reverse", cJSON_True)) != NULL)
+ 	    iperf_set_test_reverse(test, 1);
+-        if ((j_p = cJSON_GetObjectItem(j, "bidirectional")) != NULL)
++        if ((j_p = iperf_cJSON_GetObjectItemType(j, "bidirectional", cJSON_True)) != NULL)
+             iperf_set_test_bidirectional(test, 1);
+-	if ((j_p = cJSON_GetObjectItem(j, "window")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "window", cJSON_Number)) != NULL)
+ 	    test->settings->socket_bufsize = j_p->valueint;
+-	if ((j_p = cJSON_GetObjectItem(j, "len")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "len", cJSON_Number)) != NULL)
+ 	    test->settings->blksize = j_p->valueint;
+-	if ((j_p = cJSON_GetObjectItem(j, "bandwidth")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "bandwidth", cJSON_Number)) != NULL)
+ 	    test->settings->rate = j_p->valueint;
+-	if ((j_p = cJSON_GetObjectItem(j, "fqrate")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "fqrate", cJSON_Number)) != NULL)
+ 	    test->settings->fqrate = j_p->valueint;
+-	if ((j_p = cJSON_GetObjectItem(j, "pacing_timer")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "pacing_timer", cJSON_Number)) != NULL)
+ 	    test->settings->pacing_timer = j_p->valueint;
+-	if ((j_p = cJSON_GetObjectItem(j, "burst")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "burst", cJSON_Number)) != NULL)
+ 	    test->settings->burst = j_p->valueint;
+-	if ((j_p = cJSON_GetObjectItem(j, "TOS")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "TOS", cJSON_Number)) != NULL)
+ 	    test->settings->tos = j_p->valueint;
+-	if ((j_p = cJSON_GetObjectItem(j, "flowlabel")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "flowlabel", cJSON_Number)) != NULL)
+ 	    test->settings->flowlabel = j_p->valueint;
+-	if ((j_p = cJSON_GetObjectItem(j, "title")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "title", cJSON_String)) != NULL)
+ 	    test->title = strdup(j_p->valuestring);
+-	if ((j_p = cJSON_GetObjectItem(j, "extra_data")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "extra_data", cJSON_String)) != NULL)
+ 	    test->extra_data = strdup(j_p->valuestring);
+-	if ((j_p = cJSON_GetObjectItem(j, "congestion")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "congestion", cJSON_String)) != NULL)
+ 	    test->congestion = strdup(j_p->valuestring);
+-	if ((j_p = cJSON_GetObjectItem(j, "congestion_used")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "congestion_used", cJSON_String)) != NULL)
+ 	    test->congestion_used = strdup(j_p->valuestring);
+-	if ((j_p = cJSON_GetObjectItem(j, "get_server_output")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "get_server_output", cJSON_Number)) != NULL)
+ 	    iperf_set_test_get_server_output(test, 1);
+-	if ((j_p = cJSON_GetObjectItem(j, "udp_counters_64bit")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "udp_counters_64bit", cJSON_Number)) != NULL)
+ 	    iperf_set_test_udp_counters_64bit(test, 1);
+-	if ((j_p = cJSON_GetObjectItem(j, "repeating_payload")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "repeating_payload", cJSON_Number)) != NULL)
+ 	    test->repeating_payload = 1;
+-	if ((j_p = cJSON_GetObjectItem(j, "zerocopy")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "zerocopy", cJSON_Number)) != NULL)
+ 	    test->zerocopy = j_p->valueint;
+ #if defined(HAVE_DONT_FRAGMENT)
+-	if ((j_p = cJSON_GetObjectItem(j, "dont_fragment")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "dont_fragment", cJSON_Number)) != NULL)
+ 	    test->settings->dont_fragment = j_p->valueint;
+ #endif /* HAVE_DONT_FRAGMENT */
+ #if defined(HAVE_SSL)
+-	if ((j_p = cJSON_GetObjectItem(j, "authtoken")) != NULL)
++	if ((j_p = iperf_cJSON_GetObjectItemType(j, "authtoken", cJSON_String)) != NULL)
+         test->settings->authtoken = strdup(j_p->valuestring);
+ #endif //HAVE_SSL
+ 	if (test->mode && test->protocol->id == Ptcp && has_tcpinfo_retransmits())
+@@ -2488,10 +2488,10 @@ get_results(struct iperf_test *test)
+ 	i_errno = IERECVRESULTS;
+         r = -1;
+     } else {
+-	j_cpu_util_total = cJSON_GetObjectItem(j, "cpu_util_total");
+-	j_cpu_util_user = cJSON_GetObjectItem(j, "cpu_util_user");
+-	j_cpu_util_system = cJSON_GetObjectItem(j, "cpu_util_system");
+-	j_sender_has_retransmits = cJSON_GetObjectItem(j, "sender_has_retransmits");
++	j_cpu_util_total = iperf_cJSON_GetObjectItemType(j, "cpu_util_total", cJSON_Number);
++	j_cpu_util_user = iperf_cJSON_GetObjectItemType(j, "cpu_util_user", cJSON_Number);
++	j_cpu_util_system = iperf_cJSON_GetObjectItemType(j, "cpu_util_system", cJSON_Number);
++	j_sender_has_retransmits = iperf_cJSON_GetObjectItemType(j, "sender_has_retransmits", cJSON_Number);
+ 	if (j_cpu_util_total == NULL || j_cpu_util_user == NULL || j_cpu_util_system == NULL || j_sender_has_retransmits == NULL) {
+ 	    i_errno = IERECVRESULTS;
+ 	    r = -1;
+@@ -2513,7 +2513,7 @@ get_results(struct iperf_test *test)
+ 	    else if ( test->mode == BIDIRECTIONAL )
+ 	        test->other_side_has_retransmits = result_has_retransmits;
+ 
+-	    j_streams = cJSON_GetObjectItem(j, "streams");
++	    j_streams = iperf_cJSON_GetObjectItemType(j, "streams", cJSON_Array);
+ 	    if (j_streams == NULL) {
+ 		i_errno = IERECVRESULTS;
+ 		r = -1;
+@@ -2525,16 +2525,16 @@ get_results(struct iperf_test *test)
+ 			i_errno = IERECVRESULTS;
+ 			r = -1;
+ 		    } else {
+-			j_id = cJSON_GetObjectItem(j_stream, "id");
+-			j_bytes = cJSON_GetObjectItem(j_stream, "bytes");
+-			j_retransmits = cJSON_GetObjectItem(j_stream, "retransmits");
+-			j_jitter = cJSON_GetObjectItem(j_stream, "jitter");
+-			j_errors = cJSON_GetObjectItem(j_stream, "errors");
+-                        j_omitted_errors = cJSON_GetObjectItem(j_stream, "omitted_errors");
+-			j_packets = cJSON_GetObjectItem(j_stream, "packets");
+-                        j_omitted_packets = cJSON_GetObjectItem(j_stream, "omitted_packets");
+-			j_start_time = cJSON_GetObjectItem(j_stream, "start_time");
+-			j_end_time = cJSON_GetObjectItem(j_stream, "end_time");
++			j_id = iperf_cJSON_GetObjectItemType(j_stream, "id", cJSON_Number);
++			j_bytes = iperf_cJSON_GetObjectItemType(j_stream, "bytes", cJSON_Number);
++			j_retransmits = iperf_cJSON_GetObjectItemType(j_stream, "retransmits", cJSON_Number);
++			j_jitter = iperf_cJSON_GetObjectItemType(j_stream, "jitter", cJSON_Number);
++			j_errors = iperf_cJSON_GetObjectItemType(j_stream, "errors", cJSON_Number);
++                        j_omitted_errors = iperf_cJSON_GetObjectItemType(j_stream, "omitted_errors", cJSON_Number);
++			j_packets = iperf_cJSON_GetObjectItemType(j_stream, "packets", cJSON_Number);
++                        j_omitted_packets = iperf_cJSON_GetObjectItemType(j_stream, "omitted_packets", cJSON_Number);
++			j_start_time = iperf_cJSON_GetObjectItemType(j_stream, "start_time", cJSON_Number);
++			j_end_time = iperf_cJSON_GetObjectItemType(j_stream, "end_time", cJSON_Number);
+ 			if (j_id == NULL || j_bytes == NULL || j_retransmits == NULL || j_jitter == NULL || j_errors == NULL || j_packets == NULL) {
+ 			    i_errno = IERECVRESULTS;
+ 			    r = -1;
+@@ -2623,7 +2623,7 @@ get_results(struct iperf_test *test)
+ 		    }
+ 		    else {
+ 			/* No JSON, look for textual output.  Make a copy of the text for later. */
+-			j_server_output = cJSON_GetObjectItem(j, "server_output_text");
++			j_server_output = iperf_cJSON_GetObjectItemType(j, "server_output_text", cJSON_String);
+ 			if (j_server_output != NULL) {
+ 			    test->server_output_text = strdup(j_server_output->valuestring);
+ 			}
+@@ -2632,7 +2632,7 @@ get_results(struct iperf_test *test)
+ 	    }
+ 	}
+ 
+-	j_remote_congestion_used = cJSON_GetObjectItem(j, "congestion_used");
++	j_remote_congestion_used = iperf_cJSON_GetObjectItemType(j, "congestion_used", cJSON_String);
+ 	if (j_remote_congestion_used != NULL) {
+ 	    test->remote_congestion_used = strdup(j_remote_congestion_used->valuestring);
+ 	}
+diff --git a/src/iperf_error.c b/src/iperf_error.c
+index f7cae63..d8676dc 100644
+--- a/src/iperf_error.c
++++ b/src/iperf_error.c
+@@ -60,7 +60,7 @@ iperf_err(struct iperf_test *test, const char *format, ...)
+     if (test != NULL && test->json_output && test->json_top != NULL)
+ 	cJSON_AddStringToObject(test->json_top, "error", str);
+     else {
+-	if (test && test->outfile && test->outfile != stdout) {
++	if (test != NULL && test->outfile != NULL && test->outfile != stdout) {
+ 	    if (ct) {
+ 		fprintf(test->outfile, "%s", ct);
+ 	    }
+diff --git a/src/iperf_util.c b/src/iperf_util.c
+index d5795ee..9f1ff33 100644
+--- a/src/iperf_util.c
++++ b/src/iperf_util.c
+@@ -420,6 +420,42 @@ iperf_json_printf(const char *format, ...)
+     return o;
+ }
+ 
++/********************** cJSON GetObjectItem w/ Type Helper ********************/
++cJSON * iperf_cJSON_GetObjectItemType(cJSON * j, char * item_string, int expected_type){
++    cJSON *j_p;
++    if((j_p = cJSON_GetObjectItem(j, item_string)) != NULL)
++        switch(expected_type){
++        case cJSON_True:
++            if(cJSON_IsBool(j_p))
++                return j_p;
++            else
++                iperf_err(NULL, "iperf_cJSON_GetObjectItemType mismatch %s", item_string);
++            break;
++        case cJSON_String:
++            if(cJSON_IsString(j_p))
++                return j_p;
++            else
++                iperf_err(NULL, "iperf_cJSON_GetObjectItemType mismatch %s", item_string);
++            break;
++        case cJSON_Number:
++            if(cJSON_IsNumber(j_p))
++                return j_p;
++            else
++                iperf_err(NULL, "iperf_cJSON_GetObjectItemType mismatch %s", item_string);
++            break;
++        case cJSON_Array:
++            if(cJSON_IsArray(j_p))
++                return j_p;
++            else
++                iperf_err(NULL, "iperf_cJSON_GetObjectItemType mismatch %s", item_string);
++            break;
++        default:
++            iperf_err(NULL, "unsupported type");
++	}
++
++    return NULL;
++}
++
+ /* Debugging routine to dump out an fd_set. */
+ void
+ iperf_dump_fdset(FILE *fp, const char *str, int nfds, fd_set *fds)
+diff --git a/src/iperf_util.h b/src/iperf_util.h
+index b109af2..c39a1f7 100644
+--- a/src/iperf_util.h
++++ b/src/iperf_util.h
+@@ -53,6 +53,7 @@ const char* get_system_info(void);
+ const char* get_optional_features(void);
+ 
+ cJSON* iperf_json_printf(const char *format, ...);
++cJSON * iperf_cJSON_GetObjectItemType(cJSON * j_p, char * item_string, int expected_type);
+ 
+ void iperf_dump_fdset(FILE *fp, const char *str, int nfds, fd_set *fds);
+ 
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
index 6de6d6c0b8..a768a14423 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
            file://0001-configure.ac-check-for-CPP-prog.patch \
            file://CVE-2023-7250.patch \
            file://CVE-2024-26306.patch \
+           file://CVE-2024-53580.patch \
            "
 
 SRCREV = "a0be85934144bc04712a6695b14ea6e45c379e1d"
-- 
2.40.0


