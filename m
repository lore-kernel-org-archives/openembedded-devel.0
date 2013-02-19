Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U7bxH-0002ww-6d
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Feb 2013 02:25:11 +0100
Received: by mail-pb0-f41.google.com with SMTP id um15so1944964pbc.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2013 17:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=8QzLY7wbp6VafhdZk9JmpRTUGnHc+t8+HSqzM53BXsw=;
	b=QqAHltHU0j0FYqgHl9uxKRuciU9Gp6GqVYbUdBm45ME4N1nLnZCMWVsjQYV5G1mq0+
	fUA2+u4L6tQHVQhTMFuV9ZnauOoNE5oxnm98CHqZzJ98jsoKlefbsPYVZJhjL2ONCOWn
	5/tJ5XS774CbDUW+ElSBbWhREpFSf8M/dn8vHzdMryBVQkE2FLgmv8cekSgk6TEH5x6L
	8lGuGSJHlQqUV0qtj8JcYH67k95U/qoeeIiaoCTJ+V80k3EsnvLp51xVN5Mm2mdoULF3
	D3cSldNS07EYaOlZQU8iHiaizlcjYua0cVJ99ooNXROMmk7UBkRnfwtXfmYv3mH7zMCU
	rRWQ==
X-Received: by 10.68.217.164 with SMTP id oz4mr34860005pbc.73.1361236141880;
	Mon, 18 Feb 2013 17:09:01 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id tm1sm16047816pbc.11.2013.02.18.17.08.59
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 Feb 2013 17:09:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Feb 2013 02:08:41 +0100
Message-Id: <cover.1361235235.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [PATCH][for-danny 0/2] ca-certificates, e-wm
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
X-List-Received-Date: Tue, 19 Feb 2013 01:25:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

e-wm change is not in master, because it was resolved in newer e-wm release

ca-certificates is upgraded even with old sources now available on sources.oe.org, 
to remove turktrust certificates:
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=697366

The following changes since commit c02834a7cc5fda525c7ebeec545625233bab4cb5:

  xf86-video-geode: Update to 2.11.14 (2013-02-15 12:16:55 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/for-danny2
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/for-danny2

Lukas Märdian (1):
  meta-efl: include illume home button fix

Martin Jansa (1):
  ca-certificates: upgrade to 20130119

 .../e17/e-wm/Fix-Illume-Home-Button.diff           | 166 +++++++++++++++++++++
 meta-efl/recipes-efl/e17/e-wm_svn.bb               |   3 +-
 ...tes_20120623.bb => ca-certificates_20130119.bb} |   4 +-
 3 files changed, 170 insertions(+), 3 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/e-wm/Fix-Illume-Home-Button.diff
 rename meta-oe/recipes-support/ca-certificates/{ca-certificates_20120623.bb => ca-certificates_20130119.bb} (89%)

-- 
1.8.1.2



