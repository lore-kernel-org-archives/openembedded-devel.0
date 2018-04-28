Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 05B9A60939
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Apr 2018 16:54:27 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id i6-v6so3660444pgv.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Apr 2018 09:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=eCyYJIuLGwnLES0B8yCG4WDCrV62FCjiKUeQmLKr/uQ=;
	b=mPtxFbTJNWgndrIyMRcKu/uMn0AlI6rts0j0Qeqz3jYJlHI4694KNcnwBLiK0UaHzB
	N/JzKmVjn0VS+LyBiOpdJSujVhnjeE8VdYWiV/pumzoVxhZGs+S8mOgEn3UKswprPpx1
	xfP4/quUIgqm8xjLq3YeQydqQmXEeN5n5EVlBnpseUSSlTF6salO8ykDW/PlOPhPMcey
	kppH6zXHScPiuoSZ2rwHwzTwE63KBh0RXeqibmiQObf3SC2YR0+5oi3/UuPPuSxMJF/1
	TUy7/fcVOCuxkNmsgZjEbnFRvWfFSykJgmAgCm1x+9WyKSnpq4CJWMGxf5i5l1D9Yyj8
	c2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=eCyYJIuLGwnLES0B8yCG4WDCrV62FCjiKUeQmLKr/uQ=;
	b=b9IxdrR7J0pkD5GrwMibo6D4Tw+BuQNlh+U8bpc0fZvmGRB40o2NgBxTJ19S8Chv6f
	2Sx1nzfLpw6mGKDkRdojdDsP3FTbumKyz8gsJd9XOEDJ6KSj+Ijoq1Mtl1TxJ+H637UC
	2i6KXlR+an0hYcPEJLiGNP+mWwnnsgTruJAABvrfbu+HGs792wuKVBpJmzbt9KFwAxNh
	aZ8/h1rPw0ZQ028umReVC9mbzc6dTcQ8ihFwKtpjbyCbb98uG+pAf7oii4hzH6cwlAn1
	MkR4Q7EjIrnEKbgsT7O1gyXj8tmLqMxlxWq8jG6XE2ToJwMw0vQcmjmcWK2QSfF1Jf1u
	cUUg==
X-Gm-Message-State: ALQs6tA00hB9ZSW2AyoIlXkAQ9u5rA7X7jqIcc7KYGFjmpvngs6jADXv
	iaWST32fHOWGk5FPLQFX36Q=
X-Google-Smtp-Source: AB8JxZrUHK7YQvWIDOx2VznXYIVXF5dKHRpBpyQzK7pAMTdd1WVHnePhd7+4nReZpRdiJyjV5ibdYw==
X-Received: by 2002:a65:5ac2:: with SMTP id
	d2-v6mr5701701pgt.352.1524934468408; 
	Sat, 28 Apr 2018 09:54:28 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:e849:397b:8351:da78?
	([2601:202:4000:1184:e849:397b:8351:da78])
	by smtp.gmail.com with ESMTPSA id
	r68sm9116753pfi.174.2018.04.28.09.54.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 28 Apr 2018 09:54:27 -0700 (PDT)
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20180419171207.5020-1-costamagnagianfranco@yahoo.it>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <238486bb-884b-ecce-e00d-35ce10e63534@gmail.com>
Date: Sat, 28 Apr 2018 09:54:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180419171207.5020-1-costamagnagianfranco@yahoo.it>
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Subject: Re: [meta-oe][PATCH 1/2] websocketpp: add new recipe based on Debian packaging
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Apr 2018 16:54:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 04/19/2018 10:12 AM, Gianfranco Costamagna wrote:
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
> ---
>  .../websocketpp-0.7.0/0001-Fix-issue-599.patch     |  31 ++
>  .../4cab5e5c0c5f19fcee7d37b4a38b156d63a150d4.patch | 155 ++++++
>  .../9ddb300d874a30db35e3ad58f188944bef0bf31b.patch | 600 +++++++++++++++++++++
>  .../websocketpp-0.7.0/disable-tests.patch          |  51 ++
>  .../websocketpp/websocketpp_0.7.0.bb               |  21 +
>  5 files changed, 858 insertions(+)
>  create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.7.0/0001-Fix-issue-599.patch
>  create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.7.0/4cab5e5c0c5f19fcee7d37b4a38b156d63a150d4.patch
>  create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.7.0/9ddb300d874a30db35e3ad58f188944bef0bf31b.patch
>  create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.7.0/disable-tests.patch
>  create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp_0.7.0.bb

This recipe should be in the meta-networking layer.

The patches should follow the
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

