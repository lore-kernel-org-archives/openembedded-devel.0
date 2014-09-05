Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7CA34713C1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Sep 2014 15:07:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s85F7TIV021662
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 5 Sep 2014 08:07:29 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Fri, 5 Sep 2014 08:07:28 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <Martin.Jansa@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Fri, 5 Sep 2014 11:07:12 -0400
Message-ID: <1409929633-12730-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-Originating-IP: [128.224.56.18]
Subject: [meta-ruby][0/1] introduce a class to assist in building gems
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
X-List-Received-Date: Fri, 05 Sep 2014 15:08:02 -0000
Content-Type: text/plain

For a while now we have had functionality in meta-cloud-services in
Yocto to assist in building Ruby gems in to the rootfs images. Many of
these gems and the ruby.bbclass that was written to facilitate the
building of gems are not specific to our work in meta-cloud-services
and should be made more widely available by moving them to
meta-ruby. So this is my first attempt to get things moved and in
doing so make the meta-ruby layer more comprehensive.

We have used this ruby.bbclass in meta-cloud-services to build about
25 gems and in doing so we have worked out a number of issues and have
been successful in adding new gem recipes easily. Although at this
time focus has been on x86 and x86-64 so we have not yet attempting
any cross ARCH cross compiling. Since there are many parallels between
Ruby and Python we expect that when we do start to cross-compile we
will run into similar issues and don't anticipate major obstacles.

For now I have included a recipe for single gem, bundler. Including
this gem in your image will demonstrate that the class is able to
perform as advertised and examining bundler on the target we can
confirm the validity of the build:

--
root@qemux86-64:~# cat Gemfile
source 'https://rubygems.org'
gem 'rspec', :require => 'spec'

root@qemux86-64:~# bundle install
Don't run Bundler as root. Bundler can ask for sudo if it is needed, and
installing your bundle as root will break this application for all non-root
users on this machine.
Fetching gem metadata from https://rubygems.org/.........
Resolving dependencies...
Using diff-lcs 1.2.5
Installing rspec-support 3.1.0
Installing rspec-core 3.1.0
Installing rspec-expectations 3.1.0
Installing rspec-mocks 3.1.0
Installing rspec 3.1.0
Using bundler 1.6.2
Your bundle is complete!
Use `bundle show [gemname]` to see where a bundled gem is installed.

root@qemux86-64:~# bundle show
Gems included by the bundle:
  * bundler (1.6.2)
  * diff-lcs (1.2.5)
  * rspec (3.1.0)
  * rspec-core (3.1.0)
  * rspec-expectations (3.1.0)
  * rspec-mocks (3.1.0)
  * rspec-support (3.1.0)
--

Once ruby.bbclass is accepted in to meta-ruby I will submit additional
reviews to copy more of our gem recipes from meta-cloud-services.

I look forward to hearing feedback and hope that I can get things to a
point where we can get this merged.

Regards,
Mark

