Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lenehan@twibble.org>) id 1Hi9ED-0004DF-9C
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Apr 2007 15:14:13 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 954FF10C7A8;
	Sun, 29 Apr 2007 23:05:05 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30790-10; Sun, 29 Apr 2007 23:05:04 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 1B2B4F3B28;
	Sun, 29 Apr 2007 23:05:04 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 0746DB70148; Sun, 29 Apr 2007 23:05:03 +1000 (EST)
Date: Sun, 29 Apr 2007 23:05:03 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: Junqian Gordon Xu <xjqian@gmail.com>
Message-ID: <20070429130503.GA8755@twibble.org>
References: <20070427105722.GA4340@twibble.org> <463478B9.3010602@gmail.com>
MIME-Version: 1.0
In-Reply-To: <463478B9.3010602@gmail.com>
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
X-List-Received-Date: Sun, 29 Apr 2007 13:14:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 29, 2007 at 05:51:37AM -0500, Junqian Gordon Xu wrote:
[...]
> Machine=Tosa
> Distro=Angstrom
> 
> perl-native-5.8.8 builds fine. But when I run bitbake perl-5.8.8,
> it alway try to build perl-native-5.8.7 and perl-5.8.7 first. Am I 
> missing something?

As has already been mentioned this is due to DEFAULT_PREFERENCE setting. You
can remove or change the DEFAULT_PREFERENCE or explicitly request bitbake to
build the newer versions. See the section in the user manual that talks
about this:

  http://www.openembedded.org/user-manual&dpage=recipes_defaultpreference

-- 
 Jamie Lenehan <lenehan@twibble.org>


