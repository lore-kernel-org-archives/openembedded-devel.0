Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CEFECAC5B6
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:57:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web11.15019.1758628660267361449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=fcYvCDFS;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758628672; x=1790164672;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Q/GaBAXPLPfLzvzAR9lnDhcGNX9ge5soxg3qR6sTWN8=;
  b=fcYvCDFSKuiB+il3n5U2Szn9uqO8PVUixYr+i6EiVg4Jd0X8IDzBvCbz
   zyVB7jQifkF42dd+dFSbwyVF31+GJN9vPr6xG9N9uV1rCzWCLiQX690vN
   ijqEzBz0LoQlple/dVpoNUzidekVPdQxcTOhqfTqMOhPFHaCht7YpDDZY
   F5zTnpsKxM0/KATsrvU3KIvEB7iRkBJ5Q3ukO+4qyEtaEWenge/Xs87L+
   KMf+EbiIGScv2lQYw8yVKstSH2y66Ju/DdmcoI++8GMt2BHTpT8EFK8PT
   dPpQtCAGbptR5QOsw2k99aiQOyCHGUrfmqjCUvWU9uDIMQiAU33Q5rOjs
   A==;
X-CSE-ConnectionGUID: /yqJGCEvSW+xHfjJuO5EnQ==
X-CSE-MsgGUID: TFgSMgQFQaC12YTiM+XPZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60821782"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60821782"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:57:52 -0700
X-CSE-ConnectionGUID: Fix6J5/TTkejxWfo3O/I7w==
X-CSE-MsgGUID: 5PPnL6NsQ+iKInJ9NWjjwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="175875157"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO anmitta2-mobl4.intel.com) ([10.247.118.223])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:57:51 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][PATCH 07/24] wxwidgets: fix CVE-2024-58249
Date: Tue, 23 Sep 2025 19:57:10 +0800
Message-ID: <95f7aea47c1d9588ca882004fd48adb59d108cd2.1758626365.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758626365.git.anuj.mittal@intel.com>
References: <cover.1758626365.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119696

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-58249:
In wxWidgets before 3.2.7, a crash can be triggered in wxWidgets apps when connections are refused in wxWebRequestCURL.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-58249]

