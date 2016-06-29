Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id A997F60043;
	Wed, 29 Jun 2016 19:02:36 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id a2so6002916lfe.3;
	Wed, 29 Jun 2016 12:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zLdWo/hRMrLDqJSZC9Te1SXrgeMEQe6Gt1oH2PmfGTQ=;
	b=CFIOJ4KMi344I/Dtz55dQhwWU73Zqgxezc6GghAgGS87WeGC+g4DrwSSBUARU9keEz
	gMqLpdMsWN6NcwyLpFC1LKnuns1VVnSaNX7fsWUjUZ4HKWBtZ8979SV/jb2FLs2rW/zC
	yocF4HXRXbl+OwEOVrYsCAlZfeV5srSctkhJ5yOh7qwU3GV61fdiYeyvoUUAEby/PVTC
	p2ZmT9885dhpltLXDDKWtj6yDEaHUCU7HC5qaJDYu5l5F1lYbtRLExR5mL/cbVa/e1HJ
	2lzMNAVALslTVckih8HMyEr0EJ1IcUa6z6IJY6yOUBnYsAY2PK6CI6ytYuqUXL1oCYGd
	LNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zLdWo/hRMrLDqJSZC9Te1SXrgeMEQe6Gt1oH2PmfGTQ=;
	b=UrvaCSPZMl26o4LzmCiTCwjUIqLEkvIB7ShAmKJZgubHOwP8CVK34P+QGlG+18Goa/
	tJGj3JPf52YoaeyN+DS3vP7P8sXHfAyulH1OONMm6EAFOi504oW6LjFPkZcFvG7+XW+E
	Ktzi4I/26p7MdbqeMArFiCyE80dsAn6VAfb5vxvxvjTF8uaDnZVHjPTxVPEFEZMG9mIZ
	bopkJGyzTewMvgNZ7nYlXo68J9QomImJqsmls/VxOmip2++w2jREUcdhhZieU7Ir2Sno
	QjTl0EYty3RgqzizjdwNc2xC3YveeoCWiZboW5S1A4PiiRzPl9w+JqgTpLTf2gQxwccn
	9OKA==
X-Gm-Message-State: ALyK8tL0nf+XwHmxpCPh/bXf4uK1BGHVOJvBHztoO+fzZS+LeWkW5BSJO5pJMWRm/7Z0e732GNeGh1djwrz71g==
X-Received: by 10.25.215.11 with SMTP id o11mr3833538lfg.132.1467226955975;
	Wed, 29 Jun 2016 12:02:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.160.133 with HTTP; Wed, 29 Jun 2016 12:02:35 -0700 (PDT)
In-Reply-To: <20160629183638.306C4503CA@opal.openembedded.org>
References: <20160629183624.878.59989@opal.openembedded.org>
	<20160629183638.306C4503CA@opal.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 29 Jun 2016 21:02:35 +0200
Message-ID: <CA+chaQd_x4-zuMVxUS_BgSmn77Cs+g-8cEZHujuKqafzZ6BLuA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Joshua Lock <joshua.g.lock@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 58/94: openssl: prevent ABI break from earlier krogoth releases
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
X-List-Received-Date: Wed, 29 Jun 2016 19:02:38 -0000
Content-Type: text/plain; charset=UTF-8

Please revert this, this is actually breaking the ABI compatibility against
Krogoth release as reported in pull request.

On Wed, Jun 29, 2016 at 8:37 PM, <git@git.openembedded.org> wrote:

