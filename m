Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18108D1680B
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 10:47:47 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7661.1767955657222089243
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 02:47:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VTDlvfji;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-431048c4068so1733448f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 02:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767955656; x=1768560456; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JCqw5aNiLwolyydOWdPoBoOazySDrDPuPvXS5cHTENM=;
        b=VTDlvfjiX1R/WQ5mUc2Bu7uzO2qDoFNxzbU2NVIDTXHb8tZ7pz0BGGibKDSdxVdqLy
         HPNINnxuNx134IN55/SBpKysclQCW8FzPDywhBmMbuLEmvDlH+Bs8wjD5bJrpEDBXUab
         UmCvVcfsPl9WM8HhnfBjwM61eeno9F6ToRe5j/hp9tBTTV+/LPHv1OiseG6hIdt/wQJn
         +Uz7dLv6qqPrnydALVkIVB9LztClAH5VChz4wkkAxDbyssCfGbpv7hFXB37Iv1sr+6oh
         /zrev4IUkJUUqhVDSu4qox6CC25JTp/k8F67zFdn4O6JJcwFLhhDyffdOMN91EJZt9/U
         24WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767955656; x=1768560456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JCqw5aNiLwolyydOWdPoBoOazySDrDPuPvXS5cHTENM=;
        b=iCnPKPOcFLvnySBq/9Dalal2zlhIkHjr2KStn3TWYQ5gE1jftFrikIb5pFbpRrxzBr
         jDRcuHpk7zSCgzx96q+04hi4XGhCpn7t1axPH5dYQ12fKLGfYRIZTX+4hrWvGGaJNaZw
         7+MI3CzbttBWdrY2APO9WF/SF94eR5VX5i3XCAfUaHfxod0eOdKSF/N7GreLqucISmQC
         lE/1Vw6PwaAA/zOPUDkatUjgLra8skeJo08bZ/R0tDzxHCMadCUj8lrEC5KepUa5RxBY
         DXrDZT1dv2HGsAm08zmhX7/r3qoDJG9DQxmy7iD0LsG1PyFIfjDSTZu+khCrOzWdFFE3
         Jogg==
X-Forwarded-Encrypted: i=1; AJvYcCWfXba3JOaOhWaKDzfvCqW9yyXZrLYtRBm8tncQp1chouKqiPyFzEA7Q3Zg7IvVm/JyQ+DhZQSeQQ7QgW318TZVLyU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxHma+KOsQexGl5o+BCcr+zJaXVE96t0JVhdV1oOLsM0kKSMSyc
	FQnw2x4mCsLbNH1op3O1S8bRaXyvjq9lmZXcxlWPdZ/2dtfELRYCaVwh
X-Gm-Gg: AY/fxX5Wx+7yV3Bd7ElM77HG2YNW5sGY1lqm2LiG8bWhP+opFabyhbLn/KaSp3CrcBY
	mQRup09+Q+t0EfnnW9gPKB2IHdrNf+/MlodwFURR0wrgBHz3tMRTT/Ru8F2Y4eNFvVO17SZO+Xy
	C3H/Ml7lxZ/K0QF2HOw4ExDjycw94PhF6Q1Bxn+G73rx84ixRyAWdOURAfXr86DrZVXcLzX/ITw
	heZQQ7J/0J2oPPq4UPbqKqFM+EYiZKxd2uAbnwuy73Wo30DkBPVfViuUlum04EhwUOQc3VzUUuX
	qurNYF7QOsIp/AV1KcyZPnoiw5eAHiFv64Lftu8HS7GEcUAf9xFNRnlXJ4LR/38qOPZC+i+GEDS
	xDgDIXwQ4Q5zx3jrpB80Q6LcwRkWHKzKr9T30R4STgOltkNGiZh3gKWNjLSnnS6qbE7eORhVUAd
	gHdjzjqJB/s7lrFstY+/A=
X-Google-Smtp-Source: AGHT+IEtWHIcSVYQKlgR7E2m6PNMeQnaRXUwWJirLaJGAK3ad1j50k/TnD2OEK5u2LVPk5zcRTLnxg==
X-Received: by 2002:a05:6000:18a5:b0:42f:b555:5275 with SMTP id ffacd0b85a97d-432c3634556mr12026874f8f.10.1767955655278;
        Fri, 09 Jan 2026 02:47:35 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df9c5sm22510622f8f.22.2026.01.09.02.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 02:47:34 -0800 (PST)
Message-ID: <b6bebb8b-4db8-49cc-a9a4-50a853e4a478@gmail.com>
Date: Fri, 9 Jan 2026 11:47:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-networking][scarthgap][PATCH 01/12] cifs-utils: patch
 CVE-2025-2312
To: ankur.tyagi85@gmail.com, openembedded-devel@lists.openembedded.org
References: <20260109092843.1924568-1-ankur.tyagi85@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260109092843.1924568-1-ankur.tyagi85@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 10:47:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123291

