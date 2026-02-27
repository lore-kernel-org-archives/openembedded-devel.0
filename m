Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDAB5FD9E2C
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 12:03:31 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.94119.1772193807863898377
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 04:03:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mDbewCB8;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-65c01595082so3300599a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 04:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772193806; x=1772798606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0c9HyJG7QgCO3DZE8wvW1VLwOSaY1f0x3f2+t7dwrE=;
        b=mDbewCB8C9jsCexldvIiXW+8lHQ4GchaWoProp9ZeizUNeJFl40GmNfi978ZZgHn5I
         Hp/x9NvWX4jpK0RFoYr5xr3wgxjm4pC41G/4x6h1icNNFGCVyHNfHAtgoLzdFJnssGaM
         cj8SF/LsGmIuBWDSwjukMvT+tkPyXArEzFcjMoPp54LQLltlbdnxpixcNhp+Bz12nARK
         +5gd7wFk8V2qh77AjZf6otF5rNFqgMXI4MUD70jsR5JYKoaqxNd7VmW+tHi0i/YyMW45
         MBMXK5DKzvBSRB8znAeJ2HofTxvTUJqF7jJHJtbQIE4pFWT0QCqXoZgCkBiqqsR1PmOD
         gCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772193806; x=1772798606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R0c9HyJG7QgCO3DZE8wvW1VLwOSaY1f0x3f2+t7dwrE=;
        b=rZzMEQMTbciG1GeGMz73u+jjAjiOOhsrAu8ixHdc9sPQbSVx9VnRar6kFuw8H0Dq7Z
         ZWKOjVOYn0aEO5c6wqt6IvdqwvitDFgd7S1LYPj9AL8qe28q8b1FvUhdjQIf39I2ihKe
         IcoCecuEtZfqIvSnsLriR37g+o9bXPbf+xep/LeYdJR1Yujt3App5YxXy3FzLwhzgIat
         s+DP7LrVaa5O0BOZ4bHKFI2ZxjFC82kAOZM6dvyN+TzA54Ad7VPgTMzmbrvHJv2ppSt0
         nHeRjtnBwg27ae+zJVV5EoYC8joXJtuNOtfcQhpCAfvYJ9r2eItiEqK32JFwUsqEDZhj
         Qi+A==
X-Gm-Message-State: AOJu0YxmC2yx5NCesi1xQqpBZzva+sQme5dAwd/E1nzgPxA2RoNLHx6M
	ffDH2fki9R6Kk0cAOpjvD9fNR2ApHiyvD668C/JqdqvLgY+T3fYcXXnjdROMnw==
X-Gm-Gg: ATEYQzzqxVirqHnNKqiighIUsUoi/Y+m+v9uE/3ePoj5M5gOGCnnhv5uYfCzdYLhGr6
	s5Z+UM24e513l5KAs9T2VIBUqj/NeM0QkYDCnZrmfg2Bj5R6nJKc2W1figU5Mls/gvSBhGiVivk
	mVpbmukZx0pdaI9hF2o7+tMmP0fqH9NCrWj+1gqTts/AADdvZjeZThETA+19CyPIjy0FUk/+Zjh
	0PJQAC6cG2veSLJRzARK290S8QVG93mmvXsIbow401y1R4PkYmLaiG87lgkzDrYTdzX2mfyJb64
	UF94tT9eHQvaF/W/qxtbuD2nBlsnwzNkvuuOphu9orxH4OfmdV+Iu2OZWnP3zTcCxO82ogoV38G
	7pjLkwQr6QVb+BwwZTUYMNaHSwEP9SGegON7yogSRF4u5S5h7iOglTXGvgnXkBzK6274Q5D6H1J
	PXJLzEnLbmc/scZeBCPeEv
X-Received: by 2002:a17:907:9450:b0:b93:6bb6:cb3d with SMTP id a640c23a62f3a-b9376573d38mr162924766b.58.1772193805842;
        Fri, 27 Feb 2026 04:03:25 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c70ff6esm9829566f8f.12.2026.02.27.04.03.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 04:03:25 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 2/5] quagga: patch CVE-2017-3224
Date: Fri, 27 Feb 2026 13:03:20 +0100
Message-ID: <20260227120323.333696-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227120323.333696-1-skandigraun@gmail.com>
References: <20260227120323.333696-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 12:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124754

Details: https://nvd.nist.gov/vuln/detail/CVE-2017-3224

Quagga is an abandoned project, but it is not without a successor.
Frr (or Frrouting) is a fork of Quagga, and they have fixed this
vulnerability. That patch from Frr was ported to Quagga.

The Frr patch mentions this CVE ID explicitly, and also Debian
has identified it as the correct patch[1].

[1]: https://security-tracker.debian.org/tracker/CVE-2017-3224

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../quagga/files/CVE-2017-3224.patch          | 90 +++++++++++++++++++
 .../recipes-protocols/quagga/quagga.inc       |  3 +-
 2 files changed, 92 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/quagga/files/CVE-2017-3224.patch

