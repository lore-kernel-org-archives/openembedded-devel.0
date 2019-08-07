Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 42F237F445
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Aug 2019 05:18:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x775HXNi003952
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Aug 2019 22:17:43 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 6 Aug 2019 22:17:10 -0700
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>, <raj.khem@gmail.com>
Date: Wed, 7 Aug 2019 01:17:05 -0400
Message-ID: <20190807051707.8709-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 0/2] Add recipe of xfce4-datetime-setter
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Aug 2019 05:18:09 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Hi Andreas,

I add recipe of xfce4-datetime-setter which is from your repo from
github. But I found it requires dbus service org.freedesktop.timedate1
which is from systemd. So make xfce4-settings requires it only when init manger
is sytemd. Any comment on that please?

Regards,
Kai

Kai Kang (2):
  xfce4-datetime-setter: add recipe
  xfce4-settings: rrecommends xfce4-datetime-setter

 .../xfce4-datetime-setter_3.32.2.bb            | 18 ++++++++++++++++++
 .../xfce4-settings/xfce4-settings_4.13.7.bb    |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644 meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb

--
2.20.0


