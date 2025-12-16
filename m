Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7494D637A4
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 19:40:19 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2581.1765914010569269891
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 11:40:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KF2X4NZD;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso40227125e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 11:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765914009; x=1766518809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mOx+UA8iaItb7pYNQpm4DHE44GRp0yVgGW2vR/u0Dnk=;
        b=KF2X4NZDchKsvJXaEJ2KUVaH0ixuYB1hgQIfLuMGF3O6snHtdXVLizvryIE6DCkTaP
         HJID51/OnntMg/yc2l6ZlMqB8obRrAWIlHCwlQSfVsSKGG0El9/sTflIRtzSy0LA4EpT
         p4+DntmPCy+9fPi/L52EtfdIaGAKaXuf4CN8Zdfg8iu/QDn6JLKvDh9HzVO95NzOQXxx
         /gQ/yqPyELJ1p0u0LymsAgDxU9+IUFDgvuXNUZ++tTqUPr7MfgIXcMGYYGhSNGsIxk0U
         h7tNIIekTEGWAAqkfvTriD+FXkU7OP4GkKh/luOWAhPueGvgCuQG8lzQNepeqRIA+K1G
         ssAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765914009; x=1766518809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mOx+UA8iaItb7pYNQpm4DHE44GRp0yVgGW2vR/u0Dnk=;
        b=GiJXDbsScWFTIn5Zo6oZ2VEh1VeXDvRP346UF5IFj3exVrahM5MwcbNj1xmy1C1QpZ
         zdApjVHaHSTew7mt5mpyiP3Atq6hRpiX60/UYUTg4petCrJY+NvpWD8uJNSECL38W9fv
         mCyGKKKdr3OUNqHGXqSyaahhVDa3WaHa0rLPV1P8PZY8ovyACRZP9iv8xmydeKU7H5+X
         ctLkAu+2xsv6pIxSgDdhsqCh2YmO59b/xfDzVmlEI4erq234FoO1025+LI93g/mDc8/2
         NvxPh1c5ev6BpqhII122qPxWisXA3fEKfQ8hIm7Rbb5G+pb+gebaxpGYOBM6ZOs6Ye0s
         aZZg==
X-Gm-Message-State: AOJu0Yx3OdYaTW215nRfbfiDglj06jKzWVxd5NjIWu4fgAEUaeIFTV1J
	G1EodT4bmVNlznIUCYTbmZQhYKohJMz17KpzQFCdQ870YC9c0uZs03VHCf4nlA==
X-Gm-Gg: AY/fxX5Cfjuu6xjsGNYRLKNc4pFOPAp7Zh51ZBmDh2kXrnnRuPgLT1+GyZi7yZAgWuh
	N/LY5V9zkfW+OWyrzzUxNX9IHOAy513oHhnhiAO5UapVWSa03liHYbyBHLAU1XnFOZvTxpCZ0WC
	IHimbrN+N/zk+S861/Ba/IEXbvy0jMPXJBBsQq74w1DPf82mXqDkuoNKs6gVaT1IFbF8tcQBHJq
	JTlhwHYweXHYLccR6/DcHoDuyHn2TdnzdkbRzvi/gmsEtf66VNXz6LgOoNELPVSLopPVJCoSv2Z
	JW4mLAd6qKTj+X+s7TVQlvtKvz+Q5/c1e2NZ0B1wwEkWVINRuqlnfdFA1TNlXTPnDf/K9ROYXCK
	aiEakqldmudQzPsO+yq2OnxEtKA+p++WWQW6A/0A73bX47dRa6FwBUBTHrVPJc5+gcC14Cbxooh
	SO8bbyRrLX
X-Google-Smtp-Source: AGHT+IHiqLx5lLL/JN98KGfjEJQROcGHRswP9jPE/cm2M8aAMaq4172W2guGI+Tc6Ag9qhqQoudzIw==
X-Received: by 2002:a05:600d:6405:20b0:47a:935f:618e with SMTP id 5b1f17b1804b1-47a935f64d7mr126136845e9.15.1765914008756;
        Tue, 16 Dec 2025 11:40:08 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bdc1defb4sm4741395e9.9.2025.12.16.11.40.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 11:40:08 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 4/4] proftpd: patch CVE-2024-48651
Date: Tue, 16 Dec 2025 20:40:05 +0100
Message-ID: <20251216194005.3006575-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216194005.3006575-1-skandigraun@gmail.com>
References: <20251216194005.3006575-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 19:40:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122710

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-48651

