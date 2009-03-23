Received: from [74.125.92.148] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Llf9Y-00008p-5U
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Mar 2009 09:05:01 +0100
Received: by qw-out-1920.google.com with SMTP id 5so889528qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Mar 2009 01:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=AkzPrtGlc2jlhOphLLcKCzPwHhCSqNNEPBmT4ZFdxV8=;
	b=qNO7hvnItqEpu6bGteVlc3wLrjwm4brPbedGWe6FNncYQeKJaO/GfsgqTw7bYL3+K0
	F+CFUggRLqWuLdYvAXz/P9HD6AxL8wWjUl6f8QOu6M15lswLeE32eOjAJme/K7l2Slek
	NgmXmGdH7KEdHJU9ZoHg2aHhtcAONRhZh0HG0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=RjE1KpfwJ0WW8B4HkhyyQxPvvfQ7t74PqxtYXxVDqIXmTWxf1oj1m689pyexjbLvaJ
	8pB7d/rRedOeeECfvN66qPeffTkzDaBuECDA7XSyFSdcaMfytMzmVMURAdx/rFYAo/U9
	ralhLZz4BRZwJl3IoUo1BAmGpXMsKuQ04dpOQ=
Received: by 10.224.29.3 with SMTP id o3mr145869qac.115.1237795418715;
	Mon, 23 Mar 2009 01:03:38 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 6sm8965442ywp.41.2009.03.23.01.03.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 23 Mar 2009 01:03:38 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 1AC726100E2; Mon, 23 Mar 2009 05:03:34 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Mar 2009 05:03:27 -0300
Message-Id: <1237795409-8884-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.2.1.303.g63699
In-Reply-To: <1237795409-8884-1-git-send-email-otavio@ossystems.com.br>
References: <1237795409-8884-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/3] firefox.inc: disable application updating
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Mar 2009 08:05:02 -0000

---
 recipes/mozilla/firefox.inc |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/recipes/mozilla/firefox.inc b/recipes/mozilla/firefox.inc
index c00dfd4..84082cd 100644
--- a/recipes/mozilla/firefox.inc
+++ b/recipes/mozilla/firefox.inc
@@ -37,6 +37,11 @@ do_install() {
 	install -m 0644 ${WORKDIR}/mozilla-${PN}.desktop ${D}${datadir}/applications/
 	install -m 0644 ${WORKDIR}/mozilla-${PN}.png ${D}${datadir}/pixmaps/
 	rm -f ${D}${libdir}/${PN}-*/TestGtkEmbed
+
+	# disable application updating
+	grep -Rl app.update.enabled ${D}${libdir}/${PN}-*/ \
+	   | grep '.js$' \
+	   | xargs -n 1 sed -i 's/\(pref("app.update.enabled",\s*\)true)/\1false)/g'
 }
 
 pkg_postinst_${PN}() {
-- 
1.6.2.1.303.g63699



