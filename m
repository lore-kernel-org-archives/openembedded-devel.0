Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C794810A62C6
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 12:59:06 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47543.1774529937184122618
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 05:58:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=V9mXdFm4;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439d8df7620so661718f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 05:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774529935; x=1775134735; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cR8mG/Q8MzjaN35q2oCDKfbCh0PkvfXLL3w2cJvKDfQ=;
        b=V9mXdFm4BkPxPuL2FwUy4sYxaDZGMKWVF8LWoIdUzA3tmg2wy29jPheAhwgu+plKRy
         N0CRdECoLxz6EovyIFyMbQApY+vNrWhFcxAehnycWJdpQ657eoyt/fUjGua4DhjfxzBj
         bvUyhU4tmnuGaFzy6+bcL2s/HAAqY5OC/0vD4kmOm4edtXIhq68fcctywtHe3mVLLQzS
         KU8uLxVkJBhv9R2B0BNr8mPyTjjv4F55ZR5vzGHxnZ1R+1P3Ijo+hDuubhSJHUDOUKhh
         CKA1DgiGPQQLp3BcMfH7uLRG/AMf4N5WXuVDrA76IqxXz9wuxuQSn8HyHInwyIuZdfpl
         qrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774529935; x=1775134735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cR8mG/Q8MzjaN35q2oCDKfbCh0PkvfXLL3w2cJvKDfQ=;
        b=DPP6hC6zeXrMGrviXrGaz27tOblsi14/j/odLJwp7qH6gpms5m6yba3yeUqQw/wWJp
         pLwxgUmw/3XNIcbwU6X5bxS5b7XLNxEruxTVOzxs3uCPNHmq+MOA+s9rh1FqqZf/QXuH
         h19i2YZm+oryO8yTYI8QrmVd4gEjYwJXJh+WzW6K9lLY9UJVMSeJ1sq8uGhpRwHjHfsX
         GV/Zxg5t4vzPv5ijtqJDJtBz3oeAr/nexKsKpHdVgLI7/v+twHROkQ4gCoW2yQTcR65V
         LnAtNrZN/99DrbbpQer/S+j2TArw05SSYS0pnDUwuQ5Jyl1KR529kr5XphD0ulwkPPI7
         Ihnw==
X-Forwarded-Encrypted: i=1; AJvYcCX6DLZF/5Drwe0rkKYr5EPdz6XZIy3qxp39HFZH+/dOLCizq88Pbx0sl54jPbstclHJJD1uFgE2Huvw0ZnaNbieRL8=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzFbB/sjOiGQZGaeQt6hTfHR5rxEV34L4heAOZS3PiSZvUHcg/z
	RX0wTdfO/Lsau/2m9GwxMdEkUfNJUEk/qzcd1u2NwAkvFOv5KT5Alve8/S5mTA==
X-Gm-Gg: ATEYQzzESnSUUe/mAn50oBxRwyrCwb0tQiTuTCkDgAYj1OGiqpyzRzbLmf9/7HSrg6Q
	a2PAsZdNfb1HA/8KKnrm3jwu+NgD+CqO7uQ83bhj5gFuSc8NUvLZ9vx7PLq8gBLKu9u1Xc+jkCz
	RqDroQQH0eUXugunmGprmHGSavQTLFxm1C8Nuneujs6KwQNUAnkO3R3uMd99U0I5icelH1nZ7cH
	jHxvjOthsIEiofT0QNqmCf7aEC+flj+pFVA2jFzVGDOk//svEzSA+wC0w24NXjW3IN8edZeokFs
	36ZMp2m7JinRmRo8T2z/EuME+pjh6gHjWOJKqmGkT9JIPVkXpkU/5SzHGn1FMDTubSo/2AeswH2
	h3oyxGaJKF4fomGMC3LwqmJIMLOVbZhjvwPsuVcm0LMied5Hqo2C5bTRsWSCONm4yNIpMsE9fKo
	AWBylz05RNo+1HIYht3v9Mr7PrPgDll18=
X-Received: by 2002:a5d:44c3:0:b0:43b:8fa4:1937 with SMTP id ffacd0b85a97d-43b8fa41a01mr6106111f8f.5.1774529934949;
        Thu, 26 Mar 2026 05:58:54 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf5aesm8809608f8f.24.2026.03.26.05.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 05:58:54 -0700 (PDT)
Message-ID: <3ac55d19-3f24-4578-a6d1-38f3f031e6a5@gmail.com>
Date: Thu, 26 Mar 2026 13:58:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][kirkstone][PATCH] libssh: Fix CVE-2026-0966
To: Vijay Anusuri <vanusuri@mvista.com>,
 openembedded-devel@lists.openembedded.org
References: <20260325124141.142149-1-vanusuri@mvista.com>
 <CANQUz1-hx-EMd29DGk4_SiU6G5xN9C1e+SxNC68MgFNzLW4hwA@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CANQUz1-hx-EMd29DGk4_SiU6G5xN9C1e+SxNC68MgFNzLW4hwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 12:59:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125721

