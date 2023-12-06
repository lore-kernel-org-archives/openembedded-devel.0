Return-Path: <patrick.wicki@subset.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF430C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 00:12:44 +0000 (UTC)
Received: from st43p00im-zteg10061901.me.com (st43p00im-zteg10061901.me.com [17.58.63.168])
 by mx.groups.io with SMTP id smtpd.web11.17211.1701821558218962113
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Dec 2023 16:12:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=LCR0JJrU;
 spf=pass (domain: subset.ch, ip: 17.58.63.168, mailfrom: patrick.wicki@subset.ch)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1;
	t=1701821557; bh=YGHAFzIJScmy2VCPMeoeMlkb4ukA8esCGig7JB4ZBTs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=LCR0JJrUFWPzECwi0cGSccwFwOS+9SEZ31wgUUVd/yk7z/Hn0Fan4v9YNE5gG8KZK
	 rdXjBnez0cBTRwja9+PAKM76JBV69kZsOAjEH8zyv3cTcBkgdCbVAazwXq+wCgJDuG
	 HnRnvtmAILKi89f25CSG3ayNYJ9GH2Yb41+4M1ZvqI9A48FqUaVCy3sZdTLUc772b0
	 epLpDJXgqTfd7wY+Fp9HYObnXOE7p0Zo8dSGE85OLVXjC6iAtak6ZTjZjOxiuRwgfJ
	 cACLrvyiLKNhBoRE+slIAiTWLr1WZCxVP26ISF5XJlp+VoHC3QlTwKWD5ab65cBsOy
	 rwYlHYyBtrrmQ==
Received: from localhost.localdomain (st43p00im-dlb-asmtp-mailmevip.me.com [17.42.251.41])
	by st43p00im-zteg10061901.me.com (Postfix) with ESMTPSA id 79DA554022D;
	Wed,  6 Dec 2023 00:12:36 +0000 (UTC)
From: patrick.wicki@subset.ch
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [oe][meta-oe][PATCH] poco: upgrade 1.12.4 -> 1.12.5p2
Date: Wed,  6 Dec 2023 01:12:25 +0100
Message-ID: <6f09a824716c262caac9c85f0f33d80eb2032367.1701821246.git.patrick.wicki@siemens.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Proofpoint-ORIG-GUID: ueh6nw_CjpW9x5ZtD77YE2TcbgnWztCX
X-Proofpoint-GUID: ueh6nw_CjpW9x5ZtD77YE2TcbgnWztCX
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.573,18.0.957,17.11.170.22.0000000_definitions?=
 =?UTF-8?Q?=3D2023-05-18=5F15:2023-05-17=5F02,2023-05-18=5F15,2023-02-09?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0
 mlxlogscore=999 adultscore=0 clxscore=1030 bulkscore=0 suspectscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2312050188
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 00:12:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107231

From: Patrick Wicki <patrick.wicki@siemens.com>

Update to latest (patch) release.

This fixes Integer overflow in Poco::UTF32Encoding, which is a security
vulnerability (see https://github.com/pocoproject/poco/issues/4320).

Drop POSIX thread creation patch since it's now fixed upstream.

Refresh ccpignore.lnx patch.

Add patch backporting https://github.com/pocoproject/poco/pull/4227.

Changelog
=3D=3D=3D=3D=3D=3D=3D=3D=3D

- GH #4320: Integer overflow in Poco::UTF32Encoding
- GH #4241: Poco::FileInputStream broken in 1.12.5 and 1.11.8
- GH #4219 Make POSIX event thread safe
- GH #4215 Remove SocketReactor dependency on Poco::Thread for sleeping
- GH #4197 ODBC::Binder UUID new/free mismatch
- GH #4194 PollSet filters out some events
- GH #4189 Use after free warnings
- GH #4180 receiveResponse() may not return response body stream
- GH #4177 Upgrade bundled pcre2 to 10.42
- GH #4147 missing \r\n when setting trailer header in chunked response
- GH #4134 Initialisation of _socketIndex in SSLManager (OpenSSL)
- GH #3867 Add options to disable STDIO in child process
- GH #3832 pthread_getname_np' was not declared in this scope
- GH #3786 FileChannel::setRotation overflow
- GH #2776 Shutdown TLS1.3 connection
- GH #4176 PCRE2 10.40 version has security vulnerabilities=EF=BC=88CVE-2=
022-41409=EF=BC=89, when is the plan to fix it third-party
- GH #4150 Use Poco format instead of sprintf in Util
- GH #4116 Logging should evaluate only if the logging level is active
- GH #4071 PageCompiler: add referrerPolicy to page directive feature
- GH #4057 ODBC: SQL Anywhere Support
- GH #4031 Classes with virtual functions missing virtual destructors (co=
mpilation issues)
- GH #4023 CPPParser: Losing data if parameter std::function<void(bool)> =
is used
- GH #4014 wrong string offset in HTTPCredentials::isNTLMCredentials
- GH #4005 On UNIX platform, Poco::Path::getExtension() returns name of t=
he hidden file if no extension is present
- GH #3986 Fix dead lock on Timer destructor
- GH #3968 Poco::Net::SocketConnector constructor should take SocketAddre=
ss by const reference
- GH #3935 The extractor in postgresql drops milliseconds
- GH #3926 CppParser throws exception when return value is specified to b=
e in global namespace
- GH #3921 Deadlock in Timer when one sync and one async cancel requests =
are issued
- GH #3918 Static FastMutex fails to lock when issued from another thread=
 on linux
