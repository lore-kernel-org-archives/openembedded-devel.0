Received: from [64.233.166.178] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xjqian@gmail.com>) id 1JhJFr-0001cT-1o
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Apr 2008 08:48:59 +0200
Received: by py-out-1112.google.com with SMTP id y77so3047655pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Apr 2008 23:48:54 -0700 (PDT)
Received: by 10.35.77.3 with SMTP id e3mr17587042pyl.7.1207205333721;
	Wed, 02 Apr 2008 23:48:53 -0700 (PDT)
Received: from ?192.168.35.2? ( [128.252.118.168])
	by mx.google.com with ESMTPS id f75sm3202843pye.2.2008.04.02.23.48.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 02 Apr 2008 23:48:53 -0700 (PDT)
Message-ID: <47F47DD0.7090702@gmail.com>
Date: Thu, 03 Apr 2008 01:48:48 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: Using OE <openembedded-users@lists.openembedded.org>
References: <c6144fd60804020757j5d41176cof723d8f7d2141849@mail.gmail.com>
In-Reply-To: <c6144fd60804020757j5d41176cof723d8f7d2141849@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: openmoko-minimal-image fails to build because of popt dependency
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
X-List-Received-Date: Thu, 03 Apr 2008 06:48:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/02/2008 09:57 AM, Peter Haijen wrote:
> <mailto:openembedded-users@lists.openembedded.org>Hi there!
> 
> First of all, as a new user who recently discovered openembedded, I 
> would like to say thanks to everyone involved for creating such a great 
> and useful package!
> 
> Today I tried building openmoko-minimal-image (and several others) and 
> each time got stuck when trying to build popt.
> The linker (I think) complained about -liconv or something, I had to do 
> the following to get popt to compile:
> 
> #
> # old_revision [39f05de8480aa04acd8f165a3ab42754a631b206]
> #
> # patch "packages/popt/popt_1.13.bb <http://popt_1.13.bb>"
> #  from [03a1f329b8652f9c5184cc7433ba07a16a0a1400]
> #    to [b551153043b55ddaa4b476d05969066357e02f4d]
> #
> ============================================================
> --- packages/popt/popt_1.13.bb <http://popt_1.13.bb>  
> 03a1f329b8652f9c5184cc7433ba07a16a0a1400
> +++ packages/popt/popt_1.13.bb <http://popt_1.13.bb>  
> b551153043b55ddaa4b476d05969066357e02f4d
> @@ -1,6 +1,6 @@ require popt.inc
>  require popt.inc
>  
> -DEPENDS = "gettext virtual/libintl"
> +DEPENDS = "gettext virtual/libintl libiconv"
>  
>  PR = "r1"
> 
> 
> I was wondering, what the reason for the above error was - did I do 
> something wrong or is there an error in the current OE database?
> Is there some kind of 'stable' OE database available which I should use 
> in stead, if I do not want to live on the bleeding edge?

The -liconv was first introduced to fix uclibc builds. I've noticed this 
patch broke glibc builds. However, I thought utx fixed this in Revision: 
574e65dc4315f62dd912ceca4784d203ccc5fae0. But, I didn't clear my tmp and 
verify it.

Regarding your solution, the concern is that we don't want to add the 
unnecessary libiconv dependency for glibc builds.

Regards
Gordon


o |   -----------------------------------------------------------------
| |   Revision: 574e65dc4315f62dd912ceca4784d203ccc5fae0
| |   Ancestor: 599433cb8b718460bb75911904b246aa37cfa27d
| |   Author: utx@openembedded.org
| |   Date: 2008-03-26T22:28:24
| |   Branch: org.openembedded.dev
| |
| |   Modified files:
| |           packages/popt/popt-1.13/iconv.patch
| |
| |   ChangeLog:
| |
| |   Fix glibc build of popt-1.13
| |   * use AM_ICONV_LINK in iconv.patch
o |   (Revision: 599433cb8b718460bb75911904b246aa37cfa27d)
|/
o   -----------------------------------------------------------------
|   Revision: b7c384ae465079ec2295b2e95072191834385967
|   Ancestor: ead8fe4eb9f4a05e10d6ad072d127ba6aa6820f7
|   Author: woglinde2@openembedded.org
|   Date: 2008-03-25T20:59:41
|   Branch: org.openembedded.dev
|
|   Added files:
|           packages/popt/popt-1.13/iconv.patch
|   Added directories:
|           packages/popt/popt-1.13
|   Modified files:
|           packages/popt/popt_1.13.bb
|
|   ChangeLog:
|
|   pop-1.13: fix uclibc builds
|   * add iconv.patch so libpopt.la finds all symbols even for libicionv
|   * bump pr
o   (Revision: ead8fe4eb9f4a05e10d6ad072d127ba6aa6820f7)


