Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10168.1794478184941537189
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2026 02:09:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Y3c5hsao;
 spf=pass (domain: konsulko.com, ip: 209.85.221.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4922523d1afso2430305f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 02:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794478183; x=1795082983; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TliCdPMB9ix3aHBND3pmJXzvsFWP4yp0a/0kA2uqxA4=;
        b=Y3c5hsaoNdEie4LnJe+3rmQwDoqrW+bYi+zzfBFWpFjOa6eCDUwtoxeo/z05kvRw1E
         tei+Uc4uFSnhCp/wThE7Lr2j5Xic5dBCOslv5urSmdS0KXH7PSkp2R0e14ZOnDG5GTDR
         OHfDzOoFztoQJKnewydDb9ATXtG9pHyuO5vJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478183; x=1795082983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TliCdPMB9ix3aHBND3pmJXzvsFWP4yp0a/0kA2uqxA4=;
        b=a7IJqw5J/OWbb+C/+SBXz+aqrd92Sq+MDpGP3G0+LBQbUAesh6WQhoPBFQMu4L/blI
         l5WTjJg+4IqIpfKhWLzXjWhMAEqadYg1oRDNmNhD4/XnvuA/R2cIexJHAXYUcgTdjay4
         ChOPPr4n7nINuJdYudchQ+tNi8gZuGtcGRl/Bg9xde+30G4zIM+r23UwOwgnKhUbuwv0
         evXUUm2byiNLS1+yCQ+aRbiaGhmOT6lu/5RsIV6+B33VuHm9iy/leFhV8YhkMLoqC3P0
         ZBhq06R1RgYV+WlWtDS1oOaFI6HvXg2OXZ83uFgr63R/NsKX4Ibd0S4KWeEserMbZ/jv
         Bimw==
X-Gm-Message-State: APuU4Z9q3EM9Yb8/gBTKz7ABGamQxkC3IfKcD550dwm4M2cEq/pSKgH7
	NxlpiSI8qfIJBqXFkF6cTgsfDCc55J2FzVQuVO/5mhFkuFEvbgtVEvL4rTFpzQ7j3b9ctjM0cRj
	C8oBA
X-Gm-Gg: AYBFou1oWvUSfXJXYkRwbvY5n7cEBhI6ZSHloSgmFGsICeBtyrfFKWaRi9gDQhFpn/X
	a+PD0cIFrrnD4NPG1Y+pIPcRwPXZoFGSmdrdljrksBvqmxG/vHeAY/DMGH/PKkPN0mWRzdVuQNe
	3Ac0AEqtm+LA7rqW076+B8VWvZShNh0rX7t3yIE5mSMVorR6oAr68oyY9oK3uoHSDoMHgi1zpbG
	16t3Jz4c60du2abFxVACiGGravxdhBUv+nPOefxic14BQDockAHEIbmD3FIHZTNwPHRWiciTXqd
	TK4dEY8kKsukYVOxL98ZSlT8MUMVxXoMpYy1kzn4Oi1KotkrvKVO/0EzviychtD0Zd2yO2+K9hl
	/m4GmgfPG47+3e+K1YUZH/FTVqG58uB7ftrcKsNlNiOiCFzwB1ngkP2aJeu/fG4Yh1OpYw7ZHKt
	K8Uez7TrjCWRPS2VsazLIUqUE6Pf5ovI7Wh5nU7wCyjrLI24OO5YTC3LICsrBw2N1kJDPSIixLi
	aHufZz70apW/cxvFmLboj0Mg88OylbWdUiWgKQUEXI6McUUgGh6IFRvBQoE9uj+iV+mGGiUqsdY
	dYhTcz6F87T+IBsmo2YUwwMOCBpoU6N7MGohsSftI02Qz1X1yQK3n6z1HtGMp2wOE7FKl40ehzH
	o3f5faPJbPqjBsjPuohkGkpWpCU3/+UL24dUWat4x/6q7Hkqh9cjwsg==
X-Received: by 2002:a05:600c:3544:b0:4a4:de70:2ad4 with SMTP id 5b1f17b1804b1-4ba0938e165mr93058505e9.22.1794478182210;
        Thu, 12 Nov 2026 02:09:42 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08ddd467sm98124865e9.0.2026.11.12.02.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:09:41 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-webserver][PATCH 1/2] netdata: Upgrade 2.10.4 -> 2.12.3
