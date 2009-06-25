Received: from [209.85.219.221] (helo=mail-ew0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rolles.dump@gmail.com>) id 1MJxV9-0006GG-CM
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Jun 2009 00:33:03 +0200
Received: by ewy21 with SMTP id 21so641758ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2009 15:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=U6gHZKmYqy7DkwljC3t4A0RYkbOyzcBGFVs7fLOsf7k=;
	b=jIxQcCg1Rtsw7v5wHbsnyDkyIIyEWTfzHv4YNzmJ9gwDjaSAlq6wKjb5rb3AoieKRs
	ceM3iPASlox2wZIpU3qFwN9GOVLM1ipNN4a3Cahs14fY3exXrJARfAGo/zU4aOIeISda
	QS5YJx4TWLAwiL4QI3qCi5wGqhlETJsi/ys1w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=iBUmHuo/Cky+1UEBt8sDtgl5Qs/ItePEn3XLlGybJMNRkL0LhNY+eJCE1z9H3pH8wf
	CnP6gK5fQJT1FAXUaJOwYCCnO/FLvl7PpTOatgTOPA1ouBqNrIVJGonRoEtnbPLmhH21
	N9nYO3KuL66XungXw/2O1bAaVBDf4WxKxiFWM=
MIME-Version: 1.0
Received: by 10.211.194.9 with SMTP id w9mr2769551ebp.19.1245968502149; Thu, 
	25 Jun 2009 15:21:42 -0700 (PDT)
Date: Fri, 26 Jun 2009 00:21:42 +0200
Message-ID: <6a1b49480906251521w364bce23o2dd5f921a468474c@mail.gmail.com>
From: Frank Black <rolles.dump@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: patch to boost package
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
X-List-Received-Date: Thu, 25 Jun 2009 22:33:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I tried building boost 1.36.0 for my armv5te processor. Problem is there is
no support for the function "__sync_add_and_fetch" called from
detail/atomic_count_sync.hpp. There are two patches which both fails to
resolve this for me.

1: arm-instrinct.patch. This requires __ARM_ARCH_7A__ to be defined, which
is not good for me on an armv5te.
2: atomic_count_gcc_atomicity.patch: Works, however problem is that
atomic_count.hpp contains #defines that always #includes
atomic_count_sync.hpp instead of atomic_count_gcc.hpp, so the patch has no
effect

I solved this by applying a really ugly patch (see below) that makes sure
atomic_count_sync.hpp is never used. Im sure therre is a better way to do it
but I'm not at all familiar what kind of ARM-specific defines you got to
play around with. Maybe someone has more in-depth knowledge abot this?



 --- boost_1_33_1.orig/boost/detail/atomic_count.hpp    2007-11-23
18:03:14.000000000 +0100
+++ boost_1_33_1/boost/detail/atomic_count.hpp        2009-06-25
23:07:10.000000000 +0200
@@ -101,10 +101,10 @@

 #  include <boost/detail/atomic_count_win32.hpp>

-#elif defined( __GNUC__ ) && ( __GNUC__ * 100 + __GNUC_MINOR__ >= 401 )
+/*#elif defined( __GNUC__ ) && ( __GNUC__ * 100 + __GNUC_MINOR__ >= 401 )

 #  include <boost/detail/atomic_count_sync.hpp>
-
+*/
 #elif defined(__GLIBCPP__) || defined(__GLIBCXX__)

 #  include <boost/detail/atomic_count_gcc.hpp>


/ Rolle

