Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15160.1794913092086369083
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 02:58:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=hmS57h62;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so9912125e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 02:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794913090; x=1795517890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xaTi8NVNpP6azWslEk27unrtSLty90UkHWARduMTLiE=;
        b=hmS57h62XJJ+pjuN5PmFd2MIuRpo8AMHqMYzxjauOsFo9yKmNRJBrAlb/53cgfSovd
         O39kofJ9aaRV9IC/prJ2LJQzzz8YxinbHVsGSfUckqcjXRGtvGwKSQ+Xr/gFyaHKTGTl
         RJg6INtX0dj6a02+KFfGWZ4HgfCOcePF91DVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913090; x=1795517890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xaTi8NVNpP6azWslEk27unrtSLty90UkHWARduMTLiE=;
        b=rzcKwqGXRIOWWC3JixiuMyj1LGMRavq+Kb3NUuE/4Swmfk5Phix+BCPGrxA6LoCOJH
         UlVP3DK139iZf7cpEG/ZCkFKMKjP5sq9EduwKxKTDmFNLxNo97xMnyZUBHZ8XTjrJYSl
         xeH34gH+sEpPdKg1PnVwRNIPQ7Koz92tcHFRcQZb8v4IbVpBA6nLZD5PKkwk6wFfaDQu
         rubjvNMEdHFW6SdFhmCPjH4HwrJm61mQsdjDmKApHxsMOUVX/dNZLrwPTwqbPW3jideN
         iu1OUeRVSxgEVULyQUpNqkmYPUWJb1Q9DuiEIHSjovTPctoU2Whyu2NxTuLvdb9JJq6e
         pLVg==
X-Gm-Message-State: APuU4Z/Tf3RKJ0TcKsZN/MEbJ5Z3pIf2QHFEqNq/QA3pZbyMXffmuYvv
	vzSWowiMB1oNjaJw/QKsuj1/w+ZljJFSFSRx+hKkg9T1YFVnM01SeFYMmHjQZOFm/Flu8ZMI+Tl
	XSm2Y
X-Gm-Gg: AYBFou1DQfOLAm7B7DmNsdyfGq1sT5Y31xlZwItHalf90t8FyT++XvX0YQreafPFskK
	VCHTFOcnpSIr1W91S7Fi9pXi4vDqZh33pgUU808ae/HdS37P+Eqifg36iqZMm5tP7xtIpLXT3l1
	9BJ7yrK1WLdPY+2OiMVkMchyVEGzWBD3eHam27vBU0Kf9OcJav4fIyejD9Q1SgIhOfws51MWstc
	dZIbGy/H8i5TOd6cYHvNQbYzzkvIvU1FkTP0b6C/d1/PMGM20lH2oiYSO6zTWv9rbvqu9HP15XK
	zmpORazgb2vtXKjVFPuOPkds/HFuUq5McwNc0S0YncCrgRrT/UcffJG7634tpIDYGHjcGJgxQOK
	DtS/OdoJpC1gEA9oJO/OKVE8nDZ38uYH3GOKJDcaGXticzQAsQ2kdgP27sDpVlvxMBMlBu3Pg0g
	KYtjt7TSIBC8vMomrnHRfgW5K9XgTu8auJBMtIe5ojFgVu6H9nkhiipcdCqu+PwxUbVCnJttSAY
	RCyggIrOnC+Lvm7hnrHJ2OH6pzlL/1sPhE3cGt2HKWMKDQl1SSLSh3l5tIHgWcmPO0mBnau6dkT
	JZGtBLRcsOG7H0LfRq9LlQWDw/l/ZlhfpdwdzsNKeWB6PdaGi0TcvDuoSPypAAVJMc5/k2GE0tj
	fIEBRLUAXAx2b9mbHkBP00S5Yhdczhq2oCHQBCPnOl3RzrRSfJ6wzSSEvFNzLYPqfXB6gmdT8Ew
	Y=
X-Received: by 2002:a05:600c:4584:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb7837a4b9mr48050455e9.7.1794913090346;
        Tue, 17 Nov 2026 02:58:10 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9426asm20454455e9.4.2026.11.17.02.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:58:09 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-filelock: Upgrade 4.2.10 -> 4.2.11
Date: Tue, 17 Nov 2026 12:58:04 +0200
Message-ID: <20261117105804.3937460-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117105804.3937460-1-leon.anavi@konsulko.com>
References: <20261117105804.3937460-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 10:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132582
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.2.11:

Bug fixes:

- AsyncStrictSoftFileLock with a poll_interval below 0.05 seconds
  now spreads contended retries across a jittered, widening window
  like StrictSoftFileLock, instead of a fixed interval.
- SoftReadWriteLock on runtimes without dir_fd other than Windows,
  such as GraalPy, now refuses a protocol directory another account
  owns under a sticky parent, as the other platforms already do.
- A SoftFileLease garbage collected on its own heartbeat thread no
  longer deadlocks that thread, which left every later os.fork() in
  the process waiting forever.
- A lock dropped during interpreter shutdown, including a
  ReadWriteLock or AsyncReadWriteLock, no longer prints an ignored
  exception at exit.
- A lock still referenced when the interpreter exits is released
  from an atexit handler before module teardown, except holds of
  daemon threads that are still running, and a thread_local=False
  lock while any other thread runs.
- On Windows, lock paths that differ only in drive letter or UNC
  share case, such as C:\work.lock and c:\work.lock, now share one
  FileLock or SoftReadWriteLock singleton and trigger FileLock's
  same-thread deadlock detection.
- Releasing a soft lock whose marker a peer replaced no longer
  raises AttributeError on GraalPy, which lacks os.pwrite.
- os.fork() no longer waits forever for a lock transition another
  thread never finishes; after 30 seconds the child exits with
  status 70 and the parent continues.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-filelock_4.2.10.bb => python3-filelock_4.2.11.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_4.2.10.bb => python3-filelock_4.2.11.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_4.2.10.bb b/meta-python/recipes-devtools/python/python3-filelock_4.2.11.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-filelock_4.2.10.bb
rename to meta-python/recipes-devtools/python/python3-filelock_4.2.11.bb
index 0e10014d6a..47385e72fb 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_4.2.10.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_4.2.11.bb
@@ -9,7 +9,7 @@ CVE_PRODUCT = "tox-dev:filelock"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "fcc3c0cb8bfe7f4b3bb0e231c04b15dbad068cb3c2515f343d8fde4dce93bd5d"
+SRC_URI[sha256sum] = "0cb84119fb8dce17898e1f69c974d5019daa59c4d7656be390a5fa59ccced912"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.3

