Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id E43BA65E52
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 07:32:46 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id t10so8294510eei.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 00:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=1f6oH9HTVZzuJBXFULmELZd2ksuF7rYwmO1Dw2RnXzw=;
	b=mlurnOIFo2MsLx3CjtovgkFD8ao15rI/v+lx8Gj3q9tkMU2w3tMXhAmnoTS6HAMMTF
	i3Whgb3WZilGLov9z6wRKg3PRY5BZ9f9rhXUhy6NYb8kpEzqXKoA3AJ2wj1rzedYPvC6
	PSY2FNhLpq86NmqeouVXfGkDHtotqWu+720BU+BFJJ/a+FY/wbxohHbhfExl3F/BbXcs
	VQMboVT5WFA5mIx45jl+aho/1pW3VPjUZShFl345cIOALYxD6EYWKB8+4VryjGYkU4F0
	05aeONWVSI318kIYR/XX4zEpQ6OFL7Q7gEhh5TQnygWbAm39ZOy/qDAnJHUPQyUhHu+W
	Bq5A==
X-Received: by 10.14.98.69 with SMTP id u45mr2943825eef.81.1397633566766;
	Wed, 16 Apr 2014 00:32:46 -0700 (PDT)
Received: from localhost.localdomain (ip-178-200-247-162.unitymediagroup.de.
	[178.200.247.162]) by mx.google.com with ESMTPSA id
	a42sm55485161ees.10.2014.04.16.00.32.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Apr 2014 00:32:46 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Apr 2014 09:32:28 +0200
Message-Id: <1397633550-19323-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/2] avoid nautilus build by default
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Apr 2014 07:32:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There is no reason why we need to build nautilus when using evince and/or
gnome-disk-utility.

Andreas Müller (2):
  evince: make nautilus extension a PACKAGECONFIG and disable by default
  gnome-disk-utility: change PACKAGECONFIG default: remove nautilus

 meta-gnome/recipes-gnome/evince/evince_2.32.0.bb                    | 6 ++++--
 .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb   | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
1.8.3.1


