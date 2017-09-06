Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B23C877B95
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 19:29:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v86JTYl6027094
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Sep 2017 12:29:34 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 12:29:33 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Sep 2017 14:23:01 -0500
Message-ID: <1504725809-12825-4-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/31] openipmi: Move to meta-networking requires net-snmp
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
X-List-Received-Date: Wed, 06 Sep 2017 19:29:32 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 ...ame-struct-parameter-printf-for-namespace.patch | 618 +++++++++++++++++++++
 .../files/do-not-install-pyc-and-pyo.patch         |  25 +
 .../fix-symlink-install-error-in-cmdlang.patch     |  22 +
 .../openipmi/files/include_sys_types.patch         |  17 +
 .../files/ipmi-init-fix-the-arguments.patch        |  41 ++
 .../recipes-support/openipmi/files/ipmi.service    |  12 +
 .../recipes-support/openipmi/files/openipmi-helper | 512 +++++++++++++++++
 .../files/openipmi-no-openipmigui-man.patch        |  26 +
 ...openipmi-remove-host-path-from-la_LDFLAGS.patch |  50 ++
 .../recipes-support/openipmi/openipmi_2.0.24.bb    | 110 ++++
 ...ame-struct-parameter-printf-for-namespace.patch | 618 ---------------------
 .../files/do-not-install-pyc-and-pyo.patch         |  25 -
 .../fix-symlink-install-error-in-cmdlang.patch     |  22 -
 .../openipmi/files/include_sys_types.patch         |  17 -
 .../files/ipmi-init-fix-the-arguments.patch        |  41 --
 .../recipes-support/openipmi/files/ipmi.service    |  12 -
 .../recipes-support/openipmi/files/openipmi-helper | 512 -----------------
 .../files/openipmi-no-openipmigui-man.patch        |  26 -
 ...openipmi-remove-host-path-from-la_LDFLAGS.patch |  50 --
 .../recipes-support/openipmi/openipmi_2.0.24.bb    | 110 ----
 20 files changed, 1433 insertions(+), 1433 deletions(-)
 create mode 100644 meta-networking/recipes-support/openipmi/files/0001-lanserv-Rename-struct-parameter-printf-for-namespace.patch
 create mode 100644 meta-networking/recipes-support/openipmi/files/do-not-install-pyc-and-pyo.patch
 create mode 100644 meta-networking/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch
 create mode 100644 meta-networking/recipes-support/openipmi/files/include_sys_types.patch
 create mode 100644 meta-networking/recipes-support/openipmi/files/ipmi-init-fix-the-arguments.patch
 create mode 100644 meta-networking/recipes-support/openipmi/files/ipmi.service
 create mode 100755 meta-networking/recipes-support/openipmi/files/openipmi-helper
 create mode 100644 meta-networking/recipes-support/openipmi/files/openipmi-no-openipmigui-man.patch
 create mode 100644 meta-networking/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
 create mode 100644 meta-networking/recipes-support/openipmi/openipmi_2.0.24.bb
 delete mode 100644 meta-oe/recipes-support/openipmi/files/0001-lanserv-Rename-struct-parameter-printf-for-namespace.patch
 delete mode 100644 meta-oe/recipes-support/openipmi/files/do-not-install-pyc-and-pyo.patch
 delete mode 100644 meta-oe/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch
 delete mode 100644 meta-oe/recipes-support/openipmi/files/include_sys_types.patch
 delete mode 100644 meta-oe/recipes-support/openipmi/files/ipmi-init-fix-the-arguments.patch
 delete mode 100644 meta-oe/recipes-support/openipmi/files/ipmi.service
 delete mode 100755 meta-oe/recipes-support/openipmi/files/openipmi-helper
 delete mode 100644 meta-oe/recipes-support/openipmi/files/openipmi-no-openipmigui-man.patch
 delete mode 100644 meta-oe/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
 delete mode 100644 meta-oe/recipes-support/openipmi/openipmi_2.0.24.bb