Date: Thu, 12 Nov 2026 12:09:37 +0200
Message-ID: <20261112100938.3170903-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 10:09:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132206
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.12.3:

- Fixed the MQTT keepalive of the Cloud connection. It was only
  checked when the connection was idle, so a link with steady
  inbound traffic never noticed an unanswered ping and could stay
  stalled indefinitely. The ping and acknowledgement deadlines also
  followed the wall clock, so a clock step caused a false ping
  timeout or delayed detection, and on boards without an RTC
  acknowledgements never timed out before the first NTP sync.
  Deadlines now use a monotonic clock, and a dead connection is
  detected 60 seconds after an unanswered ping.
- The Agent's HTTPS client for Netdata Cloud now checks the chunk
  sizes of chunked responses strictly and caps such responses at 1
  MiB. A malformed or very large chunk size could make the Agent
  exit while allocating memory for it.
- Fixed use-after-free crashes when netdatacli remove-stale-node or
  the orphan and ephemeral host cleanup removed a host that was
  still in use, either by a child reconnecting to it or by a plugin
  that had it selected as a virtual node. A child that reconnects
  during a removal is now asked to retry, and a virtual node
  selected by a plugin is reported as online and left alone.
- Removed the [stream] parent using h2o option. The h2o web server
  was removed in v2.7.0, and since v2.8.0 a child with this option
  enabled crashed on every connection attempt to its Parent. A
  stream.conf that still sets it is accepted and the option is
  ignored.
- Access lists: a client whose IP matches a negated entry, such as
  !203.0.113.7 in allow connections from = !203.0.113.7 *, is now
  denied without its hostname being checked against the list. This
  applies to every access list in netdata.conf when DNS checks are
  enabled, including the default heuristic mode for lists with a
  wildcard.
- URLs with malformed percent escapes are now rejected with HTTP
  400. A % had to be followed by two hex digits but was not
  checked, and a URL that failed to decode was served using the
  part decoded so far, so /api/v1/info%zz was answered as
  /api/v1/info. A request containing a literal % that is not
  followed by two hex digits, such as ?x=100%, now gets 400.
- The MCP API key and the management API key are now compared in
  constant time, so response timing no longer reveals how close a
  guessed key is.
- MCP: JSON-RPC batches are limited to 64 requests and 16 MiB of
  responses, and WebSocket messages to 1 MiB, the same as HTTP
  requests. Requests whose id is not a string, number or null are
  rejected.
- X-Forwarded-For: the Agent now keeps only the first address of
  the header, and only when it is a valid IPv4 or IPv6 address.
  This is the forwarded client address shown in the access log and
  in the audit entries of dynamic configuration changes. Other
  values, such as unknown, are dropped.
- Registry: the netdata_registry_id identity is now read only from
  the Cookie header, not from anywhere else in the request, such as
  the query string. This affects only Agents with the registry
  enabled, which is off by default.
- Claiming: a request to /api/v2/claim or /api/v3/claim with a
  wrong key no longer regenerates the claim challenge, so it cannot
  interrupt a claim an administrator is making. The challenge is
  still regenerated at startup and after a claim with a valid key.
- Fixed SQLite stalls across the Agent. A global lock was held
  around SQLite calls, so one slow statement blocked every thread
  using SQLite, not only those using the same database connection.
- Corruption of the metadata database that appears while the Agent
  is running is now marked for recovery on the first failing query,
  instead of only at a clean shutdown or never after a crash. The
  SQLite query statistics no longer count a busy retry that later
  succeeded as a failed query.
- Parents using the ram or alloc storage modes no longer shift
  their children's streamed and replicated history after a gap.
  Every gap moved all older values one interval earlier and
  overstated retention by one interval.
