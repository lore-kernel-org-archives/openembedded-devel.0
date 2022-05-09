Return-Path: <richard.neill@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADCBC433F5
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 16:32:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.234.1652113962268216331
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 09:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: richard.neill@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4730153B;
	Mon,  9 May 2022 09:32:41 -0700 (PDT)
Received: from e125927.arm.com (unknown [10.57.1.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C9F23F73D;
	Mon,  9 May 2022 09:32:40 -0700 (PDT)
From: Richard Neill <richard.neill@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [meta-oe][PATCH] bats: Add patch to fix false-negatives caused by
 teardown code
Date: Mon,  9 May 2022 17:32:44 +0100
Message-Id: <20220509163244.164067-1-richard.neill@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 16:32:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97020

BATS v1.6.0 has a regression which can result in test case failures being
ignored when teardown code executes successfully. This patch applies the
accepted bug-fix until the next BATS release.

Also, fix a comment that wasn't updated during the BATS upgrade, to match=
 the
correct release (v1.6.0) associated with the SRCREV.

Signed-off-by: Richard Neill <richard.neill@arm.com>
---
 meta-oe/recipes-test/bats/bats_1.6.0.bb       |   8 +-
 ...tus-in-teardown-overriding-exit-code.patch | 150 ++++++++++++++++++
 2 files changed, 156 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-test/bats/files/0001-Fix-status-in-te=
ardown-overriding-exit-code.patch

diff --git a/meta-oe/recipes-test/bats/bats_1.6.0.bb b/meta-oe/recipes-te=
st/bats/bats_1.6.0.bb
index 7ea1aa8f3..df81595c9 100644
--- a/meta-oe/recipes-test/bats/bats_1.6.0.bb
+++ b/meta-oe/recipes-test/bats/bats_1.6.0.bb
@@ -6,8 +6,12 @@ HOMEPAGE =3D "https://github.com/bats-core/bats-core"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D2970203aedf9e829edb96a137a=
4fe81b"

-SRC_URI =3D "git://github.com/bats-core/bats-core.git;branch=3Dmaster;pr=
otocol=3Dhttps"
-# v1.4.1
+SRC_URI =3D "\
+  git://github.com/bats-core/bats-core.git;branch=3Dmaster;protocol=3Dht=
tps \
+  file://0001-Fix-status-in-teardown-overriding-exit-code.patch \
+  "
+
+# v1.6.0
 SRCREV =3D "210acf3a8ed318ddedad3137c15451739beba7d4"

 S =3D "${WORKDIR}/git"
diff --git a/meta-oe/recipes-test/bats/files/0001-Fix-status-in-teardown-=
overriding-exit-code.patch b/meta-oe/recipes-test/bats/files/0001-Fix-sta=
tus-in-teardown-overriding-exit-code.patch
new file mode 100644
index 000000000..f4b1db931
--- /dev/null
+++ b/meta-oe/recipes-test/bats/files/0001-Fix-status-in-teardown-overrid=
ing-exit-code.patch
@@ -0,0 +1,150 @@
+From aa628ccdc4dec1c129c1bd98b53ef94d8c2e119a Mon Sep 17 00:00:00 2001
+From: Richard Neill <richard.neill@arm.com>
+Date: Mon, 9 May 2022 12:20:48 +0100
+Subject: [PATCH] Fix status in teardown* overriding exit code
+
+Patch fixes regression which produces false-negatives in v1.6.0, where t=
he
+teardown function can cause BATS to report success even if test cases fa=
il.
+Fixes: https://github.com/bats-core/bats-core/issues/575
+
+Upstream-Status: Backport [Adapted from https://github.com/bats-core/bat=
s-core/commit/5f372058b05f817e4e3a8dab27f83c30fd467504]
+Signed-off-by: Richard Neill <richard.neill@arm.com>
+---
+ libexec/bats-core/bats-exec-file  | 18 ++++++++----------
+ libexec/bats-core/bats-exec-suite | 12 ++++++------
+ libexec/bats-core/bats-exec-test  |  8 ++++----
+ 3 files changed, 18 insertions(+), 20 deletions(-)
+
+diff --git a/libexec/bats-core/bats-exec-file b/libexec/bats-core/bats-e=
xec-file
+index 298441b..63452c7 100755
+--- a/libexec/bats-core/bats-exec-file
++++ b/libexec/bats-core/bats-exec-file
+@@ -118,7 +118,6 @@ bats_run_teardown_file() {
+
+ bats_file_teardown_trap() {
+   bats_run_teardown_file
+-  local status=3D0
+   bats_file_exit_trap
+ }
+
+@@ -144,9 +143,9 @@ bats_file_exit_trap() {
+     bats_print_failed_command "${stack_trace[@]}" >&3
+     bats_prefix_lines_for_tap_output < "$BATS_OUT" | bats_replace_filen=
ame >&3
+     rm -rf "$BATS_OUT"
+-    status=3D1
++    bats_exec_file_status=3D1
+   fi
+-  exit $status
++  exit $bats_exec_file_status
+ }
+
+ function setup_file() {
+@@ -250,15 +249,15 @@ bats_read_tests_list_file() {
+ }
+
+ bats_run_tests() {
+-  status=3D0
++  bats_exec_file_status=3D0
+
+   if [[ "$num_jobs" !=3D 1 && "${BATS_NO_PARALLELIZE_WITHIN_FILE-False}=
" =3D=3D False ]]; then
+     export BATS_SEMAPHORE_NUMBER_OF_SLOTS=3D"$num_jobs"
+-    bats_run_tests_in_parallel "$BATS_RUN_TMPDIR/parallel_output" || st=
atus=3D1
++    bats_run_tests_in_parallel "$BATS_RUN_TMPDIR/parallel_output" || ba=
ts_exec_file_status=3D1
+   else
+     for test_name in "${tests_to_run[@]}"; do
+       if [[ "${BATS_INTERRUPTED-NOTSET}" !=3D NOTSET ]]; then
+-        status=3D130 # bash's code for SIGINT exits
++        bats_exec_file_status=3D130 # bash's code for SIGINT exits
+         break
+       fi
+       # Only handle non-empty lines
+@@ -267,14 +266,13 @@ bats_run_tests() {
+         ((++test_number_in_file))
+         # deal with empty flags to avoid spurious "unbound variable" er=
rors on Bash 4.3 and lower
+         if [[ "${#flags[@]}" -gt 0 ]]; then
+-          "$BATS_LIBEXEC/bats-exec-test" "${flags[@]}" "$filename" "$te=
st_name" "$test_number_in_suite" "$test_number_in_file" || status=3D1
++          "$BATS_LIBEXEC/bats-exec-test" "${flags[@]}" "$filename" "$te=
st_name" "$test_number_in_suite" "$test_number_in_file" || bats_exec_file=
_status=3D1
+         else
+-          "$BATS_LIBEXEC/bats-exec-test" "$filename" "$test_name" "$tes=
t_number_in_suite" "$test_number_in_file" || status=3D1
++          "$BATS_LIBEXEC/bats-exec-test" "$filename" "$test_name" "$tes=
t_number_in_suite" "$test_number_in_file" || bats_exec_file_status=3D1
+         fi
+       fi
+     done
+   fi
+-  export status
+ }
+
+ bats_create_file_tempdirs() {
+@@ -322,4 +320,4 @@ bats_run_tests
+ trap bats_interrupt_trap INT
+ bats_run_teardown_file
+
+-exit $status
++exit $bats_exec_file_status
+diff --git a/libexec/bats-core/bats-exec-suite b/libexec/bats-core/bats-=
exec-suite
+index 05c66f4..4d440ae 100755
+--- a/libexec/bats-core/bats-exec-suite
++++ b/libexec/bats-core/bats-exec-suite
+@@ -135,10 +135,10 @@ bats_exit_trap() {
+   if [[ ${BATS_INTERRUPTED-NOTSET} !=3D NOTSET ]]; then
+     printf "\n# Received SIGINT, aborting ...\n\n"
+   fi
+-  exit "$status"
++  exit "$bats_exec_suite_status"
+ }
+
+-status=3D0
++bats_exec_suite_status=3D0
+ printf '1..%d\n' "${test_count}"
+
+ # No point on continuing if there's no tests.
+@@ -163,15 +163,15 @@ if [[ "$num_jobs" -gt 1 ]] && [[ -z "$bats_no_para=
llelize_across_files" ]]; then
+   # shellcheck disable=3DSC2086,SC2068
+   # we need to handle the quoting of ${flags[@]} ourselves,
+   # because parallel can only quote it as one
+-  parallel --keep-order --jobs "$num_jobs" bats-exec-file "$(printf "%q=
 " "${flags[@]}")" "{}" "$TESTS_LIST_FILE"  ::: "${BATS_UNIQUE_TEST_FILEN=
AMES[@]}" 2>&1 || status=3D1
++  parallel --keep-order --jobs "$num_jobs" bats-exec-file "$(printf "%q=
 " "${flags[@]}")" "{}" "$TESTS_LIST_FILE"  ::: "${BATS_UNIQUE_TEST_FILEN=
AMES[@]}" 2>&1 || bats_exec_suite_status=3D1
+ else
+   for filename in "${BATS_UNIQUE_TEST_FILENAMES[@]}"; do
+     if [[ "${BATS_INTERRUPTED-NOTSET}" !=3D NOTSET ]]; then
+-      status=3D130 # bash's code for SIGINT exits
++      bats_exec_suite_status=3D130 # bash's code for SIGINT exits
+       break
+     fi
+-    bats-exec-file "${flags[@]}" "$filename" "${TESTS_LIST_FILE}" || st=
atus=3D1
++    bats-exec-file "${flags[@]}" "$filename" "${TESTS_LIST_FILE}" || ba=
ts_exec_suite_status=3D1
+   done
+ fi
+
+-exit "$status"
++exit "$bats_exec_suite_status"
+diff --git a/libexec/bats-core/bats-exec-test b/libexec/bats-core/bats-e=
xec-test
+index aae4572..57bdf18 100755
+--- a/libexec/bats-core/bats-exec-test
++++ b/libexec/bats-core/bats-exec-test
+@@ -94,18 +94,18 @@ source "$BATS_ROOT/lib/bats-core/tracing.bash"
+
+ bats_teardown_trap() {
+   bats_check_status_from_trap
+-  local status=3D0
++  local bats_teardown_trap_status=3D0
+   # mark the start of this function to distinguish where skip is called
+   # parameter 1 will signify the reason why this function was called
+   # this is used to identify when this is called as exit trap function
+   BATS_TEARDOWN_STARTED=3D${1:-1}
+-  teardown >>"$BATS_OUT" 2>&1 || status=3D"$?"
++  teardown >>"$BATS_OUT" 2>&1 || bats_teardown_trap_status=3D"$?"
+
+-  if [[ $status -eq 0 ]]; then
++  if [[ $bats_teardown_trap_status -eq 0 ]]; then
+     BATS_TEARDOWN_COMPLETED=3D1
+   elif [[ -n "$BATS_TEST_COMPLETED" ]]; then
+     BATS_DEBUG_LAST_STACK_TRACE_IS_VALID=3D1
+-    BATS_ERROR_STATUS=3D"$status"
++    BATS_ERROR_STATUS=3D"$bats_teardown_trap_status"
+   fi
+
+   bats_exit_trap
+--
+2.25.1
+
--
2.25.1


