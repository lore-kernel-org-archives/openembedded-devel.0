Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SxoeD-0002RV-MH
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 02:24:45 +0200
Received: by wibhm2 with SMTP id hm2so540004wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 17:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=Z7ojeP+m7oTekfuIjNr8MH/w0ugr0jARvvbxfZq88cU=;
	b=qA8AheERsC0fjtX3skmTfySj4PpVRVFroAuwvg5Z/RagtocQERtVXpWsxd8jVXmDCX
	QG8l2T4bDwr9qvjcEfS2dmsKsXC6C3tIhs4h7KEhKumxceMDRyECE5XCUq17TtJqipt7
	gfh3FTC0IBOq6Jg9Be3EWlFoZTdlP9cb/jWlbEmWFv1nT1MXFnI9tB1KvYbpusaIFgs/
	7kBaDdxhNbI2NdCTbBCZLLzqR8TSdZxMf3QEvT5wZHN1nVvbiNLOWnVDJgl1iyb1nrpZ
	OSPz+VBtFu6Ut0p1kS1jK68/XiSIQE6NFChkcT1jN9k+RSBkILbxwQyM2Ydpfmk1Ta43
	g2Tw==
Received: by 10.180.100.133 with SMTP id ey5mr7393377wib.4.1344125582937;
	Sat, 04 Aug 2012 17:13:02 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0E34.dip.t-dialin.net.
	[91.10.14.52])
	by mx.google.com with ESMTPS id l6sm6430551wiz.4.2012.08.04.17.13.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Aug 2012 17:13:02 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Aug 2012 02:19:45 +0200
Message-Id: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-angstrom 00/16] split tasks into recipes to reduce number of build tasks
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
X-List-Received-Date: Sun, 05 Aug 2012 00:24:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are image recipes around requiring only a subset of what is found in
angstrom-task-gnome(3) e.g. meta-ettus-images, angstrom images and mine [1].
Unfortunately all recipes touched by angstrom-task-gnome(3) are build without
being required/packed in the images. For xfce-nm-image this patch series reduces
the number of task more than 700.

[1] http://gitorious.org/schnitzeltony-oe-meta/meta-misc/blobs/master/recipes-image/xfce-base-image.bb

Andreas Müller (16):
  angstrom-task-gnome: split out task-gnome-apps
  angstrom-task-gnome: split out task-gnome-fonts
  angstrom-task-gnome: split out task-gnome
  angstrom-task-gnome: split out task-gnome-gstreamer
  angstrom-task-gnome: split out task-gnome-perl
  angstrom-task-gnome: remove unused packages
  angstrom-task-gnome: split out task-gnome-themes
  angstrom-task-gnome: split out task-gnome-xserver-base
  angstrom-task-gnome3: split out task-gnome3-apps
  angstrom-task-gnome3: split out task-gnome3-fonts
  angstrom-task-gnome3: split out task-gnome3
  angstrom-task-gnome3: split out task-gnome3-gstreamer
  angstrom-task-gnome3: split out task-gnome3-perl
  angstrom-task-gnome3: remove unused packages
  angstrom-task-gnome3: split out task-gnome3-themes
  angstrom-task-gnome3: split out task-gnome3-xserver-base

 recipes-angstrom/tasks/angstrom-task-gnome.bb     |  100 +--------------------
 recipes-angstrom/tasks/angstrom-task-gnome3.bb    |   94 +-------------------
 recipes-angstrom/tasks/task-gnome-apps.bb         |   14 +++
 recipes-angstrom/tasks/task-gnome-fonts.bb        |   17 ++++
 recipes-angstrom/tasks/task-gnome-gstreamer.bb    |   22 +++++
 recipes-angstrom/tasks/task-gnome-perl.bb         |   15 +++
 recipes-angstrom/tasks/task-gnome-themes.bb       |   35 +++++++
 recipes-angstrom/tasks/task-gnome-xserver-base.bb |   25 +++++
 recipes-angstrom/tasks/task-gnome.bb              |   26 ++++++
 recipes-angstrom/tasks/task-gnome3-apps.bb        |   13 +++
 recipes-angstrom/tasks/task-gnome3.bb             |   23 +++++
 11 files changed, 193 insertions(+), 191 deletions(-)
 create mode 100644 recipes-angstrom/tasks/task-gnome-apps.bb
 create mode 100644 recipes-angstrom/tasks/task-gnome-fonts.bb
 create mode 100644 recipes-angstrom/tasks/task-gnome-gstreamer.bb
 create mode 100644 recipes-angstrom/tasks/task-gnome-perl.bb
 create mode 100644 recipes-angstrom/tasks/task-gnome-themes.bb
 create mode 100644 recipes-angstrom/tasks/task-gnome-xserver-base.bb
 create mode 100644 recipes-angstrom/tasks/task-gnome.bb
 create mode 100644 recipes-angstrom/tasks/task-gnome3-apps.bb
 create mode 100644 recipes-angstrom/tasks/task-gnome3.bb

-- 
1.7.4.4