- dbengine now loads only datafiles with the exact name it writes.
  A copy such as datafile-1-0000000001.ndf.bak was loaded a second
  time alongside the real file, and a stray datafile-2-*.ndf
  stopped the Agent at startup. Other names are now reported as
  unknown files and skipped.
- Fixed crashes when the cleanup of obsolete charts freed a chart,
  or its labels, while health variable lookups, Prometheus export,
  alert and context API requests or queries were still reading it.
  These include the Agent exiting on an allocation of a huge size.
- dbengine: the Agent no longer hangs at startup when the directory
  of a tier cannot be created or its initialization thread cannot
  start. A missing tier above tier 0 now leaves the Agent running
  with the tiers below it, and a missing tier 0 stops startup with
  an error.
- Fixed a crash in metric correlations and other weights queries
  over two or more nodes on Agents without a dbengine tier, such as
  a Parent using the ram or alloc storage modes. Such Agents now
  process the nodes one at a time.
- The summary.nodes[] section of query responses now includes the
  query time of the last node, which was missing. With
  options=percentage, the anomaly rate of the dimensions view is no
  longer inflated. The chart_labels arrays of /api/v1/data now have
  one entry per dimension, with null where a chart lacks the label.
- [ml] dimension anomaly score threshold is now limited to 0.01 to
  1.00, with a warning in the log when the configured value is
  changed. Values up to 5.00 were accepted, but anything above 1.00
  silently turned off anomaly detection, because a model's anomaly
  score cannot exceed 100. Such values now run at 1.00, the least
  sensitive setting.
- ebpf.plugin and ebpf-go.plugin are installed setuid root. When
  they run with elevated privileges, they now ignore the
  NETDATA_*_DIR environment variables and use the plugin,
  configuration and log directories they were built with. Standard
  installations are not affected. A [directories] override in
  netdata.conf that points these directories elsewhere no longer
  reaches the eBPF plugins, which log one line for each ignored
  variable.
- Redfish: manager network ports exposed as standard Port resources
  are now collected, including their link state and speed. They
  were rejected, leaving the collection permanently partial.
- PAN-OS: panos.ipsec.tunnels now counts the established IPsec
  tunnels instead of reporting the configured ones, and a tunnel
  with overlapping SAs during rekeying counts once. The remaining
  SA lifetime now reports the longest valid lifetime of a tunnel
  instead of a varying or summed value.
- go.d.plugin: fixed collectors such as Cato Networks failing a
  collection cycle with a host scope conflict when a host's
  metadata changed while its identity stayed the same.
- Cato Networks: the topology Function now connects each site to
  its devices, keeps every observed WAN tunnel instead of merging
  parallel ones, and marks tunnels as connected, disconnected or
  unknown. Sites, devices and tunnels carry more detail for
  troubleshooting, such as HA roles, loss, jitter, last-mile
  measurements and BGP sessions, and the graph notes when
  inventory, metrics or BGP data are missing. The collector now
  uses Cato SDK v1.1.0.
- ebpf.plugin: the number of tracked PIDs in ebpf.monitoring_pid no
  longer keeps growing on hosts with short-lived processes. A
  process that exited before its /proc entry was read was released
  without being subtracted.
- statsd.plugin: with [statsd] set charts as obsolete after enabled
  (off by default), the Agent no longer crashes the first time an
  idle metric is removed. Removal also no longer leaks the metric's
  values, and metrics used by synthetic charts are kept. The
  private chart count no longer wraps around and blocks every new
  private chart.
- Virtual nodes: the inactivity timeout set by a collector, such as
  the one SNMP devices use, works again. It was discarded when the
  node was defined, so a virtual node never went offline after its
  collector stopped reporting it. A virtual node taken over again
  by its local collector after a streamed copy of it stops now has
  its health checks and normal operation restored.
- SNMP: a poll in which the device answered no request now fails.
  Profile statistics built from cached metadata were still reported
  for the device's virtual node, keeping it active after its
  measurements had stopped.