Upstream patches:
[https://github.com/wxWidgets/wxWidgets/commit/f2918a9ac823074901ce27de939baa57788beb3d]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>

(walnascar rev: d3d3df49d5f6e8747c0b04100c4f708b4cafbbd4)
Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../wxwidgets/wxwidgets/CVE-2024-58249.patch  | 178 ++++++++++++++++++
 .../wxwidgets/wxwidgets_3.2.6.bb              |   1 +
 2 files changed, 179 insertions(+)
 create mode 100644 meta-oe/recipes-extended/wxwidgets/wxwidgets/CVE-2024-58249.patch

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/CVE-2024-58249.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/CVE-2024-58249.patch
new file mode 100644
index 0000000000..8ba9cc1b04
--- /dev/null
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/CVE-2024-58249.patch
@@ -0,0 +1,178 @@
+From e440b3a6097546a8aca66bd4c7a21be25e89d340 Mon Sep 17 00:00:00 2001
+From: Vadim Zeitlin <vadim@wxwidgets.org>
+Date: Sun, 27 Oct 2024 00:56:21 +0200
+Subject: [PATCH] Fix crash when connection is refused in wxWebRequestCURL
+
+Avoid deleting wxEventLoopSourceHandler which may be still in use, as is
+the case when we get write IO notification just before an error one: if
+we delete the handler while handling the former, we crash when getting
+the latter one.
+
+Use a hack to avoid deleting the handlers for which write notification
+is being processed and delete them later, when we get the error one.
+
+See #24885.
+
+(cherry picked from commit 4e0fca8ab9756989598d07b41e672af86eac7092)
+
+CVE: CVE-2024-58249
+Upstream-Status: Backport [https://github.com/wxWidgets/wxWidgets/commit/f2918a9ac823074901ce27de939baa57788beb3d]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/common/webrequest_curl.cpp | 80 +++++++++++++++++++++++++---------
+ 1 file changed, 60 insertions(+), 20 deletions(-)
+
+diff --git a/src/common/webrequest_curl.cpp b/src/common/webrequest_curl.cpp
+index f50acf4f8d..64650ab6b4 100644
+--- a/src/common/webrequest_curl.cpp
++++ b/src/common/webrequest_curl.cpp
+@@ -704,10 +704,13 @@ SocketPollerImpl* SocketPollerImpl::Create(wxEvtHandler* hndlr)
+ 
+ // SocketPollerSourceHandler - a source handler used by the SocketPoller class.
+ 
++class SourceSocketPoller;
++
+ class SocketPollerSourceHandler: public wxEventLoopSourceHandler
+ {
+ public:
+-    SocketPollerSourceHandler(curl_socket_t, wxEvtHandler*);
++    SocketPollerSourceHandler(curl_socket_t sock, SourceSocketPoller* poller)
++        : m_socket(sock), m_poller(poller) {}
+ 
+     void OnReadWaiting() wxOVERRIDE;
+     void OnWriteWaiting() wxOVERRIDE;
+@@ -716,16 +719,9 @@ public:
+ private:
+     void SendEvent(int);
+     curl_socket_t m_socket;
+-    wxEvtHandler* m_handler;
++    SourceSocketPoller* const m_poller;
+ };
+ 
+-SocketPollerSourceHandler::SocketPollerSourceHandler(curl_socket_t sock,
+-                                                     wxEvtHandler* hndlr)
+-{
+-    m_socket = sock;
+-    m_handler = hndlr;
+-}
+-
+ void SocketPollerSourceHandler::OnReadWaiting()
+ {
+     SendEvent(SocketPoller::READY_FOR_READ);
+@@ -741,14 +737,6 @@ void SocketPollerSourceHandler::OnExceptionWaiting()
+     SendEvent(SocketPoller::HAS_ERROR);
+ }
+ 
+-void SocketPollerSourceHandler::SendEvent(int result)
+-{
+-    wxThreadEvent event(wxEVT_SOCKET_POLLER_RESULT);
+-    event.SetPayload<curl_socket_t>(m_socket);
+-    event.SetInt(result);
+-    m_handler->ProcessEvent(event);
+-}
+-
+ // SourceSocketPoller - a SocketPollerImpl based on event loop sources.
+ 
+ class SourceSocketPoller: public SocketPollerImpl
+@@ -760,6 +748,8 @@ public:
+     void StopPolling(curl_socket_t) wxOVERRIDE;
+     void ResumePolling(curl_socket_t) wxOVERRIDE;
+ 
++    void SendEvent(curl_socket_t sock, int result);
++
+ private:
+     WX_DECLARE_HASH_MAP(curl_socket_t, wxEventLoopSource*, wxIntegerHash,\
+                         wxIntegerEqual, SocketDataMap);
+@@ -768,11 +758,25 @@ private:
+ 
+     SocketDataMap m_socketData;
+     wxEvtHandler* m_handler;
++
++    // The socket for which we're currently processing a write IO notification.
++    curl_socket_t m_activeWriteSocket;
++
++    // The sockets that we couldn't clean up yet but should do if/when we get
++    // an error notification for them.
++    wxVector<curl_socket_t> m_socketsToCleanUp;
+ };
+ 
++// This function must be implemented after full SourceSocketPoller declaration.
++void SocketPollerSourceHandler::SendEvent(int result)
++{
++    m_poller->SendEvent(m_socket, result);
++}
++
+ SourceSocketPoller::SourceSocketPoller(wxEvtHandler* hndlr)
+ {
+     m_handler = hndlr;
++    m_activeWriteSocket = 0;
+ }
+ 
+ SourceSocketPoller::~SourceSocketPoller()
+@@ -822,9 +826,7 @@ bool SourceSocketPoller::StartPolling(curl_socket_t sock, int pollAction)
+     }
+     else
+     {
+-        // Otherwise create a new source handler.
+-        srcHandler =
+-            new SocketPollerSourceHandler(sock, m_handler);
++        srcHandler = new SocketPollerSourceHandler(sock, this);
+     }
+ 
+     // Get a new source object for these polling checks.
+@@ -858,6 +860,15 @@ bool SourceSocketPoller::StartPolling(curl_socket_t sock, int pollAction)
+ 
+ void SourceSocketPoller::StopPolling(curl_socket_t sock)
+ {
++    if ( sock == m_activeWriteSocket )
++    {
++        // We can't clean up the socket while we're inside OnWriteWaiting() for
++        // it because it could be followed by OnExceptionWaiting() and we'd
++        // crash if we deleted it already.
++        m_socketsToCleanUp.push_back(sock);
++        return;
++    }
++
+     SocketDataMap::iterator it = m_socketData.find(sock);
+ 
+     if ( it != m_socketData.end() )
+@@ -871,6 +882,35 @@ void SourceSocketPoller::ResumePolling(curl_socket_t WXUNUSED(sock))
+ {
+ }
+ 
++void SourceSocketPoller::SendEvent(curl_socket_t sock, int result)
++{
++    if ( result == SocketPoller::READY_FOR_WRITE )
++    {
++        // Prevent the handler from this socket from being deleted in case we
++        // get a HAS_ERROR event for it immediately after this one.
++        m_activeWriteSocket = sock;
++    }
++
++    wxThreadEvent event(wxEVT_SOCKET_POLLER_RESULT);
++    event.SetPayload<curl_socket_t>(sock);
++    event.SetInt(result);
++    m_handler->ProcessEvent(event);
++
++    m_activeWriteSocket = 0;
++
++    if ( result == SocketPoller::HAS_ERROR )
++    {
++        // Check if we have any sockets to clean up and do it now, it should be
++        // safe.
++        for ( size_t n = 0; n < m_socketsToCleanUp.size(); ++n )
++        {
++            StopPolling(m_socketsToCleanUp[n]);
++        }
++
++        m_socketsToCleanUp.clear();
++    }
++}
++
+ void SourceSocketPoller::CleanUpSocketSource(wxEventLoopSource* source)
+ {
+     wxEventLoopSourceHandler* srcHandler = source->GetHandler();
+-- 
+2.50.0
+
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
index 71e2a60e0c..1cf44bbfa3 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
@@ -26,6 +26,7 @@ SRC_URI = "gitsm://github.com/wxWidgets/wxWidgets.git;branch=3.2;protocol=https
            file://0005-wx-config-fix-libdir-for-multilib.patch \
            file://0006-Fix-locale-on-musl.patch \
            file://0007-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch \
+           file://CVE-2024-58249.patch \
            "
 SRCREV = "5ff25322553c1870cf20a2e1ba6f20ed50d9fe9a"
 S = "${WORKDIR}/git"