Backport the patch mentioned in the NVD report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../proftpd/files/CVE-2024-48651.patch        | 321 ++++++++++++++++++
 .../recipes-daemons/proftpd/proftpd_1.3.7c.bb |   3 +-
 2 files changed, 323 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/CVE-2024-48651.patch

diff --git a/meta-networking/recipes-daemons/proftpd/files/CVE-2024-48651.patch b/meta-networking/recipes-daemons/proftpd/files/CVE-2024-48651.patch
new file mode 100644
index 0000000000..db525c5418
--- /dev/null
+++ b/meta-networking/recipes-daemons/proftpd/files/CVE-2024-48651.patch
@@ -0,0 +1,321 @@
+From 1df9a7b29aaedfc563ba908b52ca2414caddf25f Mon Sep 17 00:00:00 2001
+From: TJ Saunders <tj@castaglia.org>
+Date: Wed, 13 Nov 2024 06:33:35 -0800
+Subject: [PATCH] Issue #1830: When no supplemental groups are provided by the
+ underlying authentication providers, fall back to using the primary
+ group/GID. (#1835)
+
+This prevents surprise due to inheritance of the parent processes' supplemental group membership, which might inadvertently provided undesired access.
+
+CVE: CVE-2024-48651
+Upstream-Status: Backport [https://github.com/proftpd/proftpd/commit/cec01cc0a2523453e5da5a486bc6d977c3768db1]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ contrib/mod_sftp/auth.c                       |  14 +-
+ modules/mod_auth.c                            |  19 +-
+ src/auth.c                                    |  14 +-
+ .../ProFTPD/Tests/Modules/mod_sql_sqlite.pm   | 175 ++++++++++++++++++
+ 4 files changed, 210 insertions(+), 12 deletions(-)
+
+diff --git a/contrib/mod_sftp/auth.c b/contrib/mod_sftp/auth.c
+index ede821daa..2854a03cd 100644
+--- a/contrib/mod_sftp/auth.c
++++ b/contrib/mod_sftp/auth.c
+@@ -382,8 +382,20 @@ static int setup_env(pool *p, const char *user) {
+       session.groups == NULL) {
+     res = pr_auth_getgroups(p, pw->pw_name, &session.gids, &session.groups);
+     if (res < 1) {
++      /* If no supplemental groups are provided, default to using the process
++       * primary GID as the supplemental group.  This prevents access
++       * regressions as seen in Issue #1830.
++       */
+       (void) pr_log_writefile(sftp_logfd, MOD_SFTP_VERSION,
+-        "no supplemental groups found for user '%s'", pw->pw_name);
++        "no supplemental groups found for user '%s', "
++        "using primary group %s (GID %lu)", pw->pw_name, session.group,
++        (unsigned long) session.login_gid);
++
++      session.gids = make_array(p, 2, sizeof(gid_t));
++      session.groups = make_array(p, 2, sizeof(char *));
++
++      *((gid_t *) push_array(session.gids)) = session.login_gid;
++      *((char **) push_array(session.groups)) = pstrdup(p, session.group);
+     }
+   }
+ 
+diff --git a/modules/mod_auth.c b/modules/mod_auth.c
+index e47ed148d..a1b71c0f7 100644
+--- a/modules/mod_auth.c
++++ b/modules/mod_auth.c
+@@ -1111,8 +1111,8 @@ static int setup_env(pool *p, cmd_rec *cmd, const char *user, char *pass) {
+     session.groups = NULL;
+   }
+ 
+-  if (!session.gids &&
+-      !session.groups) {
++  if (session.gids == NULL &&
++      session.groups == NULL) {
+     /* Get the supplemental groups.  Note that we only look up the
+      * supplemental group credentials if we have not cached the group
+      * credentials before, in session.gids and session.groups.  
+@@ -1122,8 +1122,19 @@ static int setup_env(pool *p, cmd_rec *cmd, const char *user, char *pass) {
+      */
+      res = pr_auth_getgroups(p, pw->pw_name, &session.gids, &session.groups);
+      if (res < 1) {
+-       pr_log_debug(DEBUG5, "no supplemental groups found for user '%s'",
+-         pw->pw_name);
++       /* If no supplemental groups are provided, default to using the process
++        * primary GID as the supplemental group.  This prevents access
++        * regressions as seen in Issue #1830.
++        */
++       pr_log_debug(DEBUG5, "no supplemental groups found for user '%s', "
++         "using primary group %s (GID %lu)", pw->pw_name, session.group,
++         (unsigned long) session.login_gid);
++
++       session.gids = make_array(p, 2, sizeof(gid_t));
++       session.groups = make_array(p, 2, sizeof(char *));
++
++       *((gid_t *) push_array(session.gids)) = session.login_gid;
++       *((char **) push_array(session.groups)) = pstrdup(p, session.group);
+      }
+   }
+ 
+diff --git a/src/auth.c b/src/auth.c
+index 494a479c0..a6fe9f1c2 100644
+--- a/src/auth.c
++++ b/src/auth.c
+@@ -1512,12 +1512,12 @@ int pr_auth_getgroups(pool *p, const char *name, array_header **group_ids,
+   }
+ 
+   /* Allocate memory for the array_headers of GIDs and group names. */
+-  if (group_ids) {
+-    *group_ids = make_array(permanent_pool, 2, sizeof(gid_t));
++  if (group_ids != NULL) {
++    *group_ids = make_array(p, 2, sizeof(gid_t));
+   }
+ 
+-  if (group_names) {
+-    *group_names = make_array(permanent_pool, 2, sizeof(char *));
++  if (group_names != NULL) {
++    *group_names = make_array(p, 2, sizeof(char *));
+   }
+ 
+   cmd = make_cmd(p, 3, name, group_ids ? *group_ids : NULL,
+@@ -1536,7 +1536,7 @@ int pr_auth_getgroups(pool *p, const char *name, array_header **group_ids,
+      * for the benefit of auth_getgroup() implementors.
+      */
+ 
+-    if (group_ids) {
++    if (group_ids != NULL) {
+       register unsigned int i;
+       char *strgids = "";
+       gid_t *gids = (*group_ids)->elts;
+@@ -1552,7 +1552,7 @@ int pr_auth_getgroups(pool *p, const char *name, array_header **group_ids,
+         *strgids ? strgids : "(None; corrupted group file?)");
+     }
+ 
+-    if (group_names) {
++    if (group_names != NULL) {
+       register unsigned int i;
+       char *strgroups = ""; 
+       char **groups = (*group_names)->elts;
+@@ -1568,7 +1568,7 @@ int pr_auth_getgroups(pool *p, const char *name, array_header **group_ids,
+     }
+   }
+ 
+-  if (cmd->tmp_pool) {
++  if (cmd->tmp_pool != NULL) {
+     destroy_pool(cmd->tmp_pool);
+     cmd->tmp_pool = NULL;
+   }
+diff --git a/tests/t/lib/ProFTPD/Tests/Modules/mod_sql_sqlite.pm b/tests/t/lib/ProFTPD/Tests/Modules/mod_sql_sqlite.pm
+index 4abb6eb59..f1ffeef34 100644
+--- a/tests/t/lib/ProFTPD/Tests/Modules/mod_sql_sqlite.pm
++++ b/tests/t/lib/ProFTPD/Tests/Modules/mod_sql_sqlite.pm
+@@ -467,6 +467,11 @@ my $TESTS = {
+     order => ++$order,
+     test_class => [qw(forking bug mod_tls)],
+   },
++
++  sql_user_info_no_suppl_groups_issue1830 => {
++    order => ++$order,
++    test_class => [qw(forking bug rootprivs)],
++  },
+ };
+ 
+ sub new {
+@@ -15732,4 +15737,174 @@ EOC
+   test_cleanup($setup->{log_file}, $ex);
+ }
+ 
++sub sql_user_info_no_suppl_groups_issue1830 {
++  my $self = shift;
++  my $tmpdir = $self->{tmpdir};
++  my $setup = test_setup($tmpdir, 'sqlite');
++    
++  my $db_file = File::Spec->rel2abs("$tmpdir/proftpd.db");
++
++  # Build up sqlite3 command to create users, groups tables and populate them
++  my $db_script = File::Spec->rel2abs("$tmpdir/proftpd.sql");
++  
++  if (open(my $fh, "> $db_script")) {
++    print $fh <<EOS;
++CREATE TABLE users (
++  userid TEXT,
++  passwd TEXT,
++  uid INTEGER,
++  gid INTEGER,
++  homedir TEXT,
++  shell TEXT
++);
++INSERT INTO users (userid, passwd, uid, gid, homedir, shell) VALUES ('$setup->{user}', '$setup->{passwd}', $setup->{uid}, $setup->{gid}, '$setup->{home_dir}', '/bin/bash');
++
++CREATE TABLE groups (
++  groupname TEXT,
++  gid INTEGER,
++  members TEXT
++);
++INSERT INTO groups (groupname, gid, members) VALUES ('$setup->{group}', $setup->{gid}, '$setup->{user}');
++EOS
++
++    unless (close($fh)) {
++      die("Can't write $db_script: $!");
++    }
++
++  } else {
++    die("Can't open $db_script: $!");
++  }
++  
++  my $cmd = "sqlite3 $db_file < $db_script";
++  build_db($cmd, $db_script);
++
++  # Make sure that, if we're running as root, the database file has
++  # the permissions/privs set for use by proftpd
++  if ($< == 0) {
++    unless (chmod(0666, $db_file)) {
++      die("Can't set perms on $db_file to 0666: $!");
++    }
++  }
++
++  my $config = {
++    PidFile => $setup->{pid_file},
++    ScoreboardFile => $setup->{scoreboard_file},
++    SystemLog => $setup->{log_file},
++    TraceLog => $setup->{log_file},
++    Trace => 'auth:20 sql:20',
++
++    # Required for logging the expected message
++    DebugLevel => 5,
++
++    IfModules => {
++      'mod_delay.c' => {
++        DelayEngine => 'off',
++      },
++  
++      'mod_sql.c' => {
++        AuthOrder => 'mod_sql.c',
++  
++        SQLAuthenticate => 'users',
++        SQLAuthTypes => 'plaintext',
++        SQLBackend => 'sqlite3',
++        SQLConnectInfo => $db_file,
++        SQLLogFile => $setup->{log_file},
++    
++        # Set these, so that our lower UID/GID will be used
++        SQLMinUserUID => 100,
++        SQLMinUserGID => 100,
++      },
++    },
++  };
++  
++  my ($port, $config_user, $config_group) = config_write($setup->{config_file},
++    $config);
++
++  # Open pipes, for use between the parent and child processes.  Specifically,
++  # the child will indicate when it's done with its test by writing a message
++  # to the parent.
++  my ($rfh, $wfh);
++  unless (pipe($rfh, $wfh)) {
++    die("Can't open pipe: $!");
++  }
++
++  my $ex;
++      
++  # Fork child
++  $self->handle_sigchld();
++  defined(my $pid = fork()) or die("Can't fork: $!");
++  if ($pid) {
++    eval {
++      sleep(2);
++  
++      my $client = ProFTPD::TestSuite::FTP->new('127.0.0.1', $port);
++      $client->login($setup->{user}, $setup->{passwd});
++  
++      my $resp_msgs = $client->response_msgs();
++      my $nmsgs = scalar(@$resp_msgs);
++    
++      my $expected = 1;
++      $self->assert($expected == $nmsgs,
++        test_msg("Expected $expected, got $nmsgs"));
++
++      $expected = "User $setup->{user} logged in";
++      $self->assert($expected eq $resp_msgs->[0],
++        test_msg("Expected response '$expected', got '$resp_msgs->[0]'"));
++    
++      $client->quit();
++    };
++    if ($@) {
++      $ex = $@;
++    }
++
++    $wfh->print("done\n");
++    $wfh->flush();
++        
++  } else {
++    eval { server_wait($setup->{config_file}, $rfh) };
++    if ($@) {
++      warn($@);
++      exit 1;
++    }
++        
++    exit 0;
++  }
++        
++  # Stop server
++  server_stop($setup->{pid_file});
++  $self->assert_child_ok($pid);
++        
++  eval {
++    if (open(my $fh, "< $setup->{log_file}")) {
++      my $ok = 0;
++  
++      while (my $line = <$fh>) {
++        chomp($line);
++
++        if ($ENV{TEST_VERBOSE}) {
++          print STDERR "# $line\n";
++        }
++  
++        if ($line =~ /no supplemental groups found for user '$setup->{user}', using primary group/) {
++          $ok = 1;
++          last;
++        }
++      }
++      
++      close($fh);
++  
++      $self->assert($ok, test_msg("Did not see expected log message"));
++  
++    } else {
++      die("Can't read $setup->{log_file}: $!");
++    }
++  };
++  if ($@) {
++    $ex = $@ unless $ex;
++  }
++      
++  test_cleanup($setup->{log_file}, $ex);
++}
++      
++
+ 1;
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
index c8097a14b0..345c714a52 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
@@ -12,12 +12,13 @@ SRC_URI = "git://github.com/proftpd/proftpd.git;branch=${BRANCH};protocol=https
            file://proftpd-basic.init \
            file://default \
            file://close-RequireValidShell-check.patch \
-           file://contrib.patch  \
+           file://contrib.patch \
            file://build_fixup.patch \
            file://proftpd.service \
            file://CVE-2023-51713.patch \
            file://CVE-2024-57392.patch \
            file://CVE-2023-48795.patch \
+           file://CVE-2024-48651.patch \
            "
 
 S = "${WORKDIR}/git"

