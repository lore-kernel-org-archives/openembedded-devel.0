Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SanLN-00027y-8q
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jun 2012 14:22:09 +0200
Received: by wibhm14 with SMTP id hm14so1272860wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jun 2012 05:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=2JpwZg8baCTaTaMREQKAuQsRo5q6iLCKhwIeKTuQ+OU=;
	b=nS6zYxWGvd+V8EE7xgELFzfTcIXSzA4zBy1p1Ez7UmSPkO4GkzZqTtxAfvbT3BfX2Z
	3nzGFSB5hrfv+9vak6AZuowDemq9fMHib8ERrXT1ZyErtYKRNSLq2V4j0A2aX6E+YOhg
	CpEfDY539zyDfiOtVqJbVY8acrHjgtMqBcW/6nc2vqbbdn4Lx3XKi4ubas9Pu6psjJMo
	ZB2lqkeIV5d4oETsKHykV0c+JFtmKy2nW53ZomE0qSm4+zpGisrqGoFRvqq4DJg3mHFO
	b9ZX+hTR6Q8sDmpzqqHsMx04SRIpMqtFYpRCV/v0tyRpuuluZ5Hb9eG8ZQNHU/NWNYjy
	9e/g==
Received: by 10.216.145.219 with SMTP id p69mr4056758wej.37.1338639106978;
	Sat, 02 Jun 2012 05:11:46 -0700 (PDT)
Received: from localhost.localdomain (p5B0A09D7.dip.t-dialin.net.
	[91.10.9.215])
	by mx.google.com with ESMTPS id d10sm6981854wiy.3.2012.06.02.05.11.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jun 2012 05:11:46 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jun 2012 14:15:46 +0200
Message-Id: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-xfce 00/15] bugfix, new panel plugins ans xfce4-mixer
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
X-List-Received-Date: Sat, 02 Jun 2012 12:22:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All have been run tested on angstrom/overo

Andreas Müller (15):
  xfce4-session: add consolekit to RDEPENDS
  xfce4-xkb-plugin 0.5.4.3 inital add
  xfce4-wavelan-plugin: initial add 0.5.10
  xfce4-places-plugin: initial add 1.3.0
  xfce4-datetime-plugin: update to latest git and unbreak build with
    xfce4-dev-tools 4.10.0
  xfce4-diskperf-plugin: update to 2.5.3
  xfce4-cpugraph-plugin: update to 1.0.2
  xfce4-clipman-plugin: update to 1.2.3
  xfce4-genmon-plugin: update to 3.4.0
  xfce4-systemload-plugin: initial add 1.1.0
  xfce4-time-out-plugin: initial add 1.0.1
  xfce4-embed-plugin: initial add 1.0.0
  xfce4-weather-plugin: Make it work for a while by using different
    license info
  xfce4-mixer: initial add 4.8.0
  task-xfce-extended: add panel plugins / applications

 .../recipes-apps/xfce4-mixer/xfce4-mixer_4.8.0.bb  |   14 ++
 ...ugin_1.2.2.bb => xfce4-clipman-plugin_1.2.3.bb} |    4 +-
 .../cpugraph/files/port-to-libxfce4ui.patch        |  102 -------------
 ...gin_1.0.1.bb => xfce4-cpugraph-plugin_1.0.2.bb} |    6 +-
 ...xfce4ui.patch => 0001-port-to-libxfce4ui.patch} |    1 +
 ...re.ac.in-remove-breaking-BM_DEBUG_SUPPORT.patch |   32 ++++
 .../datetime/xfce4-datetime-plugin_git.bb          |    5 +-
 .../diskperf/files/port-to-libxfce4ui.patch        |  142 ------------------
 ...gin_2.3.0.bb => xfce4-diskperf-plugin_2.5.3.bb} |    6 +-
 .../embed/xfce4-embed-plugin_1.0.0.bb              |   12 ++
 .../genmon/files/port-to-libxfce4ui.patch          |  150 --------------------
 ...lugin_3.3.1.bb => xfce4-genmon-plugin_3.4.0.bb} |    6 +-
 .../places/xfce4-places-plugin_1.3.0.bb            |    9 ++
 .../systemload/xfce4-systemload-plugin_1.1.0.bb    |   11 ++
 .../time-out/xfce4-time-out-plugin_1.0.1.bb        |   10 ++
 .../wavelan/xfce4-wavelan-plugin_0.5.10.bb         |    9 ++
 .../weather/xfce4-weather-plugin_0.7.4.bb          |   11 ++
 .../xkb/xfce4-xkb-plugin_0.5.4.3.bb                |   14 ++
 meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb |   11 ++-
 .../xfce4-session/xfce4-session_4.8.3.bb           |    3 +-
 20 files changed, 147 insertions(+), 411 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.8.0.bb
 rename meta-xfce/recipes-panel-plugins/clipman/{xfce4-clipman-plugin_1.2.2.bb => xfce4-clipman-plugin_1.2.3.bb} (69%)
 delete mode 100644 meta-xfce/recipes-panel-plugins/cpugraph/files/port-to-libxfce4ui.patch
 rename meta-xfce/recipes-panel-plugins/cpugraph/{xfce4-cpugraph-plugin_1.0.1.bb => xfce4-cpugraph-plugin_1.0.2.bb} (55%)
 rename meta-xfce/recipes-panel-plugins/datetime/files/{port-to-libxfce4ui.patch => 0001-port-to-libxfce4ui.patch} (99%)
 create mode 100644 meta-xfce/recipes-panel-plugins/datetime/files/0002-configure.ac.in-remove-breaking-BM_DEBUG_SUPPORT.patch
 delete mode 100644 meta-xfce/recipes-panel-plugins/diskperf/files/port-to-libxfce4ui.patch
 rename meta-xfce/recipes-panel-plugins/diskperf/{xfce4-diskperf-plugin_2.3.0.bb => xfce4-diskperf-plugin_2.5.3.bb} (55%)
 create mode 100644 meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.0.0.bb
 delete mode 100644 meta-xfce/recipes-panel-plugins/genmon/files/port-to-libxfce4ui.patch
 rename meta-xfce/recipes-panel-plugins/genmon/{xfce4-genmon-plugin_3.3.1.bb => xfce4-genmon-plugin_3.4.0.bb} (65%)
 create mode 100644 meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.3.0.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.1.0.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.0.1.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.10.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.5.4.3.bb

-- 
1.7.4.4



