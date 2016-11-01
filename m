Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id E214871C2D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Nov 2016 18:30:57 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id a197so94427552wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2016 11:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6T5gDtj1a6WjauLukIr8H6QscUPetL4hSO0AzeTt4Gg=;
	b=NaB+rYSq6GbHTbp+0WN+go/LrOZeYGE89cCAHZFHe5yBRRpsq81pnezYlisYBo0LBF
	18hoYpNKgzVaqssxgDfnAoNKWWdysFUj8LnNcj4KhpPpwKJYIl/D7RXgP9C2DrDIj/sM
	Ha0WieGdFeVWN9Zii+/XMQJHRruCJJm4qJ3bg3i/BIIZPIHOhev3NLlDuJqSY3bYou7v
	EbjYijnYt6Sank+H2gSnNtxjLXhTsqJJOmcWpAUeR6gRwfm9Wjyz0if7IZBMnNyF8LeP
	FYnPT0itaOR3wm2NH3K+xz7/EtbiOPUoY1HBHSCXQ8W2juzVY+RAwAUESt1eH8MgSAeY
	48JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6T5gDtj1a6WjauLukIr8H6QscUPetL4hSO0AzeTt4Gg=;
	b=V+nYCCFe8mLXuPhlucjTrU8Ke4sE1kfVggMn47DZyu37dhHCCDujshpcdWQfkleMpp
	WJbf3QuFFnVk9MAFgY85mMd0SNK0/kUm6tCbreBGf/terBWbJlFwA8w4WX5lKSf2GdIH
	CY3jcydaBdAhCYvFWDodBL5dpVgb1HYMn39EpEW6I3NLlaP92vj1ai/wVrj/0H1abIWL
	QYimLNDWjffwXyYIxW6KXPR4ikoK5XjI7smjLjVAD4VBmALXwXTBsefdI6MVRYDnk+o1
	CvgNp27JMy0IAxAhoMyIFzKV595GCMDvCYkMtlRy+C077TLvRt8eADnZwlKcVnmjIURq
	WNug==
X-Gm-Message-State: ABUngveXGzUcn0ZLMxu8pyZ0sHNR+WNt9ismhRi6oiqO/9qtPDT3Eq45ty6iLxc8yisSGw==
X-Received: by 10.194.99.69 with SMTP id eo5mr218211wjb.138.1478025058069;
	Tue, 01 Nov 2016 11:30:58 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3D1D.dip0.t-ipconnect.de.
	[91.10.61.29]) by smtp.googlemail.com with ESMTPSA id
	m194sm31902763wmg.11.2016.11.01.11.30.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Nov 2016 11:30:57 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Nov 2016 19:30:41 +0100
Message-Id: <1478025042-25619-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 0/1] gstreamer: fix rare but annoying build errors
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
X-List-Received-Date: Tue, 01 Nov 2016 18:30:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

After landing in master the following patch is a candidate for morty too. 

Andreas Müller (1):
  gstreamer: fix rare but annoying build errors

 ...2.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch | 32 ++++++++++++++++++++++
 .../gstreamer-0.10/gstreamer_0.10.36.bb            |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0002-gst-glib2.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch

-- 
2.5.5


