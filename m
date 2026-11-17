Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.705.1794955424974791528
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 14:43:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=dG0eFTPu;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so3798245e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 14:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794955423; x=1795560223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yTApoRc8J0P9dE/w4EKG0su7DPPwXQ6M95GksAOQ7TE=;
        b=dG0eFTPu28tAxEl/fro6s7ody8mPLSLjomixxdjIRciYLH7Zinssd259LIoVozwvvo
         L75wnri/i1t6WpMOF2FV8J0jBphFnMpgh+nwiAuVHTtkdynFATuXxpSqAZkHPyWIwCzO
         lB2djk+FPIIzQ7I82IOu+laeg+t39/HpYoNDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955423; x=1795560223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yTApoRc8J0P9dE/w4EKG0su7DPPwXQ6M95GksAOQ7TE=;
        b=2Tgl5WGJAmVpl6a1UHv0VGPEZrPT/W7j5Q6xvRG2xA6IRTjBSlqQV//jEz1JRaZhjL
         Er1wr72uJfZy/GdbNbpzWavu23iwq6sSdRSV01tHH8tonxxmFW2qJuCBa5ZYwbM0qgzO
         oj7cqdW3s7xZWrSb5K3Y2mmu6SMWObarJO8MMMFQyd36kzEYXlR02wwdTmpgRuNKdAJr
         Ljkm6Qy/jYgVJGhA8fAHEPYUbPGFcYbgMuCFmC7BRyZRUyrq14EFFilIbEKDI2cFkoQ3
         BS0u+51MUa6CjxFIk/orhJHk3Lcns6+91f5WcoHXNistQIhamtL4zRR3UxzCtcxGjhc2
         W8YA==
X-Gm-Message-State: APuU4Z+ffrL50p3+gzyxEmyqzJMysnVmfAyKfLW7wnO3GarwuImA3lgC
	wkHlbUzN4vlrzBXqscZwkc5kBD8+PyNxN4DEpwtLLl9OcP/ASNGFTa+PmDwvo8hqPAsFHwg4ddo
	Nd7Vq
X-Gm-Gg: AYBFou1DNsiSuBUdxf3f+rPGiTTunrv4a7gZBjqGoKssNOQXftWPHVGhh6k4SixNlNb
	9Ffii5TJ+51bFBJc2jub9+sBYTSOzI4F6dKw37dOz32n9NvdPDjHuA0233xdv9ZuzOUZJ35arIM
	e/1U9zVWXp6KaGrwYav9bq74ucWCbs7fnaZ3QeRh4tt42oGbtyuYZbzFoT/okKtgj+mg9ICXE9V
	1r/2ag+8lFFaXxe5/Oi8P0yLqkWymXPzRF41wxfolUyCG+3WdHDEXYt6GjsDuXcbqp6NTwh02JY
	uUn1JDEQa2sOOgPTVyF+MTtfhA6u2y852YFmsZAbOGSVmvtJjZVTzErMIAGfY9Lpw1loJhEKz/k
	XjVX6vfkltekzpi/Ra7yhSDj/+QBkZcaIbFCdrvWeyCfTnRIA+brzhuDdWobfGmUgOUKY+g5CSH
	pLXHfb6MWMAsrZuGR55aEVgKJBSIv/IHjaRwlPm3YKqJ7matSdX/NJxGnuCZ4JWRPC8JflB4mLR
	CC5AOnob8bAQZHZ9zIRa3JZ/4XWOJPD+zVPzG5cX5GkvJkgy5WnRZ90bT2STgiW2omozTGFlkvX
	qO/Ro4drFKdjrj59/C8o2y+7kHaJI9pFmjNLBVSc8hXZBTFPuolSn73bqzUInEZ67TLEYcNAB+b
	Sb/WrZEeTC1jmOrp9e70ND/HFljj/BrNcakBNIN6m3sssjB1bsYPl+w==
X-Received: by 2002:a05:600c:608c:b0:4b6:267a:dd6e with SMTP id 5b1f17b1804b1-4bb7da44047mr12068055e9.28.1794955422736;
        Tue, 17 Nov 2026 14:43:42 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2c3c93sm25012915e9.13.2026.11.17.14.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:43:42 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 04/11] iperf2: Upgrade 2.2.1 -> 2.2.2
