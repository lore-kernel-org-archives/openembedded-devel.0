Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.18956.1617009637888428565
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Mar 2021 02:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43130 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lQo4Z-0002Gp-P9; Mon, 29 Mar 2021 12:20:36 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/7] python3-gunicorn: Upgrade 20.0.4 -> 20.1.0
Date: Mon, 29 Mar 2021 12:20:21 +0300
Message-Id: <20210329092024.11922-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210329092024.11922-1-leon.anavi@konsulko.com>
References: <20210329092024.11922-1-leon.anavi@konsulko.com>
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

Upgrade to release 20.1.0:

- document WEB_CONCURRENCY is set by, at least, Heroku
- capture peername from accept: Avoid calls to getpeername by
  capturing the peer name returned by accept
- log a warning when a worker was terminated due to a signal
- fix tornado usage with latest versions of Django
- add support for python -m gunicorn
- fix systemd socket activation example
- allows to set wsgi application in configg file using wsgi_app
- document --timeout = 0
- always close a connection when the number of requests exceeds
  the max requests
- Disable keepalive during graceful shutdown
- kill tasks in the gthread workers during upgrade
- fix latency in gevent worker when accepting new requests
- fix file watcher: handle errors when new worker reboot and ensure
  the list of files is kept
- document the default name and path of the configuration file
- document how variable impact configuration
- document the $PORT environment variable
- added milliseconds option to request_time in access_log
- added PIP requirements to be used for example
- remove version from the Server header
- fix sendfile: use socket.sendfile instead of os.sendfile
- reloader: use absolute path to prevent empty to prevent0
  InotifyError when a file is added to the working directory
- Add --print-config option to print the resolved settings at
  startup.
- remove the --log-dict-config CLI flag because it never had a
  working format (the logconfig_dict setting in configuration
  files continues to work)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-gunicorn_20.0.4.bb => python3-gunicorn_20.1.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gunicorn_20.0.4.bb => python3-gunicorn_20.1.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-gunicorn_20.0.4.bb b/meta-python/recipes-devtools/python/python3-gunicorn_20.1.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-gunicorn_20.0.4.bb
rename to meta-python/recipes-devtools/python/python3-gunicorn_20.1.0.bb
index 23aafd67d..22fe495f4 100644
--- a/meta-python/recipes-devtools/python/python3-gunicorn_20.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-gunicorn_20.1.0.bb
@@ -3,8 +3,7 @@ SUMMARY = "WSGI HTTP Server for UNIX"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f75f3fb94cdeab1d607e2adaa6077752"
 
-SRC_URI[md5sum] = "543669fcbb5739ee2af77184c5e571a1"
-SRC_URI[sha256sum] = "1904bb2b8a43658807108d59c3f3d56c2b6121a701161de0ddf9ad140073c626"
+SRC_URI[sha256sum] = "e0a968b5ba15f8a328fdfd7ab1fcb5af4470c28aaf7e55df02a99bc13138e6e8"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

