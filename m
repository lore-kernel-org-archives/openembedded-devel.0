Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 520B4601A9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 02:13:11 +0000 (UTC)
Received: by mail-ie0-f169.google.com with SMTP id to1so3336621ieb.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Apr 2014 19:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3/KfcmzDZItcS/OJMcl5X3YztNkMWIeDK9ev4PlywrE=;
	b=IVSPwU56CrOtYJZhnU9B4K/OgpX45NhjM9gffamqdjRA+x7a64lrMVKzLYO+FiZfSB
	SBJ7fxV5CImmqyHwD4tM0TaduURyxGHT3fJDsKu69yW9gd0193EsG4qeO8G/ntPeIfwC
	2arbEETMDyKhpJQEx25xyDg8IlJweoenvn3TkRrUjIVO3VVcwgJYuK+mC//39xMJNCjR
	Zp0JNB125Z+d0rP4iJpdIxxnoGj0zR9x8PiFpbXtadj2sK+q/NGrq7q5sseO6b7FpBbR
	6mVqLHnySbbTid7o0ROlVmaMbDRTCVbEjRUBY8xx8TEXD98a1zIzowAei+ScAYbgWfAd
	DQ1w==
X-Gm-Message-State: ALoCoQnG2hyfvMB20YHBx7luajtb3uDh/8YeDlN8e0+FdJVKvcJWpRtMpLUR5njzPngDJgLBGD2F
X-Received: by 10.42.235.197 with SMTP id kh5mr10820604icb.25.1397095992353;
	Wed, 09 Apr 2014 19:13:12 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id s8sm9664674ige.4.2014.04.09.19.13.11
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Apr 2014 19:13:11 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Apr 2014 22:12:50 -0400
Message-Id: <1397095971-17039-1-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: patches@linaro.org
Subject: [meta-gnome][PATCH] abiword: force build order
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
X-List-Received-Date: Thu, 10 Apr 2014 02:13:14 -0000

Every time I try to build abiword my build fails:

	make[3]: *** No rule to make target `../goffice-bits2/libgoffice.la', needed by `libabiword-3.0.la'.  Stop.
	make[3]: Leaving directory
	`/SSD/build/distroless/tmp/qemuarm-eglibc/work/armv5te-oe-linux-gnueabi/abiword/3.0.0-r0/abiword-3.0.0/src'

I've tried a couple things, and this is what works for me.

I tried setting PARALLEL_MAKE to "" and it still fails. The odd thing is, the
Makefiles do show ../goffice-bits2/libgoffice.la as being a dependency of
libabiword-3.0.la (opt_libs), but it still doesn't guarantee the dependency is
built ahead of time (in fact, never on my system). Maybe this dependency is
buried too deep in variables?

Then I thought that maybe it was an autotools-brokensep problem and gave that
a try too, but it still failed. I even created a patch to change the
${top_builddir} to ${top_srcdir}, but it still failed.

Trevor Woerner (1):
  abiword: force build order

 meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
1.9.0


