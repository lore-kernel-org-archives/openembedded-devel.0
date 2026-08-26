Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2769C5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 11:36:08 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10059.1787742249466738800
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 04:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=W9mQLJ8b;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=BWUn/9hb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: harsh.rai@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGTLJ1658496
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 10:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/gBZchR7bwHzfDtJZJjCVF
	jOH6RNBCMEyyM/XnHRkG0=; b=W9mQLJ8bbTfNiKQRkEoakrFsTjYDv800pqWGXg
	jtZcEpLtJjsLBkv3dNFRAxYh+JM2Cc6fFyTm6xaudqAq8XsN2S1g3lr/kTgMntQ6
	KwbsAtgUj82Ur9xxJ30qJHciIWao1cr4cS4FepJs7dP4TfCy9d6AzFPE7l1O7vsY
	ZxyYVinlcYdDytwlYI8IXUAuQtFdak7WexIbl3HUUKLCfaXqycKQ0Hp1E2Eu9O6L
	bDsQakNM3W7UMYAcYNO2xyrUjGFC5xhYWJWNmh2ffdY0D4eUvxKeutoC4oS0KaFl
	x1/AV27przKRaP7OEx21LeFbpdFHFHc1v5a+AaFLEREIktQQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uq1rutd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 10:51:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d5d00fd19bso18050025ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 03:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787741468; x=1788346268; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gBZchR7bwHzfDtJZJjCVFjOH6RNBCMEyyM/XnHRkG0=;
        b=BWUn/9hbnuzoceWb3LHTkS8+fOXCLX66RG2wOxCy9rq4kvgWLzQX28nw1kDuDna9B6
         6vm8dip4DA0akINJBfTDvqNqDrHBe+KYjweks10RWFxfx8wU5FmSAZ/YcJvyr6nuxEcV
         wgtSsOL5CjXw3/QY6o1X2AJyes/0aSJMb8Co3iENg5ZLQtczOaIRkvr8ntvUJQEq39Tb
         /V1aKUt5up2m3lPic/N93JZA1Ujlof9fd0JY/qR+yN11sIVupFUsuY8P9YjVosnmY6LU
         MINI8lLdFobDgp2baaOT8qVEfys7czEDMhgLJeBm+TtKpdpClInILXT6AgiHqdmE6Oag
         GpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787741468; x=1788346268;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/gBZchR7bwHzfDtJZJjCVFjOH6RNBCMEyyM/XnHRkG0=;
        b=WiDwvGQdpFJQ4h9BR+iZXy4NRG4dP15NC2ZSJRwcspm4xNe2wmukD+Ms8J4YquzqUR
         UOAVLG1dAX6qWHfJgqexFF1ZwyVNB4/SPZ0oXKhmwoX02TmPi5io5FbDXk9Z68UMS2Lv
         b5v4X0duKvLxBxyDr9PbIG+7ku1rP+P5TKkMQNLTaOhfta2hZqdw1b7vLOYoFfSCqeIQ
         v1OegBcJ3sqJj/+Cry1WNXbSVYhrUbxYxMOQsjczBPDAckll3IF+0eDGv1/lRC8kUxFm
         xaJrQlA4lWFKvNjscy3jddH4gdsOhKsAe6jr3UgkVU3IO+NAQAp2YgfQCm/sbuxDs3fL
         jl/A==
X-Gm-Message-State: AFuF++mgeUHGWhKUdJbRFm5cAPk7lftsbF1RiskDpZXhwFZsT4tOl/8r
	kdfZvdDnBs+kBhY6jObKPUd7Ew6eqvU04I3dfKnUUHVKEZfg2CzuIJIFICzYlugvFaH8482NSUr
	nFH/3+Kla21DsDF4YwaQ9KeYf54PQniv7kTUfQVALJxDexF+UVe2A/4Ep829KM5DsIGU96Wldsx
	rOTe12iHnXYnawngj2
X-Gm-Gg: AR+sD12ib+RcgPKlqn2d76z3b1LYxZWeUbRFhpz6I2FFEROpTZijnc9zXkHiwr7GQUP
	hduKknklx5jvBVk9UkKFmcXg06O52TZ40vI5CSsjWbk4s53q6hZ9oSHR8VO7KMfqTbLTsKWTHC/
	wjiq57xQEiNHHRymK3uU7eYqds9Oo+sgc9FgD6TCMD9Lwre31m5LQKFSgAHlFeSsx9+XnErZlSa
	4GgcthL6oADDEmTxa9deOUs+87afvW1uwcxFzDaZJlYV60xRMdd9V9zpWjhIbNdAw9g0EZYvdaJ
	Q3ChKdBYBrIaoYQ1eWOugQv9PnEyh0gDtJJ0YGUlYQ7bcJlYoDkLLVMvTnSsgbAGHDCpSR4NFmQ
	P1ymgmewnufEjv1aVcUg253g=
