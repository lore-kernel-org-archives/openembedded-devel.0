Return-Path: <joe@deserted.net>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 909F671B27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 18:11:15 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id n137so29273581iod.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 11:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id;
	bh=+Mt0QstIGms5zvUsP2SdrsP68BcUjXpTfzedE7ED6lI=;
	b=vZbWxH6r2FoKTjhuk9UqQmc+BPcyi9AVZIRYUbfyUAMeB5D8hVLtFljcjSjSXVZXZv
	5lnscU2wRuXu96/6an61c1aBe0zmVVs+ktb8EEAaxsQEVgyLcD4FInvnyAsh/qSKdiZC
	H2KO1CX7WSCG35It0xfbKSC/YNTbVvYZ66K7fTLaguGPDdGvE+IJkU4VJBv6ueCrx6OX
	Jo8KytO+5l466iWEOQd0XPw6AC2bFgkjPOOByitehph5WyH3A0jwWhSDD4GXRm/KHPmm
	+XpU6l98Wl0GAYUniAsEakBuZ4XUl3UK7F9nQvHXRl6HhiuDrTUZVMw4Zr60IaQ8Ncds
	q9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=+Mt0QstIGms5zvUsP2SdrsP68BcUjXpTfzedE7ED6lI=;
	b=PaBBLUSxuOpnE+yRSP38qR3748XSDZoBCPko0oeBnGw7wiQk9dOjyXakZ6V0nbHNXK
	980KWKk162+ZAFehAFEBVKxZp9fLpCNBMNMzeFojXZ24ioZUVeMdAsk95tylKlcuMRzb
	IDg7eqQoxU8+5OU5VD9sa7Ue82NE3gSds+rwDoYsDhGWaHfvKO3+iCckAA4f33AHA3pp
	P7q55LRA0N3caBnWzSaN8GMMITxo2pnc3svi9n9nacQqls2GDYbOjKTX8RjJ80HT+wBb
	aIlcDJo0h6KHQ2l5asxMa1ZxWfJQYKew6mGpKDfoPZLdZ5PxktGOuWRPvsS03+eW0P83
	toTg==
X-Gm-Message-State: AMCzsaXRx30pzLH75t7WbbANV46rfU4UH/eyedlwbTZGJd25ph9HgPzl
	CD8ezs0ZX2N0CS90Vs7kd4WfpO5c
X-Google-Smtp-Source: ABhQp+QK51FXq62x9dB1S+BSDMQCW4u5IgYsNWuq8DsW+xisn5Mwr1zBaOWJHdbicXWcCPaK8Zs0wg==
X-Received: by 10.36.83.202 with SMTP id n193mr7236951itb.134.1509387076253;
	Mon, 30 Oct 2017 11:11:16 -0700 (PDT)
Received: from mir.deserted.net (23-233-29-148.cpe.pppoe.ca. [23.233.29.148])
	by smtp.gmail.com with ESMTPSA id
	81sm2182416itl.20.2017.10.30.11.11.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Oct 2017 11:11:15 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Oct 2017 14:11:07 -0400
Message-Id: <1509387073-21934-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH 0/6] meta-networking patchwork cleanup
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
X-List-Received-Date: Mon, 30 Oct 2017 18:11:15 -0000

When I started comparing the state of meta-networking/master to master-next and
to patchwork's own view of pending meta-networking patches I found some
disconnects.  So I've been chipping away at this for the last few days, trying
to bring everything in sync.

I've rejected/accepted the patches in patchwork that I was able to verify have
either been rejected or merged already.

ddclient died on the vine for no particular reason, so I refreshed it and added
the persistence support as noted in the patch itself.

Following that was Jackie's update to include freediameter, but it depended on
the currently-broken lksctp-tools, so I took a stab at fixing that.

There was a pending update to bridge-utils for using the xtools AR, but that
needed rework, so I did the rework and updated bridge-utils at the same time.

Finally, most of openssl-no-weak-cyphers was thrown away for good reason, but
two of the patches still made sense to include in meta-networking, IMO, with
just some minor rework, so I did that too.

Here's the report:

Jackie Huang (2):
  freediameter: add new recipe
  net-snmp: support openssl without 3des

Joe MacDonald (2):
  lksctp-tools: update and remove from blacklist
  bridge-utils: update to v1.6

