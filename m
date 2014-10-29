Return-Path: <cliff.brake@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2819B6AC49
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Oct 2014 18:08:34 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id z107so2703555qgd.32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Oct 2014 11:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:cc:content-type; 
	bh=ffp1KaksDaysgCiVGOfV7T2kEZs0Yhba1ImQeun43OE=;
	b=NUDngEMCmHNp2cXfNPi6W7XW0USor6FmkiOqy1OFFwosCDQ/AsxNG3vACPKaHX/ljr
	Os0oN8+TJqtu4SIPjPbhh8k45+JA3sMS5YCASPIAQNOAaKJaqn8OngSr567qYQ29j+/y
	LHdKIp/4uKE7yrfUD8231VGWEWuUM0GDGsFZf2kGXns6lFaba2gAYpDDEGG6XjWq/8Ba
	v9hN0wB+yWRE0J1frJkyaedQDXdx97CFPUPHanvSvIYt/SCCvNgkMheNYItA/J0r1BHB
	2J37vxag77vf63INoAp3u6hULeTdEWPkmLy4WPEyMlLmQgBFBVS0mZWNnRXU5nLMQYYT
	kK3Q==
MIME-Version: 1.0
X-Received: by 10.229.7.133 with SMTP id d5mr18441619qcd.24.1414606106568;
	Wed, 29 Oct 2014 11:08:26 -0700 (PDT)
Sender: cliff.brake@gmail.com
Received: by 10.140.21.51 with HTTP; Wed, 29 Oct 2014 11:08:26 -0700 (PDT)
Date: Wed, 29 Oct 2014 14:08:26 -0400
X-Google-Sender-Auth: SzYGjTHNptFmdf7VO_boHfRB_jc
Message-ID: <CAOd_LFxfPjWtLYc58XCZAYq9eUd_1fCQMc0ehbd-WtHgccdsqg@mail.gmail.com>
From: Cliff Brake <cbrake@bec-systems.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][meta-ruby][daisy] pull request: ruby fixes
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
X-List-Received-Date: Wed, 29 Oct 2014 18:08:43 -0000
Content-Type: text/plain; charset=UTF-8

The following changes since commit 518cd119a8724dbd485a5d5c5047de59e8fbd652:

  imagemagick: fix SRC_URI (2014-10-14 10:49:48 -0400)

are available in the git repository at:

  https://github.com/cbrake/meta-openembedded.git daisy

for you to fetch changes up to 8065dd8456913457a0114ddb2b4bd4842847b2a3:

  ruby: fix race conditions at install-ext (2014-10-29 14:03:22 -0400)

----------------------------------------------------------------
Jackie Huang (1):
      ruby: fix race conditions at install-ext

Roy Li (1):
      ruby: fix a parallel building issue

 meta-ruby/recipes-devtools/ruby/ruby/remove-the-dependency-on-dir.patch
                   | 37 +++++++++++++++++++++++++++++++++++++
 meta-ruby/recipes-devtools/ruby/ruby/ruby-mkmf.rb-fix-race-conditions-at-install-ext.patch
| 31 +++++++++++++++++++++++++++++++
 meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
                     |  2 ++
 3 files changed, 70 insertions(+)
 create mode 100644
meta-ruby/recipes-devtools/ruby/ruby/remove-the-dependency-on-dir.patch
 create mode 100644
meta-ruby/recipes-devtools/ruby/ruby/ruby-mkmf.rb-fix-race-conditions-at-install-ext.patch