- PowerStore: performance, Ethernet and capacity charts now show
  the values the array reports. The collector read the field names
  of raw samples, while the five-minute and daily rollups it
  requests use different names, so these charts showed zeros or
  were missing. CPU now shows the peak utilization of the interval
  as a percentage, and average login counts keep their fractions.
- log2journal: JSON lines that end inside a backslash escape are
  now rejected instead of being parsed with bytes from beyond the
  end of the line.
- log2journal: a named group of a PCRE2 pattern or rewrite rule
  that does not take part in a match, such as an optional group, no
  longer makes the parser read one byte before its buffer. Output
  does not change.
- log2journal: fixed several JSON parsing and output issues. Very
  long numbers with an exponent could overflow the number buffer or
  crash the process, \u000a and \u0009 escapes dropped the rest of
  the value, unpaired surrogates produced invalid UTF-8, and a line
  that failed to parse left its fields to the next line in both
  JSON and logfmt mode. An --inject now replaces a value read from
  the log instead of being appended to it, and a rewrite that
  refers to its own key reads the original value.
- go.d.plugin: fixed two shutdown races in the job manager. A
  shutdown or failed restart could wait until its deadline instead
  of finishing, and a Function request that had already been
  accepted could be reported as rejected because the plugin was
  stopping.
- go.d.plugin service discovery: discovered names and addresses are
  now encoded as data in the jobs that discovery rules generate.
  They were inserted into the YAML as text, so an IPv6 address
  could make a job fail to parse and a name such as on became a
  boolean. Stock rules use a new job template helper, for example
  {{ job "name" .Name "url" .Address }}, which custom rules can use
  too. Existing rules and saved dynamic configurations keep
  working.
- go.d.plugin: collector logs and errors, including those returned
  by dynamic configuration checks, no longer include raw content
  from the files a collector reads, such as log samples,
  configuration lines or certificates. They name the file, line,
  field and reason instead, so some messages are less detailed.
- go.d.plugin and ibm.d.plugin: HTTP responses read by collectors,
  including Prometheus and OpenMetrics endpoints, are now limited
  to 64 MiB, measured after gzip decompression. A larger response
  fails the collection instead of growing memory without bound.
  HTTPCheck reports such a response as bad_content; use a smaller
  endpoint for health checks.
- SNMP traps and S3: the state files these collectors keep are now
  read and written safely. Symlinks and special files are rejected,
  and a temporary file left by a crash no longer blocks later
  writes.
- Fixed stock alert and metadata issues: the Portcheck
  portcheck_connection_fails alert no longer looks up a dimension
  that does not exist, the Elasticsearch, OpenSearch and Unbound
  metadata now match the charts they describe, and the Unbound and
  ethtool module charts are titled "Module ..." again instead of
  "CollectorV1 ...".
- The progress Function now shows API calls that failed with a
  server error as errors. They were styled with a severity the
  dashboard does not recognize and looked like successful calls.
- Host labels are now read from the configuration file the Agent
  loaded, including one given with -c, at startup and on netdatacli
  reload-labels. Labels removed from that file are also removed on
  reload.
- Crash reports now include a stack trace for SIGABRT raised
  outside the Agent's own fatal error handling.
- On macOS and Linux builds without libbacktrace, the Agent again
  saves its status file when it crashes, so the next start reports
  the exit reason and signal.
- Fixed a use-after-free at shutdown on Parents with archived
  children, when loading their contexts outlasted the shutdown
  wait.
- Fixed rate-limited log messages being emitted more often than
  their limit when several threads logged through the same limiter
  at once.
- When [db] update every is above 3600, the warning now reports the
  value it was clamped to (3600) instead of 1. The clamp itself was
  already correct.
- When a collector tries to add a dimension without an id, the
  fatal error now says so, instead of blaming the destruction of
  the chart's dimension index.
- The installer and updater now treat curl exit status 56, which
  some curl versions return on protocol errors, as a download
  failure, like exit statuses 22 and 78.
- Windows packages now include updated MSYS2 packages on top of the
  bundled MSYS2 base, including OpenSSL 3.6.5, curl 8.23.0 and
  msys2-runtime 3.6.11. Each update is pinned by URL and checksum,
  and the bundled package database matches the files that ship.
