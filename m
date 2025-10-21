Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DB0CCD1A7
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 14:54:05 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.14088.1761058435152927774
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 07:53:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=So1Lhczi;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4710683a644so50839485e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 07:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761058433; x=1761663233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Isp9raybpiyJOO6fQJjogP8mlipCMDqENPbA5l3OQSU=;
        b=So1Lhczi7kar2yoVEVPIaFPumWazdm9ITxkEXMHiNmRfjbj+bGJJz211J5t5nHeEMa
         YIy3tNZN5xBtTacgl1ZCw6Ps6AAzCtXe+RAJFfBhPGO6GFlNQ1GkVkcrTkV68/kq8V1i
         MQYZVqP8n4ycNdoCid0RSzzasgKkCjjDdWkAGtZpYytvhLp8/yQCvRfcvTK63orNIi1y
         g9zvz3/4PU2Azm2jOKrkU4RdQ7dUAtiFQmqeX8OwY6q2pWI3UP0NhcLzQiXT3u0Ggflx
         okBjUbM0Y6xCHLE6bUGciypMrdt8QWGtGtGvNrlRLhBaxA7AVUJgL5j/Ca/FLaerR2Uf
         5hmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761058433; x=1761663233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Isp9raybpiyJOO6fQJjogP8mlipCMDqENPbA5l3OQSU=;
        b=h8ERTietUYNtdGX57DZnBl47eFFdryAxIvDDQm2TkpKnmRf2DUHiwb8WfSBSWQVkE2
         wGqPbev1221wEP/NlIM8U0I846RbJ68QVMQbd+qYPbOrTvfZYD4kYE2T0lgD5rdPk+dB
         2u+n6R7eVfFb/mO5m89jO/IBwGPhMQm3fG6iE/9pb4QLpGDfeJaqk0IdY/DOa45Pym2L
         ARegeNUwmR6mqEsvFy9OdE4HetzFtgC+Ts8f38rcQkY4CYLpWLk2kdHW/O9J7yPb8jN/
         8xnnuK6dyiqfSKwnd6KJS6i57wts7/3RJ6QTWpuG0UOzok0VqgijIS0l63WxtwStYqTB
         cwNQ==
X-Gm-Message-State: AOJu0YyAkQ6mnyT9N2Db3fG3UWlCbUiiYYHIJD1DlTTWdDJiECm87H1e
	/lMsqsgnB/Z4VnXtognrK7CnmdNx7oM5SPkCXLYrGldyyHSWV6gf+iCHJ4PMTg==
X-Gm-Gg: ASbGncvwced7qgIEgodr/5cOIDUYZ6A0B4paDTNgjWULSQ8siQh7h4b8zUy5hJNljkI
	w3OIP4Ok3PvPjDE0w1tHpA+tygmtQ09oo44vbvC6Zh0Uh+cGBXinrVer7s7vRRpfi5hVrjg/QgT
	9mQ6AXhmSdPZ7NbM5eHPnNDAvuGsFh/rrGBVyDvdVBSJ4vE0V+ndSLVn/k1PRurGuIKKgUpJ3Am
	lVPi27vY0QQ260oeTQq++NZQI+zjmIcQTXNYG0sXAQHs3+1qNEnHBNE1FxTboX3p7op9QzJt3xp
	3jERhKTygkdf40rTeUeBFMNwsMzm0mxuyqFh0zBTIDkb58iigpdHTYZzfh9LEJYPuQWm7Q4S1LR
	dHUwVXsOz921Us3T7aEOO57IC6nUx3Z0YTqgV4MWYOc9HEvoyeWVP+phXObiykMyaiaLR1Z1qZg
	==
X-Google-Smtp-Source: AGHT+IHSirr+tZH1eOYNfAmctvbaKVtJsxMS1N4y0d34CPyRkWUyyiQTRQzTUy7jYq8Q/RNqtMJ1qw==
X-Received: by 2002:a05:600c:3115:b0:471:846:80ac with SMTP id 5b1f17b1804b1-475c3eeaf1amr59695e9.18.1761058433086;
        Tue, 21 Oct 2025 07:53:53 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144b5c91sm283259535e9.11.2025.10.21.07.53.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 07:53:52 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 4/4] renderdoc: patch CVE-2023-33863, CVE-2023-33864 and CVE-2023-33865
