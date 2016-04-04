Return-Path: <Catalin.Enache@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5A45E6FF78
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Apr 2016 07:31:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u347VYuA027903
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 4 Apr 2016 00:31:34 -0700 (PDT)
Received: from no3.corp.ad.wrs.com (128.224.124.137) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 4 Apr 2016 00:31:33 -0700
From: Catalin Enache <catalin.enache@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Apr 2016 10:33:51 +0300
Message-ID: <1459755231-18197-1-git-send-email-catalin.enache@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] squid: CVE-2016-2569, CVE-2016-2570, CVE-2016-2571, CVE-2016-2572
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
X-List-Received-Date: Mon, 04 Apr 2016 07:31:35 -0000
Content-Type: text/plain

Due to incorrect bounds checking Squid is vulnerable to a denial
of service attack when processing HTTP responses.

These problems allow remote servers delivering certain unusual
HTTP response syntax to trigger a denial of service for all
clients accessing the Squid service.

HTTP responses containing malformed headers that trigger this
issue are becoming common. We are not certain at this time if
that is a sign of malware or just broken server scripting.

Details of a trivial attack are already circulating publicly.

Backported squid 3.5 patches referenced here:
http://www.squid-cache.org/Advisories/SQUID-2016_2.txt

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
---
 ...ling-of-huge-response-headers.-Fewer-BUG-.patch |  43 ++++
 ...ead-of-asserting-on-some-String-overflows.patch | 260 +++++++++++++++++++++
 ...sertion-failed-String.cc-len_-len-65536-i.patch |  68 ++++++
 ...dState.cc-447-serverConnection-conn-asser.patch | 219 +++++++++++++++++
 ...dState.cc-447-serverConnection-conn-asser.patch |  33 +++
 .../recipes-daemons/squid/squid_3.5.7.bb           |   5 +
 6 files changed, 628 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/0001-Better-handling-of-huge-response-headers.-Fewer-BUG-.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/0002-Throw-instead-of-asserting-on-some-String-overflows.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/0003-Bug-3870-assertion-failed-String.cc-len_-len-65536-i.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/0004-Bug-4447-FwdState.cc-447-serverConnection-conn-asser.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/0005-Bug-4447-FwdState.cc-447-serverConnection-conn-asser.patch

