Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D10F33A6B
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 14:15:24 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44932.1772720117081141079
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 06:15:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IjOcg7xi;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439baf33150so3469581f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 06:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772720115; x=1773324915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GQLOOqDi/+GdWjLYLYidaHhQxlEoWgbruk5jNQqaRFY=;
        b=IjOcg7xiDG4cntEDO6c0vLw63Mbq9uCQNli3K46cjdbfXqTDW4P0cR2F/n5i/12sOW
         K+lN2QPVBVm6+xjQPonsIae6TPXOQDdd6R6FYcvkpwKZzh/8zJSOJd8p/5Gs9w9HMNDf
         sFGopjEteyVs33Qgx4XlQ2zG6AthfomRWiwx6hYUhd19xxf4QEzCqoWicLHJ5uInNFiv
         P/unTO0oXzbj1XkzZFFRU6xKrjRLi+hMHoLKCeDAHz/VrdxBJC8JrHpwI4aZtMoIlKSz
         cChoiObozIWf20+77qtOjmdPsX3ixGB4iVeiDpKD6VtOdjMXd5jeb9zjByPvbH83Owtk
         ImfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772720115; x=1773324915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQLOOqDi/+GdWjLYLYidaHhQxlEoWgbruk5jNQqaRFY=;
        b=d3f4PgLOqCumny8mgfeoJbpq4BdZ6rEhimL+4rMPLAQMJC1zoqWjMXoKvOpKUYsMRm
         38kviA1bnMxr1rDWMtr38VFbT3lMxBt4YFhSH5CsBeE2TIvfsQcVJUlEagJRtJnvL58c
         igpjT/L02Q9ZC6DJ8D90cfRgUxYQ4dGaOIZzQu7vpmhEMD3pvxXZFlvxJXg0cCF6lT6r
         PLrP1zDjvVEohg139NekjMliLqKYdIHkz05kgYsVaFvzCHdOMZ/G3PsooVVrKm1fVW23
         AInLNxBLBEQvTSKN/Yxzo5PYZf1O2+WJjDl9jo3oayJzjXhb3wsxqMeZcg+1l5lzcY7l
         6nJA==
X-Gm-Message-State: AOJu0YyBE2OOwdVE89aNLuIsu0PboX8jfjwqBjYyZAE1k1DXlrivH1kq
	IdUd0sgHYCHQYRCG78JvUqtVTkKL7spqYan2Gw1troyk9QnelCr1o9wF86M1DA==
X-Gm-Gg: ATEYQzwh296T9sE5wfFAJdfmZE9XQy05LKbQldQTHLymYIK+e7XT/EDfaqpaOUfCqpH
	HGcwr7E6xnr27j7ayKFwW9KvggeAbTMkZpV3Em2S0D5zM/M5ugcGjRTui5CGRKb/J3iudUtigPb
	M/HH/eutxWtt9PPWuyNeporJiwShp+HDRwJofb0FrIa0kAcFvqp/F+ri5vclhQKWxnCTezRZ1eW
	LEr63GRPgxKUL6L0YA16/pYYBk7Gkdtv/p/QCLeiumMzMRJ4/6FD+f5Q6Du7EUOUTIEtZOImf5O
	VM6hPIIp9Mp5/JfPOkiRvat3UlY6Pfo2uq/8Cva975iY0Dz7X226XJzb/OJ6H3Tceoxq6MT08LT
	6mwtOHHyndAc19oJflGWSEICENa4YyHBoAB7HguKLCgGicQF4KyiOqGML1cJCLRlcjKSiFLlD3P
	Aq/D8vPnbs/5jdODpJPbPk
X-Received: by 2002:a05:6000:2c07:b0:439:be53:e766 with SMTP id ffacd0b85a97d-439cfc31effmr4730307f8f.12.1772720115263;
        Thu, 05 Mar 2026 06:15:15 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439abdf5430sm40034096f8f.5.2026.03.05.06.15.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 06:15:14 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 1/3] gnome-shell: ignore CVE-2021-3982
Date: Thu,  5 Mar 2026 15:15:12 +0100
Message-ID: <20260305141514.3058998-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 14:15:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124875

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-3982

The vulnerability is about a privilege escalation, in case
the host distribution sets CAP_SYS_NICE capability on the
gnome-shell binary.

OE distros don't do that, and due to this this recipe is not
affected by this issue. The CVE is ignored.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4d6e24106c78eed3b9d9a36115df8d2f057f5178)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.1.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.1.bb
index 1bc9b6b394..2e6d70d6f7 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.1.bb
@@ -85,3 +85,4 @@ PACKAGES =+ "${PN}-tools ${PN}-gsettings"
 FILES:${PN}-tools = "${bindir}/*-tool"
 RDEPENDS:${PN}-tools = "python3-core"
 
+CVE_STATUS[CVE-2021-3982] = "not-applicable-config: OE doesn't set CAP_SYS_NICE capability"

