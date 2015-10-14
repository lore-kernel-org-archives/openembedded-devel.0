Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id B735D76E3F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 18:51:40 +0000 (UTC)
Received: by wijp11 with SMTP id p11so7350592wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 11:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=wjH1cXBN7DfY1KDjuKn1k6Px3wP/4e57yh+FConq6gg=;
	b=vPo0AxrFUlYYa4pAZ/AvgXGtdHOxPLLLIEY7mjEco7BWBih60N4X8z+XJp/DSTleRa
	4T41LztnAXgmxBRqM7mg1zz3TtJaWXXQfkB31McNrtk9W2kUgGhheIQT/hgMrbBzDkOt
	qwViwvwM3rB5R/x6yCwUpZKY9JrI/2rSeJ4EnRLLj7/MSqSsKW8oHD0ohNEHjiVbZL9F
	0NAioqKjNtfBlGW7/50380BzHtclCZNYgWj8QresfyBSC7KzpelWLFBQewhddjh4dkG+
	dkICpCDKL6Chut2n4XuOUUlYrbOcaNt+5/jO6iQQZdsaXhFw6T7LW5KHcoC1t7Yr5dSW
	xfGQ==
X-Received: by 10.180.188.100 with SMTP id fz4mr25043965wic.28.1444848699116; 
	Wed, 14 Oct 2015 11:51:39 -0700 (PDT)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id h8sm8219673wib.21.2015.10.14.11.51.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Oct 2015 11:51:38 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <59D3F7D5-D95D-473C-BDB4-677B4698039F@gmail.com>
Date: Wed, 14 Oct 2015 20:51:38 +0200
To: OE-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [meta-webserver][PATCH 4/6] nginx: update to 1.9.5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Oct 2015 18:51:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

many bux-fixes, optmizations and features added:

Changes with nginx 1.9.5                                         22 Sep =
2015

    *) Feature: the ngx_http_v2_module (replaces ngx_http_spdy_module).
       Thanks to Dropbox and Automattic for sponsoring this work.

    *) Change: now the "output_buffers" directive uses two buffers by
       default.

    *) Change: now nginx limits subrequests recursion, not simultaneous
       subrequests.

    *) Change: now nginx checks the whole cache key when returning a
       response from cache.
       Thanks to Gena Makhomed and Sergey Brester.

    *) Bugfix: "header already sent" alerts might appear in logs when =
using
       cache; the bug had appeared in 1.7.5.

    *) Bugfix: "writev() failed (4: Interrupted system call)" errors =
might
       appear in logs when using CephFS and the "timer_resolution" =
directive
       on Linux.

    *) Bugfix: in invalid configurations handling.
       Thanks to Markus Linnala.

    *) Bugfix: a segmentation fault occurred in a worker process if the
       "sub_filter" directive was used at http level; the bug had =
appeared
       in 1.9.4.

Changes with nginx 1.9.4                                         18 Aug =
2015

    *) Change: the "proxy_downstream_buffer" and "proxy_upstream_buffer"
       directives of the stream module are replaced with the
       "proxy_buffer_size" directive.

    *) Feature: the "tcp_nodelay" directive in the stream module.

    *) Feature: multiple "sub_filter" directives can be used =
simultaneously.

    *) Feature: variables support in the search string of the =
"sub_filter"
       directive.

    *) Workaround: configuration testing might fail under Linux OpenVZ.
       Thanks to Gena Makhomed.

    *) Bugfix: old worker processes might hog CPU after reconfiguration =
with
       a large number of worker_connections.

    *) Bugfix: a segmentation fault might occur in a worker process if =
the
       "try_files" and "alias" directives were used inside a location =
given
       by a regular expression; the bug had appeared in 1.7.1.

    *) Bugfix: the "try_files" directive inside a nested location given =
by a
       regular expression worked incorrectly if the "alias" directive =
was
       used in the outer location.

    *) Bugfix: in hash table initialization error handling.

    *) Bugfix: nginx could not be built with Visual Studio 2015.

Changes with nginx 1.9.3                                         14 Jul =
2015

    *) Change: duplicate "http", "mail", and "stream" blocks are now
       disallowed.

    *) Feature: connection limiting in the stream module.

    *) Feature: data rate limiting in the stream module.

    *) Bugfix: the "zone" directive inside the "upstream" block did not =
work
       on Windows.

    *) Bugfix: compatibility with LibreSSL in the stream module.
       Thanks to Piotr Sikora.

    *) Bugfix: in the "--builddir" configure parameter.
       Thanks to Piotr Sikora.

    *) Bugfix: the "ssl_stapling_file" directive did not work; the bug =
had
       appeared in 1.9.2.
       Thanks to Faidon Liambotis and Brandon Black.

    *) Bugfix: a segmentation fault might occur in a worker process if =
the
       "ssl_stapling" directive was used; the bug had appeared in 1.9.2.
       Thanks to Matthew Baldwin.

