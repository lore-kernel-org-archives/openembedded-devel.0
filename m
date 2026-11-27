Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10270.1795753039127163997
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=bmU569ib;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b24f4b15c4so3542353c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753038; x=1796357838; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UweNCD48+GNabgxCKDsV2lamNa6GCuLhNlydn1tDSeQ=;
        b=bmU569ibpaduqzg6rPtPhiXf/1c/4OuzgzL603oPUsaMdnoZR/1GxhMSHWT840GILv
         xccKN5av0pJzW19umfvpwoe1u7E9uugTgbwpCEiD10dppyMKOorWCiAeaavQAYa8I7dC
         gvGDkcaf+i1PwXmwgUTJbelpBk6Bu9wQot49KEcloGJUMoyYyLk7lsBPckGBJeWD6lap
         I2KB2ZeC8gYrnPuAluWtSsI6gjptx4af3mJ/eBUOOqj24+lpLNmcL69AUiLq8hqbWve5
         1fomKUNkYPbEOpIekdky8cdpnr6Qv4p55cE9idUz+2pDzo/MOEtRVli9u0vwj1LI919H
         MGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753038; x=1796357838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UweNCD48+GNabgxCKDsV2lamNa6GCuLhNlydn1tDSeQ=;
        b=0nNiFcrFk0CZB+R3EF1hD/hiU7iRVwxoINGrWiA+lzJONXscRzZDlOvRRZUFnaP6Pk
         EZLs2K+dpUne6uFx2udTEIk5P28SjOq380CoGK5vo0/fcoYEhhj4L5G+opzMOEK2daEq
         k7WrH1Gm67spgqotrAkpZLEn5z/FxlM3WAq4R3bf8SwQ3v1PfGcAmbyHCqIUaELNx0MI
         wjOVH6YEYum8ZTnJQmOWcdoW5sKlXTYQLeYTO09iEP/mMExu3Vx2t+sXj6D0d3GeCjDs
         gjxAAb/SSl92FupibQqrJ8RFovl6ExLYIKy2JrFqcQ2CJ5ALb0oTtwnQDmKaKtl/S0vh
         FXMA==
X-Gm-Message-State: APuU4Z/LUFbobELVZJxcl+GqjscbsZ4HHllB5xRr01jybYmnQFRN/cKS
	Gtz0+wJhcEQUze1JLmuhN2awURylJWu+6hUxaZvKftoeZt8QuJdgH+hSoynYf8qb
X-Gm-Gg: AZFdTZeTHSbXbFDfFzpWSxZ1gq5KluN40q0LKjrnalT2qgFaMvwXU/KbehHrIu1i+Or
	rn/RHKBMwwMui7cnXdmbzQh25hv3vPaJ0UmZsbxM1eQNf/6/ZQ11V4mSVQS1WGmYKLMZ4170WGw
	bWuRZKVRXh2t6KxIS5qv4RBl9yqsaFsQiIHTX04msfZ7gebnJ15it6nwa24QmEkMoiUbPekfhXg
	WLfYzYYzf37n4jhsUyF5qD5kSghbsRqSN/MjZJVdgUsGRunGkZjkbDa8gPp3diJf2TcgKvnva0s
	s1v96FZ9C6is3co1eUf7kgyI+M5jV7XEcqPH7LngsGa6lpQkmpRCbj3+SfUx6uhb7gjV/tYln9u
	DkngrohcBkN0JN2rSFhLrauIWbRAH78FWpUnez5rJhyKPnmG0NPBwks8Fv5RzLU7VPLEmzmaGM4
	d/guwXNy+3c6bNzE0YCoeFyO+Z2JJHyZIJbQlWdCfVTqLoM2AHRKIaNtQ/PlWbhV2uw4U7r3X1k
	ZhbIVgeUis05guEEtW6ghSd3JODI1m++r12A8PjjweoCoOtfHgvuHtAHDD8c1Cg9zoRtQTEOMA+
	R7ZjaKm8Hxx30SBkGdNBjeXtplckUvo49H4q04zvSIGdzmiM7oBDkPXd7+73ioo0u/1DwmiIsGm
	tOZQlw7QF50R5t1YwMtkJB1s5HbeLGJjZTQ3ok5QvJaC9Rq1g3QbPo9lxoCkDZ2CD9mW5JogmTg
	rIJa8jbtgIRKf+ItGboMZb09TTVq1MiPQVLPWjtDi1PhYBjWE9Je58ts6Zru0Qh2xe2m1Br1j6j
	Vf7n5hp9v5ypUSxVeC0XWVM1erz6t/BJbPLU/oV87kMUvo5vs3w0dDe0hBlLcLbeyR9QyL2WwTY
	2XxA
