Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.7099.1614683178342507534
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 03:06:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34872 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lH2r0-0004OA-8Q; Tue, 02 Mar 2021 13:06:15 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-twisted: Upgrade 20.3.0 -> 21.2.0
Date: Tue,  2 Mar 2021 13:06:06 +0200
Message-Id: <20210302110606.18503-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 21.2.0:

- The enableSessions argument to twisted.internet.ssl.CertificateOptions
  now actually enables/disables OpenSSL's session cache. Also, due
  to session-related bugs, it defaults to False.
- twisted.internet.defer.inlineCallbacks and ensureDeferred will
  now associate a contextvars.Context with the coroutines they run,
  meaning that ContextVar objects will maintain their value within
  the same coroutine, similarly to asyncio Tasks. This functionality
  requires Python 3.7+, or the contextvars PyPI backport to be
  installed for Python 3.5-3.6.
- twisted.internet.defer.Deferred.fromCoroutine has been added.
  This is similar to the existing ensureDeferred function, but is
  named more consistently inside Twisted and does not pass through
  Deferreds.
- trial now allows the @unittest.skipIf decorator to specify that
  an entire test class should be skipped.
- The twisted.python.deprecate.deprecatedKeywordParameter decorator
  can be used to mark a keyword paramater of a function or method
  as deprecated.
- Projects using Twisted can now perform type checking against a
  Twisted installation, for example using mypy.
- twisted.python.util.InsensitiveDict now fully implements
  MutableMapping.
- Python 3.8 is now tested and supported.
- Support a coroutine function in twisted.internet.task.react.
- PyPy 3.7 is now tested and supported.
- twisted.web.twcgi.CGIProcessProtocol.processEnded(...) now
  handles an already-finished request, for example when
  request.connectionLost(...) was called previously.
- Twisted's dependency on PyHamcrest has been moved from the base
  package to the new "test" extra. Consequently the test extra
  must be installed for Twisted's test suite to pass.
- Fixed serialization of timedelta, date, and time objects in
  twisted.spread.
- twisted.internet.asyncioreactor.AsyncioSelectorReactor now raises
  an exception if instantiated with an event loop which is not
  compatible with asyncio.SelectorEventLoop. This fixes the
  AsyncioSelectorReactor in Python 3.8+ on Windows, where in bp-34687
  the default Windows asyncio event loop was changed to
  ProactorEventLoop. Applications that use AsyncioSelectorReactor
  on Windows with Python 3.8+ must call
  asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())
  before instantiating and running AsyncioSelectorReactor.
- twisted.internet.process.registerReapProcessHandler and
  ._BaseProcess.reapProcess will no longer raise a TypeError when
  processing a None PID
- INotify will close its file descriptor if a directory is
  automatically removed by twisted from the watchlist because it's
  deleted, avoiding orphaned filedescriptors.
- DelayedCall.reset() is now working properly with asyncioreactor.
- AsyncioSelectorReactor.seconds() now correctly returns an epoch
  time.
- The _connDone parameter has been removed from
  twisted.internet.abstract.FileDescriptor.loseConnection()'s
  signature in order to match the signature in the base class
  twisted.internet._newtls.ConnectionMixin loseConnection().
- The Gtk3 reactor now runs on Wayland-only sessions
- Descriptive error messages from twisted.internet.error are now
  present when running with 'python -OO'.
- Comparator methods such as eq() now always return NotImplemented
  for uncomparable types.
- When installing Twisted it now requires a minimum Python 3.5.4
  version to match the version used with automated testing. This
  is the minimum Python version that we know that Twisted works
  with.

License-Update: Add contributors and update year.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-twisted_20.3.0.bb => python3-twisted_21.2.0.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-twisted_20.3.0.bb => python3-twisted_21.2.0.bb} (98%)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_20.3.0.bb b/meta-python/recipes-devtools/python/python3-twisted_21.2.0.bb
similarity index 98%
rename from meta-python/recipes-devtools/python/python3-twisted_20.3.0.bb
rename to meta-python/recipes-devtools/python/python3-twisted_21.2.0.bb
index 697725fd71..e0f1a8ca6e 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_20.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_21.2.0.bb
@@ -5,13 +5,11 @@ HOMEPAGE = "http://www.twistedmatrix.com"
 
 #twisted/topfiles/NEWS:655: - Relicensed: Now under the MIT license, rather than LGPL.
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=27ac6d9597237e7e76282edd7a40cd68"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e33c411c0b86b1f3ca299091ed51ca31"
 
-SRC_URI[sha256sum] = "d72c55b5d56e176563b91d11952d13b01af8725c623e498db5507b6614fc1e10"
-SRC_URI[md5sum] = "fc16d575730db7d0cddd09fc35af3eea"
+SRC_URI[sha256sum] = "77544a8945cf69b98d2946689bbe0c75de7d145cdf11f391dd487eae8fc95a12"
 
 PYPI_PACKAGE = "Twisted"
-PYPI_PACKAGE_EXT = "tar.bz2"
 
 inherit pypi setuptools3
 
@@ -201,6 +199,7 @@ ${libdir}/${PYTHON_DIR}/site-packages/Twisted*egg-info \
 ${libdir}/${PYTHON_DIR}/site-packages/twisted/logger/ \
 ${libdir}/${PYTHON_DIR}/site-packages/twisted/_threads/ \
 ${libdir}/${PYTHON_DIR}/site-packages/twisted/positioning/ \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/py.typed \
 "
 
 FILES_${PN}-mail = " \
-- 
2.17.1