- GH #3880 NetSSL_OpenSSL: Support session resumption with TLSv1.3
- GH #3876 Replace sprintf with snprintf in Environment and NumberFormatt=
er to avoid deprecation warnings
- GH #3859 zlib headers not updated
- GH #3806 HTTPClientSession::receiveResponse() gives NoMessage instead o=
f Timeout exception for SSL connection on Windows when using OpenSSL 3.0.=
x
- GH #3723 DateTimeFormatter creates invalid ISO8601 string
- GH #3147 Reading from request stream hangs when "Transfer-Encoding: chu=
nked" is used
- GH #4218 Upgrade double-conversion to 3.3.0
- PR #4210 Fix pthread_setname not declared
- PR #4072 optimize checkUpperLimit and checkLowerLimit in VarHolder.h  e=
nhancement
- PR #4050 rename arc -> poco_arc
- PR #4038 Fixed Poco::format specifier for error code  bug platform_spec=
ific
- PR #4011 fix #4005 Poco::Path::getExtension()
- PR #3999 Fix hang in destructor
- PR #3992 Fix thread counter leak
- PR #3987 Fix dead lock on Timer destructor
- PR #3971 Fix error handling with OpenSSL 3.0 in SecureSocketImpl.cpp (f=
ixes #3806)
- PR #3943 Fix build for QNX  platform_specific
- PR #3942 Fix data race when create POSIX thread
- PR #3912 Fixed compile error for OpenSSL 1.0 systems (#3739)
- PR #3883 Added system_error header to SockerProactor for std::error_cod=
e
- PR #3855 Fix epollfd validity checks when compiling with wepoll
- PR #3809 improve Windows OpenSSL 3.0.x error handling #3806
- PR #3769 Fixed converting/correcting pre-gregorian dates (#3723)

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
---
 ...x-data-race-when-create-POSIX-thread.patch | 33 -----------------
 ...nx-Ignore-PKCS12-and-testLaunch-test.patch | 35 ++++++++++---------
 ...l-cmake-files-with-resolved-ENABLE_J.patch | 32 +++++++++++++++++
 .../poco/{poco_1.12.4.bb =3D> poco_1.12.5p2.bb} |  4 +--
 4 files changed, 53 insertions(+), 51 deletions(-)
 delete mode 100644 meta-oe/recipes-support/poco/poco/0001-Fix-data-race-=
when-create-POSIX-thread.patch
 create mode 100644 meta-oe/recipes-support/poco/poco/0002-fix-build-Inst=
all-cmake-files-with-resolved-ENABLE_J.patch
 rename meta-oe/recipes-support/poco/{poco_1.12.4.bb =3D> poco_1.12.5p2.b=
b} (97%)

