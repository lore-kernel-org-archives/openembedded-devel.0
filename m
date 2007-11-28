Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1IxL8D-0001vm-59
	for openembedded-devel@openembedded.org; Wed, 28 Nov 2007 12:31:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lASBSAwh009856
	for <openembedded-devel@openembedded.org>; Wed, 28 Nov 2007 11:28:10 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09545-08 for <openembedded-devel@openembedded.org>;
	Wed, 28 Nov 2007 11:28:06 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lASBS2Yv009827
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 28 Nov 2007 11:28:02 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <d543f5920711271153v5964f4e2te91f0d0347dd1e95@mail.gmail.com>
References: <474AFA66.30509@gmx.net>
	<1196166155.6780.11.camel@localhost.localdomain>
	<157949636.20071127154357@gmail.com>
	<1196172204.6780.37.camel@localhost.localdomain>
	<d543f5920711271153v5964f4e2te91f0d0347dd1e95@mail.gmail.com>
Date: Wed, 28 Nov 2007 11:28:00 +0000
Message-Id: <1196249281.8098.17.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: python skills and bug 2412
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
X-List-Received-Date: Wed, 28 Nov 2007 11:31:06 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-11-27 at 13:53 -0600, Matt Hoosier wrote:
> On Nov 27, 2007 8:03 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> > A proper use for RPROVIDES is for something like gtk+-directfb to
> > RPROVIDE gtk+. If an app linked against one, it should be able to run
> > against the other (I'm assuming thats the case, if its not there
> > shouldn't be an RPROVIDES).
> 
> I've tried this, and you have problems with the apps already being
> linked not only against libgtk-2.0.so.x.y.z, but also the closure of
> the dependencies which it had at link-time. So if the X11 version of
> Gtk was staged at the time your app linked, the references to
> libx11.so will exist its its binary.
> 
> Is there some way to suppress this eager resolution of transitive
> shared library dependencies?

To be honest, I don't know, its not something I've looked at before.

As Paul mentions, the shlibs code will also cause the package's
Dependencies field to become hardcoded. If the binaries have references
like you mention, that sounds like its currently doing the right thing
really...

Cheers,

Richard





