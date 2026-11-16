Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23229.1794814538948610259
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 23:35:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=dbgad1j5;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so6744185e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 23:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794814537; x=1795419337; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MO/1t7iGEaFnnV9L6evg2xH7Hs7PexlIN7OViS+7JYI=;
        b=dbgad1j5fjI2OPhvnf2mYfJ9IFomwj92FkfF6yldd0Ovhf+H2u2vMWTwR+i4U2yLpc
         LUc2iTQaW5U4vNNNb3WLu0OlLLA8/4cm5YMYCHs5iSKVrAEAR3oVBleOXhT+bw0bsnoB
         4cXgJdPEx07INm+R5HV4J9yRSDDuAERVr75K0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814537; x=1795419337;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MO/1t7iGEaFnnV9L6evg2xH7Hs7PexlIN7OViS+7JYI=;
        b=hiMICjAvNCcHTG3dIa0Gpx3mjHTQTLMotSm8XBnf/rTEXWXSxnwrq2ZMN730pU/zQM
         tg9PEUG3ZbJDgmHVX51hYIj9uG3ddqaVY249i1HRdLbdoKLFcTYrUa8X7qFfdhEZyi/M
         tsfQRVH3P2Eebo1bork1yxsMOgYFoqTpReUv57k6Ruo/EtYn+qTBCDdvIoeyP/FfnAn4
         ncgzGJyTB3vpbBziON46BwBIi32hdKoNRiU/EORGgV38oInR1BRYo/B532F0PFFFnIou
         JxlziUSJfx7WHztM7nZks9LEzdDWc/MNs42E/s/M3Smmc69I2LOmmQ79Vc1wS0wReWv+
         FQ7w==
X-Gm-Message-State: APuU4Z9DXOSbmRo5jeVt1BvRod6t0ySfvQMvvXpGMCSZF4U9zAyz2Na6
	7m58iIEuYciT7AsluKi4RF1CTWlH9norkjNpGj4IcS8ToZNb9AdcnfkYRbxKaWLPZ0L03ZyCzSv
	q8cer
X-Gm-Gg: AYBFou3Bd+5o2+WzJBW8irM7wQaNJrbYjH6h5M2KOMoKcx948D+MIhsWAi3qnYJMoi7
	PsZcr1g+Hrs9sia3uiokw34NrtZVUJmb4QfMKpopJrh1IjuxrrV3+n7OWt9xDG/Myq8BvKqOAY3
	iqMg1DBa6VQP8eoanruCZjcDJ2M7l4t71szwD7c9/YSYrXCXo6pOLdouV2HRlOxXSYFhXDVern/
	e18rc6UqBBxIcsWJFgBeMHsZayahWart40OkPiXrWEcAk0Jp7prZQzyg+lvFz+5mauWGxolRAfM
	KuwCFTRdHKHzwfWNZUDvu1AoaORC4FgV716oMFPNdBcZ0CBXKmDvs4LgBnT5tqaJHUPElh3k1eU
	Y9azhgvaOPij8TZ06zWU7ipKQ04jZBE+RTJtekMse0htZAD5RA1Op8S27NvyEeOPIVBNS73obBC
	4b9BfnKhOjQFFEBavFl2XvXOoDCNFtmwSUgXEMHpZWyBkqE238tJv3kixcw2e4SZJvy7VfdFWOP
	wkgGjl2sWZiWNuDiq1lBno4Lr4Q/h3kLMO2Z4FGmxdqEM30lZMj7zNw24e7veXUNEuXO9KcTGMC
	3tC3tu0XCRk0bzeCJZt9eUWumsWp4qDSpvKVBxOyk3cTryXDBetAB63oAUoG3tvjp+sT95O3NgP
	W0PxudyyEuCD1V7Aa9MMmzhTHXEEhUfKqD2zhwJ6hp60BnUIH4P3TAA==
X-Received: by 2002:a05:600c:6383:b0:4bb:6687:5394 with SMTP id 5b1f17b1804b1-4bb66875577mr102363685e9.9.1794814537136;
        Sun, 15 Nov 2026 23:35:37 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm289781975e9.10.2026.11.15.23.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:35:36 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/24] python3-gunicorn: Upgrade 26.2.0 -> 27.0.0
Date: Mon, 16 Nov 2026 09:35:11 +0200
Message-ID: <20261116073532.880420-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116073532.880420-1-leon.anavi@konsulko.com>
References: <20261116073532.880420-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 07:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132432
Content-Type: text/plain; charset="utf-8"

Upgrade to release 27.0.0:

Breaking Changes:

- Reject with 400 a request whose Transfer-Encoding does not end
  with chunked, such as gzip or identity alone, with or without
  Content-Length (RFC 9112 §6.3). The WSGI workers used to read
  such a body until the connection closed and the ASGI worker
  treated it as empty. Clients that send Transfer-Encoding:
  identity must stop sending it.