Date: Wed, 18 Nov 2026 00:43:30 +0200
Message-ID: <20261117224337.4181772-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117224337.4181772-1-leon.anavi@konsulko.com>
References: <20261117224337.4181772-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 22:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132594
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.2.2:

- android: cut a signed release build (app-release.apk) from this branch
  (2-2-2) rather than udp-l4s - still built with --enable-udp-l4s
  --enable-professional (see app/build.gradle.kts), but the bundled
  binary's own `iperf -v` string differs from a udp-l4s-branch build (no
  "(udp-l4s)" tag), which changes the app's silently-derived permit-key
  (see doc/PERMIT_KEY_NOTES) - a udp-l4s-branch client's key will NOT
  match this build. Key values themselves are never committed here;
  derive the matching one with android/compute_permit_key.py against
  this build specifically before pointing a --permit-key-file at it.
- fix: --permit-key-file now refuses t- start the server (rather than WARN
  and continue) when it can't be opened or contains n- usable keys -
  previously a misconfigured/unreadable file left a permit-key-gated
  server listening and looking perfectly healthy (process up, port open)
  while silently rejecting every single connection
- fix: recvn()'s fatal-read-error paths (e.g. ECONNRESET, a truncated
  handshake read) set the process-wide sInterupted flag instead of the
  per-thread tInterupted one, s- a single client resetting its connection
  could silently take down the entire listener - a clean exit, so
  Restart=on-failure wouldn't recover it. Same class of cross-connection
  bug as the per-thread test-duration timer fix below, just not fully
  applied t- this path when that fix went in; seen in production taking
  down a --permit-key-timeout-gated server hours int- what should have
  been a week-long run
- feat: android/compute_permit_key.py can auto-detect --version-inf- from
  a connected, authorized adb device (finds the app's own bundled
  libiperf.s- via `dumpsys package` + `find`, runs it with -v) instead of
  requiring a manual adb run-as/pm-path incantation pasted in by hand;
  --version-inf- remains available as a manual override
- fix: --permit-key/--permit-key-timeout/--permit-key-file now require the
  professional edition (community was never intended t- support this
  feature) - a community edition build refuses t- start (client or
  server) with any of these options set, rather than silently running
  with an access-control scheme the operator believes is enforced
- feat: --permit-key-file [=<path>] loads a reloadable (SIGHUP, no
  restart) list of valid permit keys, in addition t- (or instead of)
  the single --permit-key value - lets a key be rotated in (e.g. a new
  Android app build deriving a new key, see doc/PERMIT_KEY_NOTES) with
  an overlap window instead of a hard cutover that drops already-
  connected clients using the still-valid old key. File format is
  systemd EnvironmentFile=-compatible, s- the same file already used
  for a systemd unit's own EnvironmentFile= can be pointed at directly.
  Defaults t- /etc/iperf2/permit-keys.env when n- path is given.
- feat(android): live meters now als- show a running min/avg/max per
  metric (throughput, rtt/jitter, bytes-in-flight/pps), computed in the
  app itself since iperf2's own final report only averages bytes/speed,
  not rtt/cwnd/bytes-in-flight; the first sample of a run is excluded
  from these stats (still shown live) since its interval still has data
  sitting in the send buffer that hasn't crossed the network yet.
