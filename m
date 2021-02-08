Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.962.1612819377784423565
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Feb 2021 13:22:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JKLW8mZb;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id v15so18912991wrx.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Feb 2021 13:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HZFJIsjCmB4jUARt8335ElVOL3rZQKnRGsr++PJhF1U=;
        b=JKLW8mZb2NO1xNwsbES5bQF59MKIcPMBOTyYSo/u6Be4Q+6tbz6OPuPStINHY3IwFw
         NZ/YNmhlLETo6Z/27q/1TYl8/mGAu1MZuiLIUNIMKOkfrn8Os1840Mv8bTKyv+8BhDU9
         /6Skhqi9IcEEsLl3ETx3gLrjrgE7ycUEDYyBU3yGsfOZ1pbQOo/AzwrPS8YZ0viDp2Nf
         IzL+NSA3Mz6z9qtGCbzf2UYnqA49OT1vHq1QQ+HfeK1X1H8zgfsShI+MaNT3JYDK0xRy
         Ap6nkGJf2t1g9Hd/1eMfy5hzxmmwrcw2MFIh05kipHKXuLIQ6ezRKndfYFZtgTP/6CHY
         Vs/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HZFJIsjCmB4jUARt8335ElVOL3rZQKnRGsr++PJhF1U=;
        b=DEPr+BmCjgZgAgi6Uy1uZ1m135LLM5omzdWVviSNLwWaH/WR7jTV/Ubf69KWj7JnMq
         +zzrB5h/UuRV+WoEGWkLzVV+4BldD5X7ABqnQ5c5OPuvu/U7vr/jaN0MBXKtTkcNDhOp
         DzUvcLtX0FGm/uSun8NaTLAAwbeO95Q5B30m+ukE7X/9DHkNVT3jbt+oPpqCvMHiaUcu
         wJfsgk7bwFm8NrYvQyHbho/BXNcAyQS4CHHJN6G9cT6XY8+40r8iOTmJJjY1njH2lnid
         qf2LLQ5xm1bmtXobyqJAG1VTDO2FEbk0pqGlkmXkNTAfmYJQjXeSwEG4jknoFw8K6t7r
         7uyQ==
X-Gm-Message-State: AOAM530U0Q9RaiNLTdqpzTB107ueXDxSxA2D9J1Vrg1AaYSkD1MI4FTV
	l0Os4MNzmiL5BxqPnf7Cmzr1yUHKl/A=
X-Google-Smtp-Source: ABdhPJyagwYKcxsE5mGisgVDPKWxyrYd8kxEIyiIjniog4bx2GicU/RQpyH+INt9SP2XPsag3Y2bfw==
X-Received: by 2002:adf:ee4c:: with SMTP id w12mr14732497wro.307.1612819375639;
        Mon, 08 Feb 2021 13:22:55 -0800 (PST)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from Unimatrix08-Focal.lan ([5.170.140.92])
        by smtp.gmail.com with ESMTPSA id k6sm33803911wro.27.2021.02.08.13.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 13:22:54 -0800 (PST)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Subject: [meta-oe][PATCH] mosquitto: Upgrade 1.6.12 -> 2.0.7
Date: Mon,  8 Feb 2021 22:22:50 +0100
Message-Id: <20210208212250.486049-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- drop patch install-protocol.patch: upstream
- add new cjson and dlt-daemon dependencies
- update copyright and license
- add build of manpages optionally via PACKAGECONFIG
- also install the new mosquitto_ctrl and mosquitto_dynamic_security.so tools

2.0.7 - 2021-02-04
==================

Broker:
- Fix exporting of executable symbols on BSD when building via makefile.
- Fix some minor memory leaks on exit only.
- Fix possible memory leak on connect. Closes #2057.
- Fix openssl engine not being able to load private key. Closes #2066.

Clients:
- Fix config files truncating options after the first space. Closes #2059.

Build:
- Fix man page building to not absolutely require xsltproc when using CMake.
  This now handles the case where we are building from the released tar, or
  building from git if xsltproc is available, or building from git if xsltproc
  is not available.

1.6.13 - 2021-02-04
===================

Broker:
- Fix crash on Windows if loading a plugin fails. Closes #1866.
- Fix DH group not being set for TLS connections, which meant ciphers using
  DHE couldn't be used. Closes #1925. Closes #1476.