Changes with nginx 1.9.2                                         16 Jun =
2015

    *) Feature: the "backlog" parameter of the "listen" directives of =
the
       mail proxy and stream modules.

    *) Feature: the "allow" and "deny" directives in the stream module.

    *) Feature: the "proxy_bind" directive in the stream module.

    *) Feature: the "proxy_protocol" directive in the stream module.

    *) Feature: the -T switch.

    *) Feature: the REQUEST_SCHEME parameter added to the fastcgi.conf,
       fastcgi_params, scgi_params, and uwsgi_params standard =
configuration
       files.

    *) Bugfix: the "reuseport" parameter of the "listen" directive of =
the
       stream module did not work.

    *) Bugfix: OCSP stapling might return an expired OCSP response in =
some
       cases.

Changes with nginx 1.9.1                                         26 May =
2015

    *) Change: now SSLv3 protocol is disabled by default.

    *) Change: some long deprecated directives are not supported =
anymore.

    *) Feature: the "reuseport" parameter of the "listen" directive.
       Thanks to Yingqi Lu at Intel and Sepherosa Ziehau.

    *) Feature: the $upstream_connect_time variable.

    *) Bugfix: in the "hash" directive on big-endian platforms.

    *) Bugfix: nginx might fail to start on some old Linux variants; the =
bug
       had appeared in 1.7.11.

    *) Bugfix: in IP address parsing.
       Thanks to Sergey Polovko.

Changes with nginx 1.9.0                                         28 Apr =
2015

    *) Change: obsolete aio and rtsig event methods have been removed.

    *) Feature: the "zone" directive inside the "upstream" block.

    *) Feature: the stream module.

    *) Feature: byte ranges support in the ngx_http_memcached_module.
       Thanks to Martin Mlyn=C3=A1=C5=99.

    *) Feature: shared memory can now be used on Windows versions with
       address space layout randomization.
       Thanks to Sergey Brester.

    *) Feature: the "error_log" directive can now be used on mail and =
server
       levels in mail proxy.

    *) Bugfix: the "proxy_protocol" parameter of the "listen" directive =
did
       not work if not specified in the first "listen" directive for a
       listen socket.

Changes with nginx 1.7.12                                        07 Apr =
2015

    *) Feature: now the "tcp_nodelay" directive works with backend SSL
       connections.

    *) Feature: now thread pools can be used to read cache file headers.

    *) Bugfix: in the "proxy_request_buffering" directive.

    *) Bugfix: a segmentation fault might occur in a worker process when
       using thread pools on Linux.

    *) Bugfix: in error handling when using the "ssl_stapling" =
directive.
       Thanks to Filipe da Silva.

    *) Bugfix: in the ngx_http_spdy_module.

Changes with nginx 1.7.11                                        24 Mar =
2015

    *) Change: the "sendfile" parameter of the "aio" directive is
       deprecated; now nginx automatically uses AIO to pre-load data for
       sendfile if both "aio" and "sendfile" directives are used.

    *) Feature: experimental thread pools support.

    *) Feature: the "proxy_request_buffering", =
"fastcgi_request_buffering",
       "scgi_request_buffering", and "uwsgi_request_buffering" =
directives.

    *) Feature: request body filters experimental API.

    *) Feature: client SSL certificates support in mail proxy.
       Thanks to Sven Peter, Franck Levionnois, and Filipe Da Silva.

    *) Feature: startup speedup when using the "hash ... consistent"
       directive in the upstream block.
       Thanks to Wai Keen Woon.

    *) Feature: debug logging into a cyclic memory buffer.

    *) Bugfix: in hash table handling.
       Thanks to Chris West.

    *) Bugfix: in the "proxy_cache_revalidate" directive.

    *) Bugfix: SSL connections might hang if deferred accept or the
       "proxy_protocol" parameter of the "listen" directive were used.
       Thanks to James Hamlin.

    *) Bugfix: the $upstream_response_time variable might contain a =
wrong
       value if the "image_filter" directive was used.

    *) Bugfix: in integer overflow handling.
       Thanks to R=C3=A9gis Leroy.

    *) Bugfix: it was not possible to enable SSLv3 with LibreSSL.

    *) Bugfix: the "ignoring stale global SSL error ... called a =
function
       you should not call" alerts appeared in logs when using LibreSSL.

    *) Bugfix: certificates specified by the "ssl_client_certificate" =
and
       "ssl_trusted_certificate" directives were inadvertently used to
       automatically construct certificate chains.

Changes with nginx 1.7.10                                        10 Feb =
2015

    *) Feature: the "use_temp_path" parameter of the "proxy_cache_path",
       "fastcgi_cache_path", "scgi_cache_path", and "uwsgi_cache_path"
       directives.

    *) Feature: the $upstream_header_time variable.

    *) Workaround: now on disk overflow nginx tries to write error logs =
once
       a second only.

    *) Bugfix: the "try_files" directive did not ignore normal files =
