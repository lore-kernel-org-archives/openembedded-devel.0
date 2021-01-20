Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.26498.1611141040766064035
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 03:10:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45624 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l2BNm-0007qB-Ok; Wed, 20 Jan 2021 13:10:39 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-pyserial: Upgrade 3.4 -> 3.5
Date: Wed, 20 Jan 2021 13:10:27 +0200
Message-Id: <20210120111027.12947-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210120111027.12947-1-leon.anavi@konsulko.com>
References: <20210120111027.12947-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.5:

- iAdd a backend for Silicon Labs CP2110/4 HID-to-UART bridge.
  (depends on hid module)
- Use absolute import everywhere
- win32: miniterm Working CMD.exe terminal using Windows 10 ANSI
  support
- Make ListPortInfo hashable
- threaded: "write" returns byte count
- Add bytesize and stopbits argument parser to tcp_serial_redirect
- loop: add out_waiting
- list_ports_linux: Correct "interface" property on Linux hosts
- Remove Python 3.2 and 3.3 from test
- doc updates
- miniterm: add CTRL+T Q as alternative to exit
- miniterm: suspend function key changed to CTRL-T Z
- add command line tool entries pyserial-miniterm (replaces
  miniterm.py) and pyserial-ports (runs serial.tools.list_ports).
- python -m serial opens miniterm (use w/o args and it will print
  port list too) [experimental]
- Don't open port if self.port is not set while entering context
  manager
- refactor: raise new instances for PortNotOpenError and
  SerialTimeoutException
- list_ports: set default name attribute
- fix: compare only of the same type in
  list_ports_common.ListPortInfo
- rfc2217/close(): fix race-condition
- return b'' when connection closes on rfc2217 connection
- rfc2217/close(): fix race condition
- Fixed flush_input_buffer() for situations where the remote end
  has closed the socket.
- reset_input_buffer() can hang on sockets
- examples: port_publisher python 3 fixes
- miniterm: Fix miniterm constructor exit_character and
  menu_character
- miniterm: use exclusive access for native serial ports by
  default
- miniterm: fix double use of CTRL-T + s use z for suspend instead
- examples: refactor wx example, use Bind to avoid deprecated
  warnings, IsChecked, unichr
- posix: fix PosixPollSerial with timeout=None and add cancel
  support
- option for low latency mode on linux
- Add support to xr-usb-serial ports
- posix: Don't catch the SerialException we just raised
- posix: Fix custom baud rate to not temporarily set 38400 baud
  rates on linux
- list_ports: use hardcoded path to library on osx

Following the rename of miniterm.py and the new command line tool
entry, task do_install_append has been updated accordingly.

License-Update: Update year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyserial_3.4.bb => python3-pyserial_3.5.bb}  | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyserial_3.4.bb => python3-pyserial_3.5.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pyserial_3.4.bb b/meta-python/recipes-devtools/python/python3-pyserial_3.5.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pyserial_3.4.bb
rename to meta-python/recipes-devtools/python/python3-pyserial_3.5.bb
index d65c9a88b..4be80e28c 100644
--- a/meta-python/recipes-devtools/python/python3-pyserial_3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyserial_3.5.bb
@@ -1,14 +1,14 @@
 SUMMARY = "Serial Port Support for Python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d476d94926db6e0008a5b3860d1f5c0d"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=520e45e59fc2cf94aa53850f46b86436"
 
-SRC_URI[md5sum] = "ed6183b15519a0ae96675e9c3330c69b"
-SRC_URI[sha256sum] = "6e2d401fdee0eab996cf734e67773a0143b932772ca8b42451440cfed942c627"
+SRC_URI[sha256sum] = "3c77e014170dfffbd816e6ffc205e9842efb10be9f58ec16d3e8675b4925cddb"
 
 inherit pypi setuptools3 ptest
 
 do_install_append() {
-    rm -f ${D}${bindir}/miniterm.py
+    rm -f ${D}${bindir}/pyserial-miniterm
+    rm -f ${D}${bindir}/pyserial-ports
     rmdir ${D}${bindir}
 }
 
-- 
2.17.1

