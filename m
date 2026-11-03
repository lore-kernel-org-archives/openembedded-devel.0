Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8027.1793701445967920829
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 02:24:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=WqkLH/ae;
 spf=pass (domain: konsulko.com, ip: 209.85.128.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a210470b49so31674865e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 02:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793701444; x=1794306244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Av+SkFuevjETB0v2YPHG0EfaD5/47l1YKXwcGe83rgw=;
        b=WqkLH/ae58lapnyhyK3+0sIEyfsSKLf2bAmbcw75i0fgERNg73M1YhqBSJQsHbrpiK
         19LcKXK+i34kpLF/nwieBE3Ndi2RcMc6mDKiF9BeAsGNMEActVz4ppwBgpzAntPMw5Ly
         8K/L7j52APVVFBwbd9zaW0cj/i4XR/B/32bDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701444; x=1794306244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Av+SkFuevjETB0v2YPHG0EfaD5/47l1YKXwcGe83rgw=;
        b=DUUt73BQLBqvjjyKP72xLTqWuYYi0YM2fn026AsLOZnjecxWFmNGesIziqZkWWKFxH
         b9jqk1NIC/gOlohWHi9igsl1n4Xd2f8qWU1VxQmGwcQuV7/pY/eWvK66w66+NJBP/Q2z
         Srlhn1RzK8689D2LgC5ib0lfOINdTcrWDUQ0pV8a1gj9t1TVyVi1FgklFreK6I3MjQQt
         jhwfSjvqM2YcvOXT/g4zmwXYeAK9yMP/WmSpoo9BpohPTeo4fHkk1lfObcTZpnGQrlbn
         +dtANckRnNJlPjuu3Z7P19oEjdf8f3Se9OAb7C4P7l6BiCq1MaMv3AZmh9Vsx3mRz0DS
         KUDQ==
X-Gm-Message-State: APuU4Z9oPceX0F8/pp9eYZVgzHIGT7oVv2cVy3PVcwjZzhqai43TVrIV
	XH2ljVCB3kKQb4HLX2Mb8KavsWn9uGEec/dA+S4tAoMiof+YVU0TrlN3WSDjvv4nb5JLjVb9QP4
	Yiyih
X-Gm-Gg: AYBFou18eBtTbaJrgeiT9ImT+iG7Iycg76yzFT+9u338pe3+9iev1oLaEC7SygX6Ebq
	pE0FAaCTIG8fYGC3y5Lc1IwAyVfRnkuGN4QiIWNDgHf4Tc+mrvSpUQfoZA5RdjnkmaSi8KX6hZv
	98ZcVXrXUBqSTkdpIBm68h4e7BmB8miVRGKzbxfeO/ABm9L60Ahwq9Cq1CJOw0aWeZpOmVj9T6X
	xD0y5bU71oswe/NW1j4V5n4ZyjCpc1fncHbt2kDbXC11eb5MTmyzyI9CEcoTQNxEieYUaoJDtn7
	AxawsShZ6Y/3X1HHyCYgnv6MpA6FF/MfouXcadl8gVh45hAn7se4O1AqMTNJ6oeZu1hIBLLH2+W
	i5FOJAYhtT3y2VVuqvDROAVD45BNzw/WEwZervrNv3wtZwO3UEX4hHzeO0EPT3FX8SuP7GqaWzh
	VvS/pUTQYfYFKtMrU384SftG+pE/rMY1jy0TTyNR5A4qANNaNhbX+32TaMfg6g1W7UAsrHa9j9w
	xO+DIdfJ/Ze2w6cV3AWfrEau0acBlabS+s2HbX1og0mkM3+XNqqdtmd7fYVUQ9YVnFE1vi8RoBg
	PbLmJzoMPJqcju9oiSeVMeYlixMbhjbOcw9qX92vyOZHEFnMgOww1BMAqzzkRNnLhpVy6Xftexu
	zPf2PaP8CttfJB9ot/LxSCgrcbdIhUoSStUeqwb5IKnV99OEVwalMfg==
X-Received: by 2002:a05:600c:6099:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4ac180f2ac5mr267054795e9.16.1793701443979;
        Tue, 03 Nov 2026 02:24:03 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm73017225e9.3.2026.11.03.02.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:24:03 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/22] python3-anyio: Upgrade 4.15.1 -> 4.16.0
