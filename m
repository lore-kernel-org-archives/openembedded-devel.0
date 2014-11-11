Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 491CC65CED
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 17:53:57 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id n3so2567558wiv.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 09:53:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vBQksk4zOD24M/CuWBzb8bnJeYxdIqKo/ZsLBwmRH0k=;
	b=E+C4txdqyI30i87WhPDXMIiKc8Ab+ezHcjwFukpBArRqmq+wR2Ttb/+altIIWxkmQU
	z61lwj36heX5tQ2GPVq6k1GqrqAnN+eM0co8vYy9jzSbDhaUxkdKBNaU0DG5YwOwa5d0
	uxzAHx/+rPAv87e17ujMBAFWdwxsa6d9cRep7NN1ByR8d823SWY3AO1v/otDNHLa9LEX
	FhfKXR4yz78BifRdAx4QGQUl7u88gyHYfylFEVONsvHQN+IOOKa9VcyfdPjh0LDUEjdq
	w2wPb7wCgQ/dGqDSHFwGyLoS8avFW+VPAHJSMiSr4z/uRt0TIVBWhXZE04FjSgv6V3mO
	jXYw==
X-Gm-Message-State: ALoCoQnMi9rcTIY9Z3kodPiSyyAleF74S6ncgwlKfHMoyPPBBoMQgW2oxkyQ60aV54rvOaTeUNrv
X-Received: by 10.194.91.162 with SMTP id cf2mr2900366wjb.21.1415728438101;
	Tue, 11 Nov 2014 09:53:58 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id dx8sm14461196wib.2.2014.11.11.09.53.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Nov 2014 09:53:57 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Nov 2014 17:53:46 +0000
Message-Id: <1415728430-30366-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/5] gssdp: use GNOME_MIRROR in SRC_URI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Nov 2014 17:54:00 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-multimedia/recipes-connectivity/gupnp/gssdp_0.14.8.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.14.8.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.14.8.bb
index 9fda51d..9457abc 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.14.8.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.14.8.bb
@@ -4,6 +4,6 @@ inherit gtk-doc
 
 PACKAGECONFIG[gtk] = "--with-gtk,--without-gtk,gtk+3"
 
-SRC_URI = "http://download.gnome.org/sources/${BPN}/0.14/${BPN}-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/${BPN}/0.14/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "b8658e480d047caf2d92baa4a51b9ae7"
 SRC_URI[sha256sum] = "4c3ffa01435e84dc31c954e669e1ca0749b962f76a333e74f5c2cb0de5803a13"
-- 
1.7.10.4