diff --git a/meta-networking/recipes-support/openipmi/files/0001-lanserv-Rename-struct-parameter-printf-for-namespace.patch b/meta-networking/recipes-support/openipmi/files/0001-lanserv-Rename-struct-parameter-printf-for-namespace.patch
new file mode 100644
index 0000000..25057fb
--- /dev/null
+++ b/meta-networking/recipes-support/openipmi/files/0001-lanserv-Rename-struct-parameter-printf-for-namespace.patch
@@ -0,0 +1,618 @@
+From 8b51a6bf5a4829d8add535a098c0c06a049a9958 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 26 Aug 2017 22:50:57 -0700
+Subject: [PATCH] lanserv: Rename struct parameter printf for namespace
+ collision
+
+This comes to fore when we use hardening flags where printf
+is treated as macro and gets replaced with printf_chk
+
+Fixes errors like
+
+error: no member named '__printf_chk' in 'struct emu_out_s'
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lanserv/OpenIPMI/serv.h |   2 +-
+ lanserv/emu_cmd.c       | 132 ++++++++++++++++++++++++------------------------
+ lanserv/ipmi_sim.c      |  10 ++--
+ 3 files changed, 72 insertions(+), 72 deletions(-)
+
+diff --git a/lanserv/OpenIPMI/serv.h b/lanserv/OpenIPMI/serv.h
+index d12d63a..8555c85 100644
+--- a/lanserv/OpenIPMI/serv.h
++++ b/lanserv/OpenIPMI/serv.h
+@@ -522,7 +522,7 @@ uint8_t ipmb_checksum(uint8_t *data, int size, uint8_t start);
+ typedef struct emu_data_s emu_data_t;
+ typedef struct emu_out_s
+ {
+-    void (*printf)(struct emu_out_s *out, char *format, ...);
++    void (*eprintf)(struct emu_out_s *out, char *format, ...);
+     void *data;
+ } emu_out_t;
+ 
+diff --git a/lanserv/emu_cmd.c b/lanserv/emu_cmd.c
+index ca44032..54b6f7b 100644
+--- a/lanserv/emu_cmd.c
++++ b/lanserv/emu_cmd.c
+@@ -76,7 +76,7 @@ emu_get_uchar(emu_out_t *out, char **toks, unsigned char *val, char *errstr,
+ 	if (empty_ok)
+ 	    return ENOSPC;
+ 	if (errstr)
+-	    out->printf(out, "**No %s given\n", errstr);
++	    out->eprintf(out, "**No %s given\n", errstr);
+ 	return EINVAL;
+     }
+     if (str[0] == '\'') {
+@@ -86,7 +86,7 @@ emu_get_uchar(emu_out_t *out, char **toks, unsigned char *val, char *errstr,
+     *val = strtoul(str, &tmpstr, 0);
+     if (*tmpstr != '\0') {
+ 	if (errstr)
+-	    out->printf(out, "**Invalid %s given\n", errstr);
++	    out->eprintf(out, "**Invalid %s given\n", errstr);
+ 	return EINVAL;
+     }
+ 
+@@ -108,7 +108,7 @@ emu_get_uchar_with_vals(emu_out_t *out, char **toks,
+ 	if (empty_ok)
+ 	    return ENOSPC;
+ 	if (errstr)
+-	    out->printf(out, "**No %s given\n", errstr);
++	    out->eprintf(out, "**No %s given\n", errstr);
+ 	return EINVAL;
+     }
+     if (str[0] == '\'') {
+@@ -131,7 +131,7 @@ emu_get_uchar_with_vals(emu_out_t *out, char **toks,
+     *val = strtoul(str, &tmpstr, 0);
+     if (*tmpstr != '\0') {
+ 	if (errstr)
+-	    out->printf(out, "**Invalid %s given\n", errstr);
++	    out->eprintf(out, "**Invalid %s given\n", errstr);
+ 	return EINVAL;
+     }
+  out:
+@@ -150,12 +150,12 @@ emu_get_bitmask(emu_out_t *out, char **toks, uint16_t *val, char *errstr,
+ 	if (empty_ok)
+ 	    return ENOSPC;
+ 	if (errstr)
+-	    out->printf(out, "**No %s given\n", errstr);
++	    out->eprintf(out, "**No %s given\n", errstr);
+ 	return EINVAL;
+     }
+     if (strlen(str) != size) {
+ 	if (errstr)
+-	    out->printf(out, "**invalid number of bits in %s\n", errstr);
++	    out->eprintf(out, "**invalid number of bits in %s\n", errstr);
+ 	return EINVAL;
+     }
+     *val = 0;
+@@ -166,7 +166,7 @@ emu_get_bitmask(emu_out_t *out, char **toks, uint16_t *val, char *errstr,
+ 	    *val |= 1 << i;
+ 	} else {
+ 	    if (errstr)
+-		out->printf(out, "**Invalid bit value '%c' in %s\n", str[j],
++		out->eprintf(out, "**Invalid bit value '%c' in %s\n", str[j],
+ 			    errstr);
+ 	    return EINVAL;
+ 	}
+@@ -184,13 +184,13 @@ emu_get_uint(emu_out_t *out, char **toks, unsigned int *val, char *errstr)
+     str = mystrtok(NULL, " \t\n", toks);
+     if (!str) {
+ 	if (errstr)
+-	    out->printf(out, "**No %s given\n", errstr);
++	    out->eprintf(out, "**No %s given\n", errstr);
+ 	return EINVAL;
+     }
+     *val = strtoul(str, &tmpstr, 0);
+     if (*tmpstr != '\0') {
+ 	if (errstr)
+-	    out->printf(out, "**Invalid %s given\n", errstr);
++	    out->eprintf(out, "**Invalid %s given\n", errstr);
+ 	return EINVAL;
+     }
+ 
+@@ -206,7 +206,7 @@ emu_get_bytes(emu_out_t *out, char **tokptr, unsigned char *data, char *errstr,
+ 
+     if (!tok) {
+ 	if (errstr)
+-	    out->printf(out, "**No %s given\n", errstr);
++	    out->eprintf(out, "**No %s given\n", errstr);
+ 	return EINVAL;
+     }
+     if (*tok == '"') {
+@@ -215,7 +215,7 @@ emu_get_bytes(emu_out_t *out, char **tokptr, unsigned char *data, char *errstr,
+ 	tok++;
+ 	end = strlen(tok) - 1;
+ 	if (tok[end] != '"') {
+-	  out->printf(out, "**ASCII %s doesn't end in '\"'", errstr);
++	  out->eprintf(out, "**ASCII %s doesn't end in '\"'", errstr);
+ 	    return EINVAL;
+ 	}
+ 	if (end > (len - 1))
+@@ -228,7 +228,7 @@ emu_get_bytes(emu_out_t *out, char **tokptr, unsigned char *data, char *errstr,
+ 	char         c[3];
+ 	/* HEX pw */
+ 	if (strlen(tok) != 32) {
+-	    out->printf(out, "**HEX %s not 32 HEX characters long", errstr);
++	    out->eprintf(out, "**HEX %s not 32 HEX characters long", errstr);
+ 	    return EINVAL;
+ 	}
+ 	c[2] = '\0';
+@@ -239,7 +239,7 @@ emu_get_bytes(emu_out_t *out, char **tokptr, unsigned char *data, char *errstr,
+ 	    tok++;
+ 	    data[i] = strtoul(c, &end, 16);
+ 	    if (*end != '\0') {
+-		out->printf(out, "**Invalid HEX character in %s", errstr);
++		out->eprintf(out, "**Invalid HEX character in %s", errstr);
+ 		return -1;
+ 	    }
+ 	}
+@@ -263,12 +263,12 @@ read_command_file(emu_out_t *out, emu_data_t *emu, const char *command_file)
+ 
+ 	buffer = malloc(INPUT_BUFFER_SIZE);
+ 	if (!buffer) {
+-	    out->printf(out, "Could not allocate buffer memory\n");
++	    out->eprintf(out, "Could not allocate buffer memory\n");
+ 	    rv = ENOMEM;
+ 	    goto out;
+ 	}
+ 	while (fgets(buffer+pos, INPUT_BUFFER_SIZE-pos, f)) {
+-	    out->printf(out, "%s", buffer+pos);
++	    out->eprintf(out, "%s", buffer+pos);
+ 	    if (buffer[pos] == '#')
+ 		continue;
+ 	    pos = strlen(buffer);
+@@ -318,7 +318,7 @@ sel_enable(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+ 
+     rv = ipmi_mc_enable_sel(mc, max_records, flags);
+     if (rv)
+-	out->printf(out, "**Unable to enable sel, error 0x%x\n", rv);
++	out->eprintf(out, "**Unable to enable sel, error 0x%x\n", rv);
+     return rv;
+ }
+ 
+@@ -343,9 +343,9 @@ sel_add(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+ 
+     rv = ipmi_mc_add_to_sel(mc, record_type, data, &r);
+     if (rv)
+-	out->printf(out, "**Unable to add to sel, error 0x%x\n", rv);
++	out->eprintf(out, "**Unable to add to sel, error 0x%x\n", rv);
+     else
+-	out->printf(out, "Added record %d\n", r);
++	out->eprintf(out, "Added record %d\n", r);
+     return rv;
+ }
+ 
+@@ -361,14 +361,14 @@ main_sdr_add(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+ 	if (rv == ENOSPC)
+ 	    break;
+ 	if (rv) {
+-	    out->printf(out, "**Error 0x%x in data byte %d\n", rv, i);
++	    out->eprintf(out, "**Error 0x%x in data byte %d\n", rv, i);
+ 	    return rv;
+ 	}
+     }
+ 
+     rv = ipmi_mc_add_main_sdr(mc, data, i);
+     if (rv)
+-	out->printf(out, "**Unable to add to sdr, error 0x%x\n", rv);
++	out->eprintf(out, "**Unable to add to sdr, error 0x%x\n", rv);
+     return rv;
+ }
+ 
+@@ -389,14 +389,14 @@ device_sdr_add(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+ 	if (rv == ENOSPC)
+ 	    break;
+ 	if (rv) {
+-	    out->printf(out, "**Error 0x%x in data byte %d\n", rv, i);
++	    out->eprintf(out, "**Error 0x%x in data byte %d\n", rv, i);
+ 	    return rv;
+ 	}
+     }
+ 
+     rv = ipmi_mc_add_device_sdr(mc, lun, data, i);
+     if (rv)
+-	out->printf(out, "**Unable to add to sdr, error 0x%x\n", rv);
++	out->eprintf(out, "**Unable to add to sdr, error 0x%x\n", rv);
+     return rv;
+ }
+ 
+@@ -439,7 +439,7 @@ sensor_add(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+     while (tok) {
+ 	if (strcmp(tok, "poll") == 0) {
+ 	    if (handler) {
+-		out->printf(out, "**poll given twice in sensor\n", tok);
++		out->eprintf(out, "**poll given twice in sensor\n", tok);
+ 		return -1;
+ 	    }
+ 
+@@ -449,27 +449,27 @@ sensor_add(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+ 
+ 	    tok = mystrtok(NULL, " \t\n", toks);
+ 	    if (!tok) {
+-		out->printf(out, "**No polled sensor handler given\n", tok);
++		out->eprintf(out, "**No polled sensor handler given\n", tok);
+ 		return -1;
+ 	    }
+ 
+ 	    handler = ipmi_sensor_find_handler(tok);
+ 	    if (!handler) {
+-		out->printf(out, "**Invalid sensor handler: %s\n", tok);
++		out->eprintf(out, "**Invalid sensor handler: %s\n", tok);
+ 		return -1;
+ 	    }
+ 
+ 	    rv = handler->init(mc, lun, num, toks, handler->cb_data, &rcb_data,
+ 			       &errstr);
+ 	    if (rv) {
+-		out->printf(out, "**Error initializing sensor handler: %s\n", 
++		out->eprintf(out, "**Error initializing sensor handler: %s\n", 
+ 			    errstr);
+ 		return rv;
+ 	    }
+ 	} else if (strcmp(tok, "event-only") == 0) {
+ 	    event_only = 1;
+ 	} else {
+-	    out->printf(out, "**Unknown sensor option: %s\n", tok);
++	    out->eprintf(out, "**Unknown sensor option: %s\n", tok);
+ 	    return -1;
+ 	}
+ 
+@@ -477,7 +477,7 @@ sensor_add(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+     }
+ 
+     if (handler && event_only) {
+-	out->printf(out, "**An event-only sensor cannot be polled\n");
++	out->eprintf(out, "**An event-only sensor cannot be polled\n");
+ 	return -1;
+     }
+ 
+@@ -488,7 +488,7 @@ sensor_add(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+ 	if (!rv && handler->postinit) {
+ 	    rv = handler->postinit(rcb_data, &errstr);
+ 	    if (rv) {
+-		out->printf(out, "**Error in sensor handler postinit: %s\n", 
++		out->eprintf(out, "**Error in sensor handler postinit: %s\n", 
+ 			    errstr);
+ 	    }
+ 	}
+@@ -496,7 +496,7 @@ sensor_add(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+ 	rv = ipmi_mc_add_sensor(mc, lun, num, type, code, event_only);
+     }
+     if (rv)
+-	out->printf(out, "**Unable to add to sensor, error 0x%x\n", rv);
++	out->eprintf(out, "**Unable to add to sensor, error 0x%x\n", rv);
+     return rv;
+ }
+ 
+@@ -532,7 +532,7 @@ sensor_set_bit(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+ 
+     rv = ipmi_mc_sensor_set_bit(mc, lun, num, bit, value, gen_event);
+     if (rv)
+-	out->printf(out, "**Unable to set sensor bit, error 0x%x\n", rv);
++	out->eprintf(out, "**Unable to set sensor bit, error 0x%x\n", rv);
+     return rv;
+ }
+ 
+@@ -563,7 +563,7 @@ sensor_set_bit_clr_rest(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **
+ 
+     rv = ipmi_mc_sensor_set_bit_clr_rest(mc, lun, num, bit, gen_event);
+     if (rv)
+-	out->printf(out, "**Unable to set sensor bit, error 0x%x\n", rv);
++	out->eprintf(out, "**Unable to set sensor bit, error 0x%x\n", rv);
+     return rv;
+ }
+ 
+@@ -594,7 +594,7 @@ sensor_set_value(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+ 
+     rv = ipmi_mc_sensor_set_value(mc, lun, num, value, gen_event);
+     if (rv)
+-	out->printf(out, "**Unable to set sensor value, error 0x%x\n", rv);
++	out->eprintf(out, "**Unable to set sensor value, error 0x%x\n", rv);
+     return rv;
+ }
+ 
+@@ -637,7 +637,7 @@ sensor_set_hysteresis(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **to
+     rv = ipmi_mc_sensor_set_hysteresis(mc, lun, num, support, positive,
+ 				       negative);
+     if (rv)
+-	out->printf(out, "**Unable to set sensor hysteresis, error 0x%x\n", rv);
++	out->eprintf(out, "**Unable to set sensor hysteresis, error 0x%x\n", rv);
+     return rv;
+ }
+ 
+@@ -682,7 +682,7 @@ sensor_set_threshold(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **tok
+     rv = ipmi_mc_sensor_set_threshold(mc, lun, num, support,
+ 				      enabled, 1, thresholds);
+     if (rv)
+-	out->printf(out, "**Unable to set sensor thresholds, error 0x%x\n", rv);
++	out->eprintf(out, "**Unable to set sensor thresholds, error 0x%x\n", rv);
+     return rv;
+ }
+ 
+@@ -759,7 +759,7 @@ sensor_set_event_support(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char *
+ 					  assert_support, deassert_support,
+ 					  assert_enabled, deassert_enabled);
+     if (rv)
+-	out->printf(out, "**Unable to set sensor thresholds, error 0x%x\n", rv);
++	out->eprintf(out, "**Unable to set sensor thresholds, error 0x%x\n", rv);
+     return rv;
+ }
+ 
+@@ -819,7 +819,7 @@ mc_add(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+ 	else if (strcmp("persist_sdr", tok) == 0)
+ 	    flags |= IPMI_MC_PERSIST_SDR;
+ 	else {
+-	    out->printf(out, "**Invalid MC flag: %s\n", tok);
++	    out->eprintf(out, "**Invalid MC flag: %s\n", tok);
+ 	    return -1;
+ 	}
+     }
+@@ -833,7 +833,7 @@ mc_add(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+ 			 device_revision, major_fw_rev, minor_fw_rev,
+ 			 device_support, mfg_id, product_id, flags);
+     if (rv)
+-	out->printf(out, "**Unable to add the MC, error 0x%x\n", rv);
++	out->eprintf(out, "**Unable to add the MC, error 0x%x\n", rv);
+     return rv;
+ }
+ 
+@@ -890,7 +890,7 @@ mc_set_power(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+ 
+     rv = ipmi_mc_set_power(mc, power, gen_int);
+     if (rv)
+-	out->printf(out, "**Unable to set power, error 0x%x\n", rv);
++	out->eprintf(out, "**Unable to set power, error 0x%x\n", rv);
+     return rv;
+ }
+ 
+@@ -916,7 +916,7 @@ mc_add_fru_data(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+ 
+     tok = mystrtok(NULL, " \t\n", toks);
+     if (!tok) {
+-	out->printf(out, "**No FRU data type given");
++	out->eprintf(out, "**No FRU data type given");
+ 	return -1;
+     }
+     if (strcmp(tok, "file") == 0) {
+@@ -929,13 +929,13 @@ mc_add_fru_data(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+ 
+ 	rv = get_delim_str(toks, &frufn, &errstr);
+ 	if (rv) {
+-	    out->printf(out, "**Error with FRU filename: %d", strerror(rv));
++	    out->eprintf(out, "**Error with FRU filename: %d", strerror(rv));
+ 	    return rv;
+ 	}
+ 	rv = ipmi_mc_add_fru_file(mc, devid, length, file_offset,
+ 				  (void *) frufn);
+ 	if (rv)
+-	    out->printf(out, "**Unable to add FRU file, error 0x%x\n", rv);
++	    out->eprintf(out, "**Unable to add FRU file, error 0x%x\n", rv);
+ 	
+     } else if (strcmp(tok, "data") == 0) {
+ 	for (i=0; i<length; i++) {
+@@ -943,14 +943,14 @@ mc_add_fru_data(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+ 	    if (rv == ENOSPC)
+ 		break;
+ 	    if (rv) {
+-		out->printf(out, "**Error 0x%x in data byte %d\n", rv, i);
++		out->eprintf(out, "**Error 0x%x in data byte %d\n", rv, i);
+ 		return rv;
+ 	    }
+ 	}
+ 
+ 	rv = emu_get_uchar(out, toks, &data[i], "data byte", 1);
+ 	if (rv != ENOSPC) {
+-	    out->printf(out, "**Error: input data too long for FRU\n", rv, i);
++	    out->eprintf(out, "**Error: input data too long for FRU\n", rv, i);
+ 	    return EINVAL;
+ 	}
+ 
+@@ -958,9 +958,9 @@ mc_add_fru_data(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+ 
+ 	rv = ipmi_mc_add_fru_data(mc, devid, length, NULL, data);
+ 	if (rv)
+-	    out->printf(out, "**Unable to add FRU data, error 0x%x\n", rv);
++	    out->eprintf(out, "**Unable to add FRU data, error 0x%x\n", rv);
+     } else {
+-	out->printf(out, "**FRU type not given, need file or data\n");
++	out->eprintf(out, "**FRU type not given, need file or data\n");
+ 	rv = EINVAL;
+     }
+     return rv;
+@@ -981,28 +981,28 @@ mc_dump_fru_data(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+ 
+     rv = ipmi_mc_get_fru_data_len(mc, devid, &length);
+     if (rv) {
+-	out->printf(out, "**Unable to dump FRU data, error 0x%x\n", rv);
++	out->eprintf(out, "**Unable to dump FRU data, error 0x%x\n", rv);
+ 	goto out;
+     }
+ 
+     data = malloc(length);
+     if (!data) {
+-	out->printf(out, "**Unable to dump FRU data, out of memory\n", rv);
++	out->eprintf(out, "**Unable to dump FRU data, out of memory\n", rv);
+ 	goto out;
+     }
+ 
+     rv = ipmi_mc_get_fru_data(mc, devid, length, data);
+     if (rv) {
+-	out->printf(out, "**Unable to dump FRU data, error 0x%x\n", rv);
++	out->eprintf(out, "**Unable to dump FRU data, error 0x%x\n", rv);
+ 	goto out;
+     }
+ 
+     for (i=0; i<length; i++) {
+ 	if ((i > 0) && ((i % 8) == 0))
+-	    out->printf(out, "\n");
+-	out->printf(out, " 0x%2.2x", data[i]);
++	    out->eprintf(out, "\n");
++	out->eprintf(out, " 0x%2.2x", data[i]);
+     }
+-    out->printf(out, "\n");
++    out->eprintf(out, "\n");
+ 
+  out:
+     if (data)
+@@ -1021,7 +1021,7 @@ mc_setbmc(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+ 	return rv;
+     rv = ipmi_emu_set_bmc_mc(emu, ipmb);
+     if (rv)
+-	out->printf(out, "**Invalid IPMB address\n");
++	out->eprintf(out, "**Invalid IPMB address\n");
+     return rv;
+ }
+ 
+@@ -1032,7 +1032,7 @@ atca_enable(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+ 
+     rv = ipmi_emu_atca_enable(emu);
+     if (rv)
+-	out->printf(out, "**Unable to enable ATCA mode, error 0x%x\n", rv);
++	out->eprintf(out, "**Unable to enable ATCA mode, error 0x%x\n", rv);
+     return rv;
+ }
+ 
+@@ -1056,7 +1056,7 @@ atca_set_site(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+ 
+     rv = ipmi_emu_atca_set_site(emu, hw_address, site_type, site_number);
+     if (rv)
+-	out->printf(out, "**Unable to set site type, error 0x%x\n", rv);
++	out->eprintf(out, "**Unable to set site type, error 0x%x\n", rv);
+     return rv;
+ }
+ 
+@@ -1072,7 +1072,7 @@ mc_set_num_leds(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+ 
+     rv = ipmi_mc_set_num_leds(mc, count);
+     if (rv)
+-	out->printf(out, "**Unable to set number of LEDs, error 0x%x\n", rv);
++	out->eprintf(out, "**Unable to set number of LEDs, error 0x%x\n", rv);
+     return rv;
+ }
+ 
+@@ -1085,7 +1085,7 @@ read_cmds(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+ 
+     err = get_delim_str(toks, &filename, &errstr);
+     if (err) {
+-	out->printf(out, "Could not get include filename: %s\n", errstr);
++	out->eprintf(out, "Could not get include filename: %s\n", errstr);
+ 	return err;
+     }
+ 
+@@ -1097,7 +1097,7 @@ read_cmds(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+     {
+ 	char *nf = malloc(strlen(BASE_CONF_STR) + strlen(filename) + 2);
+ 	if (!nf) {
+-	    out->printf(out, "Out of memory in include\n", errstr);
++	    out->eprintf(out, "Out of memory in include\n", errstr);
+ 	    goto out_err;
+ 	}
+ 	strcpy(nf, BASE_CONF_STR);
+@@ -1107,7 +1107,7 @@ read_cmds(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+ 	filename = nf;
+ 	err = read_command_file(out, emu, filename);
+ 	if (err) {
+-	    out->printf(out, "Could not read include file %s\n", filename);
++	    out->eprintf(out, "Could not read include file %s\n", filename);
+ 	}
+     }
+ 
+@@ -1147,7 +1147,7 @@ debug_cmd(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+ 	} else if (strcmp(tok, "sol") == 0) {
+ 	    level |= DEBUG_SOL;
+ 	} else {
+-	    out->printf(out, "Invalid debug level '%s', options are 'raw' and 'msg'\n",
++	    out->eprintf(out, "Invalid debug level '%s', options are 'raw' and 'msg'\n",
+ 		   tok);
+ 	    return EINVAL;
+ 	}
+@@ -1168,7 +1168,7 @@ persist_cmd(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+ 	} else if (strcmp(tok, "off") == 0) {
+ 	    persist_enable = 0;
+ 	} else {
+-	    out->printf(out, "Invalid persist vale '%s', options are 'on' and 'off'\n",
++	    out->eprintf(out, "Invalid persist vale '%s', options are 'on' and 'off'\n",
+ 		   tok);
+ 	    return EINVAL;
+ 	}
+@@ -1194,18 +1194,18 @@ do_define(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
+ 
+     name = mystrtok(NULL, " \t\n", toks);
+     if (!name) {
+-	out->printf(out, "No variable name given for define\n");
++	out->eprintf(out, "No variable name given for define\n");
+ 	return EINVAL;
+     }
+     err = get_delim_str(toks, &value, &errstr);
+     if (err) {
+-	out->printf(out, "Could not get variable %s value: %s\n", name, errstr);
++	out->eprintf(out, "Could not get variable %s value: %s\n", name, errstr);
+ 	return err;
+     }
+     err = add_variable(name, value);
+     if (err) {
+ 	free(value);
+-	out->printf(out, "Out of memory setting variable %s\n", name);
++	out->eprintf(out, "Out of memory setting variable %s\n", name);
+ 	return err;
+     }
+     return 0;
+@@ -1301,7 +1301,7 @@ ipmi_emu_cmd(emu_out_t *out, emu_data_t *emu, char *cmd_str)
+ 		    return rv;
+ 		rv = ipmi_emu_get_mc_by_addr(emu, ipmb, &mc);
+ 		if (rv) {
+-		    out->printf(out, "**Invalid MC address\n");
++		    out->eprintf(out, "**Invalid MC address\n");
+ 		    return rv;
+ 		}
+ 	    }
+@@ -1312,7 +1312,7 @@ ipmi_emu_cmd(emu_out_t *out, emu_data_t *emu, char *cmd_str)
+ 	}
+     }
+ 
+-    out->printf(out, "**Unknown command: %s\n", cmd);
++    out->eprintf(out, "**Unknown command: %s\n", cmd);
+ 
+  out:
+     return rv;
+diff --git a/lanserv/ipmi_sim.c b/lanserv/ipmi_sim.c
+index 9472cce..30c4f27 100644
+--- a/lanserv/ipmi_sim.c
++++ b/lanserv/ipmi_sim.c
+@@ -607,8 +607,8 @@ isim_log(sys_data_t *sys, int logtype, msg_t *msg, const char *format,
+ 
+     con = data->consoles;
+     while (con) {
+-	con->out.printf(&con->out, "%s", str);
+-	con->out.printf(&con->out, "\n");
++	con->out.eprintf(&con->out, "%s", str);
++	con->out.eprintf(&con->out, "\n");
+ 	con = con->next;
+     }
+ #if HAVE_SYSLOG
+@@ -956,7 +956,7 @@ console_bind_ready(int fd, void *cb_data, os_hnd_fd_id_t *id)
+     newcon->shutdown_on_close = 0;
+     newcon->telnet = 1;
+     newcon->tn_pos = 0;
+-    newcon->out.printf = emu_printf;
++    newcon->out.eprintf = emu_printf;
+     newcon->out.data = newcon;
+ 
+     setsockopt(rv, IPPROTO_TCP, TCP_NODELAY, (char *)&val, sizeof(val));
+@@ -1463,10 +1463,10 @@ main(int argc, const char *argv[])
+     stdio_console.telnet = 0;
+     stdio_console.tn_pos = 0;
+     if (nostdio) {
+-	stdio_console.out.printf = dummy_printf;
++	stdio_console.out.eprintf = dummy_printf;
+ 	stdio_console.out.data = &stdio_console;
+     } else {
+-	stdio_console.out.printf = emu_printf;
++	stdio_console.out.eprintf = emu_printf;
+ 	stdio_console.out.data = &stdio_console;
+     }
+     stdio_console.next = NULL;
+-- 
+2.14.1
+
diff --git a/meta-networking/recipes-support/openipmi/files/do-not-install-pyc-and-pyo.patch b/meta-networking/recipes-support/openipmi/files/do-not-install-pyc-and-pyo.patch
new file mode 100644
index 0000000..d4e02be
--- /dev/null
+++ b/meta-networking/recipes-support/openipmi/files/do-not-install-pyc-and-pyo.patch
@@ -0,0 +1,25 @@
+Do not install pyc and pyo for python module
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ swig/python/Makefile.am | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/swig/python/Makefile.am b/swig/python/Makefile.am
+index da95a81..97a62bf 100644
+--- a/swig/python/Makefile.am
++++ b/swig/python/Makefile.am
+@@ -33,8 +33,6 @@ CLEANFILES = OpenIPMI_wrap.c OpenIPMI.py OpenIPMI.pyo OpenIPMI.pyc
+ install-exec-local: _OpenIPMI.la OpenIPMI.py OpenIPMI.pyc OpenIPMI.pyo
+ 	$(INSTALL) -d $(DESTDIR)$(PYTHON_INSTALL_DIR)
+ 	$(INSTALL_DATA) OpenIPMI.py "$(DESTDIR)$(PYTHON_INSTALL_DIR)"
+-	$(INSTALL_DATA) OpenIPMI.pyc "$(DESTDIR)$(PYTHON_INSTALL_DIR)"
+-	$(INSTALL_DATA) OpenIPMI.pyo "$(DESTDIR)$(PYTHON_INSTALL_DIR)"
+ 	if test "x$(PYTHON_GUI_DIR)" = "xopenipmigui"; then \
+ 	    $(INSTALL) -d $(DESTDIR)$(bindir); \
+ 	    $(INSTALL_SCRIPT) $(srcdir)/openipmigui.py "$(DESTDIR)$(bindir)/openipmigui";\
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch b/meta-networking/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch
new file mode 100644
index 0000000..9a568b2
--- /dev/null
+++ b/meta-networking/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch
@@ -0,0 +1,22 @@
+Author: Aws Ismail <aws.ismail@windriver.com>
+Date:   Thu Jun 7 16:00:13 2012 -0400
+
+    This patch fixes the error during the install stage when
+    creating a symbolic link for opeipmish in openipmi/cmdlang
+    
+    Upstream-Status: Pending
+    
+    Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
+
+diff --git a/cmdlang/Makefile.am b/cmdlang/Makefile.am
+index 92d6e83..f6039f9 100644
+--- a/cmdlang/Makefile.am
++++ b/cmdlang/Makefile.am
+@@ -36,6 +36,7 @@ CLEANFILES = libOpenIPMIcmdlang.map
+ # compatability.
+ install-data-local:
+ 	rm -f $(DESTDIR)$(bindir)/ipmish
++	mkdir -p $(DESTDIR)$(bindir)/
+ 	$(LN_S) openipmish $(DESTDIR)$(bindir)/ipmish
+ 
+ uninstall-local:
diff --git a/meta-networking/recipes-support/openipmi/files/include_sys_types.patch b/meta-networking/recipes-support/openipmi/files/include_sys_types.patch
new file mode 100644
index 0000000..58ec5d8
--- /dev/null
+++ b/meta-networking/recipes-support/openipmi/files/include_sys_types.patch
@@ -0,0 +1,17 @@
+include sys/types.h for u_int32_t
+
+ui.c:340:5: error: unknown type name 'u_int32_t'; did you mean 'uint32_t'?
+     u_int32_t     addr;
+     ^~~~~~~~~
+Index: OpenIPMI-2.0.22/ui/ui.c
+===================================================================
+--- OpenIPMI-2.0.22.orig/ui/ui.c
++++ OpenIPMI-2.0.22/ui/ui.c
+@@ -42,6 +42,7 @@
+ #include <fcntl.h>
+ #include <time.h>
+ #include <sys/time.h>
++#include <sys/types.h>
+ #include <ctype.h>
+ 
+ #include <OpenIPMI/selector.h>
diff --git a/meta-networking/recipes-support/openipmi/files/ipmi-init-fix-the-arguments.patch b/meta-networking/recipes-support/openipmi/files/ipmi-init-fix-the-arguments.patch
new file mode 100644
index 0000000..51a398b
--- /dev/null
+++ b/meta-networking/recipes-support/openipmi/files/ipmi-init-fix-the-arguments.patch
@@ -0,0 +1,41 @@
+Subject: [PATCH] ipmi-init: fix the arguments
+
+The functions success/failure/warning defined in /etc/init.d/functions
+(provided by initscripts) only accepts numeric argument as return code,
+not a string.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ ipmi.init | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/ipmi.init b/ipmi.init
+index 2ebcd94..d8161c5 100644
+--- a/ipmi.init
++++ b/ipmi.init
+@@ -45,17 +45,17 @@ elif [ -r /etc/init.d/functions ]; then
+ 	case "$ACTION" in
+ 	    success)
+ 		echo -n $*
+-		success "$*"
++		success 0
+ 		echo
+ 		;;
+ 	    failure)
+ 		echo -n $*
+-		failure "$*"
++		failure 1
+ 		echo
+ 		;;
+ 	    warning)
+ 		echo -n $*
+-		warning "$*"
++		warning 0
+ 		echo
+ 		;;
+ 	    *)
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-support/openipmi/files/ipmi.service b/meta-networking/recipes-support/openipmi/files/ipmi.service
new file mode 100644
index 0000000..6fe1378
--- /dev/null
+++ b/meta-networking/recipes-support/openipmi/files/ipmi.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=IPMI Driver
+After=network.target
+
+[Service]
+Type=oneshot
+RemainAfterExit=yes
+ExecStart=@LIBEXECDIR@/openipmi-helper start
+ExecStop=@LIBEXECDIR@/openipmi-helper stop-all
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-support/openipmi/files/openipmi-helper b/meta-networking/recipes-support/openipmi/files/openipmi-helper
new file mode 100755
index 0000000..4cebfb9
--- /dev/null
+++ b/meta-networking/recipes-support/openipmi/files/openipmi-helper
@@ -0,0 +1,512 @@
+#!/bin/sh
+#############################################################################
+#
+# ipmi:		OpenIPMI Driver helper script
+#
+# Authors:	Jan Safranek <jsafrane@redhat.com>
+#
+# Based on IPMI init script by:
+#               Matt Domsch <Matt_Domsch@dell.com>
+#               Chris Poblete <Chris_Poblete@dell.com>
+#
+# Status return code bits
+# no bits set = no errors
+# bit 0 set = minimum modules aren't loaded
+# bit 1 set = requested feature module isn't loaded
+# bit 2 set = /dev/ipmi0 (or /dev/imb if using that instead) doesn't exist
+# bit 3 set = /dev/watchdog doesn't exist
+# bit 4 set = lockfile doesn't exist
+# bit 5 set = modules are loaded even when asked to be unloaded
+
+CONFIGFILE=/etc/sysconfig/ipmi
+# source config info
+[ -r ${CONFIGFILE} ] && . ${CONFIGFILE}
+
+#############################################################################
+# GLOBALS
+#############################################################################
+MODULE_NAME="ipmi"
+INTF_NUM=0
+
+IPMI_SMB_MODULE_NAME="ipmi_smb"
+IPMI_SI_MODULE_NAME="ipmi_si"
+kernel=`uname -r | cut -d. -f1-2`
+if [ "${kernel}" == "2.4" ]; then
+    IPMI_SMB_MODULE_NAME="ipmi_smb_intf"
+    IPMI_SI_MODULE_NAME="ipmi_si_drv"
+fi
+
+MODULES_INTERFACES=""
+[ "${DEV_IPMI}" = "yes" ] && MODULES_INTERFACES="${MODULES_INTERFACES} ipmi_devintf"
+[ "${IPMI_IMB}" = "yes" ] && MODULES_INTERFACES="${MODULES_INTERFACES} ipmi_imb"
+
+MODULES_FEATURES=""
+[ "${IPMI_WATCHDOG}" = "yes" ] && MODULES_FEATURES="${MODULES_FEATURES} ipmi_watchdog"
+[ "${IPMI_POWEROFF}" = "yes" ] && MODULES_FEATURES="${MODULES_FEATURES} ipmi_poweroff"
+
+MODULES_HW=""
+[ "${IPMI_SI}"  = "yes" ] && MODULES_HW="${MODULES_HW} ${IPMI_SI_MODULE_NAME}"
+[ "${IPMI_SMB}" = "yes" ] && MODULES_HW="${MODULES_HW} ${IPMI_SMB_MODULE_NAME}"
+
+MODULES_BASE="ipmi_msghandler"
+MODULES="${MODULES_INTERFACES} ${MODULES_FEATURES} ${MODULES_HW} ${MODULES_BASE}"
+
+RETVAL=0
+LOCKFILE=/var/lock/subsys/ipmi
+DEV_IPMI_TIMEOUT=150
+
+UDEV_EXISTS=0
+if [ -e /sbin/udev -o -e /sbin/udevd ]; then
+    UDEV_EXISTS=1
+fi
+
+#############################################################################
+# NOTES:
+# * /dev/ipmi0 is unconditionally deleted here on ipmi_devintf unload,
+#   because SLES9 and RHEL4 kernels don't send a message for udev to delete
+#   it for us.
+# 
+#############################################################################
+
+modules_loaded_verbose()
+{
+	OnePlusLoaded=0
+	OnePlusUnloaded=0
+	for m in $@; do
+		if /sbin/lsmod | grep $m >/dev/null 2>&1 ; then
+			echo "$m module loaded."
+			OnePlusLoaded=1
+		else
+			echo "$m module not loaded."
+			OnePlusUnloaded=1
+		fi
+	done
+}
+
+modules_loaded()
+{
+	OnePlusLoaded=0
+	OnePlusUnloaded=0
+	for m in $@; do
+		if /sbin/lsmod | grep $m >/dev/null 2>&1 ; then
+			OnePlusLoaded=1
+		else
+			OnePlusUnloaded=1
+		fi
+	done
+}
+
+device_node_exists ()
+{
+	if [ -e "$1" ]; then
+		echo "$1 exists."
+		return 1
+	fi
+	echo "$1 does not exist."
+	return 0
+}
+
+minimum_modules_loaded()
+{
+        rc_base=1
+	rc_hw=1
+        modules_loaded_verbose "${MODULES_BASE}"
+	[ ${OnePlusLoaded} -eq 0 ] && rc_base=0
+	    
+	modules_loaded_verbose "${MODULES_HW}"
+	[ ${OnePlusLoaded} -eq 0 ] && rc_hw=0
+	
+	return $((rc_base && rc_hw))
+}
+
+#############################################################################
+
+load_si()
+{
+	if [ "${IPMI_SI}" = "yes" ]; then
+		modprobe ${IPMI_SI_MODULE_NAME} > /dev/null 2>&1
+		modules_loaded ${IPMI_SI_MODULE_NAME}
+		[ ${OnePlusLoaded} -ne 1 ] && RETVAL=$((RETVAL | 1))
+	fi
+}
+
+load_smb()
+{
+	if [ "${IPMI_SMB}" = "yes" ]; then
+		modprobe ${IPMI_SMB_MODULE_NAME} > /dev/null 2>&1
+		modules_loaded ${IPMI_SMB_MODULE_NAME}
+		[ ${OnePlusLoaded} -ne 1 ] && RETVAL=$((RETVAL | 1))
+	fi
+}
+
+load_hw_modules()
+{
+	load_si
+	load_smb
+}
+
+start_watchdog_common()
+{
+	load_hw_modules
+	modprobe ipmi_watchdog ${IPMI_WATCHDOG_OPTIONS} > /dev/null 2>&1
+	modules_loaded ipmi_watchdog
+	[ ${OnePlusUnloaded} -ne 0 ] &&
+		RETVAL=$((RETVAL | 2)) &&
+		echo "Watchdog startup failed: cannot load ipmi_watchdog module" &&
+		return
+	if [ ${UDEV_EXISTS} -eq 0 -a ! -e /dev/watchdog ]; then
+		mknod -m 0600 /dev/watchdog c 10 130
+		[ $? -ne 0 ] &&
+			RETVAL=$((RETVAL | 8)) &&
+			echo "Watchdog startup failed: cannot create /dev/watchdog" &&
+			return
+	fi
+}
+
+start_watchdog_quiet()
+{
+	[ "${IPMI_WATCHDOG}" != "yes" ] &&
+		return
+	start_watchdog_common
+}
+
+start_watchdog()
+{
+	[ "${IPMI_WATCHDOG}" != "yes" ] &&
+		RETVAL=$((RETVAL | 2)) &&
+		echo "Watchdog not configured" &&
+		return
+	start_watchdog_common
+}
+
+stop_watchdog()
+{
+	modprobe -q -r ipmi_watchdog > /dev/null 2>&1
+	modules_loaded ipmi_watchdog
+	if [ ${OnePlusLoaded} -ne 0 ]; then
+	    RETVAL=$((RETVAL | 32))
+	    echo "Watchog shutdown failed: cannot unload ipmi_watchdog module"
+	else
+	    if [ "${IPMI_WATCHDOG}" = "yes" ]; then
+		[ ${UDEV_EXISTS} -eq 0 ] && rm -f /dev/watchdog
+	    fi
+	fi
+}
+
+stop_watchdog_quiet()
+{
+	modprobe -q -r ipmi_watchdog > /dev/null 2>&1
+	modules_loaded ipmi_watchdog
+	if [ ${OnePlusLoaded} -ne 0 ]; then
+	    RETVAL=$((RETVAL | 32))
+	else
+	    if [ "${IPMI_WATCHDOG}" = "yes" ]; then
+		[ ${UDEV_EXISTS} -eq 0 ] && rm -f /dev/watchdog
+	    fi
+	fi
+}
+
+start_powercontrol_common()
+{
+	local poweroff_opts=""
+	load_hw_modules
+	if [ "${IPMI_POWERCYCLE}" == "yes" ]; then
+	    modinfo ipmi_poweroff 2>/dev/null | grep poweroff_control > /dev/null 2>&1 && \
+		poweroff_opts="poweroff_control=2"
+	    modinfo ipmi_poweroff 2>/dev/null | grep poweroff_powercycle > /dev/null 2>&1 && \
+		poweroff_opts="poweroff_powercycle=1"
+	fi
+	modprobe ipmi_poweroff "${poweroff_opts}" > /dev/null 2>&1
+	modules_loaded ipmi_poweroff
+	[ ${OnePlusUnloaded} -ne 0 ] &&
+		RETVAL=$((RETVAL | 2)) &&
+		echo "Powercontroll startup failed: cannot load ipmi_poweroff module" &&
+		return
+}
+
+start_powercontrol_quiet()
+{
+	[ "${IPMI_POWEROFF}" != "yes" ] &&
+		return
+	start_powercontrol_common
+}
+
+start_powercontrol()
+{
+	[ "${IPMI_POWEROFF}" != "yes" ] &&
+		RETVAL=$((RETVAL | 2)) &&
+		echo "Powercontroll not configured" &&
+		return
+	start_powercontrol_common
+}
+
+stop_powercontrol()
+{
+	modprobe -q -r ipmi_poweroff > /dev/null 2>&1
+	modules_loaded ipmi_poweroff
+	if [ ${OnePlusLoaded} -ne 0 ]; then
+	    RETVAL=$((RETVAL | 32))
+	    echo "Powercontroll shutdown failed: cannot unload ipmi_poweroff module"
+	fi
+}
+
+stop_powercontrol_quiet()
+{
+	modprobe -q -r ipmi_poweroff > /dev/null 2>&1
+	modules_loaded ipmi_poweroff
+	[ ${OnePlusLoaded} -ne 0 ] && RETVAL=$((RETVAL | 32))
+}
+
+#############################################################################
+unload_all_ipmi_modules()
+{
+	stop_watchdog_quiet
+	stop_powercontrol_quiet
+	for m in ${MODULES}; do
+		modprobe -q -r ${m} > /dev/null 2>&1
+	done
+        # delete interface node ONLY if ipmi_devintf is unloaded
+        [ `lsmod | grep -c "ipmi_devintf"` -eq 0 ] &&
+	        rm -f "/dev/ipmi${INTF_NUM}"
+}
+
+unload_ipmi_modules_leave_features()
+{
+	for m in ${MODULES_INTERFACES}; do
+		modprobe -q -r ${m} > /dev/null 2>&1
+	done
+        # delete interface node ONLY if ipmi_devintf is unloaded
+        [ `lsmod | grep -c "ipmi_devintf"` -eq 0 ] &&
+	        rm -f "/dev/ipmi${INTF_NUM}"
+	lsmod | egrep -q "ipmi_(poweroff|watchdog)" > /dev/null 2>&1
+	if [ "$?" -ne "0" ]; then
+		stop_watchdog_quiet
+		stop_powercontrol_quiet
+		for m in ${MODULES}; do
+			modprobe -q -r ${m} > /dev/null 2>&1
+		done
+	fi
+}
+
+#############################################################################
+load_ipmi_modules ()
+{
+	local locdelay
+	modprobe ipmi_msghandler > /dev/null 2>&1
+	modules_loaded ipmi_msghandler
+	[ ${OnePlusLoaded} -ne 1 ] && unload_all_ipmi_modules && RETVAL=$((RETVAL | 1)) && return
+	load_hw_modules
+	[ $((RETVAL & 1)) -eq 1 ] && unload_all_ipmi_modules && RETVAL=$((RETVAL | 1)) && return
+
+	if [ "${DEV_IPMI}" = "yes" ]; then
+		modprobe ipmi_devintf > /dev/null 2>&1
+		modules_loaded ipmi_devintf
+		RETVAL=$((RETVAL & ~2))
+		[ ${OnePlusLoaded} -eq 0 ] && RETVAL=$((RETVAL | 2))
+		if [ ${OnePlusLoaded} -eq 1 ]; then
+			if [ ${UDEV_EXISTS} -eq 0 ]; then
+				DEVMAJOR=`cat /proc/devices | awk '/ipmidev/{print $1}'`
+				rm -f /dev/ipmi${INTF_NUM}
+				mknod -m 0600 /dev/ipmi${INTF_NUM} c ${DEVMAJOR} 0 || RETVAL=$((RETVAL | 4))
+			fi
+
+			# udev can take several seconds to create /dev/ipmi0, 
+			# but it happens asynchronously, so delay here
+			locdelay=${DEV_IPMI_TIMEOUT}
+			while [ ! -e /dev/ipmi${INTF_NUM} -a ${locdelay} -gt 0 ]; do
+				locdelay=$((locdelay - 1))
+				sleep 0.1
+			done
+		fi
+	fi
+
+	if [ "${IPMI_IMB}" = "yes" ]; then
+		modprobe ipmi_imb > /dev/null 2>&1
+		modules_loaded ipmi_imb
+		RETVAL=$((RETVAL & ~2))
+		[ ${OnePlusLoaded} -eq 0 ] && RETVAL=$((RETVAL | 2))
+		if [ ${OnePlusLoaded} -eq 1 ]; then
+			DEVMAJOR=`cat /proc/devices | awk '/imb/{print $1}'`
+			rm -f /dev/imb
+			mknod -m 0600 /dev/imb c ${DEVMAJOR} 0 || RETVAL=$((RETVAL | 4))
+		fi
+	fi
+
+	# Per Corey Minyard, essentially no one uses ipmi_radisys
+	# and we don't want to encourage its further use
+	# so it won't be handled here.
+	return
+}
+
+#############################################################################
+start()
+{
+	load_ipmi_modules
+	if [ ${RETVAL} -eq 0 ]; then
+		touch ${LOCKFILE}
+	else
+		if [ $((RETVAL & 1)) -eq 1 ]; then
+			echo "Startup failed."
+		else
+			touch ${LOCKFILE} && echo "Warning!?"
+		fi
+	fi
+	start_watchdog_quiet
+	start_powercontrol_quiet
+}
+
+#############################################################################
+stop()
+{
+	unload_ipmi_modules_leave_features
+	modules_loaded ${MODULES_INTERFACES}
+	if [ ${OnePlusLoaded} -ne 0 ]; then
+		RETVAL=$((RETVAL | 32))
+		echo "Shutdown failed, something may be in use"
+	else
+		rm -f ${LOCKFILE}
+	fi
+}
+
+stop_all()
+{
+	unload_all_ipmi_modules
+	modules_loaded ${MODULES}
+	if [ ${OnePlusLoaded} -ne 0 ]; then
+		RETVAL=$((RETVAL | 32))
+		echo "Shutdown failed, something may be in use"
+	else
+		rm -f ${LOCKFILE}
+	fi
+}
+
+#############################################################################
+restart()
+{
+	stop_all
+	RETVAL=0
+	start
+}
+
+#############################################################################
+
+reload()
+{
+	stop_all
+	RETVAL=0
+	start
+}
+
+#############################################################################
+
+status_all()
+{
+	minimum_modules_loaded
+	[ $? -eq 0 ] && RETVAL=$((RETVAL | 1))
+	
+	modules_loaded_verbose ${MODULES_FEATURES} ${MODULES_INTERFACES}
+	[ ${OnePlusUnloaded} -ne 0 ] && RETVAL=$((RETVAL | 2))
+
+	if [ "${DEV_IPMI}" = "yes" ]; then 
+	    device_node_exists /dev/ipmi${INTF_NUM}
+	    [ $? -eq 0 ] && RETVAL=$((RETVAL | 4))
+	fi
+
+	if [ "${IPMI_IMB}" = "yes" ]; then
+	    device_node_exists /dev/imb
+	    [ $? -eq 0 ] && RETVAL=$((RETVAL | 4))
+	fi
+
+	if [ "${IPMI_WATCHDOG}" = "yes" ]; then
+	    device_node_exists /dev/watchdog
+	    [ $? -eq 0 ] && RETVAL=$((RETVAL | 8))
+	fi
+
+	[ ! -e ${LOCKFILE} ] && RETVAL=$((RETVAL | 16))
+}
+
+status()
+{
+	minimum_modules_loaded
+	[ $? -eq 0 ] && RETVAL=$((RETVAL | 1))
+	
+	if [ "${DEV_IPMI}" = "yes" ]; then 
+	    modules_loaded_verbose ipmi_devintf
+	    [ ${OnePlusLoaded} -eq 0 ] && RETVAL=$((RETVAL | 2))
+
+	    device_node_exists /dev/ipmi${INTF_NUM}
+	    [ $? -eq 0 ] && RETVAL=$((RETVAL | 4))
+	fi
+
+	if [ "${IPMI_IMB}" = "yes" ]; then
+	    device_node_exists /dev/imb
+	    [ $? -eq 0 ] && RETVAL=$((RETVAL | 4))
+	fi
+}
+
+status_watchdog()
+{
+	minimum_modules_loaded
+	[ $? -eq 0 ] && RETVAL=$((RETVAL | 1))
+
+	modules_loaded_verbose ipmi_watchdog
+	[ ${OnePlusLoaded} -eq 0 ] && RETVAL=$((RETVAL | 2))
+
+	device_node_exists /dev/watchdog
+	[ $? -eq 0 ] && RETVAL=$((RETVAL | 8))
+}
+
+status_powercontrol()
+{
+	minimum_modules_loaded
+	[ $? -eq 0 ] && RETVAL=$((RETVAL | 1))
+
+	modules_loaded_verbose ipmi_powercontrol
+	[ ${OnePlusLoaded} -eq 0 ] && RETVAL=$((RETVAL | 2))
+}
+
+#############################################################################
+usage ()
+{
+	echo $"Usage: $0 {start|stop|status" 1>&2
+	echo $"          restart|condrestart|try-restart|reload|force-reload" 1>&2
+	echo $"          start-watchdog|stop-watchdog|status-watchdog" 1>&2
+	echo $"          start-powercontrol|stop-powercontrol|status-powercontrol" 1>&2
+	echo $"          stop-all|status-all}" 1>&2
+	RETVAL=2
+}
+
+condrestart ()
+{
+	[ -e ${LOCKFILE} ] && restart
+}
+
+#############################################################################
+# MAIN
+#############################################################################
+case "$1" in
+	start) start ;;
+	stop)  stop ;;
+	restart) restart ;;
+	force-reload) reload ;;
+	reload) reload ;;
+	status)	status ;;
+	status-all) status_all ;;
+	condrestart) condrestart ;;
+	try-restart) condrestart ;;
+	start-watchdog) start_watchdog ;;
+	stop-watchdog) stop_watchdog ;;
+	status-watchdog) status_watchdog ;;
+	start-powercontrol) start_powercontrol ;;
+	stop-powercontrol) stop_powercontrol ;;
+	status-powercontrol) status_powercontrol ;;
+	stop-all) stop_all ;;
+	*) usage ;;
+esac
+
+exit ${RETVAL}
+
+#############################################################################
+# end of file
+#############################################################################
+
diff --git a/meta-networking/recipes-support/openipmi/files/openipmi-no-openipmigui-man.patch b/meta-networking/recipes-support/openipmi/files/openipmi-no-openipmigui-man.patch
new file mode 100644
index 0000000..1fa68f9
--- /dev/null
+++ b/meta-networking/recipes-support/openipmi/files/openipmi-no-openipmigui-man.patch
@@ -0,0 +1,26 @@
+Author: Aws Ismail <aws.ismail@windriver.com>
+Date:   Thu Jun 7 12:28:34 2012 -0400
+
+    This patch was carried over from WRL4.3 (openipmi v2.0.16)
+    
+    It was updated for openipmi v2.0.19
+    
+    Disable making openipmigui man page since we don't need it
+    
+    Upstream-Status: Pending
+    
+    Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
+    Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+diff --git a/man/Makefile.am b/man/Makefile.am
+index 632f55b..5ce79f5 100644
+--- a/man/Makefile.am
++++ b/man/Makefile.am
+@@ -1,6 +1,6 @@
+ 
+ man_MANS = ipmi_ui.1 openipmicmd.1 openipmish.1 ipmi_cmdlang.7 \
+-	openipmigui.1 openipmi_conparms.7 solterm.1 rmcp_ping.1 \
++	openipmi_conparms.7 solterm.1 rmcp_ping.1 \
+ 	openipmi_eventd.1
+ 
+ EXTRA_DIST = $(man_MANS)
diff --git a/meta-networking/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch b/meta-networking/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
new file mode 100644
index 0000000..83485a9
--- /dev/null
+++ b/meta-networking/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
@@ -0,0 +1,50 @@
+From aa0dc0783a6ff5fb56c914b640836223e3c192bb Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Mon, 29 Dec 2014 18:16:04 +0800
+Subject: [PATCH] remove host path from la_LDFLAGS
+
+Upstream-Status: Inappropriate [ cross compile specific ]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ cmdlang/Makefile.am |    2 +-
+ glib/Makefile.am    |    4 ++--
+ tcl/Makefile.am     |    2 +-
+ unix/Makefile.am    |    4 ++--
+ 4 files changed, 6 insertions(+), 6 deletions(-)
+
+Index: OpenIPMI-2.0.24/cmdlang/Makefile.am
+===================================================================
+--- OpenIPMI-2.0.24.orig/cmdlang/Makefile.am
++++ OpenIPMI-2.0.24/cmdlang/Makefile.am
+@@ -15,8 +15,7 @@ libOpenIPMIcmdlang_la_SOURCES = cmdlang.
+ libOpenIPMIcmdlang_la_LIBADD = -lm \
+ 	$(top_builddir)/utils/libOpenIPMIutils.la \
+ 	$(top_builddir)/lib/libOpenIPMI.la
+-libOpenIPMIcmdlang_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
+-	-L$(libdir)
++libOpenIPMIcmdlang_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION)
+ 
+ bin_PROGRAMS = openipmish
+ 
+Index: OpenIPMI-2.0.24/unix/Makefile.am
+===================================================================
+--- OpenIPMI-2.0.24.orig/unix/Makefile.am
++++ OpenIPMI-2.0.24/unix/Makefile.am
+@@ -10,14 +10,12 @@ lib_LTLIBRARIES = libOpenIPMIposix.la li
+ libOpenIPMIpthread_la_SOURCES = posix_thread_os_hnd.c selector.c
+ libOpenIPMIpthread_la_LIBADD = -lpthread $(GDBM_LIB) \
+ 	$(top_builddir)/utils/libOpenIPMIutils.la $(RT_LIB)
+-libOpenIPMIpthread_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
+-	-L$(libdir)
++libOpenIPMIpthread_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION)
+ 
+ libOpenIPMIposix_la_SOURCES = posix_os_hnd.c selector.c
+ libOpenIPMIposix_la_LIBADD = $(top_builddir)/utils/libOpenIPMIutils.la \
+ 	$(GDBM_LIB) $(RT_LIB)
+-libOpenIPMIposix_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
+-	-L$(libdir)
++libOpenIPMIposix_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION)
+ 
+ noinst_HEADERS = heap.h
+ 
diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.24.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.24.bb
new file mode 100644
index 0000000..a4f63c5
--- /dev/null
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.24.bb
@@ -0,0 +1,110 @@
+SUMMARY = "IPMI (Intelligent Platform Management Interface) library and tools"
+DESCRIPTION = "OpenIPMI is an effort to create a full-function IPMI system, \
+to allow full access to all IPMI information on a server \
+and to abstract it to a level that will make it easy to use"
+
+HOMEPAGE = "http://openipmi.sourceforge.net"
+
+DEPENDS = " \
+    glib-2.0 \
+    ncurses \
+    net-snmp \
+    openssl \
+    popt \
+    python \
+    swig-native \
+    "
+
+LICENSE = "GPLv2 & LGPLv2.1 & BSD"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://COPYING.LIB;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
+                    file://COPYING.BSD;md5=4b318d4160eb69c8ee53452feb1b4cdf \
+                    "
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${PV}.tar.gz \
+           file://fix-symlink-install-error-in-cmdlang.patch \
+           file://openipmi-no-openipmigui-man.patch \
+           file://openipmi-remove-host-path-from-la_LDFLAGS.patch \
+           file://ipmi-init-fix-the-arguments.patch \
+           file://do-not-install-pyc-and-pyo.patch \
+           file://include_sys_types.patch \
+           file://openipmi-helper \
+           file://ipmi.service \
+           file://0001-lanserv-Rename-struct-parameter-printf-for-namespace.patch \
+           "
+
+S = "${WORKDIR}/OpenIPMI-${PV}"
+SRC_URI[md5sum] = "58f9542cbfcb5fe250b77cf88345e1ec"
+SRC_URI[sha256sum] = "bca39a27071278a8b74610181ede8df51e155e5e9031bc8eaa3699d1720292b4"
+
+inherit autotools-brokensep pkgconfig pythonnative perlnative update-rc.d systemd
+
+EXTRA_OECONF = "--disable-static \
+                --with-perl='${STAGING_BINDIR_NATIVE}/perl-native/perl' \
+                --with-python='${STAGING_BINDIR_NATIVE}/python-native/python' \
+                --with-pythoninstall='${PYTHON_SITEPACKAGES_DIR}' \
+                --with-glibver=2.0"
+
+PACKAGECONFIG ??= "gdbm"
+PACKAGECONFIG[gdbm] = "ac_cv_header_gdbm_h=yes,ac_cv_header_gdbm_h=no,gdbm,"
+
+PACKAGES += "${PN}-perl ${PN}-python"
+
+FILES_${PN}-perl = " \
+    ${libdir}/perl/vendor_perl/*/OpenIPMI.pm \
+    ${libdir}/perl/vendor_perl/*/auto/OpenIPMI/OpenIPMI.so \
+    "
+
+FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
+
+FILES_${PN}-dbg += " \
+    ${libdir}/perl/vendor_perl/*/auto/OpenIPMI/.debug \
+    ${PYTHON_SITEPACKAGES_DIR}/.debug \
+    "
+
+do_configure () {
+
+    # Let's perform regular configuration first then handle perl issues.
+    autotools_do_configure
+
+    perl_ver=`perl -V:version | cut -d\' -f 2`
+    
+    # Force openipmi perl bindings to be compiled using perl-native instead of
+    # the host's perl. Set the proper install directory for the resulting
+    # openipmi.pm and openipmi.so
+    for i in ${S}/swig/Makefile ${S}/swig/perl/Makefile; do
+        echo "SAL: i = $i"
+        echo "SAL: STAGING_INCDIR_NATIVE = $STAGING_INCDIR_NATIVE"
+        echo "SAL: libdir = $libdir"
+        sed -i -e "/^PERL_CFLAGS/s:-I/usr/local/include:-I${STAGING_INCDIR_NATIVE}:g" $i
+        sed -i -e "/^PERL_INSTALL_DIR/s:^PERL_INSTALL_DIR = .*:PERL_INSTALL_DIR = ${libdir}/perl/vendor_perl/$perl_ver:g" $i
+    done
+}
+
+do_install_append () {
+    echo "SAL: D = $D"
+    echo "SAL: libdir = $libdir"
+    install -m 0755 -d ${D}${sysconfdir}/sysconfig ${D}${sysconfdir}/init.d
+    install -m 0755 ${S}/ipmi.init ${D}${sysconfdir}/init.d/ipmi
+    install -m 0644 ${S}/ipmi.sysconf ${D}${sysconfdir}/sysconfig/ipmi
+    # SAL: mv: cannot stat `/localdisk/loadbuild/slittle1/workspace/cgts_test_build/bitbake_build/tmp/work/x86_64-wrs-linux/openipmi-2.0.19-r4/image/usr/lib64/perl5': No such file or directory
+    # SAL: real path to perl is /localdisk/loadbuild/slittle1/workspace/cgts_test_build/bitbake_build/tmp/work/x86_64-wrs-linux/perl-5.14.2-r8.3/package/usr/lib64/perl5 and it is a symlink to perl so no need to mv.
+    if [ -d ${D}${libdir}/perl5 ]
+    then
+        mv ${D}${libdir}/perl5 ${D}${libdir}/perl
+    fi
+ 
+    # for systemd
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0664 ${WORKDIR}/ipmi.service ${D}${systemd_unitdir}/system
+    sed -i -e "s,@LIBEXECDIR@,${libexecdir},g" ${D}${systemd_unitdir}/system/ipmi.service
+    install -d ${D}${libexecdir}
+    install -m 0755 ${WORKDIR}/openipmi-helper ${D}${libexecdir}
+}
+
+INITSCRIPT_NAME = "ipmi"
+INITSCRIPT_PARAMS = "start 30 . stop 70 0 1 2 3 4 5 6 ."
+
+SYSTEMD_SERVICE_${PN} = "ipmi.service"
+SYSTEMD_AUTO_ENABLE = "disable"
diff --git a/meta-oe/recipes-support/openipmi/files/0001-lanserv-Rename-struct-parameter-printf-for-namespace.patch b/meta-oe/recipes-support/openipmi/files/0001-lanserv-Rename-struct-parameter-printf-for-namespace.patch
deleted file mode 100644
index 25057fb..0000000
--- a/meta-oe/recipes-support/openipmi/files/0001-lanserv-Rename-struct-parameter-printf-for-namespace.patch
+++ /dev/null
@@ -1,618 +0,0 @@
-From 8b51a6bf5a4829d8add535a098c0c06a049a9958 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 26 Aug 2017 22:50:57 -0700
-Subject: [PATCH] lanserv: Rename struct parameter printf for namespace
- collision
-
-This comes to fore when we use hardening flags where printf
-is treated as macro and gets replaced with printf_chk
-
-Fixes errors like
-
-error: no member named '__printf_chk' in 'struct emu_out_s'
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lanserv/OpenIPMI/serv.h |   2 +-
- lanserv/emu_cmd.c       | 132 ++++++++++++++++++++++++------------------------
- lanserv/ipmi_sim.c      |  10 ++--
- 3 files changed, 72 insertions(+), 72 deletions(-)
-
-diff --git a/lanserv/OpenIPMI/serv.h b/lanserv/OpenIPMI/serv.h
-index d12d63a..8555c85 100644
---- a/lanserv/OpenIPMI/serv.h
-+++ b/lanserv/OpenIPMI/serv.h
-@@ -522,7 +522,7 @@ uint8_t ipmb_checksum(uint8_t *data, int size, uint8_t start);
- typedef struct emu_data_s emu_data_t;
- typedef struct emu_out_s
- {
--    void (*printf)(struct emu_out_s *out, char *format, ...);
-+    void (*eprintf)(struct emu_out_s *out, char *format, ...);
-     void *data;
- } emu_out_t;
- 
-diff --git a/lanserv/emu_cmd.c b/lanserv/emu_cmd.c
-index ca44032..54b6f7b 100644
---- a/lanserv/emu_cmd.c
-+++ b/lanserv/emu_cmd.c
-@@ -76,7 +76,7 @@ emu_get_uchar(emu_out_t *out, char **toks, unsigned char *val, char *errstr,
- 	if (empty_ok)
- 	    return ENOSPC;
- 	if (errstr)
--	    out->printf(out, "**No %s given\n", errstr);
-+	    out->eprintf(out, "**No %s given\n", errstr);
- 	return EINVAL;
-     }
-     if (str[0] == '\'') {
-@@ -86,7 +86,7 @@ emu_get_uchar(emu_out_t *out, char **toks, unsigned char *val, char *errstr,
-     *val = strtoul(str, &tmpstr, 0);
-     if (*tmpstr != '\0') {
- 	if (errstr)
--	    out->printf(out, "**Invalid %s given\n", errstr);
-+	    out->eprintf(out, "**Invalid %s given\n", errstr);
- 	return EINVAL;
-     }
- 
-@@ -108,7 +108,7 @@ emu_get_uchar_with_vals(emu_out_t *out, char **toks,
- 	if (empty_ok)
- 	    return ENOSPC;
- 	if (errstr)
--	    out->printf(out, "**No %s given\n", errstr);
-+	    out->eprintf(out, "**No %s given\n", errstr);
- 	return EINVAL;
-     }
-     if (str[0] == '\'') {
-@@ -131,7 +131,7 @@ emu_get_uchar_with_vals(emu_out_t *out, char **toks,
-     *val = strtoul(str, &tmpstr, 0);
-     if (*tmpstr != '\0') {
- 	if (errstr)
--	    out->printf(out, "**Invalid %s given\n", errstr);
-+	    out->eprintf(out, "**Invalid %s given\n", errstr);
- 	return EINVAL;
-     }
-  out:
-@@ -150,12 +150,12 @@ emu_get_bitmask(emu_out_t *out, char **toks, uint16_t *val, char *errstr,
- 	if (empty_ok)
- 	    return ENOSPC;
- 	if (errstr)
--	    out->printf(out, "**No %s given\n", errstr);
-+	    out->eprintf(out, "**No %s given\n", errstr);
- 	return EINVAL;
-     }
-     if (strlen(str) != size) {
- 	if (errstr)
--	    out->printf(out, "**invalid number of bits in %s\n", errstr);
-+	    out->eprintf(out, "**invalid number of bits in %s\n", errstr);
- 	return EINVAL;
-     }
-     *val = 0;
-@@ -166,7 +166,7 @@ emu_get_bitmask(emu_out_t *out, char **toks, uint16_t *val, char *errstr,
- 	    *val |= 1 << i;
- 	} else {
- 	    if (errstr)
--		out->printf(out, "**Invalid bit value '%c' in %s\n", str[j],
-+		out->eprintf(out, "**Invalid bit value '%c' in %s\n", str[j],
- 			    errstr);
- 	    return EINVAL;
- 	}
-@@ -184,13 +184,13 @@ emu_get_uint(emu_out_t *out, char **toks, unsigned int *val, char *errstr)
-     str = mystrtok(NULL, " \t\n", toks);
-     if (!str) {
- 	if (errstr)
--	    out->printf(out, "**No %s given\n", errstr);
-+	    out->eprintf(out, "**No %s given\n", errstr);
- 	return EINVAL;
-     }
-     *val = strtoul(str, &tmpstr, 0);
-     if (*tmpstr != '\0') {
- 	if (errstr)
--	    out->printf(out, "**Invalid %s given\n", errstr);
-+	    out->eprintf(out, "**Invalid %s given\n", errstr);
- 	return EINVAL;
-     }
- 
-@@ -206,7 +206,7 @@ emu_get_bytes(emu_out_t *out, char **tokptr, unsigned char *data, char *errstr,
- 
-     if (!tok) {
- 	if (errstr)
--	    out->printf(out, "**No %s given\n", errstr);
-+	    out->eprintf(out, "**No %s given\n", errstr);
- 	return EINVAL;
-     }
-     if (*tok == '"') {
-@@ -215,7 +215,7 @@ emu_get_bytes(emu_out_t *out, char **tokptr, unsigned char *data, char *errstr,
- 	tok++;
- 	end = strlen(tok) - 1;
- 	if (tok[end] != '"') {
--	  out->printf(out, "**ASCII %s doesn't end in '\"'", errstr);
-+	  out->eprintf(out, "**ASCII %s doesn't end in '\"'", errstr);
- 	    return EINVAL;
- 	}
- 	if (end > (len - 1))
-@@ -228,7 +228,7 @@ emu_get_bytes(emu_out_t *out, char **tokptr, unsigned char *data, char *errstr,
- 	char         c[3];
- 	/* HEX pw */
- 	if (strlen(tok) != 32) {
--	    out->printf(out, "**HEX %s not 32 HEX characters long", errstr);
-+	    out->eprintf(out, "**HEX %s not 32 HEX characters long", errstr);
- 	    return EINVAL;
- 	}
- 	c[2] = '\0';
-@@ -239,7 +239,7 @@ emu_get_bytes(emu_out_t *out, char **tokptr, unsigned char *data, char *errstr,
- 	    tok++;
- 	    data[i] = strtoul(c, &end, 16);
- 	    if (*end != '\0') {
--		out->printf(out, "**Invalid HEX character in %s", errstr);
-+		out->eprintf(out, "**Invalid HEX character in %s", errstr);
- 		return -1;
- 	    }
- 	}
-@@ -263,12 +263,12 @@ read_command_file(emu_out_t *out, emu_data_t *emu, const char *command_file)
- 
- 	buffer = malloc(INPUT_BUFFER_SIZE);
- 	if (!buffer) {
--	    out->printf(out, "Could not allocate buffer memory\n");
-+	    out->eprintf(out, "Could not allocate buffer memory\n");
- 	    rv = ENOMEM;
- 	    goto out;
- 	}
- 	while (fgets(buffer+pos, INPUT_BUFFER_SIZE-pos, f)) {
--	    out->printf(out, "%s", buffer+pos);
-+	    out->eprintf(out, "%s", buffer+pos);
- 	    if (buffer[pos] == '#')
- 		continue;
- 	    pos = strlen(buffer);
-@@ -318,7 +318,7 @@ sel_enable(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
- 
-     rv = ipmi_mc_enable_sel(mc, max_records, flags);
-     if (rv)
--	out->printf(out, "**Unable to enable sel, error 0x%x\n", rv);
-+	out->eprintf(out, "**Unable to enable sel, error 0x%x\n", rv);
-     return rv;
- }
- 
-@@ -343,9 +343,9 @@ sel_add(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
- 
-     rv = ipmi_mc_add_to_sel(mc, record_type, data, &r);
-     if (rv)
--	out->printf(out, "**Unable to add to sel, error 0x%x\n", rv);
-+	out->eprintf(out, "**Unable to add to sel, error 0x%x\n", rv);
-     else
--	out->printf(out, "Added record %d\n", r);
-+	out->eprintf(out, "Added record %d\n", r);
-     return rv;
- }
- 
-@@ -361,14 +361,14 @@ main_sdr_add(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
- 	if (rv == ENOSPC)
- 	    break;
- 	if (rv) {
--	    out->printf(out, "**Error 0x%x in data byte %d\n", rv, i);
-+	    out->eprintf(out, "**Error 0x%x in data byte %d\n", rv, i);
- 	    return rv;
- 	}
-     }
- 
-     rv = ipmi_mc_add_main_sdr(mc, data, i);
-     if (rv)
--	out->printf(out, "**Unable to add to sdr, error 0x%x\n", rv);
-+	out->eprintf(out, "**Unable to add to sdr, error 0x%x\n", rv);
-     return rv;
- }
- 
-@@ -389,14 +389,14 @@ device_sdr_add(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
- 	if (rv == ENOSPC)
- 	    break;
- 	if (rv) {
--	    out->printf(out, "**Error 0x%x in data byte %d\n", rv, i);
-+	    out->eprintf(out, "**Error 0x%x in data byte %d\n", rv, i);
- 	    return rv;
- 	}
-     }
- 
-     rv = ipmi_mc_add_device_sdr(mc, lun, data, i);
-     if (rv)
--	out->printf(out, "**Unable to add to sdr, error 0x%x\n", rv);
-+	out->eprintf(out, "**Unable to add to sdr, error 0x%x\n", rv);
-     return rv;
- }
- 
-@@ -439,7 +439,7 @@ sensor_add(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
-     while (tok) {
- 	if (strcmp(tok, "poll") == 0) {
- 	    if (handler) {
--		out->printf(out, "**poll given twice in sensor\n", tok);
-+		out->eprintf(out, "**poll given twice in sensor\n", tok);
- 		return -1;
- 	    }
- 
-@@ -449,27 +449,27 @@ sensor_add(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
- 
- 	    tok = mystrtok(NULL, " \t\n", toks);
- 	    if (!tok) {
--		out->printf(out, "**No polled sensor handler given\n", tok);
-+		out->eprintf(out, "**No polled sensor handler given\n", tok);
- 		return -1;
- 	    }
- 
- 	    handler = ipmi_sensor_find_handler(tok);
- 	    if (!handler) {
--		out->printf(out, "**Invalid sensor handler: %s\n", tok);
-+		out->eprintf(out, "**Invalid sensor handler: %s\n", tok);
- 		return -1;
- 	    }
- 
- 	    rv = handler->init(mc, lun, num, toks, handler->cb_data, &rcb_data,
- 			       &errstr);
- 	    if (rv) {
--		out->printf(out, "**Error initializing sensor handler: %s\n", 
-+		out->eprintf(out, "**Error initializing sensor handler: %s\n", 
- 			    errstr);
- 		return rv;
- 	    }
- 	} else if (strcmp(tok, "event-only") == 0) {
- 	    event_only = 1;
- 	} else {
--	    out->printf(out, "**Unknown sensor option: %s\n", tok);
-+	    out->eprintf(out, "**Unknown sensor option: %s\n", tok);
- 	    return -1;
- 	}
- 
-@@ -477,7 +477,7 @@ sensor_add(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
-     }
- 
-     if (handler && event_only) {
--	out->printf(out, "**An event-only sensor cannot be polled\n");
-+	out->eprintf(out, "**An event-only sensor cannot be polled\n");
- 	return -1;
-     }
- 
-@@ -488,7 +488,7 @@ sensor_add(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
- 	if (!rv && handler->postinit) {
- 	    rv = handler->postinit(rcb_data, &errstr);
- 	    if (rv) {
--		out->printf(out, "**Error in sensor handler postinit: %s\n", 
-+		out->eprintf(out, "**Error in sensor handler postinit: %s\n", 
- 			    errstr);
- 	    }
- 	}
-@@ -496,7 +496,7 @@ sensor_add(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
- 	rv = ipmi_mc_add_sensor(mc, lun, num, type, code, event_only);
-     }
-     if (rv)
--	out->printf(out, "**Unable to add to sensor, error 0x%x\n", rv);
-+	out->eprintf(out, "**Unable to add to sensor, error 0x%x\n", rv);
-     return rv;
- }
- 
-@@ -532,7 +532,7 @@ sensor_set_bit(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
- 
-     rv = ipmi_mc_sensor_set_bit(mc, lun, num, bit, value, gen_event);
-     if (rv)
--	out->printf(out, "**Unable to set sensor bit, error 0x%x\n", rv);
-+	out->eprintf(out, "**Unable to set sensor bit, error 0x%x\n", rv);
-     return rv;
- }
- 
-@@ -563,7 +563,7 @@ sensor_set_bit_clr_rest(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **
- 
-     rv = ipmi_mc_sensor_set_bit_clr_rest(mc, lun, num, bit, gen_event);
-     if (rv)
--	out->printf(out, "**Unable to set sensor bit, error 0x%x\n", rv);
-+	out->eprintf(out, "**Unable to set sensor bit, error 0x%x\n", rv);
-     return rv;
- }
- 
-@@ -594,7 +594,7 @@ sensor_set_value(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
- 
-     rv = ipmi_mc_sensor_set_value(mc, lun, num, value, gen_event);
-     if (rv)
--	out->printf(out, "**Unable to set sensor value, error 0x%x\n", rv);
-+	out->eprintf(out, "**Unable to set sensor value, error 0x%x\n", rv);
-     return rv;
- }
- 
-@@ -637,7 +637,7 @@ sensor_set_hysteresis(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **to
-     rv = ipmi_mc_sensor_set_hysteresis(mc, lun, num, support, positive,
- 				       negative);
-     if (rv)
--	out->printf(out, "**Unable to set sensor hysteresis, error 0x%x\n", rv);
-+	out->eprintf(out, "**Unable to set sensor hysteresis, error 0x%x\n", rv);
-     return rv;
- }
- 
-@@ -682,7 +682,7 @@ sensor_set_threshold(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **tok
-     rv = ipmi_mc_sensor_set_threshold(mc, lun, num, support,
- 				      enabled, 1, thresholds);
-     if (rv)
--	out->printf(out, "**Unable to set sensor thresholds, error 0x%x\n", rv);
-+	out->eprintf(out, "**Unable to set sensor thresholds, error 0x%x\n", rv);
-     return rv;
- }
- 
-@@ -759,7 +759,7 @@ sensor_set_event_support(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char *
- 					  assert_support, deassert_support,
- 					  assert_enabled, deassert_enabled);
-     if (rv)
--	out->printf(out, "**Unable to set sensor thresholds, error 0x%x\n", rv);
-+	out->eprintf(out, "**Unable to set sensor thresholds, error 0x%x\n", rv);
-     return rv;
- }
- 
-@@ -819,7 +819,7 @@ mc_add(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
- 	else if (strcmp("persist_sdr", tok) == 0)
- 	    flags |= IPMI_MC_PERSIST_SDR;
- 	else {
--	    out->printf(out, "**Invalid MC flag: %s\n", tok);
-+	    out->eprintf(out, "**Invalid MC flag: %s\n", tok);
- 	    return -1;
- 	}
-     }
-@@ -833,7 +833,7 @@ mc_add(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
- 			 device_revision, major_fw_rev, minor_fw_rev,
- 			 device_support, mfg_id, product_id, flags);
-     if (rv)
--	out->printf(out, "**Unable to add the MC, error 0x%x\n", rv);
-+	out->eprintf(out, "**Unable to add the MC, error 0x%x\n", rv);
-     return rv;
- }
- 
-@@ -890,7 +890,7 @@ mc_set_power(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
- 
-     rv = ipmi_mc_set_power(mc, power, gen_int);
-     if (rv)
--	out->printf(out, "**Unable to set power, error 0x%x\n", rv);
-+	out->eprintf(out, "**Unable to set power, error 0x%x\n", rv);
-     return rv;
- }
- 
-@@ -916,7 +916,7 @@ mc_add_fru_data(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
- 
-     tok = mystrtok(NULL, " \t\n", toks);
-     if (!tok) {
--	out->printf(out, "**No FRU data type given");
-+	out->eprintf(out, "**No FRU data type given");
- 	return -1;
-     }
-     if (strcmp(tok, "file") == 0) {
-@@ -929,13 +929,13 @@ mc_add_fru_data(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
- 
- 	rv = get_delim_str(toks, &frufn, &errstr);
- 	if (rv) {
--	    out->printf(out, "**Error with FRU filename: %d", strerror(rv));
-+	    out->eprintf(out, "**Error with FRU filename: %d", strerror(rv));
- 	    return rv;
- 	}
- 	rv = ipmi_mc_add_fru_file(mc, devid, length, file_offset,
- 				  (void *) frufn);
- 	if (rv)
--	    out->printf(out, "**Unable to add FRU file, error 0x%x\n", rv);
-+	    out->eprintf(out, "**Unable to add FRU file, error 0x%x\n", rv);
- 	
-     } else if (strcmp(tok, "data") == 0) {
- 	for (i=0; i<length; i++) {
-@@ -943,14 +943,14 @@ mc_add_fru_data(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
- 	    if (rv == ENOSPC)
- 		break;
- 	    if (rv) {
--		out->printf(out, "**Error 0x%x in data byte %d\n", rv, i);
-+		out->eprintf(out, "**Error 0x%x in data byte %d\n", rv, i);
- 		return rv;
- 	    }
- 	}
- 
- 	rv = emu_get_uchar(out, toks, &data[i], "data byte", 1);
- 	if (rv != ENOSPC) {
--	    out->printf(out, "**Error: input data too long for FRU\n", rv, i);
-+	    out->eprintf(out, "**Error: input data too long for FRU\n", rv, i);
- 	    return EINVAL;
- 	}
- 
-@@ -958,9 +958,9 @@ mc_add_fru_data(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
- 
- 	rv = ipmi_mc_add_fru_data(mc, devid, length, NULL, data);
- 	if (rv)
--	    out->printf(out, "**Unable to add FRU data, error 0x%x\n", rv);
-+	    out->eprintf(out, "**Unable to add FRU data, error 0x%x\n", rv);
-     } else {
--	out->printf(out, "**FRU type not given, need file or data\n");
-+	out->eprintf(out, "**FRU type not given, need file or data\n");
- 	rv = EINVAL;
-     }
-     return rv;
-@@ -981,28 +981,28 @@ mc_dump_fru_data(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
- 
-     rv = ipmi_mc_get_fru_data_len(mc, devid, &length);
-     if (rv) {
--	out->printf(out, "**Unable to dump FRU data, error 0x%x\n", rv);
-+	out->eprintf(out, "**Unable to dump FRU data, error 0x%x\n", rv);
- 	goto out;
-     }
- 
-     data = malloc(length);
-     if (!data) {
--	out->printf(out, "**Unable to dump FRU data, out of memory\n", rv);
-+	out->eprintf(out, "**Unable to dump FRU data, out of memory\n", rv);
- 	goto out;
-     }
- 
-     rv = ipmi_mc_get_fru_data(mc, devid, length, data);
-     if (rv) {
--	out->printf(out, "**Unable to dump FRU data, error 0x%x\n", rv);
-+	out->eprintf(out, "**Unable to dump FRU data, error 0x%x\n", rv);
- 	goto out;
-     }
- 
-     for (i=0; i<length; i++) {
- 	if ((i > 0) && ((i % 8) == 0))
--	    out->printf(out, "\n");
--	out->printf(out, " 0x%2.2x", data[i]);
-+	    out->eprintf(out, "\n");
-+	out->eprintf(out, " 0x%2.2x", data[i]);
-     }
--    out->printf(out, "\n");
-+    out->eprintf(out, "\n");
- 
-  out:
-     if (data)
-@@ -1021,7 +1021,7 @@ mc_setbmc(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
- 	return rv;
-     rv = ipmi_emu_set_bmc_mc(emu, ipmb);
-     if (rv)
--	out->printf(out, "**Invalid IPMB address\n");
-+	out->eprintf(out, "**Invalid IPMB address\n");
-     return rv;
- }
- 
-@@ -1032,7 +1032,7 @@ atca_enable(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
- 
-     rv = ipmi_emu_atca_enable(emu);
-     if (rv)
--	out->printf(out, "**Unable to enable ATCA mode, error 0x%x\n", rv);
-+	out->eprintf(out, "**Unable to enable ATCA mode, error 0x%x\n", rv);
-     return rv;
- }
- 
-@@ -1056,7 +1056,7 @@ atca_set_site(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
- 
-     rv = ipmi_emu_atca_set_site(emu, hw_address, site_type, site_number);
-     if (rv)
--	out->printf(out, "**Unable to set site type, error 0x%x\n", rv);
-+	out->eprintf(out, "**Unable to set site type, error 0x%x\n", rv);
-     return rv;
- }
- 
-@@ -1072,7 +1072,7 @@ mc_set_num_leds(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
- 
-     rv = ipmi_mc_set_num_leds(mc, count);
-     if (rv)
--	out->printf(out, "**Unable to set number of LEDs, error 0x%x\n", rv);
-+	out->eprintf(out, "**Unable to set number of LEDs, error 0x%x\n", rv);
-     return rv;
- }
- 
-@@ -1085,7 +1085,7 @@ read_cmds(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
- 
-     err = get_delim_str(toks, &filename, &errstr);
-     if (err) {
--	out->printf(out, "Could not get include filename: %s\n", errstr);
-+	out->eprintf(out, "Could not get include filename: %s\n", errstr);
- 	return err;
-     }
- 
-@@ -1097,7 +1097,7 @@ read_cmds(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
-     {
- 	char *nf = malloc(strlen(BASE_CONF_STR) + strlen(filename) + 2);
- 	if (!nf) {
--	    out->printf(out, "Out of memory in include\n", errstr);
-+	    out->eprintf(out, "Out of memory in include\n", errstr);
- 	    goto out_err;
- 	}
- 	strcpy(nf, BASE_CONF_STR);
-@@ -1107,7 +1107,7 @@ read_cmds(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
- 	filename = nf;
- 	err = read_command_file(out, emu, filename);
- 	if (err) {
--	    out->printf(out, "Could not read include file %s\n", filename);
-+	    out->eprintf(out, "Could not read include file %s\n", filename);
- 	}
-     }
- 
-@@ -1147,7 +1147,7 @@ debug_cmd(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
- 	} else if (strcmp(tok, "sol") == 0) {
- 	    level |= DEBUG_SOL;
- 	} else {
--	    out->printf(out, "Invalid debug level '%s', options are 'raw' and 'msg'\n",
-+	    out->eprintf(out, "Invalid debug level '%s', options are 'raw' and 'msg'\n",
- 		   tok);
- 	    return EINVAL;
- 	}
-@@ -1168,7 +1168,7 @@ persist_cmd(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
- 	} else if (strcmp(tok, "off") == 0) {
- 	    persist_enable = 0;
- 	} else {
--	    out->printf(out, "Invalid persist vale '%s', options are 'on' and 'off'\n",
-+	    out->eprintf(out, "Invalid persist vale '%s', options are 'on' and 'off'\n",
- 		   tok);
- 	    return EINVAL;
- 	}
-@@ -1194,18 +1194,18 @@ do_define(emu_out_t *out, emu_data_t *emu, lmc_data_t *mc, char **toks)
- 
-     name = mystrtok(NULL, " \t\n", toks);
-     if (!name) {
--	out->printf(out, "No variable name given for define\n");
-+	out->eprintf(out, "No variable name given for define\n");
- 	return EINVAL;
-     }
-     err = get_delim_str(toks, &value, &errstr);
-     if (err) {
--	out->printf(out, "Could not get variable %s value: %s\n", name, errstr);
-+	out->eprintf(out, "Could not get variable %s value: %s\n", name, errstr);
- 	return err;
-     }
-     err = add_variable(name, value);
-     if (err) {
- 	free(value);
--	out->printf(out, "Out of memory setting variable %s\n", name);
-+	out->eprintf(out, "Out of memory setting variable %s\n", name);
- 	return err;
-     }
-     return 0;
-@@ -1301,7 +1301,7 @@ ipmi_emu_cmd(emu_out_t *out, emu_data_t *emu, char *cmd_str)
- 		    return rv;
- 		rv = ipmi_emu_get_mc_by_addr(emu, ipmb, &mc);
- 		if (rv) {
--		    out->printf(out, "**Invalid MC address\n");
-+		    out->eprintf(out, "**Invalid MC address\n");
- 		    return rv;
- 		}
- 	    }
-@@ -1312,7 +1312,7 @@ ipmi_emu_cmd(emu_out_t *out, emu_data_t *emu, char *cmd_str)
- 	}
-     }
- 
--    out->printf(out, "**Unknown command: %s\n", cmd);
-+    out->eprintf(out, "**Unknown command: %s\n", cmd);
- 
-  out:
-     return rv;
-diff --git a/lanserv/ipmi_sim.c b/lanserv/ipmi_sim.c
-index 9472cce..30c4f27 100644
---- a/lanserv/ipmi_sim.c
-+++ b/lanserv/ipmi_sim.c
-@@ -607,8 +607,8 @@ isim_log(sys_data_t *sys, int logtype, msg_t *msg, const char *format,
- 
-     con = data->consoles;
-     while (con) {
--	con->out.printf(&con->out, "%s", str);
--	con->out.printf(&con->out, "\n");
-+	con->out.eprintf(&con->out, "%s", str);
-+	con->out.eprintf(&con->out, "\n");
- 	con = con->next;
-     }
- #if HAVE_SYSLOG
-@@ -956,7 +956,7 @@ console_bind_ready(int fd, void *cb_data, os_hnd_fd_id_t *id)
-     newcon->shutdown_on_close = 0;
-     newcon->telnet = 1;
-     newcon->tn_pos = 0;
--    newcon->out.printf = emu_printf;
-+    newcon->out.eprintf = emu_printf;
-     newcon->out.data = newcon;
- 
-     setsockopt(rv, IPPROTO_TCP, TCP_NODELAY, (char *)&val, sizeof(val));
-@@ -1463,10 +1463,10 @@ main(int argc, const char *argv[])
-     stdio_console.telnet = 0;
-     stdio_console.tn_pos = 0;
-     if (nostdio) {
--	stdio_console.out.printf = dummy_printf;
-+	stdio_console.out.eprintf = dummy_printf;
- 	stdio_console.out.data = &stdio_console;
-     } else {
--	stdio_console.out.printf = emu_printf;
-+	stdio_console.out.eprintf = emu_printf;
- 	stdio_console.out.data = &stdio_console;
-     }
-     stdio_console.next = NULL;
--- 
-2.14.1
-
diff --git a/meta-oe/recipes-support/openipmi/files/do-not-install-pyc-and-pyo.patch b/meta-oe/recipes-support/openipmi/files/do-not-install-pyc-and-pyo.patch
deleted file mode 100644
index d4e02be..0000000
--- a/meta-oe/recipes-support/openipmi/files/do-not-install-pyc-and-pyo.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Do not install pyc and pyo for python module
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- swig/python/Makefile.am | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/swig/python/Makefile.am b/swig/python/Makefile.am
-index da95a81..97a62bf 100644
---- a/swig/python/Makefile.am
-+++ b/swig/python/Makefile.am
-@@ -33,8 +33,6 @@ CLEANFILES = OpenIPMI_wrap.c OpenIPMI.py OpenIPMI.pyo OpenIPMI.pyc
- install-exec-local: _OpenIPMI.la OpenIPMI.py OpenIPMI.pyc OpenIPMI.pyo
- 	$(INSTALL) -d $(DESTDIR)$(PYTHON_INSTALL_DIR)
- 	$(INSTALL_DATA) OpenIPMI.py "$(DESTDIR)$(PYTHON_INSTALL_DIR)"
--	$(INSTALL_DATA) OpenIPMI.pyc "$(DESTDIR)$(PYTHON_INSTALL_DIR)"
--	$(INSTALL_DATA) OpenIPMI.pyo "$(DESTDIR)$(PYTHON_INSTALL_DIR)"
- 	if test "x$(PYTHON_GUI_DIR)" = "xopenipmigui"; then \
- 	    $(INSTALL) -d $(DESTDIR)$(bindir); \
- 	    $(INSTALL_SCRIPT) $(srcdir)/openipmigui.py "$(DESTDIR)$(bindir)/openipmigui";\
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch b/meta-oe/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch
deleted file mode 100644
index 9a568b2..0000000
--- a/meta-oe/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Author: Aws Ismail <aws.ismail@windriver.com>
-Date:   Thu Jun 7 16:00:13 2012 -0400
-
-    This patch fixes the error during the install stage when
-    creating a symbolic link for opeipmish in openipmi/cmdlang
-    
-    Upstream-Status: Pending
-    
-    Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
-
-diff --git a/cmdlang/Makefile.am b/cmdlang/Makefile.am
-index 92d6e83..f6039f9 100644
---- a/cmdlang/Makefile.am
-+++ b/cmdlang/Makefile.am
-@@ -36,6 +36,7 @@ CLEANFILES = libOpenIPMIcmdlang.map
- # compatability.
- install-data-local:
- 	rm -f $(DESTDIR)$(bindir)/ipmish
-+	mkdir -p $(DESTDIR)$(bindir)/
- 	$(LN_S) openipmish $(DESTDIR)$(bindir)/ipmish
- 
- uninstall-local:
diff --git a/meta-oe/recipes-support/openipmi/files/include_sys_types.patch b/meta-oe/recipes-support/openipmi/files/include_sys_types.patch
deleted file mode 100644
index 58ec5d8..0000000
--- a/meta-oe/recipes-support/openipmi/files/include_sys_types.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-include sys/types.h for u_int32_t
-
-ui.c:340:5: error: unknown type name 'u_int32_t'; did you mean 'uint32_t'?
-     u_int32_t     addr;
-     ^~~~~~~~~
-Index: OpenIPMI-2.0.22/ui/ui.c
-===================================================================
---- OpenIPMI-2.0.22.orig/ui/ui.c
-+++ OpenIPMI-2.0.22/ui/ui.c
-@@ -42,6 +42,7 @@
- #include <fcntl.h>
- #include <time.h>
- #include <sys/time.h>
-+#include <sys/types.h>
- #include <ctype.h>
- 
- #include <OpenIPMI/selector.h>
diff --git a/meta-oe/recipes-support/openipmi/files/ipmi-init-fix-the-arguments.patch b/meta-oe/recipes-support/openipmi/files/ipmi-init-fix-the-arguments.patch
deleted file mode 100644
index 51a398b..0000000
--- a/meta-oe/recipes-support/openipmi/files/ipmi-init-fix-the-arguments.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Subject: [PATCH] ipmi-init: fix the arguments
-
-The functions success/failure/warning defined in /etc/init.d/functions
-(provided by initscripts) only accepts numeric argument as return code,
-not a string.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- ipmi.init | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/ipmi.init b/ipmi.init
-index 2ebcd94..d8161c5 100644
---- a/ipmi.init
-+++ b/ipmi.init
-@@ -45,17 +45,17 @@ elif [ -r /etc/init.d/functions ]; then
- 	case "$ACTION" in
- 	    success)
- 		echo -n $*
--		success "$*"
-+		success 0
- 		echo
- 		;;
- 	    failure)
- 		echo -n $*
--		failure "$*"
-+		failure 1
- 		echo
- 		;;
- 	    warning)
- 		echo -n $*
--		warning "$*"
-+		warning 0
- 		echo
- 		;;
- 	    *)
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-support/openipmi/files/ipmi.service b/meta-oe/recipes-support/openipmi/files/ipmi.service
deleted file mode 100644
index 6fe1378..0000000
--- a/meta-oe/recipes-support/openipmi/files/ipmi.service
+++ /dev/null
@@ -1,12 +0,0 @@
-[Unit]
-Description=IPMI Driver
-After=network.target
-
-[Service]
-Type=oneshot
-RemainAfterExit=yes
-ExecStart=@LIBEXECDIR@/openipmi-helper start
-ExecStop=@LIBEXECDIR@/openipmi-helper stop-all
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-oe/recipes-support/openipmi/files/openipmi-helper b/meta-oe/recipes-support/openipmi/files/openipmi-helper
deleted file mode 100755
index 4cebfb9..0000000
--- a/meta-oe/recipes-support/openipmi/files/openipmi-helper
+++ /dev/null
@@ -1,512 +0,0 @@
-#!/bin/sh
-#############################################################################
-#
-# ipmi:		OpenIPMI Driver helper script
-#
-# Authors:	Jan Safranek <jsafrane@redhat.com>
-#
-# Based on IPMI init script by:
-#               Matt Domsch <Matt_Domsch@dell.com>
-#               Chris Poblete <Chris_Poblete@dell.com>
-#
-# Status return code bits
-# no bits set = no errors
-# bit 0 set = minimum modules aren't loaded
-# bit 1 set = requested feature module isn't loaded
-# bit 2 set = /dev/ipmi0 (or /dev/imb if using that instead) doesn't exist
-# bit 3 set = /dev/watchdog doesn't exist
-# bit 4 set = lockfile doesn't exist
-# bit 5 set = modules are loaded even when asked to be unloaded
-
-CONFIGFILE=/etc/sysconfig/ipmi
-# source config info
-[ -r ${CONFIGFILE} ] && . ${CONFIGFILE}
-
-#############################################################################
-# GLOBALS
-#############################################################################
-MODULE_NAME="ipmi"
-INTF_NUM=0
-
-IPMI_SMB_MODULE_NAME="ipmi_smb"
-IPMI_SI_MODULE_NAME="ipmi_si"
-kernel=`uname -r | cut -d. -f1-2`
-if [ "${kernel}" == "2.4" ]; then
-    IPMI_SMB_MODULE_NAME="ipmi_smb_intf"
-    IPMI_SI_MODULE_NAME="ipmi_si_drv"
-fi
-
-MODULES_INTERFACES=""
-[ "${DEV_IPMI}" = "yes" ] && MODULES_INTERFACES="${MODULES_INTERFACES} ipmi_devintf"
-[ "${IPMI_IMB}" = "yes" ] && MODULES_INTERFACES="${MODULES_INTERFACES} ipmi_imb"
-
-MODULES_FEATURES=""
-[ "${IPMI_WATCHDOG}" = "yes" ] && MODULES_FEATURES="${MODULES_FEATURES} ipmi_watchdog"
-[ "${IPMI_POWEROFF}" = "yes" ] && MODULES_FEATURES="${MODULES_FEATURES} ipmi_poweroff"
-
-MODULES_HW=""
-[ "${IPMI_SI}"  = "yes" ] && MODULES_HW="${MODULES_HW} ${IPMI_SI_MODULE_NAME}"
-[ "${IPMI_SMB}" = "yes" ] && MODULES_HW="${MODULES_HW} ${IPMI_SMB_MODULE_NAME}"
-
-MODULES_BASE="ipmi_msghandler"
-MODULES="${MODULES_INTERFACES} ${MODULES_FEATURES} ${MODULES_HW} ${MODULES_BASE}"
-
-RETVAL=0
-LOCKFILE=/var/lock/subsys/ipmi
-DEV_IPMI_TIMEOUT=150
-
-UDEV_EXISTS=0
-if [ -e /sbin/udev -o -e /sbin/udevd ]; then
-    UDEV_EXISTS=1
-fi
-
-#############################################################################
-# NOTES:
-# * /dev/ipmi0 is unconditionally deleted here on ipmi_devintf unload,
-#   because SLES9 and RHEL4 kernels don't send a message for udev to delete
-#   it for us.
-# 
-#############################################################################
-
-modules_loaded_verbose()
-{
-	OnePlusLoaded=0
-	OnePlusUnloaded=0
-	for m in $@; do
-		if /sbin/lsmod | grep $m >/dev/null 2>&1 ; then
-			echo "$m module loaded."
-			OnePlusLoaded=1
-		else
-			echo "$m module not loaded."
-			OnePlusUnloaded=1
-		fi
-	done
-}
-
-modules_loaded()
-{
-	OnePlusLoaded=0
-	OnePlusUnloaded=0
-	for m in $@; do
-		if /sbin/lsmod | grep $m >/dev/null 2>&1 ; then
-			OnePlusLoaded=1
-		else
-			OnePlusUnloaded=1
-		fi
-	done
-}
-
-device_node_exists ()
-{
-	if [ -e "$1" ]; then
-		echo "$1 exists."
-		return 1
-	fi
-	echo "$1 does not exist."
-	return 0
-}
-
-minimum_modules_loaded()
-{
-        rc_base=1
-	rc_hw=1
-        modules_loaded_verbose "${MODULES_BASE}"
-	[ ${OnePlusLoaded} -eq 0 ] && rc_base=0
-	    
-	modules_loaded_verbose "${MODULES_HW}"
-	[ ${OnePlusLoaded} -eq 0 ] && rc_hw=0
-	
-	return $((rc_base && rc_hw))
-}
-
-#############################################################################
-
-load_si()
-{
-	if [ "${IPMI_SI}" = "yes" ]; then
-		modprobe ${IPMI_SI_MODULE_NAME} > /dev/null 2>&1
-		modules_loaded ${IPMI_SI_MODULE_NAME}
-		[ ${OnePlusLoaded} -ne 1 ] && RETVAL=$((RETVAL | 1))
-	fi
-}
-
-load_smb()
-{
-	if [ "${IPMI_SMB}" = "yes" ]; then
-		modprobe ${IPMI_SMB_MODULE_NAME} > /dev/null 2>&1
-		modules_loaded ${IPMI_SMB_MODULE_NAME}
-		[ ${OnePlusLoaded} -ne 1 ] && RETVAL=$((RETVAL | 1))
-	fi
-}
-
-load_hw_modules()
-{
-	load_si
-	load_smb
-}
-
-start_watchdog_common()
-{
-	load_hw_modules
-	modprobe ipmi_watchdog ${IPMI_WATCHDOG_OPTIONS} > /dev/null 2>&1
-	modules_loaded ipmi_watchdog
-	[ ${OnePlusUnloaded} -ne 0 ] &&
-		RETVAL=$((RETVAL | 2)) &&
-		echo "Watchdog startup failed: cannot load ipmi_watchdog module" &&
-		return
-	if [ ${UDEV_EXISTS} -eq 0 -a ! -e /dev/watchdog ]; then
-		mknod -m 0600 /dev/watchdog c 10 130
-		[ $? -ne 0 ] &&
-			RETVAL=$((RETVAL | 8)) &&
-			echo "Watchdog startup failed: cannot create /dev/watchdog" &&
-			return
-	fi
-}
-
-start_watchdog_quiet()
-{
-	[ "${IPMI_WATCHDOG}" != "yes" ] &&
-		return
-	start_watchdog_common
-}
-
-start_watchdog()
-{
-	[ "${IPMI_WATCHDOG}" != "yes" ] &&
-		RETVAL=$((RETVAL | 2)) &&
-		echo "Watchdog not configured" &&
-		return
-	start_watchdog_common
-}
-
-stop_watchdog()
-{
-	modprobe -q -r ipmi_watchdog > /dev/null 2>&1
-	modules_loaded ipmi_watchdog
-	if [ ${OnePlusLoaded} -ne 0 ]; then
-	    RETVAL=$((RETVAL | 32))
-	    echo "Watchog shutdown failed: cannot unload ipmi_watchdog module"
-	else
-	    if [ "${IPMI_WATCHDOG}" = "yes" ]; then
-		[ ${UDEV_EXISTS} -eq 0 ] && rm -f /dev/watchdog
-	    fi
-	fi
-}
-
-stop_watchdog_quiet()
-{
-	modprobe -q -r ipmi_watchdog > /dev/null 2>&1
-	modules_loaded ipmi_watchdog
-	if [ ${OnePlusLoaded} -ne 0 ]; then
-	    RETVAL=$((RETVAL | 32))
-	else
-	    if [ "${IPMI_WATCHDOG}" = "yes" ]; then
-		[ ${UDEV_EXISTS} -eq 0 ] && rm -f /dev/watchdog
-	    fi
-	fi
-}
-
-start_powercontrol_common()
-{
-	local poweroff_opts=""
-	load_hw_modules
-	if [ "${IPMI_POWERCYCLE}" == "yes" ]; then
-	    modinfo ipmi_poweroff 2>/dev/null | grep poweroff_control > /dev/null 2>&1 && \
-		poweroff_opts="poweroff_control=2"
-	    modinfo ipmi_poweroff 2>/dev/null | grep poweroff_powercycle > /dev/null 2>&1 && \
-		poweroff_opts="poweroff_powercycle=1"
-	fi
-	modprobe ipmi_poweroff "${poweroff_opts}" > /dev/null 2>&1
-	modules_loaded ipmi_poweroff
-	[ ${OnePlusUnloaded} -ne 0 ] &&
-		RETVAL=$((RETVAL | 2)) &&
-		echo "Powercontroll startup failed: cannot load ipmi_poweroff module" &&
-		return
-}
-
-start_powercontrol_quiet()
-{
-	[ "${IPMI_POWEROFF}" != "yes" ] &&
-		return
-	start_powercontrol_common
-}
-
-start_powercontrol()
-{
-	[ "${IPMI_POWEROFF}" != "yes" ] &&
-		RETVAL=$((RETVAL | 2)) &&
-		echo "Powercontroll not configured" &&
-		return
-	start_powercontrol_common
-}
-
-stop_powercontrol()
-{
-	modprobe -q -r ipmi_poweroff > /dev/null 2>&1
-	modules_loaded ipmi_poweroff
-	if [ ${OnePlusLoaded} -ne 0 ]; then
-	    RETVAL=$((RETVAL | 32))
-	    echo "Powercontroll shutdown failed: cannot unload ipmi_poweroff module"
-	fi
-}
-
-stop_powercontrol_quiet()
-{
-	modprobe -q -r ipmi_poweroff > /dev/null 2>&1
-	modules_loaded ipmi_poweroff
-	[ ${OnePlusLoaded} -ne 0 ] && RETVAL=$((RETVAL | 32))
-}
-
-#############################################################################
-unload_all_ipmi_modules()
-{
-	stop_watchdog_quiet
-	stop_powercontrol_quiet
-	for m in ${MODULES}; do
-		modprobe -q -r ${m} > /dev/null 2>&1
-	done
-        # delete interface node ONLY if ipmi_devintf is unloaded
-        [ `lsmod | grep -c "ipmi_devintf"` -eq 0 ] &&
-	        rm -f "/dev/ipmi${INTF_NUM}"
-}
-
-unload_ipmi_modules_leave_features()
-{
-	for m in ${MODULES_INTERFACES}; do
-		modprobe -q -r ${m} > /dev/null 2>&1
-	done
-        # delete interface node ONLY if ipmi_devintf is unloaded
-        [ `lsmod | grep -c "ipmi_devintf"` -eq 0 ] &&
-	        rm -f "/dev/ipmi${INTF_NUM}"
-	lsmod | egrep -q "ipmi_(poweroff|watchdog)" > /dev/null 2>&1
-	if [ "$?" -ne "0" ]; then
-		stop_watchdog_quiet
-		stop_powercontrol_quiet
-		for m in ${MODULES}; do
-			modprobe -q -r ${m} > /dev/null 2>&1
-		done
-	fi
-}
-
-#############################################################################
-load_ipmi_modules ()
-{
-	local locdelay
-	modprobe ipmi_msghandler > /dev/null 2>&1
-	modules_loaded ipmi_msghandler
-	[ ${OnePlusLoaded} -ne 1 ] && unload_all_ipmi_modules && RETVAL=$((RETVAL | 1)) && return
-	load_hw_modules
-	[ $((RETVAL & 1)) -eq 1 ] && unload_all_ipmi_modules && RETVAL=$((RETVAL | 1)) && return
-
-	if [ "${DEV_IPMI}" = "yes" ]; then
-		modprobe ipmi_devintf > /dev/null 2>&1
-		modules_loaded ipmi_devintf
-		RETVAL=$((RETVAL & ~2))
-		[ ${OnePlusLoaded} -eq 0 ] && RETVAL=$((RETVAL | 2))
-		if [ ${OnePlusLoaded} -eq 1 ]; then
-			if [ ${UDEV_EXISTS} -eq 0 ]; then
-				DEVMAJOR=`cat /proc/devices | awk '/ipmidev/{print $1}'`
-				rm -f /dev/ipmi${INTF_NUM}
-				mknod -m 0600 /dev/ipmi${INTF_NUM} c ${DEVMAJOR} 0 || RETVAL=$((RETVAL | 4))
-			fi
-
-			# udev can take several seconds to create /dev/ipmi0, 
-			# but it happens asynchronously, so delay here
-			locdelay=${DEV_IPMI_TIMEOUT}
-			while [ ! -e /dev/ipmi${INTF_NUM} -a ${locdelay} -gt 0 ]; do
-				locdelay=$((locdelay - 1))
-				sleep 0.1
-			done
-		fi
-	fi
-
-	if [ "${IPMI_IMB}" = "yes" ]; then
-		modprobe ipmi_imb > /dev/null 2>&1
-		modules_loaded ipmi_imb
-		RETVAL=$((RETVAL & ~2))
-		[ ${OnePlusLoaded} -eq 0 ] && RETVAL=$((RETVAL | 2))
-		if [ ${OnePlusLoaded} -eq 1 ]; then
-			DEVMAJOR=`cat /proc/devices | awk '/imb/{print $1}'`
-			rm -f /dev/imb
-			mknod -m 0600 /dev/imb c ${DEVMAJOR} 0 || RETVAL=$((RETVAL | 4))
-		fi
-	fi
-
-	# Per Corey Minyard, essentially no one uses ipmi_radisys
-	# and we don't want to encourage its further use
-	# so it won't be handled here.
-	return
-}
-
-#############################################################################
-start()
-{
-	load_ipmi_modules
-	if [ ${RETVAL} -eq 0 ]; then
-		touch ${LOCKFILE}
-	else
-		if [ $((RETVAL & 1)) -eq 1 ]; then
-			echo "Startup failed."
-		else
-			touch ${LOCKFILE} && echo "Warning!?"
-		fi
-	fi
-	start_watchdog_quiet
-	start_powercontrol_quiet
-}
-
-#############################################################################
-stop()
-{
-	unload_ipmi_modules_leave_features
-	modules_loaded ${MODULES_INTERFACES}
-	if [ ${OnePlusLoaded} -ne 0 ]; then
-		RETVAL=$((RETVAL | 32))
-		echo "Shutdown failed, something may be in use"
-	else
-		rm -f ${LOCKFILE}
-	fi
-}
-
-stop_all()
-{
-	unload_all_ipmi_modules
-	modules_loaded ${MODULES}
-	if [ ${OnePlusLoaded} -ne 0 ]; then
-		RETVAL=$((RETVAL | 32))
-		echo "Shutdown failed, something may be in use"
-	else
-		rm -f ${LOCKFILE}
-	fi
-}
-
-#############################################################################
-restart()
-{
-	stop_all
-	RETVAL=0
-	start
-}
-
-#############################################################################
-
-reload()
-{
-	stop_all
-	RETVAL=0
-	start
-}
-
-#############################################################################
-
-status_all()
-{
-	minimum_modules_loaded
-	[ $? -eq 0 ] && RETVAL=$((RETVAL | 1))
-	
-	modules_loaded_verbose ${MODULES_FEATURES} ${MODULES_INTERFACES}
-	[ ${OnePlusUnloaded} -ne 0 ] && RETVAL=$((RETVAL | 2))
-
-	if [ "${DEV_IPMI}" = "yes" ]; then 
-	    device_node_exists /dev/ipmi${INTF_NUM}
-	    [ $? -eq 0 ] && RETVAL=$((RETVAL | 4))
-	fi
-
-	if [ "${IPMI_IMB}" = "yes" ]; then
-	    device_node_exists /dev/imb
-	    [ $? -eq 0 ] && RETVAL=$((RETVAL | 4))
-	fi
-
-	if [ "${IPMI_WATCHDOG}" = "yes" ]; then
-	    device_node_exists /dev/watchdog
-	    [ $? -eq 0 ] && RETVAL=$((RETVAL | 8))
-	fi
-
-	[ ! -e ${LOCKFILE} ] && RETVAL=$((RETVAL | 16))
-}
-
-status()
-{
-	minimum_modules_loaded
-	[ $? -eq 0 ] && RETVAL=$((RETVAL | 1))
-	
-	if [ "${DEV_IPMI}" = "yes" ]; then 
-	    modules_loaded_verbose ipmi_devintf
-	    [ ${OnePlusLoaded} -eq 0 ] && RETVAL=$((RETVAL | 2))
-
-	    device_node_exists /dev/ipmi${INTF_NUM}
-	    [ $? -eq 0 ] && RETVAL=$((RETVAL | 4))
-	fi
-
-	if [ "${IPMI_IMB}" = "yes" ]; then
-	    device_node_exists /dev/imb
-	    [ $? -eq 0 ] && RETVAL=$((RETVAL | 4))
-	fi
-}
-
-status_watchdog()
-{
-	minimum_modules_loaded
-	[ $? -eq 0 ] && RETVAL=$((RETVAL | 1))
-
-	modules_loaded_verbose ipmi_watchdog
-	[ ${OnePlusLoaded} -eq 0 ] && RETVAL=$((RETVAL | 2))
-
-	device_node_exists /dev/watchdog
-	[ $? -eq 0 ] && RETVAL=$((RETVAL | 8))
-}
-
-status_powercontrol()
-{
-	minimum_modules_loaded
-	[ $? -eq 0 ] && RETVAL=$((RETVAL | 1))
-
-	modules_loaded_verbose ipmi_powercontrol
-	[ ${OnePlusLoaded} -eq 0 ] && RETVAL=$((RETVAL | 2))
-}
-
-#############################################################################
-usage ()
-{
-	echo $"Usage: $0 {start|stop|status" 1>&2
-	echo $"          restart|condrestart|try-restart|reload|force-reload" 1>&2
-	echo $"          start-watchdog|stop-watchdog|status-watchdog" 1>&2
-	echo $"          start-powercontrol|stop-powercontrol|status-powercontrol" 1>&2
-	echo $"          stop-all|status-all}" 1>&2
-	RETVAL=2
-}
-
-condrestart ()
-{
-	[ -e ${LOCKFILE} ] && restart
-}
-
-#############################################################################
-# MAIN
-#############################################################################
-case "$1" in
-	start) start ;;
-	stop)  stop ;;
-	restart) restart ;;
-	force-reload) reload ;;
-	reload) reload ;;
-	status)	status ;;
-	status-all) status_all ;;
-	condrestart) condrestart ;;
-	try-restart) condrestart ;;
-	start-watchdog) start_watchdog ;;
-	stop-watchdog) stop_watchdog ;;
-	status-watchdog) status_watchdog ;;
-	start-powercontrol) start_powercontrol ;;
-	stop-powercontrol) stop_powercontrol ;;
-	status-powercontrol) status_powercontrol ;;
-	stop-all) stop_all ;;
-	*) usage ;;
-esac
-
-exit ${RETVAL}
-
-#############################################################################
-# end of file
-#############################################################################
-
diff --git a/meta-oe/recipes-support/openipmi/files/openipmi-no-openipmigui-man.patch b/meta-oe/recipes-support/openipmi/files/openipmi-no-openipmigui-man.patch
deleted file mode 100644
index 1fa68f9..0000000
--- a/meta-oe/recipes-support/openipmi/files/openipmi-no-openipmigui-man.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Author: Aws Ismail <aws.ismail@windriver.com>
-Date:   Thu Jun 7 12:28:34 2012 -0400
-
-    This patch was carried over from WRL4.3 (openipmi v2.0.16)
-    
-    It was updated for openipmi v2.0.19
-    
-    Disable making openipmigui man page since we don't need it
-    
-    Upstream-Status: Pending
-    
-    Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
-    Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-
-diff --git a/man/Makefile.am b/man/Makefile.am
-index 632f55b..5ce79f5 100644
---- a/man/Makefile.am
-+++ b/man/Makefile.am
-@@ -1,6 +1,6 @@
- 
- man_MANS = ipmi_ui.1 openipmicmd.1 openipmish.1 ipmi_cmdlang.7 \
--	openipmigui.1 openipmi_conparms.7 solterm.1 rmcp_ping.1 \
-+	openipmi_conparms.7 solterm.1 rmcp_ping.1 \
- 	openipmi_eventd.1
- 
- EXTRA_DIST = $(man_MANS)
diff --git a/meta-oe/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch b/meta-oe/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
deleted file mode 100644
index 83485a9..0000000
--- a/meta-oe/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From aa0dc0783a6ff5fb56c914b640836223e3c192bb Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Mon, 29 Dec 2014 18:16:04 +0800
-Subject: [PATCH] remove host path from la_LDFLAGS
-
-Upstream-Status: Inappropriate [ cross compile specific ]
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- cmdlang/Makefile.am |    2 +-
- glib/Makefile.am    |    4 ++--
- tcl/Makefile.am     |    2 +-
- unix/Makefile.am    |    4 ++--
- 4 files changed, 6 insertions(+), 6 deletions(-)
-
-Index: OpenIPMI-2.0.24/cmdlang/Makefile.am
-===================================================================
---- OpenIPMI-2.0.24.orig/cmdlang/Makefile.am
-+++ OpenIPMI-2.0.24/cmdlang/Makefile.am
-@@ -15,8 +15,7 @@ libOpenIPMIcmdlang_la_SOURCES = cmdlang.
- libOpenIPMIcmdlang_la_LIBADD = -lm \
- 	$(top_builddir)/utils/libOpenIPMIutils.la \
- 	$(top_builddir)/lib/libOpenIPMI.la
--libOpenIPMIcmdlang_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-L$(libdir)
-+libOpenIPMIcmdlang_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION)
- 
- bin_PROGRAMS = openipmish
- 
-Index: OpenIPMI-2.0.24/unix/Makefile.am
-===================================================================
---- OpenIPMI-2.0.24.orig/unix/Makefile.am
-+++ OpenIPMI-2.0.24/unix/Makefile.am
-@@ -10,14 +10,12 @@ lib_LTLIBRARIES = libOpenIPMIposix.la li
- libOpenIPMIpthread_la_SOURCES = posix_thread_os_hnd.c selector.c
- libOpenIPMIpthread_la_LIBADD = -lpthread $(GDBM_LIB) \
- 	$(top_builddir)/utils/libOpenIPMIutils.la $(RT_LIB)
--libOpenIPMIpthread_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-L$(libdir)
-+libOpenIPMIpthread_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION)
- 
- libOpenIPMIposix_la_SOURCES = posix_os_hnd.c selector.c
- libOpenIPMIposix_la_LIBADD = $(top_builddir)/utils/libOpenIPMIutils.la \
- 	$(GDBM_LIB) $(RT_LIB)
--libOpenIPMIposix_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-L$(libdir)
-+libOpenIPMIposix_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION)
- 
- noinst_HEADERS = heap.h
- 
diff --git a/meta-oe/recipes-support/openipmi/openipmi_2.0.24.bb b/meta-oe/recipes-support/openipmi/openipmi_2.0.24.bb
deleted file mode 100644
index a4f63c5..0000000
--- a/meta-oe/recipes-support/openipmi/openipmi_2.0.24.bb
+++ /dev/null
@@ -1,110 +0,0 @@
-SUMMARY = "IPMI (Intelligent Platform Management Interface) library and tools"
-DESCRIPTION = "OpenIPMI is an effort to create a full-function IPMI system, \
-to allow full access to all IPMI information on a server \
-and to abstract it to a level that will make it easy to use"
-
-HOMEPAGE = "http://openipmi.sourceforge.net"
-
-DEPENDS = " \
-    glib-2.0 \
-    ncurses \
-    net-snmp \
-    openssl \
-    popt \
-    python \
-    swig-native \
-    "
-
-LICENSE = "GPLv2 & LGPLv2.1 & BSD"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://COPYING.LIB;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
-                    file://COPYING.BSD;md5=4b318d4160eb69c8ee53452feb1b4cdf \
-                    "
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${PV}.tar.gz \
-           file://fix-symlink-install-error-in-cmdlang.patch \
-           file://openipmi-no-openipmigui-man.patch \
-           file://openipmi-remove-host-path-from-la_LDFLAGS.patch \
-           file://ipmi-init-fix-the-arguments.patch \
-           file://do-not-install-pyc-and-pyo.patch \
-           file://include_sys_types.patch \
-           file://openipmi-helper \
-           file://ipmi.service \
-           file://0001-lanserv-Rename-struct-parameter-printf-for-namespace.patch \
-           "
-
-S = "${WORKDIR}/OpenIPMI-${PV}"
-SRC_URI[md5sum] = "58f9542cbfcb5fe250b77cf88345e1ec"
-SRC_URI[sha256sum] = "bca39a27071278a8b74610181ede8df51e155e5e9031bc8eaa3699d1720292b4"
-
-inherit autotools-brokensep pkgconfig pythonnative perlnative update-rc.d systemd
-
-EXTRA_OECONF = "--disable-static \
-                --with-perl='${STAGING_BINDIR_NATIVE}/perl-native/perl' \
-                --with-python='${STAGING_BINDIR_NATIVE}/python-native/python' \
-                --with-pythoninstall='${PYTHON_SITEPACKAGES_DIR}' \
-                --with-glibver=2.0"
-
-PACKAGECONFIG ??= "gdbm"
-PACKAGECONFIG[gdbm] = "ac_cv_header_gdbm_h=yes,ac_cv_header_gdbm_h=no,gdbm,"
-
-PACKAGES += "${PN}-perl ${PN}-python"
-
-FILES_${PN}-perl = " \
-    ${libdir}/perl/vendor_perl/*/OpenIPMI.pm \
-    ${libdir}/perl/vendor_perl/*/auto/OpenIPMI/OpenIPMI.so \
-    "
-
-FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
-
-FILES_${PN}-dbg += " \
-    ${libdir}/perl/vendor_perl/*/auto/OpenIPMI/.debug \
-    ${PYTHON_SITEPACKAGES_DIR}/.debug \
-    "
-
-do_configure () {
-
-    # Let's perform regular configuration first then handle perl issues.
-    autotools_do_configure
-
-    perl_ver=`perl -V:version | cut -d\' -f 2`
-    
-    # Force openipmi perl bindings to be compiled using perl-native instead of
-    # the host's perl. Set the proper install directory for the resulting
-    # openipmi.pm and openipmi.so
-    for i in ${S}/swig/Makefile ${S}/swig/perl/Makefile; do
-        echo "SAL: i = $i"
-        echo "SAL: STAGING_INCDIR_NATIVE = $STAGING_INCDIR_NATIVE"
-        echo "SAL: libdir = $libdir"
-        sed -i -e "/^PERL_CFLAGS/s:-I/usr/local/include:-I${STAGING_INCDIR_NATIVE}:g" $i
-        sed -i -e "/^PERL_INSTALL_DIR/s:^PERL_INSTALL_DIR = .*:PERL_INSTALL_DIR = ${libdir}/perl/vendor_perl/$perl_ver:g" $i
-    done
-}
-
-do_install_append () {
-    echo "SAL: D = $D"
-    echo "SAL: libdir = $libdir"
-    install -m 0755 -d ${D}${sysconfdir}/sysconfig ${D}${sysconfdir}/init.d
-    install -m 0755 ${S}/ipmi.init ${D}${sysconfdir}/init.d/ipmi
-    install -m 0644 ${S}/ipmi.sysconf ${D}${sysconfdir}/sysconfig/ipmi
-    # SAL: mv: cannot stat `/localdisk/loadbuild/slittle1/workspace/cgts_test_build/bitbake_build/tmp/work/x86_64-wrs-linux/openipmi-2.0.19-r4/image/usr/lib64/perl5': No such file or directory
-    # SAL: real path to perl is /localdisk/loadbuild/slittle1/workspace/cgts_test_build/bitbake_build/tmp/work/x86_64-wrs-linux/perl-5.14.2-r8.3/package/usr/lib64/perl5 and it is a symlink to perl so no need to mv.
-    if [ -d ${D}${libdir}/perl5 ]
-    then
-        mv ${D}${libdir}/perl5 ${D}${libdir}/perl
-    fi
- 
-    # for systemd
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0664 ${WORKDIR}/ipmi.service ${D}${systemd_unitdir}/system
-    sed -i -e "s,@LIBEXECDIR@,${libexecdir},g" ${D}${systemd_unitdir}/system/ipmi.service
-    install -d ${D}${libexecdir}
-    install -m 0755 ${WORKDIR}/openipmi-helper ${D}${libexecdir}
-}
-
-INITSCRIPT_NAME = "ipmi"
-INITSCRIPT_PARAMS = "start 30 . stop 70 0 1 2 3 4 5 6 ."
-
-SYSTEMD_SERVICE_${PN} = "ipmi.service"
-SYSTEMD_AUTO_ENABLE = "disable"
-- 
1.8.3.1


