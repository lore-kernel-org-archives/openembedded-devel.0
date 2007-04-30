Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lenehan@twibble.org>) id 1HiQxK-0002L6-Iv
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2007 10:09:59 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 2B2B310CB2B;
	Mon, 30 Apr 2007 18:00:46 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30164-03; Mon, 30 Apr 2007 18:00:44 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 8FE6510C99E;
	Mon, 30 Apr 2007 18:00:44 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 78F3BB70149; Mon, 30 Apr 2007 18:00:44 +1000 (EST)
Date: Mon, 30 Apr 2007 18:00:44 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: Junqian Gordon Xu <xjqian@gmail.com>
Message-ID: <20070430080044.GA15877@twibble.org>
References: <20070427105722.GA4340@twibble.org> <46359408.9060800@gmail.com>
MIME-Version: 1.0
In-Reply-To: <46359408.9060800@gmail.com>
User-Agent: Mutt/1.5.12-2006-07-14
X-Virus-Scanned: by amavisd at twibble.org
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: perl 5.8.8 is ready
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Apr 2007 08:09:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 30, 2007 at 02:00:24AM -0500, Junqian Gordon Xu wrote:
> Jamie Lenehan wrote:
[...]
> perl-native-5.8.8 builds fine but with the following error
> 
> ERROR: QA issue: libgettextsrc.la failed sanity test (reference to 
> workdir or installed)
[...]

These ones aren't related to perl-native at all, so no problems there.

[...]
> perl-5.8.8 build failed. Detail in the attached log file.
[...]
> | hostperl -I/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/Cross/../fake_config_library -MConfig ../../lib/ExtUtils/xsubpp -noprototypes -typemap ../../lib/ExtUtils/typemap  attrs.xs > attrs.xsc && mv attrs.xsc attrs.c
> | Perl lib version (v5.8.8) doesn't match executable version (v5.8.7) at /home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/Cross/../fake_config_library/Config.pm line 46.

This error is saying that "hostperl" is perl 5.8.7 but that it needs
to be perl 5.8.8. Can you check what your hostperl, which would be:

  /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/bin/hostperl

is pointing at? It should be 5.8.8 but this error makes it sound like
it's pointing at 5.8.7:

  %~> ls -l tmp/staging/x86_64-linux/bin/hostperl 
  lrwxrwxrwx 1 lenehan lenehan 82 2007-04-30 13:28 tmp/staging/x86_64-linux/bin/hostperl -> /home/lenehan/devel/oe/build/titan-glibc-25/tmp/staging/x86_64-linux/bin/perl5.8.8*

Thanks.

-- 
 Jamie Lenehan <lenehan@twibble.org>


