Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 020996079E;
	Tue,  9 Jan 2018 10:09:16 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id g21so7751270wrb.13;
	Tue, 09 Jan 2018 02:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=L6IAblIeCzolS0+JPgAj/T5sdaayuBybCmAbNNuj27Y=;
	b=N3oINpO4IE1eRWiyQiK+6gqZWlT6wjno97uMZnOlFcn3wYuzxEUbRoR7FK2lg+i2lD
	vyJNU+2oIT2nlVPUdsRhN0JoY0NlZ7qu+mbYx+ouyZYmOoNQB/JYwUkAFADAV17AiNA/
	BL72SfyepKrAMTOvxbtNBu4bUqqg6LZ+BZfCenpbo592V2ftp7bxHp0F8Za5od0J2Tyg
	y3JdiK7eoqF7dcxipodcU83IC3Mq1dh0C98KjhrPZJN59bGrrjgMCM27AtWGwfLbc4Jg
	jeB+dCD4MvDhyfZEGr9PLpT2FMXmiOMSWOPjZRlrkv+hPtcXHz64EOgcHe9HuF4SmqpZ
	vB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=L6IAblIeCzolS0+JPgAj/T5sdaayuBybCmAbNNuj27Y=;
	b=HZzFWmRzHeJRUr919ZnSDO5DKbRDNaVZm+9s0wcHQoflpFOHK1RE10G0yFPFczm4i7
	y3t6aPkxofB4GQPlgh0o4GfofCbeoOKD9/NStwscRCeTZ3jfXULfKArunMukCOqGGZh1
	XJZv8fOaIEUsAFAPrcX/b+3uJ2S7nIDPMK8BfmG1ltDkqzDEt08+6PXYfE9CNk5ZdCkM
	3lUnLai0TiDfe7+06LflaLhUTixW6+jWBeZv4WmhleWse4RSZyDvIF+dccLYO1zoT8PH
	4i69NZSPKTnlKqMRg4G/8OXsDHMq4MLl02bKmEZrM/T2LOu/E6OGXr8IIz7JdsiIo6Ag
	iM7w==
X-Gm-Message-State: AKGB3mKogXCWMOSI3Er2oOIArAq6LClvAQXqy9hQEYa7JvIU7aWZ2DEB
	9KRu2w1qRtxQnV2ZxujpeZw7gWNpJU7Si7NnZ3Cg9w==
X-Google-Smtp-Source: ACJfBov4gd38ZsQu99YrLt6HOyk5IfcMNoz8CY5pwY6OK6EVXE0fQNANMXpJDL9H9oiUQ3ypHXW+bGz286H9ZpdBQ9M=
X-Received: by 10.223.192.65 with SMTP id c1mr13408574wrf.58.1515492557382;
	Tue, 09 Jan 2018 02:09:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.122.19 with HTTP; Tue, 9 Jan 2018 02:09:16 -0800 (PST)
In-Reply-To: <20180108194035.90F04235655@git.openembedded.org>
References: <151544043453.12163.16714961581818540386@git.openembedded.org>
	<20180108194035.90F04235655@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 9 Jan 2018 11:09:16 +0100
Message-ID: <CA+chaQc741fuTYdVLg8YaBCuYnGnJ4xrGMdj90qvZQBbZbkN2A@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Jackie Huang <jackie.huang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [meta-openembedded] 09/35: freediameter: add new recipe
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
X-List-Received-Date: Tue, 09 Jan 2018 10:09:17 -0000
Content-Type: text/plain; charset="UTF-8"

It causes new QA warnings/errors:


ERROR: QA Issue: freediameter rdepends on kernel-module-ipip, but it isn't
a build dependency? [build-deps]
ERROR: QA Issue: freediameter rdepends on kernel-module-sctp, but it isn't
a build dependency? [build-deps]
ERROR: QA Issue: freediameter rdepends on kernel-module-tipc, but it isn't
a build dependency? [build-deps]
ERROR: QA Issue: freediameter rdepends on kernel-module-udp-tunnel, but it
isn't a build dependency? [build-deps]