Kai Kang (1):
  stunnel: fix compile error when openssl disable des support

Kinsella, Ray (1):
  ddclient: new package

 .../recipes-daemons/ddclient/ddclient_3.8.3.bb     |  44 ++++
 .../recipes-daemons/ddclient/files/ip-up           |   4 +
 .../recipes-daemons/ddclient/files/persistent      |   1 +
 ...murhash-algorithm-with-Robert-Jenkin-s-ha.patch | 223 +++++++++++++++++++++
 .../freediameter/files/freediameter.init           |  72 +++++++
 .../freediameter/files/freediameter.service        |  11 +
 .../freediameter/files/install_test.patch          |  22 ++
 .../freediameter/files/pass-ptest-env.patch        |  72 +++++++
 .../recipes-protocols/freediameter/files/run-ptest |  11 +
 .../freediameter/freediameter.inc                  |  98 +++++++++
 .../freediameter/freediameter_1.2.1.bb             |   7 +
 .../net-snmp/net-snmp-fix-for-disable-des.patch    |  32 +++
 .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   |   4 +-
 .../recipes-support/bridge-utils/bridge-utils.inc  |  28 ---
 ...ld-error-out-correctly-if-a-submake-fails.patch |  69 -------
 ...idge-fix-some-build-time-warnings-fcntl.h.patch |  64 ------
 ...idge-fix-some-build-time-warnings-errno.h.patch |  46 -----
 ...dd-missing-include-s-fix-build-against-mu.patch |  47 -----
 ...uild-don-t-ignore-CFLAGS-from-environment.patch |  29 +--
 ...ridge-Modifying-the-AR-to-cross-toolchain.patch |  51 +++++
 ...5-check-error-returns-from-write-to-sysfs.patch |  87 --------
 ...5-fix-error-message-for-incorrect-command.patch |  33 ---
 ...utils-1.5-fix-incorrect-command-in-manual.patch |  33 ---
 .../bridge-utils/bridge-utils/kernel-headers.patch |  29 ++-
 .../bridge-utils/bridge-utils_1.5.bb               |  16 --
 .../bridge-utils/bridge-utils_1.6.bb               |  35 ++++
 .../lksctp-tools/lksctp-tools_1.0.17.bb            |  16 +-
 .../stunnel/stunnel/fix-openssl-no-des.patch       |  54 +++++
 .../recipes-support/stunnel/stunnel_5.35.bb        |   4 +-
 29 files changed, 776 insertions(+), 466 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
 create mode 100644 meta-networking/recipes-daemons/ddclient/files/ip-up
 create mode 100644 meta-networking/recipes-daemons/ddclient/files/persistent
 create mode 100644 meta-networking/recipes-protocols/freediameter/files/Replace-murmurhash-algorithm-with-Robert-Jenkin-s-ha.patch
 create mode 100755 meta-networking/recipes-protocols/freediameter/files/freediameter.init
 create mode 100644 meta-networking/recipes-protocols/freediameter/files/freediameter.service
 create mode 100644 meta-networking/recipes-protocols/freediameter/files/install_test.patch
 create mode 100644 meta-networking/recipes-protocols/freediameter/files/pass-ptest-env.patch
 create mode 100644 meta-networking/recipes-protocols/freediameter/files/run-ptest
 create mode 100644 meta-networking/recipes-protocols/freediameter/freediameter.inc
 create mode 100644 meta-networking/recipes-protocols/freediameter/freediameter_1.2.1.bb
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-disable-des.patch
 delete mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils.inc
 delete mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils/0001-build-error-out-correctly-if-a-submake-fails.patch
 delete mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils/0002-libbridge-fix-some-build-time-warnings-fcntl.h.patch
 delete mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils/0003-bridge-fix-some-build-time-warnings-errno.h.patch
 delete mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils/0004-libbridge-add-missing-include-s-fix-build-against-mu.patch
 create mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils/0006-libbridge-Modifying-the-AR-to-cross-toolchain.patch
 delete mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-check-error-returns-from-write-to-sysfs.patch
 delete mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-fix-error-message-for-incorrect-command.patch
 delete mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-fix-incorrect-command-in-manual.patch
 delete mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils_1.5.bb
 create mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils_1.6.bb
 create mode 100644 meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch

-- 
2.7.4