- Fix local bridges being disconnected on SIGHUP. Closes #1942.
- Fix $SYS/broker/publish/messages/+ counters not being updated for QoS 1, 2
  messages. Closes #1968.
- Fix listener not being reassociated with client when reloading a persistence
  file and `per_listener_settings true` is set and the client did not set a
  username. Closes #1891.
- Fix file logging on Windows. Closes #1880.
- Fix bridge sock not being removed from sock hash on error. Closes #1897.

Client library:
- Fix build on Mac Big Sur. Closes #1905.
- Fix DH group not being set for TLS connections, which meant ciphers using
  DHE couldn't be used. Closes #1925. Closes #1476.

Clients:
- mosquitto_sub will now quit with an error if the %U option is used on
  Windows, rather than just quitting. Closes #1908.
- Fix config files truncating options after the first space. Closes #2059.

Apps:
- Perform stricter parsing of input username in mosquitto_passwd. Closes
  #570126 (Eclipse bugzilla).

Build:
- Enable epoll support in CMake builds.

2.0.6 - 2021-01-28
==================

Broker:
- Fix calculation of remaining length parameter for websockets clients that
  send fragmented packets. Closes #1974.
Broker:
- Fix potential duplicate Will messages being sent when a will delay interval
  has been set.
- Fix message expiry interval property not being honoured in
  `mosquitto_broker_publish` and `mosquitto_broker_publish_copy`.
- Fix websockets listeners with TLS not responding. Closes #2020.
- Add notes that libsystemd-dev or similar is needed if building with systemd
  support. Closes #2019.
- Improve logging in obscure cases when a client disconnects. Closes #2017.
- Fix reloading of listeners where multiple listeners have been defined with
  the same port but different bind addresses. Closes #2029.
- Fix `message_size_limit` not applying to the Will payload. Closes #2022.
- The error topic-alias-invalid was being sent if an MQTT v5 client published
  a message with empty topic and topic alias set, but the topic alias hadn't
  already been configured on the broker. This has been fixed to send a
  protocol error, as per section 3.3.4 of the specification.
- Note in the man pages that SIGHUP reloads TLS certificates. Closes #2037.
- Fix bridges not always connecting on Windows. Closes #2043.

Apps:
- Allow command line arguments to override config file options in
  mosquitto_ctrl. Closes #2010.
- mosquitto_ctrl: produce an error when requesting a new password if both
  attempts do not match. Closes #2011.

Build:
- Fix cmake builds using `WITH_CJSON=no` not working if cJSON not found.
  Closes #2026.

Other:
- The SPDX identifiers for EDL-1.0 have been changed to BSD-3-Clause as per
  The Eclipse legal documentation generator. The licenses are identical.

2.0.5 - 2021-01-11
==================

Broker:
- Fix `auth_method` not being provided to the extended auth plugin event.
  Closes #1975.
- Fix large packets not being completely published to slow clients.
  Closes #1977.
- Fix bridge connection not relinquishing POLLOUT after messages are sent.
  Closes #1979.
- Fix apparmor incorrectly denying access to
  /var/lib/mosquitto/mosquitto.db.new. Closes #1978.
- Fix potential intermittent initial bridge connections when using poll().
- Fix `bind_interface` option. Closes #1999.
- Fix invalid behaviour in dynsec plugin if a group or client is deleted
  before a role that was attached to the group or client is deleted.
  Closes #1998.
- Improve logging in dynsec addGroupRole command. Closes #2005.
- Improve logging in dynsec addGroupClient command. Closes #2008.

