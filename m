Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 605B3C4708D
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 19:01:42 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.141552.1672081298956050767
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 11:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g3x349mi;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id jr11so9011470qtb.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 11:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uDYwzjtDs5cvYByn+suH6Bj+21cvyTBMIHw5ys4fqI=;
        b=g3x349mia91BNrsL4XTb0+ZXlmdQ/AzHYfzFBybknVWQDPeosWeYCANrOhwg6TyvzO
         pEcQv0kBK0Z3czJjfY2tiGm7G7GdOZN4qhij767ZdQ4bGGr5DEaGKkdHL1zTj+MG1nbI
         auN2mu/aqcG6tad61k70ghA7mW5ariHsR6Pv3AbjcyAJxjeryzxYQYw9QoGJ3Gm1ACSm
         JHcXDUSwlfT3hjnBk6xpR7tPEyJN8xoKrdkdLKPOM7qXZHJ/wLU2eAJimYPhXrmJK00K
         kg9QbvrKNzL+6VMUVhseFY+Nm8UDQxtrbtn1Sd6GuCXY2Mcf4LuULq6ay4Ejb+sCVFND
         sFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0uDYwzjtDs5cvYByn+suH6Bj+21cvyTBMIHw5ys4fqI=;
        b=j81xWyioyamhbRH9Lvi/G+uP74L40ThqQGORfkp2QES3mCod51+FxnnbonimcaY+Zv
         0stpKCu73OiCME+K7Bu9topzjwUSMsrjmy21c/dCmY8hFmWQ38JPu0jlBNxEarYBdy6U
         zSHyTxG70otO1Za8dcbtrH+jlrWGxr2NNdtC4W82/qKF3Ra8HZ+Rc8U9VYzBu/fLIiDm
         aArFyqwahXqW3+tFZ9/ouRFzFoj0IXULOTt9ChidEFF3IynmDlwipVUJ+hvhgTj5Cuqi
         e1vVm590tUOj1x40n6faPjeR3S2kD3rsHn+TuLSzmhgQpJ432QvCszLoxylCIEzZpenn
         MAEw==
X-Gm-Message-State: AFqh2kqZGGNv0yDaPvUTm+7BlQoZYDs+YR4TIdMCZnK/kJHR98+j2lSO
	Ck5MVMA0lotXEvqpzMxDxrw=
X-Google-Smtp-Source: AMrXdXtZgk0GXsV9Y7EX6/1cEE+4ztb9OFcuEUks4IdqSt8pemewbxFNa+UTYD1lsNMQ38l4yTJJZA==
X-Received: by 2002:ac8:7181:0:b0:3a8:313f:ec66 with SMTP id w1-20020ac87181000000b003a8313fec66mr23787105qto.58.1672081297901;
        Mon, 26 Dec 2022 11:01:37 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:9c43:eae7:4345:816a? ([2600:1700:9190:ba10:9c43:eae7:4345:816a])
        by smtp.gmail.com with ESMTPSA id d18-20020ac847d2000000b0039cc82a319asm7059105qtr.76.2022.12.26.11.01.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Dec 2022 11:01:37 -0800 (PST)
Message-ID: <f2a94bfe-2971-b281-e06c-cfe2303b846c@gmail.com>
Date: Mon, 26 Dec 2022 14:01:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: Dunfell merge request: Dec 26th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 19:01:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100242

The following changes since commit 7203130ed8b58c0df75cb72222ac2bcf546bce44:

   [dunfell] wireguard: Upgrade to 1.0.20220627 (module) and 
1.0.20210914 (tools) (2022-10-30 14:47:43 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to 7952135f650b4a754e2255f5aa03973a32344123:

   postgresql: Fix CVE-2022-2625 (2022-12-11 16:01:15 -0500)

----------------------------------------------------------------
Hitendra Prajapati (2):
       nginx: CVE-2022-41741, CVE-2022-41742 Memory corruption in the 
ngx_http_mp4_module
       postgresql: Fix CVE-2022-2625

Ivan Stepic (1):
       flatbuffers: adapt for cross-compilation environments

Omkar Patil (1):
       ntfs-3g-ntfsprogs: Upgrade 2022.5.17 to 2022.10.3

Ranjitsinh Rathod (1):
       strongswan: Fix CVE-2022-40617

  ...3g-ntfsprogs_2022.5.17.bb => ntfs-3g-ntfsprogs_2022.10.3.bb} |   2 +-
  .../recipes-support/strongswan/files/CVE-2022-40617.patch       | 210 
+++++++
  meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb  | 1 +
  meta-oe/recipes-dbs/postgresql/files/CVE-2022-2625.patch        | 904 
++++++++++++++++++++++++++++
  meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb               | 1 +
  meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb      | 7 +-
  .../nginx/files/CVE-2022-41741-CVE-2022-41742.patch             | 319 
++++++++++
  meta-webserver/recipes-httpd/nginx/nginx_1.16.1.bb              | 4 +-
  8 files changed, 1445 insertions(+), 3 deletions(-)
  rename 
meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntfsprogs_2022.5.17.bb 
=> ntfs-3g-ntfsprogs_2022.10.3.bb} (95%)
  create mode 100644 
meta-networking/recipes-support/strongswan/files/CVE-2022-40617.patch
  create mode 100644 
meta-oe/recipes-dbs/postgresql/files/CVE-2022-2625.patch
  create mode 100644 
meta-webserver/recipes-httpd/nginx/files/CVE-2022-41741-CVE-2022-41742.patch