while
       testing directories.
       Thanks to Damien Tournoud.

    *) Bugfix: alerts "sendfile() failed" if the "sendfile" directive =
was
       used on OS X; the bug had appeared in 1.7.8.

    *) Bugfix: alerts "sem_post() failed" might appear in logs.

    *) Bugfix: nginx could not be built with musl libc.
       Thanks to James Taylor.

    *) Bugfix: nginx could not be built on Tru64 UNIX.
       Thanks to Goetz T. Fischer.

Changes with nginx 1.7.9                                         23 Dec =
2014

    *) Feature: variables support in the "proxy_cache", "fastcgi_cache",
       "scgi_cache", and "uwsgi_cache" directives.

    *) Feature: variables support in the "expires" directive.

    *) Feature: loading of secret keys from hardware tokens with OpenSSL
       engines.
       Thanks to Dmitrii Pichulin.

    *) Feature: the "autoindex_format" directive.

    *) Bugfix: cache revalidation is now only used for responses with =
200
       and 206 status codes.
       Thanks to Piotr Sikora.

    *) Bugfix: the "TE" client request header line was passed to =
backends
       while proxying.

    *) Bugfix: the "proxy_pass", "fastcgi_pass", "scgi_pass", and
       "uwsgi_pass" directives might not work correctly inside the "if" =
and
       "limit_except" blocks.

    *) Bugfix: the "proxy_store" directive with the "on" parameter was
       ignored if the "proxy_store" directive with an explicitly =
specified
       file path was used on a previous level.

    *) Bugfix: nginx could not be built with BoringSSL.
       Thanks to Lukas Tribus.

Changes with nginx 1.7.8                                         02 Dec =
2014

    *) Change: now the "If-Modified-Since", "If-Range", etc. client =
request
       header lines are passed to a backend while caching if nginx knows =
in
       advance that the response will not be cached (e.g., when using
       proxy_cache_min_uses).

    *) Change: now after proxy_cache_lock_timeout nginx sends a request =
to a
       backend with caching disabled; the new directives
       "proxy_cache_lock_age", "fastcgi_cache_lock_age",
       "scgi_cache_lock_age", and "uwsgi_cache_lock_age" specify a time
       after which the lock will be released and another attempt to =
cache a
       response will be made.

    *) Change: the "log_format" directive can now be used only at http
       level.

    *) Feature: the "proxy_ssl_certificate", =
"proxy_ssl_certificate_key",
       "proxy_ssl_password_file", "uwsgi_ssl_certificate",
       "uwsgi_ssl_certificate_key", and "uwsgi_ssl_password_file"
       directives.
       Thanks to Piotr Sikora.

    *) Feature: it is now possible to switch to a named location using
       "X-Accel-Redirect".
       Thanks to Toshikuni Fukaya.

    *) Feature: now the "tcp_nodelay" directive works with SPDY =
connections.

    *) Feature: new directives in vim syntax highliting scripts.
       Thanks to Peter Wu.

    *) Bugfix: nginx ignored the "s-maxage" value in the "Cache-Control"
       backend response header line.
       Thanks to Piotr Sikora.

    *) Bugfix: in the ngx_http_spdy_module.
       Thanks to Piotr Sikora.

    *) Bugfix: in the "ssl_password_file" directive when using OpenSSL
       0.9.8zc, 1.0.0o, 1.0.1j.

    *) Bugfix: alerts "header already sent" appeared in logs if the
       "post_action" directive was used; the bug had appeared in 1.5.4.

    *) Bugfix: alerts "the http output chain is empty" might appear in =
logs
       if the "postpone_output 0" directive was used with SSI includes.

    *) Bugfix: in the "proxy_cache_lock" directive with SSI subrequests.
       Thanks to Yichun Zhang.

Changes with nginx 1.7.7                                         28 Oct =
2014

    *) Change: now nginx takes into account the "Vary" header line in a
       backend response while caching.

    *) Feature: the "proxy_force_ranges", "fastcgi_force_ranges",
       "scgi_force_ranges", and "uwsgi_force_ranges" directives.

    *) Feature: the "proxy_limit_rate", "fastcgi_limit_rate",
       "scgi_limit_rate", and "uwsgi_limit_rate" directives.

    *) Feature: the "Vary" parameter of the "proxy_ignore_headers",
       "fastcgi_ignore_headers", "scgi_ignore_headers", and
       "uwsgi_ignore_headers" directives.

    *) Bugfix: the last part of a response received from a backend with
       unbufferred proxy might not be sent to a client if "gzip" or =
"gunzip"
       directives were used.

    *) Bugfix: in the "proxy_cache_revalidate" directive.
       Thanks to Piotr Sikora.

    *) Bugfix: in error handling.
       Thanks to Yichun Zhang and Daniil Bondarev.

    *) Bugfix: in the "proxy_next_upstream_tries" and
       "proxy_next_upstream_timeout" directives.
       Thanks to Feng Gu.

    *) Bugfix: nginx/Windows could not be built with MinGW-w64 gcc.
       Thanks to Kouhei Sutou.