Client library:
- Improve documentation around the `_v5()` and non-v5 functions, e.g.
  `mosquitto_publish()` and `mosquitto_publish_v5().

Build:
- `install` Makefile target should depend on `all`, not `mosquitto`, to ensure
  that man pages are always built. Closes #1989.
- Fixes for lots of minor build warnings highlighted by Visual Studio.

Apps:
- Disallow control characters in mosquitto_passwd usernames.
- Fix incorrect description in mosquitto_ctrl man page. Closes #1995.
- Fix `mosquitto_ctrl dynsec getGroup` not showing roles. Closes #1997.

2.0.4 - 2020-12-22
==================

Broker:
- Fix $SYS/broker/publish/messages/+ counters not being updated for QoS 1, 2
  messages. Closes #1968.
- mosquitto_connect_bind_async() and mosquitto_connect_bind_v5() should not
  reset the bind address option if called with bind_address == NULL.
- Fix dynamic security configuration possibly not being reloaded on Windows
  only. Closes #1962.
- Add more log messages for dynsec load/save error conditions.
- Fix websockets connections blocking non-websockets connections on Windows.
  Closes #1934.

Build:
- Fix man pages not being built when using CMake. Closes #1969.

2.0.3 - 2020-12-17
==================

Security:
- Running mosquitto_passwd with the following arguments only
  `mosquitto_passwd -b password_file username password` would cause the
  username to be used as the password.

Broker:
- Fix excessive CPU use on non-Linux systems when the open file limit is set
  high. Closes #1947.
- Fix LWT not being sent on client takeover when the existing session wasn't
  being continued. Closes #1946.
- Fix bridges possibly not completing connections when WITH_ADNS is in use.
  Closes #1960.
- Fix QoS 0 messages not being delivered if max_queued_messages was set to 0.
  Closes #1956.
- Fix local bridges being disconnected on SIGHUP. Closes #1942.
- Fix slow initial bridge connections for WITH_ADNS=no.
- Fix persistence_location not appending a '/'.

Clients:
- Fix mosquitto_sub being unable to terminate with Ctrl-C if a successful
  connection is not made. Closes #1957.

Apps:
- Fix `mosquitto_passwd -b` using username as password (not if `-c` is also
  used). Closes #1949.

Build:
- Fix `install` target when using WITH_CJSON=no. Closes #1938.
- Fix `generic` docker build. Closes #1945.

2.0.2 - 2020-12-10
==================

Broker:
- Fix build regression for WITH_WEBSOCKETS=yes on non-Linux systems.

2.0.1 - 2020-12-10
==================

Broker:
- Fix websockets connections on Windows blocking subsequent connections.
  Closes #1934.
- Fix DH group not being set for TLS connections, which meant ciphers using
  DHE couldn't be used. Closes #1925. Closes #1476.
- Fix websockets listeners not causing the main loop not to wake up.
  Closes #1936.

Client library:
- Fix DH group not being set for TLS connections, which meant ciphers using
  DHE couldn't be used. Closes #1925. Closes #1476.

Apps:
- Fix `mosquitto_passwd -U`

Build:
- Fix cjson include paths.
- Fix build using WITH_TLS=no when the openssl headers aren't available.
- Distribute cmake/ and snap/ directories in tar.

2.0.0 - 2020-12-03
==================

Breaking changes:
- When the Mosquitto broker is run without configuring any listeners it will
  now bind to the loopback interfaces 127.0.0.1 and/or ::1. This means that
  only connections from the local host will be possible.

  Running the broker as `mosquitto` or `mosquitto -p 1883` will bind to the
  loopback interface.

  Running the broker with a configuration file with no listeners configured
  will bind to the loopback interface with port 1883.

  Running the broker with a listener defined will bind by default to `0.0.0.0`
  / `::` and so will be accessible from any interface. It is still possible to
  bind to a specific address/interface.

  If the broker is run as `mosquitto -c mosquitto.conf -p 1884`, and a
  listener is defined in the configuration file, then the port defined on the
  command line will be IGNORED, and no listener configured for it.
- All listeners now default to `allow_anonymous false` unless explicitly set
  to true in the configuration file. This means that when configuring a
  listener the user must either configure an authentication and access control
  method, or set `allow_anonymous true`. When the broker is run without a
  configured listener, and so binds to the loopback interface, anonymous
  connections are allowed.
- If Mosquitto is run on as root on a unix like system, it will attempt to
  drop privileges as soon as the configuration file has been read. This is in
  contrast to the previous behaviour where elevated privileges were only
  dropped after listeners had been started (and hence TLS certificates loaded)
  and logging had been started. The change means that clients will never be
  able to connect to the broker when it is running as root, unless the user
  explicitly sets it to run as root, which is not advised. It also means that
  all locations that the broker needs to access must be available to the
  unprivileged user. In particular those people using TLS certificates from
  Lets Encrypt will need to do something to allow Mosquitto to access
  those certificates. An example deploy renewal hook script to help with this
  is at `misc/letsencrypt/mosquitto-copy.sh`.
  The user that Mosquitto will change to are the one provided in the
  configuration, `mosquitto`, or `nobody`, in order of availability.
- The `pid_file` option will now always attempt to write a pid file,
  regardless of whether the `-d` argument is used when running the broker.
- The `tls_version` option now defines the *minimum* TLS protocol version to
  be used, rather than the exact version. Closes #1258.
- The `max_queued_messages` option has been increased from 100 to 1000 by
  default, and now also applies to QoS 0 messages, when a client is connected.
- The mosquitto_sub, mosquitto_pub, and mosquitto_rr clients will now load
  OS provided CA certificates by default if `-L mqtts://...` is used, or if
  the port is set to 8883 and no other CA certificates are loaded.
