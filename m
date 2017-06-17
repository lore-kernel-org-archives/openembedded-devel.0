Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 422A678372
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jun 2017 17:21:58 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id x63so35659708pff.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jun 2017 10:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qcweOcCeQ4wok3GrvsxyGNqXdoTYOIzhqoOk2zQ5JPc=;
	b=OIfE0liTgopD9tVzMXpf9va1Wt6/SBRZuGnWk+9r8z2uNGOuxgtkISACyiuOaxsV3w
	RgWplqQeFvrwiwwt/diB3fmtQTQXlNjA8O9JJ7zJyE+wCd8iVm/kTPvusPoF/5DW5k+E
	m9YeYg+10ZWhPgFKO8fQbTBmpXFH2qYx5mgiT5j8wvyQJZftGHhOcF+5rY6F2NnNi2/x
	tjSovB3ZKzj993ZyzuCCG5l0Rt4yZziTNX4Z4sSX302G679UnAlzTknso7aEQUv24Swy
	6nkmuwVUEse2bXm2DTz9Da4lG8eIVro2VMcs98XPTnGVyE/IkMwrwC6oKDHYIbZDXlEK
	vIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qcweOcCeQ4wok3GrvsxyGNqXdoTYOIzhqoOk2zQ5JPc=;
	b=n9sEYkULbLNlraMWnxy5+duVV1w8famBpR/4XfAviXg4IMFFUVOlAOZcR1hvEvsxh1
	TPC+s2h/ZSJdp9y2jJoEgg/qTp7CF6LxCsYgwWWHVm9eGCok2fjvpM9eoRMWbrEqA3Db
	OPNQcYvx52LH2l61BeFUSQhmKYJBsFgpI8DbObTqlZi696WkP5A8ldWhHjGg3yryK31F
	KHONh35grWaFhA2R9iR8pRcN3XCVDA5DMlArs4YvB2jgSQvMnT4t4d+JRFsAgHzslQH+
	c7lsBnxE1Rt8hu1gY8LCBu7/TWjPtUX08egRfd2rZQ3Ano+6vwSaHJH4bIfaFndWSB/h
	d/sw==
X-Gm-Message-State: AKS2vOwrIBQPaAPDDa+BQ/uitLIemETMo0CfNLqfAEYA36LAsXm0YIzZ
	KZb3CsYpWLAkohPV
X-Received: by 10.98.141.134 with SMTP id p6mr7160554pfk.68.1497720119406;
	Sat, 17 Jun 2017 10:21:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::36d3])
	by smtp.gmail.com with ESMTPSA id
	o12sm12201226pfi.9.2017.06.17.10.21.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Jun 2017 10:21:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Jun 2017 10:21:39 -0700
Message-Id: <20170617172142.1311-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170617172142.1311-1-raj.khem@gmail.com>
References: <20170617172142.1311-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/9] openocd: Fix build with gcc7
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
X-List-Received-Date: Sat, 17 Jun 2017 17:21:58 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../openocd/0001-Add-fallthrough-comments.patch    | 155 +++++++++++++++++++++
 ...orkaround-new-warnings-generated-by-GCC-7.patch |  53 +++++++
 ...-missing-break-to-fix-fallthrough-warning.patch |  27 ++++
 .../openocd/0004-Fix-overflow-warning.patch        |  30 ++++
 ...e-the-fall-through-comment-to-right-scope.patch |  27 ++++
 meta-oe/recipes-devtools/openocd/openocd_git.bb    |   9 +-
 6 files changed, 299 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0001-Add-fallthrough-comments.patch
 create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0002-Workaround-new-warnings-generated-by-GCC-7.patch
 create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0003-armv7a-Add-missing-break-to-fix-fallthrough-warning.patch
 create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0004-Fix-overflow-warning.patch
 create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0005-command-Move-the-fall-through-comment-to-right-scope.patch

