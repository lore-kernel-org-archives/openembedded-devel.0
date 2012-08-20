Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T3ZDA-0006ek-BQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2012 23:08:36 +0200
Received: by wibhn17 with SMTP id hn17so3585094wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 13:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=A+eC01mrcbXwj8tf4VB4g//7vL0iu8PLVH/0Mk19Jh8=;
	b=gNBIytvVY3r21j0uXkWRA7JPl/GdvhB/azyOYEwJI5+908DEcfPqlBLlFjbybLn9DQ
	JIrE9LIbvyFzWGtt3yhEiGQLGt+pkUVcUWaDLE3AWy0pTe99iAHKZ2OThG9f5J1ZRfqt
	Vbn+4kIhcW3cx488PL6wVDjdo1qE1Y7lu9n1CVvyjNqwVVi4a4QJeRmBiBSZ9YiCwPha
	WqyUH4ZNTnZHXwJiTZV1FZUs7cvaoIPHbv476dYZksmY0OoCONIyr8UmAJ4iCjxVXQuh
	DBF1B1ozOZxXE+al9Tt7G/QXqXGBP/3vc2w7xYT5HKcgPxq8QsCje5H2C21fV1t+HB4L
	88SQ==
Received: by 10.180.75.209 with SMTP id e17mr37196882wiw.0.1345496193349;
	Mon, 20 Aug 2012 13:56:33 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm44375033wix.6.2012.08.20.13.56.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 13:56:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2012 22:56:27 +0200
Message-Id: <cover.1345496053.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/8] CONSOLIDATED REQUEST
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
X-List-Received-Date: Mon, 20 Aug 2012 21:08:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit b64269b221774fe970382a62ae4b4d1b8e38edac:

  Merge remote-tracking branch 'meta-oe-contrib/jansa/efl' (2012-08-20 20:04:32 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Andreas Müller (2):
  pango: remove and use oe-core version 1.30
  pulseaudio: remove bbappend

Khem Raj (1):
  machine_kernel_pr.bbclass: provides MACHINE_KERNEL_PR functionality

Martin Jansa (2):
  pixman: update bbappend to match 0.27.2
  connman: rename bbappend to match new 1.4 version from oe-core

Ross Burton (3):
  meta-gnome: add libical
  meta-gnome: add evolution-data-server
  meta-gnome: add Pimlico (contacts, dates, tasks)

 .../avoid_automake_errors.patch                    |   83 ++++++++
 .../eds/evolution-data-server/depbuildfix.patch    |   78 ++++++++
 .../fix_for_automake-1.12.x.patch                  |   28 +++
 .../eds/evolution-data-server/iconv-detect.h       |    5 +
 .../evolution-data-server/new-contact-fix.patch    |   23 +++
 .../eds/evolution-data-server/nossl.patch          |   70 +++++++
 .../eds/evolution-data-server/oh-contact.patch     |  203 ++++++++++++++++++++
 .../eds/evolution-data-server/old-gdk-api.patch    |   19 ++
 .../optional_imapx_provider.patch                  |   64 ++++++
 .../recipes-gnome/eds/evolution-data-server_git.bb |  111 +++++++++++
 meta-gnome/recipes-gnome/pimlico/contacts.inc      |   34 ++++
 .../contacts-conditionally-install-schema.patch    |   37 ++++
 .../contacts/contacts-owl-window-menu.patch        |   54 +++++
 .../recipes-gnome/pimlico/contacts/make-382.patch  |   16 ++
 .../pimlico/contacts/stock_contact.png             |  Bin 0 -> 2311 bytes
 .../pimlico/contacts/stock_person.png              |  Bin 0 -> 2280 bytes
 meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb   |   18 ++
 meta-gnome/recipes-gnome/pimlico/contacts_git.bb   |   19 ++
 meta-gnome/recipes-gnome/pimlico/dates.inc         |   20 ++
 .../pimlico/dates/dates-owl-window-menu.patch      |   67 +++++++
 .../dates/dso_linking_change_build_fix.patch       |   44 +++++
 .../recipes-gnome/pimlico/dates/make-382.patch     |   18 ++
 .../uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch      |   37 ++++
 meta-gnome/recipes-gnome/pimlico/dates_0.4.8.bb    |    5 +
 meta-gnome/recipes-gnome/pimlico/dates_git.bb      |   18 ++
 meta-gnome/recipes-gnome/pimlico/tasks.inc         |   16 ++
 .../recipes-gnome/pimlico/tasks/tasks-owl.diff     |   67 +++++++
 meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb     |   15 ++
 meta-gnome/recipes-gnome/pimlico/tasks_git.bb      |    9 +
 .../libical/files/pthread-fix.patch                |   52 +++++
 meta-gnome/recipes-support/libical/libical_0.48.bb |   17 ++
 meta-oe/classes/machine_kernel_pr.bbclass          |    8 +
 .../pango/pango-1.29.4/no-tests.patch              |   11 -
 meta-oe/recipes-graphics/pango/pango_1.29.4.bb     |   10 -
 ...lated-workarounds-in-cpu-features-detecti.patch |  122 +++++++-----
 ...plementation-of-pixman_blt-with-overlapp.patch} |   37 +++--
 ...xman_0.26.2.bbappend => pixman_0.27.2.bbappend} |    5 +-
 .../{connman_1.3.bbappend => connman_1.4.bbappend} |    0
 .../pulseaudio/pulseaudio-2.0-udev-symbols.patch   |   80 --------
 .../pulseaudio/pulseaudio_2.0.bbappend             |    5 -
 40 files changed, 1355 insertions(+), 170 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/avoid_automake_errors.patch
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/depbuildfix.patch
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/fix_for_automake-1.12.x.patch
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/iconv-detect.h
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/new-contact-fix.patch
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/nossl.patch
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/oh-contact.patch
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/old-gdk-api.patch
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/optional_imapx_provider.patch
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
 create mode 100644 meta-gnome/recipes-gnome/pimlico/contacts.inc
 create mode 100644 meta-gnome/recipes-gnome/pimlico/contacts/contacts-conditionally-install-schema.patch
 create mode 100644 meta-gnome/recipes-gnome/pimlico/contacts/contacts-owl-window-menu.patch
 create mode 100644 meta-gnome/recipes-gnome/pimlico/contacts/make-382.patch
 create mode 100644 meta-gnome/recipes-gnome/pimlico/contacts/stock_contact.png
 create mode 100644 meta-gnome/recipes-gnome/pimlico/contacts/stock_person.png
 create mode 100644 meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb
 create mode 100644 meta-gnome/recipes-gnome/pimlico/contacts_git.bb
 create mode 100644 meta-gnome/recipes-gnome/pimlico/dates.inc
 create mode 100644 meta-gnome/recipes-gnome/pimlico/dates/dates-owl-window-menu.patch
 create mode 100644 meta-gnome/recipes-gnome/pimlico/dates/dso_linking_change_build_fix.patch
 create mode 100644 meta-gnome/recipes-gnome/pimlico/dates/make-382.patch
 create mode 100644 meta-gnome/recipes-gnome/pimlico/dates/uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch
 create mode 100644 meta-gnome/recipes-gnome/pimlico/dates_0.4.8.bb
 create mode 100644 meta-gnome/recipes-gnome/pimlico/dates_git.bb
 create mode 100644 meta-gnome/recipes-gnome/pimlico/tasks.inc
 create mode 100644 meta-gnome/recipes-gnome/pimlico/tasks/tasks-owl.diff
 create mode 100644 meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb
 create mode 100644 meta-gnome/recipes-gnome/pimlico/tasks_git.bb
 create mode 100644 meta-gnome/recipes-support/libical/files/pthread-fix.patch
 create mode 100644 meta-gnome/recipes-support/libical/libical_0.48.bb
 create mode 100644 meta-oe/classes/machine_kernel_pr.bbclass
 delete mode 100644 meta-oe/recipes-graphics/pango/pango-1.29.4/no-tests.patch
 delete mode 100644 meta-oe/recipes-graphics/pango/pango_1.29.4.bb
 rename meta-oe/recipes-graphics/xorg-lib/{pixman-0.26.2 => pixman-0.27.2}/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch (46%)
 rename meta-oe/recipes-graphics/xorg-lib/{pixman-0.26.2/0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch => pixman-0.27.2/0002-Generic-C-implementation-of-pixman_blt-with-overlapp.patch} (75%)
 rename meta-oe/recipes-graphics/xorg-lib/{pixman_0.26.2.bbappend => pixman_0.27.2.bbappend} (65%)
 rename meta-systemd/meta-oe/recipes-connectivity/connman/{connman_1.3.bbappend => connman_1.4.bbappend} (100%)
 delete mode 100644 meta-systemd/oe-core/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio-2.0-udev-symbols.patch
 delete mode 100644 meta-systemd/oe-core/recipes-multimedia/pulseaudio/pulseaudio_2.0.bbappend

-- 
1.7.8.6