This patch needs a bit of caution, because it requires kernel 6.13 at
least, without it it has not effect. The required kernel change[1] was
not backported to older stable versions (both Scarthgap and Kirkstone
are out of luck with the default kernel).

Not saying the patch should be dropped, rather that CVE tag in the patch
will mark is patched, but it's only half of the fix. Not sure what (if
anything at all) should be done about this.

[1]:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/fs/smb?id=db363b0a1d9e6b9dc556296f1b1007aeb496a8cf

On 1/9/26 10:28, Ankur Tyagi via lists.openembedded.org wrote:
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Details: https://nvd.nist.gov/vuln/detail/CVE-2025-2312
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../cifs/cifs-utils/CVE-2025-2312.patch       | 136 ++++++++++++++++++
>  .../recipes-support/cifs/cifs-utils_7.0.bb    |   4 +-
>  2 files changed, 139 insertions(+), 1 deletion(-)
>  create mode 100644 meta-networking/recipes-support/cifs/cifs-utils/CVE-2025-2312.patch
>
> diff --git a/meta-networking/recipes-support/cifs/cifs-utils/CVE-2025-2312.patch b/meta-networking/recipes-support/cifs/cifs-utils/CVE-2025-2312.patch
> new file mode 100644
> index 0000000000..3e62b0f1c3
> --- /dev/null
> +++ b/meta-networking/recipes-support/cifs/cifs-utils/CVE-2025-2312.patch
> @@ -0,0 +1,136 @@
> +From faf6ce0abd6fbca95721eb88754add9c0c700a5c Mon Sep 17 00:00:00 2001
> +From: Ritvik Budhiraja <rbudhiraja@microsoft.com>
> +Date: Tue, 19 Nov 2024 06:07:58 +0000
> +Subject: [PATCH] CIFS.upcall to accomodate new namespace mount opt
> +
> +NOTE: This patch is dependent on one of the previously sent patches:
> +[PATCH] CIFS: New mount option for cifs.upcall namespace resolution
> +which introduces a new mount option called upcall_target, to
> +customise the upcall behaviour.
> +
> +Building upon the above patch, the following patch adds functionality
> +to handle upcall_target as a mount option in cifs.upcall. It can have 2 values -
> +mount, app.
> +Having this new mount option allows the mount command to specify where the
> +upcall should happen: 'mount' for resolving the upcall to the host
> +namespace, and 'app' for resolving the upcall to the ns of the calling
> +thread. This will enable both the scenarios where the Kerberos credentials
> +can be found on the application namespace or the host namespace to which
> +just the mount operation is "delegated".
> +This aids use cases like Kubernetes where the mount
> +happens on behalf of the application in another container altogether.
> +
> +Signed-off-by: Ritvik Budhiraja <rbudhiraja@microsoft.com>
> +Signed-off-by: Steve French <stfrench@microsoft.com>
> +
> +CVE: CVE-2025-2312
> +Upstream-Status: Backport [https://git.samba.org/?p=cifs-utils.git;a=commit;h=89b679228cc1be9739d54203d28289b03352c174]
> +(cherry picked from commit 89b679228cc1be9739d54203d28289b03352c174)
> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +---
> + cifs.upcall.c | 55 +++++++++++++++++++++++++++++++++++++++++++--------
> + 1 file changed, 47 insertions(+), 8 deletions(-)
> +
> +diff --git a/cifs.upcall.c b/cifs.upcall.c
> +index 52c0328..0883afa 100644
> +--- a/cifs.upcall.c
> ++++ b/cifs.upcall.c
> +@@ -953,6 +953,13 @@ struct decoded_args {
> + #define MAX_USERNAME_SIZE 256
> + 	char username[MAX_USERNAME_SIZE + 1];
> + 
> ++#define MAX_UPCALL_STRING_LEN 6 /* "mount\0" */
> ++	enum upcall_target_enum {
> ++		UPTARGET_UNSPECIFIED, /* not specified, defaults to app */
> ++		UPTARGET_MOUNT, /* upcall to the mount namespace */
> ++		UPTARGET_APP, /* upcall to the application namespace which did the mount */
> ++	} upcall_target;
> ++
> + 	uid_t uid;
> + 	uid_t creduid;
> + 	pid_t pid;
> +@@ -969,6 +976,7 @@ struct decoded_args {
> + #define DKD_HAVE_PID		0x20
> + #define DKD_HAVE_CREDUID	0x40
> + #define DKD_HAVE_USERNAME	0x80
> ++#define DKD_HAVE_UPCALL_TARGET	0x100
> + #define DKD_MUSTHAVE_SET (DKD_HAVE_HOSTNAME|DKD_HAVE_VERSION|DKD_HAVE_SEC)
> + 	int have;
> + };
> +@@ -979,6 +987,7 @@ __decode_key_description(const char *desc, struct decoded_args *arg)
> + 	size_t len;
> + 	char *pos;
> + 	const char *tkn = desc;
> ++	arg->upcall_target = UPTARGET_UNSPECIFIED;
> + 
> + 	do {
> + 		pos = index(tkn, ';');
> +@@ -1077,6 +1086,31 @@ __decode_key_description(const char *desc, struct decoded_args *arg)
> + 			}
> + 			arg->have |= DKD_HAVE_VERSION;
> + 			syslog(LOG_DEBUG, "ver=%d", arg->ver);
> ++		} else if (strncmp(tkn, "upcall_target=", 14) == 0) {
> ++			if (pos == NULL)
> ++				len = strlen(tkn);
> ++			else
> ++				len = pos - tkn;
> ++
> ++			len -= 14;
> ++			if (len > MAX_UPCALL_STRING_LEN) {
> ++				syslog(LOG_ERR, "upcall_target= value too long for buffer");
> ++				return 1;
> ++			}
> ++			if (strncmp(tkn + 14, "mount", 5) == 0) {
> ++				arg->upcall_target = UPTARGET_MOUNT;
> ++				syslog(LOG_DEBUG, "upcall_target=mount");
> ++			} else if (strncmp(tkn + 14, "app", 3) == 0) {
> ++				arg->upcall_target = UPTARGET_APP;
> ++				syslog(LOG_DEBUG, "upcall_target=app");
> ++			} else {
> ++				// Should never happen
> ++				syslog(LOG_ERR, "Invalid upcall_target value: %s, defaulting to app",
> ++				       tkn + 14);
> ++				arg->upcall_target = UPTARGET_APP;
> ++				syslog(LOG_DEBUG, "upcall_target=app");
> ++			}
> ++			arg->have |= DKD_HAVE_UPCALL_TARGET;
> + 		}
> + 		if (pos == NULL)
> + 			break;
> +@@ -1440,15 +1474,20 @@ int main(const int argc, char *const argv[])
> + 	 * acceptably in containers, because we'll be looking at the correct
> + 	 * filesystem and have the correct network configuration.
> + 	 */
> +-	rc = switch_to_process_ns(arg->pid);
> +-	if (rc == -1) {
> +-		syslog(LOG_ERR, "unable to switch to process namespace: %s", strerror(errno));
> +-		rc = 1;
> +-		goto out;
> ++	if (arg->upcall_target == UPTARGET_APP || arg->upcall_target == UPTARGET_UNSPECIFIED) {
> ++		syslog(LOG_INFO, "upcall_target=app, switching namespaces to application thread");
> ++		rc = switch_to_process_ns(arg->pid);
> ++		if (rc == -1) {
> ++			syslog(LOG_ERR, "unable to switch to process namespace: %s", strerror(errno));
> ++			rc = 1;
> ++			goto out;
> ++		}
> ++		if (trim_capabilities(env_probe))
> ++			goto out;
> ++	} else {
> ++		syslog(LOG_INFO, "upcall_target=mount, not switching namespaces to application thread");
> + 	}
> + 
> +-	if (trim_capabilities(env_probe))
> +-		goto out;
> + 
> + 	/*
> + 	 * The kernel doesn't pass down the gid, so we resort here to scraping
> +@@ -1495,7 +1534,7 @@ int main(const int argc, char *const argv[])
> + 	 * look at the environ file.
> + 	 */
> + 	env_cachename =
> +-		get_cachename_from_process_env(env_probe ? arg->pid : 0);
> ++		get_cachename_from_process_env((env_probe && (arg->upcall_target == UPTARGET_APP)) ? arg->pid : 0);
> + 
> + 	rc = setuid(uid);
> + 	if (rc == -1) {
> diff --git a/meta-networking/recipes-support/cifs/cifs-utils_7.0.bb b/meta-networking/recipes-support/cifs/cifs-utils_7.0.bb
> index c78bbae7b8..4e27491bba 100644
> --- a/meta-networking/recipes-support/cifs/cifs-utils_7.0.bb
> +++ b/meta-networking/recipes-support/cifs/cifs-utils_7.0.bb
> @@ -5,7 +5,9 @@ LICENSE = "GPL-3.0-only & LGPL-3.0-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>  
>  SRCREV = "316522036133d44ed02cd39ed2748e2b59c85b30"
> -SRC_URI = "git://git.samba.org/cifs-utils.git;branch=master"
> +SRC_URI = "git://git.samba.org/cifs-utils.git;branch=master \
> +           file://CVE-2025-2312.patch \
> +"
>  
>  S = "${WORKDIR}/git"
>  DEPENDS += "libtalloc"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123279): https://lists.openembedded.org/g/openembedded-devel/message/123279
> Mute This Topic: https://lists.openembedded.org/mt/117172363/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