diff --git a/meta-networking/recipes-daemons/squid/files/0001-Better-handling-of-huge-response-headers.-Fewer-BUG-.patch b/meta-networking/recipes-daemons/squid/files/0001-Better-handling-of-huge-response-headers.-Fewer-BUG-.patch
new file mode 100644
index 0000000..714f57a
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/0001-Better-handling-of-huge-response-headers.-Fewer-BUG-.patch
@@ -0,0 +1,43 @@
+From 4633c819a43d9abd29f58a06c1becca6b4661efa Mon Sep 17 00:00:00 2001
+From: Catalin Enache <catalin.enache@windriver.com>
+Date: Mon, 28 Mar 2016 11:41:12 +0300
+Subject: [PATCH 1/5] Better handling of huge response headers. Fewer "BUG
+ 3279" messages.
+
+When we failed to parse a response, do not store the fake half-baked
+response (via a replaceHttpReply() call). Doing so leads to misleading
+"BUG 3279: HTTP reply without Date" messages (at best).  The fake
+response is only meant for continueAfterParsingHeader().
+
+Also removed a misleading XXX that may have caused Bug 4432 in v4.0
+(trunk r14548).
+
+Commiter: Alex Rousskov <rousskov@measurement-factory.com>
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ src/http.cc | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/src/http.cc b/src/http.cc
+index a5584ba..492a97b 100644
+--- a/src/http.cc
++++ b/src/http.cc
+@@ -719,11 +719,8 @@ HttpStateData::processReplyHeader()
+         if (!parsed && error > 0) { // unrecoverable parsing error
+             debugs(11, 3, "processReplyHeader: Non-HTTP-compliant header: '" <<  readBuf->content() << "'");
+             flags.headers_parsed = true;
+-            // XXX: when sanityCheck is gone and Http::StatusLine is used to parse,
+-            //   the sline should be already set the appropriate values during that parser stage
+             newrep->sline.set(Http::ProtocolVersion(1,1), error);
+-            HttpReply *vrep = setVirginReply(newrep);
+-            entry->replaceHttpReply(vrep);
++            setVirginReply(newrep);
+             ctx_exit(ctx);
+             return;
+         }
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-daemons/squid/files/0002-Throw-instead-of-asserting-on-some-String-overflows.patch b/meta-networking/recipes-daemons/squid/files/0002-Throw-instead-of-asserting-on-some-String-overflows.patch
new file mode 100644
index 0000000..1e42e07
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/0002-Throw-instead-of-asserting-on-some-String-overflows.patch
@@ -0,0 +1,260 @@
+From 20fe58ac9b3599ebb7df5693a691cbf5cfa24868 Mon Sep 17 00:00:00 2001
+From: Catalin Enache <catalin.enache@windriver.com>
+Date: Mon, 28 Mar 2016 15:42:15 +0300
+Subject: [PATCH 2/5] Throw instead of asserting on some String overflows.
+
+Note that Client-caught exceptions result in HTTP 500 (Internal Server
+Error) responses with X-Squid-Error set to "ERR_CANNOT_FORWARD 0".
+
+Also avoid stuck Client jobs on exceptions.
+
+Also unified String size limit checks.
+
+Essentially trunk r14552, which has a detailed commit message
+
+Commiter: Alex Rousskov <rousskov@measurement-factory.com>
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com
+---
+ src/SquidString.h        | 13 ++++++++++++-
+ src/StrList.cc           |  6 +++++-
+ src/String.cc            |  4 ++--
+ src/clients/Client.cc    | 12 ++++++++++--
+ src/clients/Client.h     |  4 ++++
+ src/clients/FtpClient.cc | 15 ++-------------
+ src/http.cc              | 15 ++++-----------
+ 7 files changed, 39 insertions(+), 30 deletions(-)
+
+diff --git a/src/SquidString.h b/src/SquidString.h
+index 512e171..f41f6a4 100644
+--- a/src/SquidString.h
++++ b/src/SquidString.h
+@@ -80,6 +80,13 @@ public:
+     _SQUID_INLINE_ int caseCmp(char const *, size_type count) const;
+     _SQUID_INLINE_ int caseCmp(String const &) const;
+ 
++    /// Whether creating a totalLen-character string is safe (i.e., unlikely to assert).
++    /// Optional extras can be used for overflow-safe length addition.
++    /// Implementation has to add 1 because many String allocation methods do.
++    static bool CanGrowTo(size_type totalLen, const size_type extras = 0) { return SafeAdd(totalLen, extras) && SafeAdd(totalLen, 1); }
++    /// whether appending growthLen characters is safe (i.e., unlikely to assert)
++    bool canGrowBy(const size_type growthLen) const { return CanGrowTo(size(), growthLen); }
++
+     String substr(size_type from, size_type to) const;
+ 
+     _SQUID_INLINE_ void cut(size_type newLength);
+@@ -95,10 +102,14 @@ private:
+     _SQUID_INLINE_ bool nilCmp(bool, bool, int &) const;
+ 
+     /* never reference these directly! */
+-    size_type size_; /* buffer size; 64K limit */
++    size_type size_; /* buffer size; limited by SizeMax_ */
+ 
+     size_type len_;  /* current length  */
+ 
++    static const size_type SizeMax_ = 65535; ///< 64K limit protects some fixed-size buffers
++    /// returns true after increasing the first argument by extra if the sum does not exceed SizeMax_
++    static bool SafeAdd(size_type &base, size_type extra) { if (extra <= SizeMax_ && base <= SizeMax_ - extra) { base += extra; return true; } return false; }
++
+     char *buf_;
+ 
+     _SQUID_INLINE_ void set(char const *loc, char const ch);
+diff --git a/src/StrList.cc b/src/StrList.cc
+index d77904f..6349688 100644
+--- a/src/StrList.cc
++++ b/src/StrList.cc
+@@ -11,20 +11,24 @@
+ #include "squid.h"
+ #include "SquidString.h"
+ #include "StrList.h"
++#include "base/TextException.h"
+ 
+ /** appends an item to the list */
+ void
+ strListAdd(String * str, const char *item, char del)
+ {
+     assert(str && item);
++    const String::size_type itemSize = strlen(item);
+     if (str->size()) {
+         char buf[3];
+         buf[0] = del;
+         buf[1] = ' ';
+         buf[2] = '\0';
++        Must(str->canGrowBy(2));
+         str->append(buf, 2);
+     }
+-    str->append(item, strlen(item));
++    Must(str->canGrowBy(itemSize));
++    str->append(item, itemSize);
+ }
+ 
+ /** returns true iff "m" is a member of the list */
+diff --git a/src/String.cc b/src/String.cc
+index 13a21e8..7646a7c 100644
+--- a/src/String.cc
++++ b/src/String.cc
+@@ -42,7 +42,7 @@ void
+ String::setBuffer(char *aBuf, String::size_type aSize)
+ {
+     assert(undefined());
+-    assert(aSize < 65536);
++    assert(aSize <= SizeMax_);
+     buf_ = aBuf;
+     size_ = aSize;
+ }
+@@ -171,7 +171,7 @@ String::append( char const *str, int len)
+     } else {
+         // Create a temporary string and absorb it later.
+         String snew;
+-        assert(len_ + len < 65536); // otherwise snew.len_ overflows below
++        assert(canGrowBy(len)); // otherwise snew.len_ may overflow below
+         snew.len_ = len_ + len;
+         snew.allocBuffer(snew.len_ + 1);
+ 
+diff --git a/src/clients/Client.cc b/src/clients/Client.cc
+index 10aa17b..7d5da4f 100644
+--- a/src/clients/Client.cc
++++ b/src/clients/Client.cc
+@@ -49,6 +49,7 @@ Client::Client(FwdState *theFwdState): AsyncJob("Client"),
+     startedAdaptation(false),
+ #endif
+     receivedWholeRequestBody(false),
++    doneWithFwd(NULL),
+     theVirginReply(NULL),
+     theFinalReply(NULL)
+ {
+@@ -74,8 +75,6 @@ Client::~Client()
+     HTTPMSGUNLOCK(theVirginReply);
+     HTTPMSGUNLOCK(theFinalReply);
+ 
+-    fwd = NULL; // refcounted
+-
+     if (responseBodyBuffer != NULL) {
+         delete responseBodyBuffer;
+         responseBodyBuffer = NULL;
+@@ -93,6 +92,14 @@ Client::swanSong()
+     cleanAdaptation();
+ #endif
+ 
++    if (!doneWithServer())
++        closeServer();
++
++    if (!doneWithFwd) {
++        doneWithFwd = "swanSong()";
++        fwd->handleUnregisteredServerEnd();
++    }
++
+     BodyConsumer::swanSong();
+ #if USE_ADAPTATION
+     Initiator::swanSong();
+@@ -218,6 +225,7 @@ Client::completeForwarding()
+ {
+     debugs(11,5, HERE << "completing forwarding for "  << fwd);
+     assert(fwd != NULL);
++    doneWithFwd = "completeForwarding()";
+     fwd->complete();
+ }
+ 
+diff --git a/src/clients/Client.h b/src/clients/Client.h
+index de55adf..ffa48b9 100644
+--- a/src/clients/Client.h
++++ b/src/clients/Client.h
+@@ -170,6 +170,10 @@ protected:
+ #endif
+     bool receivedWholeRequestBody; ///< handleRequestBodyProductionEnded called
+ 
++    /// whether we should not be talking to FwdState; XXX: clear fwd instead
++    /// points to a string literal which is used only for debugging
++    const char *doneWithFwd;
++
+ private:
+     void sendBodyIsTooLargeError();
+     void maybePurgeOthers();
+diff --git a/src/clients/FtpClient.cc b/src/clients/FtpClient.cc
+index a262eea..21398a7 100644
+--- a/src/clients/FtpClient.cc
++++ b/src/clients/FtpClient.cc
+@@ -828,6 +828,7 @@ Ftp::Client::ctrlClosed(const CommCloseCbParams &io)
+ {
+     debugs(9, 4, status());
+     ctrl.clear();
++    doneWithFwd = "ctrlClosed()"; // assume FwdState is monitoring too
+     mustStop("Ftp::Client::ctrlClosed");
+ }
+ 
+@@ -980,24 +981,12 @@ Ftp::Client::dataComplete()
+     scheduleReadControlReply(1);
+ }
+ 
+-/**
+- * Quickly abort the transaction
+- *
+- \todo destruction should be sufficient as the destructor should cleanup,
+- * including canceling close handlers
+- */
+ void
+ Ftp::Client::abortTransaction(const char *reason)
+ {
+     debugs(9, 3, "aborting transaction for " << reason <<
+            "; FD " << (ctrl.conn!=NULL?ctrl.conn->fd:-1) << ", Data FD " << (data.conn!=NULL?data.conn->fd:-1) << ", this " << this);
+-    if (Comm::IsConnOpen(ctrl.conn)) {
+-        ctrl.conn->close();
+-        return;
+-    }
+-
+-    fwd->handleUnregisteredServerEnd();
+-    mustStop("Ftp::Client::abortTransaction");
++    mustStop(reason);
+ }
+ 
+ /**
+diff --git a/src/http.cc b/src/http.cc
+index 492a97b..8b0febe 100644
+--- a/src/http.cc
++++ b/src/http.cc
+@@ -152,6 +152,7 @@ void
+ HttpStateData::httpStateConnClosed(const CommCloseCbParams &params)
+ {
+     debugs(11, 5, "httpStateFree: FD " << params.fd << ", httpState=" << params.data);
++    doneWithFwd = "httpStateConnClosed()"; // assume FwdState is monitoring too
+     mustStop("HttpStateData::httpStateConnClosed");
+ }
+ 
+@@ -1753,7 +1754,8 @@ HttpStateData::httpBuildRequestHeader(HttpRequest * request,
+ 
+         String strFwd = hdr_in->getList(HDR_X_FORWARDED_FOR);
+ 
+-        if (strFwd.size() > 65536/2) {
++        // if we cannot double strFwd size, then it grew past 50% of the limit
++        if (!strFwd.canGrowBy(strFwd.size())) {
+             // There is probably a forwarding loop with Via detection disabled.
+             // If we do nothing, String will assert on overflow soon.
+             // TODO: Terminate all transactions with huge XFF?
+@@ -2404,21 +2406,12 @@ HttpStateData::sentRequestBody(const CommIoCbParams &io)
+     Client::sentRequestBody(io);
+ }
+ 
+-// Quickly abort the transaction
+-// TODO: destruction should be sufficient as the destructor should cleanup,
+-// including canceling close handlers
+ void
+ HttpStateData::abortTransaction(const char *reason)
+ {
+     debugs(11,5, HERE << "aborting transaction for " << reason <<
+            "; " << serverConnection << ", this " << this);
+ 
+-    if (Comm::IsConnOpen(serverConnection)) {
+-        serverConnection->close();
+-        return;
+-    }
+-
+-    fwd->handleUnregisteredServerEnd();
+-    mustStop("HttpStateData::abortTransaction");
++    mustStop(reason);
+ }
+ 
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-daemons/squid/files/0003-Bug-3870-assertion-failed-String.cc-len_-len-65536-i.patch b/meta-networking/recipes-daemons/squid/files/0003-Bug-3870-assertion-failed-String.cc-len_-len-65536-i.patch
new file mode 100644
index 0000000..d1cb061
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/0003-Bug-3870-assertion-failed-String.cc-len_-len-65536-i.patch
@@ -0,0 +1,68 @@
+From 6f0c2c62c2f997350e299a2378b05a067f89d5e4 Mon Sep 17 00:00:00 2001
+From: Catalin Enache <catalin.enache@windriver.com>
+Date: Mon, 28 Mar 2016 12:00:36 +0300
+Subject: [PATCH 3/5] Bug 3870: assertion failed: String.cc: 'len_ + len
+ <65536' in ESI::CustomParser
+
+The custom ESI parser used in absence of libxml2 or libexpat parsers was
+restricted to handling 64KB buffers but under some conditions could expand
+to over 64KB during the parse process. Hitting this assertion.
+
+TODO: the parser can now be redesigned to make use of Tokenizer and
+CharacterSet parsing tools. But that is left for later work
+
+Author: William Lima <william.lima@hscbrasil.com.br>
+Commiter: Amos Jeffries <squid3@treenet.co.nz>
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ src/esi/CustomParser.cc | 8 +++++---
+ src/esi/CustomParser.h  | 4 ++--
+ 2 files changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/src/esi/CustomParser.cc b/src/esi/CustomParser.cc
+index 420d06d..2b59f07 100644
+--- a/src/esi/CustomParser.cc
++++ b/src/esi/CustomParser.cc
+@@ -89,9 +89,11 @@ ESICustomParser::parse(char const *dataToParse, size_t const lengthOfData, bool
+     }
+ 
+     size_t openESITags (0);
+-    //erring on the safe side. Probably rawBuf would be ok too
+-    char const *currentPos = content.termedBuf();
+-    size_t remainingCount = content.size();
++    // TODO: convert to Tokenizer parse
++    // erring on the safe side for now. Probably rawContent would be ok too
++    // note that operations below do *X='\0' ... altering the 'const' buffer content.
++    char const *currentPos = content.c_str();
++    SBuf::size_type remainingCount = content.length();
+     char const *tag = NULL;
+ 
+     while ((tag = findTag(currentPos, remainingCount))) {
+diff --git a/src/esi/CustomParser.h b/src/esi/CustomParser.h
+index cbf4dc9..bee1366 100644
+--- a/src/esi/CustomParser.h
++++ b/src/esi/CustomParser.h
+@@ -14,7 +14,7 @@ class Trie;
+ /* inherits from */
+ #include "esi/Parser.h"
+ 
+-/* for String variables */
++#include "SBuf.h"
+ #include "SquidString.h"
+ 
+ /**
+@@ -46,7 +46,7 @@ private:
+     ESIParserClient *theClient;
+     String error;
+     /* cheap n dirty - buffer it all */
+-    String content;
++    SBuf content;
+     /* TODO: make a class of this type code */
+     ESITAG_t lastTag;
+ };
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-daemons/squid/files/0004-Bug-4447-FwdState.cc-447-serverConnection-conn-asser.patch b/meta-networking/recipes-daemons/squid/files/0004-Bug-4447-FwdState.cc-447-serverConnection-conn-asser.patch
new file mode 100644
index 0000000..53f1af2
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/0004-Bug-4447-FwdState.cc-447-serverConnection-conn-asser.patch
@@ -0,0 +1,219 @@
+From 9099ad2722937300e0bc5137a0dd2f46ecdb5b7c Mon Sep 17 00:00:00 2001
+From: Catalin Enache <catalin.enache@windriver.com>
+Date: Mon, 28 Mar 2016 12:17:15 +0300
+Subject: [PATCH 4/5] Bug 4447:FwdState.cc:447 "serverConnection() == conn"
+ assertion
+
+After certain failures, FwdState::retryOrBail() may be called twice,
+once from FwdState::unregisterdServerEnd() [called from
+HttpStateData::swanSong()] and once from the FwdState's own connection
+close handler. This may result in two concurrent connections to the
+remote server, followed by an assertion upon a connection closure.
+
+This patch:
+
+- After HttpStateData failures, instead of closing the squid-to-peer
+connection directly (and, hence, triggering closure handlers), calls
+HttpStateData::closeServer() and mustStop() for a cleaner exit with
+fewer wasteful side effects and better debugging.
+
+- Creates and remembers a FwdState close handler AsyncCall so that
+comm_remove_close_handler() can cancel an already scheduled callback.
+The conversion to the AsyncCall was necessary because legacy [close
+handler callbacks] cannot be canceled once scheduled.
+
+This is a Measurement Factory project.
+
+Commiter: Christos Tsantilas <chtsanti@users.sourceforge.net>
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ src/FwdState.cc      | 13 ++++++++-----
+ src/FwdState.h       |  2 ++
+ src/clients/Client.h |  4 +++-
+ src/comm.cc          |  3 ++-
+ src/comm.h           |  2 +-
+ src/http.cc          | 16 ++++++++++------
+ 6 files changed, 26 insertions(+), 14 deletions(-)
+
+diff --git a/src/FwdState.cc b/src/FwdState.cc
+index d0c1b09..36a4d93 100644
+--- a/src/FwdState.cc
++++ b/src/FwdState.cc
+@@ -119,7 +119,8 @@ void
+ FwdState::closeServerConnection(const char *reason)
+ {
+     debugs(17, 3, "because " << reason << "; " << serverConn);
+-    comm_remove_close_handler(serverConn->fd, fwdServerClosedWrapper, this);
++    comm_remove_close_handler(serverConn->fd, closeHandler);
++    closeHandler = NULL;
+     fwdPconnPool->noteUses(fd_table[serverConn->fd].pconn.uses);
+     serverConn->close();
+ }
+@@ -443,7 +444,8 @@ FwdState::unregister(Comm::ConnectionPointer &conn)
+     debugs(17, 3, HERE << entry->url() );
+     assert(serverConnection() == conn);
+     assert(Comm::IsConnOpen(conn));
+-    comm_remove_close_handler(conn->fd, fwdServerClosedWrapper, this);
++    comm_remove_close_handler(conn->fd, closeHandler);
++    closeHandler = NULL;
+     serverConn = NULL;
+ }
+ 
+@@ -676,7 +678,7 @@ FwdState::connectDone(const Comm::ConnectionPointer &conn, Comm::Flag status, in
+ 
+     debugs(17, 3, HERE << serverConnection() << ": '" << entry->url() << "'" );
+ 
+-    comm_add_close_handler(serverConnection()->fd, fwdServerClosedWrapper, this);
++    closeHandler = comm_add_close_handler(serverConnection()->fd, fwdServerClosedWrapper, this);
+ 
+     if (serverConnection()->getPeer())
+         peerConnectSucceded(serverConnection()->getPeer());
+@@ -815,7 +817,8 @@ FwdState::connectStart()
+             request->hier.note(serverConn, pinned_connection->pinning.host);
+             if (pinned_connection->pinnedAuth())
+                 request->flags.auth = true;
+-            comm_add_close_handler(serverConn->fd, fwdServerClosedWrapper, this);
++
++            closeHandler = comm_add_close_handler(serverConn->fd,  fwdServerClosedWrapper, this);
+ 
+             /* Update server side TOS and Netfilter mark on the connection. */
+             if (Ip::Qos::TheConfig.isAclTosActive()) {
+@@ -865,7 +868,7 @@ FwdState::connectStart()
+         debugs(17, 3, HERE << "reusing pconn " << serverConnection());
+         ++n_tries;
+ 
+-        comm_add_close_handler(serverConnection()->fd, fwdServerClosedWrapper, this);
++        closeHandler = comm_add_close_handler(serverConnection()->fd,  fwdServerClosedWrapper, this);
+ 
+         /* Update server side TOS and Netfilter mark on the connection. */
+         if (Ip::Qos::TheConfig.isAclTosActive()) {
+diff --git a/src/FwdState.h b/src/FwdState.h
+index 56dad30..b724b13 100644
+--- a/src/FwdState.h
++++ b/src/FwdState.h
+@@ -150,6 +150,8 @@ private:
+ 
+     Comm::ConnectionPointer serverConn; ///< a successfully opened connection to a server.
+ 
++    AsyncCall::Pointer closeHandler; ///< The serverConn close handler
++
+     /// possible pconn race states
+     typedef enum { raceImpossible, racePossible, raceHappened } PconnRace;
+     PconnRace pconnRace; ///< current pconn race state
+diff --git a/src/clients/Client.h b/src/clients/Client.h
+index ffa48b9..84e49a6 100644
+--- a/src/clients/Client.h
++++ b/src/clients/Client.h
+@@ -99,7 +99,9 @@ protected:
+     virtual void sentRequestBody(const CommIoCbParams &io) = 0;
+     virtual void doneSendingRequestBody() = 0;
+ 
+-    virtual void closeServer() = 0;            /**< end communication with the server */
++    /// Use this to end communication with the server. The call cancels our
++    /// closure handler and tells FwdState to forget about the connection.
++    virtual void closeServer() = 0;
+     virtual bool doneWithServer() const = 0;   /**< did we end communication? */
+     /// whether we may receive more virgin response body bytes
+     virtual bool mayReadVirginReplyBody() const = 0;
+diff --git a/src/comm.cc b/src/comm.cc
+index 54a1344..700fe9a 100644
+--- a/src/comm.cc
++++ b/src/comm.cc
+@@ -976,7 +976,7 @@ comm_udp_sendto(int fd,
+     return Comm::COMM_ERROR;
+ }
+ 
+-void
++AsyncCall::Pointer
+ comm_add_close_handler(int fd, CLCB * handler, void *data)
+ {
+     debugs(5, 5, "comm_add_close_handler: FD " << fd << ", handler=" <<
+@@ -985,6 +985,7 @@ comm_add_close_handler(int fd, CLCB * handler, void *data)
+     AsyncCall::Pointer call=commCbCall(5,4, "SomeCloseHandler",
+                                        CommCloseCbPtrFun(handler, data));
+     comm_add_close_handler(fd, call);
++    return call;
+ }
+ 
+ void
+diff --git a/src/comm.h b/src/comm.h
+index 6647d09..02afb45 100644
+--- a/src/comm.h
++++ b/src/comm.h
+@@ -79,7 +79,7 @@ int ignoreErrno(int);
+ void commCloseAllSockets(void);
+ void checkTimeouts(void);
+ 
+-void comm_add_close_handler(int fd, CLCB *, void *);
++AsyncCall::Pointer comm_add_close_handler(int fd, CLCB *, void *);
+ void comm_add_close_handler(int fd, AsyncCall::Pointer &);
+ void comm_remove_close_handler(int fd, CLCB *, void *);
+ void comm_remove_close_handler(int fd, AsyncCall::Pointer &);
+diff --git a/src/http.cc b/src/http.cc
+index 8b0febe..d6ceab4 100644
+--- a/src/http.cc
++++ b/src/http.cc
+@@ -165,7 +165,8 @@ HttpStateData::httpTimeout(const CommTimeoutCbParams &params)
+         fwd->fail(new ErrorState(ERR_READ_TIMEOUT, Http::scGatewayTimeout, fwd->request));
+     }
+ 
+-    serverConnection->close();
++    closeServer();
++    mustStop("HttpStateData::httpTimeout");
+ }
+ 
+ /// Remove an existing public store entry if the incoming response (to be
+@@ -1150,7 +1151,8 @@ HttpStateData::readReply(const CommIoCbParams &io)
+             err->xerrno = io.xerrno;
+             fwd->fail(err);
+             flags.do_next_read = false;
+-            serverConnection->close();
++            closeServer();
++            mustStop("HttpStateData::readReply");
+         }
+ 
+         return;
+@@ -1303,7 +1305,8 @@ HttpStateData::continueAfterParsingHeader()
+     entry->reset();
+     fwd->fail(new ErrorState(error, Http::scBadGateway, fwd->request));
+     flags.do_next_read = false;
+-    serverConnection->close();
++    closeServer();
++    mustStop("HttpStateData::continueAfterParsingHeader");
+     return false; // quit on error
+ }
+ 
+@@ -1537,7 +1540,8 @@ HttpStateData::wroteLast(const CommIoCbParams &io)
+         ErrorState *err = new ErrorState(ERR_WRITE_ERROR, Http::scBadGateway, fwd->request);
+         err->xerrno = io.xerrno;
+         fwd->fail(err);
+-        serverConnection->close();
++        closeServer();
++        mustStop("HttpStateData::wroteLast");
+         return;
+     }
+ 
+@@ -1565,7 +1569,6 @@ HttpStateData::sendComplete()
+     request->hier.peer_http_request_sent = current_time;
+ }
+ 
+-// Close the HTTP server connection. Used by serverComplete().
+ void
+ HttpStateData::closeServer()
+ {
+@@ -1575,7 +1578,8 @@ HttpStateData::closeServer()
+         fwd->unregister(serverConnection);
+         comm_remove_close_handler(serverConnection->fd, closeHandler);
+         closeHandler = NULL;
+-        serverConnection->close();
++        closeServer();
++        mustStop("HttpStateData::handleMoreRequestBodyAvailable");
+     }
+ }
+ 
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-daemons/squid/files/0005-Bug-4447-FwdState.cc-447-serverConnection-conn-asser.patch b/meta-networking/recipes-daemons/squid/files/0005-Bug-4447-FwdState.cc-447-serverConnection-conn-asser.patch
new file mode 100644
index 0000000..7ca43bc
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/0005-Bug-4447-FwdState.cc-447-serverConnection-conn-asser.patch
@@ -0,0 +1,33 @@
+From a60b123eecb119ae32205cff892603e20785c4d8 Mon Sep 17 00:00:00 2001
+From: Christos Tsantilas <chtsanti@users.sourceforge.net>
+Date: Mon, 29 Feb 2016 22:00:34 +0200
+Subject: [PATCH 5/5] Bug 4447:FwdState.cc:447 "serverConnection() == conn"
+ assertion, part2
+
+Fix to allow make check  work again.
+
+Commiter: Christos Tsantilas <chtsanti@users.sourceforge.net>
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ src/tests/stub_comm.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/tests/stub_comm.cc b/src/tests/stub_comm.cc
+index abd3a6b..746ec92 100644
+--- a/src/tests/stub_comm.cc
++++ b/src/tests/stub_comm.cc
+@@ -57,7 +57,7 @@ int commUnsetConnTimeout(const Comm::ConnectionPointer &conn) STUB_RETVAL(-1)
+ int ignoreErrno(int ierrno) STUB_RETVAL(-1)
+ void commCloseAllSockets(void) STUB
+ void checkTimeouts(void) STUB
+-void comm_add_close_handler(int fd, CLCB *, void *) STUB
++AsyncCall::Pointer comm_add_close_handler(int fd, CLCB *, void *) STUB
+ void comm_add_close_handler(int fd, AsyncCall::Pointer &) STUB
+ void comm_remove_close_handler(int fd, CLCB *, void *) STUB
+ void comm_remove_close_handler(int fd, AsyncCall::Pointer &)STUB
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
index 5b27d46..9d57d34 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
@@ -19,6 +19,11 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
            file://squid-use-serial-tests-config-needed-by-ptest.patch \
            file://run-ptest \
            file://volatiles.03_squid \
+           file://0001-Better-handling-of-huge-response-headers.-Fewer-BUG-.patch \
+           file://0002-Throw-instead-of-asserting-on-some-String-overflows.patch \
+           file://0003-Bug-3870-assertion-failed-String.cc-len_-len-65536-i.patch \
+           file://0004-Bug-4447-FwdState.cc-447-serverConnection-conn-asser.patch \
+           file://0005-Bug-4447-FwdState.cc-447-serverConnection-conn-asser.patch \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c492e2d6d32ec5c1aad0e0609a141ce9 \
-- 
2.7.4