Date: Tue, 21 Oct 2025 16:53:48 +0200
Message-ID: <20251021145349.33878-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251021145349.33878-1-skandigraun@gmail.com>
References: <20251021145349.33878-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 14:54:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120838

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-33863
https://nvd.nist.gov/vuln/detail/CVE-2023-33864
https://nvd.nist.gov/vuln/detail/CVE-2023-33865

Take the patches mentioned from the original researcher's report[1]

[1]: https://www.qualys.com/2023/06/06/renderdoc/renderdoc.txt (summary section)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../CVE-2023-33863-33864-33865-1.patch        |  71 ++++++++
 .../CVE-2023-33863-33864-33865-2.patch        |  72 ++++++++
 .../CVE-2023-33863-33864-33865-3.patch        | 160 ++++++++++++++++++
 .../CVE-2023-33863-33864-33865-4.patch        |  28 +++
 .../CVE-2023-33863-33864-33865-5.patch        |  40 +++++
 .../renderdoc/renderdoc_1.13.bb               |  12 +-
 6 files changed, 379 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-1.patch
 create mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-2.patch
 create mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-3.patch
 create mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-4.patch
 create mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-5.patch

diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-1.patch b/meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-1.patch
new file mode 100644
index 0000000000..8d0eaf49eb
--- /dev/null
+++ b/meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-1.patch
@@ -0,0 +1,71 @@
+From d55a6f1f849e38d2ca41c6d6683b773981f7e6c0 Mon Sep 17 00:00:00 2001
+From: baldurk <baldurk@baldurk.org>
+Date: Fri, 19 May 2023 09:57:03 +0100
+Subject: [PATCH] Verify array sizes when serialising for strings
+
+* We also limit the array size to 1GB for 32-bit. The 4GB/1GB limit is far
+  larger than reasonable for strings but can be handled the same way regardless.
+
+CVE: CVE-2023-33863 CVE-2023-33864 CVE-2023-33865
+Upstream-Status: Backport [https://github.com/baldurk/renderdoc/commit/601ed56111ce3803d8476d438ade1c92d6092856]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ renderdoc/serialise/serialiser.h | 18 +++++++++++++-----
+ 1 file changed, 13 insertions(+), 5 deletions(-)
+
+diff --git a/renderdoc/serialise/serialiser.h b/renderdoc/serialise/serialiser.h
+index 9393876ba..de42e54b4 100644
+--- a/renderdoc/serialise/serialiser.h
++++ b/renderdoc/serialise/serialiser.h
+@@ -721,7 +721,7 @@ public:
+       arr.ReserveChildren((size_t)size);
+ 
+       if(IsReading())
+-        el.resize((int)size);
++        el.resize((size_t)size);
+ 
+       if(m_LazyThreshold > 0 && size > m_LazyThreshold)
+       {
+@@ -756,7 +756,7 @@ public:
+     else
+     {
+       if(IsReading())
+-        el.resize((int)size);
++        el.resize((size_t)size);
+ 
+       for(size_t i = 0; i < (size_t)size; i++)
+         SerialiseDispatch<Serialiser, U>::Do(*this, el[i]);
+@@ -1271,7 +1271,8 @@ public:
+     if(IsReading())
+     {
+       m_Read->Read(len);
+-      el.resize((int)len);
++      VerifyArraySize(len);
++      el.resize((size_t)len);
+       if(len > 0)
+         m_Read->Read(&el[0], len);
+     }
+@@ -1386,13 +1387,20 @@ private:
+     }
+   };
+ 
+-  void VerifyArraySize(uint64_t &count)
++  template <typename intSize>
++  void VerifyArraySize(intSize &count)
+   {
+     uint64_t size = m_Read->GetSize();
+ 
+-    // for streaming, just take 4GB as a 'semi reasonable' upper limit for array sizes
++// for streaming, just take 4GB as a 'semi reasonable' upper limit for array sizes
++// use 1GB on 32-bit to avoid overflows
++#if ENABLED(RDOC_X64)
+     if(m_DataStreaming)
+       size = 0xFFFFFFFFU;
++#else
++    if(m_DataStreaming)
++      size = 0x3FFFFFFFU;
++#endif
+ 
+     if(count > size)
+     {
diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-2.patch b/meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-2.patch
new file mode 100644
index 0000000000..528c2e3b99
--- /dev/null
+++ b/meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-2.patch
@@ -0,0 +1,72 @@
+From f451eb1d46c9cf71376e41ac95ed236d58eba817 Mon Sep 17 00:00:00 2001
+From: baldurk <baldurk@baldurk.org>
+Date: Fri, 19 May 2023 09:58:49 +0100
+Subject: [PATCH] Don't call ReadLargeBuffer for socket reads
+
+* In ReadLargeBuffer we read directly into an external buffer with ReadExternal,
+  but for sockets when reading externally we want to read ahead of the current
+  spot (non-blocking) as much as possible to batch small reads together. Rather
+  than making ReadExternal handle or detect reads to external buffers, we
+  instead avoid ReadLargeBuffer as it is an optimisation for direct I/O to avoid
+  unnecessary memcpy's and is not relevant for sockets.
+
+CVE: CVE-2023-33836 CVE-2023-33864 CVE-2023-33865
+Upstream-Status: Backport [https://github.com/baldurk/renderdoc/commit/e0464fea4f9a7f149c4ee1d84e5ac57839a4a862]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ renderdoc/serialise/streamio.cpp | 11 ++++++++++-
+ renderdoc/serialise/streamio.h   |  4 +++-
+ 2 files changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/renderdoc/serialise/streamio.cpp b/renderdoc/serialise/streamio.cpp
+index d8863b537..24294f62b 100644
+--- a/renderdoc/serialise/streamio.cpp
++++ b/renderdoc/serialise/streamio.cpp
+@@ -267,7 +267,7 @@ bool StreamReader::Reserve(uint64_t numBytes)
+ 
+ bool StreamReader::ReadLargeBuffer(void *buffer, uint64_t length)
+ {
+-  RDCASSERT(m_Sock || m_File || m_Decompressor);
++  RDCASSERT(m_File || m_Decompressor);
+ 
+   byte *dest = (byte *)buffer;
+ 
+@@ -384,6 +384,9 @@ bool StreamReader::ReadFromExternal(void *buffer, uint64_t length)
+       // first get the required data blocking (this will sleep the thread until it comes in).
+       byte *readDest = (byte *)buffer;
+ 
++      // we expect to be reading into our window buffer
++      RDCASSERT(readDest >= m_BufferBase && readDest <= m_BufferBase + m_BufferSize);
++
+       success = m_Sock->RecvDataBlocking(readDest, (uint32_t)length);
+ 
+       if(success)
+@@ -393,6 +396,12 @@ bool StreamReader::ReadFromExternal(void *buffer, uint64_t length)
+ 
+         uint32_t bufSize = uint32_t(m_BufferSize - m_InputSize);
+ 
++        if(m_InputSize > m_BufferSize)
++        {
++          bufSize = 0;
++          RDCERR("Invalid read in ReadFromExternal!");
++        }
++
+         // now read more, as much as possible, to try and batch future reads
+         success = m_Sock->RecvDataNonBlocking(readDest, bufSize);
+ 
+diff --git a/renderdoc/serialise/streamio.h b/renderdoc/serialise/streamio.h
+index a069f6321..2bf719b7b 100644
+--- a/renderdoc/serialise/streamio.h
++++ b/renderdoc/serialise/streamio.h
+@@ -170,7 +170,9 @@ public:
+         // and larger by just skating over the limit each time, but that's fine because the main
+         // case we want to catch is a window that's only a few MB and then suddenly we read 100s of
+         // MB.
+-        if(numBytes >= 10 * 1024 * 1024 && Available() + 128 < numBytes)
++        // We don't do this on sockets since we want to opportunistically read more into the window
++        // to batch lots of small reads together.
++        if(m_Sock == NULL && numBytes >= 10 * 1024 * 1024 && Available() + 128 < numBytes)
+         {
+           success = ReadLargeBuffer(data, numBytes);
+           alreadyread = true;
diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-3.patch b/meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-3.patch
new file mode 100644
index 0000000000..77f0086f07
--- /dev/null
+++ b/meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-3.patch
@@ -0,0 +1,160 @@
+From 79ecca7aeb1766f26b25e6c4f45fc0057197c8ab Mon Sep 17 00:00:00 2001
+From: baldurk <baldurk@baldurk.org>
+Date: Fri, 19 May 2023 10:28:58 +0100
+Subject: [PATCH] Sanitise strings printed when received from target
+ control/remote server
+
+* Given socket corruption or network errors these strings could contain
+  unprintable characters so we sanitise them reasonably. This also ameliorates a
+  potential security concern with arbitrary strings being written to a log, but
+  these connections are still considered trusted and users should not be
+  exposing RenderDoc ports to the internet.
+
+CVE: CVE-2023-33836 CVE-2023-33864 CVE-2023-33865
+Upstream-Status: Backport [https://github.com/baldurk/renderdoc/commit/1f72a09e3b4fd8ba45be4b0db4889444ef5179e2]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ renderdoc/common/common.cpp        | 11 +++++++++++
+ renderdoc/core/remote_server.cpp   |  2 +-
+ renderdoc/core/target_control.cpp  | 25 ++++++++++++++-----------
+ renderdoc/strings/string_utils.cpp | 12 ++++++++++++
+ renderdoc/strings/string_utils.h   |  5 +++++
+ 5 files changed, 43 insertions(+), 12 deletions(-)
+
+diff --git a/renderdoc/common/common.cpp b/renderdoc/common/common.cpp
+index 120e6edd2..efe6254bd 100644
+--- a/renderdoc/common/common.cpp
++++ b/renderdoc/common/common.cpp
+@@ -448,6 +448,17 @@ void rdclog_direct(time_t utcTime, uint32_t pid, LogType type, const char *proje
+     va_end(args2);
+   }
+ 
++  // normalise newlines
++  {
++    char *nl = base;
++    while(*nl)
++    {
++      if(*nl == '\r')
++        *nl = '\n';
++      nl++;
++    }
++  }
++
+   // likely path - string contains no newlines
+   char *nl = strchr(base, '\n');
+   if(nl == NULL)
+diff --git a/renderdoc/core/remote_server.cpp b/renderdoc/core/remote_server.cpp
+index 525a4c4e7..085f4f733 100644
+--- a/renderdoc/core/remote_server.cpp
++++ b/renderdoc/core/remote_server.cpp
+@@ -439,7 +439,7 @@ static void ActiveRemoteClientThread(ClientThread *threadData,
+ 
+       reader.EndChunk();
+ 
+-      RDCLOG("Taking ownership of '%s'.", path.c_str());
++      RDCLOG("Taking ownership of capture.");
+ 
+       tempFiles.push_back(path);
+     }
+diff --git a/renderdoc/core/target_control.cpp b/renderdoc/core/target_control.cpp
+index 121e3ad18..198955f80 100644
+--- a/renderdoc/core/target_control.cpp
++++ b/renderdoc/core/target_control.cpp
+@@ -31,6 +31,7 @@
+ #include "os/os_specific.h"
+ #include "replay/replay_driver.h"
+ #include "serialise/serialiser.h"
++#include "strings/string_utils.h"
+ 
+ static const uint32_t TargetControlProtocolVersion = 6;
+ 
+@@ -443,6 +444,8 @@ void RenderDoc::TargetControlServerThread(Network::Socket *sock)
+ 
+       ser.EndChunk();
+ 
++      strip_nonbasic(newClient);
++
+       if(newClient.empty() || !IsProtocolVersionSupported(version))
+       {
+         RDCLOG("Invalid/Unsupported handshake '%s' / %d", newClient.c_str(), version);
+@@ -564,12 +567,23 @@ public:
+ 
+     m_Version = 0;
+ 
++    if(type == ePacket_Handshake)
+     {
+       READ_DATA_SCOPE();
+       SERIALISE_ELEMENT(m_Version);
+       SERIALISE_ELEMENT(m_Target);
+       SERIALISE_ELEMENT(m_PID);
+     }
++    else if(type == ePacket_Busy)
++    {
++      READ_DATA_SCOPE();
++      SERIALISE_ELEMENT(m_Version);
++      SERIALISE_ELEMENT(m_Target);
++      SERIALISE_ELEMENT(m_BusyClient);
++    }
++
++    strip_nonbasic(m_Target);
++    strip_nonbasic(m_BusyClient);
+ 
+     reader.EndChunk();
+ 
+@@ -704,17 +718,6 @@ public:
+       reader.EndChunk();
+       return msg;
+     }
+-    else if(type == ePacket_Busy)
+-    {
+-      READ_DATA_SCOPE();
+-      SERIALISE_ELEMENT(msg.busy.clientName).Named("Client Name"_lit);
+-
+-      SAFE_DELETE(m_Socket);
+-
+-      RDCLOG("Got busy signal: '%s", msg.busy.clientName.c_str());
+-      msg.type = TargetControlMessageType::Busy;
+-      return msg;
+-    }
+     else if(type == ePacket_NewChild)
+     {
+       msg.type = TargetControlMessageType::NewChild;
+diff --git a/renderdoc/strings/string_utils.cpp b/renderdoc/strings/string_utils.cpp
+index 5d8f40844..019a83c3a 100644
+--- a/renderdoc/strings/string_utils.cpp
++++ b/renderdoc/strings/string_utils.cpp
+@@ -141,6 +141,18 @@ rdcstr strip_extension(const rdcstr &path)
+   return path.substr(0, offs);
+ }
+ 
++rdcstr strip_nonbasic(rdcstr &str)
++{
++  for(char &c : str)
++  {
++    if((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9') || c == '.' ||
++       c == ' ')
++      continue;
++
++    c = '_';
++  }
++}
++
+ void split(const rdcstr &in, rdcarray<rdcstr> &out, const char sep)
+ {
+   if(in.empty())
+diff --git a/renderdoc/strings/string_utils.h b/renderdoc/strings/string_utils.h
+index 5164fe676..7c05a30f8 100644
+--- a/renderdoc/strings/string_utils.h
++++ b/renderdoc/strings/string_utils.h
+@@ -37,5 +37,10 @@ rdcstr get_basename(const rdcstr &path);
+ rdcstr get_dirname(const rdcstr &path);
+ rdcstr strip_extension(const rdcstr &path);
+ 
++// remove everything but alphanumeric ' ' and '.'
++// It replaces everything else with _
++// for logging strings where they might contain garbage characters
++rdcstr strip_nonbasic(rdcstr &str);
++
+ void split(const rdcstr &in, rdcarray<rdcstr> &out, const char sep);
+ void merge(const rdcarray<rdcstr> &in, rdcstr &out, const char sep);
diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-4.patch b/meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-4.patch
new file mode 100644
index 0000000000..99a68e6579
--- /dev/null
+++ b/meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-4.patch
@@ -0,0 +1,28 @@
+From a3ddb69c93a39901c2659a165a119f001cf8b1f4 Mon Sep 17 00:00:00 2001
+From: baldurk <baldurk@baldurk.org>
+Date: Fri, 19 May 2023 10:47:12 +0100
+Subject: [PATCH] Don't open symlinks when opening logfile
+
+CVE: CVE-2023-33836 CVE-2023-33864 CVE-2023-33865
+Upstream-Status: Backport [https://github.com/baldurk/renderdoc/commit/203fc8382a79d53d2035613d9425d966b1d4958e]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ renderdoc/os/posix/posix_stringio.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/renderdoc/os/posix/posix_stringio.cpp b/renderdoc/os/posix/posix_stringio.cpp
+index 59701e532..6f4389773 100644
+--- a/renderdoc/os/posix/posix_stringio.cpp
++++ b/renderdoc/os/posix/posix_stringio.cpp
+@@ -499,8 +499,8 @@ rdcstr logfile_readall(uint64_t offset, const rdcstr &filename)
+ 
+ LogFileHandle *logfile_open(const rdcstr &filename)
+ {
+-  int fd =
+-      open(filename.c_str(), O_APPEND | O_WRONLY | O_CREAT, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
++  int fd = open(filename.c_str(), O_APPEND | O_WRONLY | O_CREAT | O_NOFOLLOW,
++                S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
+ 
+   if(fd < 0)
+   {
diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-5.patch b/meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-5.patch
new file mode 100644
index 0000000000..f1aa4c0591
--- /dev/null
+++ b/meta-oe/recipes-graphics/renderdoc/renderdoc/CVE-2023-33863-33864-33865-5.patch
@@ -0,0 +1,40 @@
+From 3be494014166fbccd1b951aeeb26534d44ceab37 Mon Sep 17 00:00:00 2001
+From: baldurk <baldurk@baldurk.org>
+Date: Fri, 19 May 2023 10:58:29 +0100
+Subject: [PATCH] Fix incorrect return type
+
+CVE: CVE-2023-33836 CVE-2023-33864 CVE-2023-33865
+Upstream-Status: Backport [https://github.com/baldurk/renderdoc/commit/771aa8e769b72e6a36b31d6e2116db9952dcbe9b]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ renderdoc/strings/string_utils.cpp | 2 +-
+ renderdoc/strings/string_utils.h   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/renderdoc/strings/string_utils.cpp b/renderdoc/strings/string_utils.cpp
+index 019a83c3a..7c42ede4e 100644
+--- a/renderdoc/strings/string_utils.cpp
++++ b/renderdoc/strings/string_utils.cpp
+@@ -141,7 +141,7 @@ rdcstr strip_extension(const rdcstr &path)
+   return path.substr(0, offs);
+ }
+ 
+-rdcstr strip_nonbasic(rdcstr &str)
++void strip_nonbasic(rdcstr &str)
+ {
+   for(char &c : str)
+   {
+diff --git a/renderdoc/strings/string_utils.h b/renderdoc/strings/string_utils.h
+index 7c05a30f8..58c6b4f9c 100644
+--- a/renderdoc/strings/string_utils.h
++++ b/renderdoc/strings/string_utils.h
+@@ -40,7 +40,7 @@ rdcstr strip_extension(const rdcstr &path);
+ // remove everything but alphanumeric ' ' and '.'
+ // It replaces everything else with _
+ // for logging strings where they might contain garbage characters
+-rdcstr strip_nonbasic(rdcstr &str);
++void strip_nonbasic(rdcstr &str);
+ 
+ void split(const rdcstr &in, rdcarray<rdcstr> &out, const char sep);
+ void merge(const rdcarray<rdcstr> &in, rdcstr &out, const char sep);
diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb
index ceff54f46a..492a873c00 100644
--- a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb
+++ b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb
@@ -5,10 +5,14 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5486c0df458c74c85828e0cdbffd499e"
 
 SRCREV = "cc05b288b6d1660ab04c6cf01173f1bb62e6f5dd"
-SRC_URI = " \
-    git://github.com/baldurk/${BPN}.git;protocol=https;branch=v1.x \
-    file://0001-renderdoc-use-xxd-instead-of-cross-compiling-shim-bi.patch \
-"
+SRC_URI = "git://github.com/baldurk/${BPN}.git;protocol=https;branch=v1.x \
+           file://0001-renderdoc-use-xxd-instead-of-cross-compiling-shim-bi.patch \
+           file://CVE-2023-33863-33864-33865-1.patch \
+           file://CVE-2023-33863-33864-33865-2.patch \
+           file://CVE-2023-33863-33864-33865-3.patch \
+           file://CVE-2023-33863-33864-33865-4.patch \
+           file://CVE-2023-33863-33864-33865-5.patch \
+           "
 S = "${WORKDIR}/git"
 
 DEPENDS += "virtual/libx11 virtual/libgl libxcb xcb-util-keysyms vim-native"