On 3/26/26 12:28, Vijay Anusuri wrote:
> Hi Team,
> 
> Just checking in—do we have any updates on this?
> 
> I wasn’t able to find it in meta-openembedded-contrib.
> 

It is queued up now in the repo, thanks.


> Thanks & Regards,
> 
> Vijay
> 
> 
> 
> 
> On Wed, Mar 25, 2026 at 6:11 PM <vanusuri@mvista.com
> <mailto:vanusuri@mvista.com>> wrote:
> 
>     From: Vijay Anusuri <vanusuri@mvista.com <mailto:vanusuri@mvista.com>>
> 
>     Pick commits according to [1]
> 
>     [1] https://security-tracker.debian.org/tracker/CVE-2026-0966
>     <https://security-tracker.debian.org/tracker/CVE-2026-0966>
>     [2] https://www.libssh.org/security/advisories/CVE-2026-0966.txt
>     <https://www.libssh.org/security/advisories/CVE-2026-0966.txt>
> 
>     Skip the test commit as it's not applicable in libssh-0.8.9
> 
>     Signed-off-by: Vijay Anusuri <vanusuri@mvista.com
>     <mailto:vanusuri@mvista.com>>
>     ---
>      .../libssh/libssh/CVE-2026-0966-1.patch       | 38 ++++++++++++
>      .../libssh/libssh/CVE-2026-0966-2.patch       | 62 +++++++++++++++++++
>      .../recipes-support/libssh/libssh_0.8.9.bb <http://
>     libssh_0.8.9.bb>    |  2 +
>      3 files changed, 102 insertions(+)
>      create mode 100644 meta-oe/recipes-support/libssh/libssh/
>     CVE-2026-0966-1.patch
>      create mode 100644 meta-oe/recipes-support/libssh/libssh/
>     CVE-2026-0966-2.patch
> 
>     diff --git a/meta-oe/recipes-support/libssh/libssh/
>     CVE-2026-0966-1.patch b/meta-oe/recipes-support/libssh/libssh/
>     CVE-2026-0966-1.patch
>     new file mode 100644
>     index 0000000000..a645282afd
>     --- /dev/null
>     +++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-1.patch
>     @@ -0,0 +1,38 @@
>     +From 6ba5ff1b7b1547a59f750fbc06b89737b7456117 Mon Sep 17 00:00:00 2001
>     +From: Jakub Jelen <jjelen@redhat.com <mailto:jjelen@redhat.com>>
>     +Date: Thu, 8 Jan 2026 12:09:50 +0100
>     +Subject: [PATCH] CVE-2026-0966 misc: Avoid heap buffer underflow in
>     ssh_get_hexa
>     +
>     +Signed-off-by: Jakub Jelen <jjelen@redhat.com
>     <mailto:jjelen@redhat.com>>
>     +Reviewed-by: Pavol Žáčik <pzacik@redhat.com <mailto:pzacik@redhat.com>>
>     +(cherry picked from commit 417a095e6749a1f3635e02332061edad3c6a3401)
>     +
>     +ssh_get_hexa function not present in misc.c. It was in dh.c file in
>     +older libssh versions.
>     +
>     +ssh_get_hexa function moved from dh.c from misc.c by the below commit
>     +https://git.libssh.org/projects/libssh.git/commit/?
>     id=43a4f86b6e14a907b3a298d10d5cd7efb59f6a09 <https://git.libssh.org/
>     projects/libssh.git/commit/?id=43a4f86b6e14a907b3a298d10d5cd7efb59f6a09>
>     +
>     +Upstream-Status: Backport [https://git.libssh.org/projects/
>     libssh.git/commit/?id=6ba5ff1b7b1547a59f750fbc06b89737b7456117
>     <https://git.libssh.org/projects/libssh.git/commit/?
>     id=6ba5ff1b7b1547a59f750fbc06b89737b7456117>]
>     +CVE: CVE-2026-0966
>     +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com
>     <mailto:vanusuri@mvista.com>>
>     +---
>     + src/dh.c | 2 +-
>     + 1 file changed, 1 insertion(+), 1 deletion(-)
>     +
>     +diff --git a/src/dh.c b/src/dh.c
>     +index 7116d1dc..321aeba6 100644
>     +--- a/src/dh.c
>     ++++ b/src/dh.c
>     +@@ -1486,7 +1486,7 @@ char *ssh_get_hexa(const unsigned char *what,
>     size_t len) {
>     +   size_t i;
>     +   size_t hlen = len * 3;
>     +
>     +-  if (len > (UINT_MAX - 1) / 3) {
>     ++  if (what == NULL || len < 1 || len > (UINT_MAX - 1) / 3) {
>     +     return NULL;
>     +   }
>     +
>     +--
>     +2.25.1
>     +
>     diff --git a/meta-oe/recipes-support/libssh/libssh/
>     CVE-2026-0966-2.patch b/meta-oe/recipes-support/libssh/libssh/
>     CVE-2026-0966-2.patch
>     new file mode 100644
>     index 0000000000..9a035dbc1e
>     --- /dev/null
>     +++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-2.patch
>     @@ -0,0 +1,62 @@
>     +From 3e1d276a5a030938a8f144f46ff4f2a2efe31ced Mon Sep 17 00:00:00 2001
>     +From: Jakub Jelen <jjelen@redhat.com <mailto:jjelen@redhat.com>>
>     +Date: Thu, 8 Jan 2026 12:10:44 +0100
>     +Subject: [PATCH] CVE-2026-0966 doc: Update guided tour to use
>     SHA256 fingerprints
>     +
>     +Signed-off-by: Jakub Jelen <jjelen@redhat.com
>     <mailto:jjelen@redhat.com>>
>     +Reviewed-by: Pavol Žáčik <pzacik@redhat.com <mailto:pzacik@redhat.com>>
>     +(cherry picked from commit 1b2a4f760bec35121c490f2294f915ebb9c992ae)
>     +
>     +Upstream-Status: Backport [https://git.libssh.org/projects/
>     libssh.git/commit/?id=3e1d276a5a030938a8f144f46ff4f2a2efe31ced
>     <https://git.libssh.org/projects/libssh.git/commit/?
>     id=3e1d276a5a030938a8f144f46ff4f2a2efe31ced>]
>     +CVE: CVE-2026-0966
>     +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com
>     <mailto:vanusuri@mvista.com>>
>     +---
>     + doc/guided_tour.dox | 10 ++++------
>     + 1 file changed, 4 insertions(+), 6 deletions(-)
>     +
>     +diff --git a/doc/guided_tour.dox b/doc/guided_tour.dox
>     +index 008ccb4e..bdd7489c 100644
>     +--- a/doc/guided_tour.dox
>     ++++ b/doc/guided_tour.dox
>     +@@ -190,7 +190,6 @@ int verify_knownhost(ssh_session session)
>     +     ssh_key srv_pubkey = NULL;
>     +     size_t hlen;
>     +     char buf[10];
>     +-    char *hexa = NULL;
>     +     char *p = NULL;
>     +     int cmp;
>     +     int rc;
>     +@@ -201,7 +200,7 @@ int verify_knownhost(ssh_session session)
>     +     }
>     +
>     +     rc = ssh_get_publickey_hash(srv_pubkey,
>     +-                                SSH_PUBLICKEY_HASH_SHA1,
>     ++                                SSH_PUBLICKEY_HASH_SHA256,
>     +                                 &hash,
>     +                                 &hlen);
>     +     ssh_key_free(srv_pubkey);
>     +@@ -217,7 +216,7 @@ int verify_knownhost(ssh_session session)
>     +             break;
>     +         case SSH_KNOWN_HOSTS_CHANGED:
>     +             fprintf(stderr, "Host key for server changed: it is
>     now:\n");
>     +-            ssh_print_hexa("Public key hash", hash, hlen);
>     ++            ssh_print_hexa(SSH_PUBLICKEY_HASH_SHA256, hash, hlen);
>     +             fprintf(stderr, "For security reasons, connection will
>     be stopped\n");
>     +             ssh_clean_pubkey_hash(&hash);
>     +
>     +@@ -238,10 +237,9 @@ int verify_knownhost(ssh_session session)
>     +             /* FALL THROUGH to SSH_SERVER_NOT_KNOWN behavior */
>     +
>     +         case SSH_KNOWN_HOSTS_UNKNOWN:
>     +-            hexa = ssh_get_hexa(hash, hlen);
>     +             fprintf(stderr,"The server is unknown. Do you trust
>     the host key?\n");
>     +-            fprintf(stderr, "Public key hash: %s\n", hexa);
>     +-            ssh_string_free_char(hexa);
>     ++            fprintf(stderr, "Public key hash: ");
>     ++            ssh_print_hash(SSH_PUBLICKEY_HASH_SHA256, hash, hlen);
>     +             ssh_clean_pubkey_hash(&hash);
>     +             p = fgets(buf, sizeof(buf), stdin);
>     +             if (p == NULL) {
>     +--
>     +2.25.1
>     +
>     diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb <http://
>     libssh_0.8.9.bb> b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
>     <http://libssh_0.8.9.bb>
>     index a1fc64446c..8cc0883b2b 100644
>     --- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb <http://
>     libssh_0.8.9.bb>
>     +++ b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb <http://
>     libssh_0.8.9.bb>
>     @@ -29,6 +29,8 @@ SRC_URI = "git://git.libssh.org/projects/
>     libssh.git;protocol=https;branch=stable <http://git.libssh.org/
>     projects/libssh.git;protocol=https;branch=stable>
>                 file://CVE-2025-8277-3.patch \
>                 file://CVE-2025-8114.patch \
>                 file://CVE-2026-3731.patch \
>     +           file://CVE-2026-0966-1.patch \
>     +           file://CVE-2026-0966-2.patch \
>                "
>      SRCREV = "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
> 
>     -- 
>     2.25.1
> 