- fix: the --reverse-mode bytes/packets-in-flight relay (Server.cpp's
  burst_inf- parsing, Reporter.c's reporter_handle_packet_server_tcp, and
  ReportOutputs.c's tcp_output_read_enhanced_reverse{,_csv}) read/wrote
  those tw- tcpstats fields unconditionally, but they only exist in
  struct iperf_tcpstats when HAVE_TCP_STATS is set - true on Linux where
  this shipped, but not on platforms without TCP_INF- support (e.g.
  Windows/mingw), where it failed t- compile at all; found via an
  overnight cross-compile regression sweep (native Linux, mingw32/64,
  OpenWrt ath79-musl/x86_64-musl, Android arm64-v8a/armeabi-v7a/x86_64)
- fix: per-thread test-duration timer (was a single process-wide clock via
  setitimer()/ITIMER_REAL plus one global interrupt flag) - on a server
  handling overlapping connections, whichever connection's own timer fired
  first could truncate a different, unrelated, still-running connection
  (seen in production as "FAIL: writen errn- = 104" / "shutdown failed"
  well short of that connection's own configured duration); now isolated
  per-connection via timer_create()+SIGEV_THREAD_ID (Linux/glibc)
- fix: a --permit-key server's listener accept-loop lifetime was tied to
  -t (armed relative t- when the server PROCESS started), s- a persistent
  server given -t for connection safety would stop accepting *any new*
  connections once that -t elapsed, ignoring a much longer
  --permit-key-timeout; -t on a --permit-key server now only bounds each
  accepted connection's own duration, with --permit-key-timeout (or -P N)
  governing the listener's own lifetime instead. A plain (non-permit-key)
  server keeps -t bounding the whole listener lifetime, unchanged, for
  compatibility with single-session server invocations
- fix: a client's own -t request in reverse/full-duplex/dual-test modes
  could force the server t- send for longer than the server's own -t
  allowed, with n- cap; now clamped t- whichever is shorter whenever the
  server itself was given its own -t
- feat: server startup with -e/--enhanced now als- lists the TCP
  congestion control algorithms available on the host (Linux only, via
  /proc/sys/net/ipv4/tcp_available_congestion_control), s- a client
  picking -Z <algo> can check the server's own log t- confirm that
  algorithm is actually loaded there
- add make check tests t28_listener_forever, t29_reverse_duration_clamp,
  t30_plain_server_time_compat
- feat(android): Host/Port fields now offer a dropdown of the last 5
  values actually used (not every keystroke), cleared by "Reset to
  defaults"; Port field is now numeric-only (n- lookups apply t- a port
  number, unlike Host)
- feat(android): simple LED-style connection indicator - green
  "Connected" once real data is flowing, red "Connect failed" on the
  same conditions as before; mutually exclusive, nothing shown while
  idle or still connecting (the Start button's own "Connecting..." text
  already covers that phase)
- feat: server als- relays packets-in-flight in --reverse mode's TCP_INFO
  relay (previously just bytes-in-flight/rtt) - new tcppktsinflight
  CSV/human report column, using the last previously-unused reserved
  field in TCP_burst_payload
- feat(android): persist test config (host/port/toggles/CCA/etc.) across
  app restarts, explicit subprocess cleanup on ViewModel teardown
  (previously could orphan a running test in the background if the
  Activity was torn down mid-test), a connect watchdog that gives up
  after a few seconds instead of waiting on the OS's own TCP SYN-retry
  timeout for an unreachable host, live "Connecting..." progress plus a
  red connect-failure indicator, and a "Reset t- defaults" action
- fix(android): Port field snapped back t- its old value when cleared to
  retype it; Start button now als- validates port/duration/interval
  ranges before enabling instead of only checking host non-blank
- fix(android): parallel-streams (-P) temporarily removed from the UI -
  RTT/bytes-in-flight only reflect one stream's TCP_INF- and don't work
  correctly yet with more than one; revisit together later
- feat: in --reverse mode, the server relays its own bytes-in-flight/rtt
  back t- the client (new read-side enhanced report/CSV columns), since
  the client only receives data and can never observe these sender-side-
  only TCP_INF- stats locally otherwise; uses the same otherwise-unused
  TCP_burst_payload reserved fields --trip-times already rides on
- fix: the above reverse-mode relay never sampled a real value when
  --tcp-write-prefetch was als- active, since Client::Run() dispatches to
  RunWriteEventsTCP() (a separate write loop) instead of RunTCP() in that
  case, and only RunTCP()'s burst branch had the new sampling call; every
  --reverse + --tcp-write-prefetch client (e.g. this app's own default)
  got a permanent "not valid" sentinel instead of real data
- feat: --with-max-threads-per-client=N configure flag caps concurrent
  traffic threads per client IP on the server (0/default is uncapped),
  enforced independently of -P/Listener::mCount
- fix: connection-setup summary line's icwnd value was printed with no
  unit at all (e.g. "icwnd/mss/irtt=213/1448/22"); it's actually KB, same
  as the periodic enhanced report's cwnd field which already shows a K
  suffix - now labeled consistently (e.g. "icwnd/mss/irtt=213K/1448/22")
- feat: transfer-ID prefix now includes the source IP when --permit-key
  is in use, since all clients share the same static permit-key value and
  couldn't otherwise be told apart in the server's own output
- fix: -B/-c IPv6 addresses with link-local scope (fe80::/10 unicast or
  ffx2::/16 multicast) failed bind()/connect() with EINVAL/EADDRNOTAVAIL
  because the %<iface> device suffix was only ever used for the later
  multicast group join, never applied t- sin6_scope_id on the address
  itself; both server bind and client connect now resolve the interface
  via if_nametoindex() and set the scope id
- add make check tests t18_ipv6_mcast_bind and t19_ipv6_mcast_client_scope
  covering the above fix
- fix: macOS/BSD server multicast bind emitted a spurious "Invalid argument"
  SO_BINDTODEVICE warning (t18 regression); that belt-and-suspenders call is
  Linux-specific (sk_bound_dev_if workaround for inet6_bind()) and is now
  gated t- __linux__, since BSD/Darwin's bind() already honors sin6_scope_id
  and SO_BINDTODEVICE is declared there but not functionally implemented
- --send-delay replaces deprecated --tcp-tx-delay; works for both TCP and UDP
- SO_TXTIME socket support for UDP with --send-delay
- --omit support t- exclude initial intervals from reporting (TCP only)
- --set-rand-seed t- set the random number generator seed for reproducible -b variance
- TCP -b 0 support for unlimited (capacity-seeking) rate
- --enable-professional umbrella configure flag with community/professional versioning
- Markov chain traffic pattern support (experimental, client and server side)
- mBuf grows automatically when the peer requests a larger packet size (reverse mode)
- port range displayed in client settings report when used
- show first packet sequence number when greater than one in connect message
- default UDP read buffer size increased t- 128 KBytes
- UDP L4S: CE (Congestion Experienced) bit counting on both client and server
- UDP L4S: CE duration output on client
- UDP L4S: capacity-seeking behavior is now the default for --udp-l4s and --reverse
- UDP L4S: -b rate limiting now supported with --udp-l4s (ticket 338)
- UDP L4S: ECT-1 set on first UDP packet (ticket 369)
- UDP L4S: client timeout and L4S_PKT_FIN handling
- UDP L4S: autoconf/automake support for --enable-udp-l4s / --disable-udp-l4s
- --trip-times and --tcp-write-times now auto-enable enhanced (-e) reporting
- --sendmmsg #<1-1024> (client) and --recvmmsg #<1-1024> (server) t- batch UDP datagrams
  via sendmmsg(2)/recvmmsg(2), reducing per-datagram syscall overhead at high packet rates
  (Linux only, requires HAVE_SENDMMSG/HAVE_RECVMMSG from autoconf)
- Write and Read columns report actual sendmmsg/recvmmsg syscall counts (not datagram counts)
  when mmsg is active; rati- of PPS t- Write/Read gives average datagrams per syscall
- fix --sendmmsg and --recvmmsg t- use required_argument s- space-separated values are
  accepted (e.g. --recvmmsg 8); previously the count was silently ignored
- --sendmmsg/--recvmmsg now treat a value of 0 (or negative) as "use the regular
  msg API instead of mmsg", rather than silently substituting 8
- fix prevPacketTime tracking in RunUDPBurstMMSG s- interval PPS is reported correctly
- fix ReadCnt increment t- use isRcvMMsgs flag s- Read column counts syscalls not datagrams
- fix WritePacketID type error in RunUDPL4S (pass &mBuf_UDP->seqno_ts, not mBuf_UDP)
- add make check test t17_udp_mmsg for sendmmsg/recvmmsg (skips when not compiled in)
- five correctness bugs fixed in histogram.c
- three buffer overrun bugs fixed in Settings, Thread, and igmp_querier
- strncpy bound exceeded fix in test_permit_key
- memory leaks fixed in Settings_Destroy()
- fix heap buffer overflow: --tcp-cca/--tcp-congestion/--working-load-cca
  names longer than 32 chars overflowed the wire header's fixed-size CCA
  field; now bounded and truncated with a warning
- fix client test-exchange header length decode using too-narrow a mask,
  which could silently wrap a header length over 255 bytes instead of
  rejecting it
- UDP reverse mode: skip Condition_TimedWait on receive (prevents spurious hang)
- UDP reverse mode: use local address as flow key in active_hosts
- reporter thread: hold ReportCond mutex when signaling on thread exit
- listener: hold mutex when setting consumerdone; add missing Condition_Lock
- packet ring: add acquire/release memory ordering t- the lock-free producer/
  consumer index handoff, fixing a potential data race on weak memory-model
  architectures (ARM, RISC-V, POWER); n- effect on x86
- packet ring: fix off-by-one in the enqueue full-check that let a producer
  outrunning the reporter thread silently overwrite unread reports instead
  of blocking, with n- warning
- packet ring: batch producer wakeups via a low-water mark instead of
  signaling only when fully empty (could stall an already-resumable
  producer for up t- a second) or on every dequeue (thrashes the condvar
  and the ring's cache lines); cuts signaling ~180x under sustained load
  with n- added latency
- packet ring: fix a busy-spin (hang) when the ring fills with n- consumer
  condition variable t- wait on (-U/--single_udp mode); now drops the
  newest report with a rate-limited warning instead of spinning forever
- Windows: fix WSAECONNRESET after ICMP port unreachable on UDP
- honor --txstart-time for server-reverse sender for both UDP and TCP (ticket 390)
- ticket 389: fix compilation failure with --configure --disable-ipv6
- ticket 376: refactor UDP test exchange with --reverse for correct -P > 1 behavior
- fix small window size warning t- apply t- TCP client only
- fix mBuf size regression with --reverse
- fix minsize check for --trip-times t- apply correctly t- both TCP and UDP
- fix UDP --trip-times with small (64 byte) packets
- fix precision in --sum-only trip-time outputs
- remove %g from percentage outputs t- avoid unwanted exponential formatting
- fix omit accounting with partial intervals
- volatile qualifier added t- sInterrupted for correct signal-context visibility across threads
- fix recvn with MSG_DONTWAIT t- distinguish peer close from no-data
- inet_pton4 and inet_pton6 converted from K&R t- ANSI C function definitions
- buildroot linux compile fix (ticket 342)
- d- not default bounceback t- one-second interval reporting
- automake support for interleaved assembly listings; cleaned by make clean
- simplified version string format: "iperf VERSION (DATE) THREADS (BRANCH)"
- remove unused ax_create_stdint_h; move Socklen_t discovery t- dast.m4
- fix: server-side guard against unrealistic peer-supplied mBufLen in UDP v1
  header and BounceBack bbsize/bbreplysize; oversized values now emit a
  warning through the Reporter thread and abort the connection instead of
  attempting a huge allocation
- fix: UDP v1 header packet size guard rejects truncated packets (e.g. port
  scanner probes) before any header field is accessed
- fix: unrealistic mBufLen in UDP v1 header now correctly aborts the
  connection; previously the warning was emitted but processing continued,
  consuming an extra transfer ID for a reverse client that would never connect
- fix: UDP v1 header mPort values exceeding 65535 are rejected as garbage
  rather than silently truncated by the unsigned-short cast
- fix: apply_client_settings_udp diagnostic output now routed through the
  reporter thread via PostReport/InitStringReport instead of direct
  fprintf(stdout) from the listener thread
- fix: MCAST_JOIN_GROUP calls in iperf_multicast_api.c passed
  sizeof(struct group_source_req) instead of sizeof(struct group_req),
  over-reading the stack-allocated request and risking EINVAL on
  platforms that validate optlen exactly; als- fixed SSM v6 join casting
  the group/source pointers as sockaddr_in instead of sockaddr_in6
- fix: Listener socket fd leaks on rejection paths - the UDP peer/IPv6
  mismatch path only closed the accepted socket for TCP, and the L2
  checks setup failure path didn't close the socket (or the dropped
  AF_INET socket) at all; L2_setup() als- leaked the original socket
  when the new AF_PACKET socket() call failed
- refactor: Listener::L2_setup() converted t- single-exit (got- DONE)
  t- match apply_client_settings_udp/tcp, centralizing cleanup instead
  of duplicating it across each early return
- fix: iperf_formattime() used gmtime()/localtime(), which return a
  pointer int- a shared static buffer (glibc shares it between the two
  calls); iperf_formattime() is called directly from per-connection
  threads (e.g. TCP connect error/timeout reporting), s- concurrent
  -P > 1 failures could race and corrupt the formatted timestamp; now
  uses gmtime_r/localtime_r (gmtime_s/localtime_s on Windows, since
  MinGW/MSVC only expose the POSIX _r variants behind
  _POSIX_THREAD_SAFE_FUNCTIONS, which this project doesn't define)
- fix: mingw/Windows cross-compile breakage - server->mSockDrop was
  referenced unconditionally in Listener::Run() but only exists in
  thread_Settings under HAVE_LINUX_FILTER_H && HAVE_AF_PACKET
  (Linux-only AF_PACKET/BPF L2 support); verified against a real
  x86_64-w64-mingw32 configure + full link
- fix: three printf/format-string argument-count mismatches between
  Locale.c and ReportOutputs.c (these can never be caught by -Wformat
  since the format strings are never literals at their call sites):
  report_l2statistics was missing a trailing %s s- the --omit
  indicator was silently dropped; the !(HAVE_TCP_STATS) variant of
  report_write_enhanced_write_format had a stray unfed %s (a leftover
  netpower field with n- valid RTT data source on that build path,
  verified via a real x86_64-w64-mingw32 build) that misaligned every
  argument after it; report_peer_dev's !HAVE_IPV6 branch passed local
  address twice, shifting tw- port numbers int- %s slots (verified via
  a real --disable-ipv6 build with --permit-key -e -B ip%dev)
- add make check test t20_tcp_write_times for --tcp-write-times output
- refactor: remove report_connection/report_settings/report_statistics/
  report_serverstatistics typedefs and their connection_reports[]-style
  extern array declarations from Reporter.h; unreferenced dead code
  from an apparently-abandoned array-dispatch design
- fix: three more printf argument-count mismatches, found by
  t/check_report_format_strings.py (see below): udp_output_read_triptime_isoch's
  suppressed-isoch branch passed a spurious extra pps-shaped argument that
  bumped the --omit indicator off the end of the vararg list;
  udp_output_sumcnt_enhanced was missing its pps argument entirely, feeding
  the omit-indicator string int- a %8.0f slot and leaving the final %s
  reading uninitialized memory; tcp_output_write_bb_csv's !HAVE_TCP_STATS
  current-interval branch supplied 4 tcpstats placeholder zeros instead of
  5, one fewer than its "final" sibling, shifting cntTxBytes/cntRxBytes/rps
  int- the wrong CSV columns
- add t/check_report_format_strings.py and make check test
  t21_lint_report_formats: cross-checks printf/fprintf/snprintf argument
  counts against Locale.c's report_* format-string %-specifiers, across
  every relevant #if/#ifdef build variant (by running the real preprocessor
  once per variant, including a real out-of-tree mingw ./configure when
  a cross-compiler is available, rather than approximating the
  preprocessor by hand); this class of bug is invisible t- -Wformat since
  these format strings are never literals at their call sites, and is
  what found all of this release's printf argument-count fixes
- add make check tests t22_csv_output, t23_isochronous, t24_bounceback,
  t25_sum_report, and t26_udp_l4s (skips when not compiled in) covering
  output_handler paths (CSV, isochronous, bounceback, sum reports,
  UDP L4S) that previously had n- test coverage at all
- t26_udp_l4s found a real bug (filed on the tracker, not yet fixed): the
  UDP client's relayed "Server Report" summary can show a garbage huge
  Lost count under --udp-l4s -e; the server's own directly-printed
  output for the same run is correct, s- this looks like the client's
  final-ack-wait read() consuming a different/stale packet rather than
  the server's actual stats ack. t26 works around a related test-harness
  false positive: the server's best-effort final-ack retry budget
  (write_UDP_AckFIN) can legitimately warn "ack of last datagram failed"
  under this same bursty timing even when the test completes fine, which
  used t- trip run_iperf's blanket failure grep in base.sh; t26 now does
  its own targeted output checks instead of using run_iperf
- fix: three bugs found in a review of Client.cpp -
  1) AwaitServerFinPacket() read the server's final stats relay packet
     with a hardcoded 1470-byte bound, but thread_Settings::mBuf is only
     guaranteed t- be MINMBUFALLOCSIZE bytes, which could be smaller for
     small -l values (e.g. -l 64), risking a heap buffer overflow if an
     oversized datagram landed on the socket during that window; fixed
     by tying MINMBUFALLOCSIZE's floor t- the same kDefault_UDPTxBufLen
     constant the read uses, removing Client.cpp's redundant local
     MAXUDPBUF define s- the invariant can't drift apart again
  2) myWriten()'s !HAVE_TCP_STATS variant ignored its inSock/inBuf
     arguments, always writing from mySocket/mSettings->mBuf instead;
     harmless at 3 of 4 call sites (which already passed those same
     values) but corrupted TCP bounceback's partial-write retry, which
     writes from an advancing mSettings->mBuf+write_offset
  3) AwaitServerCloseEvent()'s `rc = recv(...) > 0` parsed per C/C++
     precedence as `rc = (recv(...) > 0)`, collapsing rc t- 0/1 and
     making the `if (rc < 0)` error warning permanently dead code
     (loop/close-detection behavior was unaffected)
