Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A20BC27C53
	for <webhook@archiver.kernel.org>; Sun, 16 Jun 2024 21:31:00 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.42816.1718573450933746082
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jun 2024 14:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KLKh7jTA;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-35f1c490c13so4150993f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Jun 2024 14:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718573449; x=1719178249; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LC7NoF/sOhMdFHafgCiX0btSSnk0pW97AvdzmiCuIjI=;
        b=KLKh7jTAQuh8y5Tli1/dmr2/p5IhgqNSyyascwNpkugn/8+9v+yhcYh/1JqMcYRrsg
         MswttO4YvyE3/le/dJh9dhF9e50jX5N/d71ud4x65bk8muUcathnsieXrhaS/ppKQQS0
         cWn9HrHzFxBL6FnQtIGO/E3QJfnxM0SqaeoRupWY0it+tVpjn7KTzl/x/DCPbp63Witn
         ySxh2IRTD8NWjEal7xiTh+gxccbZzslLL6rZ+geY6YNqKlN1bJ77Y/cyLfMbLHonoTRp
         cElh/WLo2R9btRZwMl/l42BIYVSvShEh83AJfL4bAhS7p4ux787fqY7dZQvIbd5BzZtC
         SEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718573449; x=1719178249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LC7NoF/sOhMdFHafgCiX0btSSnk0pW97AvdzmiCuIjI=;
        b=Gf/h/J1OO4+PVJuVk1ddPkJVM4H2pAKgBMTxUgCN3p1MZoo9u1HSrhjqRHtTkHO+y8
         EAROHPIA3LXE9BZl96eumPnD5LBaa7V3N/LeVqaqGlqVjULjZrd1pijAIkUQaudmvp50
         bl/B5VPtnHsYpOVKv3ozw/YmBnD3NwZMrWxaF4e5VnAw4JGgYetUtlHFA4XqWXITOgPm
         CdUPiQ4MGKqdhZcWsBb3pl+5GrQbwPEsq1dlfKYwemFEX7HDkHTPG5YJqB32wQ4ILr0W
         xBHFo0ryZBy+fz5nZ/4dSggBZdEw/iGs16CKlsAshkREdqn3B/MWsqwWSJjHwEOR+CNI
         3l8Q==
X-Gm-Message-State: AOJu0YxtRNPyLRShwkloDBYLyOqAfksqqbitniXPpjX2+mn6Bevma/pA
	umlqZ1Ba6Um7vUZwlgHn5apMFQwPHxYh+wCK/zqSlMMVuZckYF44S9Ka+UUK
X-Google-Smtp-Source: AGHT+IHQLN9B4OyZRaxgioGQ17lJGb6nGbYZJnPZ66BDZn77tM0n8Vw/gFExZvRMWGzWp0w8VjwaOg==
X-Received: by 2002:a5d:6c6a:0:b0:360:9701:a830 with SMTP id ffacd0b85a97d-3609701a8e6mr365817f8f.25.1718573448378;
        Sun, 16 Jun 2024 14:30:48 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607509353csm10424513f8f.22.2024.06.16.14.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 14:30:47 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH v2] python3-typer: add new recipe
Date: Sun, 16 Jun 2024 23:30:20 +0200
Message-Id: <20240616213020.3637726-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jun 2024 21:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110938

