Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15158.1794913090653073333
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 02:58:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=aB77kyMC;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so44476515e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 02:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794913089; x=1795517889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yL9t2xnJXlI/rB8KSOCAwuEAlgj1ukifj3UUMmqoVpk=;
        b=aB77kyMCpL6JKWpUQ329QjjnRmR+ZmYHryQhKo2gZ7+7hL80ubMkZBgiA0KhrV2eN7
         7cuAEipUU8caP67yED2wwRwxRifiKzAM84Ts8X0NzW8KRquonhug1/zFdSZDaipPt+7a
         wAMqaZnke5uIACCzPv2LOC3eUMgIFwDphefJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913089; x=1795517889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yL9t2xnJXlI/rB8KSOCAwuEAlgj1ukifj3UUMmqoVpk=;
        b=PvR8qYPh8upLLLg03Vq6eMH+joB0p3fnDjVRT6Say/7tN0cV4I5qqp8GapQWEiqSpZ
         kEYRueL1TYbwF5UlyNVrAYTm7/PngrjF+9FrGnapsZpY64Q1FG70K9Cks6awVGD8pBMq
         rZkdgGyFmgBrAnWcZIxSUuqjUJehUBszBqQFE/SxWD9TpKmK9XOcVDJCAttDU3Eru+bl
         G1nwTRorPFMc0FTRcyGkWSL3SZx5KiALSUE9Hoh98mx1MH0A9yKN+V0esgP1Qg1NLYS2
         pxGwQF2CfVyf6w4EPhDPriW+eLcgkqUjKUsDtwi5AmPbS16dF8YpVT7IpaWHPC4nG2RO
         SMlA==
X-Gm-Message-State: APuU4Z/AnHIj//YMyRA8XQAiXusMKYirL6xhLSKY2DXj+NHYZNJliyit
	x59ehXCjf5Fp09brDeEsgVSjSnwC+riKeRGMb7JH6wZlG16sK0O1H2PQzfI0KsruxmO905MqXgz
	3rPNP
X-Gm-Gg: AYBFou2pXOFk5bNZ7RsMPvfjEIxtFu9NuunjXgYWZkpJuNXhqf3Xk+wEnrnzcAPB4iO
	cs1/8RCvh53KQGowlDrPzL+oT09C8aG2Nj8JlSdZXhEQwXLfMgxbn3nYEJ0gunOrTjL2DMmA2tU
	ZfvCM2CXZDivm33YmQ6FQGcBmjUirjoLbLR4cX4DyZj0pksBH4JoC/BQMQ/osjuaKadQNb1dH9C
	DW0SUSJ5LW6Sz8GFXNe3tN57gGRYblrcUBgFX+FG0/bypwhyGF2GYse92PNrgIq6UtOhszgJY+4
	gHRlXqgIk/Bs+wDk5oYUrApa1K53Vb4jXDnHHbEvKU7QzUFmK7+RSW2xh+RAqZhgIeZKWNAKVX5
	1IL1n5elp/zKuxbuiQBLSfEhAaRXatfCLD6fXF7IrR75QQUeaFElSHvSksHLU6aHDDZEYKAU1wO
	qCQdCWLBze7qJPMT3bRDO6QeU3gw0IGf/MChnHe6C4YDGX9FX5nJN1DIsz4PFmIdMlrTTCVlhbX
	f1c0yR4X4gjA8fcyA0zU8YNVW9xjefQi+/CkTniny3RlZinWhyphp1mHtbre3MiMUBQtLe69WkL
	m6vhJBzWCA0o1lvvxOs8O6uOhh3JIy8h4Qn+9heKI7kqilZP6b0VInF0PAbSRCT4i43DQcAPGH6
	Z/VastYNkALl5S6SbFBPHEUAWmcmfuYOTlJJR+YcpZnOzkl4BF3miBWm+ad6PtiVeQc7zBxHgbs
	A=
X-Received: by 2002:a05:600c:840c:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4bb5599bda8mr295299915e9.0.1794913088624;
        Tue, 17 Nov 2026 02:58:08 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9426asm20454455e9.4.2026.11.17.02.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:58:08 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-cmd2: Upgrade 4.4.2 -> 4.4.3
Date: Tue, 17 Nov 2026 12:58:02 +0200
Message-ID: <20261117105804.3937460-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117105804.3937460-1-leon.anavi@konsulko.com>
References: <20261117105804.3937460-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 10:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132580
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.4.3:

Bug fixes:

- ppaged() now prints its output when the configured pager
  program cannot be run, for example where less is not
  installed. Previously only the shell's error was shown and
  the output was  lost. A pager command which could not be run
  is not tried again while the application is running, so the
  shell's error is shown once for each pager command instead of
  every time.
- A command which prints through a cmd2 console of its own,
  such as a Cmd2GeneralConsole showing a Rich progress bar, no
  longer ends with a BrokenPipeError message when its output is
  piped to something that exits early, as head does. cmd2 now
  ends the command quietly instead, printing
  broken_pipe_warning if it is set. cmd2 consoles now raise
  ConsoleBrokenPipeError, a new subclass of BrokenPipeError
  whose file attribute is the stream which broke.
- Fixed tab completion of file paths and shell commands, and
  get_exes_in_path(), for names containing square brackets.
  This includes a working directory, home directory, or PATH
  directory with brackets in its name.
- File path completion, shell command completion, and
  get_exes_in_path() now match * and ? literally instead of
  returning nothing when the text being completed contains one,
  so names containing those characters can be completed.
- Tab completion now quotes a match which has a character that
  is special to a shell, such as *, ?, (, &, or $, when the
  text being completed is passed to a shell: the arguments of
  the shell command and everything after a pipe. This keeps the
  shell from expanding or misreading the completed name.
  Everywhere else, only a match with a space is quoted, as
  before. See the Special Characters in Paths documentation for
  details.
- get_exes_in_path(), find_editor(), and shell command
  completion no longer skip PATH entries which are symbolic
  links to directories.
- find_editor() now finds the edit editor on Windows. It was
  the preferred default editor there but could never be found
  because it was searched for without its .exe extension, so
  the default editor on a Windows machine which has edit
  changes to it.

Enhancements:

- Added the rich_progress.py example, which shows how to
  display the progress of long-running commands with Rich
  status spinners and progress bars. See the new Updating
  Output in Place documentation for details, including why a
  carriage return embedded in a string passed to poutput() does
  not move the cursor.
- Added the textual_tty_toolbar.py  example, which shows how to
  keep a bottom toolbar on the screen while commands run by
  running a cmd2 application inside a Textual application which
  draws the toolbar. See Embedding in Textual for how it works
  and what it costs.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_4.4.2.bb => python3-cmd2_4.4.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_4.4.2.bb => python3-cmd2_4.4.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_4.4.2.bb b/meta-python/recipes-devtools/python/python3-cmd2_4.4.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-cmd2_4.4.2.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_4.4.3.bb
index 577eaff41c..2cf423fdd4 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_4.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_4.4.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f2a861642858e0858af9dd4e4716bae0"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "677696e293a1a6a310425d3d52e470518078918585d650fa7eff10635ef4256a"
+SRC_URI[sha256sum] = "6153a28f9b019f31c8fc784b18489edade5852609c913cf5fa36d179bd581a63"
 
 inherit pypi python_setuptools_build_meta python3native
 
-- 
2.47.3