Date: Tue,  3 Nov 2026 12:23:29 +0200
Message-ID: <20261103102350.1952237-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:24:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131764
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.16.0:

- Added BlockingPortal.call_async() for asynchronously calling into
  an event loop with optional abandonment on cancellation
- Added SOCK_SEQPACKET support to connect_unix() and
  create_unix_listener()
- Changed UDP sockets on the asyncio backend to make send() wait
  until the datagram has been passed to the operating system
- Fixed documentation implying that use_uvloop=True falls back to
  the standard event loop when uvloop (winloop on Windows) is not
  installed, and showed how to skip the corresponding pytest
  backend variant when the dependency is missing
- Fixed get_current_task() on the asyncio backend raising an opaque
  TypeError: cannot create weak reference to 'NoneType' object
  instead of a clear error when called from a callback scheduled
  via loop.call_soon_threadsafe() (e.g. from within
  from_thread.run_sync()), where asyncio.current_task() is
  legitimately None
- Fixed CancelScope on the asyncio backend swallowing a native
  Task.cancel() that was delivered in the same event loop iteration
  as the scope's own cancellation (such as a move_on_after()
  deadline expiring), which left the host task with a pending
  cancellation request that never raised CancelledError (\#1214)
- Fixed UDP socket closing hanging if a datagram send was still in
  flight
- Fixed concurrent aclose_forcefully() calls on asyncio socket
  streams returning before the underlying socket was closed
- Fixed aclose() on sockets not checkpointing, and thus failing to
  raise a cancellation exception when called inside a cancelled
  scope (affected UNIX socket streams and UNIX datagram sockets on
  asyncio, and all sockets on Trio)
- Fixed aclose() on asyncio TCP socket listeners not checkpointing,
  and leaking the listening socket if cancelled while another task
  was waiting in accept()
- Fixed accept() on asyncio UNIX socket listeners hanging forever,
  and leaving the listening socket registered with the event loop,
  when the listener was closed by another task
- Fixed send() on asyncio TCP and UDP sockets returning normally,
  despite the data being discarded, when the socket was closed by
  another task (or, for TCP, the connection was lost) while send()
  was waiting for the operating system to accept the data
- Fixed SocketStream.send() on the asyncio backend handing its data
  to a paused transport after a previous send() was cancelled
- Fixed sleep() treating a negative delay (including -inf)
  inconsistently across backends (asyncio returned immediately;
  Trio raised ValueError) by raising ValueError on all backends
- Fixed create_tcp_listener() occasionally failing with a message
  like Could not create 2 listeners with a consistent port when an
  ephemeral port is requested and IPv6 is enabled and the
  dual-stack path is not available or a specific local host name
  was given
- Fixed AsyncFile not shielding against cancellation while closing
- Fixed TemporaryDirectory.cleanup() reacting to cancellation
  prematurely when the host task was already cancelled, causing the
  actual cleanup operation to be skipped
- Fixed a NaN deadline being accepted on asyncio while Trio raised
  ValueError, which silently disabled the timeout
  (fail_after(math.nan) returned instead of raising TimeoutError);
  CancelScope now rejects it on both backends
- Fixed FileReadStream and FileWriteStream leaving files open when
  cancelled during context manager exit, including unflushed writes
- Fixed Condition.notify() and Condition.notify_all() failing when
  the underlying lock was acquired directly rather than through the
  condition
- Fixed importing AnyIO with loaders that do not provide __file__,
  such as PyOxidizer, raising TypeError instead of falling back to
  eager imports
- Fixed text receive streams silently discarding incomplete
  characters at end-of-file instead of applying the configured
  decoding error handler
- Fixed Semaphore(fast_acquire=True) losing its fast-acquire
  behavior when instantiated outside a running event loop
- Fixed BlockingPortalProvider permanently failing with an
  AttributeError on every subsequent use if the first attempt to
  start its blocking portal failed
- Fixed create_udp_socket() silently ignoring the local_port
  argument when local_host was omitted, making the socket bind to a
  random ephemeral port instead of the requested one
- Fixed worker threads on the asyncio backend never returning to
  the idle pool (and thus never being reused or pruned) when a
  to_thread.run_sync() call was cancelled after it had been queued
  for the worker but before the worker thread had picked it up
- Fixed pytest plugin running Hypothesis async tests only on the
  first parametrized backend instead of each backend
- Fixed TypeError when subclassing an existing TypedAttributeSet
  subclass, and this subclass contains type annotations
- Fixed Lock.locked() (and Condition.locked()) raising
  NoEventLoopError when the lock was created outside a running
  event loop
- Fixed connect_tcp() leaking a connected socket when an enclosing
  cancel scope was cancelled before the connection attempt task
  group exited
- Fixed create_connected_udp_socket() silently ignoring local_port
  when local_host was not given: the local address was left unset,
  so the OS picked an ephemeral port instead of the requested one
- Fixed BlockingPortalProvider not passing the exception raised in
  its with block on to the start_blocking_portal() context manager
  it wraps
- Fixed anyio.itertools.islice() not consuming the first start
  items when stop <= start
- Fixed BufferedByteReceiveStream.receive_exactly() and
  receive_until() returning buffered data after explicit closure
  instead of raising ClosedResourceError
- Fixed a TLS stream sending records the peer could no longer
  decrypt after a cancelled send() lost an already-encrypted
  record; the stream now raises BrokenResourceError on further use
  instead
- Fixed close() on memory object streams not waking up tasks
  blocked in send() or receive() on the same stream
- Fixed anyio.itertools.product() acquiring and consuming unused
  input iterables when repeat=0
- Fixed SpooledTemporaryFile rolling over to disk on writes when
  max_size is zero (the default)
- Fixed Trio UDP sockets remaining open when initialization failed
  or was cancelled
- Fixed SpooledTemporaryFile.rollover() moving the current file
  position to the end of the file
- Fixed cancellation during temporary directory creation leaving
  the directory behind while its context manager is retained
- Fixed cancellation during SpooledTemporaryFile.rollover() losing
  buffered contents
- Fixed TextSendStream.send() re-emitting the byte order mark on
  every item with BOM-emitting encodings (utf-16, utf-32,
  utf-8-sig), which made the peer decode a stray \ufeff in front of
  every message after the first
- Fixed buffered byte streams returning empty bytes when a wrapped
  object stream received empty messages instead of waiting for data
  or raising EndOfStream
- Fixed BlockingPortal crashing with InvalidStateError when a
  future it returned was cancelled just as the callable was
  completing
- Fixed UNIXSocketStream.send_fds() silently truncating messages on
  short socket writes
- Fixed cancelled TCP receives on the asyncio backend leaving
  transport reads enabled, allowing incoming data to accumulate
  while the application was not receiving.
- Fixed CapacityLimiter.acquire_on_behalf_of() on asyncio releasing
  the wrong borrower when the acquiring task was cancelled during
  the cancel-shielded checkpoint that runs after a non-blocking
  acquisition

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-anyio_4.15.1.bb => python3-anyio_4.16.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-anyio_4.15.1.bb => python3-anyio_4.16.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-anyio_4.15.1.bb b/meta-python/recipes-devtools/python/python3-anyio_4.16.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-anyio_4.15.1.bb
rename to meta-python/recipes-devtools/python/python3-anyio_4.16.0.bb
index e0d626e0e3..4d09c1ca78 100644
--- a/meta-python/recipes-devtools/python/python3-anyio_4.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-anyio_4.16.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c0a769411d2af7894099e8ff75058c9f"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "9f28306018cbd6d329e64a36d58256edff76dd996fe423bc957326e578b82a94"
+SRC_URI[sha256sum] = "59bb03251907983d1603d27c3087ddb1e93299ea2163adcdba37899a4fb12ffb"
 
 DEPENDS += " \
 	python3-setuptools-scm-native \
-- 
2.47.3

