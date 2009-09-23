Received: from [209.85.219.220] (helo=mail-ew0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1MqFT4-0007qG-AD
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Sep 2009 02:12:25 +0200
Received: by ewy20 with SMTP id 20so488739ewy.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Sep 2009 17:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=aGYfG2zPW/G+6HTdtjeEVisnJTdvGUZr+SXzGiDGjz4=;
	b=mWwQkhXUInCP9tcjILHw7qORtlck2cFtxJlvbg+2Ln4KDifouY5lsrAMl3RQdIIKQz
	dTPjtjyKg4wNXbGYyEPqQzi+fHM+JiwVBuupy4xK2cXdeDlq3ffuOlgxt4TlscOFbKqt
	PnG4V5DLq6rZ+cpYC+C+zX3G1qMy9DBiUw+dU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=qqXjlx+aSFHAO2/57qcKN3Y7EIA7sebJ7g51EsboaZijHzNTCmSS0793XTz8aNLrzY
	He02cxXbD31wEfkW09hmxIwTBhiT+Xj8rypJxzmj9gZyiGiBg8zB77WW83xgkb45Bu7R
	UAzJRLD+V9FL0Jvpa3tr9dfOit0TGEyFBR40M=
Received: by 10.211.147.10 with SMTP id z10mr1816776ebn.61.1253664704304;
	Tue, 22 Sep 2009 17:11:44 -0700 (PDT)
Received: from ?10.0.0.19? (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id 5sm540823eyh.1.2009.09.22.17.11.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 22 Sep 2009 17:11:43 -0700 (PDT)
Message-ID: <4AB967B5.4060304@gmail.com>
Date: Wed, 23 Sep 2009 09:41:33 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.220
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] libsoup: add gnome-keyring dependency.
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
X-List-Received-Date: Wed, 23 Sep 2009 00:12:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

libsoup's configure.in added a gnome-keyring check since the last version.

Failure looks like this:

| checking whether to build libsoup-gnome... yes
| checking for GNOME_KEYRING... no
| configure: error: Could not find gnome-keyring devel files.
| Configure with --without-gnome if you wish to build only libsoup
| without GNOME-specific features.
| FATAL: oe_runconf failed`


---
 recipes/gnome/libsoup-2.4_2.27.91.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/gnome/libsoup-2.4_2.27.91.bb b/recipes/gnome/libsoup-2.4_2.27.91.bb
index ae50306..1fce0ff 100644
--- a/recipes/gnome/libsoup-2.4_2.27.91.bb
+++ b/recipes/gnome/libsoup-2.4_2.27.91.bb
@@ -1,7 +1,9 @@
 DESCRIPTION = "An HTTP library implementation in C"
 SECTION = "x11/gnome/libs"
 LICENSE = "GPL"
-DEPENDS = "libproxy glib-2.0 gnutls libxml2 sqlite3"
+DEPENDS = "libproxy glib-2.0 gnutls libxml2 sqlite3 gnome-keyring"
+
+PR = "r1"
 
 inherit gnome
 
-- 
1.6.0.3