- Minimum support libwebsockets version is now 2.4.0
- The license has changed from "EPL-1.0 OR EDL-1.0" to "EPL-2.0 OR EDL-1.0".

Broker features:
- New plugin interface which is more flexible, easier to develop for and
  easier to extend.
- New dynamic security plugin, which allows clients, groups, and roles to be
  defined and updated as the broker is running.
- Performance improvements, particularly for higher numbers of clients.
- When running as root, if dropping privileges to the "mosquitto" user fails,
  then try "nobody" instead. This reduces the burden on users installing
  Mosquitto themselves.
- Add support for Unix domain socket listeners.
- Add `bridge_outgoing_retain` option, to allow outgoing messages from a
  bridge to have the retain bit completely disabled, which is useful when
  bridging to e.g. Amazon or Google.
- Add support for MQTT v5 bridges to handle the "retain-available" property
  being false.
- Allow MQTT v5.0 outgoing bridges to fall back to MQTT v3.1.1 if connecting
  to a v3.x only broker.
- DLT logging is now configurable at runtime with `log_dest dlt`.
  Closes #1735.
- Add `mosquitto_broker_publish()` and `mosquitto_broker_publish_copy()`
  functions, which can be used by plugins to publish messages.
- Add `mosquitto_client_protocol_version()` function which can be used by
  plugins to determine which version of MQTT a client has connected with.
- Add `mosquitto_kick_client_by_clientid()` and `mosquitto_kick_client_by_username()`
  functions, which can be used by plugins to disconnect clients.
- Add support for handling $CONTROL/ topics in plugins.
- Add support for PBKDF2-SHA512 password hashing.
- Enabling certificate based TLS encryption is now through certfile and
  keyfile, not capath or cafile.
- Added support for controlling UNSUBSCRIBE calls in v5 plugin ACL checks.
- Add "deny" acl type. Closes #1611.
- The broker now sends the receive-maximum property for MQTT v5 CONNACKs.
- Add the `bridge_max_packet_size` option. Closes #265.
- Add the `bridge_bind_address` option. Closes #1311.
- TLS certificates for the server are now reloaded on SIGHUP.
- Default for max_queued_messages has been changed to 1000.
- Add `ciphers_tls1.3` option, to allow setting TLS v1.3 ciphersuites.
  Closes #1825.
- Bridges now obey MQTT v5 server-keepalive.
- Add bridge support for the MQTT v5 maximum-qos property.
- Log client port on new connections. Closes #1911.

Broker fixes:
- Send DISCONNECT with `malformed-packet` reason code on invalid PUBLISH,
  SUBSCRIBE, and UNSUBSCRIBE packets.
- Document that X509_free() must be called after using
  mosquitto_client_certificate(). Closes #1842.
- Fix listener not being reassociated with client when reloading a persistence
  file and `per_listener_settings true` is set and the client did not set a
  username. Closes #1891.
- Fix bridge sock not being removed from sock hash on error. Closes #1897.
- mosquitto_password now forbids the : character. Closes #1833.
- Fix `log_timestamp_format` not applying to `log_dest topic`. Closes #1862.
- Fix crash on Windows if loading a plugin fails. Closes #1866.
- Fix file logging on Windows. Closes #1880.
- Report an error if the config file is set to a directory. Closes #1814.
- Fix bridges incorrectly setting Wills to manage remote notifications when
  `notifications_local_only` was set true. Closes #1902.

