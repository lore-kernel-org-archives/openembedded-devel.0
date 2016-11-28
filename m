Return-Path: <meerkoetter@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1808E71B56
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 16:59:52 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u144so20011292wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 08:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OI+/vMVdPrFsq0GxoNUV3ZgYCFAgRavluXArdKnmTEw=;
	b=DReE3BnwskohKlh8lVH8+cciil32zmkY1onXZOL9Q9YjrPAD/w5kTGbZ8dOf5IGSIo
	Qi1el2XZpg61uSgGxHFj+Z23Bwbj8yTXDuGGYgomzoadAuxXwR2SDFqKmpZ29Y0X+OyC
	C7KWIqrAdn/P/qIPvLzs2B5GVi2L2w84HmVynAzDo8K6BWapfPhnt3Fl9Jbb+M/bzHSF
	Wp4mVTMYiK09+jKnnlUR4vvd3iBb1sMCORwNz0T8mwEJxBsSgOpMgBYU047IydgrvATp
	B1xy4RiZ0yCTn4cS91uofr8v6CKRD8ZvEOP9VbOWcmoOGlk2Gnb0baXtAimMoAqkYfG5
	A6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OI+/vMVdPrFsq0GxoNUV3ZgYCFAgRavluXArdKnmTEw=;
	b=lbKXv8wYZy61VWOZTouRD+w11QX4eIyTBWd6Iq0GcgnsMluSZFfLeC5zzNEazkh6Nh
	HgIkKpLudyTK1sU+V1NZ7DAkVmSoe7HBhdXdk6F5HPrPIbsvb+hWESeadoEAJAamlpsG
	NQyzqQxcl5O2QPwlSWdgaQSwT+9uwBicGuFc9KQJbTPFPnMbnttIHahPhVk8Vk12U6tu
	sHjRdiy9IC7qkI3ufi9K7FaWtGPc2gyChLLkLHHciUjtw6VUVGFEUlHr28/YI7UMBCTk
	rTgQkZt7KkLO5ES5Txd9e1btrXgxpUUrxHqR1lfw6uIyM1BW4VDUwdgyKRIuvZFQ0SuN
	bSAw==
X-Gm-Message-State: AKaTC01MiTqB3a8SXsK/gZdzbrVTX0MD/n4qDjfgmfm8oKp8iXRNl+SgVcHC0K9AQoh15w==
X-Received: by 10.28.66.7 with SMTP id p7mr20604350wma.64.1480352393581;
	Mon, 28 Nov 2016 08:59:53 -0800 (PST)
Received: from naos.fritz.box
	(p20030071EF27C90038C08788B208AAEC.dip0.t-ipconnect.de.
	[2003:71:ef27:c900:38c0:8788:b208:aaec])
	by smtp.gmail.com with ESMTPSA id
	k11sm29756805wmb.18.2016.11.28.08.59.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Nov 2016 08:59:52 -0800 (PST)
From: Frank Meerkoetter <meerkoetter@googlemail.com>
X-Google-Original-From: Frank Meerkoetter <frank@meerkoetter.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Nov 2016 17:59:45 +0100
Message-Id: <1480352388-7733-3-git-send-email-frank@meerkoetter.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480352388-7733-1-git-send-email-frank@meerkoetter.org>
References: <1480352388-7733-1-git-send-email-frank@meerkoetter.org>
Cc: Frank Meerkoetter <frank@meerkoetter.org>
Subject: [meta-oe][PATCH 2/5] Do not expose the redis service to the network by default
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
X-List-Received-Date: Mon, 28 Nov 2016 16:59:54 -0000

Binding it to localhost is a safe default.
This affects both sysv and systemd based systems.

Signed-off-by: Frank Meerkoetter <frank@meerkoetter.org>
---
 meta-oe/recipes-extended/redis/redis/redis.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/redis/redis/redis.conf b/meta-oe/recipes-extended/redis/redis/redis.conf
index 923b98e..b932089 100644
--- a/meta-oe/recipes-extended/redis/redis/redis.conf
+++ b/meta-oe/recipes-extended/redis/redis/redis.conf
@@ -30,7 +30,7 @@ port 6379
 # If you want you can bind a single interface, if the bind option is not
 # specified all the interfaces will listen for incoming connections.
 #
-# bind 127.0.0.1
+bind 127.0.0.1
 
 # Specify the path for the unix socket that will be used to listen for
 # incoming connections. There is no default, so Redis will not listen
-- 
2.7.4