root@qemux86-64:~# ptest-runner python3-typer
START: ptest-runner
2024-06-16T21:26
BEGIN: /usr/lib/python3-typer/ptest
PASS: tests/test_ambiguous_params.py:test_split_annotations_from_typer_annotations_simple
PASS: tests/test_ambiguous_params.py:test_forbid_default_value_in_annotated_argument
PASS: tests/test_ambiguous_params.py:test_allow_options_to_have_names
PASS: tests/test_ambiguous_params.py:test_forbid_annotated_param_and_default_param[Argument-ArgumentInfo]
PASS: tests/test_ambiguous_params.py:test_forbid_annotated_param_and_default_param[Option-OptionInfo]
PASS: tests/test_ambiguous_params.py:test_forbid_multiple_typer_params_in_annotated
PASS: tests/test_ambiguous_params.py:test_allow_multiple_non_typer_params_in_annotated
PASS: tests/test_ambiguous_params.py:test_forbid_default_factory_and_default_value_in_annotated[Argument-ArgumentInfo]
PASS: tests/test_ambiguous_params.py:test_forbid_default_factory_and_default_value_in_annotated[Option-OptionInfo]
PASS: tests/test_ambiguous_params.py:test_allow_default_factory_with_default_param[Argument]
PASS: tests/test_ambiguous_params.py:test_allow_default_factory_with_default_param[Option]
PASS: tests/test_ambiguous_params.py:test_forbid_default_and_default_factory_with_default_param[Argument-ArgumentInfo]
PASS: tests/test_ambiguous_params.py:test_forbid_default_and_default_factory_with_default_param[Option-OptionInfo]
PASS: tests/test_ambiguous_params.py:test_error_rendering[error0-`Argument` default value cannot be set in `Annotated` for 'my_argument'. Set the default value with `=` instead.]
PASS: tests/test_ambiguous_params.py:test_error_rendering[error1-Cannot specify `Option` in `Annotated` and `Argument` as a default value together for 'my_argument']
PASS: tests/test_ambiguous_params.py:test_error_rendering[error2-Cannot specify `Option` in `Annotated` and default value together for 'my_argument']
PASS: tests/test_ambiguous_params.py:test_error_rendering[error3-Cannot specify `Argument` in `Annotated` and default value together for 'my_argument']
PASS: tests/test_ambiguous_params.py:test_error_rendering[error4-Cannot specify multiple `Annotated` Typer arguments for 'my_argument']
PASS: tests/test_ambiguous_params.py:test_error_rendering[error5-Cannot specify `default_factory` and a default value together for `Option`]
PASS: tests/test_annotated.py:test_annotated_argument_with_default
PASS: tests/test_annotated.py:test_annotated_argument_in_string_type_with_default
PASS: tests/test_annotated.py:test_annotated_argument_with_default_factory
PASS: tests/test_annotated.py:test_annotated_option_with_argname_doesnt_mutate_multiple_calls
PASS: tests/test_cli/test_app_other_name.py:test_script_help
PASS: tests/test_cli/test_app_other_name.py:test_script
PASS: tests/test_cli/test_completion_run.py:test_script_completion_run
PASS: tests/test_cli/test_doc.py:test_doc
PASS: tests/test_cli/test_doc.py:test_doc_output
PASS: tests/test_cli/test_doc.py:test_doc_title_output
PASS: tests/test_cli/test_doc.py:test_doc_not_existing
PASS: tests/test_cli/test_doc.py:test_doc_no_typer
PASS: tests/test_cli/test_doc.py:test_doc_file_not_existing
PASS: tests/test_cli/test_empty_script.py:test_script_help
PASS: tests/test_cli/test_func_other_name.py:test_script
PASS: tests/test_cli/test_help.py:test_script_help
PASS: tests/test_cli/test_help.py:test_not_python
PASS: tests/test_cli/test_multi_app.py:test_script_help
PASS: tests/test_cli/test_multi_app.py:test_script_app_non_existent
PASS: tests/test_cli/test_multi_app.py:test_script_sub
PASS: tests/test_cli/test_multi_app.py:test_script_top
PASS: tests/test_cli/test_multi_app.py:test_script_sub_hello
PASS: tests/test_cli/test_multi_app.py:test_script_sub_bye
PASS: tests/test_cli/test_multi_app_cli.py:test_script_help
PASS: tests/test_cli/test_multi_app_cli.py:test_script_sub
PASS: tests/test_cli/test_multi_app_cli.py:test_script_top
PASS: tests/test_cli/test_multi_app_cli.py:test_script_sub_hello
PASS: tests/test_cli/test_multi_app_cli.py:test_script_sub_bye
PASS: tests/test_cli/test_multi_app_sub.py:test_script_help
PASS: tests/test_cli/test_multi_app_sub.py:test_script
PASS: tests/test_cli/test_multi_func.py:test_help
PASS: tests/test_cli/test_multi_func.py:test_script
PASS: tests/test_cli/test_multi_func.py:test_script_func_non_existent
PASS: tests/test_cli/test_multi_func.py:test_script_func_not_function
PASS: tests/test_cli/test_multi_func.py:test_script_func
PASS: tests/test_cli/test_not_python.py:test_not_python
PASS: tests/test_cli/test_sub.py:test_script_hello
PASS: tests/test_cli/test_sub.py:test_script_hello_name
PASS: tests/test_cli/test_sub.py:test_script_hello_name_formal
PASS: tests/test_cli/test_sub.py:test_script_bye
PASS: tests/test_cli/test_sub.py:test_script_bye_friend
PASS: tests/test_cli/test_sub.py:test_script_help
PASS: tests/test_cli/test_sub.py:test_not_python
PASS: tests/test_cli/test_sub_completion.py:test_script_completion_run
PASS: tests/test_cli/test_sub_help.py:test_script_help
PASS: tests/test_cli/test_version.py:test_script_help
PASS: tests/test_compat/test_option_get_help.py:test_hidden_option
PASS: tests/test_compat/test_option_get_help.py:test_hidden_option_no_rich
PASS: tests/test_compat/test_option_get_help.py:test_coverage_call
PASS: tests/test_compat/test_option_get_help.py:test_completion
PASS: tests/test_exit_errors.py:test_eoferror
PASS: tests/test_exit_errors.py:test_oserror
PASS: tests/test_exit_errors.py:test_oserror_no_epipe
PASS: tests/test_others.py:test_help_from_info
PASS: tests/test_others.py:test_defaults_from_info
PASS: tests/test_others.py:test_too_many_parsers
PASS: tests/test_others.py:test_valid_parser_permutations
PASS: tests/test_others.py:test_install_invalid_shell
PASS: tests/test_others.py:test_callback_too_many_parameters
PASS: tests/test_others.py:test_callback_2_untyped_parameters
PASS: tests/test_others.py:test_callback_3_untyped_parameters
PASS: tests/test_others.py:test_completion_untyped_parameters
PASS: tests/test_others.py:test_completion_untyped_parameters_different_order_correct_names
PASS: tests/test_others.py:test_autocompletion_too_many_parameters
PASS: tests/test_others.py:test_forward_references
PASS: tests/test_others.py:test_context_settings_inheritance_single_command
PASS: tests/test_others.py:test_split_opt
PASS: tests/test_prog_name.py:test_custom_prog_name
PASS: tests/test_rich_utils.py:test_rich_utils_click_rewrapp
PASS: tests/test_rich_utils.py:test_rich_help_no_commands
PASS: tests/test_tracebacks.py:test_traceback_no_rich
PASS: tests/test_tracebacks.py:test_traceback_no_rich_short_disable
PASS: tests/test_tracebacks.py:test_unmodified_traceback
PASS: tests/test_type_conversion.py:test_optional
PASS: tests/test_type_conversion.py:test_optional_tuple
PASS: tests/test_type_conversion.py:test_no_type
PASS: tests/test_type_conversion.py:test_list_parameters_convert_to_lists[List0]
PASS: tests/test_type_conversion.py:test_list_parameters_convert_to_lists[List1]
PASS: tests/test_type_conversion.py:test_list_parameters_convert_to_lists[List2]
PASS: tests/test_type_conversion.py:test_tuple_parameter_elements_are_converted_recursively[Tuple0]
PASS: tests/test_type_conversion.py:test_tuple_parameter_elements_are_converted_recursively[Tuple1]
PASS: tests/test_type_conversion.py:test_tuple_parameter_elements_are_converted_recursively[Tuple2]
PASS: tests/test_type_conversion.py:test_tuple_parameter_elements_are_converted_recursively[Tuple3]
PASS: tests/test_type_conversion.py:test_tuple_parameter_elements_are_converted_recursively[Tuple4]
PASS: tests/test_type_conversion.py:test_custom_parse
PASS: tests/test_type_conversion.py:test_custom_click_type
============================================================================
Testsuite summary
DURATION: 203
END: /usr/lib/python3-typer/ptest
2024-06-16T21:29
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-typer/run-ptest            |  6 +++
 .../python/python3-typer_0.12.3.bb            | 41 +++++++++++++++++++
 3 files changed, 48 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-typer/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-typer_0.12.3.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index bdcd658d9..56a5cf2f0 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -97,6 +97,7 @@ PTESTS_SLOW_META_PYTHON = "\
     python3-pytest-localserver \
     python3-scrypt \
     python3-traitlets \
+    python3-typer \
     python3-yappi \
 "
 