Changes with nginx 1.7.6                                         30 Sep =
2014

    *) Change: the deprecated "limit_zone" directive is not supported
       anymore.

    *) Feature: the "limit_conn_zone" and "limit_req_zone" directives =
now
       can be used with combinations of multiple variables.

    *) Bugfix: request body might be transmitted incorrectly when =
retrying a
       FastCGI request to the next upstream server.

    *) Bugfix: in logging to syslog.

Changes with nginx 1.7.5                                         16 Sep =
2014

    *) Security: it was possible to reuse SSL sessions in unrelated =
contexts
       if a shared SSL session cache or the same TLS session ticket key =
was
       used for multiple "server" blocks (CVE-2014-3616).
       Thanks to Antoine Delignat-Lavaud.

    *) Change: now the "stub_status" directive does not require a =
parameter.

    *) Feature: the "always" parameter of the "add_header" directive.

    *) Feature: the "proxy_next_upstream_tries",
       "proxy_next_upstream_timeout", "fastcgi_next_upstream_tries",
       "fastcgi_next_upstream_timeout", "memcached_next_upstream_tries",
       "memcached_next_upstream_timeout", "scgi_next_upstream_tries",
       "scgi_next_upstream_timeout", "uwsgi_next_upstream_tries", and
       "uwsgi_next_upstream_timeout" directives.

    *) Bugfix: in the "if" parameter of the "access_log" directive.

    *) Bugfix: in the ngx_http_perl_module.
       Thanks to Piotr Sikora.

    *) Bugfix: the "listen" directive of the mail proxy module did not =
allow
       to specify more than two parameters.

    *) Bugfix: the "sub_filter" directive did not work with a string to
       replace consisting of a single character.

    *) Bugfix: requests might hang if resolver was used and a timeout
       occurred during a DNS request.

    *) Bugfix: in the ngx_http_spdy_module when using with AIO.

    *) Bugfix: a segmentation fault might occur in a worker process if =
the
       "set" directive was used to change the "$http_...", =
"$sent_http_...",
       or "$upstream_http_..." variables.

    *) Bugfix: in memory allocation error handling.
       Thanks to Markus Linnala and Feng Gu.

Changes with nginx 1.7.4                                         05 Aug =
2014

    *) Security: pipelined commands were not discarded after STARTTLS
       command in SMTP proxy (CVE-2014-3556); the bug had appeared in =
1.5.6.
       Thanks to Chris Boulton.

    *) Change: URI escaping now uses uppercase hexadecimal digits.
       Thanks to Piotr Sikora.

    *) Feature: now nginx can be build with BoringSSL and LibreSSL.
       Thanks to Piotr Sikora.

    *) Bugfix: requests might hang if resolver was used and a DNS server
       returned a malformed response; the bug had appeared in 1.5.8.

    *) Bugfix: in the ngx_http_spdy_module.
       Thanks to Piotr Sikora.

    *) Bugfix: the $uri variable might contain garbage when returning =
errors
       with code 400.
       Thanks to Sergey Bobrov.

    *) Bugfix: in error handling in the "proxy_store" directive and the
       ngx_http_dav_module.
       Thanks to Feng Gu.

    *) Bugfix: a segmentation fault might occur if logging of errors to
       syslog was used; the bug had appeared in 1.7.1.

    *) Bugfix: the $geoip_latitude, $geoip_longitude, $geoip_dma_code, =
and
       $geoip_area_code variables might not work.
       Thanks to Yichun Zhang.

    *) Bugfix: in memory allocation error handling.
       Thanks to Tatsuhiko Kubo and Piotr Sikora.

Changes with nginx 1.7.3                                         08 Jul =
2014

    *) Feature: weak entity tags are now preserved on response
       modifications, and strong ones are changed to weak.

    *) Feature: cache revalidation now uses If-None-Match header if
       possible.

    *) Feature: the "ssl_password_file" directive.

    *) Bugfix: the If-None-Match request header line was ignored if =
there
       was no Last-Modified header in a response returned from cache.

    *) Bugfix: "peer closed connection in SSL handshake" messages were
       logged at "info" level instead of "error" while connecting to
       backends.

    *) Bugfix: in the ngx_http_dav_module module in nginx/Windows.

    *) Bugfix: SPDY connections might be closed prematurely if caching =
was
       used.

Changes with nginx 1.7.2                                         17 Jun =
2014

    *) Feature: the "hash" directive inside the "upstream" block.

    *) Feature: defragmentation of free shared memory blocks.
       Thanks to Wandenberg Peixoto and Yichun Zhang.

    *) Bugfix: a segmentation fault might occur in a worker process if =
the
       default value of the "access_log" directive was used; the bug had
       appeared in 1.7.0.
       Thanks to Piotr Sikora.

    *) Bugfix: trailing slash was mistakenly removed from the last =
