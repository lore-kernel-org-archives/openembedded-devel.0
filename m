Return-Path: <joe@deserted.net>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9B4E16FFED
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 02:15:18 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id b194so13699919ioa.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2016 18:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=F7FhO/AxQAzplXhUMp8BrYA+2cPIS1zuybK+7DZURIE=;
	b=MqrFSCO/YlABwdEo/LoODrxJoIJhsCH7ipFEr9BayDKW2n/Er+xfJudQpvINAeeJaB
	8/CmrLfPuDQJVudC3VLJ3SJnPQ9CHjo5aYdUMrKGTcwXbtn4wHqLOuXvzBqgW2gPSJcW
	dG3DU6LsftxVyg1Rj2Ch/KxJfwHhreBoVP/Qjlc43IFaDJ+ZZN3LiKk+iushV+3C1BeY
	f3dWoq0nCs+nYdo5Lwk/RSdP+mpKudrKLe6nGdfFDIQr90z682fqR8Bx75KqpcgFUU/Q
	DlK4OKNDx38zHuWR7Df+JLij24XRkfVALxFjh9JT3AVkBrfDgSxFTe/Rrx5EbNBYMnLE
	Calw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=F7FhO/AxQAzplXhUMp8BrYA+2cPIS1zuybK+7DZURIE=;
	b=ebFs6UmlQL2YfplTntIvHeqCYlwapZRnjUKLN2m2ZeqsCvFIqboEvpD1dGGgEm6nmt
	/bvDG7G6TwB/dme6gNebY5Ob1OwWgCYPApzZyuVnu+cBBFlpF+xDgzrYZ+9vAbGrY8U5
	ntXu6Eik7gheDDV1GDZ9TvcSaSss20ZW9Ej/rGGliizo5fGBtx2zaub9F4xhX4iHVifb
	AiMHCJ4J5OV5zu6Z/sU6Z7bUcjSh2dHcAVrGLNIfU7kwFtfp9L1P17CeUtUL/DTaWwFl
	XaXOGf6j9Z8cFtbHZON7M+eJhQxW10ZmCEQC514n/etTw1RAVFZcu+VpcYz0FbBY3wXr
	yScg==
X-Gm-Message-State: AKaTC01TnFTzezXhzstk6OjB+zlmqLtdRe2Bm8Gy32uVSMi9ODklZ2f7YUmDPia04IWoAg==
X-Received: by 10.107.139.74 with SMTP id n71mr6480062iod.166.1481940919654;
	Fri, 16 Dec 2016 18:15:19 -0800 (PST)
Received: from mir.deserted.net (23-233-31-74.cpe.pppoe.ca. [23.233.31.74])
	by smtp.gmail.com with ESMTPSA id l73sm3804122ioe.1.2016.12.16.18.15.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Dec 2016 18:15:19 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Dec 2016 21:15:15 -0500
Message-Id: <1481940923-12914-4-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 03/11] samba: remove unused variable DISABLE_STATIC
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
X-List-Received-Date: Sat, 17 Dec 2016 02:15:18 -0000

From: Andreas Oberritter <obi@opendreambox.org>

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index aabc043..c9e0953 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -93,7 +93,6 @@ EXTRA_OECONF += "--enable-fhs \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix} \
                  --with-pam --with-pammodulesdir=${base_libdir}/security \
                 "
-DISABLE_STATIC = ""
 
 LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-- 
1.9.1


