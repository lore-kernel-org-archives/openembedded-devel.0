Received: from [85.37.17.114] (helo=smtp-out114.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1MKjeX-0002Dm-AJ
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Jun 2009 03:57:57 +0200
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out114.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 28 Jun 2009 03:46:22 +0200
Received: from FBCMCL01B04.fbc.local ([192.168.69.85]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 28 Jun 2009 03:46:22 +0200
Received: from [192.168.1.171] ([79.51.163.91]) by FBCMCL01B04.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Sun, 28 Jun 2009 03:46:22 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <6a1b49480906251521w364bce23o2dd5f921a468474c@mail.gmail.com>
References: <6a1b49480906251521w364bce23o2dd5f921a468474c@mail.gmail.com>
Date: Sun, 28 Jun 2009 03:46:13 +0200
Message-Id: <1246153579.32326.3.camel@port4>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.4 
X-OriginalArrivalTime: 28 Jun 2009 01:46:22.0515 (UTC)
	FILETIME=[3D754030:01C9F792]
Subject: Re: patch to boost package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 28 Jun 2009 01:57:57 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-06-26 at 00:21 +0200, Frank Black wrote:
> I tried building boost 1.36.0 for my armv5te processor. Problem is there is
> no support for the function "__sync_add_and_fetch" called from
> detail/atomic_count_sync.hpp. There are two patches which both fails to
> resolve this for me.
> 
> 1: arm-instrinct.patch. This requires __ARM_ARCH_7A__ to be defined, which
> is not good for me on an armv5te.
> 2: atomic_count_gcc_atomicity.patch: Works, however problem is that
> atomic_count.hpp contains #defines that always #includes
> atomic_count_sync.hpp instead of atomic_count_gcc.hpp, so the patch has no
> effect
> 
> I solved this by applying a really ugly patch (see below) that makes sure
> atomic_count_sync.hpp is never used. Im sure therre is a better way to do it
> but I'm not at all familiar what kind of ARM-specific defines you got to
> play around with. Maybe someone has more in-depth knowledge abot this?
> 
> 
> 
>  --- boost_1_33_1.orig/boost/detail/atomic_count.hpp    2007-11-23
> 18:03:14.000000000 +0100
> +++ boost_1_33_1/boost/detail/atomic_count.hpp        2009-06-25
> 23:07:10.000000000 +0200
> @@ -101,10 +101,10 @@
> 
>  #  include <boost/detail/atomic_count_win32.hpp>
> 
> -#elif defined( __GNUC__ ) && ( __GNUC__ * 100 + __GNUC_MINOR__ >= 401 )
> +/*#elif defined( __GNUC__ ) && ( __GNUC__ * 100 + __GNUC_MINOR__ >= 401 )
> 
>  #  include <boost/detail/atomic_count_sync.hpp>
> -
> +*/
>  #elif defined(__GLIBCPP__) || defined(__GLIBCXX__)
> 
>  #  include <boost/detail/atomic_count_gcc.hpp>
> 
> 
> / Rolle
yes there is:
I've put the boost work I did with the help of other people here:
http://gnutoo.homelinux.org/open_embedded/boost.tar.bz2
I didn't have the time to finish my work because I had a segmentation
fault in boost with wesnoth-1.6x so I didn't commit it yet because of
the lack of skills and time to debug it(I don't know C++,I just learned
it a bit for this precise problem)
Denis.