parameter
       of the "try_files" directive.

    *) Bugfix: nginx could not be built on OS X in some cases.

    *) Bugfix: in the ngx_http_spdy_module.

Changes with nginx 1.7.1                                         27 May =
2014

    *) Feature: the "$upstream_cookie_..." variables.

    *) Feature: the $ssl_client_fingerprint variable.

    *) Feature: the "error_log" and "access_log" directives now support
       logging to syslog.

    *) Feature: the mail proxy now logs client port on connect.

    *) Bugfix: memory leak if the "ssl_stapling" directive was used.
       Thanks to Filipe da Silva.

    *) Bugfix: the "alias" directive used inside a location given by a
       regular expression worked incorrectly if the "if" or =
"limit_except"
       directives were used.

    *) Bugfix: the "charset" directive did not set a charset to encoded
       backend responses.

    *) Bugfix: a "proxy_pass" directive without URI part might use =
original
       request after the $args variable was set.
       Thanks to Yichun Zhang.

    *) Bugfix: in the "none" parameter in the "smtp_auth" directive; the =
bug
       had appeared in 1.5.6.
       Thanks to Svyatoslav Nikolsky.

    *) Bugfix: if sub_filter and SSI were used together, then responses
       might be transferred incorrectly.

    *) Bugfix: nginx could not be built with the --with-file-aio option =
on
       Linux/aarch64.

Changes with nginx 1.7.0                                         24 Apr =
2014

    *) Feature: backend SSL certificate verification.

    *) Feature: support for SNI while working with SSL backends.

    *) Feature: the $ssl_server_name variable.

    *) Feature: the "if" parameter of the "access_log" directive.

Changes with nginx 1.5.13                                        08 Apr =
2014

    *) Change: improved hash table handling; the default values of the
       "variables_hash_max_size" and "types_hash_bucket_size" were =
changed
       to 1024 and 64 respectively.

    *) Feature: the ngx_http_mp4_module now supports the "end" argument.

    *) Feature: byte ranges support in the ngx_http_mp4_module and while
       saving responses to cache.

    *) Bugfix: alerts "ngx_slab_alloc() failed: no memory" no longer =
logged
       when using shared memory in the "ssl_session_cache" directive and =
in
       the ngx_http_limit_req_module.

    *) Bugfix: the "underscores_in_headers" directive did not allow
       underscore as a first character of a header.
       Thanks to Piotr Sikora.

    *) Bugfix: cache manager might hog CPU on exit in nginx/Windows.

    *) Bugfix: nginx/Windows terminated abnormally if the
       "ssl_session_cache" directive was used with the "shared" =
parameter.

    *) Bugfix: in the ngx_http_spdy_module.

Changes with nginx 1.5.12                                        18 Mar =
2014

    *) Security: a heap memory buffer overflow might occur in a worker
       process while handling a specially crafted request by
       ngx_http_spdy_module, potentially resulting in arbitrary code
       execution (CVE-2014-0133).
       Thanks to Lucas Molas, researcher at Programa STIC, Fundaci=C3=B3n =
Dr.
       Manuel Sadosky, Buenos Aires, Argentina.

    *) Feature: the "proxy_protocol" parameters of the "listen" and
       "real_ip_header" directives, the $proxy_protocol_addr variable.

    *) Bugfix: in the "fastcgi_next_upstream" directive.
       Thanks to Lucas Molas.

Changes with nginx 1.5.11                                        04 Mar =
2014

    *) Security: memory corruption might occur in a worker process on =
32-bit
       platforms while handling a specially crafted request by
       ngx_http_spdy_module, potentially resulting in arbitrary code
       execution (CVE-2014-0088); the bug had appeared in 1.5.10.
       Thanks to Lucas Molas, researcher at Programa STIC, Fundaci=C3=B3n =
Dr.
       Manuel Sadosky, Buenos Aires, Argentina.

    *) Feature: the $ssl_session_reused variable.

    *) Bugfix: the "client_max_body_size" directive might not work when
       reading a request body using chunked transfer encoding; the bug =
had
       appeared in 1.3.9.
       Thanks to Lucas Molas.

    *) Bugfix: a segmentation fault might occur in a worker process when
       proxying WebSocket connections.

    *) Bugfix: a segmentation fault might occur in a worker process if =
the
       ngx_http_spdy_module was used on 32-bit platforms; the bug had
       appeared in 1.5.10.

    *) Bugfix: the $upstream_status variable might contain wrong data if =
the
       "proxy_cache_use_stale" or "proxy_cache_revalidate" directives =
were
       used.
       Thanks to Piotr Sikora.

    *) Bugfix: a segmentation fault might occur in a worker process if
       errors with code 400 were redirected to a named location using =
the
       "error_page" directive.

    *) Bugfix: nginx/Windows could not be built with Visual Studio 2013.

Changes with nginx 1.5.10                                        04 Feb =
2014

    *) Feature: the ngx_http_spdy_module now uses SPDY 3.1 protocol.
       Thanks to Automattic and MaxCDN for sponsoring this work.

    *) Feature: the ngx_http_mp4_module now skips tracks too short for a
       seek requested.

    *) Bugfix: a segmentation fault might occur in a worker process if =