diff --git a/meta-networking/recipes-protocols/quagga/files/CVE-2017-3224.patch b/meta-networking/recipes-protocols/quagga/files/CVE-2017-3224.patch
new file mode 100644
index 0000000000..025f0b3e4f
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/CVE-2017-3224.patch
@@ -0,0 +1,90 @@
+From 5e54975af4c6429f5e7bf9a29ff8425e131e92ca Mon Sep 17 00:00:00 2001
+From: Chirag Shah <chirag@cumulusnetworks.com>
+Date: Fri, 25 Jan 2019 17:21:24 -0800
+Subject: [PATCH] ospfd: address CVE-2017-3224
+
+Based on the vulnerability mentioned in 793496 an attacker can craft an
+LSA with MaxSequence number wtih invalid links and not set age to MAX_AGE
+so the lsa would not be flush from the database.
+
+To address the issue, check incoming LSA is MaxSeq but Age is not set
+to MAX_AGE 3600, discard the LSA from processing it.
+Based on  RFC-2328 , When a LSA update sequence reaches MaxSequence
+number, it should be prematurely aged out from the database with age set
+to MAX_AGE (3600).
+
+Ticket:CM-18989
+Reviewed By:
+Testing Done:
+
+Signed-off-by: Chirag Shah <chirag@cumulusnetworks.com>
+
+CVE: CVE-2017-3224
+Upstream-Status: Inactive-Upstream [ported from frr, a fork: https://github.com/FRRouting/frr/commit/7791d3deab8f4bbee2ccdd98ea596617536bc681]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ ospfd/ospf_packet.c | 21 ++++++++++++++++-----
+ 1 file changed, 16 insertions(+), 5 deletions(-)
+
+diff --git a/ospfd/ospf_packet.c b/ospfd/ospf_packet.c
+index facba89..504df02 100644
+--- a/ospfd/ospf_packet.c
++++ b/ospfd/ospf_packet.c
+@@ -1936,9 +1936,20 @@ ospf_ls_upd (struct ospf *ospf, struct ip *iph, struct ospf_header *ospfh,
+       if (current == NULL ||
+ 	  (ret = ospf_lsa_more_recent (current, lsa)) < 0)
+ 	{
++          /* CVE-2017-3224 */
++          if (current && (lsa->data->ls_seqnum ==
++            htonl(OSPF_MAX_SEQUENCE_NUMBER)
++            && !IS_LSA_MAXAGE(lsa))) {
++              zlog_debug(
++                "Link State Update[%s]: has Max Seq but not MaxAge. Dropping it",
++                dump_lsa_key(lsa));
++
++              DISCARD_LSA(lsa, 4);
++              continue;
++          }
+ 	  /* Actual flooding procedure. */
+ 	  if (ospf_flood (oi->ospf, nbr, current, lsa) < 0)  /* Trap NSSA later. */
+-	    DISCARD_LSA (lsa, 4);
++	    DISCARD_LSA (lsa, 5);
+ 	  continue;
+ 	}
+ 
+@@ -1987,7 +1998,7 @@ ospf_ls_upd (struct ospf *ospf, struct ip *iph, struct ospf_header *ospfh,
+ 		if (NBR_IS_DR (nbr))
+ 		  listnode_add (oi->ls_ack, ospf_lsa_lock (lsa));
+ 
+-              DISCARD_LSA (lsa, 5);
++              DISCARD_LSA (lsa, 6);
+ 	    }
+ 	  else
+ 	    /* Acknowledge the receipt of the LSA by sending a
+@@ -1995,7 +2006,7 @@ ospf_ls_upd (struct ospf *ospf, struct ip *iph, struct ospf_header *ospfh,
+ 	       interface. */
+ 	    {
+ 	      ospf_ls_ack_send (nbr, lsa);
+-	      DISCARD_LSA (lsa, 6);
++	      DISCARD_LSA (lsa, 7);
+ 	    }
+ 	}
+ 
+@@ -2011,7 +2022,7 @@ ospf_ls_upd (struct ospf *ospf, struct ip *iph, struct ospf_header *ospfh,
+ 	  if (IS_LSA_MAXAGE (current) &&
+ 	      current->data->ls_seqnum == htonl (OSPF_MAX_SEQUENCE_NUMBER))
+ 	    {
+-	      DISCARD_LSA (lsa, 7);
++	      DISCARD_LSA (lsa, 8);
+ 	    }
+ 	  /* Otherwise, as long as the database copy has not been sent in a
+ 	     Link State Update within the last MinLSArrival seconds, send the
+@@ -2031,7 +2042,7 @@ ospf_ls_upd (struct ospf *ospf, struct ip *iph, struct ospf_header *ospfh,
+ 			  msec2tv (ospf->min_ls_arrival)) >= 0)
+ 		/* Trap NSSA type later.*/
+ 		ospf_ls_upd_send_lsa (nbr, current, OSPF_SEND_PACKET_DIRECT);
+-	      DISCARD_LSA (lsa, 8);
++	      DISCARD_LSA (lsa, 9);
+ 	    }
+ 	}
+     }
diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index d368311d13..3534114a22 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -34,7 +34,8 @@ SRC_URI = "https://github.com/Quagga/quagga/releases/download/quagga-${PV}/quagg
            file://ripd.service \
            file://ripngd.service \
            file://zebra.service \
-          "
+           file://CVE-2017-3224.patch \
+           "
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[cap] = "--enable-capabilities,--disable-capabilities,libcap"

