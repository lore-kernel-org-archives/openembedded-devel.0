Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lenehan@twibble.org>) id 1Hr3CE-0000rT-7m
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 May 2007 04:36:59 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id EE342ED52B;
	Thu, 24 May 2007 12:35:54 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10420-09; Thu, 24 May 2007 12:35:52 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 3E653ED523;
	Thu, 24 May 2007 12:35:52 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 13736B70149; Thu, 24 May 2007 12:35:51 +1000 (EST)
Date: Thu, 24 May 2007 12:35:51 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070524023551.GA31623@twibble.org>
References: <465225B7.50900@kernelconcepts.de>
	<1179789619.5849.59.camel@localhost.localdomain>
	<46522CA3.1010000@kernelconcepts.de>
MIME-Version: 1.0
In-Reply-To: <46522CA3.1010000@kernelconcepts.de>
User-Agent: Mutt/1.5.12-2006-07-14
X-Virus-Scanned: by amavisd at twibble.org
Subject: Re: Problem wt. perl-native building for PXA
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 May 2007 02:37:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 22, 2007 at 01:34:59AM +0200, Nils Faerber wrote:
> Richard Purdie schrieb:
> > Hi,
> Hi!
> 
> > On Tue, 2007-05-22 at 01:05 +0200, Nils Faerber wrote:
[...]
> >> My machine has Ubuntu feisty installed. I am using Bitbake 1.8 from SVN
[...]
> >> What happens is that the build works quite well until it comes to
> >> perl-native-5.8.8-r7. There it fails with the following error:
[...]
> Is tihs Ubuntu?
> I did never recognise this, but you are perfectly right with your
> assumption, sh -> dash.
> 
> Gee, hey look, now it works!!!

> This dash thing should be tarred and feathered ;)

I actually tested perl-native with dash, and it builds just fine here
when using dash:

  ~%> ./bb -b packages/perl/perl-native_5.8.8.bb 
  ...
  NOTE: package perl-native-5.8.8: completed
  ~%> ls -l /bin/sh
  lrwxrwxrwx 1 root root 4 2007-05-24 12:05 /bin/sh -> dash*
  ~%> cat /etc/issue.net 
  Ubuntu 6.10

In theory the following patch should fix the dash issues you were
seeing. Is their someone seeing this dash/perl-native issues that
could test this?

# 
# old_revision [d28c26f2757f88207089404b9e74286950165915]
# 
# add_file "packages/perl/perl-5.8.8/native-makedepend-dash.patch"
#  content [a32ff3bf1b75c57f6ff7ac58b232cc44f2648a27]
# 
# patch "packages/perl/perl-native_5.8.8.bb"
#  from [3013e9425fe473cf0988c3ccf6cad2b894e62e58]
#    to [e95283c93197ba0c2c16f42feef3c0b6691a7a53]
# 
============================================================
--- packages/perl/perl-5.8.8/native-makedepend-dash.patch	a32ff3bf1b75c57f6ff7ac58b232cc44f2648a27
+++ packages/perl/perl-5.8.8/native-makedepend-dash.patch	a32ff3bf1b75c57f6ff7ac58b232cc44f2648a27
@@ -0,0 +1,13 @@
+Index: perl-5.8.8/makedepend.SH
+===================================================================
+--- perl-5.8.8.orig/makedepend.SH	2007-05-24 12:06:52.000000000 +1000
++++ perl-5.8.8/makedepend.SH	2007-05-24 12:27:33.000000000 +1000
+@@ -128,7 +128,7 @@
+     *.y) filebase=`basename $file .y` ;;
+     esac
+     case "$file" in
+-    */*) finc="-I`echo $file | sed 's#/[^/]*$##`" ;;
++    */*) finc="-I`echo $file | sed 's#/[^/]*$##'`" ;;
+     *)   finc= ;;
+     esac
+     $echo "Finding dependencies for $filebase$_o."
============================================================
--- packages/perl/perl-native_5.8.8.bb	3013e9425fe473cf0988c3ccf6cad2b894e62e58
+++ packages/perl/perl-native_5.8.8.bb	e95283c93197ba0c2c16f42feef3c0b6691a7a53
@@ -12,7 +12,8 @@ SRC_URI = "http://ftp.funet.fi/pub/CPAN/
            file://Configure-multilib.patch;patch=1 \
            file://perl-configpm-switch.patch;patch=1 \
            file://native-nopacklist.patch;patch=1 \
-           file://native-no-gdbminc.patch;patch=1"
+           file://native-no-gdbminc.patch;patch=1 \
+           file://native-makedepend-dash.patch;patch=1"
 
 S = "${WORKDIR}/perl-${PV}"
 


-- 
 Jamie Lenehan <lenehan@twibble.org>


