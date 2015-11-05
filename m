Return-Path: <ulfalizer@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7FCCD76E70
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 13:36:32 +0000 (UTC)
Received: by ykdv3 with SMTP id v3so40401856ykd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2015 05:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=iXNPebcs5ZLjH6O4+hu2UrVu3/7ffZxKspoe+UBdP3M=;
	b=FtnK4V3LT5XMENQLASFMpZ8tlsE1zVLga7jF5f84FbgvqntzR9SlsDXY+trqc9Tx4m
	tMfASt6AOMI9o/EBbEYkwL/gKFyUM0DLkxJn5wovHC7mpmw7uTH+AdYGl1bJKCbAy8mn
	gkjGSJI1sPvabpdpuH+H1sp0ND3VzmNfNaG6ujvM5hRYbw31h8EsMX8tWCvKYt51/0np
	e7Pe7bPvnRxUn5PmOBEPaI6dezJsWKQTYxxozsksckmNJ2AUbCmofsPZrg1EbOOyisBn
	Rge0A04CnGUSFNfgIsfB8FU0HZYBcje+zzTcAurRrXqfgNaSqu1/Umk3L7nDaW+eOXQx
	Qhig==
MIME-Version: 1.0
X-Received: by 10.31.49.22 with SMTP id x22mr6907257vkx.60.1446730592812; Thu,
	05 Nov 2015 05:36:32 -0800 (PST)
Received: by 10.103.77.91 with HTTP; Thu, 5 Nov 2015 05:36:32 -0800 (PST)
In-Reply-To: <20151105125733.GE2556@jama>
References: <CAFkk2KQhpgBHLo2AyxWAL9aB1AQRi4BM3DCOanbCKBY4wKb0Gg@mail.gmail.com>
	<20151105125733.GE2556@jama>
Date: Thu, 5 Nov 2015 14:36:32 +0100
Message-ID: <CAFkk2KSnaBQEzhFj+F3_c9k1J+mQFgie6ZbMK465TOMi0qHSZw@mail.gmail.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, mark.asselstine@windriver.com
Subject: Re: meta-openembedded/meta-ruby: ruby-1.9.3-disable-versioned-paths.patch misses one path
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
X-List-Received-Date: Thu, 05 Nov 2015 13:36:35 -0000
Content-Type: text/plain; charset=UTF-8

We seem to still rely on Ruby 1.9, while the openembedded-core Ruby is
at 2.2. Guess there isn't much to do if it's been removed though. :/

I filed a very minor issue at
https://bugzilla.yoctoproject.org/show_bug.cgi?id=8652 .

Cheers,
Ulf

On Thu, Nov 5, 2015 at 1:57 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Nov 05, 2015 at 01:38:18PM +0100, Ulf Magnusson wrote:
>> Hello,
>>
>> ruby-1.9.3-disable-versioned-paths.patch adds the
>> --disable-versioned-paths option, which strips Ruby's version number
>> from some install paths. The patch misses a spot however, which causes
>> TOPDIR to get an incorrect value (nil) in rbconfig.rb. This in turn
>> causes problems e.g. when trying to cross-compile native extensions.
>>
>> The following patch fixes this. It assumes
>> ruby-1.9.3-disable-versioned-paths.patch has already been applied.
>
> ruby was already moved from meta-ruby to oe-core, send proper patch to
> oe-core ML (ruby-1.9.3-disable-versioned-paths.patch isn't there).
>
> commit 10fd3b41449d1af15ac9432bc1a7fe26c6f1dae1
> Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> Date:   Thu Jun 4 13:17:31 2015 +0300
>
>     ruby: add a recipe from meta-ruby
>
> commit e04d53bdc83b0ae26fcde85b37fff20963232d9e
> Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> Date:   Mon Sep 14 15:26:47 2015 +0300
>
>     ruby: remove the recipe due to its move to oe-core
>
>>
>> ---
>>  tool/mkconfig.rb | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/tool/mkconfig.rb b/tool/mkconfig.rb
>> index 10dbe65..aa54512 100755
>> --- a/tool/mkconfig.rb
>> +++ b/tool/mkconfig.rb
>> @@ -44,6 +44,7 @@ vars = {}
>>  continued_name = nil
>>  continued_line = nil
>>  path_version = "/$(ruby_version)"
>> +prefix_version = "/#{version}"
>>  File.foreach "config.status" do |line|
>>    next if /^#/ =~ line
>>    name = nil
>> @@ -149,7 +150,10 @@ File.foreach "config.status" do |line|
>>      when "ruby_version"
>>        version = val[/\A"(.*)"\z/, 1]
>>      when /^USE_VERSIONED_PATHS$/
>> -      path_version = nil if /NO/ =~ val
>> +      if /NO/ =~ val
>> +        path_version = nil
>> +        prefix_version = nil
>> +      end
>>      end
>>    end
>>  #  break if /^CEOF/
>> @@ -157,7 +161,7 @@ end
>>
>>  drive = File::PATH_SEPARATOR == ';'
>>
>> -prefix = "/#{v_runtime[:libdir] || 'lib'}/ruby/#{version}/#{arch}"
>> +prefix = "/#{v_runtime[:libdir] || 'lib'}/ruby#{prefix_version}/#{arch}"
>>  print "  TOPDIR = File.dirname(__FILE__).chomp!(#{prefix.dump})\n"
>>  print "  DESTDIR = ", (drive ? "TOPDIR && TOPDIR[/\\A[a-z]:/i] || " :
>> ""), "'' unless defined? DESTDIR\n"
>>  print <<'ARCH' if universal
>> --
>> 2.1.4
>>
>>
>> Another "bug" is that meta/recipes-devtools/ruby (i.e., the newer Ruby
>> recipe) uses --disable-versioned-paths too even though afaics no such
>> option exists in that version. Maybe I should report that separately.
>>
>> Cheers,
>> Ulf
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

