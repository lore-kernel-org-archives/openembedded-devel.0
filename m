Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PD5Nj-0002Dg-5h
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 02:09:48 +0100
Received: by pxi2 with SMTP id 2so690723pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 18:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=p8uJCyRFnSAeXGKu/0DpOjbOHCh0aO/x74xfA/ei3EM=;
	b=E/wQqxIsik4XhvT+OSVqWlWIP1qctY5UF6UJQH8z4QplzAGH30B6Tf9NDKHXKHKspZ
	CfdRyQWHZAdLuxUcgpVWruvvUEKveUgv0v7e3nHBqVY10yzBroVl4lvgP/Zw2ie0jo3q
	FgX274AKlSlQn+25s7WJF6yuIwwXZ2A478p7o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=vAFTYYF1kENYgojZADiK1R43CATrhimkdp8xvNMzxMkRjcLdWkiOLsuq7vg2aeoc2s
	A1UC7g3I1YIr8FHusolANxUXx1ckgOKw5BZvRh+vFr9TVt4aGcCGH0pbQamkV3Jxn02P
	wLYJTV52LdWIGaUO1wMYnec8jI9bRTG55E1mw=
Received: by 10.142.238.9 with SMTP id l9mr5149150wfh.213.1288660136719;
	Mon, 01 Nov 2010 18:08:56 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id e36sm9838431wfj.2.2010.11.01.18.08.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 01 Nov 2010 18:08:55 -0700 (PDT)
Message-ID: <4CCF64A1.80506@gmail.com>
Date: Tue, 02 Nov 2010 11:38:49 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.14) Gecko/20101020 Thunderbird/3.0.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] telepathy-gabble_0.7.27.bb: Add libsoup-2.4 to DEPENDS.
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
X-List-Received-Date: Tue, 02 Nov 2010 01:09:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

checking for SOUP... configure: error: Package requirements (libsoup-2.4) were not met:
No package 'libsoup-2.4' found

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/telepathy/telepathy-gabble_0.7.27.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/telepathy/telepathy-gabble_0.7.27.bb b/recipes/telepathy/telepathy-gabble_0.7.27.bb
index 3f250a3..896b467 100644
--- a/recipes/telepathy/telepathy-gabble_0.7.27.bb
+++ b/recipes/telepathy/telepathy-gabble_0.7.27.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Gabble: a Jabber/XMPP connection manager"
 HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
-DEPENDS = "glib-2.0 dbus loudmouth telepathy-glib"
+DEPENDS = "glib-2.0 dbus loudmouth telepathy-glib libsoup-2.4"
 LICENSE = "LGPL"
 
 # gabble.manager needs to get regenerated every release, so please don't copy it over blindly
-- 
1.7.1



