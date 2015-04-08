Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5C9F460089
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2015 17:44:44 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so65562580pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Apr 2015 10:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=WvAAD40Uu/72+hnztVWnvsIKj/y7Er7agY1VRnc9OA0=;
	b=A2TKaLnhZwcHiHzbga/LJ/84nOYdcuIMEs2CNyZKgDpJJI3AOfwqhjkA7V8rTx1Wnp
	CtO5ViJIvNJZIU3A31paZtl7JhszZe09MRYGAF5/jQKEjX9VTw6Ky0OnBl96R1SYDSxc
	QRieVcOS2AYvcK1WpSAgTiTXR/b/mXAyADJ1uKGDGmEhMSNU0tcsvuhDQ2jO7b6gwK8Y
	va3hjm3+Fcd/MkEXUmBpX5MmFf5lCjHPLwppaqJdCtVX+fuuF0u1xjJNZPacyiWztCY3
	a3mOSCUVnEZV4eOHCvkp4CcY5g25c+LpOnR2smF6SZxZ1KZNqw0tv1O7yOkkz9YEqaJD
	W/hQ==
X-Received: by 10.70.129.202 with SMTP id ny10mr38069036pdb.107.1428515085375; 
	Wed, 08 Apr 2015 10:44:45 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:74c6:c485:64d0:55bf?
	([2601:c:a700:3ba7:74c6:c485:64d0:55bf])
	by mx.google.com with ESMTPSA id p5sm11939753pdi.2.2015.04.08.10.44.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Apr 2015 10:44:44 -0700 (PDT)
Message-ID: <55256909.9050304@gmail.com>
Date: Wed, 08 Apr 2015 10:44:41 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1428164164.git.akuster808@gmail.com>
	<20150408124542.GF2337@jama>
In-Reply-To: <20150408124542.GF2337@jama>
Subject: Re: [PATCH 0/2] update ruby package
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
X-List-Received-Date: Wed, 08 Apr 2015 17:44:44 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 04/08/2015 05:45 AM, Martin Jansa wrote:
> On Sat, Apr 04, 2015 at 09:24:10AM -0700, Armin Kuster wrote:
>> This is an major update for the Ruby package. For those interested in it, please try it out and provide feedback on testing.
>>
>> The following changes since commit df6c7b1279790d27ebfd58fbdfbac89bde5782ec:
>>
>>    python-pyopenssl: Upgrade to 0.14 (2015-03-21 16:42:30 +0100)
>>
>> are available in the git repository at:
>>
>>    git://github.com/akuster/meta-openembedded.git akuster/ruby_update
>>    https://github.com//tree/akuster/ruby_update
>>
>> Armin Kuster (2):
>>    ruby: package update to verison 2.2.1
>>    README: update maintainer
>
> This seems to be causing new QA warning from one ruby recipe:
>
> bundler-1.6.2: bundler: Files/directories were installed but not shipped
>    /usr/lib/ruby/gems/2.2.0/build_info
>    /usr/lib/ruby/gems/2.2.0/extensions [installed-vs-shipped]
>
> can you check that?

sure.  what arch did you build for?

- armin
>
>>
>>   meta-ruby/README                                   |   2 +-
>>   meta-ruby/recipes-devtools/ruby/ruby.inc           |   8 +-
>>   ...onf-hardcode-wide-getaddr-info-test-outco.patch |  26 --
>>   .../ruby/ruby/remove-the-dependency-on-dir.patch   |  37 ---
>>   .../ruby/ruby/ruby-1.9.3-always-use-i386.patch     |  11 -
>>   .../ruby/ruby-1.9.3-custom-rubygems-location.patch |  86 ------
>>   .../ruby/ruby-1.9.3-disable-versioned-paths.patch  | 149 -----------
>>   .../ruby/ruby/ruby-1.9.3-install-cross.patch       |  16 --
>>   .../ruby/ruby/ruby-1.9.3-mkmf-verbose.patch        |  11 -
>>   .../ruby-1.9.3-rubygems-1.8.11-uninstaller.patch   |  76 ------
>>   ...kmf.rb-fix-race-conditions-at-install-ext.patch |  31 ---
>>   .../ruby/rubygems-1.8.11-binary-extensions.patch   | 296 ---------------------
>>   .../ruby/{ruby_1.9.3-p547.bb => ruby_2.2.1.bb}     |  23 +-
>>   13 files changed, 10 insertions(+), 762 deletions(-)
>>   delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch
>>   delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/remove-the-dependency-on-dir.patch
>>   delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-always-use-i386.patch
>>   delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-custom-rubygems-location.patch
>>   delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-disable-versioned-paths.patch
>>   delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-install-cross.patch
>>   delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-mkmf-verbose.patch
>>   delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-rubygems-1.8.11-uninstaller.patch
>>   delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-mkmf.rb-fix-race-conditions-at-install-ext.patch
>>   delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/rubygems-1.8.11-binary-extensions.patch
>>   rename meta-ruby/recipes-devtools/ruby/{ruby_1.9.3-p547.bb => ruby_2.2.1.bb} (52%)
>>
>> --
>> 2.3.5
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