the
       $ssl_session_id variable was used in logs; the bug had appeared =
in
       1.5.9.

    *) Bugfix: the $date_local and $date_gmt variables used wrong format
       outside of the ngx_http_ssi_filter_module.

    *) Bugfix: client connections might be immediately closed if =
deferred
       accept was used; the bug had appeared in 1.3.15.

    *) Bugfix: alerts "getsockopt(TCP_FASTOPEN) ... failed" appeared in =
logs
       during binary upgrade on Linux; the bug had appeared in 1.5.8.
       Thanks to Piotr Sikora.

Changes with nginx 1.5.9                                         22 Jan =
2014

    *) Change: now nginx expects escaped URIs in "X-Accel-Redirect" =
headers.

    *) Feature: the "ssl_buffer_size" directive.

    *) Feature: the "limit_rate" directive can now be used to rate limit
       responses sent in SPDY connections.

    *) Feature: the "spdy_chunk_size" directive.

    *) Feature: the "ssl_session_tickets" directive.
       Thanks to Dirkjan Bussink.

    *) Bugfix: the $ssl_session_id variable contained full session
       serialized instead of just a session id.
       Thanks to Ivan Risti=C4=87.

    *) Bugfix: nginx incorrectly handled escaped "?" character in the
       "include" SSI command.

    *) Bugfix: the ngx_http_dav_module did not unescape destination URI =
of
       the COPY and MOVE methods.

    *) Bugfix: resolver did not understand domain names with a trailing =
dot.
       Thanks to Yichun Zhang.

    *) Bugfix: alerts "zero size buf in output" might appear in logs =
while
       proxying; the bug had appeared in 1.3.9.

    *) Bugfix: a segmentation fault might occur in a worker process if =
the
       ngx_http_spdy_module was used.

    *) Bugfix: proxied WebSocket connections might hang right after
       handshake if the select, poll, or /dev/poll methods were used.

    *) Bugfix: the "xclient" directive of the mail proxy module =
incorrectly
       handled IPv6 client addresses.

Changes with nginx 1.5.8                                         17 Dec =
2013

    *) Feature: IPv6 support in resolver.

    *) Feature: the "listen" directive supports the "fastopen" =
parameter.
       Thanks to Mathew Rodley.

    *) Feature: SSL support in the ngx_http_uwsgi_module.
       Thanks to Roberto De Ioris.

    *) Feature: vim syntax highlighting scripts were added to contrib.
       Thanks to Evan Miller.

    *) Bugfix: a timeout might occur while reading client request body =
in an
       SSL connection using chunked transfer encoding.

    *) Bugfix: the "master_process" directive did not work correctly in
       nginx/Windows.

    *) Bugfix: the "setfib" parameter of the "listen" directive might =
not
       work.

    *) Bugfix: in the ngx_http_spdy_module.

Changes with nginx 1.5.7                                         19 Nov =
2013

    *) Security: a character following an unescaped space in a request =
line
       was handled incorrectly (CVE-2013-4547); the bug had appeared in
       0.8.41.
       Thanks to Ivan Fratric of the Google Security Team.

    *) Change: a logging level of auth_basic errors about no =
user/password
       provided has been lowered from "error" to "info".

    *) Feature: the "proxy_cache_revalidate", =
"fastcgi_cache_revalidate",
       "scgi_cache_revalidate", and "uwsgi_cache_revalidate" directives.

    *) Feature: the "ssl_session_ticket_key" directive.
       Thanks to Piotr Sikora.

    *) Bugfix: the directive "add_header Cache-Control ''" added a
       "Cache-Control" response header line with an empty value.

    *) Bugfix: the "satisfy any" directive might return 403 error =
instead of
       401 if auth_request and auth_basic directives were used.
       Thanks to Jan Marc Hoffmann.

    *) Bugfix: the "accept_filter" and "deferred" parameters of the =
"listen"
       directive were ignored for listen sockets created during binary
       upgrade.
       Thanks to Piotr Sikora.

    *) Bugfix: some data received from a backend with unbufferred proxy
       might not be sent to a client immediately if "gzip" or "gunzip"
       directives were used.
       Thanks to Yichun Zhang.

    *) Bugfix: in error handling in ngx_http_gunzip_filter_module.

    *) Bugfix: responses might hang if the ngx_http_spdy_module was used
       with the "auth_request" directive.

    *) Bugfix: memory leak in nginx/Windows.

Changes with nginx 1.5.6                                         01 Oct =
2013

    *) Feature: the "fastcgi_buffering" directive.

    *) Feature: the "proxy_ssl_protocols" and "proxy_ssl_ciphers"
       directives.
       Thanks to Piotr Sikora.

    *) Feature: optimization of SSL handshakes when using long =