X-Received: by 2002:a17:902:fc4d:b0:2c6:9f66:d573 with SMTP id d9443c01a7336-2d7079ffd98mr112877655ad.2.1787741468047;
        Wed, 26 Aug 2026 03:51:08 -0700 (PDT)
X-Received: by 2002:a17:902:fc4d:b0:2c6:9f66:d573 with SMTP id d9443c01a7336-2d7079ffd98mr112876315ad.2.1787741467164;
        Wed, 26 Aug 2026 03:51:07 -0700 (PDT)
Received: from hu-hrai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d8bc3d2sm8927961eec.21.2026.08.26.03.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:51:06 -0700 (PDT)
From: Harsh Rai <harsh.rai@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: kvijayas@qti.qualcomm.com
Subject: [meta-multimedia][PATCH] pipewire: add pw-voiceui SVA tool patch
Date: Wed, 26 Aug 2026 16:20:52 +0530
Message-ID: <20260826105059.362705-1-harsh.rai@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-GUID: 4G7XvWETQArNheeyMFpb-sYjwCeFlJc_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5MCBTYWx0ZWRfXzV/KwsqEGqCL
 qRReBN0ANsPdes16g6TSRklWOTo5Jbh4Ym/ToQa3FHECxAXj2Qt/Njgxcgh4RVoWPdk0N70p5Ap
 QxBfDt+AWLw+neg6q+ccPIMwrJOePdo6yNrENG3lpwS+57LvP8CkMeLUQBtNKJpdD0O2ntQVdsn
 F2Sk3nqNMNg6vjC1gscpUJgojdrN8rXyAtg56dbOIKejLJUDXeo6yAkWFNhFRyvjHBnJvtnEcQm
 xOUfXg8pvZyldzZi6x9upmzvHP+SqS23RNecqjkKBNb8fh9bonHmsVipET569+IXn0kRTbHUZoQ
 pOckgL8pawaKM7KWSBSFU0tWUf9U2YetykO1DUyla76SAZwq1SxNmXNehoLCdGp4SjnVbkbnFEM
 1ej6MPRY3SoNTI16PrhAQKQsdGudqSmBc43MnWSBVmUmIuXANHbN72p6Awlhj174YNgK5uDMX6h
 greXq8N6y2vxc2EEVrA==
X-Authority-Analysis: v=2.4 cv=Y77IdBeN c=1 sm=1 tr=0 ts=6a8ec51d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=RjYCdLmSAAAA:8 a=GrTMSmPO7kLHQzT4whsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=JHabs8uMJG2gilEvFWO6:22
X-Proofpoint-ORIG-GUID: 4G7XvWETQArNheeyMFpb-sYjwCeFlJc_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5MCBTYWx0ZWRfX1bqAg2kNId03
 9kLi9HxYVGCnyOk0VzXUWCbeCSDpoJVO4k9L3PGT6BXutDAJXM4HhejMH1b5nn2UqXsiX0uVqbQ
 wFO+M6+1lWYfYbphYKqR1fBt62V7lCY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260090
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 67QAGTLJ1658496
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 11:36:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129517

From: Kiruthika Vijayasekar <kvijayas@qti.qualcomm.com>

Add the upstream PipeWire patch that introduces the pw-voiceui command-li=
ne tool for SVA voice UI control and listen support.

Signed-off-by: Kiruthika Vijayasekar <kvijayas@qti.qualcomm.com>
---
 ...pwvoiceui-SVA-voice-UI-listen-client.patch | 693 ++++++++++++++++++
 .../pipewire/pipewire_1.6.8.bb                |   1 +
 2 files changed, 694 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire/=