- When building from source needs a Go toolchain and none is
  installed, the installer now downloads Go 1.27.3 instead of
  1.27.0. Go 1.27.0 and later remain supported.

Refresh 0002-Do-not-hardcode-systemd-unit-directories.patch for
netdata v2.12.3 because the upstream now routes all systemd unit
installs through NETDATA_SYSTEMD_UNIT_DEST, so override that
variable instead of each DESTINATION.

Add 0005-build-allow-using-a-local-SQLite-source-tree.patch which
is the SQLite part of upstream commit 09e668b build:
restructure the CMake build system. The full commit does not apply
to 2.12.x. It allows SQLite offline builds.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ot-hardcode-systemd-unit-directories.patch | 44 ++++------
 ...low-using-a-local-SQLite-source-tree.patch | 85 +++++++++++++++++++
 .../{netdata_2.10.4.bb => netdata_2.12.3.bb}  | 13 ++-
 3 files changed, 115 insertions(+), 27 deletions(-)
 create mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/0005-build-allow-using-a-local-SQLite-source-tree.patch
 rename meta-webserver/recipes-webadmin/netdata/{netdata_2.10.4.bb => netdata_2.12.3.bb} (91%)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/0002-Do-not-hardcode-systemd-unit-directories.patch b/meta-webserver/recipes-webadmin/netdata/netdata/0002-Do-not-hardcode-systemd-unit-directories.patch
index 15668c121b..43024ccd49 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata/0002-Do-not-hardcode-systemd-unit-directories.patch
+++ b/meta-webserver/recipes-webadmin/netdata/netdata/0002-Do-not-hardcode-systemd-unit-directories.patch
@@ -3,38 +3,30 @@ From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
 Date: Tue, 1 Oct 2024 17:01:33 +0200
 Subject: [PATCH] Do not hardcode systemd unit directories
 
-Refreshed for netdata v2.10.4 (context shifted; same intent preserved).
+Refreshed for netdata v2.12.3: upstream now routes all systemd unit
+installs through NETDATA_SYSTEMD_UNIT_DEST, so override that variable
+instead of each DESTINATION.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
 ---