X-Received: by 2002:a05:7023:a8c:b0:1b5:4d7b:9ea8 with SMTP id a92af1059eb24-1b55692849fmr24127184c88.20.1795753038380;
        Thu, 26 Nov 2026 20:17:18 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 00/35] Upstream version check fixes
Date: Thu, 26 Nov 2026 20:16:40 -0800
Message-ID: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133252
Content-Type: text/plain; charset="utf-8"

Fix or add UPSTREAM_CHECK_* settings so devtool check-upgrade-status
reports real versions. No recipe versions change in this series.

Khem Raj (35):
  bluez-tools: Fix upstream version check
  cannelloni: Fix upstream version check
  daq: Restrict upstream check to the 2.x series
  mbedtls: Restrict upstream check to the 3.6 series
  nng: Fix upstream version check
  networkmanager: Fix upstream version check
  ot-br-posix: Fix upstream version check
  ot-daemon: Fix upstream version check
  wpantund: Fix upstream version check
  snort3: Fix upstream version check
  sshpass: Fix upstream version check
  vpnc: Fix upstream version check
  ippool: Fix upstream version check
  openhpi: Fix upstream version check
  kronosnet: Restrict upstream check to the 1.x series
  dante: Fix upstream version check
  nopoll: Fix upstream version check
  openflow: Fix upstream version check
  openl2tp: Fix upstream version check
  pptp-linux: Fix upstream version check
  tsocks: Fix upstream version check
  xl2tpd: Fix upstream version check
  bmon: Fix upstream version check
  celt051: Restrict upstream check to the 0.5.1 series
  esmtp: Fix upstream version check
  fetchmail: Fix upstream version check
  nbd: Fix upstream version check
  ncp: Fix upstream version check
  ypbind-mt: Fix upstream version check
  ntimed: Fix upstream version check
  nuttcp: Fix upstream version check
  ssmping: Fix upstream version check
  open62541: Anchor upstream check
  cim-schema: Mark upstream version as unknown
  ndpi: Fix upstream version check

 .../recipes-connectivity/bluez-tools/bluez-tools_git.bb       | 1 +
 .../recipes-connectivity/cannelloni/cannelloni_2.0.0.bb       | 2 ++
 meta-networking/recipes-connectivity/daq/daq_2.0.7.bb         | 4 ++++
 meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.7.bb | 3 ++-
 meta-networking/recipes-connectivity/nanomsg/nng_2.1.0.bb     | 2 ++
 .../networkmanager/networkmanager_1.58.1.bb                   | 3 +++
 .../recipes-connectivity/openthread/ot-br-posix_git.bb        | 2 ++
 .../recipes-connectivity/openthread/ot-daemon_git.bb          | 1 +
 .../recipes-connectivity/openthread/wpantund_git.bb           | 1 +
 meta-networking/recipes-connectivity/snort/snort3_3.12.2.0.bb | 2 ++
 meta-networking/recipes-connectivity/sshpass/sshpass_1.10.bb  | 3 +++
 meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb       | 2 ++
 meta-networking/recipes-daemons/ippool/ippool_1.3.bb          | 3 +++
 meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb      | 3 +++
 meta-networking/recipes-extended/kronosnet/kronosnet_1.36.bb  | 3 ++-
 meta-networking/recipes-protocols/dante/dante_1.4.4.bb        | 3 +++
 meta-networking/recipes-protocols/nopoll/nopoll_0.4.9.b462.bb | 2 ++
 meta-networking/recipes-protocols/opcua/open62541_1.5.10.bb   | 2 +-
 meta-networking/recipes-protocols/openflow/openflow_git.bb    | 3 +++
 meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb    | 3 +++
 .../recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb         | 3 +++
 meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb   | 3 +++
 meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb     | 2 +-
 meta-networking/recipes-support/bmon/bmon_5.0.bb              | 3 +++
 meta-networking/recipes-support/celt051/celt051_git.bb        | 2 ++
 meta-networking/recipes-support/cim-schema/cim-schema.inc     | 3 +++
 meta-networking/recipes-support/esmtp/esmtp_1.2.bb            | 3 +++
 meta-networking/recipes-support/fetchmail/fetchmail_6.6.6.bb  | 3 +++
 meta-networking/recipes-support/nbd/nbd_3.27.1.bb             | 2 ++
 meta-networking/recipes-support/ncp/ncp_1.2.4.bb              | 3 +++
 meta-networking/recipes-support/nis/ypbind-mt_2.7.2.bb        | 3 +++
 meta-networking/recipes-support/ntimed/ntimed_git.bb          | 1 +
 meta-networking/recipes-support/ntopng/ndpi_6.0.bb            | 2 ++
 meta-networking/recipes-support/nuttcp/nuttcp_8.2.4.bb        | 3 ++-
 meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb      | 3 +++
 35 files changed, 82 insertions(+), 5 deletions(-)