diff --git a/meta-oe/recipes-devtools/openocd/openocd/0001-Add-fallthrough-comments.patch b/meta-oe/recipes-devtools/openocd/openocd/0001-Add-fallthrough-comments.patch
new file mode 100644
index 000000000..644146c4d
--- /dev/null
+++ b/meta-oe/recipes-devtools/openocd/openocd/0001-Add-fallthrough-comments.patch
@@ -0,0 +1,155 @@
+From 8f85163b030e7b957648f90cd8fa599fb04d5d65 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 16 Jun 2017 23:32:49 -0700
+Subject: [PATCH 1/5] Add fallthrough comments
+
+Fixes
+
+src/svf/svf.c:663:7: error: this statement may fall through [-Werror=implicit-fallthrough=]
+     i = -1;
+     ~~^~~~
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/flash/mflash.c            | 3 ++-
+ src/flash/nand/mx3.c          | 1 +
+ src/jtag/drivers/ftdi.c       | 1 +
+ src/svf/svf.c                 | 2 ++
+ src/target/arm_adi_v5.c       | 9 +++++++++
+ src/target/arm_disassembler.c | 1 +
+ src/target/target.c           | 1 +
+ 7 files changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/src/flash/mflash.c b/src/flash/mflash.c
+index b69995542..3254a3d56 100644
+--- a/src/flash/mflash.c
++++ b/src/flash/mflash.c
+@@ -259,10 +259,11 @@ static int mg_dsk_wait(mg_io_type_wait wait_local, uint32_t time_var)
+ 				case mg_io_wait_rdy:
+ 					if (status & mg_io_rbit_status_ready)
+ 						return ERROR_OK;
+-
++					/* fallthru */
+ 				case mg_io_wait_drq:
+ 					if (status & mg_io_rbit_status_data_req)
+ 						return ERROR_OK;
++					/* fallthru */
+ 
+ 				default:
+ 					break;
+diff --git a/src/flash/nand/mx3.c b/src/flash/nand/mx3.c
+index b61e47535..0a55929ed 100644
+--- a/src/flash/nand/mx3.c
++++ b/src/flash/nand/mx3.c
+@@ -281,6 +281,7 @@ static int imx31_command(struct nand_device *nand, uint8_t command)
+ 			 * offset == one half of page size
+ 			 */
+ 			in_sram_address = MX3_NF_MAIN_BUFFER0 + (nand->page_size >> 1);
++			/* fallthru */
+ 		default:
+ 			in_sram_address = MX3_NF_MAIN_BUFFER0;
+ 	}
+diff --git a/src/jtag/drivers/ftdi.c b/src/jtag/drivers/ftdi.c
+index 00fe37faf..20f17d810 100644
+--- a/src/jtag/drivers/ftdi.c
++++ b/src/jtag/drivers/ftdi.c
+@@ -855,6 +855,7 @@ COMMAND_HANDLER(ftdi_handle_set_signal_command)
+ 			ftdi_set_signal(sig, *CMD_ARGV[1]);
+ 			break;
+ 		}
++		/* fallthru */
+ 	default:
+ 		LOG_ERROR("unknown signal level '%s', use 0, 1 or z", CMD_ARGV[1]);
+ 		return ERROR_COMMAND_SYNTAX_ERROR;
+diff --git a/src/svf/svf.c b/src/svf/svf.c
+index e7e815c10..7b261cc72 100644
+--- a/src/svf/svf.c
++++ b/src/svf/svf.c
+@@ -661,11 +661,13 @@ static int svf_read_command_from_file(FILE *fd)
+ 				if (svf_getline(&svf_read_line, &svf_read_line_size, svf_fd) <= 0)
+ 					return ERROR_FAIL;
+ 				i = -1;
++				/* fallthru */
+ 			case '\r':
+ 				slash = 0;
+ 				/* Don't save '\r' and '\n' if no data is parsed */
+ 				if (!cmd_pos)
+ 					break;
++				/* fallthru */
+ 			default:
+ 				/* The parsing code currently expects a space
+ 				 * before parentheses -- "TDI (123)".  Also a
+diff --git a/src/target/arm_adi_v5.c b/src/target/arm_adi_v5.c
+index eafc2ddc0..d444db2b1 100644
+--- a/src/target/arm_adi_v5.c
++++ b/src/target/arm_adi_v5.c
+@@ -346,10 +346,13 @@ static int mem_ap_write(struct adiv5_ap *ap, const uint8_t *buffer, uint32_t siz
+ 			case 4:
+ 				outvalue |= (uint32_t)*buffer++ << 8 * (address++ & 3);
+ 				outvalue |= (uint32_t)*buffer++ << 8 * (address++ & 3);
++				/* fallthru */
+ 			case 2:
+ 				outvalue |= (uint32_t)*buffer++ << 8 * (address++ & 3);
++				/* fallthru */
+ 			case 1:
+ 				outvalue |= (uint32_t)*buffer++ << 8 * (address++ & 3);
++				/* fallthru */
+ 			}
+ 		}
+ 
+@@ -509,20 +512,26 @@ static int mem_ap_read(struct adiv5_ap *ap, uint8_t *buffer, uint32_t size, uint
+ 			case 4:
+ 				*buffer++ = *read_ptr >> 8 * (3 - (address++ & 3));
+ 				*buffer++ = *read_ptr >> 8 * (3 - (address++ & 3));
++				/* fallthru */
+ 			case 2:
+ 				*buffer++ = *read_ptr >> 8 * (3 - (address++ & 3));
++				/* fallthru */
+ 			case 1:
+ 				*buffer++ = *read_ptr >> 8 * (3 - (address++ & 3));
++				/* fallthru */
+ 			}
+ 		} else {
+ 			switch (this_size) {
+ 			case 4:
+ 				*buffer++ = *read_ptr >> 8 * (address++ & 3);
+ 				*buffer++ = *read_ptr >> 8 * (address++ & 3);
++				/* fallthru */
+ 			case 2:
+ 				*buffer++ = *read_ptr >> 8 * (address++ & 3);
++				/* fallthru */
+ 			case 1:
+ 				*buffer++ = *read_ptr >> 8 * (address++ & 3);
++				/* fallthru */
+ 			}
+ 		}
+ 
+diff --git a/src/target/arm_disassembler.c b/src/target/arm_disassembler.c
+index 5277b94d8..2eb21ea33 100644
+--- a/src/target/arm_disassembler.c
++++ b/src/target/arm_disassembler.c
+@@ -3299,6 +3299,7 @@ static int t2ev_data_immed(uint32_t opcode, uint32_t address,
+ 		case 0x10:
+ 		case 0x12:
+ 			is_signed = true;
++			/* fallthru */
+ 		case 0x18:
+ 		case 0x1a:
+ 			/* signed/unsigned saturated add */
+diff --git a/src/target/target.c b/src/target/target.c
+index e04ecc470..597b4b13d 100644
+--- a/src/target/target.c
++++ b/src/target/target.c
+@@ -3684,6 +3684,7 @@ COMMAND_HANDLER(handle_bp_command)
+ 				addr = 0;
+ 				return handle_bp_command_set(CMD_CTX, addr, asid, length, hw);
+ 			}
++			/* fallthru */
+ 
+ 		case 4:
+ 			hw = BKPT_HARD;
+-- 
+2.13.1
+
diff --git a/meta-oe/recipes-devtools/openocd/openocd/0002-Workaround-new-warnings-generated-by-GCC-7.patch b/meta-oe/recipes-devtools/openocd/openocd/0002-Workaround-new-warnings-generated-by-GCC-7.patch
new file mode 100644
index 000000000..aa99735f6
--- /dev/null
+++ b/meta-oe/recipes-devtools/openocd/openocd/0002-Workaround-new-warnings-generated-by-GCC-7.patch
@@ -0,0 +1,53 @@
+From 8daaa8c27794653d02854c5982669a7638473224 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 16 Jun 2017 23:52:46 -0700
+Subject: [PATCH 2/5] Workaround new warnings generated by GCC 7
+
+src/flash/nor/xmc4xxx.c: In function 'xmc4xxx_get_info_command':
+src/flash/nor/xmc4xxx.c:939:43: error: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 6 [-Werror=format-truncation=]
+     snprintf(otp_str, sizeof(otp_str), "- %d\n", i);
+                                           ^~
+src/flash/nor/xmc4xxx.c:939:40: note: directive argument in the range [0, 2147483647]
+     snprintf(otp_str, sizeof(otp_str), "- %d\n", i);
+                                        ^~~~~~~~
+src/flash/nor/xmc4xxx.c:939:5: note: 'snprintf' output between 5 and 14 bytes into a destination of size 8
+     snprintf(otp_str, sizeof(otp_str), "- %d\n", i);
+     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/flash/nor/xmc4xxx.c | 2 +-
+ src/target/arm_adi_v5.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/flash/nor/xmc4xxx.c b/src/flash/nor/xmc4xxx.c
+index 02df46a3f..e6c398ff9 100644
+--- a/src/flash/nor/xmc4xxx.c
++++ b/src/flash/nor/xmc4xxx.c
+@@ -931,7 +931,7 @@ static int xmc4xxx_get_info_command(struct flash_bank *bank, char *buf, int buf_
+ 
+ 	/* If OTP Write protection is enabled (User 2), list each
+ 	 * sector that has it enabled */
+-	char otp_str[8];
++	char otp_str[14];
+ 	if (otp_enabled) {
+ 		strcat(prot_str, "\nOTP Protection is enabled for sectors:\n");
+ 		for (int i = 0; i < bank->num_sectors; i++) {
+diff --git a/src/target/arm_adi_v5.c b/src/target/arm_adi_v5.c
+index d444db2b1..d0d95121f 100644
+--- a/src/target/arm_adi_v5.c
++++ b/src/target/arm_adi_v5.c
+@@ -1062,7 +1062,7 @@ static int dap_rom_display(struct command_context *cmd_ctx,
+ 	int retval;
+ 	uint64_t pid;
+ 	uint32_t cid;
+-	char tabs[7] = "";
++	char tabs[16] = "";
+ 
+ 	if (depth > 16) {
+ 		command_print(cmd_ctx, "\tTables too deep");
+-- 
+2.13.1
+
diff --git a/meta-oe/recipes-devtools/openocd/openocd/0003-armv7a-Add-missing-break-to-fix-fallthrough-warning.patch b/meta-oe/recipes-devtools/openocd/openocd/0003-armv7a-Add-missing-break-to-fix-fallthrough-warning.patch
new file mode 100644
index 000000000..bcfbfc92b
--- /dev/null
+++ b/meta-oe/recipes-devtools/openocd/openocd/0003-armv7a-Add-missing-break-to-fix-fallthrough-warning.patch
@@ -0,0 +1,27 @@
+From 8e5051e83fedb078170565a24d1f5de6c2ce4428 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 17 Jun 2017 00:01:51 -0700
+Subject: [PATCH 3/5] armv7a: Add missing break to fix fallthrough warning
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/target/armv7a.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/target/armv7a.c b/src/target/armv7a.c
+index 6021def4e..bad806b3d 100644
+--- a/src/target/armv7a.c
++++ b/src/target/armv7a.c
+@@ -355,6 +355,7 @@ int armv7a_mmu_translate_va_pa(struct target *target, uint32_t va,
+ 				break;
+ 			case 7:
+ 				LOG_INFO("inner: Write-Back, no Write-Allocate");
++				break;
+ 
+ 			default:
+ 				LOG_INFO("inner: %" PRIx32 " ???", INNER);
+-- 
+2.13.1
+
diff --git a/meta-oe/recipes-devtools/openocd/openocd/0004-Fix-overflow-warning.patch b/meta-oe/recipes-devtools/openocd/openocd/0004-Fix-overflow-warning.patch
new file mode 100644
index 000000000..bfc5627c1
--- /dev/null
+++ b/meta-oe/recipes-devtools/openocd/openocd/0004-Fix-overflow-warning.patch
@@ -0,0 +1,30 @@
+From d3ca56370a2be7e737d48bd14d474d790a0ab8ac Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 17 Jun 2017 00:04:00 -0700
+Subject: [PATCH 4/5] Fix overflow warning
+
+Remove an empty space which makes it fit into 11 byte string
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/target/nds32_cmd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/target/nds32_cmd.c b/src/target/nds32_cmd.c
+index edb4872e4..73355073c 100644
+--- a/src/target/nds32_cmd.c
++++ b/src/target/nds32_cmd.c
+@@ -821,7 +821,7 @@ static int jim_nds32_bulk_read(Jim_Interp *interp, int argc, Jim_Obj * const *ar
+ 	jim_wide i;
+ 	Jim_SetResult(interp, Jim_NewEmptyStringObj(interp));
+ 	for (i = 0; i < count; i++) {
+-		sprintf(data_str, "0x%08" PRIx32 " ", data[i]);
++		sprintf(data_str, "0x%08" PRIx32 "", data[i]);
+ 		Jim_AppendStrings(interp, Jim_GetResult(interp), data_str, NULL);
+ 	}
+ 
+-- 
+2.13.1
+
diff --git a/meta-oe/recipes-devtools/openocd/openocd/0005-command-Move-the-fall-through-comment-to-right-scope.patch b/meta-oe/recipes-devtools/openocd/openocd/0005-command-Move-the-fall-through-comment-to-right-scope.patch
new file mode 100644
index 000000000..60f75da2c
--- /dev/null
+++ b/meta-oe/recipes-devtools/openocd/openocd/0005-command-Move-the-fall-through-comment-to-right-scope.patch
@@ -0,0 +1,27 @@
+From 29dbf92ffdbdda29662b4190a2f8eb09caad8b51 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 17 Jun 2017 00:06:32 -0700
+Subject: [PATCH 5/5] command: Move the fall through comment to right scope
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/helper/command.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/helper/command.c b/src/helper/command.c
+index 5deaee859..287c14857 100644
+--- a/src/helper/command.c
++++ b/src/helper/command.c
+@@ -1456,8 +1456,8 @@ COMMAND_HELPER(handle_command_parse_bool, bool *out, const char *label)
+ 				LOG_ERROR("%s: argument '%s' is not valid", CMD_NAME, in);
+ 				return ERROR_COMMAND_SYNTAX_ERROR;
+ 			}
+-			/* fall through */
+ 		}
++		/* fall through */
+ 		case 0:
+ 			LOG_INFO("%s is %s", label, *out ? "enabled" : "disabled");
+ 			break;
+-- 
+2.13.1
+
diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 783a6c707..20bc663f9 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -5,8 +5,13 @@ DEPENDS = "libusb-compat libftdi"
 RDEPENDS_${PN} = "libusb1"
 
 SRC_URI = "git://repo.or.cz/openocd.git \
-	"
-SRCREV = "cb317eabf2d162365467aeb89b564828e5e6d6f3"
+           file://0001-Add-fallthrough-comments.patch \
+           file://0002-Workaround-new-warnings-generated-by-GCC-7.patch \
+           file://0003-armv7a-Add-missing-break-to-fix-fallthrough-warning.patch \
+           file://0004-Fix-overflow-warning.patch \
+           file://0005-command-Move-the-fall-through-comment-to-right-scope.patch \
+"
+SRCREV = "1025be363e2bf42f1613083223a2322cc3a9bd4c"
 
 PV = "0.10+gitr${SRCPV}"
 S = "${WORKDIR}/git"
-- 
2.13.1


