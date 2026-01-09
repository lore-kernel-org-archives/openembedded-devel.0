Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9444D167E5
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 09:29:16 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6762.1767950951044784099
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 01:29:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DAIgToZJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2a0834769f0so31114385ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 01:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767950950; x=1768555750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GbBZA9EI+yWSWkv9RObQRvkcHQ07Oi31x8kWxXwRMs=;
        b=DAIgToZJa8Du2IO8UtKllCVcvfXtEuYCGhPv1Q007Lvv5GzXdT18+btj+MWKl5Fir0
         0Mvnx8FFfB0Tlve0HcG4Ja/8mgRWVHV2NGyaR1D1K/e8OVNQ8JU6gBEo6dLy0Ufr/Ryy
         7Z3kBX7jKvCp7CVfMRtSUvd8QSdRxKHs1fomqfreOUg07rsez+/ftx3fDn0NRJh0Cnao
         XI3PU5Kidcjui1FHLC+wCNe2NlioARck5dMJ+eEKc1X9bk2KzksCwVqZk03mimFmdNRQ
         8IAK3fT4/tC2NBPXyzzoq+tGCM94y/J/4rc/loePflPCbLqCbc88Oyg9WrIq8VtGU/oz
         BIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950950; x=1768555750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0GbBZA9EI+yWSWkv9RObQRvkcHQ07Oi31x8kWxXwRMs=;
        b=KW8iPm9owIij+YORe2+BfGhtq4pRy9oGaYe3RmvmK5Y6HGPHohXyXDyq6urRKmOeUh
         jANNVh/vRG0UO+kYjnh2OxzawoqTQiaGtzRiN9hmhW0GG2itk/gcMJcDj69KTnHX2XED
         fYzhMjtrrICZManj1VzwR9cZoVfBp3Bsir45IP23Es+0nzDucucx6GSzL+0R36ET5dxn
         zsVBhab+wwIQMKo9ZENfhO2RyQKlncjA/X39+IBpc92OC/XNHKNj1zVynvO8uNDSFaiW
         w/1Mc5dhMs0p7zeYYjdsGTnnmzXWLYuXZnQwa6drSAz8T6n7m6PuEx9XTK1xILsikyuu
         iWuw==
X-Gm-Message-State: AOJu0YxChli3QC1aJU18sIxdp2C96jw1zjHoGcDnBc6I2x9a0y5tAPiE
	uGQ7ypsYS8hsZIlBoErbjFM6yjO9hdN+4ppDSk7wCMtvRJunxH7QRi0LKVTZ6lXO
X-Gm-Gg: AY/fxX7woc9T0p/YfuRibNM01l1YfCpxWSJEvD9df3FpHi9nWmAHy57dknjiseHLR5n
	dJue9Cfyvld24kXIVGq/0S6c/AkSKI+IOBqytdvx7eJiugqVdm5kbtyt2+esKD4bPFcLcnBXnPF
	7NvGQKUDtantpv5fa0u0S5ktpe3HGceziMiG2KZVuYBK0bw8xwss82ZUu+UCgojZ84WSMABn3Fd
	FoAmHEzYPcLAIRDMJbENPQGacZIG6LCbhdmdkq17sUrmMd1RvxuR/VfR1/VooEeEujOpR2SIQBD
	0/1+A7VKj4EIxJ4J07vHSR688zoSlwVwF5wEgp3P3CyagQij5mBzrNWIlIQPpk107AFmjNLQ13M
	by3AtR4EJG05WPMr89QjRAVB8acpS6AXBmjfy6PWhpp9ze9KnJSDehtjhc61/MOBYOdcMnRMvIY
	xhrW+stiTS/nWIRNAYtiSIYUs=
X-Google-Smtp-Source: AGHT+IGM6BsaKplJwVAwHCDY95HrOMrTJVgi4cwWKqCe87HTsVJ+7iFhpD7QGKrYed/jpyMGFDQVjw==
X-Received: by 2002:a17:903:2a8e:b0:295:5668:2f27 with SMTP id d9443c01a7336-2a3ee41cf71mr79350695ad.9.1767950950108;
        Fri, 09 Jan 2026 01:29:10 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88e3sm99529295ad.75.2026.01.09.01.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:29:09 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 08/12] proftpd: patch CVE-2024-48651
Date: Fri,  9 Jan 2026 22:28:38 +1300
Message-ID: <20260109092843.1924568-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109092843.1924568-1-ankur.tyagi85@gmail.com>
References: <20260109092843.1924568-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 09:29:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123286

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-48651

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../proftpd/files/CVE-2024-48651.patch        | 320 ++++++++++++++++++
 .../recipes-daemons/proftpd/proftpd_1.3.7f.bb |   1 +
 2 files changed, 321 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/CVE-2024-48651.patch

diff --git a/meta-networking/recipes-daemons/proftpd/files/CVE-2024-48651.patch b/meta-networking/recipes-daemons/proftpd/files/CVE-2024-48651.patch
new file mode 100644
index 0000000000..e89a767334
--- /dev/null
+++ b/meta-networking/recipes-daemons/proftpd/files/CVE-2024-48651.patch
@@ -0,0 +1,320 @@
+From fcb363a1054f2f650f80d307b616d59fb711bfc1 Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ contrib/mod_sftp/auth.c                       |  14 +-
+ modules/mod_auth.c                            |  19 +-
+ src/auth.c                                    |  14 +-
+ .../ProFTPD/Tests/Modules/mod_sql_sqlite.pm   | 174 ++++++++++++++++++
+ 4 files changed, 209 insertions(+), 12 deletions(-)
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
+index 4abb6eb59..4693dbf8f 100644
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
+@@ -15732,4 +15737,173 @@ EOC
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
+ 1;
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7f.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7f.bb
index 9bfe9aed03..2c93393e68 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7f.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7f.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/proftpd/proftpd.git;branch=${BRANCH};protocol=https
            file://CVE-2023-51713.patch \
            file://CVE-2024-57392.patch \
            file://CVE-2023-48795.patch \
+           file://CVE-2024-48651.patch \
            "
 
 S = "${WORKDIR}/git"

