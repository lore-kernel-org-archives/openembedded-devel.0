Received: from [74.125.78.144] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Mw5zC-0000Wf-6P
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Oct 2009 05:17:45 +0200
Received: by ey-out-1920.google.com with SMTP id 5so1231981eyb.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Oct 2009 20:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=qLXxFWc4uZXhNDNk6yjjEgQxPQm62FG78tmCrjMfTLg=;
	b=kP1STkxdeFP57W4coFHO6sSj1gJvf7mM4BWgWf4RN56qPF80PFxOsdM84x8FVQK5wP
	3GWxhQkHpBKP66Po5TeQioNEGGsTybvSCd35oddTYqLU5h8S7NGVa97U94jICRF04kt1
	f0h6lxAXkxiWMf0bFoMfNj29fbMRW8AKM8e+g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=F+GnC12zJs9W7wNeO4vS8/q+Njs5EdcfAyjAV3mks31KxTAYP4vOvv72BCdWDAmHNc
	CHLyUP9sbgOViSFPkOJVFWN8i5HX5iWFhby/lyZQVIi4VeOEjylt9IDXdlnJxCs2F4v0
	AD2qIesxu1CJulijZfeQ0AonGgUQZD79QvoPU=
Received: by 10.216.88.6 with SMTP id z6mr680419wee.52.1255058213094;
	Thu, 08 Oct 2009 20:16:53 -0700 (PDT)
Received: from ?10.0.0.13? (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id g9sm1505312gvc.10.2009.10.08.20.16.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 08 Oct 2009 20:16:52 -0700 (PDT)
Message-ID: <4ACEAB19.1000408@gmail.com>
Date: Fri, 09 Oct 2009 13:46:41 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.78.144
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] matchbox-panel-0.9.3: fix uninitialised variable causing SIGBUS
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
X-List-Received-Date: Fri, 09 Oct 2009 03:17:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

As reported here:
http://lists.o-hand.com/matchbox/0289.html

I've not experienced the bug for over a month since applying this change.


Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 .../matchbox-panel-uninitialised-crash.patch       |   10 ++++++++++
 recipes/matchbox-panel/matchbox-panel_0.9.3.bb     |    5 +++--
 2 files changed, 13 insertions(+), 2 deletions(-)
 create mode 100644 recipes/matchbox-panel/matchbox-panel-0.9.3/matchbox-panel-uninitialised-crash.patch

diff --git a/recipes/matchbox-panel/matchbox-panel-0.9.3/matchbox-panel-uninitialised-crash.patch b/recipes/matchbox-panel/matchbox-panel-0.9.3/matchbox-panel-uninitialised-crash.patch
new file mode 100644
index 0000000..6177501
--- /dev/null
+++ b/recipes/matchbox-panel/matchbox-panel-0.9.3/matchbox-panel-uninitialised-crash.patch
@@ -0,0 +1,10 @@
+--- matchbox-panel-0.9.3/src/panel_app.c.orig
++++ matchbox-panel-0.9.3/src/panel_app.c
+@@ -249,6 +249,7 @@
+ 
+   papp = NEW(MBPanelApp);
+   
++  papp->name   = NULL;
+   papp->next   = NULL;
+   papp->win    = win;
+   papp->panel  = panel;
diff --git a/recipes/matchbox-panel/matchbox-panel_0.9.3.bb b/recipes/matchbox-panel/matchbox-panel_0.9.3.bb
index 5559122..3d50f5f 100644
--- a/recipes/matchbox-panel/matchbox-panel_0.9.3.bb
+++ b/recipes/matchbox-panel/matchbox-panel_0.9.3.bb
@@ -1,5 +1,6 @@
 require matchbox-panel.inc
-PR ="r4"
+PR ="r5"
 SRC_URI = "http://projects.o-hand.com/matchbox/sources/${PN}/0.9/${PN}-${PV}.tar.gz \
 	   file://mb-applet-battery-repaint-093.patch;patch=1 \
-	   file://mb-applet-system-monitor-crash.patch;patch=1"
+	   file://mb-applet-system-monitor-crash.patch;patch=1 \
+	   file://matchbox-panel-uninitialised-crash.patch;patch=1"
-- 
1.6.0.3



