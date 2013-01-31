Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U0uYh-0001jp-0O
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Jan 2013 14:52:10 +0100
Received: from mail-we0-f200.google.com ([74.125.82.200])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 31 Jan 2013 05:36:21 -0800
Received: by mail-we0-f200.google.com with SMTP id d7so3148656wer.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2013 05:36:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=jjF/h7EjiSAYnd161PktRntLO9rfrqx1bLJ53Qujusc=;
	b=guHYAc0xmlSJhRhjvBAeV7xZDXIKpUNdP47TP1e79Csly6sRetvqcfw2OpP7fXTA4W
	XmN7Q4KoAQ+CE7ZXu4jnKQ+9VwEQwu0iZapYglifdyvf2uALMfTbeGEWltJAk/0NwzjG
	Rmozi0hYPa0shoiMNq7vcghIvctKtkarPxYCrHKk0jee50ekVm7htZCTTI5oLLQosG+R
	/gwDm3V6yhRDeUBGqqDDL4iLDDT3/+InrxtCPtJBmw3Dns1jgHl/mMXdXYK90JpuYw8I
	pMcVg4PbwU96oBk/kkUsJuYF5Y27Ok71Hpo71r7MlEVzUWLjLs0Syg8JVhgDv43zDpO7
	Z2ig==
X-Received: by 10.194.90.238 with SMTP id bz14mr15615600wjb.9.1359639379991;
	Thu, 31 Jan 2013 05:36:19 -0800 (PST)
X-Received: by 10.194.90.238 with SMTP id bz14mr15615593wjb.9.1359639379928;
	Thu, 31 Jan 2013 05:36:19 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ex6sm9346319wid.3.2013.01.31.05.36.18
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 31 Jan 2013 05:36:19 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Jan 2013 13:34:13 +0000
Message-Id: <cover.1359639067.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQldNp/YQNgFGgbpNV9oA8Pj3IlfZWDgXtyHpEI3Qx+jCNBdcbCEhXxbDMJlhlyFbN3jbjcASWL2fvqnDMsx1m9eFHL78NR31RU3z+PJYnce9FxrBmNyq5hp1OfkqEXIZ3OpZseUEwM34Yc14Pb31GMVJYvW/Q08LEUIlyiRRXGYix1SriVUTz8dc44z9d2JCsdGMZbu
Subject: [meta-multimedia][PATCH 0/1] Add libmusicbrainz
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
X-List-Received-Date: Thu, 31 Jan 2013 13:52:14 -0000

libmusicbrainz isn't actually used in oe-core, as the dependency in
gst-plugins-bad is actually for the old v1 of libmusicbrainz, where as this is
v5.

Move to meta-multimedia as it's still a useful package.

One caveat is that if it's rebuild, you'll occasionally see cmake failures due
to the existing build and the host/target split.  I've tried fixing this but
don't understand enough about cmake to resolve it.

Ross

The following changes since commit d6d009b2625d6bcc7152d700fce2fdfecd3e0bd7:

  nodejs: update 0.6.x to 0.6.21 (2013-01-31 12:59:06 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib ross/mb

for you to fetch changes up to 8368232e3997a3553addd705aacd0d1c56177682:

  libmusicbrainz: add (2013-01-31 13:30:09 +0000)

----------------------------------------------------------------
Ross Burton (1):
      libmusicbrainz: add

 .../musicbrainz/files/allow-libdir-override.patch  |   21 +++++++++++
 .../musicbrainz/libmusicbrainz_git.bb              |   38 ++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/musicbrainz/files/allow-libdir-override.patch
 create mode 100644 meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb

Ross Burton (1):
  libmusicbrainz: add

 .../musicbrainz/files/allow-libdir-override.patch  |   21 +++++++++++
 .../musicbrainz/libmusicbrainz_git.bb              |   38 ++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/musicbrainz/files/allow-libdir-override.patch
 create mode 100644 meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb

-- 
1.7.10.4



