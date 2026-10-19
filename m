Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2680FCCF2E8
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 12:56:34 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33886.1792414590121565014
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 05:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=WPk8QJuT;
 spf=pass (domain: konsulko.com, ip: 209.85.221.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso1074968f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 05:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792414588; x=1793019388; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8KLKBmyovF4CTG5WqCzWEH8+ZklDcu6Z7MdZgsTajI=;
        b=WPk8QJuTnSn4fAH7bbgLj6mufrsQky1cnyfbkNrlPXt4qr+0Cxa7vCQGRQuQ8X2c66
         9f4Sr1GuyWqDGjlQKJFkirOsLhA1y90RA7SwtYJ3o7/WaHvyvulMufCzk0CC3Qm/ziTk
         GcPv1L7VZEPVRYK4oI+HxOkvzVUjtANp5WHUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414588; x=1793019388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g8KLKBmyovF4CTG5WqCzWEH8+ZklDcu6Z7MdZgsTajI=;
        b=zcvJFym2TqbHK2pQK9La2WyaLYa7kKv8H4wOTIW998XFARICXx6DpfVhRuoZC5h3Lu
         UDUJlHlcqKzRkkgIRMRMn0gL476i3Mg5UdJiz1nWUT2j63EwJJqoYHae7avEai6qg9lf
         reN6jI8XPpCX8xzCeBR9D2BKERBnmYfpdF5wNaCkSzzXH6Lr5t2tfSOVvyaHlWT1OD9U
         m78NnGOF2bRlP6exVsFoWqiInKuItXRr1n2FVD6yr9O9B7sg325ZQvXjS/1nc1SSspZp
         8utkt20QZ1zCFE0XhsoBc/nCwq7YDYe+kJPEbKbeLSxor5NAV/rmHSkL9WwjQ7lmRJBI
         lyhw==
X-Gm-Message-State: AFq9FYImOJVGU2zdxLv66NHjvfmv4PpCpQ7l1StMw97qtiC3d/RisseU
	oA1dwWQZTbcZwOJWmE0WA34wwG8/qjqu0Tgx0+d4yg+YRIaZG9BGyWl8wDdK34kYaSrDlqjnlDm
	PDVy0
X-Gm-Gg: AYBFou1aOydseZac+HiiPYcaPGlY1ZkIFO9+eIk3aXXsRDbPJV8HV1CGCUgHC60PcJF
	2Q3wlvpIwTgmWR5KUMERno0vNIKBioWt2/GQ+pipBdMU1tRHloRheiP+ychJEWXYFyE5bUp6fgk
	xklZrRAVRNK4cF7MFg236EAmVlT1BHH86Iro10bRr48alFtosUreP27ipjwEhaJ34SCZicd/dEy
	1lhe0ZwQZoJB3RyDTdFQ5bLEMtzLT5znZJZ0qjsyFtkFdedC43ZCQTg/G5GI3LzYwxS62hQz2yB
	jFJIQXrb/S0LhI1Kdaf/BUxc4Y2aPFouv0lsOJTRMdmccpFNYcSmn1tTPSosTCLXjl6p08K9fl9
	55GsvzPXJv0/a/7I9400eGaWkbKFNgubCIgKvH8wOt2hpILdVRW0Ez7hcwfJNvMTBv1aRm0QslJ
	obTh0r+EoK/+obIhklDd5kwTUjo6rscghmv7wa8Z84mhKp+9jHEod7gtJ2mfGG++guqc5qJhE1j
	VE/ceAv+fdao9fZTMw4NWw+j8+dwkKcqw5uphtknY/TEO8I7kKb9oMayYKKx4raj4/LYthjbnCI
	u69WIScWu0OUhDPe5XtVGBg=
X-Received: by 2002:a05:6000:2005:b0:48e:d27:bef2 with SMTP id ffacd0b85a97d-48e0d27c26bmr12134014f8f.21.1792414588309;
        Mon, 19 Oct 2026 05:56:28 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1afbf534sm1527565f8f.35.2026.10.19.05.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:56:27 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/10] python3-cmd2: Upgrade 4.2.4 -> 4.3.0
Date: Mon, 19 Oct 2026 15:56:15 +0300
Message-ID: <20261019125616.3888504-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019125616.3888504-1-leon.anavi@konsulko.com>
References: <20261019125616.3888504-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 12:56:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131124

Upgrade to release 4.3.0:

Overview:

This release primarily fixes a number of subtle bugs related to piping
cmd2 command output to shell commands. It also removes the experimental
tag from the @with_annotated decorator feature.

Details:

- Stabilized features
    - @with_annotated is no longer experimental. It was introduced
      as an experimental feature in 4.0.0 and is now a fully
      supported way to define a command's arguments, alongside
      @with_argparser. This covers the decorator and its supporting
      API in cmd2.annotated, including Argument, Option, Group, and
      ArgumentBlock. Annotated Argument Processing.
- Bug Fixes
    - On POSIX, piping a command's output to an interactive program
      such as less (help -v | less) now runs that program as the
      terminal's foreground job, as a shell pipeline does. It had
      run in a separate session that never received the terminal,
      so Ctrl-Z and fg did not suspend and resume it together with
      cmd2. The program now owns the terminal as it starts, so a
      pager can set its terminal modes, and Ctrl-C and Ctrl-Z reach
      the whole pipeline. Pipes started from a worker thread, or
      whose output does not go to the terminal, such as one nested
      in a command whose own output is piped, still run in their
      own session
    - A shell command piped to an interactive program, such as
      shell git log | less, now joins the pipeline's job, so both
      processes receive Ctrl-C and Ctrl-Z
    - On Windows, fixed piped output appearing garbled in console
      programs such as more (help -v | more), a regression in
      4.2.4. Pipes are written as UTF-8, but console programs
      decode their input with the console's code page. While a pipe
      or the pager runs, cmd2 now sets the console to UTF-8 (code
      page 65001, as chcp 65001 does) and restores its code pages
      afterward, so console programs and UTF-8 tools such as rg
      both read the output correctly
    - When copying a command's output to the clipboard (help >)
      fails, later commands' output is no longer written to the
      temporary file that held it
    - When a pipe's process cannot be started, for instance because
      no more processes can be created or $SHELL names a program
      that cannot run, both ends of the pipe are now closed rather
      than left open
    - When a pipe's process exits before the command runs, what it
      wrote, such as the shell's "command not found", is no longer
      lost when cmd2 captures the output, as in a pyscript

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_4.2.4.bb => python3-cmd2_4.3.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_4.2.4.bb => python3-cmd2_4.3.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_4.2.4.bb b/meta-python/recipes-devtools/python/python3-cmd2_4.3.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-cmd2_4.2.4.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_4.3.0.bb
index beb5dd02b3..3605ab9003 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_4.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_4.3.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f2a861642858e0858af9dd4e4716bae0"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "9aac11583994f6b22fab6464180490cc3a336d46eb682f1438acebe3c0bbe53d"
+SRC_URI[sha256sum] = "3f6c4b9619dbd0d1ba75789a099be82b65daf8ac1d97b8e4ecb112e76c72b100"
 
 inherit pypi python_setuptools_build_meta python3native
 
-- 
2.47.3


