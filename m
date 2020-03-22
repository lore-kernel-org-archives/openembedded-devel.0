Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.35004.1584900050827482277
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Mar 2020 11:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=soJHhQ0A;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 7D95B60031;
	Sun, 22 Mar 2020 19:00:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1584900048;
	bh=UhFwtZzd05WuUeDabVTyb7+W+fL0WKu6HgYFJUm7Mfg=;
	h=From:To:Cc:Subject:Date:From;
	b=soJHhQ0AfpQJxm+F65kcBCO9vLH25ctio88lZlTsxAdHAGVoa6xetSMnzNtz2tm9f
	 zbaeldLwVzex44r73QZwP9GnUMKz1kaUzpKffLxv3yLvpVGKeWkFpMmjI1GAcEzprw
	 zGy1xnrAH5qqxb4vddbC2ioboZY96ddAQYf+jPhyDOSQnBU26pYdoX5FZhBDWgW1vk
	 7qa6tcFU+lpfLT5ysldiobsInSIuA+Kdiul0uPVD81wI5zkeFBW8A8t3JWzC3zUhp4
	 SinyA5YbVCScmYKsKce5sm4ECEDyM/moAyqsCt9dXxH1ziPpR/a6sHfoe1Pap1yI+8
	 5JszPNpG2lxBA==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] librelp: upgrade 1.4.0 -> 1.5.0
Date: Sun, 22 Mar 2020 19:00:46 +0100
Message-Id: <1584900046-14133-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

This is a bugfix release:

- bugfix: too late termination of relp Engine on shutdown
  When librelp is instructed to shutdown, it processes messages
  still present inside its receive buffers. It only terminates
  when it needs to wait for new data to arrive.
  Depending on RELP and TCP window size and message length,
  this may cause many messages to be processed while in shutdown.
  Even with default settings, up to 128 messages may be taken off
  the wire and be processed.
  This is a problem regarding the shutdown timing of a librelp
  user (e.g. rsyslog). It may take unexpectedly long to shutdown
  the RELP component and as such timeout may occur in the caller
  code. This is especially the case if the caller does lengthy
  processing when a RELP message is received. Note: It is
  perfectly fine for a caller to do this. The problem is that
  librelp continues to provide new data for a relatively long
  and unexpected period.
  This fix ensure that the relp engine shuts down much quicker
  when shutdown is requested. It now also checks the shutdown
  request while processing already received buffer data.
  This problem was detected when working on
  see also https://github.com/rsyslog/rsyslog/issues/3941
  closes https://github.com/rsyslog/librelp/issues/175
- build system fix: invalid default in configure help text
  closes https://github.com/rsyslog/librelp/issues/169
- error message on invalid TLS library request added
  This way an invalid TLS library (name) can be detected and the
  error presented to the user. So far, invalid library names were
  hard to find.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-extended/rsyslog/{librelp_1.4.0.bb => librelp_1.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/rsyslog/{librelp_1.4.0.bb => librelp_1.5.0.bb} (87%)

diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.4.0.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.5.0.bb
similarity index 87%
rename from meta-oe/recipes-extended/rsyslog/librelp_1.4.0.bb
rename to meta-oe/recipes-extended/rsyslog/librelp_1.5.0.bb
index 16c63a7..a466314 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.4.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.5.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "gmp nettle libidn zlib gnutls openssl"
 SRC_URI = "git://github.com/rsyslog/librelp.git;protocol=https \
 "
 
-SRCREV = "e96443dda3c080fa991decec26bc4ac98d24b9a2"
+SRCREV = "0beb2258e12e4131dc31e261078ea53d18f787d7"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4