Client library features:
- Client no longer generates random client ids for v3.1.1 clients, these are
  now expected to be generated on the broker. This matches the behaviour for
  v5 clients. Closes #291.
- Add support for connecting to brokers through Unix domain sockets.
- Add `mosquitto_property_identifier()`, for retrieving the identifier integer
  for a property.
- Add `mosquitto_property_identifier_to_string()` for converting a property
  identifier integer to the corresponding property name string.
- Add `mosquitto_property_next()` to retrieve the next property in a list, for
  iterating over property lists.
- mosquitto_pub now handles the MQTT v5 retain-available property by never
  setting the retain bit.
- Added MOSQ_OPT_TCP_NODELAY, to allow disabling Nagle's algorithm on client
  sockets. Closes #1526.
- Add `mosquitto_ssl_get()` to allow clients to access their SSL structure and
  perform additional verification.
- Add MOSQ_OPT_BIND_ADDRESS to allow setting of a bind address independently
  of the `mosquitto_connect*()` call.
- Add `MOSQ_OPT_TLS_USE_OS_CERTS` option, to instruct the client to load and
  trust OS provided CA certificates for use with TLS connections.

Client library fixes:
- Fix send quota being incorrecly reset on reconnect. Closes #1822.
- Don't use logging until log mutex is initialised. Closes #1819.
- Fix missing mach/mach_time.h header on OS X. Closes #1831.
- Fix connect properties not being sent when the client automatically
  reconnects. Closes #1846.

Client features:
- Add timeout return code (27) for `mosquitto_sub -W <secs>` and
  `mosquitto_rr -W <secs>`. Closes #275.
- Add support for connecting to brokers through Unix domain sockets with the
  `--unix` argument.
- Use cJSON library for producing JSON output, where available. Closes #1222.
- Add support for outputting MQTT v5 property information to mosquitto_sub/rr
  JSON output. Closes #1416.
- Add `--pretty` option to mosquitto_sub/rr for formatted/unformatted JSON
  output.
- Add support for v5 property printing to mosquitto_sub/rr in non-JSON mode.
  Closes #1416.
- Add `--nodelay` to all clients to allow them to use the MOSQ_OPT_TCP_NODELAY
  option.
- Add `-x` to all clients to all the session-expiry-interval property to be
  easily set for MQTT v5 clients.
- Add `--random-filter` to mosquitto_sub, to allow only a certain proportion
  of received messages to be printed.
- mosquitto_sub %j and %J timestamps are now in a ISO 8601 compatible format.
- mosquitto_sub now supports extra format specifiers for field width and
  precision for some parameters.
- Add `--version` for all clients.
- All clients now load OS provided CA certificates if used with `-L
  mqtts://...`, or if port is set to 8883 and no other CA certificates are
  used. Closes #1824.
- Add the `--tls-use-os-certs` option to all clients.