diff --git a/meta-python/recipes-devtools/python/python3-typer/run-ptest b/meta-python/recipes-devtools/python/python3-typer/run-ptest
new file mode 100644
index 000000000..94b40789b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-typer/run-ptest
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+# Ignore the test_tutorial and test_completion.
+# Because it needs the docs_src package what is not in Yocto.
+# And the tests are not that useful for Yocto.
+pytest --automake --ignore tests/test_tutorial --ignore tests/test_completion
diff --git a/meta-python/recipes-devtools/python/python3-typer_0.12.3.bb b/meta-python/recipes-devtools/python/python3-typer_0.12.3.bb
new file mode 100644
index 000000000..cc8669c37
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-typer_0.12.3.bb
@@ -0,0 +1,41 @@
+SUMMARY = "Typer, build great CLIs. Easy to code. Based on Python type hints."
+DESCRIPTION = "\
+    Typer is a library for building CLI applications that users will love using and developers will love creating. Based on Python type hints. \
+    It's also a command line tool to run scripts, automatically converting them to CLI applications. \
+"
+HOMEPAGE = "https://github.com/tiangolo/typer"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
+
+SRC_URI[sha256sum] = "49e73131481d804288ef62598d97a1ceef3058905aa536a1134f90891ba35482"
+
+inherit pypi python_setuptools_build_meta ptest
+
+DEPENDS += "\
+    python3-pdm-backend-native \
+    python3-pdm-native \
+"
+
+SRC_URI:append = " \
+    file://run-ptest \
+"
+
+PYPI_PACKAGE = "typer"
+
+RDEPENDS:${PN} += "\
+    python3-click \
+    python3-shellingham \
+"
+
+RDEPENDS:${PN}-ptest += "\
+    python3-coverage \
+    python3-pytest \
+    python3-typing-extensions \
+    python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
-- 
2.39.2