- fix: Server::ClientReverseFirstRead()'s non-trip-time fallback set
  sent_time.tv_sec twice (a copy/paste typo) instead of setting
  tv_sec then tv_usec, clobbering tv_sec with a microseconds value and
  leaving tv_usec unset; every consumer of sent_time.tv_sec is gated
  on isTripTime, which is false whenever this branch runs, s- currently
  dormant, but a real landmine for any future/untraced reader
- scale the reporter consumption-detector's delay proportionally t- the
  packet-ring shortfall (REPORTERDELAY_MIN/MAX bounded 1000-16000us)
  instead of always sleeping the fixed 16000us duration
- fix: SetSumHandlers()'s TCP client branch checked isSumOnly() in a
  standalone if, not chained via else-if int- the following
  isBounceBack/isFullDuplex/isEnhanced/else block, s- the sum-only
  output handler was silently overwritten right after being set
  whenever none of those three conditions applied (e.g. --sum-only
  without -e, or --sum-only -y C without -e, on a TCP client)
- fix: reduce Linux hrtimer slack (via PR_SET_TIMERSLACK) for traffic
  threads not using -z (realtime scheduling); the default 50us slack
  systematically biases delay_loop()'s clock_nanosleep()-based IPG
  pacing delays long, which is otherwise uncorrected on Linux since
  the Kalman fallback in compat/delay.c only compiles in when
  clock_nanosleep() is unavailable
