Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lenehan@twibble.org>) id 1Hi94t-000407-7s
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Apr 2007 15:04:35 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 5DAC710C797;
	Sun, 29 Apr 2007 22:55:27 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30706-06; Sun, 29 Apr 2007 22:55:25 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id CEC4F10C74B;
	Sun, 29 Apr 2007 22:55:25 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 9985EB70148; Sun, 29 Apr 2007 22:55:25 +1000 (EST)
Date: Sun, 29 Apr 2007 22:55:25 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: Stelios Koroneos <skoroneos@digital-opsis.com>
Message-ID: <20070429125525.GA8230@twibble.org>
References: <463478B9.3010602@gmail.com>
	<HOECLKEKOHLAMMGDLLBHGEACKOAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
In-Reply-To: <HOECLKEKOHLAMMGDLLBHGEACKOAA.skoroneos@digital-opsis.com>
User-Agent: Mutt/1.5.12-2006-07-14
X-Virus-Scanned: by amavisd at twibble.org
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: CPAN module naming
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
X-List-Received-Date: Sun, 29 Apr 2007 13:04:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 29, 2007 at 02:45:23PM +0300, "Stelios Koroneos" wrote:
> Is there an RFC or suggestion on how the CPAN modules .bb files should be
> named ?

lib<name>-perl_<version>.bb

where "name" is the name of the package as downloaded. So for:

  Algorithm-Diff-1.1902.tar.gz

we end up with:

 libalgorithm-diff-perl_1.1902.bb

This naming matches that used by debian based distros (you can always
check the naming used on a debian distro to verify what it should be
called.)

Note also that the current cpan.bbclass won't handle anything
particularly complex (in particular things that contain additional
multiple Makefile.PL's in subdirectories). Once I have perl 5.8.8 as
default I'll be re-doing the way cpan.bbclass and perl-native work to
make this a lot more reliable.

-- 
 Jamie Lenehan <lenehan@twibble.org>