- armin
>
> diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.7.0/0001-Fix-issue-599.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.7.0/0001-Fix-issue-599.patch
> new file mode 100644
> index 000000000..2a9ea74cd
> --- /dev/null
> +++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.7.0/0001-Fix-issue-599.patch
> @@ -0,0 +1,31 @@
> +From 1dd07113f2a7489444a8990a95be42e035f8e9df Mon Sep 17 00:00:00 2001
> +From: Kurt Roeckx <kroeckx@debian.org>
> +Date: Tue, 1 Nov 2016 12:57:35 +0100
> +Subject: [PATCH] Fix issue #599
> +Forwarded: https://github.com/zaphoyd/websocketpp/pull/600
> +
> +---
> + websocketpp/transport/asio/security/tls.hpp | 4 ----
> + 1 file changed, 4 deletions(-)
> +
> +diff --git a/websocketpp/transport/asio/security/tls.hpp b/websocketpp/transport/asio/security/tls.hpp
> +index 7b32db8..a8aafec 100644
> +--- a/websocketpp/transport/asio/security/tls.hpp
> ++++ b/websocketpp/transport/asio/security/tls.hpp
> +@@ -355,13 +355,9 @@ protected:
> +     template <typename ErrorCodeType>
> +     lib::error_code translate_ec(ErrorCodeType ec) {
> +         if (ec.category() == lib::asio::error::get_ssl_category()) {
> +-            if (ERR_GET_REASON(ec.value()) == SSL_R_SHORT_READ) {
> +-                return make_error_code(transport::error::tls_short_read);
> +-            } else {
> +                 // We know it is a TLS related error, but otherwise don't know
> +                 // more. Pass through as TLS generic.
> +                 return make_error_code(transport::error::tls_error);
> +-            }
> +         } else {
> +             // We don't know any more information about this error so pass
> +             // through
> +-- 
> +2.7.4
> +
> diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.7.0/4cab5e5c0c5f19fcee7d37b4a38b156d63a150d4.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.7.0/4cab5e5c0c5f19fcee7d37b4a38b156d63a150d4.patch
> new file mode 100644
> index 000000000..530c960ce
> --- /dev/null
> +++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.7.0/4cab5e5c0c5f19fcee7d37b4a38b156d63a150d4.patch
> @@ -0,0 +1,155 @@
> +From 4cab5e5c0c5f19fcee7d37b4a38b156d63a150d4 Mon Sep 17 00:00:00 2001
> +From: Peter Thorson <git@zaphoyd.com>
> +Date: Sun, 11 Jun 2017 16:13:25 -0500
> +Subject: [PATCH] minor adjustments to recent extension negotiation related
> + fixes, refactor a bit more extension negotiation code to be simpler
> +
> +---
> + websocketpp/impl/connection_impl.hpp |  6 +--
> + websocketpp/processors/hybi13.hpp    | 92 ++++++++++++++++++------------------
> + 2 files changed, 49 insertions(+), 49 deletions(-)
> +
> +Index: websocketpp-0.7.0/websocketpp/impl/connection_impl.hpp
> +===================================================================
> +--- websocketpp-0.7.0.orig/websocketpp/impl/connection_impl.hpp
> ++++ websocketpp-0.7.0/websocketpp/impl/connection_impl.hpp
> +@@ -1222,17 +1222,17 @@
> +     std::pair<lib::error_code,std::string> neg_results;
> +     neg_results = m_processor->negotiate_extensions(m_request);
> + 
> +-    if (neg_results.first == error::make_error_code(error::extension_parse_error)) {
> ++    if (neg_results.first == processor::error::make_error_code(processor::error::extension_parse_error)) {
> +         // There was a fatal error in extension parsing that should result in
> +         // a failed connection attempt.
> +-        m_alog.write(log::alevel::info, "Bad request: " + neg_results.first.message());
> ++        m_elog.write(log::elevel::info, "Bad request: " + neg_results.first.message());
> +         m_response.set_status(http::status_code::bad_request);
> +         return neg_results.first;
> +     } else if (neg_results.first) {
> +         // There was a fatal error in extension processing that is probably our
> +         // fault. Consider extension negotiation to have failed and continue as
> +         // if extensions were not supported
> +-        m_alog.write(log::alevel::info, 
> ++        m_elog.write(log::elevel::info, 
> +             "Extension negotiation failed: " + neg_results.first.message());
> +     } else {
> +         // extension negotiation succeeded, set response header accordingly
> +Index: websocketpp-0.7.0/websocketpp/processors/hybi13.hpp
> +===================================================================
> +--- websocketpp-0.7.0.orig/websocketpp/processors/hybi13.hpp
> ++++ websocketpp-0.7.0/websocketpp/processors/hybi13.hpp
> +@@ -97,11 +97,6 @@
> +     /**
> +      * This exists mostly because the code for requests and responses is
> +      * identical and I can't have virtual template methods.
> +-     *
> +-     * NOTE: this method makes assumptions that the permessage-deflate
> +-     * extension is the only one supported. If additional extensions are
> +-     * ever supported it should be reviewed carefully. Most cases where
> +-     * that assumption is made are explicitly noted.
> +      */
> +     template <typename header_type>
> +     err_str_pair negotiate_extensions_helper(header_type const & header) {
> +@@ -130,55 +125,60 @@
> + 
> +         http::parameter_list::const_iterator it;
> + 
> ++        // look through the list of extension requests to find the first
> ++        // one that we can accept.
> +         if (m_permessage_deflate.is_implemented()) {
> +             err_str_pair neg_ret;
> +             for (it = p.begin(); it != p.end(); ++it) {
> +-                // look through each extension, if the key is permessage-deflate
> +-                if (it->first == "permessage-deflate") {
> +-                    // if we have already successfully negotiated this extension
> +-                    // then skip any other requests to negotiate the same one
> +-                    // with different parameters 
> +-                    if (m_permessage_deflate.is_enabled()) {
> +-                        continue;
> +-                    }
> +-                    
> +-                    
> +-                    neg_ret = m_permessage_deflate.negotiate(it->second);
> +-
> +-                    if (neg_ret.first) {
> +-                        // Figure out if this is an error that should halt all
> +-                        // extension negotiations or simply cause negotiation of
> +-                        // this specific extension to fail.
> +-                        //std::cout << "permessage-compress negotiation failed: "
> +-                        //          << neg_ret.first.message() << std::endl;
> +-                    } else {
> +-                        // Note: this list will need commas if WebSocket++ ever
> +-                        // supports more than one extension
> +-                        
> +-                        // Actually try to initialize the extension before we
> +-                        // deem negotiation complete
> +-                        ret.first = m_permessage_deflate.init(base::m_server);
> +-                        if (!ret.first) {
> +-
> +-                            // TODO: support multiple extensions.
> +-                            // right now, because there is only one extension 
> +-                            // supported, it failing to negotiate means we are
> +-                            // done with all negotiating. In the future if more
> +-                            // extensions are supported a better solution will
> +-                            // be needed here.
> +-                            break;
> +-                        } else {
> +-                            ret.second += neg_ret.second;
> +-
> +-                            // continue looking for more extensions
> +-                            continue;
> +-                        }
> +-                        
> +-                    }
> ++                // not a permessage-deflate extension request, ignore
> ++                if (it->first != "permessage-deflate") {
> ++                    continue;
> ++                }
> ++
> ++                // if we have already successfully negotiated this extension
> ++                // then skip any other requests to negotiate the same one
> ++                // with different parameters 
> ++                if (m_permessage_deflate.is_enabled()) {
> ++                    continue;
> ++                }
> ++                
> ++                // attempt to negotiate this offer
> ++                neg_ret = m_permessage_deflate.negotiate(it->second);
> ++
> ++                if (neg_ret.first) {
> ++                    // negotiation offer failed. Do nothing. We will continue
> ++                    // searching for a permessage-deflate config that succeeds
> ++                    continue;
> ++                }
> ++
> ++                // Negotiation tentatively succeeded
> ++
> ++                // Actually try to initialize the extension before we
> ++                // deem negotiation complete
> ++                lib::error_code ec = m_permessage_deflate.init(base::m_server);
> ++
> ++                if (ec) {
> ++                    // Negotiation succeeded but initialization failed this is 
> ++                    // an error that should stop negotiation of permessage 
> ++                    // deflate. Return the reason for the init failure
> ++
> ++                    ret.first = ec;
> ++                    break;
> ++                } else {
> ++                    // Successfully initialized, push the negotiated response into
> ++                    // the reply and stop looking for additional permessage-deflate
> ++                    // extensions
> ++                    ret.second += neg_ret.second;
> ++                    break;
> +                 }
> +             }
> +         }
> + 
> ++        // support for future extensions would go here. Should check the value of 
> ++        // ret.first before continuing. Might need to consider whether failure of
> ++        // negotiation of an earlier extension should stop negotiation of subsequent
> ++        // ones
> ++
> +         return ret;
> +     }
> + 
> diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.7.0/9ddb300d874a30db35e3ad58f188944bef0bf31b.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.7.0/9ddb300d874a30db35e3ad58f188944bef0bf31b.patch
> new file mode 100644
> index 000000000..94bfeb2fd
> --- /dev/null
> +++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.7.0/9ddb300d874a30db35e3ad58f188944bef0bf31b.patch
> @@ -0,0 +1,600 @@
> +## Description: add some description
> +## Origin/Author: add some origin or author
> +## Bug: bug URL
> +From 9ddb300d874a30db35e3ad58f188944bef0bf31b Mon Sep 17 00:00:00 2001
> +From: Peter Thorson <git@zaphoyd.com>
> +Date: Sun, 11 Jun 2017 15:24:43 -0500
> +Subject: [PATCH] Update permessage-deflate support to reflect that zlib
> + doesn't support a 256 bit window. Improve extension negotiation error
> + checking and documentation. fixes #596 fixes #653
> +
> +---
> + changelog.md                                       |   8 ++
> + test/extension/permessage_deflate.cpp              | 153 +++++++++++++++++----
> + .../extensions/permessage_deflate/enabled.hpp      |  94 ++++++++++---
> + websocketpp/impl/connection_impl.hpp               |  10 +-
> + websocketpp/processors/hybi13.hpp                  |  28 +++-
> + 5 files changed, 247 insertions(+), 46 deletions(-)
> +
> +diff --git a/changelog.md b/changelog.md
> +index bba753cb..de98edd2 100644
> +#--- a/changelog.md
> +#+++ b/changelog.md
> +#@@ -17,6 +17,14 @@ HEAD
> +# - Compatibility: Update `telemetry_client` to use a slightly more cross platform
> +#   method of sleeping. Should work on windows now. Thank you Meir Yanovich for
> +#   reporting.
> +#+- Compatibility: Updated permessage-deflate support to reflect that the zlib
> +#+  library does not actually support a sliding window size of 256 bits. 
> +#+  WebSocket++ will no longer negotiate 256 bit deflate windows. If the user
> +#+  of the library tries to request a 256 bit window a 512 bit window will be
> +#+  specified instead (This was the previous behavior). #596 #653 Thank you 
> +#+  Vinnie Falco and Gianfranco Costamagna for reporting.
> +#+- Compatibility: Better error handling and logging in cases where extension
> +#+  requests parse correctly but negotiation fails. 
> +# - Bug: Store loggers in shared pointers to avoid crashes related to connections
> +#   trying to write logs entries after their respective endpoint has been
> +#   deallocated. Thank you Thalhammer for reporting and Jupp Müller for the 
> +diff --git a/test/extension/permessage_deflate.cpp b/test/extension/permessage_deflate.cpp
> +index 4cd3e7b6..805afcc3 100644
> +--- a/test/extension/permessage_deflate.cpp
> ++++ b/test/extension/permessage_deflate.cpp
> +@@ -186,15 +186,22 @@ BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_invalid ) {
> + 
> + BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_valid ) {
> +     ext_vars v;
> ++    
> ++    // confirm that a request for a value of 8 is interpreted as 9
> +     v.attr["server_max_window_bits"] = "8";
> ++    v.esp = v.exts.negotiate(v.attr);
> ++    BOOST_CHECK( v.exts.is_enabled() );
> ++    BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
> ++    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; server_max_window_bits=9");
> + 
> ++    v.attr["server_max_window_bits"] = "9";
> +     v.esp = v.exts.negotiate(v.attr);
> +     BOOST_CHECK( v.exts.is_enabled() );
> +     BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
> +-    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; server_max_window_bits=8");
> ++    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; server_max_window_bits=9");
> + 
> +-    v.attr["server_max_window_bits"] = "15";
> + 
> ++    v.attr["server_max_window_bits"] = "15";
> +     v.esp = v.exts.negotiate(v.attr);
> +     BOOST_CHECK( v.exts.is_enabled() );
> +     BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
> +@@ -213,7 +220,7 @@ BOOST_AUTO_TEST_CASE( invalid_set_server_max_window_bits ) {
> + 
> + BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_decline ) {
> +     ext_vars v;
> +-    v.attr["server_max_window_bits"] = "8";
> ++    v.attr["server_max_window_bits"] = "9";
> + 
> +     v.ec = v.exts.set_server_max_window_bits(15,pmd_mode::decline);
> +     v.esp = v.exts.negotiate(v.attr);
> +@@ -223,7 +230,7 @@ BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_decline ) {
> +     BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate");
> + }
> + 
> +-BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_accept ) {
> ++BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_accept_8 ) {
> +     ext_vars v;
> +     v.attr["server_max_window_bits"] = "8";
> + 
> +@@ -232,10 +239,22 @@ BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_accept ) {
> +     BOOST_CHECK( v.exts.is_enabled() );
> +     BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
> +     BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
> +-    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; server_max_window_bits=8");
> ++    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; server_max_window_bits=9");
> + }
> + 
> +-BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_largest ) {
> ++BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_accept ) {
> ++    ext_vars v;
> ++    v.attr["server_max_window_bits"] = "9";
> ++
> ++    v.ec = v.exts.set_server_max_window_bits(15,pmd_mode::accept);
> ++    v.esp = v.exts.negotiate(v.attr);
> ++    BOOST_CHECK( v.exts.is_enabled() );
> ++    BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
> ++    BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
> ++    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; server_max_window_bits=9");
> ++}
> ++
> ++BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_largest_8 ) {
> +     ext_vars v;
> +     v.attr["server_max_window_bits"] = "8";
> + 
> +@@ -244,10 +263,22 @@ BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_largest ) {
> +     BOOST_CHECK( v.exts.is_enabled() );
> +     BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
> +     BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
> +-    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; server_max_window_bits=8");
> ++    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; server_max_window_bits=9");
> + }
> + 
> +-BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_smallest ) {
> ++BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_largest ) {
> ++    ext_vars v;
> ++    v.attr["server_max_window_bits"] = "9";
> ++
> ++    v.ec = v.exts.set_server_max_window_bits(15,pmd_mode::largest);
> ++    v.esp = v.exts.negotiate(v.attr);
> ++    BOOST_CHECK( v.exts.is_enabled() );
> ++    BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
> ++    BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
> ++    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; server_max_window_bits=9");
> ++}
> ++
> ++BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_smallest_8 ) {
> +     ext_vars v;
> +     v.attr["server_max_window_bits"] = "8";
> + 
> +@@ -256,7 +287,19 @@ BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_smallest ) {
> +     BOOST_CHECK( v.exts.is_enabled() );
> +     BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
> +     BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
> +-    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; server_max_window_bits=8");
> ++    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; server_max_window_bits=9");
> ++}
> ++
> ++BOOST_AUTO_TEST_CASE( negotiate_server_max_window_bits_smallest ) {
> ++    ext_vars v;
> ++    v.attr["server_max_window_bits"] = "9";
> ++
> ++    v.ec = v.exts.set_server_max_window_bits(15,pmd_mode::smallest);
> ++    v.esp = v.exts.negotiate(v.attr);
> ++    BOOST_CHECK( v.exts.is_enabled() );
> ++    BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
> ++    BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
> ++    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; server_max_window_bits=9");
> + }
> + 
> + // Negotiate server_max_window_bits
> +@@ -292,7 +335,13 @@ BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_valid ) {
> +     v.esp = v.exts.negotiate(v.attr);
> +     BOOST_CHECK( v.exts.is_enabled() );
> +     BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
> +-    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; client_max_window_bits=8");
> ++    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; client_max_window_bits=9");
> ++
> ++    v.attr["client_max_window_bits"] = "9";
> ++    v.esp = v.exts.negotiate(v.attr);
> ++    BOOST_CHECK( v.exts.is_enabled() );
> ++    BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
> ++    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; client_max_window_bits=9");
> + 
> +     v.attr["client_max_window_bits"] = "15";
> +     v.esp = v.exts.negotiate(v.attr);
> +@@ -311,7 +360,7 @@ BOOST_AUTO_TEST_CASE( invalid_set_client_max_window_bits ) {
> +     BOOST_CHECK_EQUAL(v.ec,pmde::make_error_code(pmde::invalid_max_window_bits));
> + }
> + 
> +-BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_decline ) {
> ++BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_decline_8 ) {
> +     ext_vars v;
> +     v.attr["client_max_window_bits"] = "8";
> + 
> +@@ -323,7 +372,19 @@ BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_decline ) {
> +     BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate");
> + }
> + 
> +-BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_accept ) {
> ++BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_decline ) {
> ++    ext_vars v;
> ++    v.attr["client_max_window_bits"] = "9";
> ++
> ++    v.ec = v.exts.set_client_max_window_bits(9,pmd_mode::decline);
> ++    v.esp = v.exts.negotiate(v.attr);
> ++    BOOST_CHECK( v.exts.is_enabled() );
> ++    BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
> ++    BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
> ++    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate");
> ++}
> ++
> ++BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_accept_8 ) {
> +     ext_vars v;
> +     v.attr["client_max_window_bits"] = "8";
> + 
> +@@ -332,10 +393,22 @@ BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_accept ) {
> +     BOOST_CHECK( v.exts.is_enabled() );
> +     BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
> +     BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
> +-    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; client_max_window_bits=8");
> ++    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; client_max_window_bits=9");
> + }
> + 
> +-BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_largest ) {
> ++BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_accept ) {
> ++    ext_vars v;
> ++    v.attr["client_max_window_bits"] = "9";
> ++
> ++    v.ec = v.exts.set_client_max_window_bits(15,pmd_mode::accept);
> ++    v.esp = v.exts.negotiate(v.attr);
> ++    BOOST_CHECK( v.exts.is_enabled() );
> ++    BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
> ++    BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
> ++    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; client_max_window_bits=9");
> ++}
> ++
> ++BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_largest_8 ) {
> +     ext_vars v;
> +     v.attr["client_max_window_bits"] = "8";
> + 
> +@@ -344,10 +417,22 @@ BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_largest ) {
> +     BOOST_CHECK( v.exts.is_enabled() );
> +     BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
> +     BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
> +-    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; client_max_window_bits=8");
> ++    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; client_max_window_bits=9");
> + }
> + 
> +-BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_smallest ) {
> ++BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_largest ) {
> ++    ext_vars v;
> ++    v.attr["client_max_window_bits"] = "9";
> ++
> ++    v.ec = v.exts.set_client_max_window_bits(15,pmd_mode::largest);
> ++    v.esp = v.exts.negotiate(v.attr);
> ++    BOOST_CHECK( v.exts.is_enabled() );
> ++    BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
> ++    BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
> ++    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; client_max_window_bits=9");
> ++}
> ++
> ++BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_smallest_8 ) {
> +     ext_vars v;
> +     v.attr["client_max_window_bits"] = "8";
> + 
> +@@ -356,7 +441,19 @@ BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_smallest ) {
> +     BOOST_CHECK( v.exts.is_enabled() );
> +     BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
> +     BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
> +-    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; client_max_window_bits=8");
> ++    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; client_max_window_bits=9");
> ++}
> ++
> ++BOOST_AUTO_TEST_CASE( negotiate_client_max_window_bits_smallest ) {
> ++    ext_vars v;
> ++    v.attr["client_max_window_bits"] = "9";
> ++
> ++    v.ec = v.exts.set_client_max_window_bits(15,pmd_mode::smallest);
> ++    v.esp = v.exts.negotiate(v.attr);
> ++    BOOST_CHECK( v.exts.is_enabled() );
> ++    BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
> ++    BOOST_CHECK_EQUAL( v.esp.first, websocketpp::lib::error_code() );
> ++    BOOST_CHECK_EQUAL( v.esp.second, "permessage-deflate; client_max_window_bits=9");
> + }
> + 
> + 
> +@@ -507,7 +604,8 @@ BOOST_AUTO_TEST_CASE( compress_data ) {
> +     std::string compress_out;
> +     std::string decompress_out;
> + 
> +-    v.exts.init(true);
> ++    v.ec = v.exts.init(true);
> ++    BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
> + 
> +     v.ec = v.exts.compress(compress_in,compress_out);
> +     BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
> +@@ -520,7 +618,8 @@ BOOST_AUTO_TEST_CASE( compress_data ) {
> + BOOST_AUTO_TEST_CASE( compress_data_multiple ) {
> +     ext_vars v;
> + 
> +-    v.exts.init(true);
> ++    v.ec = v.exts.init(true);
> ++    BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
> + 
> +     for (int i = 0; i < 2; i++) {
> +         std::string compress_in = "Hello";
> +@@ -545,11 +644,12 @@ BOOST_AUTO_TEST_CASE( compress_data_large ) {
> + 
> +     websocketpp::http::attribute_list alist;
> + 
> +-    alist["server_max_window_bits"] = "8";
> +-    v.exts.set_server_max_window_bits(8,websocketpp::extensions::permessage_deflate::mode::smallest);
> ++    alist["server_max_window_bits"] = "9";
> ++    v.exts.set_server_max_window_bits(9,websocketpp::extensions::permessage_deflate::mode::smallest);
> + 
> +     v.exts.negotiate(alist);
> +-    v.exts.init(true);
> ++    v.ec = v.exts.init(true);
> ++    BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
> + 
> +     v.ec = v.exts.compress(compress_in,compress_out);
> +     BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
> +@@ -573,7 +673,8 @@ BOOST_AUTO_TEST_CASE( compress_data_no_context_takeover ) {
> +     v.exts.enable_server_no_context_takeover();
> + 
> +     v.exts.negotiate(alist);
> +-    v.exts.init(true);
> ++    v.ec = v.exts.init(true);
> ++    BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
> + 
> +     v.ec = v.exts.compress(compress_in,compress_out1);
> +     BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
> +@@ -609,7 +710,8 @@ BOOST_AUTO_TEST_CASE( compress_empty ) {
> +     std::string compress_out;
> +     std::string decompress_out;
> + 
> +-    v.exts.init(true);
> ++    v.ec = v.exts.init(true);
> ++    BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
> + 
> +     v.ec = v.exts.compress(compress_in,compress_out);
> +     BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
> +@@ -640,7 +742,8 @@ BOOST_AUTO_TEST_CASE( decompress_data ) {
> +     std::string out;
> +     std::string reference = "Hello";
> + 
> +-    v.exts.init(true);
> ++    v.ec = v.exts.init(true);
> ++    BOOST_CHECK_EQUAL( v.ec, websocketpp::lib::error_code() );
> + 
> +     v.ec = v.exts.decompress(in,11,out);
> + 
> +diff --git a/websocketpp/extensions/permessage_deflate/enabled.hpp b/websocketpp/extensions/permessage_deflate/enabled.hpp
> +index 1581f14c..f20a1b1d 100644
> +--- a/websocketpp/extensions/permessage_deflate/enabled.hpp
> ++++ b/websocketpp/extensions/permessage_deflate/enabled.hpp
> +@@ -46,7 +46,7 @@
> + namespace websocketpp {
> + namespace extensions {
> + 
> +-/// Implementation of the draft permessage-deflate WebSocket extension
> ++/// Implementation of RFC 7692, the permessage-deflate WebSocket extension
> + /**
> +  * ### permessage-deflate interface
> +  *
> +@@ -174,18 +174,30 @@ namespace websocketpp {
> + namespace extensions {
> + namespace permessage_deflate {
> + 
> +-/// Default value for server_max_window_bits as defined by draft 17
> ++/// Default value for server_max_window_bits as defined by RFC 7692
> + static uint8_t const default_server_max_window_bits = 15;
> +-/// Minimum value for server_max_window_bits as defined by draft 17
> ++/// Minimum value for server_max_window_bits as defined by RFC 7692
> ++/**
> ++ * NOTE: A value of 8 is not actually supported by zlib, the deflate
> ++ * library that WebSocket++ uses. To preserve backwards compatibility
> ++ * with RFC 7692 and previous versions of the library a value of 8
> ++ * is accepted by the library but will always be negotiated as 9.
> ++ */
> + static uint8_t const min_server_max_window_bits = 8;
> +-/// Maximum value for server_max_window_bits as defined by draft 17
> ++/// Maximum value for server_max_window_bits as defined by RFC 7692
> + static uint8_t const max_server_max_window_bits = 15;
> + 
> +-/// Default value for client_max_window_bits as defined by draft 17
> ++/// Default value for client_max_window_bits as defined by RFC 7692
> + static uint8_t const default_client_max_window_bits = 15;
> +-/// Minimum value for client_max_window_bits as defined by draft 17
> ++/// Minimum value for client_max_window_bits as defined by RFC 7692
> ++/**
> ++ * NOTE: A value of 8 is not actually supported by zlib, the deflate
> ++ * library that WebSocket++ uses. To preserve backwards compatibility
> ++ * with RFC 7692 and previous versions of the library a value of 8
> ++ * is accepted by the library but will always be negotiated as 9.
> ++ */
> + static uint8_t const min_client_max_window_bits = 8;
> +-/// Maximum value for client_max_window_bits as defined by draft 17
> ++/// Maximum value for client_max_window_bits as defined by RFC 7692
> + static uint8_t const max_client_max_window_bits = 15;
> + 
> + namespace mode {
> +@@ -372,7 +384,7 @@ class enabled {
> +     /**
> +      * The bits setting is the base 2 logarithm of the maximum window size that
> +      * the server must use to compress outgoing messages. The permitted range
> +-     * is 8 to 15 inclusive. 8 represents a 256 byte window and 15 a 32KiB
> ++     * is 9 to 15 inclusive. 9 represents a 512 byte window and 15 a 32KiB
> +      * window. The default setting is 15.
> +      *
> +      * Mode Options:
> +@@ -386,6 +398,14 @@ class enabled {
> +      * adjusted by the server. A server may unilaterally set this value without
> +      * client support.
> +      *
> ++     * NOTE: The permessage-deflate spec specifies that a value of 8 is allowed.
> ++     * Prior to version 0.8.0 a value of 8 was also allowed by this library.
> ++     * zlib, the deflate compression library that WebSocket++ uses has always
> ++     * silently adjusted a value of 8 to 9. In recent versions of zlib (1.2.9 
> ++     * and greater) a value of 8 is now explicitly rejected. WebSocket++ 0.8.0
> ++     * continues to perform the 8->9 conversion for backwards compatibility
> ++     * purposes but this should be considered deprecated functionality.
> ++     *
> +      * @param bits The size to request for the outgoing window size
> +      * @param mode The mode to use for negotiating this parameter
> +      * @return A status code
> +@@ -394,6 +414,12 @@ class enabled {
> +         if (bits < min_server_max_window_bits || bits > max_server_max_window_bits) {
> +             return error::make_error_code(error::invalid_max_window_bits);
> +         }
> ++
> ++        // See note in doc comment above about what is happening here
> ++        if (bits == 8) {
> ++            bits = 9;
> ++        }
> ++
> +         m_server_max_window_bits = bits;
> +         m_server_max_window_bits_mode = mode;
> + 
> +@@ -403,8 +429,8 @@ class enabled {
> +     /// Limit client LZ77 sliding window size
> +     /**
> +      * The bits setting is the base 2 logarithm of the window size that the
> +-     * client must use to compress outgoing messages. The permitted range is 8
> +-     * to 15 inclusive. 8 represents a 256 byte window and 15 a 32KiB window.
> ++     * client must use to compress outgoing messages. The permitted range is 9
> ++     * to 15 inclusive. 9 represents a 512 byte window and 15 a 32KiB window.
> +      * The default setting is 15.
> +      *
> +      * Mode Options:
> +@@ -417,6 +443,14 @@ class enabled {
> +      * outgoing window size unilaterally. A server may only limit the client's
> +      * window size if the remote client supports that feature.
> +      *
> ++     * NOTE: The permessage-deflate spec specifies that a value of 8 is allowed.
> ++     * Prior to version 0.8.0 a value of 8 was also allowed by this library.
> ++     * zlib, the deflate compression library that WebSocket++ uses has always
> ++     * silently adjusted a value of 8 to 9. In recent versions of zlib (1.2.9 
> ++     * and greater) a value of 8 is now explicitly rejected. WebSocket++ 0.8.0
> ++     * continues to perform the 8->9 conversion for backwards compatibility
> ++     * purposes but this should be considered deprecated functionality.
> ++     *
> +      * @param bits The size to request for the outgoing window size
> +      * @param mode The mode to use for negotiating this parameter
> +      * @return A status code
> +@@ -425,6 +459,12 @@ class enabled {
> +         if (bits < min_client_max_window_bits || bits > max_client_max_window_bits) {
> +             return error::make_error_code(error::invalid_max_window_bits);
> +         }
> ++
> ++        // See note in doc comment above about what is happening here
> ++        if (bits == 8) {
> ++            bits = 9;
> ++        }
> ++
> +         m_client_max_window_bits = bits;
> +         m_client_max_window_bits_mode = mode;
> + 
> +@@ -642,11 +682,17 @@ class enabled {
> +      * client requested that we use.
> +      *
> +      * options:
> +-     * - decline (refuse to use the attribute)
> +-     * - accept (use whatever the client says)
> +-     * - largest (use largest possible value)
> ++     * - decline (ignore value, offer our default instead)
> ++     * - accept (use the value requested by the client)
> ++     * - largest (use largest value acceptable to both)
> +      * - smallest (use smallest possible value)
> +      *
> ++     * NOTE: As a value of 8 is no longer explicitly supported by zlib but might
> ++     * be requested for negotiation by an older client/server, if the result of
> ++     * the negotiation would be to send a value of 8, a value of 9 is offered
> ++     * instead. This ensures that WebSocket++ will only ever negotiate connections
> ++     * with compression settings explicitly supported by zlib.
> ++     *
> +      * @param [in] value The value of the attribute from the offer
> +      * @param [out] ec A reference to the error code to return errors via
> +      */
> +@@ -678,6 +724,11 @@ class enabled {
> +                 ec = make_error_code(error::invalid_mode);
> +                 m_server_max_window_bits = default_server_max_window_bits;
> +         }
> ++
> ++        // See note in doc comment
> ++        if (m_server_max_window_bits == 8) {
> ++            m_server_max_window_bits = 9;
> ++        }
> +     }
> + 
> +     /// Negotiate client_max_window_bits attribute
> +@@ -687,11 +738,17 @@ class enabled {
> +      * negotiation mode.
> +      *
> +      * options:
> +-     * - decline (refuse to use the attribute)
> +-     * - accept (use whatever the client says)
> +-     * - largest (use largest possible value)
> ++     * - decline (ignore value, offer our default instead)
> ++     * - accept (use the value requested by the client)
> ++     * - largest (use largest value acceptable to both)
> +      * - smallest (use smallest possible value)
> +      *
> ++     * NOTE: As a value of 8 is no longer explicitly supported by zlib but might
> ++     * be requested for negotiation by an older client/server, if the result of
> ++     * the negotiation would be to send a value of 8, a value of 9 is offered
> ++     * instead. This ensures that WebSocket++ will only ever negotiate connections
> ++     * with compression settings explicitly supported by zlib.
> ++     *
> +      * @param [in] value The value of the attribute from the offer
> +      * @param [out] ec A reference to the error code to return errors via
> +      */
> +@@ -727,6 +784,11 @@ class enabled {
> +                 ec = make_error_code(error::invalid_mode);
> +                 m_client_max_window_bits = default_client_max_window_bits;
> +         }
> ++
> ++        // See note in doc comment
> ++        if (m_client_max_window_bits == 8) {
> ++            m_client_max_window_bits = 9;
> ++        }
> +     }
> + 
> +     bool m_enabled;
> +diff --git a/websocketpp/impl/connection_impl.hpp b/websocketpp/impl/connection_impl.hpp
> +index 105911db..ae55c338 100644
> +--- a/websocketpp/impl/connection_impl.hpp
> ++++ b/websocketpp/impl/connection_impl.hpp
> +@@ -1222,12 +1222,18 @@ lib::error_code connection<config>::process_handshake_request() {
> +     std::pair<lib::error_code,std::string> neg_results;
> +     neg_results = m_processor->negotiate_extensions(m_request);
> + 
> +-    if (neg_results.first) {
> ++    if (neg_results.first == error::make_error_code(error::extension_parse_error)) {
> +         // There was a fatal error in extension parsing that should result in
> +         // a failed connection attempt.
> +-        m_alog.write(log::alevel::devel, "Bad request: " + neg_results.first.message());
> ++        m_alog.write(log::alevel::info, "Bad request: " + neg_results.first.message());
> +         m_response.set_status(http::status_code::bad_request);
> +         return neg_results.first;
> ++    } else if (neg_results.first) {
> ++        // There was a fatal error in extension processing that is probably our
> ++        // fault. Consider extension negotiation to have failed and continue as
> ++        // if extensions were not supported
> ++        m_alog.write(log::alevel::info, 
> ++            "Extension negotiation failed: " + neg_results.first.message());
> +     } else {
> +         // extension negotiation succeeded, set response header accordingly
> +         // we don't send an empty extensions header because it breaks many
> +diff --git a/websocketpp/processors/hybi13.hpp b/websocketpp/processors/hybi13.hpp
> +index 79486654..a95bc649 100644
> +--- a/websocketpp/processors/hybi13.hpp
> ++++ b/websocketpp/processors/hybi13.hpp
> +@@ -97,6 +97,11 @@ class hybi13 : public processor<config> {
> +     /**
> +      * This exists mostly because the code for requests and responses is
> +      * identical and I can't have virtual template methods.
> ++     *
> ++     * NOTE: this method makes assumptions that the permessage-deflate
> ++     * extension is the only one supported. If additional extensions are
> ++     * ever supported it should be reviewed carefully. Most cases where
> ++     * that assumption is made are explicitly noted.
> +      */
> +     template <typename header_type>
> +     err_str_pair negotiate_extensions_helper(header_type const & header) {
> +@@ -149,9 +154,26 @@ class hybi13 : public processor<config> {
> +                     } else {
> +                         // Note: this list will need commas if WebSocket++ ever
> +                         // supports more than one extension
> +-                        ret.second += neg_ret.second;
> +-                        m_permessage_deflate.init(base::m_server);
> +-                        continue;
> ++                        
> ++                        // Actually try to initialize the extension before we
> ++                        // deem negotiation complete
> ++                        ret.first = m_permessage_deflate.init(base::m_server);
> ++                        if (!ret.first) {
> ++
> ++                            // TODO: support multiple extensions.
> ++                            // right now, because there is only one extension 
> ++                            // supported, it failing to negotiate means we are
> ++                            // done with all negotiating. In the future if more
> ++                            // extensions are supported a better solution will
> ++                            // be needed here.
> ++                            break;
> ++                        } else {
> ++                            ret.second += neg_ret.second;
> ++
> ++                            // continue looking for more extensions
> ++                            continue;
> ++                        }
> ++                        
> +                     }
> +                 }
> +             }
> diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.7.0/disable-tests.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.7.0/disable-tests.patch
> new file mode 100644
> index 000000000..342981d4d
> --- /dev/null
> +++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.7.0/disable-tests.patch
> @@ -0,0 +1,51 @@
> +Description: Disable failing test_transport_asio_timers.
> +Because of "address already in use" error
> +/«PKGBUILDDIR»/test/transport/asio/timers.cpp(129): error in "tls_handshake_timeout": check ec == make_error_code(tls_handshake_timeout) failed [websocketpp.transport.asio.socket:8 != websocketpp.transport.asio.socket:5]
> +Author: Gianfranco Costamagna <locutusofborg@debian.org>
> +
> +--- websocketpp-0.7.0.orig/test/transport/CMakeLists.txt
> ++++ websocketpp-0.7.0/test/transport/CMakeLists.txt
> +@@ -1,24 +1,24 @@
> + if (OPENSSL_FOUND)
> + 
> +-# Test transport integration
> +-file (GLOB SOURCE integration.cpp)
> +-
> +-init_target (test_transport)
> +-build_test (${TARGET_NAME} ${SOURCE})
> +-link_boost ()
> +-link_openssl()
> +-final_target ()
> +-set_target_properties(${TARGET_NAME} PROPERTIES FOLDER "test")
> +-
> +-# Test transport asio timers
> +-file (GLOB SOURCE asio/timers.cpp)
> +-
> +-init_target (test_transport_asio_timers)
> +-build_test (${TARGET_NAME} ${SOURCE})
> +-link_boost ()
> +-link_openssl()
> +-final_target ()
> +-set_target_properties(${TARGET_NAME} PROPERTIES FOLDER "test")
> ++## Test transport integration
> ++#file (GLOB SOURCE integration.cpp)
> ++#
> ++#init_target (test_transport)
> ++#build_test (${TARGET_NAME} ${SOURCE})
> ++#link_boost ()
> ++#link_openssl()
> ++#final_target ()
> ++#set_target_properties(${TARGET_NAME} PROPERTIES FOLDER "test")
> ++#
> ++## Test transport asio timers
> ++#file (GLOB SOURCE asio/timers.cpp)
> ++#
> ++#init_target (test_transport_asio_timers)
> ++#build_test (${TARGET_NAME} ${SOURCE})
> ++#link_boost ()
> ++#link_openssl()
> ++#final_target ()
> ++#set_target_properties(${TARGET_NAME} PROPERTIES FOLDER "test")
> + 
> + # Test transport asio security
> + file (GLOB SOURCE asio/security.cpp)
> diff --git a/meta-oe/recipes-support/websocketpp/websocketpp_0.7.0.bb b/meta-oe/recipes-support/websocketpp/websocketpp_0.7.0.bb
> new file mode 100644
> index 000000000..65fc974b6
> --- /dev/null
> +++ b/meta-oe/recipes-support/websocketpp/websocketpp_0.7.0.bb
> @@ -0,0 +1,21 @@
> +SUMMARY = "C++/Boost Asio based websocket client/server library."
> +SECTION = "libs/network"
> +HOMEPAGE = "https://github.com/zaphoyd/websocketpp"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://${S}/COPYING;md5=4d168d763c111f4ffc62249870e4e0ea"
> +DEPENDS = "openssl boost zlib"
> +
> +SRC_URI = "git://github.com/zaphoyd/websocketpp.git;protocol=https;branch=master"
> +
> +# tag 0.7.0
> +SRCREV= "378437aecdcb1dfe62096ffd5d944bf1f640ccc3"
> +
> +SRC_URI += "file://0001-Fix-issue-599.patch \
> +            file://9ddb300d874a30db35e3ad58f188944bef0bf31b.patch \
> +            file://4cab5e5c0c5f19fcee7d37b4a38b156d63a150d4.patch \
> +            file://disable-tests.patch \
> + "
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake


