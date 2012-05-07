Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SRTPQ-0001ip-NH
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2012 21:15:48 +0200
Received: by werb13 with SMTP id b13so1003810wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 May 2012 12:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=jEf5Y/6RDBOcMiAsLNSQXNaAqw1DWLN89PcPkyFmBG0=;
	b=aqiAGxWPzRtisA/oDkL13NTyJH7nATk4QhKQj6webEACM8ozN59AS7Wo58uZioHkSd
	+b2QQDf0aUd3MSOPLLwFklkCrzS0Q//7Kn79m7OdAvDCfykb3E6AT5Vh43+LRRAeIu2/
	WfdDxoXXzqXNURzcZtl5Rhpr80xiHLsdyPLHDeOJOOimqg0EzUWT12hcaTIM7ZlAMs8g
	aU6BEWJ6cPgspEmFXoJaRwHijLMMmqVCqd6wj+MNpf460l3SyJY1IkJiGtTrWgI6WaCu
	UQDHJiSIjBwNiJgtlfnjYJFTHZ8QixjqoU9OlHu3gKzktAmDnrdFl2WKawKIwdOhlw9C
	pajg==
Received: by 10.180.78.105 with SMTP id a9mr7862198wix.20.1336417557846;
	Mon, 07 May 2012 12:05:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ff2sm36917232wib.9.2012.05.07.12.05.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 12:05:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 May 2012 21:05:42 +0200
Message-Id: <cover.1336417488.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][meta-efl][meta-gpe][PATCH 0/5] fixes after glib-2.0 upgrade
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
X-List-Received-Date: Mon, 07 May 2012 19:15:48 -0000

The following changes since commit f769b97271cf4158ec700d32a56d18a756a1ddcb:

  xfsprogs: misc fixes for recipe (2012-05-05 09:00:21 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull2
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull2

Martin Jansa (5):
  libsoup-2.4, gobject-introspection: upgraded in oe-core
  libgee: upgrade to 0.6.4
  glibmm: fix build with glib-2.32
  loudmouth: fix build with glib-2.32
  gpe-scap: migrate to use libsoup-2.4 instead of libsoup-2.2 API

 .../recipes-support/libsoup/libsoup-2.4_2.37.2.bb  |   25 ------------
 .../use-usr-bin-env-for-python.patch               |   20 ---------
 .../gobject-introspection_0.9.10.bb                |   32 ---------------
 .../gobject-introspection_git.bb                   |   34 ----------------
 .../gpe-scap/gpe-scap/use.libsoup-2.4.patch        |   42 ++++++++++++++++++++
 meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb |    8 ++-
 .../loudmouth/loudmouth-1.4.3/glib-2.32.patch      |   10 +++++
 .../loudmouth/loudmouth_1.4.3.bb                   |    5 ++-
 .../recipes-core/glib-2.0/glibmm/glib-2.32.patch   |   10 +++++
 meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb     |    7 +--
 .../libgee/{libgee_0.6.0.bb => libgee_0.6.4.bb}    |   11 ++---
 11 files changed, 79 insertions(+), 125 deletions(-)
 delete mode 100644 meta-efl/recipes-support/libsoup/libsoup-2.4_2.37.2.bb
 delete mode 100644 meta-gnome/recipes-gnome/gobject-introspection/gobject-introspection/use-usr-bin-env-for-python.patch
 delete mode 100644 meta-gnome/recipes-gnome/gobject-introspection/gobject-introspection_0.9.10.bb
 delete mode 100644 meta-gnome/recipes-gnome/gobject-introspection/gobject-introspection_git.bb
 create mode 100644 meta-gpe/recipes-graphics/gpe-scap/gpe-scap/use.libsoup-2.4.patch
 create mode 100644 meta-oe/recipes-connectivity/loudmouth/loudmouth-1.4.3/glib-2.32.patch
 create mode 100644 meta-oe/recipes-core/glib-2.0/glibmm/glib-2.32.patch
 rename meta-oe/recipes-devtools/libgee/{libgee_0.6.0.bb => libgee_0.6.4.bb} (46%)

-- 
1.7.8.6