On Mon, Jan 8, 2018 at 8:40 PM, <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> joe_macdonald pushed a commit to branch master
> in repository meta-openembedded.
>
> commit ba8543aeee6b97b31e66c261563a197cd0be87e3
> Author: Jackie Huang <jackie.huang@windriver.com>
> AuthorDate: Wed Nov 1 09:23:39 2017 -0400
>
>     freediameter: add new recipe
>
>     freeDiameter is an open source Diameter protocol
>     implementation. It provides an extensible platform
>     for deploying a Diameter network for your Authentication,
>     Authorization and Accounting needs.
>
>     Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>     Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
>     Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---
>  ...murhash-algorithm-with-Robert-Jenkin-s-ha.patch | 223
> ++++++++++++++++++
>  .../freediameter/files/freeDiameter.conf           | 250
> +++++++++++++++++++++
>  .../freediameter/files/freediameter.init           |  72 ++++++
>  .../freediameter/files/freediameter.service        |  11 +
>  .../freediameter/files/install_test.patch          |  22 ++
>  .../freediameter/files/pass-ptest-env.patch        |  72 ++++++
>  .../recipes-protocols/freediameter/files/run-ptest |  11 +
>  .../freediameter/freediameter_1.2.1.bb             | 136 +++++++++++
>  8 files changed, 797 insertions(+)
>
> diff --git a/meta-networking/recipes-protocols/freediameter/files/
> Replace-murmurhash-algorithm-with-Robert-Jenkin-s-ha.patch
> b/meta-networking/recipes-protocols/freediameter/files/
> Replace-murmurhash-algorithm-with-Robert-Jenkin-s-ha.patch
> new file mode 100644
> index 0000000..71a5a1a
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/freediameter/files/
> Replace-murmurhash-algorithm-with-Robert-Jenkin-s-ha.patch
> @@ -0,0 +1,223 @@
> +Replace murmurhash algorithm with Robert Jenkin's hash algorithm
> +
> +Upstream-Status: Pending
> +
> +From test result, murmurhash algorithm does not work in big endian
> +processor, so replace it with Robert Jenkin's hash which has worked
> +in linux kernel for many years and has more adaptability.
> +
> +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> +---
> + libfdproto/ostr.c |  192 +++++++++++++++++++++---------
> -----------------------
> + 1 file changed, 74 insertions(+), 118 deletions(-)
> +
> +diff --git a/libfdproto/ostr.c b/libfdproto/ostr.c
> +index 8f29b48..ce1f4dd 100644
> +--- a/libfdproto/ostr.c
> ++++ b/libfdproto/ostr.c
> +@@ -430,128 +430,84 @@ after_proto:
> +
> +
> + /***********************************************************
> *********************************************/
> +-/* Hash function -- credits to Austin Appleby, thank you ^^ */
> +-/* See http://murmurhash.googlepages.com for more information on this
> function */
> +-
> +-/* the strings are NOT always aligned properly (ex: received in RADIUS
> message), so we use the aligned MurmurHash2 function as needed */
> +-#define _HASH_MIX(h,k,m) { k *= m; k ^= k >> r; k *= m; h *= m; h ^= k; }
> +-uint32_t fd_os_hash ( uint8_t * string, size_t len )
> ++/*
> ++ * Robert Jenkin's hash function.
> ++ * http://burtleburtle.net/bob/hash/evahash.html
> ++ * This is in the public domain.
> ++ */
> ++#define mix(a, b, c)                                          \
> ++      do {                                                    \
> ++              a = a - b;  a = a - c;  a = a ^ (c >> 13);      \
> ++              b = b - c;  b = b - a;  b = b ^ (a << 8);       \
> ++              c = c - a;  c = c - b;  c = c ^ (b >> 13);      \
> ++              a = a - b;  a = a - c;  a = a ^ (c >> 12);      \
> ++              b = b - c;  b = b - a;  b = b ^ (a << 16);      \
> ++              c = c - a;  c = c - b;  c = c ^ (b >> 5);       \
> ++              a = a - b;  a = a - c;  a = a ^ (c >> 3);       \
> ++              b = b - c;  b = b - a;  b = b ^ (a << 10);      \
> ++              c = c - a;  c = c - b;  c = c ^ (b >> 15);      \
> ++      } while (0)
> ++
> ++unsigned hash_rjenkins(const char *str, unsigned length)
> + {
> +-      uint32_t hash = len;
> +-      uint8_t * data = string;
> +-
> +-      const unsigned int m = 0x5bd1e995;
> +-      const int r = 24;
> +-      int align = (long)string & 3;
> +-
> +-      if (!align || (len < 4)) {
> +-              /* In case data is aligned, MurmurHash2 function */
> +-              while(len >= 4)
> +-              {
> +-                      /* Mix 4 bytes at a time into the hash */
> +-                      uint32_t k = *(uint32_t *)data; /* We don't care
> about the byte order */
> +-
> +-                      _HASH_MIX(hash, k, m);
> +-
> +-                      data += 4;
> +-                      len -= 4;
> +-              }
> +-
> +-              /* Handle the last few bytes of the input */
> +-              switch(len) {
> +-                      case 3: hash ^= data[2] << 16;
> +-                      case 2: hash ^= data[1] << 8;
> +-                      case 1: hash ^= data[0];
> +-                              hash *= m;
> +-              }
> +-
> +-      } else {
> +-              /* Unaligned data, use alignment-safe slower version */
> +-
> +-              /* Pre-load the temp registers */
> +-              uint32_t t = 0, d = 0;
> +-              switch(align)
> +-              {
> +-                      case 1: t |= data[2] << 16;
> +-                      case 2: t |= data[1] << 8;
> +-                      case 3: t |= data[0];
> +-              }
> +-              t <<= (8 * align);
> +-
> +-              data += 4-align;
> +-              len -= 4-align;
> +-
> +-              /* From this point, "data" can be read by chunks of 4
> bytes */
> +-
> +-              int sl = 8 * (4-align);
> +-              int sr = 8 * align;
> +-
> +-              /* Mix */
> +-              while(len >= 4)
> +-              {
> +-                      uint32_t k;
> +-
> +-                      d = *(unsigned int *)data;
> +-                      k = (t >> sr) | (d << sl);
> +-
> +-                      _HASH_MIX(hash, k, m);
> +-
> +-                      t = d;
> +-
> +-                      data += 4;
> +-                      len -= 4;
> +-              }
> +-
> +-              /* Handle leftover data in temp registers */
> +-              d = 0;
> +-              if(len >= align)
> +-              {
> +-                      uint32_t k;
> +-
> +-                      switch(align)
> +-                      {
> +-                      case 3: d |= data[2] << 16;
> +-                      case 2: d |= data[1] << 8;
> +-                      case 1: d |= data[0];
> +-                      }
> +-
> +-                      k = (t >> sr) | (d << sl);
> +-                      _HASH_MIX(hash, k, m);
> +-
> +-                      data += align;
> +-                      len -= align;
> +-
> +-                      /* Handle tail bytes */
> +-
> +-                      switch(len)
> +-                      {
> +-                      case 3: hash ^= data[2] << 16;
> +-                      case 2: hash ^= data[1] << 8;
> +-                      case 1: hash ^= data[0];
> +-                                      hash *= m;
> +-                      };
> +-              }
> +-              else
> +-              {
> +-                      switch(len)
> +-                      {
> +-                      case 3: d |= data[2] << 16;
> +-                      case 2: d |= data[1] << 8;
> +-                      case 1: d |= data[0];
> +-                      case 0: hash ^= (t >> sr) | (d << sl);
> +-                                      hash *= m;
> +-                      }
> +-              }
> +-
> ++      const unsigned char *k = (const unsigned char *)str;
> ++      uint32_t a, b, c;  /* the internal state */
> ++      uint32_t len;      /* how many key bytes still need mixing */
> ++
> ++      /* Set up the internal state */
> ++      len = length;
> ++      a = 0x9e3779b9;      /* the golden ratio; an arbitrary value */
> ++      b = a;
> ++      c = 0;               /* variable initialization of internal state
> */
> ++
> ++      /* handle most of the key */
> ++      while (len >= 12) {
> ++              a = a + (k[0] + ((uint32_t)k[1] << 8) + ((uint32_t)k[2] <<
> 16) +
> ++                       ((uint32_t)k[3] << 24));
> ++              b = b + (k[4] + ((uint32_t)k[5] << 8) + ((uint32_t)k[6] <<
> 16) +
> ++                       ((uint32_t)k[7] << 24));
> ++              c = c + (k[8] + ((uint32_t)k[9] << 8) + ((uint32_t)k[10]
> << 16) +
> ++                       ((uint32_t)k[11] << 24));
> ++              mix(a, b, c);
> ++              k = k + 12;
> ++              len = len - 12;
> ++      }
> +
> ++      /* handle the last 11 bytes */
> ++      c = c + length;
> ++      switch (len) {            /* all the case statements fall through
> */
> ++      case 11:
> ++              c = c + ((uint32_t)k[10] << 24);
> ++      case 10:
> ++              c = c + ((uint32_t)k[9] << 16);
> ++      case 9:
> ++              c = c + ((uint32_t)k[8] << 8);
> ++              /* the first byte of c is reserved for the length */
> ++      case 8:
> ++              b = b + ((uint32_t)k[7] << 24);
> ++      case 7:
> ++              b = b + ((uint32_t)k[6] << 16);
> ++      case 6:
> ++              b = b + ((uint32_t)k[5] << 8);
> ++      case 5:
> ++              b = b + k[4];
> ++      case 4:
> ++              a = a + ((uint32_t)k[3] << 24);
> ++      case 3:
> ++              a = a + ((uint32_t)k[2] << 16);
> ++      case 2:
> ++              a = a + ((uint32_t)k[1] << 8);
> ++      case 1:
> ++              a = a + k[0];
> ++              /* case 0: nothing left to add */
> +       }
> ++      mix(a, b, c);
> +
> +-      /* Do a few final mixes of the hash to ensure the last few
> +-         bytes are well-incorporated. */
> +-      hash ^= hash >> 13;
> +-      hash *= m;
> +-      hash ^= hash >> 15;
> ++      return c;
> ++}
> +
> +-      return hash;
> ++uint32_t fd_os_hash ( uint8_t * string, size_t len )
> ++{
> ++      return hash_rjenkins(string, len);
> + }
> +
> +--
> +1.7.10.4
> +
> diff --git a/meta-networking/recipes-protocols/freediameter/files/freeDiameter.conf
> b/meta-networking/recipes-protocols/freediameter/files/freeDiameter.conf
> new file mode 100644
> index 0000000..7b56d74
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/freediameter/files/
> freeDiameter.conf
> @@ -0,0 +1,250 @@
> +# This is a sample configuration file for freeDiameter daemon.
> +
> +# Most of the options can be omitted, as they default to reasonable
> values.
> +# Only TLS-related options must be configured properly in usual setups.
> +
> +# It is possible to use "include" keyword to import additional files
> +# e.g.: include "/etc/freeDiameter.d/*.conf"
> +# This is exactly equivalent as copy & paste the content of the included
> file(s)
> +# where the "include" keyword is found.
> +
> +
> +##############################################################
> +##  Peer identity and realm
> +
> +# The Diameter Identity of this daemon.
> +# This must be a valid FQDN that resolves to the local host.
> +# Default: hostname's FQDN
> +#Identity = "aaa.koganei.freediameter.net";
> +
> +# The Diameter Realm of this daemon.
> +# Default: the domain part of Identity (after the first dot).
> +#Realm = "koganei.freediameter.net";
> +
> +##############################################################
> +##  Transport protocol configuration
> +
> +# The port this peer is listening on for incoming connections (TCP and
> SCTP).
> +# Default: 3868. Use 0 to disable.
> +#Port = 3868;
> +
> +# The port this peer is listening on for incoming TLS-protected
> connections (TCP and SCTP).
> +# See TLS_old_method for more information about TLS flavours.
> +# Note: we use TLS/SCTP instead of DTLS/SCTP at the moment. This will
> change in future version of freeDiameter.
> +# Default: 5868. Use 0 to disable.
> +#SecPort = 5868;
> +
> +# Use RFC3588 method for TLS protection, where TLS is negociated after
> CER/CEA exchange is completed
> +# on the unsecure connection. The alternative is RFC6733 mechanism, where
> TLS protects also the
> +# CER/CEA exchange on a dedicated secure port.
> +# This parameter only affects outgoing connections.
> +# The setting can be also defined per-peer (see Peers configuration
> section).
> +# Default: use RFC6733 method with separate port for TLS.
> +#TLS_old_method;
> +
> +# Disable use of TCP protocol (only listen and connect over SCTP)
> +# Default : TCP enabled
> +#No_TCP;
> +
> +# Disable use of SCTP protocol (only listen and connect over TCP)
> +# Default : SCTP enabled
> +#No_SCTP;
> +# This option is ignored if freeDiameter is compiled with DISABLE_SCTP
> option.
> +
> +# Prefer TCP instead of SCTP for establishing new connections.
> +# This setting may be overwritten per peer in peer configuration blocs.
> +# Default : SCTP is attempted first.
> +#Prefer_TCP;
> +
> +# Default number of streams per SCTP associations.
> +# This setting may be overwritten per peer basis.
> +# Default : 30 streams
> +#SCTP_streams = 30;
> +
> +##############################################################
> +##  Endpoint configuration
> +
> +# Disable use of IP addresses (only IPv6)
> +# Default : IP enabled
> +#No_IP;
> +
> +# Disable use of IPv6 addresses (only IP)
> +# Default : IPv6 enabled
> +#No_IPv6;
> +
> +# Specify local addresses the server must bind to
> +# Default : listen on all addresses available.
> +#ListenOn = "202.249.37.5";
> +#ListenOn = "2001:200:903:2::202:1";
> +#ListenOn = "fe80::21c:5ff:fe98:7d62%eth0";
> +
> +
> +##############################################################
> +##  Server configuration
> +
> +# How many Diameter peers are allowed to be connecting at the same time ?
> +# This parameter limits the number of incoming connections from the time
> +# the connection is accepted until the first CER is received.
> +# Default: 5 unidentified clients in paralel.
> +#ThreadsPerServer = 5;
> +
> +##############################################################
> +##  TLS Configuration
> +
> +# TLS is managed by the GNUTLS library in the freeDiameter daemon.
> +# You may find more information about parameters and special behaviors
> +# in the relevant documentation.
> +# http://www.gnu.org/software/gnutls/manual/
> +
> +# Credentials of the local peer
> +# The X509 certificate and private key file to use for the local peer.
> +# The files must contain PKCS-1 encoded RSA key, in PEM format.
> +# (These parameters are passed to gnutls_certificate_set_x509_key_file
> function)
> +# Default : NO DEFAULT
> +#TLS_Cred = "<x509 certif file.PEM>" , "<x509 private key file.PEM>";
> +#TLS_Cred = "/etc/ssl/certs/freeDiameter.pem", "/etc/ssl/private/
> freeDiameter.key";
> +
> +# Certificate authority / trust anchors
> +# The file containing the list of trusted Certificate Authorities (PEM
> list)
> +# (This parameter is passed to gnutls_certificate_set_x509_trust_file
> function)
> +# The directive can appear several times to specify several files.
> +# Default : GNUTLS default behavior
> +#TLS_CA = "<file.PEM>";
> +
> +# Certificate Revocation List file
> +# The information about revoked certificates.
> +# The file contains a list of trusted CRLs in PEM format. They should
> have been verified before.
> +# (This parameter is passed to gnutls_certificate_set_x509_crl_file
> function)
> +# Note: openssl CRL format might have interoperability issue with GNUTLS
> format.
> +# Default : GNUTLS default behavior
> +#TLS_CRL = "<file.PEM>";
> +
> +# GNU TLS Priority string
> +# This string allows to configure the behavior of GNUTLS key exchanges
> +# algorithms. See gnutls_priority_init function documentation for
> information.
> +# You should also refer to the Diameter required TLS support here:
> +#   http://tools.ietf.org/html/rfc6733#section-13.1
> +# Default : "NORMAL"
> +# Example: TLS_Prio = "NONE:+VERS-TLS1.1:+AES-128-
> CBC:+RSA:+SHA1:+COMP-NULL";
> +#TLS_Prio = "NORMAL";
> +
> +# Diffie-Hellman parameters size
> +# Set the number of bits for generated DH parameters
> +# Valid value should be 768, 1024, 2048, 3072 or 4096.
> +# (This parameter is passed to gnutls_dh_params_generate2 function,
> +# it usually should match RSA key size)
> +# Default : 1024
> +#TLS_DH_Bits = 1024;
> +
> +# Alternatively, you can specify a file to load the PKCS#3 encoded
> +# DH parameters directly from. This accelerates the daemon start
> +# but is slightly less secure. If this file is provided, the
> +# TLS_DH_Bits parameters has no effect.
> +# Default : no default.
> +#TLS_DH_File = "<file.PEM>";
> +
> +
> +##############################################################
> +##  Timers configuration
> +
> +# The Tc timer of this peer.
> +# It is the delay before a new attempt is made to reconnect a
> disconnected peer.
> +# The value is expressed in seconds. The recommended value is 30 seconds.
> +# Default: 30
> +#TcTimer = 30;
> +
> +# The Tw timer of this peer.
> +# It is the delay before a watchdog message is sent, as described in RFC
> 3539.
> +# The value is expressed in seconds. The default value is 30 seconds.
> Value must
> +# be greater or equal to 6 seconds. See details in the RFC.
> +# Default: 30
> +#TwTimer = 30;
> +
> +##############################################################
> +##  Applications configuration
> +
> +# Disable the relaying of Diameter messages?
> +# For messages not handled locally, the default behavior is to forward the
> +# message to another peer if any is available, according to the routing
> +# algorithms. In addition the "0xffffff" application is advertised in
> CER/CEA
> +# exchanges.
> +# Default: Relaying is enabled.
> +#NoRelay;
> +
> +# Number of server threads that can handle incoming messages at the same
> time.
> +# Default: 4
> +#AppServThreads = 4;
> +
> +# Other applications are configured by loaded extensions.
> +
> +##############################################################
> +##  Extensions configuration
> +
> +#  The freeDiameter framework merely provides support for
> +# Diameter Base Protocol. The specific application behaviors,
> +# as well as advanced functions, are provided
> +# by loadable extensions (plug-ins).
> +#  These extensions may in addition receive the name of a
> +# configuration file, the format of which is extension-specific.
> +#
> +# Format:
> +#LoadExtension = "/path/to/extension" [ : "/optional/configuration/file"
> ] ;
> +#
> +# Examples:
> +#LoadExtension = "extensions/sample.fdx";
> +#LoadExtension = "extensions/sample.fdx":"conf/sample.conf";
> +
> +# Extensions are named as follow:
> +# dict_* for extensions that add content to the dictionary definitions.
> +# dbg_*  for extensions useful only to retrieve more information on the
> framework execution.
> +# acl_*  : Access control list, to control which peers are allowed to
> connect.
> +# rt_*   : routing extensions that impact how messages are forwarded to
> other peers.
> +# app_*  : applications, these extensions usually register callbacks to
> handle specific messages.
> +# test_* : dummy extensions that are useful only in testing environments.
> +
> +
> +# The dbg_msg_dump.fdx extension allows you to tweak the way freeDiameter
> displays some
> +# information about some events. This extension does not actually use a
> configuration file
> +# but receives directly a parameter in the string passed to the
> extension. Here are some examples:
> +## LoadExtension = "dbg_msg_dumps.fdx" : "0x1111"; # Removes all default
> hooks, very quiet even in case of errors.
> +## LoadExtension = "dbg_msg_dumps.fdx" : "0x2222"; # Display all events
> with few details.
> +## LoadExtension = "dbg_msg_dumps.fdx" : "0x0080"; # Dump complete
> information about sent and received messages.
> +# The four digits respectively control: connections, routing decisions,
> sent/received messages, errors.
> +# The values for each digit are:
> +#  0 - default - keep the default behavior
> +#  1 - quiet   - remove any specific log
> +#  2 - compact - display only a summary of the information
> +#  4 - full    - display the complete information on a single long line
> +#  8 - tree    - display the complete information in an easier to read
> format spanning several lines.
> +
> +
> +##############################################################
> +##  Peers configuration
> +
> +#  The local server listens for incoming connections. By default,
> +# all unknown connecting peers are rejected. Extensions can override this
> behavior (e.g., acl_wl).
> +#
> +#  In addition to incoming connections, the local peer can
> +# be configured to establish and maintain connections to some
> +# Diameter nodes and allow connections from these nodes.
> +#  This is achieved with the ConnectPeer directive described below.
> +#
> +# Note that the configured Diameter Identity MUST match
> +# the information received inside CEA, or the connection will be aborted.
> +#
> +# Format:
> +#ConnectPeer = "diameterid" [ { parameter1; parameter2; ...} ] ;
> +# Parameters that can be specified in the peer's parameter list:
> +#  No_TCP; No_SCTP; No_IP; No_IPv6; Prefer_TCP; TLS_old_method;
> +#  No_TLS;       # assume transparent security instead of TLS. DTLS is
> not supported yet (will change in future versions).
> +#  Port = 5868;  # The port to connect to
> +#  TcTimer = 30;
> +#  TwTimer = 30;
> +#  ConnectTo = "202.249.37.5";
> +#  ConnectTo = "2001:200:903:2::202:1";
> +#  TLS_Prio = "NORMAL";
> +#  Realm = "realm.net"; # Reject the peer if it does not advertise this
> realm.
> +# Examples:
> +#ConnectPeer = "aaa.wide.ad.jp";
> +#ConnectPeer = "old.diameter.serv" { TcTimer = 60; TLS_old_method;
> No_SCTP; Port=3868; } ;
> +##############################################################
> diff --git a/meta-networking/recipes-protocols/freediameter/files/freediameter.init
> b/meta-networking/recipes-protocols/freediameter/files/freediameter.init
> new file mode 100755
> index 0000000..e63a42a
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/freediameter/files/
> freediameter.init
> @@ -0,0 +1,72 @@
> +#!/bin/sh
> +#
> +### BEGIN INIT INFO
> +# Provides:          freediameter
> +# Default-Start:     2 3 4 5
> +# Default-Stop:      0 1 6
> +# Required-Start:    $remote_fs $syslog
> +# Required-Stop:     $remote_fs $syslog
> +# Short-Description: Start freeDiameter daemon at boot time
> +# Description:       Start the freeDiameter daemon at boot time.
> +#       freeDiameter is an extensible implementation of the Diameter
> protocol,
> +#       designed for Authentication, Authorization and Accounting.
> Diameter is
> +#       an evolution of the RADIUS protocol.
> +### END INIT INFO#
> +DAEMON=/usr/bin/freeDiameterd
> +CONF=/etc/freeDiameter/freeDiameter.conf
> +NAME=freediameter
> +DESC="freeDiameter daemon"
> +
> +. /etc/init.d/functions
> +start() {
> +       [ -x $DAEMON ] || exit 5
> +       echo -n $"Starting $DAEMON: "
> +       start-stop-daemon -S -b -x ${DAEMON} && success || failure
> +       retval=$?
> +       echo ""
> +       return $retval
> +}
> +
> +stop() {
> +       echo -n $"Stopping $prog: "
> +       start-stop-daemon -K -x $DAEMON
> +       retval=$?
> +       echo ""
> +       return $retval
> +}
> +
> +restart() {
> +       stop
> +       sleep 3
> +       start
> +}
> +
> +rh_status() {
> +       status $DAEMON
> +}
> +
> +rh_status_q() {
> +       rh_status > /dev/null 2>&1
> +}
> +
> +case "$1" in
> +  start)
> +       rh_status_q && exit 0
> +       start
> +       ;;
> +  stop)
> +       rh_status_q || exit 0
> +       stop
> +       ;;
> +  restart)
> +       restart
> +       ;;
> +  status)
> +       rh_status
> +       ;;
> +  *)
> +       echo $"Usage: $prog {start|stop|status|restart}"
> +       exit 2
> +esac
> +
> +exit $?
> diff --git a/meta-networking/recipes-protocols/freediameter/files/freediameter.service
> b/meta-networking/recipes-protocols/freediameter/files/
> freediameter.service
> new file mode 100644
> index 0000000..514481b
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/freediameter/files/
> freediameter.service
> @@ -0,0 +1,11 @@
> +[Unit]
> +Description=freediameter daemon
> +After=network.target
> +
> +[Service]
> +Type=simple
> +PIDFile=/var/run/freediameter.pid
> +ExecStart=@BINDIR@/freeDiameterd
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-networking/recipes-protocols/freediameter/files/install_test.patch
> b/meta-networking/recipes-protocols/freediameter/files/install_test.patch
> new file mode 100644
> index 0000000..151037d
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/freediameter/files/
> install_test.patch
> @@ -0,0 +1,22 @@
> +CMakeLists: add an option to install tests
> +
> +Upstream-Status: Inappropriate [OE ptest specific]
> +
> +Original author: Yao Zhao <yao.zhao@windriver.com>
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +
> +diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
> +index da8da1b..de04059 100644
> +--- a/tests/CMakeLists.txt
> ++++ b/tests/CMakeLists.txt
> +@@ -113,4 +113,9 @@ ENDFOREACH( TEST )
> + ####
> + ## INSTALL section ##
> +
> +-# we do not install the tests
> ++# install the tests
> ++SET(INSTALL_TEST_SUFFIX       /opt/${FD_PROJECT_NAME}-tests   CACHE PATH
> "Directory where the test binary is installed.")
> ++
> ++INSTALL(TARGETS ${TEST_LIST}
> ++        RUNTIME DESTINATION ${INSTALL_TEST_SUFFIX}
> ++        COMPONENT freeDiameter-common)
> diff --git a/meta-networking/recipes-protocols/freediameter/files/pass-ptest-env.patch
> b/meta-networking/recipes-protocols/freediameter/files/
> pass-ptest-env.patch
> new file mode 100644
> index 0000000..ea857af
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/freediameter/files/
> pass-ptest-env.patch
> @@ -0,0 +1,72 @@
> +freediameter ptest cases testmesg_stress.c and testloadext.c need load
> +extensions both build time and runtime. Then they search extensions with
> +build directory that causes runtime failures.
> +
> +Pass an environment variable to define runtime extension path.
> +
> +Upstream-Status: Inappropriate [OE ptest specific]
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +
> +diff -Nur freeDiameter-1.2.0.orig/tests/testloadext.c
> freeDiameter-1.2.0/tests/testloadext.c
> +--- freeDiameter-1.2.0.orig/tests/testloadext.c        2014-02-19
> 17:33:24.785405032 +0800
> ++++ freeDiameter-1.2.0/tests/testloadext.c     2014-02-19
> 20:08:03.871403924 +0800
> +@@ -49,7 +49,7 @@
> + {
> +       DIR *dir;
> +       struct dirent *dp;
> +-      char fullname[512];
> ++      char fullname[1024];
> +       int pathlen;
> +
> +       /* First, initialize the daemon modules */
> +@@ -57,11 +57,16 @@
> +       CHECK( 0, fd_queues_init()  );
> +       CHECK( 0, fd_msg_init()  );
> +       CHECK( 0, fd_rtdisp_init()  );
> +-
> ++
> ++      char *ext_dir = getenv("EXTENSIONS_DIR");
> ++      if (ext_dir)
> ++              pathlen = snprintf(fullname, sizeof(fullname), "%s",
> ext_dir);
> ++      else
> ++              pathlen = snprintf(fullname, sizeof(fullname), BUILD_DIR
> "/extensions/");
> ++
> +       /* Find all extensions which have been compiled along the test */
> +-      TRACE_DEBUG(INFO, "Loading from: '%s'", BUILD_DIR "/extensions");
> +-      CHECK( 0, (dir = opendir (BUILD_DIR "/extensions")) == NULL ? 1 :
> 0 );
> +-      pathlen = snprintf(fullname, sizeof(fullname), BUILD_DIR
> "/extensions/");
> ++      TRACE_DEBUG(INFO, "Loading from: '%s'", fullname);
> ++      CHECK( 0, (dir = opendir (fullname)) == NULL ? 1 : 0 );
> +
> +       while ((dp = readdir (dir)) != NULL) {
> +               char * dot = strrchr(dp->d_name, '.');
> +diff -Nur freeDiameter-1.2.0.orig/tests/testmesg_stress.c
> freeDiameter-1.2.0/tests/testmesg_stress.c
> +--- freeDiameter-1.2.0.orig/tests/testmesg_stress.c    2014-02-19
> 17:33:24.785405032 +0800
> ++++ freeDiameter-1.2.0/tests/testmesg_stress.c 2014-02-19
> 20:08:03.928403924 +0800
> +@@ -67,15 +67,20 @@
> + {
> +       DIR *dir;
> +       struct dirent *dp;
> +-      char fullname[512];
> ++      char fullname[1024];
> +       int pathlen;
> +       struct fd_list all_extensions = FD_LIST_INITIALIZER(all_
> extensions);
> +       struct fd_list ext_with_depends = FD_LIST_INITIALIZER(ext_with_
> depends);
> +
> ++      char *ext_dir = getenv("EXTENSIONS_DIR");
> ++      if (ext_dir)
> ++              pathlen = snprintf(fullname, sizeof(fullname), "%s",
> ext_dir);
> ++      else
> ++              pathlen = snprintf(fullname, sizeof(fullname), BUILD_DIR
> "/extensions/");
> ++
> +       /* Find all extensions which have been compiled along the test */
> +-      LOG_D("Loading %s*.fdx from: '%s'", BUILD_DIR "/extensions",
> prefix ?: "");
> +-      CHECK( 0, (dir = opendir (BUILD_DIR "/extensions")) == NULL ? 1 :
> 0 );
> +-      pathlen = snprintf(fullname, sizeof(fullname), BUILD_DIR
> "/extensions/");
> ++      TRACE_DEBUG(INFO, "Loading from: '%s'", fullname);
> ++      CHECK( 0, (dir = opendir (fullname)) == NULL ? 1 : 0 );
> +
> +       while ((dp = readdir (dir)) != NULL) {
> +               char * dot = strrchr(dp->d_name, '.');
> diff --git a/meta-networking/recipes-protocols/freediameter/files/run-ptest
> b/meta-networking/recipes-protocols/freediameter/files/run-ptest
> new file mode 100644
> index 0000000..d0ca8d9
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/freediameter/files/run-ptest
> @@ -0,0 +1,11 @@
> +#!/bin/sh
> +
> +if ! lsmod | grep -q sctp && ! modprobe sctp 2>/dev/null; then
> +        echo "Couldn't load kernel module sctp."
> +        echo "Test cases testsctp and testcnx will fail."
> +        echo
> +fi
> +
> +export EXTENSIONS_DIR=$EXTENSIONS_DIR
> +cmake  -E cmake_echo_color --cyan "Running tests..."
> +ctest --force-new-ctest-process
> diff --git a/meta-networking/recipes-protocols/freediameter/freedia
> meter_1.2.1.bb b/meta-networking/recipes-protocols/freediameter/freedia
> meter_1.2.1.bb
> new file mode 100644
> index 0000000..92cd24c
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.2.1.bb
> @@ -0,0 +1,136 @@
> +SUMMARY = "An open source implementation of the diameter protocol"
> +DESCRIPTION = "\
> +freeDiameter is an open source Diameter protocol implementation \
> +(RFC3588). It provides an extensible platform for deploying a \
> +Diameter network for your Authentication, Authorization and \
> +Accounting needs."
> +
> +HOMEPAGE = "http://www.freediameter.net"
> +
> +DEPENDS = "flex bison cmake-native libgcrypt gnutls libidn lksctp-tools"
> +
> +fd_pkgname = "freeDiameter"
> +
> +SRC_URI = "\
> +    http://www.freediameter.net/hg/${fd_pkgname}/archive/${PV}
> .tar.gz;downloadfilename=${fd_pkgname}-${PV}.tar.gz \
> +    file://Replace-murmurhash-algorithm-with-Robert-Jenkin-s-ha.patch \
> +    file://freediameter.service \
> +    file://freediameter.init \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'ptest',
> 'file://install_test.patch file://run-ptest file://pass-ptest-env.patch',
> '', d)} \
> +    file://freeDiameter.conf \
> +    "
> +
> +SRC_URI[md5sum] = "61b1062aa144b5f12eed514611e6d697"
> +SRC_URI[sha256sum] = "bd7f105542e9903e776aa006c6931c
> 1f5d3d477cb59af33a9162422efa477097"
> +
> +S = "${WORKDIR}/${fd_pkgname}-${PV}"
> +
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=892b2ed6ae815488a08416ff7ee74a35"
> +
> +PTEST_PATH = "${libdir}/${fd_pkgname}/ptest"
> +
> +inherit cmake pkgconfig update-rc.d ptest systemd
> +
> +EXTRA_OECMAKE = " \
> +    -DDEFAULT_CONF_PATH:PATH=${sysconfdir}/${fd_pkgname} \
> +    -DBUILD_DBG_MONITOR:BOOL=ON  \
> +    -DBUILD_TEST_APP:BOOL=ON \
> +    -DBUILD_TESTING:BOOL=ON \
> +    -DBUILD_APP_RADGW:BOOL=ON \
> +    -DBUILD_APP_REDIRECT:BOOL=ON \
> +    -DBUILD_TEST_ACCT:BOOL=ON \
> +    -DBUILD_TEST_NETEMUL:BOOL=ON \
> +    -DBUILD_TEST_RT_ANY:BOOL=ON \
> +    -DINSTALL_LIBRARY_SUFFIX:PATH=${baselib} \
> +    -DINSTALL_EXTENSIONS_SUFFIX:PATH=${baselib}/${fd_pkgname} \
> +    -DINSTALL_TEST_SUFFIX:PATH=${PTEST_PATH}-tests \
> +    -DCMAKE_SKIP_RPATH:BOOL=ON \
> +"
> +# INSTALL_LIBRARY_SUFFIX is relative to CMAKE_INSTALL_PREFIX
> +# specify it on cmd line will fix the SET bug in CMakeList.txt
> +
> +# -DBUILD_APP_ACCT:BOOL=ON This needs POSTGRESQL support
> +
> +# -DBUILD_APP_DIAMEAP:BOOL=ON  -DBUILD_APP_SIP:BOOL=ON
> -DBUILD_TEST_SIP:BOOL=ON
> +# These need MySQL support
> +
> +# -DBUILD_DBG_INTERACTIVE:BOOL=ON This needs SWIG support
> +
> +# -DALL_EXTENSIONS=ON will enable all
> +
> +FD_KEY ?="${BPN}.key"
> +FD_PEM ?= "${BPN}.pem"
> +FD_CA ?= "${BPN}.pem"
> +FD_DH_PEM ?= "${BPN}-dh.pem"
> +FD_HOSTNAME ?= "${MACHINE}"
> +FD_REALM ?= "openembedded.org"
> +
> +do_install_append() {
> +    # install the sample configuration files
> +    install -d -m 0755 ${D}${sysconfdir}/${fd_pkgname}
> +    for i in ${S}/doc/*.conf.sample; do
> +        install -m 0644 $i ${D}${sysconfdir}/${fd_pkgname}/
> +    done
> +    mv ${D}${sysconfdir}/${fd_pkgname}/freediameter.conf.sample \
> +       ${D}${sysconfdir}/${fd_pkgname}/freeDiameter.conf.sample
> +    install -d ${D}${sysconfdir}/freeDiameter
> +        install ${WORKDIR}/freeDiameter.conf ${D}${sysconfdir}/${fd_
> pkgname}/freeDiameter.conf
> +
> +    # install daemon init related files
> +    install -d -m 0755 ${D}${sysconfdir}/default
> +    install -d -m 0755 ${D}${sysconfdir}/init.d
> +    install -m 0644 ${S}/contrib/debian/freediameter-daemon.default \
> +      ${D}${sysconfdir}/default/${BPN}
> +    install -m 0755 ${WORKDIR}/freediameter.init
> ${D}${sysconfdir}/init.d/${BPN}
> +
> +    # install for systemd
> +    install -d ${D}${systemd_system_unitdir}
> +    install -m 0644 ${WORKDIR}/freediameter.service
> ${D}${systemd_system_unitdir}
> +    sed -i -e 's,@BINDIR@,${bindir},g' ${D}${systemd_system_unitdir}/
> *.service
> +
> +    cat >> ${D}${sysconfdir}/freeDiameter/freeDiameter.conf <<EOF
> +## OE specific ##
> +#Identity="${FD_HOSTNAME}";
> +Identity = "${FD_HOSTNAME}.${FD_REALM}";
> +Realm = "${FD_REALM}";
> +Port = 30868;
> +SecPort = 30869;
> +TLS_Cred = "/etc/freeDiameter/${FD_PEM}" , "/etc/freeDiameter/${FD_KEY}";
> +TLS_CA = "/etc/freeDiameter/${FD_CA}";
> +TLS_DH_File = "/etc/freeDiameter/${FD_DH_PEM}";
> +EOF
> +
> +    # create self cert
> +    openssl req -x509 -config ${STAGING_DIR_NATIVE}/etc/ssl/openssl.cnf
> -newkey rsa:4096 -sha256 -nodes -out ${D}${sysconfdir}/freeDiameter/${FD_PEM}
> -keyout ${D}${sysconfdir}/freeDiameter/${FD_KEY} -days 3650 -subj
> '/CN=${FD_HOSTNAME}.${FD_REALM}'
> +    openssl dhparam -out ${D}${sysconfdir}/freeDiameter/${FD_DH_PEM} 1024
> +
> +}
> +
> +do_install_ptest() {
> +    sed -i "s#\(EXTENSIONS_DIR=\).*\$#\1${libdir}/${fd_pkgname}/#"
> ${D}${PTEST_PATH}/run-ptest
> +    mv ${D}${PTEST_PATH}-tests/* ${D}${PTEST_PATH}/
> +    rmdir ${D}${PTEST_PATH}-tests
> +    install -m 0644 ${B}/tests/CTestTestfile.cmake ${D}${PTEST_PATH}/
> +}
> +
> +FILES_${PN}-dbg += "${libdir}/${fd_pkgname}/.debug/*"
> +
> +# include the extensions in main package
> +FILES_${PN} += "${libdir}/${fd_pkgname}/*"
> +
> +RDEPENDS_${PN}  = "glib-2.0 gnutls libidn"
> +RDEPENDS_${PN} += "openssl openssl-conf openssl-engines"
> +RDEPENDS_${PN} += "kernel-module-tipc kernel-module-sctp"
> +RDEPENDS_${PN} += "kernel-module-udp-tunnel kernel-module-ipip"
> +RDEPENDS_${PN}-ptest = "cmake"
> +
> +INITSCRIPT_PACKAGES = "${PN}"
> +INITSCRIPT_NAME_${PN} = "${BPN}"
> +INITSCRIPT_PARAMS$_${PN} = "start 30 . stop 70 0 1 2 3 4 5 6 ."
> +
> +SYSTEMD_SERVICE_${PN} = "freediameter.service"
> +SYSTEMD_AUTO_ENABLE = "disable"
> +
> +CONFFILES_${PN} = "${sysconfdir}/freediameter.conf"
> +
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

