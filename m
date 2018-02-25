Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 36C2B78830
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:48 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id f80so611203pfa.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=u8CcKNjBiMgtbfBXXSUxAwj7GRbLqXJvY4QcGQgfvy8=;
	b=qjABl+DBTLafxLhHIsYsyaqSDr89Hfyc9b3hEDS+GA0VsZkQe23qTh5AC5GxUtsLVv
	BMtJX5IQ8YxS4nF4DrWVhCrxwML+u7e6rJc0XdzskTupRk2XKD3sSGSg9H97XiQm1cAA
	HpXYE+AbatNzUAtFF83+JC0dmEbJzG++VVQAtTF/s8q9h/f3Z3N/H6nSkRUZ1ycfpAwH
	GS8HGW8V96Bp2blgabCQH/9Uf+rqcGTXfT3ujyrq1wb8zdqBC1wATj0ZSYr0HLxg36NQ
	A8+jTs3ZEbBr28Q8++x02WpHhmFrjr/qFkEBGaISPJkM2qHUZhCStI8PA/7u1zT4q5pu
	qP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=u8CcKNjBiMgtbfBXXSUxAwj7GRbLqXJvY4QcGQgfvy8=;
	b=oDhAWLe0tRH/Q6z0LLyAovQTDe+ZlxL5g5KPimHrSnbL/lN/VLVkwZfxLPYGxY73f9
	ANcaxlrm0XREVF369SzL27mH8bzPmWs0zaec+x1I0ZboOyqw3Kg+qPq4s1P25OLUeg5Q
	975cz9g36LCNbG3l7ZsqfryPsijkw6SH/olG7MuGEDM/mBcDLfbV1dwIh9NAKP9lOLsY
	qiCuMJKXrkNtc+YIMriZQw9BKJiQr0hl2FWhoN5ksjLTrE+Pjw8N8SDgbtvln8ZsrOMA
	/jPNL8y0y0eNf9BFLZ1cdjYu9DR0iemuMlZeFTDIkZqIBZhPLh7IMcQkTooQTELoqx2B
	J4Mw==
X-Gm-Message-State: APf1xPAazR70Ipv4v7Ar7HEG+PFSv8hAzWrFTqdYVLnnbSCdqu4DZQ1G
	kcCJ6+4vYnsZeM5TyADWqXMqDA==
X-Google-Smtp-Source: AH8x224bAvu65O+8B3kAJNhaucOm3Uzh4BO/ZQKPXmqg3uaqycXN4yCPchig1+249N34QuFh0JSLkQ==
X-Received: by 10.98.101.195 with SMTP id z186mr8371853pfb.47.1519594429703;
	Sun, 25 Feb 2018 13:33:49 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:33:11 -0800
Message-Id: <1519594406-24490-21-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 21/36] libmcryt: movre to recipes-crypto
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:48 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/{recipes-support => recipes-crypto}/libmcrypt/libmcrypt_2.5.8.bb | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-support => recipes-crypto}/libmcrypt/libmcrypt_2.5.8.bb (100%)

diff --git a/meta-oe/recipes-support/libmcrypt/libmcrypt_2.5.8.bb b/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
similarity index 100%
rename from meta-oe/recipes-support/libmcrypt/libmcrypt_2.5.8.bb
rename to meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
-- 
2.7.4


