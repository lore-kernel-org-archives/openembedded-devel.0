Received: from [74.125.78.148] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eballetbo@gmail.com>) id 1N2hqz-0000W3-1W
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Oct 2009 09:56:36 +0100
Received: by ey-out-1920.google.com with SMTP id 3so1165893eyh.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2009 01:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=+90zW+qM5MndWaOlTtPJ5bkIqNHLHy1BweDcs8S/ruI=;
	b=c4xzYartQAFOTyIRvpJM4c6ixXyAY6hS43tv8irqGxHY5gzYFFNqWUYI+A3YxSgwWf
	sPlooPXmdP17mYRlLTqkkNHF6TjNAh/gGd0pQRG1sVWdevk/C5QSkQDtNBrOjT/7MLxR
	o8uWuSLpIGoMowqi6sBNQ4juDB8ZT6c0fcPsA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=WLCj+4ihTiTlRCjzwciKeoQXKQVKlr3p9paTsrapBzY1nIpyvKV1vReVms0uzVLwY4
	IJy/zOybLOBrAdHM5R8WXg+jD9Xjfsqg2PdJrrJZkI0ig+zHK04NRvgruKEBLozxDbB/
	E/9PCB3kFM93YUENrcbRbngGwaDMrdox3j7p4=
MIME-Version: 1.0
Received: by 10.216.91.15 with SMTP id g15mr902875wef.24.1256633729115; Tue, 
	27 Oct 2009 01:55:29 -0700 (PDT)
Date: Tue, 27 Oct 2009 09:55:29 +0100
Message-ID: <70c9a9110910270155q40acd9b6yb05d4674818c7b73@mail.gmail.com>
From: =?UTF-8?Q?Enric_Balletb=C3=B2_i_Serra?= <eballetbo@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.78.148
X-SA-Exim-Mail-From: eballetbo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 4/5] netbase: Add version for IGEP v2 board
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
X-List-Received-Date: Tue, 27 Oct 2009 08:56:36 -0000
Content-Type: text/plain; charset=UTF-8

Signed-off-by: Enric Balletbo i Serra <eballetbo@iseebcn.com>
---
 recipes/netbase/netbase/igep0020/interfaces |    5 +++++
 recipes/netbase/netbase_4.21.bb             |    2 +-
 2 files changed, 6 insertions(+), 1 deletions(-)
 create mode 100644 recipes/netbase/netbase/igep0020/interfaces

diff --git a/recipes/netbase/netbase/igep0020/interfaces
b/recipes/netbase/netbase/igep0020/interfaces
new file mode 100644
index 0000000..1696776
--- /dev/null
+++ b/recipes/netbase/netbase/igep0020/interfaces
@@ -0,0 +1,5 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+
+# The loopback interface
+auto lo
+iface lo inet loopback
diff --git a/recipes/netbase/netbase_4.21.bb b/recipes/netbase/netbase_4.21.bb
index 403ca19..0ce40ba 100644
--- a/recipes/netbase/netbase_4.21.bb
+++ b/recipes/netbase/netbase_4.21.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "This package provides the necessary \
 infrastructure for basic TCP/IP based networking."
 SECTION = "base"
 LICENSE = "GPL"
-PR = "r38"
+PR = "r39"

 inherit update-rc.d

-- 
1.5.4.3