certificate
       chains.

    *) Feature: the mail proxy supports SMTP pipelining.

    *) Bugfix: in the ngx_http_auth_basic_module when using "$apr1$"
       password encryption method.
       Thanks to Markus Linnala.

    *) Bugfix: in MacOSX, Cygwin, and nginx/Windows incorrect location =
might
       be used to process a request if locations were given using =
characters
       in different cases.

    *) Bugfix: automatic redirect with appended trailing slash for =
proxied
       locations might not work.

    *) Bugfix: in the mail proxy server.

    *) Bugfix: in the ngx_http_spdy_module.

Changes with nginx 1.5.5                                         17 Sep =
2013

    *) Change: now nginx assumes HTTP/1.0 by default if it is not able =
to
       detect protocol reliably.

    *) Feature: the "disable_symlinks" directive now uses O_PATH on =
Linux.

    *) Feature: now nginx uses EPOLLRDHUP events to detect premature
       connection close by clients if the "epoll" method is used.

    *) Bugfix: in the "valid_referers" directive if the "server_names"
       parameter was used.

    *) Bugfix: the $request_time variable did not work in nginx/Windows.

    *) Bugfix: in the "image_filter" directive.
       Thanks to Lanshun Zhou.

    *) Bugfix: OpenSSL 1.0.1f compatibility.
       Thanks to Piotr Sikora.

Changes with nginx 1.5.4                                         27 Aug =
2013

    *) Change: the "js" extension MIME type has been changed to
       "application/javascript"; default value of the "charset_types"
       directive was changed accordingly.

    *) Change: now the "image_filter" directive with the "size" =
parameter
       returns responses with the "application/json" MIME type.

    *) Feature: the ngx_http_auth_request_module.

    *) Bugfix: a segmentation fault might occur on start or during
       reconfiguration if the "try_files" directive was used with an =
empty
       parameter.

    *) Bugfix: memory leak if relative paths were specified using =
variables
       in the "root" or "auth_basic_user_file" directives.

    *) Bugfix: the "valid_referers" directive incorrectly executed =
regular
       expressions if a "Referer" header started with "https://".
       Thanks to Liangbin Li.

    *) Bugfix: responses might hang if subrequests were used and an SSL
       handshake error happened during subrequest processing.
       Thanks to Aviram Cohen.

    *) Bugfix: in the ngx_http_autoindex_module.

    *) Bugfix: in the ngx_http_spdy_module.

Changes with nginx 1.5.3                                         30 Jul =
2013

    *) Change in internal API: now u->length defaults to -1 if working =
with
       backends in unbuffered mode.

    *) Change: now after receiving an incomplete response from a backend
       server nginx tries to send an available part of the response to a
       client, and then closes client connection.

    *) Bugfix: a segmentation fault might occur in a worker process if =
the
       ngx_http_spdy_module was used with the "client_body_in_file_only"
       directive.

    *) Bugfix: the "so_keepalive" parameter of the "listen" directive =
might
       be handled incorrectly on DragonFlyBSD.
       Thanks to Sepherosa Ziehau.

    *) Bugfix: in the ngx_http_xslt_filter_module.

    *) Bugfix: in the ngx_http_sub_filter_module.

Changes with nginx 1.5.2                                         02 Jul =
2013

    *) Feature: now several "error_log" directives can be used.

    *) Bugfix: the $r->header_in() embedded perl method did not return =
value
       of the "Cookie" and "X-Forwarded-For" request header lines; the =
bug
       had appeared in 1.3.14.

    *) Bugfix: in the ngx_http_spdy_module.
       Thanks to Jim Radford.

    *) Bugfix: nginx could not be built on Linux with x32 ABI.
       Thanks to Serguei Ivantsov.

Changes with nginx 1.5.1                                         04 Jun =
2013

    *) Feature: the "ssi_last_modified", "sub_filter_last_modified", and
       "xslt_last_modified" directives.
       Thanks to Alexey Kolpakov.

    *) Feature: the "http_403" parameter of the "proxy_next_upstream",
       "fastcgi_next_upstream", "scgi_next_upstream", and
       "uwsgi_next_upstream" directives.

    *) Feature: the "allow" and "deny" directives now support unix =
domain
       sockets.

    *) Bugfix: nginx could not be built with the ngx_mail_ssl_module, =
but
       without ngx_http_ssl_module; the bug had appeared in 1.3.14.

    *) Bugfix: in the "proxy_set_body" directive.
       Thanks to Lanshun Zhou.

    *) Bugfix: in the "lingering_time" directive.
       Thanks to Lanshun Zhou.

    *) Bugfix: the "fail_timeout" parameter of the "server" directive in =
the
       "upstream" context might not work if "max_fails" parameter was =
used;
       the bug had appeared in 1.3.0.

    *) Bugfix: a segmentation fault might occur in a worker process if =
the
       "ssl_stapling" directive was used.
       Thanks to Piotr Sikora.

    *) Bugfix: in the mail proxy server.
       Thanks to Filipe Da Silva.

    *) Bugfix: nginx/Windows might stop accepting connections if several
       worker processes were used.