> rpurdie pushed a commit to branch krogoth
> in repository openembedded-core.
>
> commit 4d1cb0646eafca44fae5321f48c6114a32fbf164
> Author: Joshua Lock <joshua.g.lock@intel.com>
> AuthorDate: Thu May 12 13:06:34 2016 +0100
>
>     openssl: prevent ABI break from earlier krogoth releases
>
>     The backported upgrade to 1.0.2h included an updated GNU LD
>     version-script which results in an ABI change. In order to try and
>     respect ABI for existing binaries built against fido this commit
>     partially reverts the version-script to maintain the existing ABI
>     and instead only add the new symbols required by 1.0.2h.
>
>     Suggested-by: Martin Jansa <martin.jansa@gmail.com>
>     (From OE-Core rev: 480db6be99f9a53d8657b31b846f0079ee1a124f)
>
>     Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>     Signed-off-by: Armin Kuster <akuster@mvista.com>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../openssl/debian1.0.2/version-script.patch       | 31
> +++++++++++++++-------
>  1 file changed, 22 insertions(+), 9 deletions(-)
>
> diff --git
> a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
> b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
> index 29f11a2..f53efdb 100644
> ---
> a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
> +++
> b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
> @@ -15,8 +15,8 @@ Index:
> openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld
>  ===================================================================
>  --- /dev/null  1970-01-01 00:00:00.000000000 +0000
>  +++ openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld 2014-02-24
> 22:19:08.601827266 +0100
> -@@ -0,0 +1,4608 @@
> -+OPENSSL_1.0.2d {
> +@@ -0,0 +1,4621 @@
> ++OPENSSL_1.0.0 {
>  +      global:
>  +              BIO_f_ssl;
>  +              BIO_new_buffer_ssl_connect;
> @@ -4314,6 +4314,14 @@ Index:
> openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld
>  +              CRYPTO_cbc128_decrypt;
>  +              CRYPTO_cfb128_encrypt;
>  +              CRYPTO_cfb128_8_encrypt;
> ++
> ++      local:
> ++              *;
> ++};
> ++
> ++
> ++OPENSSL_1.0.1 {
> ++      global:
>  +              SSL_renegotiate_abbreviated;
>  +              TLSv1_1_method;
>  +              TLSv1_1_client_method;
> @@ -4475,7 +4483,15 @@ Index:
> openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld
>  +              BIO_s_datagram_sctp;
>  +              BIO_dgram_is_sctp;
>  +              BIO_dgram_sctp_notification_cb;
> ++} OPENSSL_1.0.0;
> ++
> ++OPENSSL_1.0.1d {
> ++      global:
>  +              CRYPTO_memcmp;
> ++} OPENSSL_1.0.1;
> ++
> ++OPENSSL_1.0.2 {
> ++      global:
>  +              SSL_CTX_set_alpn_protos;
>  +              SSL_set_alpn_protos;
>  +              SSL_CTX_set_alpn_select_cb;
> @@ -4613,23 +4629,20 @@ Index:
> openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld
>  +              BUF_strnlen;
>  +              sk_deep_copy;
>  +              SSL_test_functions;
> -+
> -+      local:
> -+              *;
> -+};
> ++} OPENSSL_1.0.1d;
>  +
>  +OPENSSL_1.0.2g {
>  +       global:
>  +               SRP_VBASE_get1_by_user;
>  +               SRP_user_pwd_free;
> -+} OPENSSL_1.0.2d;
> ++} OPENSSL_1.0.2;
>  +
>  Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/openssl.ld
>  ===================================================================
>  --- /dev/null  1970-01-01 00:00:00.000000000 +0000
>  +++ openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/openssl.ld
> 2014-02-24 21:02:30.000000000 +0100
>  @@ -0,0 +1,10 @@
> -+OPENSSL_1.0.2 {
> ++OPENSSL_1.0.0 {
>  +      global:
>  +              bind_engine;
>  +              v_check;
> @@ -4644,7 +4657,7 @@ Index:
> openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/ccgost/openssl.ld
>  --- /dev/null  1970-01-01 00:00:00.000000000 +0000
>  +++
> openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/ccgost/openssl.ld
> 2014-02-24 21:02:30.000000000 +0100
>  @@ -0,0 +1,10 @@
> -+OPENSSL_1.0.2 {
> ++OPENSSL_1.0.0 {
>  +      global:
>  +              bind_engine;
>  +              v_check;
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