- build: promote reporter function-pointer vector signature mismatches
  (output_handler, transfer_protocol_handler, etc. in Reporter.h) from
  an easily-missed warning t- a hard build failure via
  -Werror=incompatible-pointer-types
- fix: all 26 make check t/*.sh scripts hardcoded #!/bin/bash -e; on
  FreeBSD (confirmed on OPNsense 14.3-RELEASE) there is n- /bin/bash in
  the base system, and even after installing the bash package it lands
  at /usr/local/bin/bash, s- every script failed t- exec at all
  (exit 127), failing all 26 tests uniformly regardless of iperf itself
  working correctly; switched t- #!/usr/bin/env bash (PATH-resolved)
  with a separate `set -e` line
- fix: professional builds' "(compiled by X)" version tag printed
  "(compiled by )" with nothing in the parens on FreeBSD/bmake, since
  IPERF_BUILD_USER was filled in via make's $(shell whoami ...), a GNU
  Make extension that silently expands t- empty under BSD make; moved
  the whoami/id -un lookup int- configure.ac (portable /bin/sh at
  configure time) and baked it int- config.h instead
- TCP client enhanced CSV output (-c ... -e -y C) now includes
  tcppktsinflight/tcpbytesinflight columns when HAVE_TCP_INFLIGHT, mirroring
  the InF(pkts) already shown in the human-readable enhanced write report;
  previously only available in text form, not CSV
- fix: TCP client enhanced CSV's tcppktsinflight/tcpbytesinflight columns
  showed a plain 0 (indistinguishable from a genuine zero-in-flight
  measurement) on any path where inflight data isn't actually available
  (missing HAVE_TCP_INFLIGHT, sum reports, or builds without TCP_INFO);
  now consistently -1, matching this same function's existing convention
  for other not-applicable fields (writecnt/writeerr under !HAVE_TCP_STATS)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-buildroot-linux-breakage-ticket-342.patch | 26 -------------------
 ...89-Compilation-fails-with-disable-ip.patch | 25 ------------------
 .../{iperf2_2.2.1.bb => iperf2_2.2.2.bb}      |  7 ++---
 3 files changed, 2 insertions(+), 56 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/iperf2/iperf2/0001-fix-for-buildroot-linux-breakage-ticket-342.patch
 delete mode 100644 meta-oe/recipes-benchmark/iperf2/iperf2/0001-fix-for-ticket-389-Compilation-fails-with-disable-ip.patch
 rename meta-oe/recipes-benchmark/iperf2/{iperf2_2.2.1.bb => iperf2_2.2.2.bb} (77%)

diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2/0001-fix-for-buildroot-linux-breakage-ticket-342.patch b/meta-oe/recipes-benchmark/iperf2/iperf2/0001-fix-for-buildroot-linux-breakage-ticket-342.patch
deleted file mode 100644
index 0a6bc7150b..0000000000
--- a/meta-oe/recipes-benchmark/iperf2/iperf2/0001-fix-for-buildroot-linux-breakage-ticket-342.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From a25566dd66fb0ca951b3b6f6fa5a4bfaac276c71 Mon Sep 17 00:00:00 2001
-From: Robert McMahon <rjmcmahon@rjmcmahon.com>
-Date: Tue, 12 Nov 2024 12:06:54 -0800
-Subject: [PATCH] fix for buildroot linux breakage, ticket 342
-
-Upstream-Status: Backport [https://sourceforge.net/p/iperf2/code/ci/a25566dd66fb0ca951b3b6f6fa5a4bfaac276c71/]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/checksums.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/checksums.c b/src/checksums.c
-index 852f1952..d7a8109e 100644
---- a/src/checksums.c
-+++ b/src/checksums.c
-@@ -47,6 +47,9 @@
-  * by Robert J. McMahon (rjmcmahon@rjmcmahon.com, bob.mcmahon@broadcom.com)
-  * -------------------------------------------------------------------
-  */
-+#ifndef _GNU_SOURCE
-+#define _GNU_SOURCE
-+#endif
- #include "headers.h"
- 
- /*
diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2/0001-fix-for-ticket-389-Compilation-fails-with-disable-ip.patch b/meta-oe/recipes-benchmark/iperf2/iperf2/0001-fix-for-ticket-389-Compilation-fails-with-disable-ip.patch
deleted file mode 100644
index f1590dab1a..0000000000
--- a/meta-oe/recipes-benchmark/iperf2/iperf2/0001-fix-for-ticket-389-Compilation-fails-with-disable-ip.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From ffc2004daf5e8335b7a87664426728f53fc7a5d0 Mon Sep 17 00:00:00 2001
-From: Robert McMahon <rjmcmahon@rjmcmahon.com>
-Date: Mon, 12 Jan 2026 10:14:08 -0800
-Subject: [PATCH] fix for ticket 389: Compilation fails with --disable-ipv6
-
-Upstream-Status: Backport [https://sourceforge.net/p/iperf2/code/ci/0fe3730e2c1d045077ac2cf76a796e95f3455952/]
-
-Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
----
- src/iperf_multicast_api.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/iperf_multicast_api.c b/src/iperf_multicast_api.c
-index 48c0184d..06f3399d 100644
---- a/src/iperf_multicast_api.c
-+++ b/src/iperf_multicast_api.c
-@@ -176,7 +176,7 @@ static int iperf_multicast_join_v4_pi (struct thread_Settings *inSettings) {
- 
- static int iperf_multicast_join_v6 (struct thread_Settings *inSettings) {
- #if (HAVE_DECL_IPV6_JOIN_GROUP || HAVE_DECL_IPV6_ADD_MEMBERSHIP)
--#if HAVE_STRUCT_IPV6_MREQ
-+#if (HAVE_IPV6 && HAVE_STRUCT_IPV6_MREQ)
-     struct ipv6_mreq mreq;
-     memcpy(&mreq.ipv6mr_multiaddr, SockAddr_get_in6_addr(&inSettings->multicast_group), sizeof(mreq.ipv6mr_multiaddr));
-     mreq.ipv6mr_interface = mcast_iface(inSettings);
diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb b/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.2.bb
similarity index 77%
rename from meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
rename to meta-oe/recipes-benchmark/iperf2/iperf2_2.2.2.bb
index edf04a5d70..14f6d671ea 100644
--- a/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
+++ b/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.2.bb
@@ -4,12 +4,9 @@ SECTION = "console/network"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e136a7b2560d80bcbf0d9b3e1356ecff"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/iperf-${PV}.tar.gz \
-           file://0001-fix-for-buildroot-linux-breakage-ticket-342.patch \
-           file://0001-fix-for-ticket-389-Compilation-fails-with-disable-ip.patch \
-"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/iperf-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "754ab0a7e28033dbea81308ef424bc7df4d6e2fe31b60cc536b61b51fefbd8fb"
+SRC_URI[sha256sum] = "4008e1dc7cdeb68605747e11e954a5b25f4646ab6d71207d979acec5de7d385a"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/${BPN}/files/"
 UPSTREAM_CHECK_REGEX = "iperf-(?P<pver>\d+(\.\d+)+)\.tar\.gz"
-- 
2.47.3

