Return-Path: <stefan@agner.ch>
X-Greylist: delayed 560 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 06 Aug 2019 13:26:24 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 6212C7F309
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Aug 2019 13:26:24 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 88FBA5C0CCA;
	Tue,  6 Aug 2019 15:17:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1565097424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=w16McQgg7T0jUYD8dudb1nIzwsqHad8f+IMN4jFpItM=;
	b=VduYnpr+0Lbrg3fqew6Vd8rt/0RQebCA+XizqiYdKWmI3ZMU2W69ElMBPvUxOeymcMTd1k
	qW9eZSK3kzmq9+nrMXvQ++FaOBcrmKCXIi9/fzSdx/lomzl7C20JxvOr6J+WImZdk4wjPC
	D5FrGoniKpQdOnMcA6FnLWSAMjFI94Q=
MIME-Version: 1.0
Date: Tue, 06 Aug 2019 15:17:03 +0200
From: Stefan Agner <stefan@agner.ch>
To: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <5D3ABBD8.2050107@windriver.com>
References: <1564038304-372775-1-git-send-email-mingli.yu@windriver.com>
	<CADkTA4NafYpQLV2VgTgb4BajL=-KH1gQLU2_rk3ur7b3aqOjSA@mail.gmail.com>
	<CAMKF1sqi9aRud1UQQCFsOakEQ1qKbfRhBSKFeEbwPxQChh45_A@mail.gmail.com>
	<5D3ABBD8.2050107@windriver.com>
Message-ID: <0263423f4903ea25247352460c6a906b@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
Cc: liu.ming50@gmail.com,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems][PATCH] ostree: import from meta-overc
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
X-List-Received-Date: Tue, 06 Aug 2019 13:26:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2019-07-26 10:37, Yu, Mingli wrote:
> On 2019年07月25日 21:58, Khem Raj wrote:
>> On Thu, Jul 25, 2019 at 6:42 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>>>
>>> On Thu, Jul 25, 2019 at 3:05 AM <mingli.yu@windriver.com> wrote:
>>>>
>>>> From: Mingli Yu <Mingli.Yu@windriver.com>
>>>
>>> This doesn't make any sense to "import from meta-overc". meta-overc,
>>> was never the authoritative upstream for ostree. That layer has to
>>> carry a specific version to meet the requirements of some of the
>>> container libraries, etc, that it requires.
>>>
>>> You need to have a look at the latest ostree, the various layers that
>>> are currently maintaining it, and pick the right version if you want
>>> to consolidate things here. I'm very doubtful that the right choice is
>>> the one from meta-overc.
>>
>> Yes agreed and this version fails on musl e.g.
> 
> Make sense, please ignore this patch.

What layers are you considering?

We use OSTree integration of meta-updater and would welcome having a
common upstream implementation which works for everyone:

https://github.com/advancedtelematic/meta-updater


--
Stefan

