Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UAbku-0000V9-VK
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Feb 2013 08:48:49 +0100
Received: by mail-ee0-f42.google.com with SMTP id b47so173471eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2013 23:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=uls/HJUzazELbLX3+r2MAwYRSlnP+Nn4cIaoNMCwHqQ=;
	b=KCweDV6qyitREldifrifR7SpCot43kc4HZviRwn3019G3+MJHqmJryAoRskfCbkwI/
	MMTZBGpGZoHRCEdNcrnzC/b5FntjoyxJYT+Zml3bCm39sNh0KOA25vIeZ1hTl13/kny7
	m9nHb3eGpzRAaPnyG0BAHlTlflpWs+h+2toywoLuyCGK8qMp9oH+MISFnnSMOIbQjaZc
	gaY52YEVQm7GlrMrEpXvmQgGWaY/+tWCqxTapimupObjHINiqZt6yGdD7qx5G3XtP4a6
	5JwTPIKn9EU1EcmcszuY3gSD55FZ8qF/hJ0/MWRPSie4Ht547pPD1YfjK1RqugccvKhZ
	Gphg==
X-Received: by 10.14.220.135 with SMTP id o7mr3722894eep.3.1361950348692;
	Tue, 26 Feb 2013 23:32:28 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id f47sm4872129eep.13.2013.02.26.23.32.26
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 26 Feb 2013 23:32:27 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Feb 2013 08:30:23 +0100
Message-Id: <1361950224-26188-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-oe] geany-fix
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
X-List-Received-Date: Wed, 27 Feb 2013 07:48:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Martin,

I did not see the mentioned error here so can you please build test in world
before applying - Thanks.

Andreas

The following changes since commit 84ea5433739ddc2551216902f6053d5c2368e755:

  macchanger: added 1.5.0 recipe (2013-02-25 09:59:56 -0500)

are available in the git repository at:
  git@gitorious.org:schnitzeltony-oe-meta/meta-openembedded.git geany-fix

Andreas Müller (1):
      geany: fix compile by removing extra check for c++ compiler

 ...001-configure.ac-remove-additional-c-test.patch |   47 ++++++++++++++++++++
 meta-oe/recipes-devtools/geany/geany_1.22.bb       |    6 ++-
 2 files changed, 52 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/geany/geany/0001-configure.ac-remove-additional-c-test.patch

-- 
1.7.6.5



