Received: from [209.85.221.124] (helo=mail-qy0-f124.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Llf9a-00008r-5W
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Mar 2009 09:05:02 +0100
Received: by qyk30 with SMTP id 30so2338437qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Mar 2009 01:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=49xuLQWDeg1x5I9akrxLasYyA9v/W1Qp5kTkJvvgksQ=;
	b=C7rpGd+y5S1kXbEImcWp7h7UU/3Uji2bAse55Y7Af67OFySKGD5fzpaWhmpaeamoko
	uqSmVdKeHdk0xPQcISwvpQzxh32bZBdbxYNRasvMl6tTOwWcBGFPcxRt8ZQ4g6o//Qe0
	313QqdI8of1iiBtZWhPm6xGqH1vy5rylsS44I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=nCkvAWsbqQET0VQ6hh2zGNm2eDQHxNCOAhcN7FrSeeavIyfW17fDl8h9tdsxcbwA4m
	vITSLAwprE8aEgSK+2wmUlDrVpvXuwVCtutmIu7bvTi57vGy8Wl0VVRpJQfwheMbyaZh
	8KsiMG+aE3iJ8wfv+iQVkh9A0ZJDgcV65APCw=
Received: by 10.224.53.203 with SMTP id n11mr8430151qag.192.1237795418824;
	Mon, 23 Mar 2009 01:03:38 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 6sm8979811ywc.10.2009.03.23.01.03.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 23 Mar 2009 01:03:38 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 0BAAD6100DE; Mon, 23 Mar 2009 05:03:34 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Mar 2009 05:03:28 -0300
Message-Id: <1237795409-8884-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.2.1.303.g63699
In-Reply-To: <1237795409-8884-2-git-send-email-otavio@ossystems.com.br>
References: <1237795409-8884-1-git-send-email-otavio@ossystems.com.br>
	<1237795409-8884-2-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/3] firefox.inc: properly support locale usage based in system locale
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
X-List-Received-Date: Mon, 23 Mar 2009 08:05:04 -0000

---
 recipes/mozilla/firefox.inc |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/recipes/mozilla/firefox.inc b/recipes/mozilla/firefox.inc
index 84082cd..1be9c4d 100644
--- a/recipes/mozilla/firefox.inc
+++ b/recipes/mozilla/firefox.inc
@@ -37,6 +37,12 @@ do_install() {
 	install -m 0644 ${WORKDIR}/mozilla-${PN}.desktop ${D}${datadir}/applications/
 	install -m 0644 ${WORKDIR}/mozilla-${PN}.png ${D}${datadir}/pixmaps/
 	rm -f ${D}${libdir}/${PN}-*/TestGtkEmbed
+	rm -f ${D}${libdir}/${PN}-*/defaults/pref/firefox-l10n.js
+
+	# use locale settings
+	grep -Rl intl.locale.matchOS ${D}${libdir}/${PN}-*/ \
+	   | grep '.js$' \
+	   | xargs -n 1 sed -i 's/\(pref("intl.locale.matchOS",\s*\)false)/\1true)/g'
 
 	# disable application updating
 	grep -Rl app.update.enabled ${D}${libdir}/${PN}-*/ \
-- 
1.6.2.1.303.g63699



