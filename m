Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lenehan@twibble.org>) id 1HhOHL-00013F-Fs
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Apr 2007 13:06:19 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 21B8D10C050
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Apr 2007 20:57:24 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06076-02
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Apr 2007 20:57:22 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 9B21B10C04F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Apr 2007 20:57:22 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 81FD1B70148; Fri, 27 Apr 2007 20:57:22 +1000 (EST)
Date: Fri, 27 Apr 2007 20:57:22 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070427105722.GA4340@twibble.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.12-2006-07-14
X-Virus-Scanned: by amavisd at twibble.org
Subject: perl 5.8.8 is ready
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
X-List-Received-Date: Fri, 27 Apr 2007 11:06:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I think I've got perl 5.8.8 to the stage where it is ready for use.
As this is a pretty big and complex system and I've made some rather
large changes to the way the build happens I'd like to get some
reports from other people that it works for them before removing the
DEFAULT_PREFERENCE = "-1".

You need to build perl-native 5.8.8 and then perl 5.8.8. (You always
have to build the matching -native version of perl first.)

So far I've tested sh4/glibc (build & run), i486/glibc (build only)
and sh4/uclibc (build only) using gcc 3.4.4 for sh4 and gcc 4.1.2 for
i486.

The main visible changes are:

 - Per-arch configurations and now gone, it should build for any
   target now without change.

 - Installation paths have all been change to be match the debian
   style (which also happens to be FHS compliant).

 - All configurations match (including native) and all configurations
   include threading and shared library support.

The build should also be a lot more reliable and it should resolve
nearly all of the perl related bugzilla entries (yes, even the
/bin/sh is dash one ;)

(Note that if you have any cpan modules they all need to rebuilt as
well when changing to 5.8.8 in order to get installed into the new
locations.)

-- 
 Jamie Lenehan <lenehan@twibble.org>