- CMakeLists.txt | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
+ CMakeLists.txt | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d6dafd9..530298e 100644
+index 1cd0e75..510dacf 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -3642,7 +3642,7 @@ if(BUILD_FOR_PACKAGING)
-         install(FILES
-                 ${CMAKE_BINARY_DIR}/system/systemd/netdata.service
-                 COMPONENT netdata
--                DESTINATION lib/systemd/system)
-+                DESTINATION $ENV{systemd_system_unitdir})
-         install(FILES
-                 ${CMAKE_BINARY_DIR}/system/systemd/sysusers/netdata.conf
-                 COMPONENT user
-@@ -3739,11 +3739,11 @@ if(NOT OS_WINDOWS)
-     install(FILES
-             ${CMAKE_BINARY_DIR}/system/systemd/netdata-updater.service
-             COMPONENT netdata
--            DESTINATION lib/systemd/system)
-+            DESTINATION $ENV{systemd_system_unitdir})
-     install(FILES
-             system/systemd/netdata-updater.timer
-             COMPONENT netdata
--            DESTINATION lib/systemd/system)
-+            DESTINATION $ENV{systemd_system_unitdir})
-   endif()
- endif()
+@@ -4352,11 +4352,7 @@ install(FILES
  
+ # RPM distros ship systemd units in %{_unitdir} (/usr/lib/systemd/system);
+ # the DEB layout (and the historical default) uses /lib/systemd/system.
+-if(NETDATA_PACKAGING_FORMAT STREQUAL "rpm")
+-        set(NETDATA_SYSTEMD_UNIT_DEST "usr/lib/systemd/system")
+-else()
+-        set(NETDATA_SYSTEMD_UNIT_DEST "lib/systemd/system")
+-endif()
++set(NETDATA_SYSTEMD_UNIT_DEST "$ENV{systemd_system_unitdir}")
+ 
+ # The spec packages the systemd-235-compatible unit variant on EL 7 and
+ # Amazon Linux 2.
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/0005-build-allow-using-a-local-SQLite-source-tree.patch b/meta-webserver/recipes-webadmin/netdata/netdata/0005-build-allow-using-a-local-SQLite-source-tree.patch
new file mode 100644
index 0000000000..0199b2d3d6
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/netdata/netdata/0005-build-allow-using-a-local-SQLite-source-tree.patch
@@ -0,0 +1,85 @@
+From 09e668b36a7e79a09c331857f994874d2714cfbc Mon Sep 17 00:00:00 2001
+From: vkalintiris <vasilis@netdata.cloud>
+Date: Thu, 8 Oct 2026 19:47:44 +0300
+Subject: [PATCH] cmake: allow SQLite offline builds
+
+The bundled SQLite build uses ExternalProject_Add() to download its
+source tarball at build time from a URL hardcoded to
+https://www.sqlite.org in the CMake file.
+
+This breaks the netdata recipe in meta-openembedded/meta-webserver,
+because Yocto and OpenEmbedded builds require all sources to be
+fetched before the build starts and do not allow network access
+during it.
+
+Add NETDATA_SQLITE_SOURCE_DIR, pointing to an already-unpacked
+SQLite source tree, which replaces the download step.
+
+This is the SQLite part of upstream commit 09e668b build:
+restructure the CMake build system (#23589). The full commit does
+not apply to 2.12.x, so the cache variable that upstream declares
+in the new NetdataOptions.cmake module is declared in
+NetdataSQLite.cmake here.
+
+Fixes:
+
+--- LOG END ---
+error: downloading 'https://www.sqlite.org/2026/sqlite-src-3530400.zip' failed
+status_code: 6
+status_string: "Could not resolve hostname"
+log:
+--- LOG BEGIN ---
+getaddrinfo(3) failed for www.sqlite.org:443
+
+Upstream-Status: Backport [https://github.com/netdata/netdata/commit/09e668b36a7e79a09c331857f994874d2714cfbc]
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ packaging/cmake/Modules/NetdataSQLite.cmake | 22 +++++++++++++++++-----
+ 1 file changed, 17 insertions(+), 5 deletions(-)
+
+diff --git a/packaging/cmake/Modules/NetdataSQLite.cmake b/packaging/cmake/Modules/NetdataSQLite.cmake
+--- a/packaging/cmake/Modules/NetdataSQLite.cmake
++++ b/packaging/cmake/Modules/NetdataSQLite.cmake
+@@ -3,10 +3,10 @@
+ #
+ # Handle bundling of SQLite.
+ #
+-# This fetches the SQLite source tree (via tarball or git clone),
+-# generates the amalgamation at build time (with --enable-update-limit
+-# so the parser supports UPDATE/DELETE ... LIMIT), then compiles it as
+-# a separate static library that links into libnetdata.
++# This fetches the SQLite source tree (via tarball, git clone, or a local
++# source directory), generates the amalgamation at build time (with
++# --enable-update-limit so the parser supports UPDATE/DELETE ... LIMIT), then
++# compiles it as a separate static library that links into libnetdata.
+ 
+ include(ExternalProject)
+ 
+@@ -19,6 +19,12 @@ set(SQLITE_GIT_SHA "b09c88c14082339b66c7b7158d609a771e64ca69") # tag is: version
+ 
+ option(SQLITE_USE_GIT "Fetch SQLite sources via git clone instead of tarball" OFF)
+ 
++# STRING rather than PATH on purpose: CACHE PATH resolves a relative value
++# against the invocation directory. Takes precedence over SQLITE_USE_GIT.
++set(NETDATA_SQLITE_SOURCE_DIR "" CACHE STRING
++    "Path to an unpacked SQLite source tree to use instead of downloading one")
++mark_as_advanced(NETDATA_SQLITE_SOURCE_DIR SQLITE_USE_GIT)
++
+ function(netdata_bundle_sqlite3)
+         message(STATUS "Preparing SQLite ${SQLITE_VERSION}")
+ 
+@@ -28,7 +34,13 @@ function(netdata_bundle_sqlite3)
+ 
+         file(MAKE_DIRECTORY "${sqlite_OUTPUT_DIR}")
+ 
+-        if(SQLITE_USE_GIT)
++        if(NETDATA_SQLITE_SOURCE_DIR)
++                # Offline builds: an already-unpacked SQLite source tree replaces
++                # the download step entirely (#23510).
++                message(STATUS "Using local SQLite sources: ${NETDATA_SQLITE_SOURCE_DIR}")
++                set(sqlite_SOURCE_DIR "${NETDATA_SQLITE_SOURCE_DIR}")
++                set(SQLITE_FETCH_ARGS "")
++        elseif(SQLITE_USE_GIT)
+                 message(STATUS "Fetching SQLite via git clone")
+                 set(SQLITE_FETCH_ARGS
+                         GIT_REPOSITORY https://github.com/sqlite/sqlite.git
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_2.10.4.bb b/meta-webserver/recipes-webadmin/netdata/netdata_2.12.3.bb
similarity index 91%
rename from meta-webserver/recipes-webadmin/netdata/netdata_2.10.4.bb
rename to meta-webserver/recipes-webadmin/netdata/netdata_2.12.3.bb
index 9df846cec9..5083673a68 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_2.10.4.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_2.12.3.bb
@@ -25,11 +25,21 @@ SRC_URI = "\
     file://0002-Do-not-hardcode-systemd-unit-directories.patch \
     file://0003-Do-not-record-the-configure-command-line-in-the-binar.patch \
     file://0004-libsensors-do-not-emit-line-directives-in-generated-s.patch \
+    file://0005-build-allow-using-a-local-SQLite-source-tree.patch \
     file://netdata.conf \
     file://netdata-volatiles.conf \
     ${@bb.utils.contains('PACKAGECONFIG', 'go', 'file://go.d.conf', '', d)} \
+    https://www.sqlite.org/${SQLITE_YEAR}/sqlite-src-${SQLITE_VERSION_NUMBER}.zip;name=sqlite \
     "
-SRC_URI[sha256sum] = "d1ae949863925d626b1d42a53000bcca2c239718e0b0ddc6a3f3f5029b21cdfe"
+SRC_URI[sha256sum] = "6eb14deed1d7611c8f8969b2954432e91e631b2e45f762421873044561d80dd9"
+
+# netdata bundles its own SQLite and CMake's ExternalProject would
+# download it during do_compile. Fetch and unpack it with bitbake
+# instead and point CMake at the local source tree.
+# Must match packaging/cmake/Modules/NetdataSQLite.cmake.
+SQLITE_YEAR = "2026"
+SQLITE_VERSION_NUMBER = "3530400"
+SRC_URI[sqlite.sha256sum] = "d18fa15aec74d8c17e1463f861095adc01b5ad190256acb4f91d22f0368d232b"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/tags"
 UPSTREAM_CHECK_REGEX = "${BPN}/releases/tag/v(?P<pver>(?!1\.99)\d+(?:\.\d+)*)"
@@ -100,6 +110,7 @@ EXTRA_OECMAKE += "-DENABLE_PLUGIN_EBPF=OFF \
                   -DENABLE_PLUGIN_SCRIPTS=OFF \
                   -DENABLE_ML=OFF \
                   -DENABLE_LIBBACKTRACE=OFF \
+                  -DNETDATA_SQLITE_SOURCE_DIR=${UNPACKDIR}/sqlite-src-${SQLITE_VERSION_NUMBER} \
                   -DProtobuf_PROTOC_EXECUTABLE=${STAGING_BINDIR_NATIVE}/protoc \
                   -DBUILD_FOR_PACKAGING=${@bb.utils.contains('DISTRO_FEATURES','systemd','ON','OFF',d)} \
                   -DENABLE_PLUGIN_SYSTEMD_UNITS=${@bb.utils.contains('DISTRO_FEATURES','systemd','ON','OFF',d)} \
-- 
2.47.3