diff --git a/meta-oe/recipes-support/poco/poco/0001-Fix-data-race-when-cr=
eate-POSIX-thread.patch b/meta-oe/recipes-support/poco/poco/0001-Fix-data=
-race-when-create-POSIX-thread.patch
deleted file mode 100644
index 1a7f4dcdc..000000000
--- a/meta-oe/recipes-support/poco/poco/0001-Fix-data-race-when-create-PO=
SIX-thread.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 03b68fc924b24e12c87512d790d37fc6ddc352ac Mon Sep 17 00:00:00 2001
-From: Dawid Drozd <drozddawid@gmail.com>
-Date: Sat, 11 Feb 2023 14:48:39 +0400
-Subject: [PATCH] Fix data race when create POSIX thread
-
-When creating thread using pthread_create() `_pData->thread` will be set=
.
-It could lead to data race as in runnableEntry() we refer to that variab=
le.
-
-Instead use pthread_self().
-getName() is already under mutex.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport [https://github.com/pocoproject/poco/pull/3942=
/commits/9c8a79b994a367f626c5551e0f38c27d0d8431f1]
----
- Foundation/src/Thread_POSIX.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Foundation/src/Thread_POSIX.cpp b/Foundation/src/Thread_POS=
IX.cpp
-index ceab76e82..3e52cd31f 100644
---- a/Foundation/src/Thread_POSIX.cpp
-+++ b/Foundation/src/Thread_POSIX.cpp
-@@ -351,7 +351,7 @@ void* ThreadImpl::runnableEntry(void* pThread)
- #endif
-=20
- 	ThreadImpl* pThreadImpl =3D reinterpret_cast<ThreadImpl*>(pThread);
--	setThreadName(pThreadImpl->_pData->thread, reinterpret_cast<Thread*>(p=
Thread)->getName());
-+	setThreadName(pthread_self(), reinterpret_cast<Thread*>(pThread)->getN=
ame());
- 	AutoPtr<ThreadData> pData =3D pThreadImpl->_pData;
- 	try
- 	{
---=20
-2.42.0
-
diff --git a/meta-oe/recipes-support/poco/poco/0001-cppignore.lnx-Ignore-=
PKCS12-and-testLaunch-test.patch b/meta-oe/recipes-support/poco/poco/0001=
-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch
index 25934d61b..f70e8bcc7 100644
--- a/meta-oe/recipes-support/poco/poco/0001-cppignore.lnx-Ignore-PKCS12-=
and-testLaunch-test.patch
+++ b/meta-oe/recipes-support/poco/poco/0001-cppignore.lnx-Ignore-PKCS12-=
and-testLaunch-test.patch
@@ -1,4 +1,4 @@
-From ac0f06e20bdfaca74c8ab786be8ff8fc96b5a689 Mon Sep 17 00:00:00 2001
+From 879ddb725823c78c9510cfd39786adb16f3726c8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 16 Sep 2023 19:52:56 -0700
 Subject: [PATCH] cppignore.lnx: Ignore PKCS12 and testLaunch test
@@ -42,22 +42,25 @@ There were 4 failures:
=20
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
 ---
- cppignore.lnx | 8 ++++++++
- 1 file changed, 8 insertions(+)
+ cppignore.lnx | 9 +++++++++
+ 1 file changed, 9 insertions(+)
=20
+diff --git a/cppignore.lnx b/cppignore.lnx
+index 2c2376526..65df4af08 100644
 --- a/cppignore.lnx
 +++ b/cppignore.lnx
-@@ -26,3 +26,12 @@ N7CppUnit10TestCallerI9TimerTestEE.testS
- N7CppUnit10TestCallerI9TimerTestEE.testScheduleIntervalClock
- N7CppUnit10TestCallerI9TimerTestEE.testScheduleIntervalTimestamp
- N7CppUnit10TestCallerI9TimerTestEE.testTimer
-+N7CppUnit10TestCallerI11ProcessTestEE.testLaunch
-+N7CppUnit10TestCallerI11ProcessTestEE.testLaunchRedirectIn
-+N7CppUnit10TestCallerI11ProcessTestEE.testLaunchRedirectOut
-+N7CppUnit10TestCallerI11ProcessTestEE.testLaunchEnv
-+N7CppUnit10TestCallerI7EVPTestEE.testRSAEVPKeyFromPKCS12
-+N7CppUnit10TestCallerI19PKCS12ContainerTestEE.testFullPKCS12
-+N7CppUnit10TestCallerI19PKCS12ContainerTestEE.testCertsOnlyPKCS12
-+N7CppUnit10TestCallerI19PKCS12ContainerTestEE.testPEMReadWrite
-+N7CppUnit10TestCallerI11MongoDBTestEE.testArray
+@@ -28,3 +28,12 @@ CppUnit::TestCaller<HTTPSClientSessionTest>.testProxy
+ CppUnit::TestCaller<HTTPSStreamFactoryTest>.testProxy
+ CppUnit::TestCaller<DNSTest>.testHostByAddress
+ CppUnit::TestCaller<DNSTest>.testHostByName
++CppUnit::TestCaller<ProcessTest>.testLaunch
++CppUnit::TestCaller<ProcessTest>.testLaunchRedirectIn
++CppUnit::TestCaller<ProcessTest>.testLaunchRedirectOut
++CppUnit::TestCaller<ProcessTest>.testLaunchEnv
++CppUnit::TestCaller<EVPTest>.testRSAEVPKeyFromPKCS12
++CppUnit::TestCaller<PKCS12ContainerTest>.testFullPKCS12
++CppUnit::TestCaller<PKCS12ContainerTest>.testCertsOnlyPKCS12
++CppUnit::TestCaller<PKCS12ContainerTest>.testPEMReadWrite
++CppUnit::TestCaller<MongoDBTest>.testArray
diff --git a/meta-oe/recipes-support/poco/poco/0002-fix-build-Install-cma=
ke-files-with-resolved-ENABLE_J.patch b/meta-oe/recipes-support/poco/poco=
/0002-fix-build-Install-cmake-files-with-resolved-ENABLE_J.patch
new file mode 100644
index 000000000..427cb9723
--- /dev/null
+++ b/meta-oe/recipes-support/poco/poco/0002-fix-build-Install-cmake-file=
s-with-resolved-ENABLE_J.patch
@@ -0,0 +1,32 @@
+From e54478c936493c0ed87e875f04127bd13642de44 Mon Sep 17 00:00:00 2001
+From: tyler92 <tyler92@inbox.ru>
+Date: Tue, 21 Nov 2023 05:07:24 +0300
+Subject: [PATCH] fix(build): Install cmake files with resolved ENABLE_JS=
ON and
+ ENABLE_XML (#4227)
+
+Upstream-Status: Backport [https://github.com/pocoproject/poco/pull/4227=
]
+Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
+
+---
+ Util/cmake/PocoUtilConfig.cmake | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Util/cmake/PocoUtilConfig.cmake b/Util/cmake/PocoUtilConfig=
.cmake
+index 90c1eab1c..8186435e1 100644
+--- a/Util/cmake/PocoUtilConfig.cmake
++++ b/Util/cmake/PocoUtilConfig.cmake
+@@ -1,9 +1,9 @@
+ include(CMakeFindDependencyMacro)
+ find_dependency(PocoFoundation)
+-if(ENABLE_XML)
++if(@ENABLE_XML@)
+ 	find_dependency(PocoXML)
+ endif()
+-if(ENABLE_JSON)
++if(@ENABLE_JSON@)
+ 	find_dependency(PocoJSON)
+ endif()
+ include("${CMAKE_CURRENT_LIST_DIR}/PocoUtilTargets.cmake")
+--=20
+2.43.0
+
diff --git a/meta-oe/recipes-support/poco/poco_1.12.4.bb b/meta-oe/recipe=
s-support/poco/poco_1.12.5p2.bb
similarity index 97%
rename from meta-oe/recipes-support/poco/poco_1.12.4.bb
rename to meta-oe/recipes-support/poco/poco_1.12.5p2.bb
index 12532e4ef..a0bb0b5d9 100644
--- a/meta-oe/recipes-support/poco/poco_1.12.4.bb
+++ b/meta-oe/recipes-support/poco/poco_1.12.5p2.bb
@@ -11,10 +11,10 @@ DEPENDS =3D "libpcre2 zlib"
 SRC_URI =3D "git://github.com/pocoproject/poco.git;branch=3Dmaster;proto=
col=3Dhttps \
            file://0001-Use-std-atomic-int-instead-of-std-atomic-bool.pat=
ch \
            file://0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.p=
atch \
-           file://0001-Fix-data-race-when-create-POSIX-thread.patch \
            file://run-ptest \
+           file://0002-fix-build-Install-cmake-files-with-resolved-ENABL=
E_J.patch \
            "
-SRCREV =3D "1211613642269b7d53bea58b02de7fcd25ece3b9"
+SRCREV =3D "1d6fb3e1383e559cacbada5e3f861c0dafaf5d30"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "poco-(?P<pver>\d+(\.\d+)+)"
=20
--=20
2.43.0


