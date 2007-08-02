Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IGj0Y-0004C8-Ju
	for openembedded-devel@openembedded.org; Fri, 03 Aug 2007 00:19:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l72MGxCv018554
	for <openembedded-devel@openembedded.org>;
	Thu, 2 Aug 2007 23:16:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18385-03 for <openembedded-devel@openembedded.org>;
	Thu,  2 Aug 2007 23:16:55 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l72MGrSr018548
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Thu, 2 Aug 2007 23:16:53 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <46B20D9F.70704@dominion.kabel.utwente.nl>
References: <46B1753D.1090507@dominion.kabel.utwente.nl>
	<46B1B6DB.6020603@klever.net>	<1186053831.5972.222.camel@hammer.suse.cz>
	<46B1C71F.2090608@klever.net>	<1186058282.5972.232.camel@hammer.suse.cz>
	<46B1D0DA.5030905@balister.org>	<1186061255.5972.243.camel@hammer.suse.cz>
	<46B1E063.7010407@dominion.kabel.utwente.nl>
	<1186064138.5972.259.camel@hammer.suse.cz>
	<46B1E812.8020706@dominion.kabel.utwente.nl>
	<1186066059.5972.269.camel@hammer.suse.cz>	<46B1F78F.4040700@klever.net>
	<46B1FC60.6030908@dominion.kabel.utwente.nl>
	<46B1FDD8.8000404@klever.net>
	<46B20D9F.70704@dominion.kabel.utwente.nl>
Date: Thu, 02 Aug 2007 23:16:53 +0100
Message-Id: <1186093013.6626.57.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Gstreamer and rpath
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
X-List-Received-Date: Thu, 02 Aug 2007 22:19:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2007-08-02 at 19:00 +0200, Koen Kooi wrote:
> Michael Krelin schreef:
> >> Michael Krelin schreef:
> >>> I'm not taking the symlink workaround seriously, because inventing one
> >>> workaround to get rid of the other isn't going to get us anywhere.
> >> Packaged-staging v1 is using that symlink approach and it doesn't help a lot. Hence the
> >> need for v2 :)
> > 
> > Just about time ;-)
> > 
> > No matter how soon we can move to sysroot approach, I think making
> > staging resemble filesystem is the right thing to do, anyway...
> 
> Indeed. I suspect most of our packages could handle that (autotools, qmake and distutils
> based ones) easily. The big question is:
> 
>   How are we going to do it?
> 
> Are we going to declare another ".dev is broken" period, a branch, a branch with a small
> amount of packages like org.oe.packaged-staging?

I'm actually semi against forcing staging to look like an image. The
fact gcc requires this for its sysroot option is a sign that they
haven't got this right yet.

With packaged staging we need to decide which way we go, separate
staging packages or use the same ones as we use for images.

My personal gut feeling is that separate ones will work better. They
also mean we can handle the extra staging files like pkgmaps and perhaps
handle multi machine easier.

I think if we try to make image packages fit, we'll end up having to
make hack after hack and end up with something less maintainable.

Note this doesn't mean we shouldn't try and simplify package staging
tasks. Ideally I'd like to see one do_install task working for both
staging and the normal packages.

Regards,

Richard



