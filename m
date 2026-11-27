Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11829.1795763043129216329
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:04:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=fmgQDWOk;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso3300356a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795763042; x=1796367842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lQa9dko6Irih6Pe46V/BqZv3enhg6AhDtobWfB4CJIc=;
        b=fmgQDWOkCkb0dsrJ+VXcxgky43HIxjEeRVKpWPLEC11k541L7eERauDHi527icyIoq
         zGNqx56vpbwemLww9bpCTyIxg0QsG+nnn4SkVQeWwmQdxweQs7FrvRHWH79MQYC7+Pap
         rHxPXJrpOq5Bf52C7IAUM1/YLGNX9aIGYpCsdaQ+vuuxRSM191IZf/RFAtvmpsBiY1Bu
         mGkq60m5HB6aA/+UWBaSwIorRWPCmnFDcqtebyCPSyy/Cl3buGRw7t55QQaQf1Y3dj/1
         29SbdjjtdFMlkaqQtNndrBAHv5r2mtKiWRO+KYNn47U30imXI+iKKJwki8mZtLL6MTaL
         cgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795763042; x=1796367842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lQa9dko6Irih6Pe46V/BqZv3enhg6AhDtobWfB4CJIc=;
        b=qUsVZtant81ET2R+wTKQ5w/HoM9Ispyi7Qro4p+BWQY8FEqB9dQizmc+itv4pGr12H
         UHRhCch9R3De1jv2L6HZ4rhtwZPoaEn/K0hPJmQ7MWBA+F4o3K7b9OgfH5Yb5zmSBawz
         RWz9ZNVxcLa2XIwHqxV/VgzYJyq1xTgbvhO/zOKqa+ZPhDNNNAGmY/UtEIzhVOpdPwkH
         mV/WLwCb8d07R7KpTn5wjiAjAMJTWZ/RAVjSp9JhTPn5aojDC55/KKm3PXrV0ctV3XlA
         V1hdLYXTifQpT73QPzWHnEH4aboUPVsD+QfU1SgCoZPern54xHy2RJg5EOBsK8K0zw4V
         qDyw==
X-Gm-Message-State: APuU4Z9JFIhZ9/eEIRVyTH3R9XhCVF3lXNzGg8EMX8SHzpZ34E39S3mY
	L88WJ/ZbIluB+g295b91Dt0/Xy0ZPt4oF8F1J85RCMfDNMYeobdZH9cHciuxjQ==
X-Gm-Gg: AZFdTZdG+WP6bqYB+Rh2KiLWXaBrS/iL0fWSEUdI+AontYuvEhgoLIum63sn5QnRzm5
	4lDdnOiifD+VLDhydBbnx6M2ChzTUfGn5qx7dYUiMO1Kd5vKUpG6fx/cdvHFVbqfvDqLtB2T2aq
	zdsNN/eZ3hprnJFvWNv3Mshzf/CYeFdeAl/YEIYcLLsTqkdP5+rObS52LJZAcoAKkanljJIWoUA
	QZ+mUb3YzvjkTfIcDbyrhJZcvzNtObXnhAta8R6JP2RVVZUuAO27enU1QutEI+Py48kD2jz4us0
	5e2CRJlVdWqqddedkHuCN5Rbs6kzcSmzcamt8FRqYHnas6B9SUIjQl0GSmCngQlPQH+uMRk0DAi
	wCX4zsbJ3IALb5uxMAwoAajInV8r38VQHB3lklzlFW1gLpBvcTa7SEmoX4wNvO83EvAT2Obznyf
	2LLtnK/Cn7dHx3oShvRi+O5aneNN8JhghrYosURjk8X2HfUzEVYG4ubV+qWIKwOtylVJkPgQlkQ
	kDRpCPmAmPK0sQdVUXuunEmyzGyWufHttDzg17tNY33qHvHkkQ/A3drXCJgx4/UfctaEyOFvUDu
	CSSPye3Mh41HsFUXkNYU7thxcsXNRu3jgCzQ22to50V4qRdUVGl0wZQ4vZ7Qw1IwPjl7k13sOoZ
	XLbd6J8sP+wFgZRZr1dBgtDQAoqK4gHOMpgvN6k2qJ19Wun9dJ91cSXrnuqQTzcJkREbshcq1fy
	YxJQMzzR7vux20Pmg9Zeiukp5KFJwtHB1Xe+FCR2mty/ln8wZb6aS7SvjNkcqh+w0jroE2dnRH6
	L6x3G0QegoJpPMP3S1MrMgH3sl0OiUYiCZ5HmKEtX9QxgnvnJBbDDPrPeVPWW/aqC7uBjFBMDrY
	eE8HRA==
X-Received: by 2002:a17:90b:5109:b0:3ac:97bc:4c98 with SMTP id 98e67ed59e1d1-3b41c9bc501mr21174644a91.64.1795763042333;
        Thu, 26 Nov 2026 23:04:02 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578dca0sm39785288a91.2.2026.11.26.23.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:04:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-xfce][PATCH 0/2] libxfce4util and xfce4-dev-tools upgrades
Date: Thu, 26 Nov 2026 23:03:55 -0800
Message-ID: <20261127070359.2405078-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:04:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133369
Content-Type: text/plain; charset="utf-8"

xfce4-dev-tools 4.21.3 moved to meson; libxfce4util 4.21.1 is a bug fix
release.

Khem Raj (2):
  libxfce4util: upgrade 4.21.0 -> 4.21.1
  xfce4-dev-tools: upgrade 4.21.2 -> 4.21.3

 ...4util_4.21.0.bb => libxfce4util_4.21.1.bb} |  2 +-
 ...0001-Run-native-xdt-csource-on-tests.patch | 30 +++++++++----------
 ...ls_4.21.2.bb => xfce4-dev-tools_4.21.3.bb} | 18 +++++------
 3 files changed, 25 insertions(+), 25 deletions(-)
 rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.21.0.bb => libxfce4util_4.21.1.bb} (82%)
 rename meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.21.2.bb => xfce4-dev-tools_4.21.3.bb} (55%)

