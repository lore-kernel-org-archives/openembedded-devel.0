Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.1858.1590613517025292685
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2020 14:05:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=WM5thLw0;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 5426760046;
	Wed, 27 May 2020 23:05:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1590613511;
	bh=iX4bx7C8eK39UjX8yl2IsThniTp4otRIogtC1Jef2Hg=;
	h=From:To:Cc:Subject:Date:From;
	b=WM5thLw01skvpX9JqXSu5YjgupCoh60Qb/zSxRIYv0feImit9aKjcFN7mGjzVqKNa
	 kDLju38binolMsg0dSQHEpRVnR5tOIU9c8JnLyF6ooAD0BLfDcROstEYfD6jVI5UzG
	 CcFn4X8nDsVhBxSXvneVFDZv2oQy+22LoifjMMD6JB7KJaJjiZRYK0GqHiAXcQzNJI
	 YiEHFMSAC2T5x2HbGXeIQM8TN1fBYsdrH/6mB991pNiLsQ85Ua83XU7rkEydfAGlRa
	 v6IML4c3buAQTnRTn85GyCIcZEYVeyV9E07iemmeQhSUfgSwwtI55qz6jh3/UQhW1P
	 gv/xag7F5jfbQ==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-networking][PATCH] uftp: upgrade 4.10.2 -> 5.0
Date: Wed, 27 May 2020 23:05:08 +0200
Message-Id: <1590613508-15935-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

Full changelog:

Version 5.0 - 4/22/2020
  Major security updates.  The key exchange and key derivation algorithms
    were modified and supported algorithms were pruned using TLS 1.3 as a
    basis.  This includes:
  - HKDF used in multiple stages for key derivation from raw shared secrets.
  - Included addtional context in key derivation and signatures to protect
    against replay attacks and downgrade attacks.
  - Reduced set of supported EC curves to those supported by TLS 1.3
  - Removed RSA key exchange which does not provide perfect forward secrecy.
    All key exchanges now use ECDH.
  - Removed support for SHA-1 hashes in key exchanges.
  - Supported symmetric ciphers are AES in AEAD mode (GCM or CCM).
  - Increased supported RSA key sizes
  Encrypted sessions are now enabled by default.  It can be disabled by
    specifying "none" for the key type in the server's -Y option.
  Backward compatibility retained for version 4.x in clients and proxies.
    When communicating with a 4.x server, only allow algorithms and key
    exchange modes permitted in the new version.
  Clients and proxies no longer need to use signature keys that match the
    type and size used by the server.  As a result, the -k and -K options to
    the client now only accept a single key instead of multiple.  The proxy
    still supports multiple keys for 4.x compatibility, however only the first
    key listed is used for any version 5.x session.
  Proxies now send their keys in a separate message instead of injecting them
    in the ANNOUNCE sent by the server.  This allows clients to be fully
    aware of proixes and allows them to authenticate servers and proxies
    separately.
  Format of client's server list modified to specify the proxy that a server
    communicates through.  Fingerprints listed in this file now always
    specify the server as opposed to having the proxy's key in some cases.
  Added -R option to client to specify a list of proxies along with their
    public key fingerprints.  The old use of -R to specify a version 4.x
    response proxy has moved to -r.
  Previously, using -S in the client or proxy to specify a server list would
    automatically enable source specific multicast (SSM).  The use of SSM is
    now enabled separately via the -o option on both the client and proxy.
  Fixed a bug that caused ECDSA signatures created on Linux with curve
    secp521r1 from being verified successfully on Windows.
  Fixed cleanup on clients and proxies to prevent occasional crashes on
    shutdown under Windows.
  Update timstamps in messages to use 64-bit microseconds since the epoch,
    addressing Y2038 issues.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-networking/recipes-support/uftp/{uftp_4.10.2.bb => uftp_5.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-support/uftp/{uftp_4.10.2.bb => uftp_5.0.bb} (77%)

diff --git a/meta-networking/recipes-support/uftp/uftp_4.10.2.bb b/meta-networking/recipes-support/uftp/uftp_5.0.bb
similarity index 77%
rename from meta-networking/recipes-support/uftp/uftp_4.10.2.bb
rename to meta-networking/recipes-support/uftp/uftp_5.0.bb
index 8e35ee1..4eeb62d 100644
--- a/meta-networking/recipes-support/uftp/uftp_4.10.2.bb
+++ b/meta-networking/recipes-support/uftp/uftp_5.0.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/uftp-multicast/files/source-tar/"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/uftp-multicast/source-tar/uftp-${PV}.tar.gz"
-SRC_URI[md5sum] = "db0519bf7b1e0329449e81c1e68262f8"
-SRC_URI[sha256sum] = "ecab6ab07fe0ebaf7bfe35d99fe2da28ede3ddc6f21f825d3b259cf171258505"
+SRC_URI[sha256sum] = "562f71ea5a24b615eb491f5744bad01e9c2e58244c1d6252d5ae98d320d308e0"
 
 DEPENDS = "openssl"
 
-- 
2.7.4