0003-tools-add-pwvoiceui-SVA-voice-UI-listen-client.patch

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0003-to=
ols-add-pwvoiceui-SVA-voice-UI-listen-client.patch b/meta-multimedia/reci=
pes-multimedia/pipewire/pipewire/0003-tools-add-pwvoiceui-SVA-voice-UI-li=
sten-client.patch
new file mode 100644
index 0000000000..0b6a0585a0
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0003-tools-add=
-pwvoiceui-SVA-voice-UI-listen-client.patch
@@ -0,0 +1,693 @@
+From 994c22a99421ebc4a1b81d8c03c6122b192a9035 Mon Sep 17 00:00:00 2001
+From: Kiruthika Vijayasekar <kvijayas@qti.qualcomm.com>
+Date: Wed, 26 Aug 2026 12:36:40 +0530
+Subject: [PATCH] tools: add pw-voiceui SVA voice-UI control/listen clien=
t
+
+Add a pw-voiceui command-line tool for interacting with the SVA
+(Sound Trigger / Voice Activation) voice-UI node exposed on the
+PipeWire graph by a PAL-based source plugin.
+
+The tool locates the target node by media.role=3DVoiceUI (or an
+explicit name/id), and supports:
+  - list / info: enumerate/describe the VoiceUI node
+  - set <sva-key> <value>: set a validated SVA property (confidence
+    level, sound model path, capture-requested, mode, lab settings,
+    sample rate/channels/bit width, reset, restart)
+  - set-param / send-command: send an arbitrary POD param or node
+    command, built from a JSON payload, for lower-level control
+  - listen: subscribe to the "sva.events" metadata object and print
+    sva.state updates (detection events) as they arrive
+
+Register pw-voiceui as a built tool alongside the other pw-* utilities.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/pipewire/pipe=
wire/-/merge_requests/2969]
+
+Signed-off-by: Kiruthika Vijayasekar <kvijayas@qti.qualcomm.com>
+---
+ src/tools/meson.build  |   1 +
+ src/tools/pw-voiceui.c | 643 +++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 644 insertions(+)
+ create mode 100644 src/tools/pw-voiceui.c
+
+diff --git a/src/tools/meson.build b/src/tools/meson.build
+index 2def79257..0e597cc11 100644
+--- a/src/tools/meson.build
++++ b/src/tools/meson.build
+@@ -9,6 +9,7 @@ tools_sources =3D [
+   [ 'pw-metadata', [ 'pw-metadata.c' ] ],
+   [ 'pw-loopback', [ 'pw-loopback.c' ] ],
+   [ 'pw-link', [ 'pw-link.c' ] ],
++  [ 'pw-voiceui', [ 'pw-voiceui.c' ] ],
+ ]
+=20
+ foreach t : tools_sources
+diff --git a/src/tools/pw-voiceui.c b/src/tools/pw-voiceui.c
+new file mode 100644
+index 000000000..a76e6bbdd
+--- /dev/null
++++ b/src/tools/pw-voiceui.c
+@@ -0,0 +1,643 @@
++#include "config.h"
++
++#include <errno.h>
++#include <getopt.h>
++#include <stdbool.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++
++#include <spa/debug/file.h>
++#include <spa/debug/pod.h>
++#include <spa/debug/types.h>
++#include <spa/param/props.h>
++#include <spa/pod/dynamic.h>
++#include <spa/utils/json-pod.h>
++#include <spa/utils/keys.h>
++#include <spa/utils/result.h>
++#include <spa/utils/string.h>
++
++#include <pipewire/pipewire.h>
++#include <pipewire/extensions/metadata.h>
++
++#define DEFAULT_TARGET_ROLE "VoiceUI"
++#define DEFAULT_TARGET_NAME "pal_source_voice_ui"
++
++struct global {
++	struct spa_list link;
++	uint32_t id;
++	uint32_t permissions;
++	uint32_t version;
++	char *type;
++	struct pw_properties *props;
++};
++
++struct data {
++	struct pw_main_loop *loop;
++	struct pw_context *context;
++	struct pw_core *core;
++	struct pw_registry *registry;
++	struct pw_node *node;
++
++	struct spa_hook core_listener;
++	struct spa_hook registry_listener;
++	struct spa_hook node_listener;
++
++	struct spa_list globals;
++
++	const char *target_name;
++	const char *target_role;
++	uint32_t target_id;
++	bool have_target_id;
++	bool list;
++	bool info;
++	bool verbose;
++
++	const char *command;
++	const char *param_id;
++	const char *json;
++	const char *sva_key;
++	const char *sva_value;
++
++	struct global *target;
++	int pending;
++	int exit_code;
++	bool listen;
++	bool listening;
++	struct pw_metadata *metadata;
++	struct spa_hook metadata_listener;
++	uint32_t sva_node_id;
++};
++
++static void usage(const char *name)
++{
++	fprintf(stderr,
++		"Usage:\n"
++		"  %s [options] list\n"
++		"  %s [options] info\n"
++		"  %s [options] listen\n"
++		"  %s [options] set <sva-key> <value>\n"
++		"  %s [options] set-param <param-id> <param-json>\n"
++		"  %s [options] send-command <command-id> <command-json>\n"
++		"\n"
++		"Options:\n"
++		"  -n, --name <node-name>     Target node.name (default: %s)\n"
++		"  -r, --role <media-role>    Target media.role (default: %s)\n"
++		"  -i, --id <node-id>         Target explicit PipeWire node id\n"
++		"  -v, --verbose              Print the POD being sent\n"
++		"  -h, --help                 Show this help\n",
++		name, name, name, name, name, name, DEFAULT_TARGET_NAME, DEFAULT_TARG=
ET_ROLE);
++}
++
++static void global_free(struct global *global)
++{
++	if (global =3D=3D NULL)
++		return;
++	spa_list_remove(&global->link);
++	pw_properties_free(global->props);
++	free(global->type);
++	free(global);
++}
++
++static const char *global_prop(struct global *global, const char *key)
++{
++	return global->props ? pw_properties_get(global->props, key) : NULL;
++}
++
++static bool global_is_voiceui_node(struct data *data, struct global *gl=
obal)
++{
++	const char *name, *role, *media_class;
++
++	if (!spa_streq(global->type, PW_TYPE_INTERFACE_Node))
++		return false;
++
++	if (data->have_target_id)
++		return global->id =3D=3D data->target_id;
++
++	name =3D global_prop(global, PW_KEY_NODE_NAME);
++	role =3D global_prop(global, PW_KEY_MEDIA_ROLE);
++	media_class =3D global_prop(global, PW_KEY_MEDIA_CLASS);
++
++	if (data->target_name && name && spa_streq(name, data->target_name))
++		return true;
++
++	return role && spa_streq(role, data->target_role) &&
++		media_class && strstr(media_class, "Audio/Source") !=3D NULL;
++}
++
++
++static bool parse_bool_value(const char *value, bool *result)
++{
++	if (spa_streq(value, "true") || spa_streq(value, "1") || spa_streq(val=
ue, "yes")) {
++		*result =3D true;
++		return true;
++	}
++	if (spa_streq(value, "false") || spa_streq(value, "0") || spa_streq(va=
lue, "no")) {
++		*result =3D false;
++		return true;
++	}
++	return false;
++}
++
++static const char *phase2_sva_key(const char *key)
++{
++	if (spa_streq(key, "sva.model.path"))
++		return "sva.sound.model.path";
++	return key;
++}
++
++static bool validate_sva_property(const char *key, const char *value)
++{
++	char *end;
++	long level;
++	bool bool_value;
++	const char *wire_key =3D phase2_sva_key(key);
++
++	if (spa_streq(wire_key, "sva.confidence.level")) {
++		errno =3D 0;
++		level =3D strtol(value, &end, 10);
++		if (errno !=3D 0 || *end !=3D '\0' || level < 0 || level > 100) {
++			fprintf(stderr, "sva.confidence.level must be an integer in range 0.=
.100\n");
++			return false;
++		}
++		return true;
++	}
++	if (spa_streq(wire_key, "sva.sound.model.path")) {
++		if (value[0] =3D=3D '\0') {
++			fprintf(stderr, "sva.model.path must not be empty\n");
++			return false;
++		}
++		return true;
++	}
++	if (spa_streq(wire_key, "sva.capture.requested")) {
++		if (!parse_bool_value(value, &bool_value)) {
++			fprintf(stderr, "sva.capture.requested must be true/false, yes/no, o=
r 1/0\n");
++			return false;
++		}
++		return true;
++	}
++	if (spa_streq(wire_key, "sva.mode")) {
++		if (!spa_streq(value, "LPI") && !spa_streq(value, "NLPI")) {
++			fprintf(stderr, "sva.mode must be LPI or NLPI for phase2 plugin comp=
atibility\n");
++			return false;
++		}
++		return true;
++	}
++	if (spa_streq(wire_key, "sva.lab.enabled")) {
++		if (!parse_bool_value(value, &bool_value)) {
++			fprintf(stderr, "sva.lab.enabled must be true/false, yes/no, or 1/0\=
n");
++			return false;
++		}
++		return true;
++	}
++	if (spa_streq(wire_key, "sva.lab.duration") ||
++			spa_streq(wire_key, "sva.sample.rate") ||
++			spa_streq(wire_key, "sva.channels") ||
++			spa_streq(wire_key, "sva.bit.width")) {
++		errno =3D 0;
++		level =3D strtol(value, &end, 10);
++		if (errno !=3D 0 || *end !=3D '\0' || level < 0) {
++			fprintf(stderr, "%s must be a non-negative integer\n", key);
++			return false;
++		}
++		return true;
++	}
++	if (spa_streq(wire_key, "sva.reset")) {
++		if (!parse_bool_value(value, &bool_value)) {
++			fprintf(stderr, "sva.reset must be true/false\n");
++			return false;
++		}
++		return true;    /* =E2=86=90 move return true INSIDE the if block */
++	}
++	if (spa_streq(wire_key, "sva.restart")) {
++		if (!parse_bool_value(value, &bool_value)) {
++			fprintf(stderr, "sva.restart must be true/false\n");
++			return false;
++		}
++		return true;
++	}
++	/* Now this is reachable for unknown keys */
++	fprintf(stderr, "unsupported SVA key '%s'\n", key);
++	fprintf(stderr, "supported keys: sva.confidence.level, sva.model.path,=
 "
++			"sva.sound.model.path, sva.capture.requested, sva.mode, "
++			"sva.lab.enabled, sva.lab.duration, sva.sample.rate, "
++			"sva.channels, sva.bit.width, sva.reset, sva.restart\n");
++	return false;
++}
++
++static bool build_sva_props_pod(struct spa_pod_builder *builder, const =
char *key,
++		const char *value, struct spa_pod **pod)
++{
++	struct spa_pod_frame frame[2];
++
++	spa_pod_builder_push_object(builder, &frame[0], SPA_TYPE_OBJECT_Props,=
 SPA_PARAM_Props);
++	spa_pod_builder_prop(builder, SPA_PROP_params, 0);
++	spa_pod_builder_push_struct(builder, &frame[1]);
++	key =3D phase2_sva_key(key);
++	spa_pod_builder_string(builder, key);
++
++	if (spa_streq(key, "sva.confidence.level") ||
++			spa_streq(key, "sva.lab.duration") ||
++			spa_streq(key, "sva.sample.rate") ||
++			spa_streq(key, "sva.channels") ||
++			spa_streq(key, "sva.bit.width"))
++		spa_pod_builder_int(builder, atoi(value));
++	else if (spa_streq(key, "sva.capture.requested") ||
++			spa_streq(key, "sva.lab.enabled")) {
++		bool bool_value;
++		parse_bool_value(value, &bool_value);
++		spa_pod_builder_bool(builder, bool_value);
++	} else if (spa_streq(key, "sva.reset") || spa_streq(key, "sva.restart"=
)) {
++		bool bool_value;
++		parse_bool_value(value, &bool_value);
++		spa_pod_builder_bool(builder, bool_value);
++	}else {
++		spa_pod_builder_string(builder, value);
++	}
++
++	spa_pod_builder_pop(builder, &frame[1]);
++	*pod =3D spa_pod_builder_pop(builder, &frame[0]);
++	return *pod !=3D NULL;
++}
++
++static void print_global(struct global *global)
++{
++	const char *name =3D global_prop(global, PW_KEY_NODE_NAME);
++	const char *role =3D global_prop(global, PW_KEY_MEDIA_ROLE);
++	const char *media_class =3D global_prop(global, PW_KEY_MEDIA_CLASS);
++
++	printf("id %u", global->id);
++	if (name)
++		printf(", node.name=3D%s", name);
++	if (media_class)
++		printf(", media.class=3D%s", media_class);
++	if (role)
++		printf(", media.role=3D%s", role);
++	printf("\n");
++}
++
++
++
++static void done(void *user_data, uint32_t id, int seq)
++{
++	struct data *data =3D user_data;
++
++	if (data->listening)
++		return;
++
++	if (data->pending =3D=3D seq)
++		pw_main_loop_quit(data->loop);
++}
++
++static void core_error(void *user_data, uint32_t id, int seq, int res, =
const char *message)
++{
++	struct data *data =3D user_data;
++
++	fprintf(stderr, "PipeWire error id:%u seq:%d res:%d (%s): %s\n",
++		id, seq, res, spa_strerror(res), message);
++
++	if (data->listening)
++		return;
++
++	data->exit_code =3D EXIT_FAILURE;
++	if (seq =3D=3D data->pending || data->pending =3D=3D 0)
++		pw_main_loop_quit(data->loop);
++}
++
++static const struct pw_core_events core_events =3D {
++	PW_VERSION_CORE_EVENTS,
++	.done =3D done,
++	.error =3D core_error,
++};
++
++static int metadata_property(void *user_data, uint32_t subject,
++                             const char *key, const char *type, const c=
har *value)
++{
++    struct data *data =3D user_data;
++    if (key =3D=3D NULL || !spa_streq(key, "sva.state") || value =3D=3D=
 NULL)
++        return 0;
++    /* Filter by our node ID */
++    if (data->sva_node_id !=3D 0 && subject !=3D data->sva_node_id)
++        return 0;
++    printf("\n-- SVA State Update (Event) --\n");
++    printf("  Payload: %s\n", value);
++    printf("------------------------------\n");
++    return 0;
++}
++
++static const struct pw_metadata_events metadata_events =3D {
++    PW_VERSION_METADATA_EVENTS,
++    .property =3D metadata_property,
++};
++
++
++static void registry_global(void *user_data, uint32_t id, uint32_t perm=
issions,
++		const char *type, uint32_t version, const struct spa_dict *props)
++{
++	struct data *data =3D user_data;
++	struct global *global;
++
++	global =3D calloc(1, sizeof(*global));
++	if (global =3D=3D NULL) {
++		data->exit_code =3D EXIT_FAILURE;
++		pw_main_loop_quit(data->loop);
++		return;
++	}
++
++	global->id =3D id;
++	global->permissions =3D permissions;
++	global->version =3D version;
++	global->type =3D strdup(type);
++	global->props =3D props ? pw_properties_new_dict(props) : NULL;
++	spa_list_append(&data->globals, &global->link);
++
++	if (global_is_voiceui_node(data, global)) {
++		if (data->list)
++			print_global(global);
++		if (data->target =3D=3D NULL)
++			data->target =3D global;
++	}
++
++	if (data->listen && spa_streq(type, PW_TYPE_INTERFACE_Metadata)) {
++		const char *name =3D props ? spa_dict_lookup(props, PW_KEY_METADATA_N=
AME) : NULL;
++		if (name && spa_streq(name, "sva.events") && data->metadata =3D=3D NU=
LL) {
++			data->metadata =3D pw_registry_bind(data->registry, id,
++				PW_TYPE_INTERFACE_Metadata, PW_VERSION_METADATA, 0);
++			if (data->metadata) {
++				pw_metadata_add_listener(data->metadata, &data->metadata_listener, =
&metadata_events, data);
++				printf("Connected to SVA Event Bus (id %u)\n", id);
++			}
++		}
++	}
++}
++
++static void registry_global_remove(void *user_data, uint32_t id)
++{
++	struct data *data =3D user_data;
++	struct global *global, *tmp;
++
++	spa_list_for_each_safe(global, tmp, &data->globals, link) {
++		if (global->id =3D=3D id) {
++			if (data->target =3D=3D global)
++				data->target =3D NULL;
++			global_free(global);
++			return;
++		}
++	}
++}
++
++static const struct pw_registry_events registry_events =3D {
++	PW_VERSION_REGISTRY_EVENTS,
++	.global =3D registry_global,
++	.global_remove =3D registry_global_remove,
++};
++
++static bool parse_pod(const char *type_name, const char *json, const st=
ruct spa_type_info *types,
++		struct spa_pod_dynamic_builder *builder, struct spa_pod **pod)
++{
++	const struct spa_type_info *type_info;
++	struct spa_error_location loc;
++	int res;
++
++	type_info =3D spa_debug_type_find_short(types, type_name);
++	if (type_info =3D=3D NULL) {
++		fprintf(stderr, "unknown type '%s'\n", type_name);
++		return false;
++	}
++
++	res =3D spa_json_to_pod_checked(&builder->b, 0, type_info, json, strle=
n(json), &loc);
++	if (res < 0) {
++		if (loc.line !=3D 0)
++			spa_debug_file_error_location(stderr, &loc,
++					"syntax error in json '%s': %s", json, loc.reason);
++		fprintf(stderr, "can't make POD for '%s': %s\n", type_name,
++				loc.reason ? loc.reason : spa_strerror(res));
++		return false;
++	}
++
++	*pod =3D spa_pod_builder_deref(&builder->b, 0);
++	if (*pod =3D=3D NULL) {
++		fprintf(stderr, "can't dereference built POD\n");
++		return false;
++	}
++	return true;
++}
++
++static bool bind_target(struct data *data)
++{
++	if (data->target =3D=3D NULL) {
++		fprintf(stderr, "VoiceUI node not found\n");
++		return false;
++	}
++
++	data->node =3D pw_registry_bind(data->registry, data->target->id,
++			PW_TYPE_INTERFACE_Node, PW_VERSION_NODE, 0);
++	if (data->node =3D=3D NULL) {
++		fprintf(stderr, "can't bind VoiceUI node id:%u: %m\n", data->target->=
id);
++		return false;
++	}
++	return true;
++}
++
++static bool run_action(struct data *data)
++{
++	uint8_t buffer[1024];
++	spa_auto(spa_pod_dynamic_builder) builder =3D { 0 };
++	struct spa_pod *pod;
++
++	if (data->list)
++		return true;
++
++	if (data->target =3D=3D NULL) {
++		fprintf(stderr, "VoiceUI node not found\n");
++		return false;
++	}
++
++	if (data->info) {
++		print_global(data->target);
++		return true;
++	}
++
++	if (!bind_target(data))
++		return false;
++
++	if (data->listen) {
++		data->sva_node_id =3D data->target->id;
++		printf("Listening for SVA events on node %u (Ctrl+C to quit)...\n", d=
ata->sva_node_id);
++		data->listening =3D true;
++		pw_main_loop_run(data->loop);
++		return data->exit_code =3D=3D EXIT_SUCCESS;
++	}
++
++	spa_pod_dynamic_builder_init(&builder, buffer, sizeof(buffer), 4096);
++
++	if (spa_streq(data->command, "set")) {
++		if (!build_sva_props_pod(&builder.b, data->sva_key, data->sva_value, =
&pod)) {
++			fprintf(stderr, "can't build SVA Props POD\n");
++			return false;
++		}
++		if (data->verbose)
++			spa_debug_pod(0, NULL, pod);
++		pw_node_set_param(data->node, SPA_PARAM_Props, 0, pod);
++	} else if (spa_streq(data->command, "set-param")) {
++		const struct spa_type_info *type_info;
++
++		if (!parse_pod(data->param_id, data->json, spa_type_param, &builder, =
&pod))
++			return false;
++		type_info =3D spa_debug_type_find_short(spa_type_param, data->param_i=
d);
++		if (data->verbose)
++			spa_debug_pod(0, NULL, pod);
++		pw_node_set_param(data->node, type_info->type, 0, pod);
++	} else if (spa_streq(data->command, "send-command")) {
++		if (!parse_pod(data->param_id, data->json, spa_type_node_command_id, =
&builder, &pod))
++			return false;
++		if (data->verbose)
++			spa_debug_pod(0, NULL, pod);
++		pw_node_send_command(data->node, (struct spa_command *)pod);
++	} else {
++		fprintf(stderr, "unknown command '%s'\n", data->command);
++		return false;
++	}
++
++	data->pending =3D pw_core_sync(data->core, PW_ID_CORE, 0);
++	pw_main_loop_run(data->loop);
++	return data->exit_code =3D=3D EXIT_SUCCESS;
++}
++
++int main(int argc, char *argv[])
++{
++	struct data data =3D { 0 };
++	struct global *global, *tmp;
++	int opt;
++	static const struct option long_options[] =3D {
++		{ "name", required_argument, NULL, 'n' },
++		{ "role", required_argument, NULL, 'r' },
++		{ "id", required_argument, NULL, 'i' },
++		{ "verbose", no_argument, NULL, 'v' },
++		{ "help", no_argument, NULL, 'h' },
++		{ NULL, 0, NULL, 0 }
++	};
++
++	data.target_name =3D DEFAULT_TARGET_NAME;
++	data.target_role =3D DEFAULT_TARGET_ROLE;
++	data.exit_code =3D EXIT_SUCCESS;
++	spa_list_init(&data.globals);
++
++	while ((opt =3D getopt_long(argc, argv, "n:r:i:vh", long_options, NULL=
)) !=3D -1) {
++		char *end;
++		switch (opt) {
++		case 'n':
++			data.target_name =3D optarg;
++			break;
++		case 'r':
++			data.target_role =3D optarg;
++			break;
++		case 'i':
++			data.target_id =3D strtoul(optarg, &end, 10);
++			if (*end !=3D '\0') {
++				fprintf(stderr, "invalid node id '%s'\n", optarg);
++				return EXIT_FAILURE;
++			}
++			data.have_target_id =3D true;
++			break;
++		case 'v':
++			data.verbose =3D true;
++			break;
++		case 'h':
++			usage(argv[0]);
++			return EXIT_SUCCESS;
++		default:
++			usage(argv[0]);
++			return EXIT_FAILURE;
++		}
++	}
++
++	if (optind >=3D argc) {
++		usage(argv[0]);
++		return EXIT_FAILURE;
++	}
++
++	data.command =3D argv[optind++];
++	if (spa_streq(data.command, "list")) {
++		data.list =3D true;
++	} else if (spa_streq(data.command, "info")) {
++		data.info =3D true;
++	} else if (spa_streq(data.command, "set")) {
++		if (optind + 2 !=3D argc) {
++			usage(argv[0]);
++			return EXIT_FAILURE;
++		}
++		data.sva_key =3D argv[optind++];
++		data.sva_value =3D argv[optind++];
++		if (!validate_sva_property(data.sva_key, data.sva_value))
++			return EXIT_FAILURE;
++	} else if (spa_streq(data.command, "set-param") ||
++			spa_streq(data.command, "send-command")) {
++		if (optind + 2 !=3D argc) {
++			usage(argv[0]);
++			return EXIT_FAILURE;
++		}
++		data.param_id =3D argv[optind++];
++		data.json =3D argv[optind++];
++	} else if (spa_streq(data.command, "listen")) {
++		data.listen =3D true;
++	} else {
++		usage(argv[0]);
++		return EXIT_FAILURE;
++	}
++
++	pw_init(&argc, &argv);
++
++	data.loop =3D pw_main_loop_new(NULL);
++	if (data.loop =3D=3D NULL) {
++		fprintf(stderr, "can't create main loop: %m\n");
++		return EXIT_FAILURE;
++	}
++
++	data.context =3D pw_context_new(pw_main_loop_get_loop(data.loop), NULL=
, 0);
++	if (data.context =3D=3D NULL) {
++		fprintf(stderr, "can't create context: %m\n");
++		data.exit_code =3D EXIT_FAILURE;
++		goto out;
++	}
++
++	data.core =3D pw_context_connect(data.context, NULL, 0);
++	if (data.core =3D=3D NULL) {
++		fprintf(stderr, "can't connect: %m\n");
++		data.exit_code =3D EXIT_FAILURE;
++		goto out;
++	}
++	pw_core_add_listener(data.core, &data.core_listener, &core_events, &da=
ta);
++
++	data.registry =3D pw_core_get_registry(data.core, PW_VERSION_REGISTRY,=
 0);
++	if (data.registry =3D=3D NULL) {
++		fprintf(stderr, "can't get registry: %m\n");
++		data.exit_code =3D EXIT_FAILURE;
++		goto out;
++	}
++	pw_registry_add_listener(data.registry, &data.registry_listener, &regi=
stry_events, &data);
++
++	data.pending =3D pw_core_sync(data.core, PW_ID_CORE, 0);
++	pw_main_loop_run(data.loop);
++
++	if (!run_action(&data))
++		data.exit_code =3D EXIT_FAILURE;
++
++out:
++	if (data.metadata)
++		pw_proxy_destroy((struct pw_proxy *)data.metadata);
++	if (data.node)
++		pw_proxy_destroy((struct pw_proxy *)data.node);
++	if (data.registry)
++		pw_proxy_destroy((struct pw_proxy *)data.registry);
++	if (data.core)
++		pw_core_disconnect(data.core);
++	if (data.context)
++		pw_context_destroy(data.context);
++	if (data.loop)
++		pw_main_loop_destroy(data.loop);
++	spa_list_for_each_safe(global, tmp, &data.globals, link)
++		global_free(global);
++	pw_deinit();
++	return data.exit_code;
++}
+--=20
\ No newline at end of file
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.8.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.8.bb
index a3bd88cc7d..9743eeeab7 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.8.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.8.bb
@@ -17,6 +17,7 @@ BRANCH =3D "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
${BRANCH};protocol=3Dhttps;tag=3D${PV}"
 SRC_URI +=3D "file://0001-pipewire-compress-offload.patch"
 SRC_URI +=3D "file://0002-spa-plugins-alsa-acp-compat.h-p-is-already-con=
st-do-.patch"
+SRC_URI +=3D "file://0003-tools-add-pwvoiceui-SVA-voice-UI-listen-client=
.patch"
=20
 inherit meson pkgconfig systemd gettext useradd
=20
--=20
2.43.0


