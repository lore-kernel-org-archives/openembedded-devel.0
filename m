Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909D4ECAAA1
	for <webhook@archiver.kernel.org>; Sun, 30 Oct 2022 18:50:45 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web12.981.1667155843402349311
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Oct 2022 11:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fZgJtgcS;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id n18so7227842qvt.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Oct 2022 11:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLLfAgqqBEcknxsrAimtwQjudY33o0f0Auu8jaBwsPQ=;
        b=fZgJtgcSsQ2furjJmfmpYybsvjngeyuTHz8lLBIxB9JvbnRmJrS4B+0MChDPyANYZp
         OxRNMNrtTKc99BqNIyXawopIaivlqAxz86fMvHqoZXS2p1wr+rv9z1MWpd7XeaH8IUE9
         KVXxWTh7djN+tq4LhWVUUzJPsnHlTNYIxy3xXOcsQ0HZVL8hl9dnJM5xVbyNGiDos6yR
         AzZQcpn4sk3nw530TCn1Acc1gEMt8pmvO9P3TJmKqjJxvTEgL2rJVqAlfbBwWHg2J/Qs
         3T8s1v3o0/azAqGwCSG80DPG7LUIii30piVTq5S0rmkxrup6SwIunZRbx0eGraFQAuvB
         xGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QLLfAgqqBEcknxsrAimtwQjudY33o0f0Auu8jaBwsPQ=;
        b=mZLoozMoUMYdFmN8CZwPFHX3NqiFkFA5p7rRW6R4Em9tT2LX4eWkCXmRzWlfoNKwD+
         BJU56HchVXBBr4NUbJhdhOLaEcfsvbw9Cj7rgbwTwGsaS4k7xLreNeBytfus9dNTRo0G
         VMm8jbrJLIj8+NrT5pzNE06CA7EuPFiil8Ip3v+AObcP6McamlYaNurDdPwNtyuhqIGz
         fqVe9m8SuNRqZkel75+sUw/FkQ3Q7eS1753CmUrEXwnpC6nF9esmmFrBfJbfCrNQdjx8
         g50UcRqw1AHDrsrViG2w2qzAJetEFaou8XWTHDTrQMf94Ge2sb2aVAQWtPoKoKuJeY9h
         rglg==
X-Gm-Message-State: ACrzQf0wGPRtcxgwr9XspInNDXCoW/YgAVakYVZ4ac9rsrtmiRGhe0lA
	nPNv6bmN6pjRZbnbAkQwCW8=
X-Google-Smtp-Source: AMsMyM4tqLK3dEckaADgZQrXWAoeeEe6B/ugTPx2Upanwh0HVh8UAK+tM0b5TlXR3p01i4K/qNfPMQ==
X-Received: by 2002:ad4:5945:0:b0:4bb:7357:d0ce with SMTP id eo5-20020ad45945000000b004bb7357d0cemr8473348qvb.74.1667155842433;
        Sun, 30 Oct 2022 11:50:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:2fe9:baea:123c:ddf6? ([2600:1700:9190:ba10:2fe9:baea:123c:ddf6])
        by smtp.gmail.com with ESMTPSA id g1-20020ac84681000000b003a4d5fed8c3sm2539217qto.85.2022.10.30.11.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Oct 2022 11:50:42 -0700 (PDT)
Message-ID: <ba7c7560-4a2d-717d-1c1e-644dd04ccea5@gmail.com>
Date: Sun, 30 Oct 2022 14:50:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
From: akuster808 <akuster808@gmail.com>
Subject: dunfell merge request: Oct 30th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Oct 2022 18:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99351

The following changes since commit 6792ebdd966aa0fb662989529193a0940fbfee00:

   c-ares: upgrade 1.17.2 -> 1.18.1 (2022-09-11 13:49:52 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to 7203130ed8b58c0df75cb72222ac2bcf546bce44:

   [dunfell] wireguard: Upgrade to 1.0.20220627 (module) and 
1.0.20210914 (tools) (2022-10-30 14:47:43 -0400)

----------------------------------------------------------------
Colin Finck (1):
       [dunfell] wireguard: Upgrade to 1.0.20220627 (module) and 
1.0.20210914 (tools)

Hitendra Prajapati (2):
       postgresql: CVE-2022-1552 Autovacuum, REINDEX, and others omit 
"security restricted operation" sandbox
       dnsmasq: CVE-2022-0934 Heap use after free in dhcp6_no_relay

Mathieu Dubois-Briand (1):
       networkmanager: Update to 1.22.16

  .../{networkmanager_1.22.10.bb => networkmanager_1.22.16.bb} |   3 +-
  ...0001-compat-SYM_FUNC_-START-END-were-backported-to-5.4.patch | 29 -
  ...1-compat-icmp_ndo_send-functions-were-backported-exten.patch | 32 -
  .../recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb   | 30 -
  .../recipes-kernel/wireguard/wireguard-module_1.0.20220627.bb   | 23 +
  ...rd-tools_1.0.20200319.bb => wireguard-tools_1.0.20210914.bb} |   4 +-
  .../recipes-support/dnsmasq/dnsmasq/CVE-2022-0934.patch         | 188 
++++++
  meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb         | 1 +
  meta-oe/recipes-dbs/postgresql/files/CVE-2022-1552.patch        | 947 
++++++++++++++++++++++++++++
  meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb               | 1 +
  10 files changed, 1164 insertions(+), 94 deletions(-)
  rename 
meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.22.10.bb 
=> networkmanager_1.22.16.bb} (98%)
  delete mode 100644 
meta-networking/recipes-kernel/wireguard/files/0001-compat-SYM_FUNC_-START-END-were-backported-to-5.4.patch
  delete mode 100644 
meta-networking/recipes-kernel/wireguard/files/0001-compat-icmp_ndo_send-functions-were-backported-exten.patch
  delete mode 100644 
meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb
  create mode 100644 
meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20220627.bb
  rename 
meta-networking/recipes-kernel/wireguard/{wireguard-tools_1.0.20200319.bb 
=> wireguard-tools_1.0.20210914.bb} (84%)
  create mode 100644 
meta-networking/recipes-support/dnsmasq/dnsmasq/CVE-2022-0934.patch
  create mode 100644 
meta-oe/recipes-dbs/postgresql/files/CVE-2022-1552.patch