Changes with nginx 1.5.0                                         07 May =
2013

    *) Security: a stack-based buffer overflow might occur in a worker
       process while handling a specially crafted request, potentially
       resulting in arbitrary code execution (CVE-2013-2028); the bug =
had
       appeared in 1.3.9.
       Thanks to Greg MacManus, iSIGHT Partners Labs.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../recipes-httpd/nginx/files/nginx-cross.patch         | 17 =
+++++++++--------
 .../nginx/{nginx_1.4.4.bb =3D> nginx_1.9.5.bb}            |  6 +++---
 2 files changed, 12 insertions(+), 11 deletions(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.4.4.bb =3D> =
nginx_1.9.5.bb} (94%)

diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx-cross.patch =
b/meta-webserver/recipes-httpd/nginx/files/nginx-cross.patch
index 5f899a1..46792ba 100644
--- a/meta-webserver/recipes-httpd/nginx/files/nginx-cross.patch
+++ b/meta-webserver/recipes-httpd/nginx/files/nginx-cross.patch
@@ -122,7 +122,7 @@ diff -uraN nginx-1.0.11.orig/auto/options =
nginx-1.0.11/auto/options
 diff -uraN nginx-1.0.11.orig/auto/types/sizeof =
nginx-1.0.11/auto/types/sizeof
 --- nginx-1.0.11.orig/auto/types/sizeof	2006-06-28 =
11:00:26.000000000 -0500
 +++ nginx-1.0.11/auto/types/sizeof	2011-12-27 13:56:42.323370040 =
-0600
-@@ -11,9 +11,12 @@
+@@ -12,9 +12,12 @@
 =20
  END
 =20
@@ -137,14 +137,14 @@ diff -uraN nginx-1.0.11.orig/auto/types/sizeof =
nginx-1.0.11/auto/types/sizeof
 =20
  #include <sys/types.h>
  #include <sys/time.h>
-@@ -31,19 +34,20 @@
+@@ -33,20 +36,20 @@
  END
 =20
 =20
 -ngx_test=3D"$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
 -          -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT =
$ngx_feature_libs"
 +    ngx_test=3D"$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
-+              -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT =
$ngx_feature_libs"
++	      -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT =
$ngx_feature_libs"
 =20
 -eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
 +    eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
@@ -155,17 +155,18 @@ diff -uraN nginx-1.0.11.orig/auto/types/sizeof =
nginx-1.0.11/auto/types/sizeof
 -    echo " $ngx_size bytes"
 -fi
 +    if [ -x $NGX_AUTOTEST ]; then
-+        ngx_size=3D`$NGX_AUTOTEST`
-+        echo " $ngx_size bytes"
++	ngx_size=3D`$NGX_AUTOTEST`
++	echo " $ngx_size bytes"
 +    fi
 =20
 =20
--rm -f $NGX_AUTOTEST
-+    rm -f $NGX_AUTOTEST
+-rm -rf $NGX_AUTOTEST*
+-
++    rm -rf $NGX_AUTOTEST*
 +fi
 =20
-=20
  case $ngx_size in
+     4)
 diff -uraN nginx-1.0.11.orig/auto/unix nginx-1.0.11/auto/unix
 --- nginx-1.0.11.orig/auto/unix	2011-12-14 07:34:16.000000000 =
-0600
 +++ nginx-1.0.11/auto/unix	2011-12-27 13:56:42.327370060 -0600
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb =
b/meta-webserver/recipes-httpd/nginx/nginx_1.9.5.bb
similarity index 94%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.9.5.bb
index 27e4749..a251523 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.9.5.bb
@@ -6,7 +6,7 @@ concurrency, performance and low memory usage."
=20
 HOMEPAGE =3D "http://nginx.org/"
 LICENSE =3D "BSD-2-Clause"
-LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D917bfdf005ffb6fd025550414ff05a9f"
+LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D3845852aedfa8d6d7765f55d06cc3ebd"
 SECTION =3D "net"
=20
 DEPENDS =3D "libpcre gzip openssl"
@@ -19,8 +19,8 @@ SRC_URI =3D " \
 	file://nginx-volatile.conf \
 	file://nginx.service \
 "
-SRC_URI[md5sum] =3D "5dfaba1cbeae9087f3949860a02caa9f"
-SRC_URI[sha256sum] =3D =
"7c989a58e5408c9593da0bebcd0e4ffc3d892d1316ba5042ddb0be5b0b4102b9"
+SRC_URI[md5sum] =3D "2562320f1535e3e31d165e337ae94f21"
+SRC_URI[sha256sum] =3D =
"48e2787a6b245277e37cb7c5a31b1549a0bbacf288aa4731baacf9eaacdb481b"
=20
 inherit update-rc.d useradd
=20
--=20
1.9.1


--=20
Jens Rehsack - rehsack@gmail.com