Client fixes:
- mosquitto_sub will now exit if all subscriptions were denied.
- mosquitto_pub now sends 0 length files without an error when using `-f`.
- Fix description of `-e` and `-t` arguments in mosquitto_rr. Closes #1881.
- mosquitto_sub will now quit with an error if the %U option is used on
  Windows, rather than just quitting. Closes #1908.

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
---
 .../mosquitto/files/1571.patch                 |  2 +-
 .../mosquitto/files/install-protocol.patch     | 14 --------------
 ...{mosquitto_1.6.12.bb => mosquitto_2.0.7.bb} | 18 ++++++++++--------
 3 files changed, 11 insertions(+), 23 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/mosquitto/files/install-protocol.patch
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_1.6.12.bb => mosquitto_2.0.7.bb} (81%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/files/1571.patch b/meta-networking/recipes-connectivity/mosquitto/files/1571.patch
index 93ff6bcfa..37560f30c 100644
--- a/meta-networking/recipes-connectivity/mosquitto/files/1571.patch
+++ b/meta-networking/recipes-connectivity/mosquitto/files/1571.patch
@@ -11,7 +11,7 @@ Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
 
 --- a/lib/CMakeLists.txt
 +++ b/lib/CMakeLists.txt
-@@ -89,6 +89,8 @@
+@@ -94,6 +94,8 @@
  	OUTPUT_NAME mosquitto
  	VERSION ${VERSION}
  	SOVERSION 1
diff --git a/meta-networking/recipes-connectivity/mosquitto/files/install-protocol.patch b/meta-networking/recipes-connectivity/mosquitto/files/install-protocol.patch
deleted file mode 100644
index 1397fc6a2..000000000
--- a/meta-networking/recipes-connectivity/mosquitto/files/install-protocol.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Description: Also install mqtt_protocol.h, as is done in Makefile
-Author: Gianfranco Costamagna <locutusofborg@debian.org>
-Bug-Debian: https://bugs.debian.org/951116
-Forwarded: https://github.com/eclipse/mosquitto/pull/1599
-Last-Update: 2020-02-15
-
---- a/lib/CMakeLists.txt
-+++ b/lib/CMakeLists.txt
-@@ -114,4 +114,4 @@
- 	install(TARGETS libmosquitto_static ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}")
- endif (WITH_STATIC_LIBRARIES)
- 
--install(FILES mosquitto.h DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}")
-+install(FILES mqtt_protocol.h mosquitto.h DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}")
diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.12.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.7.bb
similarity index 81%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.12.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.7.bb
index 36bfe099f..06220327e 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.12.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.7.bb
@@ -6,22 +6,21 @@ provides a lightweight method of carrying out messaging using a \
 publish/subscribe model. "
 HOMEPAGE = "http://mosquitto.org/"
 SECTION = "console/network"
-LICENSE = "EPL-1.0 | EDL-1.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=62ddc846179e908dc0c8efec4a42ef20 \
+LICENSE = "EPL-2.0 | EDL-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ca9a8f366c6babf593e374d0d7d58749 \
                     file://edl-v10;md5=c09f121939f063aeb5235972be8c722c \
-                    file://epl-v10;md5=8d383c379e91d20ba18a52c3e7d3a979 \
-                    file://notice.html;md5=a00d6f9ab542be7babc2d8b80d5d2a4c \
+                    file://epl-v20;md5=d9fc0efef5228704e7f5b37f27192723 \
+                    file://notice.html;md5=541f8f37af492858dab8d2c1b69ede69 \
 "
-DEPENDS = "uthash"
+DEPENDS = "uthash cjson dlt-daemon"
 
 SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://mosquitto.init \
            file://1571.patch \
-           file://install-protocol.patch \
 "
 
-SRC_URI[md5sum] = "beb8d76d6e45f1e66d711006082a631f"
-SRC_URI[sha256sum] = "548d73d19fb787dd0530334e398fd256ef3a581181678488a741a995c4f007fb"
+SRC_URI[md5sum] = "56de4e27533ab53697245809feea95bf"
+SRC_URI[sha256sum] = "a98054f0b8161588975ef24e1d467550d3935f4c16ccee63ecb623248a28356e"
 
 inherit systemd update-rc.d useradd cmake
 
@@ -29,6 +28,7 @@ PACKAGECONFIG ??= "ssl dlt websockets \
                   ${@bb.utils.filter('DISTRO_FEATURES','systemd', d)} \
                   "
 
+PACKAGECONFIG[manpages] = "-DDOCUMENTATION=ON,-DDOCUMENTATION=OFF,libxslt-native docbook-xsl-stylesheets-native"
 PACKAGECONFIG[dns-srv] = "-DWITH_SRV=ON,-DWITH_SRV=OFF,c-ares"
 PACKAGECONFIG[ssl] = "-DWITH_TLS=ON -DWITH_TLS_PSK=ON -DWITH_EC=ON,-DWITH_TLS=OFF -DWITH_TLS_PSK=OFF -DWITH_EC=OFF,openssl"
 PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=ON,-DWITH_SYSTEMD=OFF,systemd"
@@ -59,6 +59,8 @@ PACKAGE_BEFORE_PN = "${PN}-examples"
 
 FILES_${PN} = "${sbindir}/mosquitto \
                ${bindir}/mosquitto_passwd \
+               ${bindir}/mosquitto_ctrl \
+               ${libdir}/mosquitto_dynamic_security.so \
                ${sysconfdir}/mosquitto \
                ${sysconfdir}/init.d \
                ${systemd_unitdir}/system/mosquitto.service \
-- 
2.25.1