> 
> Thanks,
> 
>>
>> ./libglnx/glnx-dirfd.h:108:7: error: implicit declaration of function
>> 'TEMP_FAILURE_RETRY' is invalid in C99
>> [-Werror,-Wimplicit-function-declaration]
>> if (TEMP_FAILURE_RETRY (mkdirat (dfd, path, mode)) != 0)
>> ^
>> ./libglnx/glnx-dirfd.h:108:7: error: this function declaration is not
>> a prototype [-Werror,-Wstrict-prototypes]
>>
>>
>>>
>>> Cheers,
>>>
>>> Bruce
>>>
>>>>
>>>> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
>>>> ---
>>>>   ...llow-updating-files-in-the-boot-directory.patch | 230 +++++++++++++++
>>>>   ...reate-boot-symlink-based-on-relative-path.patch |  27 ++
>>>>   ...ploy-using-etc-in-runtime-as-merge-source.patch |  41 +++
>>>>   ...decrypt-password-of-remote-repository-uri.patch | 313 +++++++++++++++++++++
>>>>   ...the-issue-of-cannot-get-the-config-entrie.patch |  30 ++
>>>>   ...only-deal-with-boot-efi-EFI-BOOT-grub.cfg.patch |  26 ++
>>>>   ...re-boot-support-for-no-change-to-grub.cfg.patch |  96 +++++++
>>>>   ...1-retrieve-correct-boot-prefix-at-runtime.patch |  26 ++
>>>>   ...gex-of-ostree-system-generator-for-pulsar.patch |  52 ++++
>>>>   ...oot-add-bootdir-to-the-generated-uEnv.txt.patch |  53 ++++
>>>>   ...-add-non-default-for-bootdirs-to-uEnv.txt.patch |  28 ++
>>>>   .../ostree/ostree_swap_bootentry_atomically.patch  |  71 +++++
>>>>   .../recipes-support/ostree/ostree/sample.conf      |  11 +
>>>>   .../recipes-support/ostree/ostree/system-export.sh |  39 +++
>>>>   .../recipes-support/ostree/ostree/test.patch       |  16 ++
>>>>   .../recipes-support/ostree/ostree/tmp_fix.patch    |  18 ++
>>>>   .../ostree/ostree/using-bash-specifically.patch    |  12 +
>>>>   .../recipes-support/ostree/ostree_git.bb           | 124 ++++++++
>>>>   18 files changed, 1213 insertions(+)
>>>>   create mode 100644 meta-filesystems/recipes-support/ostree/ostree/0001-Allow-updating-files-in-the-boot-directory.patch
>>>>   create mode 100644 meta-filesystems/recipes-support/ostree/ostree/0001-create-boot-symlink-based-on-relative-path.patch
>>>>   create mode 100644 meta-filesystems/recipes-support/ostree/ostree/0001-deploy-using-etc-in-runtime-as-merge-source.patch
>>>>   create mode 100644 meta-filesystems/recipes-support/ostree/ostree/0001-encrypt-decrypt-password-of-remote-repository-uri.patch
>>>>   create mode 100755 meta-filesystems/recipes-support/ostree/ostree/0001-ostree-fix-the-issue-of-cannot-get-the-config-entrie.patch
>>>>   create mode 100755 meta-filesystems/recipes-support/ostree/ostree/0001-ostree-only-deal-with-boot-efi-EFI-BOOT-grub.cfg.patch
>>>>   create mode 100644 meta-filesystems/recipes-support/ostree/ostree/0001-ostree-secure-boot-support-for-no-change-to-grub.cfg.patch
>>>>   create mode 100644 meta-filesystems/recipes-support/ostree/ostree/0001-retrieve-correct-boot-prefix-at-runtime.patch
>>>>   create mode 100644 meta-filesystems/recipes-support/ostree/ostree/0001-tweak-regex-of-ostree-system-generator-for-pulsar.patch
>>>>   create mode 100644 meta-filesystems/recipes-support/ostree/ostree/0002-u-boot-add-bootdir-to-the-generated-uEnv.txt.patch
>>>>   create mode 100644 meta-filesystems/recipes-support/ostree/ostree/0003-uboot-add-non-default-for-bootdirs-to-uEnv.txt.patch
>>>>   create mode 100644 meta-filesystems/recipes-support/ostree/ostree/ostree_swap_bootentry_atomically.patch
>>>>   create mode 100644 meta-filesystems/recipes-support/ostree/ostree/sample.conf
>>>>   create mode 100755 meta-filesystems/recipes-support/ostree/ostree/system-export.sh
>>>>   create mode 100644 meta-filesystems/recipes-support/ostree/ostree/test.patch
>>>>   create mode 100644 meta-filesystems/recipes-support/ostree/ostree/tmp_fix.patch
>>>>   create mode 100644 meta-filesystems/recipes-support/ostree/ostree/using-bash-specifically.patch
>>>>   create mode 100755 meta-filesystems/recipes-support/ostree/ostree_git.bb
>>>>
>>>> diff --git a/meta-filesystems/recipes-support/ostree/ostree/0001-Allow-updating-files-in-the-boot-directory.patch b/meta-filesystems/recipes-support/ostree/ostree/0001-Allow-updating-files-in-the-boot-directory.patch
>>>> new file mode 100644
>>>> index 0000000..006366c
>>>> --- /dev/null
>>>> +++ b/meta-filesystems/recipes-support/ostree/ostree/0001-Allow-updating-files-in-the-boot-directory.patch
>>>> @@ -0,0 +1,230 @@
>>>> +From f4ffbffaebcd4dd2a4749fdd1c7139a04ac23189 Mon Sep 17 00:00:00 2001
>>>> +From: Gatis Paeglis <gatis.paeglis@qt.io>
>>>> +Date: Mon, 22 Aug 2016 11:32:16 +0200
>>>> +Subject: [PATCH 1/2] Allow updating files in the /boot directory
>>>> +
>>>> +This patch adds support for copying (or hardlinking on
>>>> +single partition systems) all files from the deployment's
>>>> +/usr/lib/ostree-boot directory to the relevant
>>>> +/boot/ostree/$os-$bootcsum/ directory. This feature can
>>>> +be enabled by 'touch .ostree-bootcsumdir-source' in
>>>> +/usr/lib/ostree-boot.
>>>> +---
>>>> + src/libostree/ostree-sysroot-deploy.c |  132 ++++++++++++++++++++++++++++++++--
>>>> + tests/test-bootdir-update.sh          |   37 +++++++++
>>>> + 2 files changed, 162 insertions(+), 7 deletions(-)
>>>> + create mode 100755 tests/test-bootdir-update.sh
>>>> +
>>>> +--- a/src/libostree/ostree-sysroot-deploy.c
>>>> ++++ b/src/libostree/ostree-sysroot-deploy.c
>>>> +@@ -175,6 +175,43 @@ dirfd_copy_attributes_and_xattrs (int
>>>> +   return TRUE;
>>>> + }
>>>> +
>>>> ++hardlink_or_copy_at (int         src_dfd,
>>>> ++                     const char *src_subpath,
>>>> ++                     int         dest_dfd,
>>>> ++                     const char *dest_subpath,
>>>> ++                     OstreeSysrootDebugFlags flags,
>>>> ++                     GCancellable  *cancellable,
>>>> ++                     GError       **error);
>>>> ++hardlink_or_copy_at (int         src_dfd,
>>>> ++                     const char *src_subpath,
>>>> ++                     int         dest_dfd,
>>>> ++                     const char *dest_subpath,
>>>> ++                     OstreeSysrootDebugFlags flags,
>>>> ++                     GCancellable  *cancellable,
>>>> ++                     GError       **error)
>>>> ++{
>>>> ++  if (linkat (src_dfd, src_subpath, dest_dfd, dest_subpath, 0) != 0)
>>>> ++    {
>>>> ++      if (G_IN_SET (errno, EMLINK, EXDEV))
>>>> ++        return glnx_file_copy_at (src_dfd, src_subpath, NULL, dest_dfd, dest_subpath,
>>>> ++                                  sysroot_flags_to_copy_flags (0, flags),
>>>> ++                                  cancellable, error);
>>>> ++      else
>>>> ++        return glnx_throw_errno_prefix (error, "linkat(%s)", dest_subpath);
>>>> ++    }
>>>> ++
>>>> ++  return TRUE;
>>>> ++}
>>>> ++
>>>> ++static gboolean
>>>> ++hardlink_or_copy_dir_recurse (int  src_parent_dfd,
>>>> ++                  int              dest_parent_dfd,
>>>> ++                  const char      *name,
>>>> ++                  gboolean         hardlink,
>>>> ++                  OstreeSysrootDebugFlags flags,
>>>> ++                  GCancellable    *cancellable,
>>>> ++                  GError         **error);
>>>> ++
>>>> + static gboolean
>>>> + copy_dir_recurse (int              src_parent_dfd,
>>>> +                   int              dest_parent_dfd,
>>>> +@@ -183,6 +220,18 @@ copy_dir_recurse (int              src_p
>>>> +                   GCancellable    *cancellable,
>>>> +                   GError         **error)
>>>> + {
>>>> ++    return hardlink_or_copy_dir_recurse (src_parent_dfd, dest_parent_dfd, name, FALSE, flags, cancellable, error);
>>>> ++}
>>>> ++
>>>> ++static gboolean
>>>> ++hardlink_or_copy_dir_recurse (int  src_parent_dfd,
>>>> ++                  int              dest_parent_dfd,
>>>> ++                  const char      *name,
>>>> ++                  gboolean         hardlink,
>>>> ++                  OstreeSysrootDebugFlags flags,
>>>> ++                  GCancellable    *cancellable,
>>>> ++                  GError         **error)
>>>> ++{
>>>> +   g_auto(GLnxDirFdIterator) src_dfd_iter = { 0, };
>>>> +   glnx_autofd int dest_dfd = -1;
>>>> +   struct dirent *dent;
>>>> +@@ -216,17 +265,28 @@ copy_dir_recurse (int              src_p
>>>> +
>>>> +       if (S_ISDIR (child_stbuf.st_mode))
>>>> +         {
>>>> +-          if (!copy_dir_recurse (src_dfd_iter.fd, dest_dfd, dent->d_name,
>>>> +-                                 flags, cancellable, error))
>>>> ++          if (!hardlink_or_copy_dir_recurse (src_dfd_iter.fd, dest_dfd, dent->d_name,
>>>> ++                                 hardlink, flags, cancellable, error))
>>>> +             return FALSE;
>>>> +         }
>>>> +       else
>>>> +         {
>>>> +-          if (!glnx_file_copy_at (src_dfd_iter.fd, dent->d_name, &child_stbuf,
>>>> +-                                  dest_dfd, dent->d_name,
>>>> +-                                  sysroot_flags_to_copy_flags (GLNX_FILE_COPY_OVERWRITE, flags),
>>>> +-                                  cancellable, error))
>>>> +-            return FALSE;
>>>> ++          if (hardlink)
>>>> ++          {
>>>> ++              if (!hardlink_or_copy_at (src_dfd_iter.fd, dent->d_name,
>>>> ++                                        dest_dfd, dent->d_name,
>>>> ++                                        sysroot_flags_to_copy_flags (GLNX_FILE_COPY_OVERWRITE, flags),
>>>> ++                                        cancellable, error))
>>>> ++                return FALSE;
>>>> ++          }
>>>> ++          else
>>>> ++          {
>>>> ++              if (!glnx_file_copy_at (src_dfd_iter.fd, dent->d_name, &child_stbuf,
>>>> ++                                      dest_dfd, dent->d_name,
>>>> ++                                      sysroot_flags_to_copy_flags (GLNX_FILE_COPY_OVERWRITE, flags),
>>>> ++                                      cancellable, error))
>>>> ++              return FALSE;
>>>> ++           }
>>>> +         }
>>>> +     }
>>>> +
>>>> +@@ -1601,6 +1661,7 @@ install_deployment_kernel (OstreeSysroot
>>>> +
>>>> + {
>>>> +   GLNX_AUTO_PREFIX_ERROR ("Installing kernel", error);
>>>> ++  g_auto(GLnxDirFdIterator) dfd_iter = { 0, };
>>>> +   OstreeBootconfigParser *bootconfig = ostree_deployment_get_bootconfig (deployment);
>>>> +   g_autofree char *deployment_dirpath = ostree_sysroot_get_deployment_dirpath (sysroot, deployment);
>>>> +   glnx_autofd int deployment_dfd = -1;
>>>> +@@ -1689,6 +1750,63 @@ install_deployment_kernel (OstreeSysroot
>>>> +         }
>>>> +     }
>>>> +
>>>> ++    if (fstatat (kernel_layout->boot_dfd, ".ostree-bootcsumdir-source", &stbuf, 0) == 0)
>>>> ++    {
>>>> ++      if (!glnx_dirfd_iterator_init_at (kernel_layout->boot_dfd, ".", FALSE, &dfd_iter, error))
>>>> ++        return FALSE;
>>>> ++
>>>> ++      while (TRUE)
>>>> ++        {
>>>> ++          struct dirent *dent;
>>>> ++
>>>> ++          if (!glnx_dirfd_iterator_next_dent (&dfd_iter, &dent, cancellable, error))
>>>> ++            return FALSE;
>>>> ++          if (dent == NULL)
>>>> ++            break;
>>>> ++
>>>> ++          /* Skip special files - vmlinuz-* and initramfs-* are handled separately */
>>>> ++          if (g_str_has_prefix (dent->d_name, "vmlinuz-") || g_str_has_prefix (dent->d_name, "initramfs-"))
>>>> ++            continue;
>>>> ++
>>>> ++          if (fstatat (bootcsum_dfd, dent->d_name, &stbuf, AT_SYMLINK_NOFOLLOW) != 0)
>>>> ++            {
>>>> ++              if (errno != ENOENT)
>>>> ++                {
>>>> ++                  glnx_set_prefix_error_from_errno (error, "fstatat %s", dent->d_name);
>>>> ++                  return FALSE;
>>>> ++                }
>>>> ++
>>>> ++              if (fstatat (dfd_iter.fd, dent->d_name, &stbuf, AT_SYMLINK_NOFOLLOW) != 0)
>>>> ++                {
>>>> ++                  glnx_set_error_from_errno (error);
>>>> ++                  return FALSE;
>>>> ++                }
>>>> ++
>>>> ++              if (S_ISDIR (stbuf.st_mode))
>>>> ++                {
>>>> ++                  if (!hardlink_or_copy_dir_recurse (kernel_layout->boot_dfd, bootcsum_dfd, dent->d_name,
>>>> ++                                                     TRUE, sysroot->debug_flags, cancellable, error))
>>>> ++                    return FALSE;
>>>> ++                }
>>>> ++              else
>>>> ++                {
>>>> ++                  if (!hardlink_or_copy_at (kernel_layout->boot_dfd, dent->d_name,
>>>> ++                                            bootcsum_dfd, dent->d_name, sysroot->debug_flags,
>>>> ++                                            cancellable, error))
>>>> ++                    return FALSE;
>>>> ++                }
>>>> ++            }
>>>> ++        }
>>>> ++    }
>>>> ++    else
>>>> ++    {
>>>> ++      if (errno != ENOENT)
>>>> ++        {
>>>> ++          glnx_set_prefix_error_from_errno (error, "fstatat %s", ".ostree-bootcsumdir-source");
>>>> ++          return FALSE;
>>>> ++        }
>>>> ++    }
>>>> ++
>>>> +   g_autofree char *contents = NULL;
>>>> +   if (!glnx_fstatat_allow_noent (deployment_dfd, "usr/lib/os-release", &stbuf, 0, error))
>>>> +     return FALSE;
>>>> +--- /dev/null
>>>> ++++ b/tests/test-bootdir-update.sh
>>>> +@@ -0,0 +1,37 @@
>>>> ++#!/bin/bash
>>>> ++
>>>> ++set -euo pipefail
>>>> ++
>>>> ++. $(dirname $0)/libtest.sh
>>>> ++
>>>> ++echo "1..2"
>>>> ++
>>>> ++setup_os_repository "archive-z2" "uboot"
>>>> ++
>>>> ++cd ${test_tmpdir}
>>>> ++
>>>> ++ln -s ../../boot/ osdata/usr/lib/ostree-boot
>>>> ++echo "1" > osdata/boot/1
>>>> ++mkdir -p osdata/boot/subdir
>>>> ++ln -s ../1 osdata/boot/subdir/2
>>>> ++
>>>> ++${CMD_PREFIX} ostree --repo=testos-repo commit --tree=dir=osdata/ -b testos/buildmaster/x86_64-runtime
>>>> ++${CMD_PREFIX} ostree --repo=sysroot/ostree/repo remote add --set=gpg-verify=false testos $(cat httpd-address)/ostree/testos-repo
>>>> ++${CMD_PREFIX} ostree --repo=sysroot/ostree/repo pull testos testos/buildmaster/x86_64-runtime
>>>> ++${CMD_PREFIX} ostree admin deploy --karg=root=LABEL=MOO --os=testos testos:testos/buildmaster/x86_64-runtime
>>>> ++
>>>> ++assert_has_file sysroot/boot/ostree/testos-${bootcsum}/vmlinuz-3.6.0
>>>> ++assert_not_has_file sysroot/boot/ostree/testos-${bootcsum}/1
>>>> ++
>>>> ++echo "ok boot dir without .ostree-bootcsumdir-source"
>>>> ++
>>>> ++touch osdata/boot/.ostree-bootcsumdir-source
>>>> ++${CMD_PREFIX} ostree --repo=testos-repo commit --tree=dir=osdata/ -b testos/buildmaster/x86_64-runtime
>>>> ++${CMD_PREFIX} ostree admin upgrade --os=testos
>>>> ++
>>>> ++assert_has_file sysroot/boot/ostree/testos-${bootcsum}/vmlinuz-3.6.0
>>>> ++assert_has_file sysroot/boot/ostree/testos-${bootcsum}/1
>>>> ++assert_has_file sysroot/boot/ostree/testos-${bootcsum}/subdir/2
>>>> ++assert_file_has_content sysroot/boot/ostree/testos-${bootcsum}/subdir/2 "1"
>>>> ++
>>>> ++echo "ok boot dir with .ostree-bootcsumdir-source"
>>>> diff --git a/meta-filesystems/recipes-support/ostree/ostree/0001-create-boot-symlink-based-on-relative-path.patch b/meta-filesystems/recipes-support/ostree/ostree/0001-create-boot-symlink-based-on-relative-path.patch
>>>> new file mode 100644
>>>> index 0000000..39ac072
>>>> --- /dev/null
>>>> +++ b/meta-filesystems/recipes-support/ostree/ostree/0001-create-boot-symlink-based-on-relative-path.patch
>>>> @@ -0,0 +1,27 @@
>>>> +From 454bc12500a6ddad9f5ade56dd1eaff3aeb8289a Mon Sep 17 00:00:00 2001
>>>> +From: Yunguo Wei <yunguo.wei@windriver.com>
>>>> +Date: Sat, 5 May 2018 17:49:06 +0800
>>>> +Subject: [PATCH] create boot symlink based on relative path
>>>> +
>>>> +If /boot is a seperated boot partition, grub will set root device to
>>>> +boot partition and an abs path doesn't make senese.
>>>> +
>>>> +Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
>>>> +---
>>>> + src/boot/grub2/ostree-grub-generator |    4 ++--
>>>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>>>> +
>>>> +--- a/src/boot/grub2/ostree-grub-generator
>>>> ++++ b/src/boot/grub2/ostree-grub-generator
>>>> +@@ -92,9 +92,9 @@ populate_menu()
>>>> +         fi
>>>> +         menu="${menu}}\n\n"
>>>> +
>>>> +-        linux_dir=`dirname ${boot_prefix}${linux}`
>>>> ++        linux_dir=`dirname ${linux}`
>>>> +         boots[$count]=`mktemp -d ${sysroot_dir}${boot_prefix}/boot.XXXXXXXXXX`
>>>> +-        ln -sf ${linux_dir} ${boots[$count]}/boot
>>>> ++        ln -sf ..${linux_dir} ${boots[$count]}/boot
>>>> +         ln -sf ../..${ostree} ${boots[$count]}/ostree
>>>> +         count=`expr $count + 1`
>>>> +     done
>>>> diff --git a/meta-filesystems/recipes-support/ostree/ostree/0001-deploy-using-etc-in-runtime-as-merge-source.patch b/meta-filesystems/recipes-support/ostree/ostree/0001-deploy-using-etc-in-runtime-as-merge-source.patch
>>>> new file mode 100644
>>>> index 0000000..4b6688e
>>>> --- /dev/null
>>>> +++ b/meta-filesystems/recipes-support/ostree/ostree/0001-deploy-using-etc-in-runtime-as-merge-source.patch
>>>> @@ -0,0 +1,41 @@
>>>> +From f44f55e3c05aaa3d376375b7297a3e45c964d4e6 Mon Sep 17 00:00:00 2001
>>>> +From: Jiang Lu <lu.jiang@windriver.com>
>>>> +Date: Thu, 28 Jun 2018 16:29:45 +0800
>>>> +Subject: [PATCH] deploy:using /etc in runtime as merge source
>>>> +
>>>> +When deploy new ostree image, using /etc in runtime image as source for merge
>>>> +operation, instead of /etc in previouse image.
>>>> +
>>>> +For when upgrading a repo, user expected configuration in running system come
>>>> +into new ostree image.
>>>> +
>>>> +Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
>>>> +---
>>>> + src/libostree/ostree-sysroot-deploy.c | 4 ++--
>>>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>>>> +
>>>> +diff --git a/src/libostree/ostree-sysroot-deploy.c b/src/libostree/ostree-sysroot-deploy.c
>>>> +index 5f5b1c1c..eb3351a3 100644
>>>> +--- a/src/libostree/ostree-sysroot-deploy.c
>>>> ++++ b/src/libostree/ostree-sysroot-deploy.c
>>>> +@@ -443,7 +443,7 @@ merge_configuration_from (OstreeSysroot    *sysroot,
>>>> +
>>>> +   /* TODO: get rid of GFile usage here */
>>>> +   g_autoptr(GFile) orig_etc = ot_fdrel_to_gfile (merge_deployment_dfd, "usr/etc");
>>>> +-  g_autoptr(GFile) modified_etc = ot_fdrel_to_gfile (merge_deployment_dfd, "etc");
>>>> ++  g_autoptr(GFile) modified_etc = g_file_new_for_path("/etc");
>>>> +   /* Return values for below */
>>>> +   g_autoptr(GPtrArray) modified = g_ptr_array_new_with_free_func ((GDestroyNotify) ostree_diff_item_unref);
>>>> +   g_autoptr(GPtrArray) removed = g_ptr_array_new_with_free_func ((GDestroyNotify) g_object_unref);
>>>> +@@ -479,7 +479,7 @@ merge_configuration_from (OstreeSysroot    *sysroot,
>>>> +   if (!glnx_opendirat (merge_deployment_dfd, "usr/etc", TRUE, &orig_etc_fd, error))
>>>> +     return FALSE;
>>>> +   glnx_autofd int modified_etc_fd = -1;
>>>> +-  if (!glnx_opendirat (merge_deployment_dfd, "etc", TRUE, &modified_etc_fd, error))
>>>> ++  if (!glnx_opendirat (-1, "/etc", TRUE, &modified_etc_fd, error))
>>>> +     return FALSE;
>>>> +   glnx_autofd int new_etc_fd = -1;
>>>> +   if (!glnx_opendirat (new_deployment_dfd, "etc", TRUE, &new_etc_fd, error))
>>>> +--
>>>> +2.14.3
>>>> +
>>>> diff --git a/meta-filesystems/recipes-support/ostree/ostree/0001-encrypt-decrypt-password-of-remote-repository-uri.patch b/meta-filesystems/recipes-support/ostree/ostree/0001-encrypt-decrypt-password-of-remote-repository-uri.patch
>>>> new file mode 100644
>>>> index 0000000..f45fb00
>>>> --- /dev/null
>>>> +++ b/meta-filesystems/recipes-support/ostree/ostree/0001-encrypt-decrypt-password-of-remote-repository-uri.patch
>>>> @@ -0,0 +1,313 @@
>>>> +From c6ef852ca138075bf80ccb28e37c820ee20bb0b3 Mon Sep 17 00:00:00 2001
>>>> +From: Hongxu Jia <hongxu.jia@windriver.com>
>>>> +Date: Thu, 7 Jun 2018 14:35:27 +0800
>>>> +Subject: [PATCH] encrypt/decrypt password of remote repository uri
>>>> +
>>>> +Test:
>>>> +ostree remote add pulsar-linux http://user1:123456@128.224.156.107/pulsar-linux/intel-corei7-64 --repo /tmp/hjia/ostree_repo
>>>> +ostree remote --repo=/tmp/hjia/ostree_repo/  show-url pulsar-linux
>>>> +ostree pull --repo=/tmp/hjia/ostree_repo/ pulsar-linux:cube-gw-ostree-runtime
>>>> +
>>>> +Decrypt:
>>>> +echo U2FsdGVkX1/VbvOE5EWkbuq/9h06pKX1OjXNx117CPw= | openssl enc -d -aes-256-cbc -md md5 -base64 -salt -pass pass:incendia 2>/dev/null
>>>> +
>>>> +http://user1:123456@128.224.156.107/pulsar-linux/intel-corei7-64
>>>> +
>>>> +Encrypt:
>>>> +$ echo 123456 | openssl enc -e -aes-256-cbc -md md5 -base64 -salt -pass pass:incendia
>>>> +
>>>> +http://user1:U2FsdGVkX1%2FVbvOE5EWkbuq%2F9h06pKX1OjXNx117CPw%3D@128.224.156.107/pulsar-linux/intel-corei7-64
>>>> +
>>>> +Upstream-Status: Pending
>>>> +
>>>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>>> +---
>>>> + src/libostree/libostree-released.sym    |   1 +
>>>> + src/libostree/ostree-repo-pull.c        |   8 +-
>>>> + src/libostree/ostree-repo.c             | 149 +++++++++++++++++++++++++++++++-
>>>> + src/libostree/ostree-repo.h             |   8 ++
>>>> + src/ostree/ot-remote-builtin-list.c     |   2 +-
>>>> + src/ostree/ot-remote-builtin-show-url.c |   2 +-
>>>> + 6 files changed, 162 insertions(+), 8 deletions(-)
>>>> +
>>>> +diff --git a/src/libostree/libostree-released.sym b/src/libostree/libostree-released.sym
>>>> +index b7d5785..58d5ab4 100644
>>>> +--- a/src/libostree/libostree-released.sym
>>>> ++++ b/src/libostree/libostree-released.sym
>>>> +@@ -215,6 +215,7 @@ global:
>>>> +         ostree_repo_remote_get_gpg_verify;
>>>> +         ostree_repo_remote_get_gpg_verify_summary;
>>>> +         ostree_repo_remote_get_url;
>>>> ++        ostree_repo_remote_get_url_internal;
>>>> +         ostree_repo_remote_gpg_import;
>>>> +         ostree_repo_remote_list;
>>>> +         ostree_repo_remote_list_refs;
>>>> +diff --git a/src/libostree/ostree-repo-pull.c b/src/libostree/ostree-repo-pull.c
>>>> +index 2e6e308..da2abe1 100644
>>>> +--- a/src/libostree/ostree-repo-pull.c
>>>> ++++ b/src/libostree/ostree-repo-pull.c
>>>> +@@ -2981,7 +2981,7 @@ repo_remote_fetch_summary (OstreeRepo    *self,
>>>> +       url_string = g_strdup (metalink_url_string);
>>>> +     else if (url_override)
>>>> +       url_string = g_strdup (url_override);
>>>> +-    else if (!ostree_repo_remote_get_url (self, name, &url_string, error))
>>>> ++    else if (!ostree_repo_remote_get_url_internal (self, name, &url_string, TRUE, error))
>>>> +       goto out;
>>>> +
>>>> +     if (metalink_url_string == NULL &&
>>>> +@@ -3525,7 +3525,7 @@ ostree_repo_pull_with_options (OstreeRepo             *self,
>>>> +
>>>> +       if (url_override != NULL)
>>>> +         baseurl = g_strdup (url_override);
>>>> +-      else if (!ostree_repo_remote_get_url (self, remote_name_or_baseurl, &baseurl, error))
>>>> ++      else if (!ostree_repo_remote_get_url_internal (self, remote_name_or_baseurl, &baseurl, TRUE, error))
>>>> +         goto out;
>>>> +
>>>> +       if (g_str_has_prefix (baseurl, "mirrorlist="))
>>>> +@@ -5096,8 +5096,8 @@ find_remotes_cb (GObject      *obj,
>>>> +               g_autofree gchar *uri = NULL;
>>>> +               g_autoptr(OstreeFetcherURI) fetcher_uri = NULL;
>>>> +
>>>> +-              if (!ostree_repo_remote_get_url (self, result->remote->name,
>>>> +-                                               &uri, &error))
>>>> ++              if (!ostree_repo_remote_get_url_internal (self, result->remote->name,
>>>> ++                                               &uri, TRUE, &error))
>>>> +                 goto error;
>>>> +
>>>> +               fetcher_uri = _ostree_fetcher_uri_parse (uri, &error);
>>>> +diff --git a/src/libostree/ostree-repo.c b/src/libostree/ostree-repo.c
>>>> +index 61bf162..2351970 100644
>>>> +--- a/src/libostree/ostree-repo.c
>>>> ++++ b/src/libostree/ostree-repo.c
>>>> +@@ -41,6 +41,13 @@
>>>> + #include "ot-fs-utils.h"
>>>> + #include "ostree-autocleanups.h"
>>>> +
>>>> ++#include <libsoup/soup.h>
>>>> ++#include <libsoup/soup-requester.h>
>>>> ++#include <libsoup/soup-request-http.h>
>>>> ++
>>>> ++#include <stdlib.h>
>>>> ++#include <string.h>
>>>> ++
>>>> + #include <locale.h>
>>>> + #include <glib/gstdio.h>
>>>> + #include <sys/file.h>
>>>> +@@ -213,6 +220,115 @@ typedef struct {
>>>> +   const char *name;
>>>> + } OstreeRepoLockInfo;
>>>> +
>>>> ++static int invoke_program(const char*cmd, char *out, int out_len)
>>>> ++{
>>>> ++    FILE *fp;
>>>> ++
>>>> ++#ifdef DEBUG
>>>> ++    printf("CMD: %s\n", cmd);
>>>> ++#endif
>>>> ++    if ((fp = popen(cmd, "r")) == NULL)
>>>> ++    {
>>>> ++        printf("Error opening pipe!\n");
>>>> ++        return -1;
>>>> ++    }
>>>> ++
>>>> ++    while (fgets(out, out_len, fp) != NULL)
>>>> ++    {
>>>> ++#ifdef DEBUG
>>>> ++        printf("OUTPUT: %s", out);
>>>> ++#endif
>>>> ++
>>>> ++        // Strip newline
>>>> ++        char *pos;
>>>> ++        if ((pos=strchr(out, '\n')) != NULL)
>>>> ++           *pos = '\0';
>>>> ++    }
>>>> ++
>>>> ++    if(pclose(fp))
>>>> ++    {
>>>> ++#ifdef DEBUG
>>>> ++        printf("Command not found or exited with error status\n");
>>>> ++#endif
>>>> ++        return -1;
>>>> ++    }
>>>> ++
>>>> ++    return 0;
>>>> ++}
>>>> ++
>>>> ++
>>>> ++
>>>> ++static gboolean
>>>> ++ostree_encrypt_url (const char  *url,
>>>> ++                    char       **out_url)
>>>> ++{
>>>> ++
>>>> ++  SoupURI *uri;
>>>> ++
>>>> ++  if (out_url != NULL)
>>>> ++  {
>>>> ++    uri = soup_uri_new (url);
>>>> ++
>>>> ++    if (uri->password != NULL)
>>>> ++    {
>>>> ++        char cmd[1024];
>>>> ++        char out[1024];
>>>> ++        sprintf(cmd, "echo %s | openssl enc -e -aes-256-cbc -md md5 -base64 -salt -pass pass:%s",
>>>> ++                     uri->password, "incendia");
>>>> ++        invoke_program(cmd, out, sizeof(out));
>>>> ++        g_free (uri->password);
>>>> ++        uri->password = g_strdup (out);
>>>> ++    }
>>>> ++
>>>> ++    *out_url = soup_uri_to_string_with_password (uri, FALSE);
>>>> ++#ifdef DEBUG
>>>> ++    printf("%s %d, user %s, uri %s\n", __FUNCTION__, __LINE__, uri->user, *out_url);
>>>> ++#endif
>>>> ++    soup_uri_free (uri);
>>>> ++  }
>>>> ++
>>>> ++  return TRUE;
>>>> ++}
>>>> ++
>>>> ++static gboolean
>>>> ++ostree_decrypt_url (const char  *url,
>>>> ++                    char       **out_url,
>>>> ++                    gboolean   show_password)
>>>> ++{
>>>> ++  SoupURI *uri;
>>>> ++
>>>> ++  if (out_url != NULL)
>>>> ++  {
>>>> ++    uri = soup_uri_new (url);
>>>> ++
>>>> ++    if (uri->password != NULL)
>>>> ++    {
>>>> ++        char cmd[1024];
>>>> ++        char out[1024];
>>>> ++        sprintf(cmd, "echo %s | openssl enc -d -aes-256-cbc -md md5 -base64 -salt -pass pass:%s 2>/dev/null",
>>>> ++                      uri->password, "incendia");
>>>> ++        if (!invoke_program(cmd, out, sizeof(out)))
>>>> ++        {
>>>> ++            g_free (uri->password);
>>>> ++            uri->password = g_strdup (out);
>>>> ++        }
>>>> ++    }
>>>> ++
>>>> ++    if (show_password == TRUE)
>>>> ++        *out_url = soup_uri_to_string_with_password (uri, FALSE);
>>>> ++    else
>>>> ++        *out_url = soup_uri_to_string (uri, FALSE);
>>>> ++#ifdef DEBUG
>>>> ++    printf("%s %d, user %s, uri %s\n", __FUNCTION__, __LINE__, uri->user, *out_url);
>>>> ++#endif
>>>> ++    soup_uri_free (uri);
>>>> ++  }
>>>> ++
>>>> ++
>>>> ++  return TRUE;
>>>> ++}
>>>> ++
>>>> ++
>>>> + static void
>>>> + repo_lock_info (OstreeRepoLock *lock, OstreeRepoLockInfo *out_info)
>>>> + {
>>>> +@@ -1598,7 +1714,13 @@ impl_repo_remote_add (OstreeRepo     *self,
>>>> +   if (g_str_has_prefix (url, "metalink="))
>>>> +     g_key_file_set_string (remote->options, remote->group, "metalink", url + strlen ("metalink="));
>>>> +   else
>>>> +-    g_key_file_set_string (remote->options, remote->group, "url", url);
>>>> ++  {
>>>> ++
>>>> ++    char *encrypt_url;
>>>> ++    ostree_encrypt_url(url, &encrypt_url);
>>>> ++    g_key_file_set_string (remote->options, remote->group, "url", encrypt_url);
>>>> ++    g_free (encrypt_url);
>>>> ++  }
>>>> +
>>>> +   if (options)
>>>> +     keyfile_set_from_vardict (remote->options, remote->group, options);
>>>> +@@ -1869,6 +1991,28 @@ ostree_repo_remote_get_url (OstreeRepo  *self,
>>>> +                             char       **out_url,
>>>> +                             GError     **error)
>>>> + {
>>>> ++  return ostree_repo_remote_get_url_internal(self, name, out_url, FALSE, error);
>>>> ++}
>>>> ++
>>>> ++/**
>>>> ++ * ostree_repo_remote_get_url_internal:
>>>> ++ * @self: Repo
>>>> ++ * @name: Name of remote
>>>> ++ * @out_url: (out) (allow-none): Remote's URL
>>>> ++ * @error: Error
>>>> ++ *
>>>> ++ * Return the URL of the remote named @name through @out_url.  It is an
>>>> ++ * error if the provided remote does not exist.
>>>> ++ *
>>>> ++ * Returns: %TRUE on success, %FALSE on failure
>>>> ++ */
>>>> ++gboolean
>>>> ++ostree_repo_remote_get_url_internal (OstreeRepo  *self,
>>>> ++                            const char  *name,
>>>> ++                            char       **out_url,
>>>> ++                            gboolean   show_password,
>>>> ++                            GError     **error)
>>>> ++{
>>>> +   g_return_val_if_fail (name != NULL, FALSE);
>>>> +
>>>> +   g_autofree char *url = NULL;
>>>> +@@ -1890,7 +2034,8 @@ ostree_repo_remote_get_url (OstreeRepo  *self,
>>>> +     }
>>>> +
>>>> +   if (out_url != NULL)
>>>> +-    *out_url = g_steal_pointer (&url);
>>>> ++    ostree_decrypt_url(url, out_url, show_password);
>>>> ++
>>>> +   return TRUE;
>>>> + }
>>>> +
>>>> +diff --git a/src/libostree/ostree-repo.h b/src/libostree/ostree-repo.h
>>>> +index e2608d8..18a0c04 100644
>>>> +--- a/src/libostree/ostree-repo.h
>>>> ++++ b/src/libostree/ostree-repo.h
>>>> +@@ -234,6 +234,14 @@ gboolean      ostree_repo_remote_get_url (OstreeRepo   *self,
>>>> +                                           GError      **error);
>>>> +
>>>> + _OSTREE_PUBLIC
>>>> ++gboolean      ostree_repo_remote_get_url_internal (OstreeRepo   *self,
>>>> ++                                          const char   *name,
>>>> ++                                          char        **out_url,
>>>> ++                                          gboolean    show_password,
>>>> ++                                          GError      **error);
>>>> ++
>>>> ++
>>>> ++_OSTREE_PUBLIC
>>>> + gboolean      ostree_repo_remote_get_gpg_verify (OstreeRepo  *self,
>>>> +                                                  const char  *name,
>>>> +                                                  gboolean    *out_gpg_verify,
>>>> +diff --git a/src/ostree/ot-remote-builtin-list.c b/src/ostree/ot-remote-builtin-list.c
>>>> +index eb5a1ba..5f3b83a 100644
>>>> +--- a/src/ostree/ot-remote-builtin-list.c
>>>> ++++ b/src/ostree/ot-remote-builtin-list.c
>>>> +@@ -62,7 +62,7 @@ ot_remote_builtin_list (int argc, char **argv, OstreeCommandInvocation *invocati
>>>> +         {
>>>> +           g_autofree char *remote_url = NULL;
>>>> +
>>>> +-          if (!ostree_repo_remote_get_url (repo, remotes[ii], &remote_url, error))
>>>> ++          if (!ostree_repo_remote_get_url_internal (repo, remotes[ii], &remote_url, FALSE, error))
>>>> +             goto out;
>>>> +
>>>> +           g_print ("%-*s  %s\n", max_length, remotes[ii], remote_url);
>>>> +diff --git a/src/ostree/ot-remote-builtin-show-url.c b/src/ostree/ot-remote-builtin-show-url.c
>>>> +index 08274c1..d33245a 100644
>>>> +--- a/src/ostree/ot-remote-builtin-show-url.c
>>>> ++++ b/src/ostree/ot-remote-builtin-show-url.c
>>>> +@@ -56,7 +56,7 @@ ot_remote_builtin_show_url (int argc, char **argv, OstreeCommandInvocation *invo
>>>> +
>>>> +   remote_name = argv[1];
>>>> +
>>>> +-  if (ostree_repo_remote_get_url (repo, remote_name, &remote_url, error))
>>>> ++  if (ostree_repo_remote_get_url_internal (repo, remote_name, &remote_url, FALSE, error))
>>>> +     {
>>>> +       g_print ("%s\n", remote_url);
>>>> +       ret = TRUE;
>>>> +--
>>>> +2.7.4
>>>> +
>>>> diff --git a/meta-filesystems/recipes-support/ostree/ostree/0001-ostree-fix-the-issue-of-cannot-get-the-config-entrie.patch b/meta-filesystems/recipes-support/ostree/ostree/0001-ostree-fix-the-issue-of-cannot-get-the-config-entrie.patch
>>>> new file mode 100755
>>>> index 0000000..6b7ba6a
>>>> --- /dev/null
>>>> +++ b/meta-filesystems/recipes-support/ostree/ostree/0001-ostree-fix-the-issue-of-cannot-get-the-config-entrie.patch
>>>> @@ -0,0 +1,30 @@
>>>> +diff --git a/src/boot/grub2/ostree-grub-generator b/src/boot/grub2/ostree-grub-generator
>>>> +index 82e66bd..b9cbe22 100644
>>>> +--- a/src/boot/grub2/ostree-grub-generator
>>>> ++++ b/src/boot/grub2/ostree-grub-generator
>>>> +@@ -24,7 +24,16 @@ set -e
>>>> + script=$(basename ${0})
>>>> + # Atomically safe location where to generete grub.cfg when executing system upgrade.
>>>> + new_grub2_cfg=${2}
>>>> +-entries_path=$(dirname $new_grub2_cfg)/entries
>>>> ++#entries_path=$(dirname $new_grub2_cfg)/entries
>>>> ++if [ -n "$_OSTREE_GRUB2_BOOTVERSION" -a -d /boot/loader.${_OSTREE_GRUB2_BOOTVERSION}/entries ]; then
>>>> ++    entries_path="/boot/loader.${_OSTREE_GRUB2_BOOTVERSION}/entries"
>>>> ++else
>>>> ++    if [ -d $(dirname $new_grub2_cfg)/../../../loader.${_OSTREE_GRUB2_BOOTVERSION}/entries ]; then
>>>> ++        entries_path=$(dirname $new_grub2_cfg)/../../../loader.${_OSTREE_GRUB2_BOOTVERSION}/entries
>>>> ++    else
>>>> ++        entries_path=$(dirname $new_grub2_cfg)/entries
>>>> ++    fi
>>>> ++fi
>>>> +
>>>> + read_config()
>>>> + {
>>>> +@@ -92,6 +101,7 @@ cat >> ${new_grub2_cfg} <<EOF
>>>> + serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1
>>>> + default=boot
>>>> + timeout=10
>>>> ++set root=(hd0,msdos2)
>>>> +
>>>> + EOF
>>>> + }
>>>> diff --git a/meta-filesystems/recipes-support/ostree/ostree/0001-ostree-only-deal-with-boot-efi-EFI-BOOT-grub.cfg.patch b/meta-filesystems/recipes-support/ostree/ostree/0001-ostree-only-deal-with-boot-efi-EFI-BOOT-grub.cfg.patch
>>>> new file mode 100755
>>>> index 0000000..344512a
>>>> --- /dev/null
>>>> +++ b/meta-filesystems/recipes-support/ostree/ostree/0001-ostree-only-deal-with-boot-efi-EFI-BOOT-grub.cfg.patch
>>>> @@ -0,0 +1,26 @@
>>>> +From 4fac4168d17ad1dcc28d4a37860aaa5d7e282bdc Mon Sep 17 00:00:00 2001
>>>> +From: fli <fupan.li@windriver.com>
>>>> +Date: Tue, 25 Jul 2017 02:50:23 -0700
>>>> +Subject: [PATCH] ostree: only deal with boot/efi/EFI/BOOT/grub.cfg
>>>> +
>>>> +Signed-off-by: fli <fupan.li@windriver.com>
>>>> +---
>>>> + src/libostree/ostree-bootloader-grub2.c | 2 +-
>>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>>> +
>>>> +diff --git a/src/libostree/ostree-bootloader-grub2.c b/src/libostree/ostree-bootloader-grub2.c
>>>> +index 2cd02287..762ac342 100644
>>>> +--- a/src/libostree/ostree-bootloader-grub2.c
>>>> ++++ b/src/libostree/ostree-bootloader-grub2.c
>>>> +@@ -103,7 +103,7 @@ _ostree_bootloader_grub2_query (OstreeBootloader *bootloader,
>>>> +             break;
>>>> +
>>>> +           fname = g_file_info_get_name (file_info);
>>>> +-          if (strcmp (fname, "BOOT") == 0)
>>>> ++          if (strcmp (fname, "BOOT") != 0)
>>>> +             continue;
>>>> +
>>>> +           if (g_file_info_get_file_type (file_info) != G_FILE_TYPE_DIRECTORY)
>>>> +--
>>>> +2.11.0
>>>> +
>>>> diff --git a/meta-filesystems/recipes-support/ostree/ostree/0001-ostree-secure-boot-support-for-no-change-to-grub.cfg.patch b/meta-filesystems/recipes-support/ostree/ostree/0001-ostree-secure-boot-support-for-no-change-to-grub.cfg.patch
>>>> new file mode 100644
>>>> index 0000000..1040e52
>>>> --- /dev/null
>>>> +++ b/meta-filesystems/recipes-support/ostree/ostree/0001-ostree-secure-boot-support-for-no-change-to-grub.cfg.patch
>>>> @@ -0,0 +1,96 @@
>>>> +From b012e1efa24e029e4eccfcda4938839916c11304 Mon Sep 17 00:00:00 2001
>>>> +From: fupan li <fupan.li@windriver.com>
>>>> +Date: Mon, 22 Jan 2018 14:18:18 +0800
>>>> +Subject: [PATCH] ostree: secure boot support for no change to grub.cfg
>>>> +
>>>> +Signed-off-by: fupan li <fupan.li@windriver.com>
>>>> +---
>>>> + src/boot/grub2/ostree-grub-generator    |   33 ++++++++++++++++++++++++++++++++
>>>> + src/libostree/ostree-bootloader-grub2.c |    3 +-
>>>> + 2 files changed, 35 insertions(+), 1 deletion(-)
>>>> +
>>>> +--- a/src/boot/grub2/ostree-grub-generator
>>>> ++++ b/src/boot/grub2/ostree-grub-generator
>>>> +@@ -34,12 +34,15 @@ else
>>>> +     fi
>>>> + fi
>>>> +
>>>> ++sysroot_dir=${3}
>>>> ++
>>>> + read_config()
>>>> + {
>>>> +     config_file=${1}
>>>> +     title=""
>>>> +     initrd=""
>>>> +     options=""
>>>> ++    ostree=""
>>>> +     linux=""
>>>> +
>>>> +     while read -r line
>>>> +@@ -58,6 +61,7 @@ read_config()
>>>> +                 ;;
>>>> +             "options")
>>>> +                 options=${value}
>>>> ++                ostree=`echo ${value} | sed 's/^.*ostree=\([^ ]*\).*$/\1/'`
>>>> +                 ;;
>>>> +         esac
>>>> +     done < ${config_file}
>>>> +@@ -75,6 +79,7 @@ populate_menu()
>>>> +     else
>>>> +         boot_prefix="${OSTREE_BOOT_PARTITION}"
>>>> +     fi
>>>> ++    count=0
>>>> +     for config in $(ls -v -r $entries_path/*.conf); do
>>>> +         read_config ${config}
>>>> +         menu="${menu}menuentry '${title}' {\n"
>>>> +@@ -83,7 +88,35 @@ populate_menu()
>>>> +             menu="${menu}\t initrd ${boot_prefix}${initrd}\n"
>>>> +         fi
>>>> +         menu="${menu}}\n\n"
>>>> ++
>>>> ++        linux_dir=`dirname ${sysroot_dir}/${boot_prefix}${linux}`
>>>> ++        linux_parent_dir=`basename ${linux_dir}`
>>>> ++        if [ -L ${linux_dir}/../${count} ]; then
>>>> ++          unlink ${linux_dir}/../${count}
>>>> ++        fi
>>>> ++        ln -sf ${linux_parent_dir} ${linux_dir}/../${count}
>>>> ++        ostree_boot_dir="${sysroot_dir}/${ostree}/../../../../boot"
>>>> ++        ostree_dir=`echo ${ostree} | cut -s -f3- -d '/'`
>>>> ++        if [ ! -d ${ostree_boot_dir} ]; then
>>>> ++            mkdir ${ostree_boot_dir}
>>>> ++        fi
>>>> ++        if [ -L ${ostree_boot_dir}/${count} ]; then
>>>> ++            unlink ${ostree_boot_dir}/${count}
>>>> ++        fi
>>>> ++        ln -sf ../${ostree_dir} ${ostree_boot_dir}/${count}
>>>> ++        count=`expr $count + 1`
>>>> +     done
>>>> ++
>>>> ++    if [ $count -eq 1 ]; then
>>>> ++        if [ -L ${linux_dir}/../${count} ]; then
>>>> ++            unlink ${linux_dir}/../${count}
>>>> ++        fi
>>>> ++        if [ -L ${ostree_boot_dir}/${count} ]; then
>>>> ++            unlink ${ostree_boot_dir}/${count}
>>>> ++        fi
>>>> ++        ln -sf ${linux_parent_dir} ${linux_dir}/../${count}
>>>> ++        ln -sf ../${ostree_dir} ${ostree_boot_dir}/${count}
>>>> ++    fi
>>>> +     # The printf command seems to be more reliable across shells for special character (\n, \t) evaluation
>>>> +     printf "$menu" >> ${new_grub2_cfg}
>>>> + }
>>>> +--- a/src/libostree/ostree-bootloader-grub2.c
>>>> ++++ b/src/libostree/ostree-bootloader-grub2.c
>>>> +@@ -384,10 +384,11 @@ _ostree_bootloader_grub2_write_config (O
>>>> +                                                       bootversion);
>>>> +     }
>>>> +
>>>> +-  const char *grub_argv[4] = { NULL, "-o", NULL, NULL};
>>>> ++  const char *grub_argv[5] = { NULL, "-o", NULL, NULL, NULL};
>>>> +   Grub2ChildSetupData cdata = { NULL, };
>>>> +   grub_argv[0] = grub_exec;
>>>> +   grub_argv[2] = gs_file_get_path_cached (new_config_path);
>>>> ++  grub_argv[3] = g_file_get_path (self->sysroot->path);
>>>> +
>>>> +   GSpawnFlags grub_spawnflags = G_SPAWN_SEARCH_PATH;
>>>> +   if (!g_getenv ("OSTREE_DEBUG_GRUB2"))
>>>> diff --git a/meta-filesystems/recipes-support/ostree/ostree/0001-retrieve-correct-boot-prefix-at-runtime.patch b/meta-filesystems/recipes-support/ostree/ostree/0001-retrieve-correct-boot-prefix-at-runtime.patch
>>>> new file mode 100644
>>>> index 0000000..9dbf881
>>>> --- /dev/null
>>>> +++ b/meta-filesystems/recipes-support/ostree/ostree/0001-retrieve-correct-boot-prefix-at-runtime.patch
>>>> @@ -0,0 +1,26 @@
>>>> +From 4aa830fcb2f560af116d5b2d7856d1ac347ef7bf Mon Sep 17 00:00:00 2001
>>>> +From: Yunguo Wei <yunguo.wei@windriver.com>
>>>> +Date: Mon, 7 May 2018 19:38:45 +0800
>>>> +Subject: [PATCH] retrieve correct boot prefix at runtime
>>>> +
>>>> +Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
>>>> +---
>>>> + src/boot/grub2/ostree-grub-generator | 2 ++
>>>> + 1 file changed, 2 insertions(+)
>>>> +
>>>> +diff --git a/src/boot/grub2/ostree-grub-generator b/src/boot/grub2/ostree-grub-generator
>>>> +index 0ebe113..a169892 100644
>>>> +--- a/src/boot/grub2/ostree-grub-generator
>>>> ++++ b/src/boot/grub2/ostree-grub-generator
>>>> +@@ -77,6 +77,8 @@ populate_menu()
>>>> +     # Default to /boot if OSTREE_BOOT_PARTITION is not set and /boot is on the same device than ostree/repo
>>>> +     if [ -z ${OSTREE_BOOT_PARTITION+x} ] && [ -d /boot/ostree ] && [ -d /ostree/repo ] && [ $(stat -c '%d' /boot/ostree) -eq $(stat -c '%d' /ostree/repo) ]; then
>>>> +         boot_prefix="/boot"
>>>> ++    elif [ -z ${OSTREE_BOOT_PARTITION} ] && [ -d /boot/efi/EFI/BOOT ]; then
>>>> ++      boot_prefix="/boot"
>>>> +     else
>>>> +         boot_prefix="${OSTREE_BOOT_PARTITION}"
>>>> +     fi
>>>> +--
>>>> +2.7.4
>>>> +
>>>> diff --git a/meta-filesystems/recipes-support/ostree/ostree/0001-tweak-regex-of-ostree-system-generator-for-pulsar.patch b/meta-filesystems/recipes-support/ostree/ostree/0001-tweak-regex-of-ostree-system-generator-for-pulsar.patch
>>>> new file mode 100644
>>>> index 0000000..fd5300e
>>>> --- /dev/null
>>>> +++ b/meta-filesystems/recipes-support/ostree/ostree/0001-tweak-regex-of-ostree-system-generator-for-pulsar.patch
>>>> @@ -0,0 +1,52 @@
>>>> +From f75cd3580c871c80008b1551c3c5cb17d5ffd836 Mon Sep 17 00:00:00 2001
>>>> +From: Hongxu Jia <hongxu.jia@windriver.com>
>>>> +Date: Wed, 20 Jun 2018 10:22:09 +0800
>>>> +Subject: [PATCH] tweak regex of ostree-system-generator for pulsar.
>>>> +
>>>> +Pulsar generate grub.cfg based on Yocto rather than ostree's
>>>> +ostree-grub-generator.
>>>> +
>>>> +And pulsar has boot params ostree="/boot/0/ostree" which is a
>>>> +synlink point to "../../ostree/boot.0/pulsar-linux".
>>>> +
>>>> +So tweak regex of ostree-system-generator for pulsar.
>>>> +
>>>> +Upstream-Status: Inappropriate [Pulsar specific]
>>>> +
>>>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>>> +---
>>>> + src/libostree/ostree-impl-system-generator.c | 11 ++++++++---
>>>> + 1 file changed, 8 insertions(+), 3 deletions(-)
>>>> +
>>>> +diff --git a/src/libostree/ostree-impl-system-generator.c b/src/libostree/ostree-impl-system-generator.c
>>>> +index 413e4f6..8b802ac 100644
>>>> +--- a/src/libostree/ostree-impl-system-generator.c
>>>> ++++ b/src/libostree/ostree-impl-system-generator.c
>>>> +@@ -95,16 +95,21 @@ stateroot_from_ostree_cmdline (const char *ostree_cmdline,
>>>> + {
>>>> +   static GRegex *regex;
>>>> +   static gsize regex_initialized;
>>>> ++  char ostree_cmdline_new[PATH_MAX] = {0};
>>>> ++
>>>> ++  if (readlink(ostree_cmdline, ostree_cmdline_new, sizeof(ostree_cmdline_new)) < 0)
>>>> ++      return glnx_null_throw (error, "Failed to readlink %s", ostree_cmdline);
>>>> ++
>>>> +   if (g_once_init_enter (&regex_initialized))
>>>> +     {
>>>> +-      regex = g_regex_new ("^/ostree/boot.[01]/([^/]+)/", 0, 0, NULL);
>>>> ++      regex = g_regex_new ("/ostree/boot.[01]/([^/]+)/", 0, 0, NULL);
>>>> +       g_assert (regex);
>>>> +       g_once_init_leave (&regex_initialized, 1);
>>>> +     }
>>>> +
>>>> +   g_autoptr(GMatchInfo) match = NULL;
>>>> +-  if (!g_regex_match (regex, ostree_cmdline, 0, &match))
>>>> +-    return glnx_null_throw (error, "Failed to parse %s", ostree_cmdline);
>>>> ++  if (!g_regex_match (regex, ostree_cmdline_new, 0, &match))
>>>> ++    return glnx_null_throw (error, "Failed to parse %s", ostree_cmdline_new);
>>>> +
>>>> +   return g_match_info_fetch (match, 1);
>>>> + }
>>>> +--
>>>> +2.7.4
>>>> +
>>>> diff --git a/meta-filesystems/recipes-support/ostree/ostree/0002-u-boot-add-bootdir-to-the-generated-uEnv.txt.patch b/meta-filesystems/recipes-support/ostree/ostree/0002-u-boot-add-bootdir-to-the-generated-uEnv.txt.patch
>>>> new file mode 100644
>>>> index 0000000..a338523
>>>> --- /dev/null
>>>> +++ b/meta-filesystems/recipes-support/ostree/ostree/0002-u-boot-add-bootdir-to-the-generated-uEnv.txt.patch
>>>> @@ -0,0 +1,53 @@
>>>> +From 64a6b5d1d3224c58c1bda2abbb791501c3e92abb Mon Sep 17 00:00:00 2001
>>>> +From: Gatis Paeglis <gatis.paeglis@qt.io>
>>>> +Date: Mon, 22 Aug 2016 15:52:21 +0200
>>>> +Subject: [PATCH 2/2] u-boot: add 'bootdir' to the generated uEnv.txt
>>>> +
>>>> +When doing a full copy of:
>>>> +
>>>> +$deployment/usr/lib/ostree-boot -> /boot/ostree/$os-$bootcsum/
>>>> +
>>>> +U-Boot bootscript can use the 'bootdir' to find, for example,
>>>> +the Device Tree (dtb) file, as in:
>>>> +
>>>> +load ${dtype} ${disk}:${bootpart} ${a_fdt} ${bootdir}${dtbname}
>>>> +
>>>> +Or u-boot external bootscript:
>>>> +
>>>> +load ${dtype} ${disk}:${bootpart} ${a_scr} ${bootdir}${scriptname}
>>>> +
>>>> +It could also be possible to point 'bootdir' directly to the
>>>> +$deployment/usr/lib/ostree-boot, but this would add unnecessary
>>>> +restrictions on what file system can be used for rootfs as u-boot,
>>>> +for example, can not read from BTRFS. So having
>>>> +bootdir=/boot/ostree/$os-$bootcsum/ is a better approach here, as
>>>> +/boot can be on a separate partition with its own file system type.
>>>> +---
>>>> + src/libostree/ostree-bootloader-uboot.c | 4 ++++
>>>> + 1 file changed, 4 insertions(+)
>>>> +
>>>> +diff --git a/src/libostree/ostree-bootloader-uboot.c b/src/libostree/ostree-bootloader-uboot.c
>>>> +index 262681b..9ecc66f 100644
>>>> +--- a/src/libostree/ostree-bootloader-uboot.c
>>>> ++++ b/src/libostree/ostree-bootloader-uboot.c
>>>> +@@ -113,6 +113,7 @@ create_config_from_boot_loader_entries (OstreeBootloaderUboot     *self,
>>>> +   g_autoptr(GPtrArray) boot_loader_configs = NULL;
>>>> +   OstreeBootconfigParser *config;
>>>> +   const char *val;
>>>> ++  g_autofree char *bootdir = NULL;
>>>> +
>>>> +   if (!_ostree_sysroot_read_boot_loader_configs (self->sysroot, bootversion, &boot_loader_configs,
>>>> +                                                  cancellable, error))
>>>> +@@ -136,6 +137,9 @@ create_config_from_boot_loader_entries (OstreeBootloaderUboot     *self,
>>>> +         }
>>>> +       g_ptr_array_add (new_lines, g_strdup_printf ("kernel_image%s=%s", index_suffix, val));
>>>> +
>>>> ++      bootdir = strndup (val, strrchr(val, '/') - val);
>>>> ++      g_ptr_array_add (new_lines, g_strdup_printf ("bootdir=%s/", bootdir));
>>>> ++
>>>> +       val = ostree_bootconfig_parser_get (config, "initrd");
>>>> +       if (val)
>>>> +         g_ptr_array_add (new_lines, g_strdup_printf ("ramdisk_image%s=%s", index_suffix, val));
>>>> +--
>>>> +2.7.4
>>>> +
>>>> diff --git a/meta-filesystems/recipes-support/ostree/ostree/0003-uboot-add-non-default-for-bootdirs-to-uEnv.txt.patch b/meta-filesystems/recipes-support/ostree/ostree/0003-uboot-add-non-default-for-bootdirs-to-uEnv.txt.patch
>>>> new file mode 100644
>>>> index 0000000..e183d10
>>>> --- /dev/null
>>>> +++ b/meta-filesystems/recipes-support/ostree/ostree/0003-uboot-add-non-default-for-bootdirs-to-uEnv.txt.patch
>>>> @@ -0,0 +1,28 @@
>>>> +From 854e0a1849c99fe00b53c1bfdfdd493f893bddc7 Mon Sep 17 00:00:00 2001
>>>> +From: Jiang Lu <lu.jiang@windriver.com>
>>>> +Date: Fri, 25 May 2018 13:00:47 +0800
>>>> +Subject: [PATCH] uboot: add non-default for bootdirs to uEnv.txt
>>>> +
>>>> +Add index for non-default bootdirs in uEnv.txt.
>>>> +
>>>> +Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
>>>> +---
>>>> + src/libostree/ostree-bootloader-uboot.c | 2 +-
>>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>>> +
>>>> +diff --git a/src/libostree/ostree-bootloader-uboot.c b/src/libostree/ostree-bootloader-uboot.c
>>>> +index 9ecc66f..5522943 100644
>>>> +--- a/src/libostree/ostree-bootloader-uboot.c
>>>> ++++ b/src/libostree/ostree-bootloader-uboot.c
>>>> +@@ -138,7 +138,7 @@ create_config_from_boot_loader_entries (OstreeBootloaderUboot     *self,
>>>> +       g_ptr_array_add (new_lines, g_strdup_printf ("kernel_image%s=%s", index_suffix, val));
>>>> +
>>>> +       bootdir = strndup (val, strrchr(val, '/') - val);
>>>> +-      g_ptr_array_add (new_lines, g_strdup_printf ("bootdir=%s/", bootdir));
>>>> ++      g_ptr_array_add (new_lines, g_strdup_printf ("bootdir%s=%s/", index_suffix, bootdir));
>>>> +
>>>> +       val = ostree_bootconfig_parser_get (config, "initrd");
>>>> +       if (val)
>>>> +--
>>>> +2.7.4
>>>> +
>>>> diff --git a/meta-filesystems/recipes-support/ostree/ostree/ostree_swap_bootentry_atomically.patch b/meta-filesystems/recipes-support/ostree/ostree/ostree_swap_bootentry_atomically.patch
>>>> new file mode 100644
>>>> index 0000000..fa0bf48
>>>> --- /dev/null
>>>> +++ b/meta-filesystems/recipes-support/ostree/ostree/ostree_swap_bootentry_atomically.patch
>>>> @@ -0,0 +1,71 @@
>>>> +---
>>>> + src/boot/grub2/ostree-grub-generator |   45 +++++++++++++++++------------------
>>>> + 1 file changed, 22 insertions(+), 23 deletions(-)
>>>> +
>>>> +--- a/src/boot/grub2/ostree-grub-generator
>>>> ++++ b/src/boot/grub2/ostree-grub-generator
>>>> +@@ -79,7 +79,10 @@ populate_menu()
>>>> +     else
>>>> +         boot_prefix="${OSTREE_BOOT_PARTITION}"
>>>> +     fi
>>>> ++
>>>> +     count=0
>>>> ++    declare -A boots=()
>>>> ++
>>>> +     for config in $(ls -v -r $entries_path/*.conf); do
>>>> +         read_config ${config}
>>>> +         menu="${menu}menuentry '${title}' {\n"
>>>> +@@ -89,34 +92,30 @@ populate_menu()
>>>> +         fi
>>>> +         menu="${menu}}\n\n"
>>>> +
>>>> +-        linux_dir=`dirname ${sysroot_dir}/${boot_prefix}${linux}`
>>>> +-        linux_parent_dir=`basename ${linux_dir}`
>>>> +-        if [ -L ${linux_dir}/../${count} ]; then
>>>> +-          unlink ${linux_dir}/../${count}
>>>> +-        fi
>>>> +-        ln -sf ${linux_parent_dir} ${linux_dir}/../${count}
>>>> +-        ostree_boot_dir="${sysroot_dir}/${ostree}/../../../../boot"
>>>> +-        ostree_dir=`echo ${ostree} | cut -s -f3- -d '/'`
>>>> +-        if [ ! -d ${ostree_boot_dir} ]; then
>>>> +-            mkdir ${ostree_boot_dir}
>>>> +-        fi
>>>> +-        if [ -L ${ostree_boot_dir}/${count} ]; then
>>>> +-            unlink ${ostree_boot_dir}/${count}
>>>> +-        fi
>>>> +-        ln -sf ../${ostree_dir} ${ostree_boot_dir}/${count}
>>>> ++        linux_dir=`dirname ${boot_prefix}${linux}`
>>>> ++        boots[$count]=`mktemp -d ${sysroot_dir}${boot_prefix}/boot.XXXXXXXXXX`
>>>> ++        ln -sf ${linux_dir} ${boots[$count]}/boot
>>>> ++        ln -sf ../..${ostree} ${boots[$count]}/ostree
>>>> +         count=`expr $count + 1`
>>>> +     done
>>>> +
>>>> +-    if [ $count -eq 1 ]; then
>>>> +-        if [ -L ${linux_dir}/../${count} ]; then
>>>> +-            unlink ${linux_dir}/../${count}
>>>> ++    for i in 1 0; do
>>>> ++        if [ -n "${boots[$i]}" -a -d ${boots[$i]} ]; then
>>>> ++            ln -sTf `basename ${boots[$i]}` ${sysroot_dir}${boot_prefix}/$i
>>>> ++        elif [ -n "${boots[0]}" -a -d ${boots[0]} ]; then
>>>> ++            ln -sTf `basename ${boots[0]}`  ${sysroot_dir}${boot_prefix}/$i
>>>> +         fi
>>>> +-        if [ -L ${ostree_boot_dir}/${count} ]; then
>>>> +-            unlink ${ostree_boot_dir}/${count}
>>>> ++    done
>>>> ++
>>>> ++    #rm the directories unlinked
>>>> ++    cd ${sysroot_dir}${boot_prefix}
>>>> ++    for i in boot\.*; do
>>>> ++        num=`find . -lname $i | wc -l`
>>>> ++        if [ $num -eq 0 ]; then
>>>> ++            rm -rf $i
>>>> +         fi
>>>> +-        ln -sf ${linux_parent_dir} ${linux_dir}/../${count}
>>>> +-        ln -sf ../${ostree_dir} ${ostree_boot_dir}/${count}
>>>> +-    fi
>>>> ++    done
>>>> ++    cd -
>>>> +     # The printf command seems to be more reliable across shells for special character (\n, \t) evaluation
>>>> +     printf "$menu" >> ${new_grub2_cfg}
>>>> + }
>>>> diff --git a/meta-filesystems/recipes-support/ostree/ostree/sample.conf b/meta-filesystems/recipes-support/ostree/ostree/sample.conf
>>>> new file mode 100644
>>>> index 0000000..085aab0
>>>> --- /dev/null
>>>> +++ b/meta-filesystems/recipes-support/ostree/ostree/sample.conf
>>>> @@ -0,0 +1,11 @@
>>>> +#set the remote ostree repocitory name
>>>> +#[remote "remote name"]
>>>> +
>>>> +#set the ostree repocitory base url
>>>> +#url=http[s]://[username]:[password]@<server name/ip>/<repo path>
>>>> +
>>>> +#A boolean value, defaults to false. By default, server TLS certificates
>>>> +#will be checked against the system certificate store. If this variable
>>>> +#is set, any certificate will be accepted.
>>>> +#tls-permissive=true
>>>> +
>>>> diff --git a/meta-filesystems/recipes-support/ostree/ostree/system-export.sh b/meta-filesystems/recipes-support/ostree/ostree/system-export.sh
>>>> new file mode 100755
>>>> index 0000000..293043c
>>>> --- /dev/null
>>>> +++ b/meta-filesystems/recipes-support/ostree/ostree/system-export.sh
>>>> @@ -0,0 +1,39 @@
>>>> +#!/bin/sh
>>>> +
>>>> +SYSROOT_TARBALL=""
>>>> +SYSROOT=""
>>>> +
>>>> +function get_ref(){
>>>> +    count=0
>>>> +    logfile=$(mktemp /tmp/tmp.XXXXXXXXXX)
>>>> +    ostree admin status | sed 's/\*/\\\\\*/' >$logfile
>>>> +     while read fileline; do
>>>> +        echo $fileline | grep '\*' >/dev/null 2>&1
>>>> +       if [ $? == 0 ]; then
>>>> +               SYSROOT=$(echo $fileline | awk '{print "/ostree/deploy/"$2"/deploy/"$3}')
>>>> +            count=1
>>>> +       fi
>>>> +
>>>> +       if [ $count == 1 ]; then
>>>> +            echo $fileline | grep " *origin refspec"  >/dev/null 2>&1
>>>> +           if [ $? == 0 ]; then
>>>> +                SYSROOT_TARBALL=$(echo $fileline | awk '{print $3}' | sed 's/:/-/g')
>>>> +               SYSROOT_TARBALL=${SYSROOT_TARBALL}.tar.gz
>>>> +               rm -rf $logfile
>>>> +               break
>>>> +           fi
>>>> +       fi
>>>> +    done<$logfile
>>>> +}
>>>> +
>>>> +get_ref
>>>> +
>>>> +#deploy the /etc directory if the system is in unlocked status
>>>> +mount | grep "^overlay" | grep "lowerdir=usr" | grep "upperdir=.usr-ovl-upper" >/dev/null 2>&1
>>>> +if [ $? == 0 ]; then
>>>> +    cp -a /etc /usr/
>>>> +fi
>>>> +
>>>> +tar --exclude="./usr" --exclude="./etc"  --exclude="./.usr-ovl-*" --xattrs --xattrs-include='*' -cf - /usr -C $SYSROOT  . -P | pv -s $(du -sb $SYSROOT | awk '{print $1}') | gzip > $SYSROOT_TARBALL
>>>> +
>>>> +echo "The system had been exported to ./$SYSROOT_TARBALL"
>>>> diff --git a/meta-filesystems/recipes-support/ostree/ostree/test.patch b/meta-filesystems/recipes-support/ostree/ostree/test.patch
>>>> new file mode 100644
>>>> index 0000000..ac8240a
>>>> --- /dev/null
>>>> +++ b/meta-filesystems/recipes-support/ostree/ostree/test.patch
>>>> @@ -0,0 +1,16 @@
>>>> +diff --git a/src/libostree/ostree-repo.c b/src/libostree/ostree-repo.c
>>>> +index ec509e9..61bf162 100644
>>>> +--- a/src/libostree/ostree-repo.c
>>>> ++++ b/src/libostree/ostree-repo.c
>>>> +@@ -3604,8 +3604,10 @@ _ostree_repo_load_file_bare (OstreeRepo         *self,
>>>> +   if (self->mode == OSTREE_REPO_MODE_BARE_USER)
>>>> +     {
>>>> +       g_autoptr(GBytes) bytes = glnx_fgetxattr_bytes (fd, "user.ostreemeta", error);
>>>> +-      if (bytes == NULL)
>>>> ++      if (bytes == NULL){
>>>> ++        glnx_throw (error, "****************The error file is: %s", loose_path_buf);
>>>> +         return FALSE;
>>>> ++      }
>>>> +
>>>> +       g_autoptr(GVariant) metadata = g_variant_ref_sink (g_variant_new_from_bytes (OSTREE_FILEMETA_GVARIANT_FORMAT,
>>>> +                                                                                    bytes, FALSE));
>>>> diff --git a/meta-filesystems/recipes-support/ostree/ostree/tmp_fix.patch b/meta-filesystems/recipes-support/ostree/ostree/tmp_fix.patch
>>>> new file mode 100644
>>>> index 0000000..ea03bc2
>>>> --- /dev/null
>>>> +++ b/meta-filesystems/recipes-support/ostree/ostree/tmp_fix.patch
>>>> @@ -0,0 +1,18 @@
>>>> +diff --git a/src/libostree/ostree-core.c b/src/libostree/ostree-core.c
>>>> +index 679c952..39ef959 100644
>>>> +--- a/src/libostree/ostree-core.c
>>>> ++++ b/src/libostree/ostree-core.c
>>>> +@@ -2178,9 +2178,11 @@ _ostree_validate_bareuseronly_mode (guint32     content_mode,
>>>> +   if (S_ISREG (content_mode))
>>>> +     {
>>>> +       const guint32 invalid_modebits = ((content_mode & ~S_IFMT) & ~0775);
>>>> +-      if (invalid_modebits > 0)
>>>> +-        return glnx_throw (error, "Content object %s: invalid mode 0%04o with bits 0%04o",
>>>> ++/*      if (invalid_modebits > 0)
>>>> ++        glnx_throw (error, "Content object %s: invalid mode 0%04o with bits 0%04o",
>>>> +                            checksum, content_mode, invalid_modebits);
>>>> ++*/
>>>> ++
>>>> +     }
>>>> +   else if (S_ISLNK (content_mode))
>>>> +     ; /* Nothing */
>>>> diff --git a/meta-filesystems/recipes-support/ostree/ostree/using-bash-specifically.patch b/meta-filesystems/recipes-support/ostree/ostree/using-bash-specifically.patch
>>>> new file mode 100644
>>>> index 0000000..3f4cdaf
>>>> --- /dev/null
>>>> +++ b/meta-filesystems/recipes-support/ostree/ostree/using-bash-specifically.patch
>>>> @@ -0,0 +1,12 @@
>>>> +---
>>>> + src/boot/grub2/ostree-grub-generator |    2 +-
>>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>>> +
>>>> +--- a/src/boot/grub2/ostree-grub-generator
>>>> ++++ b/src/boot/grub2/ostree-grub-generator
>>>> +@@ -1,4 +1,4 @@
>>>> +-#!/bin/sh
>>>> ++#!/bin/bash
>>>> +
>>>> + # The builtin grub.cfg generator.
>>>> + #
>>>> diff --git a/meta-filesystems/recipes-support/ostree/ostree_git.bb b/meta-filesystems/recipes-support/ostree/ostree_git.bb
>>>> new file mode 100755
>>>> index 0000000..979b789
>>>> --- /dev/null
>>>> +++ b/meta-filesystems/recipes-support/ostree/ostree_git.bb
>>>> @@ -0,0 +1,124 @@
>>>> +SUMMARY = "Tool for managing bootable, immutable, versioned filesystem trees"
>>>> +LICENSE = "GPLv2+"
>>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
>>>> +
>>>> +inherit autotools-brokensep pkgconfig systemd gobject-introspection
>>>> +
>>>> +INHERIT_remove_class-native = "systemd"
>>>> +
>>>> +SRC_URI = "gitsm://github.com/ostreedev/ostree.git;branch=master \
>>>> +           file://system-export.sh \
>>>> +          file://0001-ostree-fix-the-issue-of-cannot-get-the-config-entrie.patch \
>>>> +          file://test.patch \
>>>> +           file://sample.conf \
>>>> +          file://tmp_fix.patch \
>>>> +           file://0001-ostree-secure-boot-support-for-no-change-to-grub.cfg.patch \
>>>> +           file://0001-Allow-updating-files-in-the-boot-directory.patch  \
>>>> +           file://0002-u-boot-add-bootdir-to-the-generated-uEnv.txt.patch \
>>>> +           file://0003-uboot-add-non-default-for-bootdirs-to-uEnv.txt.patch \
>>>> +           file://ostree_swap_bootentry_atomically.patch \
>>>> +          file://using-bash-specifically.patch \
>>>> +          file://0001-create-boot-symlink-based-on-relative-path.patch \
>>>> +          file://0001-retrieve-correct-boot-prefix-at-runtime.patch \
>>>> +          file://0001-encrypt-decrypt-password-of-remote-repository-uri.patch \
>>>> +          file://0001-tweak-regex-of-ostree-system-generator-for-pulsar.patch \
>>>> +          file://0001-deploy-using-etc-in-runtime-as-merge-source.patch \
>>>> +       "
>>>> +
>>>> +
>>>> +SRCREV = "414891865568ee95978bfe2091ef6f8416726a1f"
>>>> +
>>>> +CLEANBROKEN = "1"
>>>> +
>>>> +PV = "2018.7+git${SRCPV}"
>>>> +
>>>> +S = "${WORKDIR}/git"
>>>> +
>>>> +BBCLASSEXTEND = "native nativesdk"
>>>> +
>>>> +DEPENDS += "attr libarchive glib-2.0 pkgconfig gpgme fuse libsoup-2.4 e2fsprogs gtk-doc-native curl bison-native"
>>>> +DEPENDS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd', '', d)}"
>>>> +DEPENDS_remove_class-native = "systemd-native"
>>>> +
>>>> +RDEPENDS_${PN} = "python util-linux-libuuid util-linux-libblkid util-linux-libmount libcap xz bash openssl"
>>>> +
>>>> +RDEPENDS_${PN}_remove_class-native = "python-native"
>>>> +
>>>> +RDEPENDS_${PN}_append_class-target = " pv"
>>>> +
>>>> +RDEPENDS_${PN}_remove_class-nativesdk = "util-linux-libuuid util-linux-libblkid util-linux-libmount"
>>>> +RDEPENDS_${PN}_append_class-nativesdk = " util-linux "
>>>> +
>>>> +EXTRA_OECONF = "--with-libarchive --disable-gtk-doc --disable-gtk-doc-html --disable-gtk-doc-pdf --disable-man --with-smack --with-builtin-grub2-mkconfig  \
>>>> + --libdir=${libdir} "
>>>> +EXTRA_OECONF_append_class-native = " --enable-wrpseudo-compat"
>>>> +
>>>> +# Path to ${prefix}/lib/ostree/ostree-grub-generator is hardcoded on the
>>>> +#  do_configure stage so we do depend on it
>>>> +SYSROOT_DIR = "${STAGING_DIR_TARGET}"
>>>> +SYSROOT_DIR_class-native = "${STAGING_DIR_NATIVE}"
>>>> +do_configure[vardeps] += "SYSROOT_DIR"
>>>> +
>>>> +SYSTEMD_REQUIRED = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}"
>>>> +SYSTEMD_REQUIRED_class-native = ""
>>>> +
>>>> +SYSTEMD_SERVICE_${PN} = "ostree-prepare-root.service ostree-remount.service"
>>>> +SYSTEMD_SERVICE_${PN}_class-native = ""
>>>> +
>>>> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
>>>> +PACKAGECONFIG_class-native = ""
>>>> +PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/ --with-dracut"
>>>> +
>>>> +FILES_${PN} += "${libdir}/ostree/ ${libdir}/ostbuild"
>>>> +
>>>> +export STAGING_INCDIR
>>>> +export STAGING_LIBDIR
>>>> +
>>>> +do_configure() {
>>>> + unset docdir
>>>> + NOCONFIGURE=1 ./autogen.sh
>>>> + oe_runconf
>>>> +}
>>>> +
>>>> +do_compile_prepend() {
>>>> + export BUILD_SYS="${BUILD_SYS}"
>>>> + export HOST_SYS="${HOST_SYS}"
>>>> +}
>>>> +
>>>> +export SYSTEMD_REQUIRED
>>>> +
>>>> +do_install_append() {
>>>> + if [ -n ${SYSTEMD_REQUIRED} ]; then
>>>> +  install -p -D ${S}/src/boot/ostree-prepare-root.service ${D}${systemd_unitdir}/system/ostree-prepare-root.service
>>>> +  install -p -D ${S}/src/boot/ostree-remount.service ${D}${systemd_unitdir}/system/ostree-remount.service
>>>> + fi
>>>> + install -d ${D}/${sysconfdir}/ostree/remotes.d/
>>>> + install  ${WORKDIR}/sample.conf ${D}/${sysconfdir}/ostree/remotes.d/
>>>> + install -m 0755 ${WORKDIR}/system-export.sh ${D}/${bindir}/system-export
>>>> +}
>>>> +
>>>> +do_install_append_class-native() {
>>>> +       create_wrapper ${D}${bindir}/ostree OSTREE_GRUB2_EXEC="${STAGING_LIBDIR_NATIVE}/ostree/ostree-grub-generator"
>>>> +}
>>>> +
>>>> +
>>>> +FILES_${PN} += " \
>>>> +    ${@'${systemd_unitdir}/system/' if d.getVar('SYSTEMD_REQUIRED', True) else ''} \
>>>> +    ${@'/usr/lib/dracut/modules.d/98ostree/module-setup.sh' if d.getVar('SYSTEMD_REQUIRED', True) else ''} \
>>>> +    ${datadir}/gir-1.0 \
>>>> +    ${datadir}/gir-1.0/OSTree-1.0.gir \
>>>> +    ${datadir}/bash-completion \
>>>> +    /usr/lib/girepository-1.0 \
>>>> +    /usr/lib/girepository-1.0/OSTree-1.0.typelib \
>>>> +    /usr/lib/ostree/ostree-grub-generator \
>>>> +    /usr/lib/ostree/ostree-remount \
>>>> +    ${systemd_unitdir} \
>>>> +    /usr/lib/tmpfiles.d \
>>>> +"
>>>> +
>>>> +PACKAGES =+ "${PN}-switchroot"
>>>> +
>>>> +FILES_${PN}-switchroot = "/usr/lib/ostree/ostree-prepare-root"
>>>> +RDEPENDS_${PN}-switchroot = ""
>>>> +DEPENDS_remove_class-native = "systemd-native"
>>>> +
>>>> --
>>>> 2.7.4
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>>
>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>

