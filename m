Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93127C25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 07:14:05 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.9064.1717571638898392907
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jun 2024 00:13:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j6AL7lgk;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-70109d34a16so5782263b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Jun 2024 00:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717571638; x=1718176438; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n84HDAKDuzfd1qlZ717e6RisPD5xVlkJ0vPkvQfVtWY=;
        b=j6AL7lgkAeq/DorVrLLs6zjnvPi+rIiQJLydjNPHcuBThIDMw6wMZam6fB1p5uNsIh
         a33dzzRr+kQZTECJJ+1yb45sZ8oQhbpvmQSPMaQMt/t47QcDdGfoJVQZo89MnOj90KlN
         C6gCb1g0eXeyqwd0GPOI1Lug9OBgVIcY9fncQJU751xW2DOObL5WwFoKzI3B/YvONHDV
         AMdJrYV9WiHS1nBhcdXbojsmphcsjeclq45rVH7o3DPGe8749s9oGtxT3brXeswjvbiH
         mIj9mSI9hLAPHBL8bktmWPUSM7iXd4Bg7249dYp+s90Zc9hQ/dG+lNYVmsdbKE3NLYW9
         RRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717571638; x=1718176438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n84HDAKDuzfd1qlZ717e6RisPD5xVlkJ0vPkvQfVtWY=;
        b=ecp0vIzW/jE/AGNO5FxdTAaXmBVR7sKhQ/JlsGMzoboSMEeyY+YH3Vwy1uqOxd9DQh
         Lq6VrtngSpnkGTKZ4nv1twWFCpbenvRAccfeeGMEJB25sGnFudh/U4tZcFZiBZ8CTsIF
         LyOXwccCaJoFpcZunhmpZG0e5EJSxRZrjqmlUUJSmSbYOvk5oYodga+1Tz5lKuTGVQJ5
         yn3qDKHuvi6GlLhpwFCkPsJBGii+Y5t44tbS5gChiqcQijtr3MIdbAs/7vsevLv41DSk
         dExzIYraZmzEcG36o4taoczJvGjNTQrXYlyUgtezMf2ja6uFmZyhZwPjS1ObkeJsbP9d
         dxKg==
X-Gm-Message-State: AOJu0Yzq+OHPuonu//M8+pjBqR6PtUNjPdntRo86AZcp9K7wlC9c1Hvi
	ETlZoKB/8mvQ4Bh0Wls22N/MdMRol3kuLKSFf6Nx+jwOBXcGsgbMStlhDRP2
X-Google-Smtp-Source: AGHT+IE1aOReLakjc4oqBv3+XgFqjxO9IXMR25juS7TnSvWCW8inUk18GepIBn4YB8zXSAyhD7cFJA==
X-Received: by 2002:a05:6a00:140d:b0:702:6567:ffd with SMTP id d2e1a72fcca58-703e5a13577mr1886855b3a.24.1717571637560;
        Wed, 05 Jun 2024 00:13:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::6d8c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70242aea254sm8042321b3a.111.2024.06.05.00.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 00:13:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] sdbus-c++-libsystemd: Refresh patches to work with systemd 255.6
Date: Wed,  5 Jun 2024 00:13:54 -0700
Message-ID: <20240605071354.1673246-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jun 2024 07:14:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110697

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-not-disable-buffer-in-writing-files.patch | 119 ++++++------------
 ...22-avoid-missing-LOCK_EX-declaration.patch |  11 +-
 2 files changed, 38 insertions(+), 92 deletions(-)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0012-do-not-disable-buffer-in-writing-files.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0012-do-not-disable-buffer-in-writing-files.patch
index 66be79077e..c23d9b7551 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0012-do-not-disable-buffer-in-writing-files.patch
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0012-do-not-disable-buffer-in-writing-files.patch
@@ -46,11 +46,9 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  src/vconsole/vconsole-setup.c        |  2 +-
  22 files changed, 50 insertions(+), 51 deletions(-)
 
-diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index d2be79622f..e65fecb68d 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
-@@ -417,7 +417,7 @@ int cg_kill_kernel_sigkill(const char *path) {
+@@ -417,7 +417,7 @@ int cg_kill_kernel_sigkill(const char *p
          if (r < 0)
                  return r;
  
@@ -59,7 +57,7 @@ index d2be79622f..e65fecb68d 100644
          if (r < 0)
                  return r;
  
-@@ -843,7 +843,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -843,7 +843,7 @@ int cg_install_release_agent(const char
  
          sc = strstrip(contents);
          if (isempty(sc)) {
@@ -68,7 +66,7 @@ index d2be79622f..e65fecb68d 100644
                  if (r < 0)
                          return r;
          } else if (!path_equal(sc, agent))
-@@ -861,7 +861,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -861,7 +861,7 @@ int cg_install_release_agent(const char
  
          sc = strstrip(contents);
          if (streq(sc, "0")) {
@@ -77,7 +75,7 @@ index d2be79622f..e65fecb68d 100644
                  if (r < 0)
                          return r;
  
-@@ -888,7 +888,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -888,7 +888,7 @@ int cg_uninstall_release_agent(const cha
          if (r < 0)
                  return r;
  
@@ -86,7 +84,7 @@ index d2be79622f..e65fecb68d 100644
          if (r < 0)
                  return r;
  
-@@ -898,7 +898,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -898,7 +898,7 @@ int cg_uninstall_release_agent(const cha
          if (r < 0)
                  return r;
  
@@ -95,7 +93,7 @@ index d2be79622f..e65fecb68d 100644
          if (r < 0)
                  return r;
  
-@@ -1814,7 +1814,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
+@@ -1814,7 +1814,7 @@ int cg_set_attribute(const char *control
          if (r < 0)
                  return r;
  
@@ -104,11 +102,9 @@ index d2be79622f..e65fecb68d 100644
  }
  
  int cg_get_attribute(const char *controller, const char *path, const char *attribute, char **ret) {
-diff --git a/src/basic/namespace-util.c b/src/basic/namespace-util.c
-index 2101f617ad..63817bae17 100644
 --- a/src/basic/namespace-util.c
 +++ b/src/basic/namespace-util.c
-@@ -227,12 +227,12 @@ int userns_acquire(const char *uid_map, const char *gid_map) {
+@@ -227,12 +227,12 @@ int userns_acquire(const char *uid_map,
                  freeze();
  
          xsprintf(path, "/proc/" PID_FMT "/uid_map", pid);
@@ -123,11 +119,9 @@ index 2101f617ad..63817bae17 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to write GID map: %m");
  
-diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
-index 6cb0ddf575..247cf9e1d1 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
-@@ -64,13 +64,13 @@ int procfs_tasks_set_limit(uint64_t limit) {
+@@ -64,13 +64,13 @@ int procfs_tasks_set_limit(uint64_t limi
           * decrease it, as threads-max is the much more relevant sysctl. */
          if (limit > pid_max-1) {
                  sprintf(buffer, "%" PRIu64, limit+1); /* Add one, since PID 0 is not a valid PID */
@@ -143,11 +137,9 @@ index 6cb0ddf575..247cf9e1d1 100644
          if (r < 0) {
                  uint64_t threads_max;
  
-diff --git a/src/basic/sysctl-util.c b/src/basic/sysctl-util.c
-index b66a6622ae..8d1c93008a 100644
 --- a/src/basic/sysctl-util.c
 +++ b/src/basic/sysctl-util.c
-@@ -58,7 +58,7 @@ int sysctl_write(const char *property, const char *value) {
+@@ -58,7 +58,7 @@ int sysctl_write(const char *property, c
  
          log_debug("Setting '%s' to '%s'", p, value);
  
@@ -156,8 +148,6 @@ index b66a6622ae..8d1c93008a 100644
  }
  
  int sysctl_writef(const char *property, const char *format, ...) {
-diff --git a/src/binfmt/binfmt.c b/src/binfmt/binfmt.c
-index d21f3f79ff..258607cc7e 100644
 --- a/src/binfmt/binfmt.c
 +++ b/src/binfmt/binfmt.c
 @@ -30,7 +30,7 @@ static bool arg_unregister = false;
@@ -169,7 +159,7 @@ index d21f3f79ff..258607cc7e 100644
  }
  
  static int apply_rule(const char *filename, unsigned line, const char *rule) {
-@@ -58,7 +58,7 @@ static int apply_rule(const char *filename, unsigned line, const char *rule) {
+@@ -58,7 +58,7 @@ static int apply_rule(const char *filena
          if (r >= 0)
                  log_debug("%s:%u: Rule '%s' deleted.", filename, line, rulename);
  
@@ -187,11 +177,9 @@ index d21f3f79ff..258607cc7e 100644
                  if (r < 0)
                          log_warning_errno(r, "Failed to flush binfmt_misc rules, ignoring: %m");
                  else
-diff --git a/src/core/cgroup.c b/src/core/cgroup.c
-index 61ac4df1a6..ea18970196 100644
 --- a/src/core/cgroup.c
 +++ b/src/core/cgroup.c
-@@ -4578,7 +4578,7 @@ int unit_cgroup_freezer_action(Unit *u, FreezerAction action) {
+@@ -4578,7 +4578,7 @@ int unit_cgroup_freezer_action(Unit *u,
                          u->freezer_state = FREEZER_THAWING;
          }
  
@@ -200,11 +188,9 @@ index 61ac4df1a6..ea18970196 100644
          if (r < 0)
                  return r;
  
-diff --git a/src/core/main.c b/src/core/main.c
-index 3f71cc0947..0e5aec3e9e 100644
 --- a/src/core/main.c
 +++ b/src/core/main.c
-@@ -1678,7 +1678,7 @@ static void initialize_core_pattern(bool skip_setup) {
+@@ -1678,7 +1678,7 @@ static void initialize_core_pattern(bool
          if (getpid_cached() != 1)
                  return;
  
@@ -213,11 +199,9 @@ index 3f71cc0947..0e5aec3e9e 100644
          if (r < 0)
                  log_warning_errno(r, "Failed to write '%s' to /proc/sys/kernel/core_pattern, ignoring: %m",
                                    arg_early_core_pattern);
-diff --git a/src/core/smack-setup.c b/src/core/smack-setup.c
-index 7ea902b6f9..1aef2988d0 100644
 --- a/src/core/smack-setup.c
 +++ b/src/core/smack-setup.c
-@@ -321,17 +321,17 @@ int mac_smack_setup(bool *loaded_policy) {
+@@ -321,17 +321,17 @@ int mac_smack_setup(bool *loaded_policy)
          }
  
  #if HAVE_SMACK_RUN_LABEL
@@ -239,8 +223,6 @@ index 7ea902b6f9..1aef2988d0 100644
          if (r < 0)
                  log_warning_errno(r, "Failed to set SMACK netlabel rule \"127.0.0.1 -CIPSO\": %m");
  #endif
-diff --git a/src/home/homework.c b/src/home/homework.c
-index 066483e342..5f92dd7064 100644
 --- a/src/home/homework.c
 +++ b/src/home/homework.c
 @@ -278,7 +278,7 @@ static void drop_caches_now(void) {
@@ -252,11 +234,9 @@ index 066483e342..5f92dd7064 100644
          if (r < 0)
                  log_warning_errno(r, "Failed to drop caches, ignoring: %m");
          else
-diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-device/sd-device.c
-index 2fbc619a34..09d9591e37 100644
 --- a/src/libsystemd/sd-device/sd-device.c
 +++ b/src/libsystemd/sd-device/sd-device.c
-@@ -2516,7 +2516,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
+@@ -2516,7 +2516,7 @@ _public_ int sd_device_set_sysattr_value
          if (!value)
                  return -ENOMEM;
  
@@ -265,11 +245,9 @@ index 2fbc619a34..09d9591e37 100644
          if (r < 0) {
                  /* On failure, clear cache entry, as we do not know how it fails. */
                  device_remove_cached_sysattr_value(device, sysattr);
-diff --git a/src/nspawn/nspawn-cgroup.c b/src/nspawn/nspawn-cgroup.c
-index a5002437c6..b12e6cd9c9 100644
 --- a/src/nspawn/nspawn-cgroup.c
 +++ b/src/nspawn/nspawn-cgroup.c
-@@ -124,7 +124,7 @@ int sync_cgroup(pid_t pid, CGroupUnified unified_requested, uid_t uid_shift) {
+@@ -124,7 +124,7 @@ int sync_cgroup(pid_t pid, CGroupUnified
          fn = strjoina(tree, cgroup, "/cgroup.procs");
  
          sprintf(pid_string, PID_FMT, pid);
@@ -278,11 +256,9 @@ index a5002437c6..b12e6cd9c9 100644
          if (r < 0) {
                  log_error_errno(r, "Failed to move process: %m");
                  goto finish;
-diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index 6ab604d3dc..bbec6b686c 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -2688,7 +2688,7 @@ static int reset_audit_loginuid(void) {
+@@ -2690,7 +2690,7 @@ static int reset_audit_loginuid(void) {
          if (streq(p, "4294967295"))
                  return 0;
  
@@ -291,7 +267,7 @@ index 6ab604d3dc..bbec6b686c 100644
          if (r < 0) {
                  log_error_errno(r,
                                  "Failed to reset audit login UID. This probably means that your kernel is too\n"
-@@ -4141,7 +4141,7 @@ static int setup_uid_map(
+@@ -4143,7 +4143,7 @@ static int setup_uid_map(
                  return log_oom();
  
          xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
@@ -300,7 +276,7 @@ index 6ab604d3dc..bbec6b686c 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to write UID map: %m");
  
-@@ -4151,7 +4151,7 @@ static int setup_uid_map(
+@@ -4153,7 +4153,7 @@ static int setup_uid_map(
                  return log_oom();
  
          xsprintf(uid_map, "/proc/" PID_FMT "/gid_map", pid);
@@ -309,8 +285,6 @@ index 6ab604d3dc..bbec6b686c 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to write GID map: %m");
  
-diff --git a/src/shared/binfmt-util.c b/src/shared/binfmt-util.c
-index a26175474b..1413a9c72c 100644
 --- a/src/shared/binfmt-util.c
 +++ b/src/shared/binfmt-util.c
 @@ -46,7 +46,7 @@ int disable_binfmt(void) {
@@ -322,11 +296,9 @@ index a26175474b..1413a9c72c 100644
          if (r < 0)
                  return log_warning_errno(r, "Failed to unregister binfmt_misc entries: %m");
  
-diff --git a/src/shared/cgroup-setup.c b/src/shared/cgroup-setup.c
-index 934a16eaf3..c921ced861 100644
 --- a/src/shared/cgroup-setup.c
 +++ b/src/shared/cgroup-setup.c
-@@ -351,7 +351,7 @@ int cg_attach(const char *controller, const char *path, pid_t pid) {
+@@ -351,7 +351,7 @@ int cg_attach(const char *controller, co
  
          xsprintf(c, PID_FMT "\n", pid);
  
@@ -344,11 +316,9 @@ index 934a16eaf3..c921ced861 100644
                          if (r < 0) {
                                  log_debug_errno(r, "Failed to %s controller %s for %s (%s): %m",
                                                  FLAGS_SET(mask, bit) ? "enable" : "disable", n, p, fs);
-diff --git a/src/shared/coredump-util.c b/src/shared/coredump-util.c
-index 805503f366..01a7ccb291 100644
 --- a/src/shared/coredump-util.c
 +++ b/src/shared/coredump-util.c
-@@ -163,7 +163,7 @@ int set_coredump_filter(uint64_t value) {
+@@ -163,7 +163,7 @@ int set_coredump_filter(uint64_t value)
          xsprintf(t, "0x%"PRIx64, value);
  
          return write_string_file("/proc/self/coredump_filter", t,
@@ -366,11 +336,9 @@ index 805503f366..01a7ccb291 100644
          if (r < 0)
                  log_debug_errno(r, "Failed to turn off coredumps, ignoring: %m");
  }
-diff --git a/src/shared/hibernate-util.c b/src/shared/hibernate-util.c
-index 3eb13d48f6..d09b901be1 100644
 --- a/src/shared/hibernate-util.c
 +++ b/src/shared/hibernate-util.c
-@@ -481,7 +481,7 @@ int write_resume_config(dev_t devno, uint64_t offset, const char *device) {
+@@ -501,7 +501,7 @@ int write_resume_config(dev_t devno, uin
  
          /* We write the offset first since it's safer. Note that this file is only available in 4.17+, so
           * fail gracefully if it doesn't exist and we're only overwriting it with 0. */
@@ -379,7 +347,7 @@ index 3eb13d48f6..d09b901be1 100644
          if (r == -ENOENT) {
                  if (offset != 0)
                          return log_error_errno(SYNTHETIC_ERRNO(EOPNOTSUPP),
-@@ -497,7 +497,7 @@ int write_resume_config(dev_t devno, uint64_t offset, const char *device) {
+@@ -517,7 +517,7 @@ int write_resume_config(dev_t devno, uin
                  log_debug("Wrote resume_offset=%s for device '%s' to /sys/power/resume_offset.",
                            offset_str, device);
  
@@ -388,11 +356,9 @@ index 3eb13d48f6..d09b901be1 100644
          if (r < 0)
                  return log_error_errno(r,
                                         "Failed to write device '%s' (%s) to /sys/power/resume: %m",
-diff --git a/src/shared/smack-util.c b/src/shared/smack-util.c
-index 1f88e724d0..feb18b320a 100644
 --- a/src/shared/smack-util.c
 +++ b/src/shared/smack-util.c
-@@ -113,7 +113,7 @@ int mac_smack_apply_pid(pid_t pid, const char *label) {
+@@ -113,7 +113,7 @@ int mac_smack_apply_pid(pid_t pid, const
                  return 0;
  
          p = procfs_file_alloca(pid, "attr/current");
@@ -401,24 +367,20 @@ index 1f88e724d0..feb18b320a 100644
          if (r < 0)
                  return r;
  
-diff --git a/src/shared/watchdog.c b/src/shared/watchdog.c
-index 4c1a968718..6faf6806a5 100644
 --- a/src/shared/watchdog.c
 +++ b/src/shared/watchdog.c
-@@ -93,7 +93,7 @@ static int set_pretimeout_governor(const char *governor) {
+@@ -93,7 +93,7 @@ static int set_pretimeout_governor(const
  
          r = write_string_file(sys_fn,
                                governor,
 -                              WRITE_STRING_FILE_DISABLE_BUFFER | WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_VERIFY_IGNORE_NEWLINE);
 +                              WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_VERIFY_IGNORE_NEWLINE);
          if (r < 0)
-                 return log_error_errno(r, "Failed to set pretimeout_governor to '%s': %m", governor);
+                 return log_error_errno(r, "Failed to set watchdog pretimeout_governor to '%s': %m", governor);
  
-diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
-index 21af3e9e52..6d4b84b5d5 100644
 --- a/src/sleep/sleep.c
 +++ b/src/sleep/sleep.c
-@@ -137,7 +137,7 @@ static int write_state(int fd, char * const *states) {
+@@ -137,7 +137,7 @@ static int write_state(int fd, char * co
                  if (k < 0)
                          return RET_GATHER(r, k);
  
@@ -427,7 +389,7 @@ index 21af3e9e52..6d4b84b5d5 100644
                  if (k >= 0) {
                          log_debug("Using sleep state '%s'.", *state);
                          return 0;
-@@ -155,7 +155,7 @@ static int write_mode(char * const *modes) {
+@@ -155,7 +155,7 @@ static int write_mode(char * const *mode
          STRV_FOREACH(mode, modes) {
                  int k;
  
@@ -436,11 +398,9 @@ index 21af3e9e52..6d4b84b5d5 100644
                  if (k >= 0) {
                          log_debug("Using sleep disk mode '%s'.", *mode);
                          return 0;
-diff --git a/src/storagetm/storagetm.c b/src/storagetm/storagetm.c
-index ae63baaf79..82eeca479a 100644
 --- a/src/storagetm/storagetm.c
 +++ b/src/storagetm/storagetm.c
-@@ -186,7 +186,7 @@ static int nvme_subsystem_unlink(NvmeSubsystem *s) {
+@@ -186,7 +186,7 @@ static int nvme_subsystem_unlink(NvmeSub
                                          if (!enable_fn)
                                                  return log_oom();
  
@@ -449,7 +409,7 @@ index ae63baaf79..82eeca479a 100644
                                          if (r < 0)
                                                  log_warning_errno(r, "Failed to disable namespace '%s' of NVME subsystem '%s', ignoring: %m", e->d_name, s->name);
  
-@@ -254,7 +254,7 @@ static int nvme_subsystem_write_metadata(int subsystem_fd, sd_device *device) {
+@@ -254,7 +254,7 @@ static int nvme_subsystem_write_metadata
                  _cleanup_free_ char *truncated = strndup(w, 40); /* kernel refuses more than 40 chars (as per nvme spec) */
  
                  /* The default string stored in 'attr_model' is "Linux" btw. */
@@ -458,7 +418,7 @@ index ae63baaf79..82eeca479a 100644
                  if (r < 0)
                          log_warning_errno(r, "Failed to set model of subsystem to '%s', ignoring: %m", w);
          }
-@@ -268,7 +268,7 @@ static int nvme_subsystem_write_metadata(int subsystem_fd, sd_device *device) {
+@@ -268,7 +268,7 @@ static int nvme_subsystem_write_metadata
                          return log_oom();
  
                   /* The default string stored in 'attr_firmware' is `uname -r` btw, but truncated to 8 chars. */
@@ -467,7 +427,7 @@ index ae63baaf79..82eeca479a 100644
                  if (r < 0)
                          log_warning_errno(r, "Failed to set model of subsystem to '%s', ignoring: %m", truncated);
          }
-@@ -295,7 +295,7 @@ static int nvme_subsystem_write_metadata(int subsystem_fd, sd_device *device) {
+@@ -295,7 +295,7 @@ static int nvme_subsystem_write_metadata
                  if (!truncated)
                          return log_oom();
  
@@ -476,7 +436,7 @@ index ae63baaf79..82eeca479a 100644
                  if (r < 0)
                          log_warning_errno(r, "Failed to set serial of subsystem to '%s', ignoring: %m", truncated);
          }
-@@ -345,7 +345,7 @@ static int nvme_namespace_write_metadata(int namespace_fd, sd_device *device, co
+@@ -345,7 +345,7 @@ static int nvme_namespace_write_metadata
                  id = id128_digest(j, l);
          }
  
@@ -485,7 +445,7 @@ index ae63baaf79..82eeca479a 100644
          if (r < 0)
                  log_warning_errno(r, "Failed to set uuid of namespace to '%s', ignoring: %m", SD_ID128_TO_UUID_STRING(id));
  
-@@ -408,7 +408,7 @@ static int nvme_subsystem_add(const char *node, int consumed_fd, sd_device *devi
+@@ -408,7 +408,7 @@ static int nvme_subsystem_add(const char
          if (subsystem_fd < 0)
                  return log_error_errno(subsystem_fd, "Failed to create NVME subsystem '%s': %m", j);
  
@@ -494,7 +454,7 @@ index ae63baaf79..82eeca479a 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to set 'attr_allow_any_host' flag: %m");
  
-@@ -423,11 +423,11 @@ static int nvme_subsystem_add(const char *node, int consumed_fd, sd_device *devi
+@@ -423,11 +423,11 @@ static int nvme_subsystem_add(const char
  
          /* We use /proc/$PID/fd/$FD rather than /proc/self/fd/$FD, because this string is visible to others
           * via configfs, and by including the PID it's clear to who the stuff belongs. */
@@ -532,11 +492,9 @@ index ae63baaf79..82eeca479a 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to set IP address on NVME port %" PRIu16 ": %m", portnr);
  
-diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
-index febe345b4c..a90b610ba1 100644
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
-@@ -2711,7 +2711,6 @@ static int udev_rule_apply_token_to_event(
+@@ -2711,7 +2711,6 @@ static int udev_rule_apply_token_to_even
                  log_event_debug(dev, token, "ATTR '%s' writing '%s'", buf, value);
                  r = write_string_file(buf, value,
                                        WRITE_STRING_FILE_VERIFY_ON_FAILURE |
@@ -544,11 +502,9 @@ index febe345b4c..a90b610ba1 100644
                                        WRITE_STRING_FILE_AVOID_NEWLINE |
                                        WRITE_STRING_FILE_VERIFY_IGNORE_NEWLINE);
                  if (r < 0)
-diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setup.c
-index 4d82c65f0a..3a3d861b83 100644
 --- a/src/vconsole/vconsole-setup.c
 +++ b/src/vconsole/vconsole-setup.c
-@@ -261,7 +261,7 @@ static int toggle_utf8_vc(const char *name, int fd, bool utf8) {
+@@ -261,7 +261,7 @@ static int toggle_utf8_vc(const char *na
  static int toggle_utf8_sysfs(bool utf8) {
          int r;
  
@@ -557,6 +513,3 @@ index 4d82c65f0a..3a3d861b83 100644
          if (r < 0)
                  return log_warning_errno(r, "Failed to %s sysfs UTF-8 flag: %m", enable_disable(utf8));
  
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0022-avoid-missing-LOCK_EX-declaration.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0022-avoid-missing-LOCK_EX-declaration.patch
index 24f3bf74a0..56755ac559 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0022-avoid-missing-LOCK_EX-declaration.patch
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0022-avoid-missing-LOCK_EX-declaration.patch
@@ -1,7 +1,7 @@
-From fd52f1764647e03a35e8f0ed0ef952049073ccbd Mon Sep 17 00:00:00 2001
+From 97d3ed7834bd86615ba4acdbef984c677b7e7791 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 2 Jan 2024 11:03:27 +0800
-Subject: [PATCH 22/22] avoid missing LOCK_EX declaration
+Subject: [PATCH] avoid missing LOCK_EX declaration
 
 This only happens on MUSL. Include sys/file.h to avoid compilation
 error about missing LOCK_EX declaration.
@@ -14,8 +14,6 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  src/shared/dev-setup.h | 1 +
  2 files changed, 2 insertions(+)
 
-diff --git a/src/core/exec-invoke.c b/src/core/exec-invoke.c
-index 70d963e269..7084811439 100644
 --- a/src/core/exec-invoke.c
 +++ b/src/core/exec-invoke.c
 @@ -4,6 +4,7 @@
@@ -26,8 +24,6 @@ index 70d963e269..7084811439 100644
  
  #if HAVE_PAM
  #include <security/pam_appl.h>
-diff --git a/src/shared/dev-setup.h b/src/shared/dev-setup.h
-index 5339bc4e5e..0697495f23 100644
 --- a/src/shared/dev-setup.h
 +++ b/src/shared/dev-setup.h
 @@ -2,6 +2,7 @@
@@ -38,6 +34,3 @@ index 5339bc4e5e..0697495f23 100644
  
  int lock_dev_console(void);
  
--- 
-2.34.1
-

