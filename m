Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12012.1794070347134638636
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 08:52:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=etpY69tF;
 spf=pass (domain: konsulko.com, ip: 209.85.221.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4922dbcee23so866131f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 08:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794070345; x=1794675145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EnQEtZunWtECudiPo/NLXDhcmHCwcKx4CQW2UqIqliI=;
        b=etpY69tFTsdOk8pXZ/cMuyGL6viN+bksyrbGGWkyawfIIZE5UUGXPQjNGZfpeijb60
         TVo+copeuJtwy6cSXL2z8+MDfCrCDHGdszL5fXJMlnTGe3rceeGxXrKQcswg1vqcgUJr
         tFfI5MnDtKJ+FtA/DZ1pITSlRq8nMpH/yRcCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070345; x=1794675145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EnQEtZunWtECudiPo/NLXDhcmHCwcKx4CQW2UqIqliI=;
        b=nTO1JsK+zMCTtuPTT80gIcc1G9KlJ9o8A7Ke7SqKlG+RJTZLWyAH5YGTh0gUuJn2Zq
         rgtzsKsEXwBNAbbaCPHwJDqqHTO2/fDCv3uJrGCh/wNCCaXWf4XdSZxR7kPdXN3t8/Un
         7Ee5yxMh3yIR4D31g0bWla4LyTAZaWm/bNjVHRw7Aj3TM8Hdk8KEPPkyLtBN6RbuhaUm
         D2MR0WXvqCKKYFARG7INqAt6Xd+p598IvzHkaLzz28g9LnlTJDBFYs7Ie38dj8DxtV9i
         twfJvpfa3QYuMDlJq/J6z/3vSs1GRqEfVbyZZlcru0vYeSGp7nuDsaaS/ueHhBTfqWJ4
         l+jQ==
X-Gm-Message-State: APuU4Z9NxBFLRoJHpfio8rbDG2bwJF1HfUmbCxg1V+snTz7eJqyxg0wY
	60RUwxXwS5ijfU67HWOEY2og4V77oUwSgpbmR7e0SthFMnmrymmzeuwciHyGSYjfGe2s4/kl+sR
	7Cwc6
X-Gm-Gg: AYBFou3+KVy96x8J+wtBv8owKd0mOhVw1mdTCl2Pq/WDCTz7IZhyfX0Iu6TeHUnRYf3
	OFtglIJViaJPSsEj3Hj0oBrbv4DlWBRJ+A4AVHDa7VQ6e89u3ah15wc1bJTlpfW8ATc13etskYO
	X5iGoThw/UPFwQQj/A6ladzFFxINMiOHJpHKb0auFKA7aSysDoWaZM57Y4c8POTx6TPVbXZtfdI
	/0MdqEAJc/HwbQ2IOrN/jrvx3G7ttvT4g2k4sMpJuW7i885cqEs1CoFtc44/1lvn+5zy28syqVP
	Xat2T/Tq7f4lg9of3WM27lSyBjjmRspaZbgXLmE6IyHydhtCrvKzeRzV7DSuqKc/3VyQuzQijMc
	BpNZjIMbrUF5StPq16pxNQqjsTKnHKpSIUYN9DgvIf42jfuwMXPfkGyQzu58Cs02J7ipsFUM6OC
	R4tV5ahwzXXyPP8rGv8AE2ybrrDy7gIFqyJLAKIkmADg3zTJAJ6i5wDUqQetSBTlls9sHQGYIDu
	IvMhNaZV3PqOOuVvKgEbSdi/DUhO3JPDOR6tTIlVf7gQJxhUDI4R9jpJDjKYOhAPqVhZAmxwY4G
	tmV4/UgsrP8ajpHlXdWrpGNWT+jdncDAwcvw3WHEFPzqQzO5402B/+0nZ4QejVEzmN/LFiYxa69
	/jgQZG3pNvqM4O8gqAAbY/4Oi4MhTqZO9JC93GGVwqTVLxUWSX66Giw==
X-Received: by 2002:a5d:59c3:0:b0:48b:1a0:5630 with SMTP id ffacd0b85a97d-492778d16d6mr11937856f8f.41.1794070345080;
        Sat, 07 Nov 2026 08:52:25 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4948a99b9b0sm4127090f8f.4.2026.11.07.08.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:52:24 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 02/22] botan: Upgrade 3.13.0 -> 3.14.0
