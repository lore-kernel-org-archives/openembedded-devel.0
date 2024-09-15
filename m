Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB81C3ABA2
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 17:53:24 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.119303.1726422795376464824
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Sep 2024 10:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K76ixsqn;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42cba8340beso29387315e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 10:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726422793; x=1727027593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BbpfvpfMIVfkUDHoXZHv4ZeKuzkCE57NYk3YBYHWPxc=;
        b=K76ixsqnZJ8WmZQCBVS9DM8EAyP/F4xN/xSW3maMl6DB0Xje9d9YJX/tD2bZrtMK9X
         7jfDKoMs7c1/tQkmbU1L3Y8I8nUAaYMoVV7kVnMSguRaHd8b3HDgR9U+V5HzuKeWW1ZL
         cFTYax2beT2qDMMIRSbFW/mL53xzXlQBQMLcbJhz/VTDMY86EDQF/9bL9Q6rER6NRHsI
         OTkNpXBlXZfWbzmWuI5HW1fQYpbhtOrdUDy8uf/mZNikcwVOARSd2K8uk40zKIZZ7jTh
         ym7sKQ/3sFTVpBkHNIBICdhYfDmu15vlx82y6smIPD2aXCullCFoB7+NCJlvT63FOl14
         seSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726422793; x=1727027593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BbpfvpfMIVfkUDHoXZHv4ZeKuzkCE57NYk3YBYHWPxc=;
        b=Rvj7DlBHGvhElKdt98GP5CXXoLs3kqgrUmJruQRPO7ADLSfJGQMAG0kyOj2uowb5iP
         Gk4O5kWQa7F2qEld+Z53nYmbS+r+43byg1YxXofeeNaDt3U0TiPDOJhPlu8eOVmowkSe
         NF8VS/bxHrtWD5eitoS0O5qcV4YlZHXqjWHVUmY7wBowr76AQA8TdYDGx9kP8hMbSK5q
         IBkkY/iyKEIgQ0//yTObLGICK+hj0DEm9nLXG6pIUlVf68XiFCcbjXegMIP985ny2+Az
         1yOIzlKernXltJC37FVIHPfdbFAr+AXoVJA8eF7ZWBVNmh3JmWNpBVtKwI6QFcWjHzId
         Hnsg==
X-Gm-Message-State: AOJu0YwxfGICAe4q3xT2cEPmMo5lHhFhSV/5LVXItbdZcr3HLNhFlzVn
	kowycC1J0ANkSprdvsn5DJCwsVQzhOA17QvKfLFffsppMd6QeFpfQZMTKA==
X-Google-Smtp-Source: AGHT+IGxP6Gfj3ySBQGwUpg5U0neZpjNRAmTzLDUqP18b0S5HCT+KSYnH81HjmICdF/F4U1QM3HirA==
X-Received: by 2002:a05:6000:20c3:b0:378:c6d5:e2b3 with SMTP id ffacd0b85a97d-378c6d5e608mr7840046f8f.23.1726422792567;
        Sun, 15 Sep 2024 10:53:12 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da242736bsm53897005e9.40.2024.09.15.10.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 10:53:11 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [PATCH 0/1] RFC: some issues with go?
Date: Sun, 15 Sep 2024 19:53:04 +0200
Message-Id: <20240915175305.3390769-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 17:53:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112309

Could someone review this patch that enables the Go-based plugins of Netdata?

I tested it in QEMU with the Go example package enable locally.

I have this error when building the image (with Kas)
----------------------------------------------------

 NOTE: Executing Tasks
 NOTE: Tasks Summary: Attempted 5371 tasks of which 5341 didn't need to be rerun and all succeeded.
 NOTE: Writing buildhistory
 NOTE: Writing buildhistory took: 2 seconds
 Exception ignored in: <function SetupHome.__del__ at 0x7fe2f82682c0>
 Traceback (most recent call last):
   File "/usr/local/lib/python3.11/dist-packages/kas/libcmds.py", line 166, in __del__
     shutil.rmtree(self.tmpdirname)
   File "/usr/lib/python3.11/shutil.py", line 732, in rmtree
     _rmtree_safe_fd(fd, path, onerror)
   File "/usr/lib/python3.11/shutil.py", line 660, in _rmtree_safe_fd
     _rmtree_safe_fd(dirfd, fullname, onerror)
   File "/usr/lib/python3.11/shutil.py", line 660, in _rmtree_safe_fd
     _rmtree_safe_fd(dirfd, fullname, onerror)
   File "/usr/lib/python3.11/shutil.py", line 660, in _rmtree_safe_fd
     _rmtree_safe_fd(dirfd, fullname, onerror)
   [Previous line repeated 2 more times]
   File "/usr/lib/python3.11/shutil.py", line 683, in _rmtree_safe_fd
     onerror(os.unlink, fullname, sys.exc_info())
   File "/usr/lib/python3.11/shutil.py", line 681, in _rmtree_safe_fd
     os.unlink(entry.name, dir_fd=topfd)
 PermissionError: [Errno 13] Permission denied: 'rounder_example_test.go'

Workaround for network access
-----------------------------

I there a way to avoid the 'do_compile[network] = "1"'.  It seems to be
needed to fetch the Go packages specified in the go.mod file.


INSAGE_SKIP
-----------

How to avoid the QA error/warning `already-stripped`?

  ERROR: netdata-1.47.1-r0 do_package: QA Issue: File '/usr/libexec/netdata/plugins.d/go.d.plugin' from netdata was already stripped, this will prevent future debugging! [already-stripped]
  ERROR: netdata-1.47.1-r0 do_package: Fatal QA errors were found, failing task.



Jan Vermaete (1):
  netdata: enable Go-based plugins

 .../recipes-webadmin/netdata/netdata_1.47.1.bb  | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

-- 
2.39.2


