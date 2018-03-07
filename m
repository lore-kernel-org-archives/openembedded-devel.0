Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 05FBE78A15
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 04:03:40 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id r26so428076pgv.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 20:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=jxdEeJq9B6OACK7kLqQSMDkzeJaKLj0GF4DA8Rf/+cM=;
	b=iuIKA85Wk0G6hAqjiMYXq4zr6VP1eAAizm+Vi7h3rHle9emoEbmv3suCuCeoAsk8rm
	hidZU9MjvYicIg9BNZaXqI6wcm/7SuEgncvaHOmGBHEr8ffqF9BzD320PwQBSgPGX08Q
	uv2PvJD5zec7cvsWgtffuo/JCMj2+Ir4hQCCMuMbS3N04IbNZakDsd94H3ZkptrDwRpQ
	gq7To0LRbz6VLGOVxZ/PwJufltsoRSl6oZvpCj9Ts/EyohRHEjirh1e6BgqQRZrniy5a
	P+Bhw9kLwTLZyGm9iPlGbup9wSSA8wZptVnQivdKLVjldqj/d3mq2t1XauNOarKrPGSA
	ubyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jxdEeJq9B6OACK7kLqQSMDkzeJaKLj0GF4DA8Rf/+cM=;
	b=S6SQ355gQ3yPv81CRqWfYgE4fVwaXKuEMPaWvS20Jn+erOtuAKCWscov+LAO+SEqEn
	XEaIk+IMs42OQsmLGZ8aG2JGkUTmPmLF815oi9R0gJ6kk01iS+Q0UNUc5Ic24cOeB85l
	XoIMay4nJUgFfINVs72P6VIPCFnoyt3RN9JhSZmBjlny+Ov4IdAzhk94dejtjJXIzmia
	Q9QCB87pN/LKM2AiSALnaB3hOT6Ct3ElxXfck8OjMIOVIBuyJIYdG4IsryOVDJALo+Un
	lUFRcQ9ng9x4I3XSsGJlaQfEwsGXVnWvd8Pn8NvuBfajcNabnH8x6n+0jIo6kONKEQjx
	dOhA==
X-Gm-Message-State: APf1xPDIJtSZJbO51T+btc+B0LMqTdczlCRSh4r+sN2fA9BeZFlmekx/
	KzG/8ePjkiIhOcYJ/EFuoGaKuQ==
X-Google-Smtp-Source: AG47ELsfn3KC8+1ptPT0JltctUD0WuFqgTwsBohqxChjjlFzZJnZNVXz28DFBEvIhwimIg+sgWu3MA==
X-Received: by 10.99.102.5 with SMTP id a5mr17034679pgc.452.1520395421630;
	Tue, 06 Mar 2018 20:03:41 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	14sm30677152pga.53.2018.03.06.20.03.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 20:03:41 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 20:03:16 -0800
Message-Id: <1520395408-19266-13-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
References: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 13/25] obex-data-server: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 04:03:40 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
index e10b89c..715b023 100644
--- a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
+++ b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
@@ -11,6 +11,8 @@ SRC_URI = "http://tadas.dailyda.com/software/obex-data-server-${PV}.tar.gz \
 SRC_URI[md5sum] = "961ca5db6fe9c97024e133cc6203cc4d"
 SRC_URI[sha256sum] = "b399465ddbd6d0217abedd9411d9d74a820effa0a6a142adc448268d3920094f"
 
-inherit autotools-brokensep pkgconfig
+inherit distro_features_check autotools-brokensep pkgconfig
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 FILES_${PN} += "${datadir}/dbus-1/"
-- 
2.7.4


