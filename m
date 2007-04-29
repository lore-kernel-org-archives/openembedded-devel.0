Received: from [64.233.166.178] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <xjqian@gmail.com>) id 1Hi7AB-0003Fs-8X
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Apr 2007 13:01:55 +0200
Received: by py-out-1112.google.com with SMTP id n39so1074338pyh
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2007 03:52:48 -0700 (PDT)
Received: by 10.35.35.17 with SMTP id n17mr9108506pyj.1177843968745;
	Sun, 29 Apr 2007 03:52:48 -0700 (PDT)
Received: from ?192.168.10.106? ( [71.85.151.212])
	by mx.google.com with ESMTP id 6sm13820598nzn.2007.04.29.03.52.47;
	Sun, 29 Apr 2007 03:52:47 -0700 (PDT)
Message-ID: <463478B9.3010602@gmail.com>
Date: Sun, 29 Apr 2007 05:51:37 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Icedove 1.5.0.10 (X11/20070329)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
References: <20070427105722.GA4340@twibble.org>
In-Reply-To: <20070427105722.GA4340@twibble.org>
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
X-List-Received-Date: Sun, 29 Apr 2007 11:01:55 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Jamie Lenehan wrote:
> Hi,
>
> I think I've got perl 5.8.8 to the stage where it is ready for use.
> As this is a pretty big and complex system and I've made some rather
> large changes to the way the build happens I'd like to get some
> reports from other people that it works for them before removing the
> DEFAULT_PREFERENCE = "-1".
>
> You need to build perl-native 5.8.8 and then perl 5.8.8. (You always
> have to build the matching -native version of perl first.)
>
> So far I've tested sh4/glibc (build & run), i486/glibc (build only)
> and sh4/uclibc (build only) using gcc 3.4.4 for sh4 and gcc 4.1.2 for
> i486.
>
> The main visible changes are:
>
>  - Per-arch configurations and now gone, it should build for any
>    target now without change.
>
>  - Installation paths have all been change to be match the debian
>    style (which also happens to be FHS compliant).
>
>  - All configurations match (including native) and all configurations
>    include threading and shared library support.
>
> The build should also be a lot more reliable and it should resolve
> nearly all of the perl related bugzilla entries (yes, even the
> /bin/sh is dash one ;)
>
> (Note that if you have any cpan modules they all need to rebuilt as
> well when changing to 5.8.8 in order to get installed into the new
> locations.)
>
>   
Machine=Tosa
Distro=Angstrom

perl-native-5.8.8 builds fine. But when I run bitbake perl-5.8.8,
it alway try to build perl-native-5.8.7 and perl-5.8.7 first. Am I 
missing something?

Gordon