Bug Fixes:

- Reject whitespace between a header name and the colon (RFC 9112
  §5.1).
- Trim only spaces and tabs around Transfer-Encoding values (RFC
  9110 §5.6.3) (#3364).
- Reject a Content-Length that is not plain digits (RFC 9110 §8.6).
- Reject chunk data not followed by CRLF (RFC 9112 §7.1).
- Reject control characters in the request path (RFC 9112 §3.2)
  (#3371).
- Return 414 URI Too Long for a request line over
  limit_request_line (RFC 9112 §3) (#2487).
- ASGI: never write more body bytes than the app's Content-Length,
  and close the connection when the body is shorter (RFC 9112
  §6.3).
- ASGI: close the connection when the app returns before finishing
  its response (RFC 9112 §6.3).
- ASGI: reject response header names and values that are not valid
  (RFC 9110 §5.1, §5.5).
- WSGI: reject a response status that is not three digits followed
  by a valid reason phrase (RFC 9112 §4).
- ASGI: read the body a HEAD request declares instead of serving it
  as the next request (RFC 9112 §6.3).
- ASGI: stop buffering a request line, header, chunk-size line or
  trailer that never ends; the usual request limits now apply
  before the line terminator arrives, and trailers count against
  limit_request_fields.
- ASGI: apply forwarded_allow_ips to HTTP/1 requests as WSGI and
  HTTP/2 already do: secure_scheme_headers set the scheme only from
  trusted proxies, and header names with underscores follow
  header_map.
- Ignore one empty line before the request line, as the fast parser
  already does (RFC 9112 §2.2).
- ASGI: stop gunicorn when the app reports a failed lifespan
  startup, instead of serving requests or rebooting the worker
  forever (ASGI lifespan spec) (#3778).
- ASGI: close idle kept-alive connections after keepalive seconds,
  as the other workers do (#3734).
- ASGI: give each request a shallow copy of the lifespan state, so
  a value one request stores in scope["state"] is not seen by the
  next one (ASGI lifespan spec).
- ASGI: deliver websocket.disconnect as soon as the client closes
  the connection, instead of after the close timeout (RFC 6455
  §5.5.1).
- ASGI: close a WebSocket with 1009 when a message is larger than
  the new websocket_max_message_size setting (default 16 MiB), and
  with 1002 for a control frame over 125 bytes or fragmented (RFC
  6455 §5.5, §7.4.1).
- ASGI: stop reading from a WebSocket while unread data or messages
  pile up, until the app catches up.
- gthread: serve a request that arrived while the previous
  request's unread body was drained, instead of leaving it until
  the keepalive timeout (#3770).
- gthread: idle keep-alive connections no longer hold up a graceful
  shutdown, and the worker keeps reporting to the arbiter while it
  waits, so it is not killed during max_requests restarts.
- Close the connection when reading a request body fails, instead
  of keeping it open with the bytes that followed the body lost.
- Don't call listen() again on a socket that already listens, such
  as one passed by systemd socket activation; SELinux can deny that
  call.
- With reuse_port on a platform without SO_REUSEPORT, workers now
  use the master's sockets instead of failing to bind.
- StatsD: send metrics over IPv6 when statsd_host is a numeric IPv6
  address; they used to be dropped silently.
- Read request bodies of known length in large steps instead of 8
  KiB at a time. Large uploads are much faster, most of all while
  other threads keep the worker busy (#2596).
- Read chunked request bodies in large steps too, up to the size
  each chunk announces (#2596).
- inotify reloader: reload when the target of a symlinked file
  changes (#3243).
- Docs: fix the worker types link in the worker_class setting.
- Docs: explain that timeout watches each worker's heartbeat, which
  idle workers keep updating.
- Close the connection after a CONNECT request, whatever the
  application answers; what follows is never served as another
  request (RFC 9931 §8).
- WSGI: answer 500 instead of 400 when the application sends an
  invalid response header, and leave the header value out of the
  error.
- Join repeated request headers in linear time when building the
  WSGI environ; many copies of one header used to take time growing
  with the square of their number.
- Reject a request path with raw non-ASCII bytes; they must be
  percent-encoded (RFC 9112 §3.2, RFC 3986 §2.1).
- Dirty arbiter: create its PID file in the temporary directory
  with mode 0600, and only use it to stop an orphaned arbiter when
  this user created it and the process is ours. A file left there
  by someone else is ignored.
- ASGI: stop reading from the socket while more than 256 KiB of
  request body or pipelined data waits for the application, and
  resume as it reads; uWSGI request bodies are read as the
  application asks for them.
- HTTP/2: close the connection with ENHANCE_YOUR_CALM when a peer
  sends more than 1000 PING, SETTINGS or empty DATA frames in 10
  seconds, as already done for RST_STREAM floods.
- HTTP/2, sync workers: close the connection with ENHANCE_YOUR_CALM
  when more than 10000 frames pile up while a response waits for
  window credit.
- WebSocket: fail the connection on frames RFC 6455 forbids: a new
  message inside a fragmented one, reserved opcodes, lengths not
  minimally encoded, malformed close frames (1002), and text or
  close reasons that are not UTF-8 (1007) (RFC 6455 §5.2, §5.4,
  §5.5.1, §7.4, §8.1). An empty client close is answered with 1000
  instead of the reserved 1005.
- WebSocket: refuse a handshake without Sec-WebSocket-Version: 13
  with 426 (and the supported version), and one whose key is not 16
  bytes of base64 with 400 (RFC 6455 §4.2.1, §4.2.2).
- WebSocket: refuse a handshake the application closes or never
  accepts with an HTTP 403 (500 if it raised), as ASGI requires,
  instead of writing a WebSocket close frame on a connection that
  never switched protocols.
- WebSocket: wait while the client is not reading before sending a
  message, as HTTP responses already do, so a slow client cannot
  grow the worker's write buffer.
- WebSocket: send() after the connection closed raises an OSError
  subclass, as ASGI 2.4 asks; it is still a RuntimeError, so
  existing handlers keep working, and gunicorn no longer logs it as
  an error. HTTP sends after a disconnect stay silently ignored.
- Dirty apps: bound every stream read by the idle timeout and the
  total timeout, and drop the connection when one fires, so a late
  chunk is never read by the next call. A sync stream's idle
  timeout is no longer replaced by a fixed 5 seconds.
- ASGI: answer Expect: 100-continue with 100 Continue when the app
  first reads the body, so clients such as curl no longer wait
  about a second before sending an upload (RFC 9110 §10.1.1).
- ASGI: answer a request the fast parser rejects with 400 and close
  the connection; it used to be dropped without a response, with a
  traceback logged for each one (RFC 9112 §3, §5.1).
- ASGI: put the standard reason phrase in error responses, such as
  400 Bad Request, and the error text in the body; the text, which
  can quote the request, used to be written into the status line
  (RFC 9112 §4).
- ASGI: answer 501 to a transfer coding gunicorn does not support,
  such as foo, chunked, as the WSGI workers do (RFC 9112 §6.1).
- ASGI: accept whitespace between a chunk size and its extension,
  such as 1 ;a, as the WSGI workers do (RFC 9112 §7.1.1).
- ASGI: copy a bytearray or memoryview response body when sending
  it; an app that reused the buffer after send returned could have
  the changed bytes sent.
- Reject a line ended by a bare LF at once with 400; with the
  Python parsers, a head or trailer section ended that way kept the
  connection waiting until a limit or the timeout (RFC 9112 §2.2).
- Reject a chunk extension that is not a name with an optional
  token or quoted-string value, such as one with a control
  character or an unclosed quote (RFC 9112 §7.1.1).
- WSGI: with the fast parser, answer 414 to a request line longer
  than limit_request_line that follows an empty line, as the Python
  parser does (RFC 9112 §2.2, §3).

Changes:

- Require gunicorn_h1c 0.6.14 for the fast extra. It parses
  requests faster, reads a chunked body in time proportional to its
  size, and accepts and rejects the same requests as gunicorn's
  Python parsers, whatever way their bytes are split across reads.
- ASGI: do less work per request: settings and forwarded-header
  trust are read once per connection, a request is built in one
  pass over its headers, their text copy is only made when
  something reads it, and response bodies of 64 KiB or more are
  sent without being copied. With one worker, small requests are
  about a third faster and streamed responses over 50% faster, and
  large responses use much less memory under load.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-gunicorn_26.2.0.bb => python3-gunicorn_27.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gunicorn_26.2.0.bb => python3-gunicorn_27.0.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-gunicorn_26.2.0.bb b/meta-python/recipes-devtools/python/python3-gunicorn_27.0.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-gunicorn_26.2.0.bb
rename to meta-python/recipes-devtools/python/python3-gunicorn_27.0.0.bb
index e19be89360..658abb9830 100644
--- a/meta-python/recipes-devtools/python/python3-gunicorn_26.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gunicorn_27.0.0.bb
@@ -3,7 +3,7 @@ SUMMARY = "WSGI HTTP Server for UNIX"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dc9171ccd8fcbd7827c850148b3ca98"
 
-SRC_URI[sha256sum] = "62b864895d9ebff0b2f9867ba04fe811c93121596540830c9c916d0769668447"
+SRC_URI[sha256sum] = "88d52e7c60b3af07bc8db431fbb450a94780f2cbe7c420c7cf1891392661c591"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.47.3