Date: Sat,  7 Nov 2026 18:52:01 +0200
Message-ID: <20261107165221.122340-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107165221.122340-1-leon.anavi@konsulko.com>
References: <20261107165221.122340-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 16:52:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131987
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.14.0:

General Notes

- Botan4 is expected to be released in May 2027. This new major
  release will remove significant deprecated functionality. Please
  consult the deprecation notes in doc/deprecated.rst and if your
  usage would be impacted by any such deprecations, please comment
  in GH #4666
- Add a warning to the documentation regarding recent research on
  the security of Classic McEliece. Following the current
  recommendations of BSI, Classic McEliece should only be used in a
  hybrid scheme. (GH #5993)
- The API documentation now consistently warns about algorithms and
  operations with known side channel issues. (GH #6007)

New APIs and Features

- Add types PK_Signature_Options PK_Encryption_Options,
  PK_KEM_Options, and PK_Key_Agreement_Options which allow an
  application to precisely control how public key operations
  (signature, encryption, decryption, KEM, etc) are performed. (GH
  #5489 #5864)
- Add an implementation of HPKE from RFC 9180 (GH #5989)
- Add an implementation of the BLS12-381 pairing friendly curve,
  including the groups G1, G2, and Gt and the pairing operation.
  (GH #5718)
- Add Work_Executor, which allows an application to replace the
  library's internal thread pool with its own executor. (GH #5990)
- ML-DSA signatures now support the application context string of
  FIPS 204, passed via PK_Signature_Options::with_context. (GH
  #5531)
- Add an experimental C API for TLS in the new ffi_tls module,
  currently covering policies, credentials, and session managers.
  Experimental modules are not built by default and not covered by
  SemVer. (GH #2492 #5941 #5963)
- Introduce a new design for entropy sources. (GH #5928 #5945)
- Add EC_Group::register_custom_group, which makes explicit the
  registration behavior previously only available as a side effect
  of the EC_Group constructor taking the curve parameters. (GH
  #5922)
- Add group functions returning the associated EC_Group to
  EC_Scalar and EC_AffinePoint. (GH #5948)
- Add TLS::Callbacks::tls_register_deferred_operation, which gives
  the library explicit control over DTLS retransmission timers, as
  an alternative to polling Channel::timeout_check. Use of
  timeout_check is deprecated. (GH #5915 #6096)
- In TLS 1.3 send KeyUpdate requests when the number of records
  sent or received approaches a policy-set limit. (GH #5877)
- Add TelephoneNumber and TelephoneNumberRange types modeling the
  telephone numbers and number ranges used in RFC 8226 STIR
  certificates. (GH #5979)
- Add PKCS12::mac_protected which indicates if the PKCS #12 file
  was protected using a MAC. (GH #5902)
- Jitter_RNG now accepts the compliance mode and the oversampling
  rate which should be used by the jitterentropy library. AIS 20/31
  NTG.1 compliance can be requested with Jitter_RNG::Mode::NTG1 if
  jitterentropy 3.7.0 or later is used. Note that Jitter_RNG no
  longer forces the FIPS mode of jitterentropy by default; use
  Jitter_RNG::Mode::FIPS to retain the previous behavior. (GH
  #5832)
- FFI handles can now share ownership of the underlying object. The
  RNG passed to botan_tpm2_ctx_enable_crypto_backend is now
  retained for the lifetime of the TPM2 context, rather than being
  borrowed. Add botan_is_shared and botan_use_count to query the
  ownership of a handle. (GH #5959 #6038 #6048 #6052)
- Add FFI functions botan_ec_scalar_get_group,
  botan_ec_point_get_group, and botan_ec_point_to_mp_xy. (GH #6080)
- Add FFI functions botan_x509_crl_view_issuer_dn and
  botan_x509_crl_view_issuer_dn_count for accessing the issuer DN
  of a CRL. (GH #6077)
- Processor_RNG now supports the ARMv8.5-A FEAT_RNG extension (the
  RNDR instruction) on aarch64. (GH #5228 #6084)

Security and Hardening

- CVE-2026-118770 Fix a use after free in the TLS asio integration
  which depending on application usage patterns may allow leaking
  heap memory to the peer.
- CVE-2026-118771 Fix a bug in TLS 1.3 which could allow an
  unauthenticated peer to pin unlimited amounts of memory in the
  handshake by sending many dummy ChangeCipherSpec messages.
- Fix a bug in DTLS which allowed a peer to skip the cookie
  exchange even if the policy required it.
- Address various DTLS handshake desync bugs (GH #5783)
- Fix a number of minor TLS conformance bugs and validate peer
  input with respect to some RFC requirements which were previously
  ignored. (GH #6061)
- During X.509 path validation, signatures are now verified
  starting from the trust anchor down to the leaf, stopping at the
  first invalid signature. (GH #5982)
- CRL signatures are now checked against the trusted hashes policy,
  as already done for certificate signatures. (GH #5981)
- Ed25519, Ed448, X25519, and X448 public keys are now fully
  validated on deserialization, rejecting points of low order. (GH
  #5594)
- Harden EC, RSA, DL, and Ed25519 private key loading, rejecting
  various invalid encodings and parameters. (GH #5994 #5995 #5996
  #5997 #6009 #6041)
- All paths which decode or construct an EC_Group now verify the
  complete set of group parameters, including generator validity,
  the Hasse bound, and the curve discriminant. Anomalous curves
  (where the order equals the field prime) are now rejected, and
  the deprecated EC_Group constructor rejects cofactors of zero or
  greater than 16. (GH #5921)
- ECIES now verifies that the peer's public point is encoded using
  the point format specified in the ECIES parameters. Also,
  EC_AffinePoint::deserialize now rejects hybrid encoded points of
  the wrong length. (GH #5913 #5920)
- Rework how stateful RNGs decide that they are seeded. Previously
  a call of randomize_with_input with an empty output and a
  non-empty input of sufficient length was treated as sufficient
  for seeding. Now only an explicit call of initialize_with or
  add_entropy is treated as a possible seeding event. (GH #5928
  #5945)
- The TLS server now validates that the host name received in the
  SNI extension is a syntactically valid DNS name. The name passed
  to the Credentials_Manager and other callbacks is now the
  canonical (lowercased) form. (GH #5937)
- Fix various bugs in decoding the RFC 3779 IP address and AS
  identifier extensions. Add interop between IPAddressBlocks and
  the IPv4/IPv6 name types. (GH #5957 #5978)
- Fix lenient decoding of the RFC 8226 TNAuthList extension, and
  add support for encoding it. (GH #5977)
- Replace the algorithm name parser with a stricter and faster one.
  Previously, invalid or trailing parameters were sometimes
  silently ignored, for example HMAC(SHA-512,Foo) was accepted. (GH
  #5956)
- Fix several bugs and missing validations in the HTTP client.
  Control characters in headers are now rejected, RequestLimits now
  caps the response body at 8 MiB by default, and timeouts are
  tracked using a monotonic clock with the budget carried across
  redirects. (GH #5980)
- SPAKE2+ now rejects a ProverSecret with w0 or w1 equal to zero,
  and the context moves to a failed state if any peer message fails
  to decode, rather than allowing further attempts. (GH #5976)
- Avoid an information leak during RSA key generation, where the
  number of candidate primes rejected after sieving leaked some
  bits of the final prime. (GH #6068)
- The Lucas primality test is now constant time; previously the
  search for the parameter D leaked information about the prime
  being tested. (GH #6067)
- Fix various minor side channels, including a value dependent
  branch when storing BigInt words, a value dependent loop in
  modular multiplication, variable length blinding of RSA
  exponents, and a branch when negating Ed25519 field elements.
  Many more secrets are now marked for the valgrind based constant
  time checks. (GH #6069 #6071)
- Improve validation of ML-KEM, ML-DSA, FrodoKEM, Classic McEliece,
  McEliece, and XMSS keys. Invalid keys now consistently throw
  Decoding_Error, and various cheap consistency checks are
  performed during deserialization. (GH #6083)
- Fix two bugs in TLS session resumption. A server now verifies
  that a resumed session satisfies the current policy, including
  client certificate authentication requirements and (in TLS 1.2)
  the ciphersuite requirements, rather than accepting any
  previously established session. Additionally a session manager
  shared between a client and a server role no longer allows a
  session established in one role to be resumed in the other. (GH
  #5797 #5837)
- TLS now limits the number of consecutive useless records (empty
  records, warning alerts, and TLS 1.3 compatibility mode
  ChangeCipherSpec) accepted from the peer, closing the connection
  if the limit is exceeded. The default limit of 32 can be changed
  using TLS::Policy::max_useless_records. (GH #6051)
- AutoSeeded_RNG now mixes a high resolution timestamp along with
  output from the system RNG into each request, to help recover
  from a VM rollback or process duplication which the kernel RNG
  did not detect. (GH #6054)
- The stateful key index registry used by XMSS and HSS-LMS now
  detects a fork using the fork generation counter rather than only
  the process ID, and Stateful_RNG now detects a fork which occurs
  before it is first seeded. (GH #6058)
- The baseline SM4 implementation (used if there is no suitable AES
  or SIMD hardware) is now constant time. (GH #6090)

Behavior Changes

- TLS now enforces that certificates contain the digitalSignature
  bit (or, for TLS 1.2 RSA key exchange, keyEncipherment).
  Previously nonRepudiation or dataEncipherment key usages were
  also accepted. (GH #6061)
- If the TLS policy requires client authentication then PSK
  ciphersuites will no longer be accepted, since PSK plus client
  auth is not supported in the handshake. (GH #6061)
- Update the ML-DSA private key encoding in PKCS #8 containers to
  conform to RFC 9881. All three encodings of the RFC (seed,
  expanded key, both) are supported. The old formats can still be
  decoded. (GH #5002 #5307)
- Update the ML-KEM private key encoding in PKCS #8 containers to
  conform to RFC 9935. The old formats can still be decoded. (GH
  #5934)
- By default, ECDSA signatures are now randomized rather than
  deterministic even when RFC 6979 support is available at build
  time. Deterministic signatures can be requested using the API
  PK_Signature_Options::with_deterministic_signature or by
  appending ",Deterministic" to the normal hash specifier string.
  (GH #5489)
- AutoSeeded_RNG now uses HMAC_DRBG with SHA-256 rather than
  SHA-512 when hardware support for SHA-256 is available. (GH
  #6003)
- Rework ChaCha_RNG: it now uses HMAC(SHA-512) instead of
  HMAC(SHA-256) and also derives the ChaCha nonce from the key
  material. Optional fast key erasure can be enabled with
  ChaCha_RNG::KeyErasure::WithKeyErasure to gain backtracking
  resistance. As a result the output of ChaCha_RNG for a given seed
  has changed; it was never guaranteed to be stable across versions
  and may change again in the future. (GH #5121)
- Password hash tuning (PasswordHashFamily::tune_params) now
  measures the CPU time of the calling thread where available
  (falling back to a monotonic clock), and uses the fastest of
  several samples rather than the mean. This makes the result much
  less sensitive to concurrent load and clock adjustments. (GH
  #5898)
- During X.509 path validation the self-signature of the trust
  anchor is no longer verified; the anchor is trusted because the
  application provided it. For a typical chain this removes about a
  third of the cost of path validation. (GH #6008)
- DSA now rejects parameters where p is smaller than 512 bits or
  larger than 3072 bits, or where q is larger than 256 bits.
  Previously only a minimum of 160 bits for q was enforced. (GH
  #6039)
- The ASN.1 pretty printer now formats integers of fewer than 32
  bits in decimal; previously the limit was 16 bits. (GH #6025)

Optimizations

- Add support for parallel hash function invocations, including
  AVX2/AVX512 implementations of SHA-256, SHA-512, and SHAKE (GH
  #5493 #5865 #5867 #5869 #5871 #5872 #5873)
- Optimize SLH-DSA, XMSS, HSS-LSM, FrodoKEM, and ML-KEM using
  parallel hash function execution. (GH #5866 #5868 #5870 #5876
  #5878)
- Refactor and optimize Ed25519 (GH #5893)
- Refactor and optimize X25519, especially improving key generation
  (GH #6010)
- Elliptic curve optimizations, especially improving P-256 and SM2.
  (GH #6012 #6013 #6020 #6021 #6024 #6031 #6059)
- Add AVX-512+IFMA modular exponentiation support, improving RSA
  and FFDHE by 3-4x (GH #6026)
- Add a fused Montgomery multiplication using BMI2/ADX, improving
  modular exponentiation on x86-64 processors without IFMA by about
  30%, and optimize the corresponding Montgomery squaring. (GH
  #6044 #6053)
- Add AVX2 codepath for ML-KEM (GH #5964 #6032 #6033)
- Enable many SIMD optimizations on POWER systems (GH #6027 #6028)
- Improve the performance of one-shot RSA private key operations
  (GH #6004)
- Optimize multiprecision integer division operations, and convert
  all such divisions to be constant time with respect to their
  inputs. (GH #5849 #5880 #5883 #5884)
- Optimize primality testing by performing trial division by small
  primes before running Miller-Rabin, rewriting the Lucas test to
  use Montgomery form, using faster variable time variants when
  testing public parameters, and running the Miller-Rabin and Lucas
  tests in the thread pool when it is available. (GH #5886 #6040)
- Improve the performance of X.509 certificate parsing, including
  PEM decoding, OID decoding, and extension handling. (GH #5888
  #5889 #5890 #5891)
- Avoid quadratic behavior when decoding an X.509 distinguished
  name with many attributes. (GH #6063)
- Add a certificate cache to the macOS system certificate store,
  implement contains() directly, and query the keychain by issuer
  DN and serial number instead of scanning all certificates of an
  issuer. (GH #5541 #5929)
- Resolve a performance regression in TLS 1.3 record processing
  introduced in 3.13.0, and avoid several copies and allocations on
  the send side. (GH #6002 #6046)
- Reduce memory allocations during TLS 1.2 record processing. (GH
  #5887)
- Use the AES instructions to compute the key schedule on x86,
  ARMv8, and POWER8, making AES::set_key substantially faster,
  especially on ARMv8 and POWER8 which previously used the
  bitsliced software key schedule. (GH #6078 #6081)
- Modify the bitsliced AES implementation to use the native word
  size of the processor, instead of always 32 bits. (GH #5826)
- The AVX-512/GFNI Twofish implementation is now used for all
  blocks, including any tail of fewer than 16 blocks, so the table
  based implementation is never used on processors which support
  these extensions. (GH #5975)
- Optimize the Whirlpool compression function on x86-64 and
  aarch64. (GH #5857 #5892)
- Add an AVX-512 implementation of base64 encoding and decoding (GH
  #5999)
- Optimize base58 encoding and decoding (GH #5858)
- Enable support for NEON/ARMv8 codepaths on Windows aarch64 (GH
  #5863)

Bug Fixes

- Fix a bug where a TLS 1.2 client configured with multiple
  certificate chains selected among them arbitrarily, without
  considering the server's signature_algorithms extension. (GH
  #5932)
- Fix the in-memory TLS session manager, which ordered stored
  sessions by session ID rather than by recency, so the wrong
  session could be evicted or returned. (GH #5847)
- Fix a bug introduced in 3.13.0 where, in builds without the
  system RNG, RandomNumberGenerator::randomize_with_ts_input passed
  only the low 32 bits of the timestamp, and never the process id,
  as additional input. (GH #5924 #5926)
- Fix various bugs in RNGs and entropy sources, including some edge
  cases involving fork safety. (GH #5987)
- Fix several bugs in the PKCS #11 wrapper, including typed key
  searches matching keys of the wrong type, EC public keys always
  being encoded in compressed form, ECDH accepting peer points with
  a small order component, and Object::destroy leaving a stale
  handle. (GH #5983)
- Fix a race in the FFI layer where the thread-local storage for
  the last exception message could be accessed after its
  destruction during process shutdown. (GH #5859)
- Fix libsodium compatibility issues in the sodium compat layer (GH
  #5966)
- Fix various edge cases in the sqlite3 database wrapper. (GH
  #5972)
- TOTP::verify_totp now takes an optional forward_drift_accepted
  parameter to accept codes from a client whose clock is ahead of
  the server's, as allowed by RFC 6238. The existing
  clock_drift_accepted parameter is unchanged and still only
  applies backwards. (GH #6035 #6070)
- Fix several corner case bugs in CPU feature detection. (GH #6036)
- Fix the move operators of Dynamically_Loaded_Library, which
  previously caused the library to be closed twice. (GH #5967)
- Fix various bugs in the TLS ASIO stream. Cancellation slots are
  now forwarded to the next layer so that timeouts reach pending
  operations, synchronous operations are refused while an
  asynchronous write is in flight, operations attempted before the
  handshake no longer cause all later handshakes to fail, and move
  assignment of Stream now compiles. (GH #6060)
- Fix various bugs and edge cases in the stateful hash signature
  schemes XMSS and HSS-LMS (GH #6066)

Deprecations and Cleanups

- Deprecate the public header pem.h; it will become internal in
  Botan4. (GH #5891)
- Deprecate the modules filters, comb4p, passhash9, emsa_x931, ofb,
  rc4, certstor_sql, and certstor_sqlite3. Additionally SRP6, the
  X9.42 PRF, and the TLS OCB ciphersuites are now documented as
  deprecated. (GH #5971)
- Remove many unused header includes, including from public
  headers. Applications which relied on transitive includes may
  need to add explicit includes. (GH #5897)

Command Line Utility

- Add a create_cert_for_key command, which issues a certificate
  directly for a public key without requiring a PKCS #10 request.
  This allows creating certificates for KEM keys such as ML-KEM.
  (GH #5529)
- Add a --one-shot flag to the speed command which causes the
  public key benchmarks to create a new operation object
  (PK_Signer, PK_Verifier, ...) for each measured operation, rather
  than creating one and reusing it. (GH #5951)
- Remove the sandboxing support (sandbox_init, pledge, Capsicum)
  from the command line tool. Recent versions of macOS kill any
  process which calls sandbox_init, and the other implementations
  were dead or untested code. (GH #5940 #5942)
- Fix many bugs in the command line tool. Commands now consistently
  report failures through the exit status, integer and option
  arguments are strictly validated, I/O errors are consistently
  detected, and passing the same file as input and --output no
  longer truncates the input. (GH #6037)

Python Binding

- The Python binding now can adapt itself to any version of Botan3.
  (GH #5851)
- Add X509Cert.binary_values/string_values and the equivalents on
  X509CRL. (GH #5984)
- Fix a number of bugs in the Python binding (GH #5969 #6064)

Build and Infrastructure

- Add support for precompiled headers with GCC and Clang, enabled
  using --enable-pch. (GH #5298)
- SIMD support on POWER now requires POWER8 (VSX). (GH #6029)
- Add --disable-lsx and --disable-lasx options for LoongArch. (GH
  #5108)
- Various build fixes, including for MinGW with libc++ 20 or later,
  the import library output directory with GCC on MinGW, and Clang
  on Aarch64. (GH #5850 #5854 #5875 #5901 #5953 #5954)
- The aes_ni, aes_armv8, and aes_power8 modules have been merged
  into a single aes_hwaes module. Build configurations which
  referenced the old module names must be updated. (GH #6081)
- Fix the CMake package configuration on MinGW, which did not set
  IMPORTED_IMPLIB for the imported target. (GH #6057)
- CI updates including moving most builds to Ubuntu 26.04, adding
  Windows Aarch64 builders, dropping the 32-bit MIPS cross build,
  updating dependencies used in CI, and improving resilience to
  slow package mirrors. (GH #5768 #5846 #5848 #5860 #5861 #6065)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-crypto/botan/{botan_3.13.0.bb => botan_3.14.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/botan/{botan_3.13.0.bb => botan_3.14.0.bb} (95%)

diff --git a/meta-oe/recipes-crypto/botan/botan_3.13.0.bb b/meta-oe/recipes-crypto/botan/botan_3.14.0.bb
similarity index 95%
rename from meta-oe/recipes-crypto/botan/botan_3.13.0.bb
rename to meta-oe/recipes-crypto/botan/botan_3.14.0.bb
index 1813b51d16..395def2bb4 100644
--- a/meta-oe/recipes-crypto/botan/botan_3.13.0.bb
+++ b/meta-oe/recipes-crypto/botan/botan_3.14.0.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 
 SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz \
            file://run-ptest"
-SRC_URI[sha256sum] = "12f5a8358890bbee82edfe9d2e7769b0a610b6dd0e0698aea13d20a675d84620"
+SRC_URI[sha256sum] = "c22d66a08cd3c6dae683bdcb8384beaa9e2cbd75821e19a270047030fbe81ac7"
 
 S = "${UNPACKDIR}/Botan-${PV}"
 
-- 
2.47.3

