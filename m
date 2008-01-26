Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JIlJv-00072O-FK
	for openembedded-devel@openembedded.org; Sat, 26 Jan 2008 14:43:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m0QDhmZ3019817
	for <openembedded-devel@openembedded.org>; Sat, 26 Jan 2008 13:43:48 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19511-05 for <openembedded-devel@openembedded.org>;
	Sat, 26 Jan 2008 13:43:45 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m0QDhgDI019809
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Sat, 26 Jan 2008 13:43:42 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200801260151.13034.mickey@vanille-media.de>
References: <fnchem$8v4$1@ger.gmane.org>
	<200801260151.13034.mickey@vanille-media.de>
Date: Sat, 26 Jan 2008 13:43:41 +0000
Message-Id: <1201355021.4717.16.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: strip "-native" from $S for native packages	automatically (bug 1856)
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
X-List-Received-Date: Sat, 26 Jan 2008 13:43:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2008-01-26 at 01:51 +0100, Michael 'Mickey' Lauer wrote:
> On Friday 25 January 2008 12:33:39 Rolf Leggewie wrote:
> > Hi,
> >
> > I elicit your comments on bug 1856, especially comment3.
> >
> > The bug is about stripping "-native" automatically from the S variable
> > for native packages since it will hardly ever occur that a tar ball will
> > unpack to $PN-native-$PV/  This would save us resetting $S manually for
> > native packages all the time.  Koen suggested the fix to go into
> > native.bbclass. When I revisited the bug today, I thought this must be
> > as easy to fix as simply adding
> >
> >   export S=`echo $S|sed s/\-native\-/\-/`
> 
> That looks like an infinite recursion to me.
> S:= ... may work, but I don't like launching a shell for that.

Agreed, it won't work and := is not appropriate either, I still maintain
that := should be used with caution and only when people really
understand what its implications are.

> If we really want to have that (I'm -0 on that), I would rather propose
> 
> S = ${@"%s/%s" % ( bb.data.getVar("WORKDIR", d, 1), bb.data.getVar("P", d, 1).replace( "-native", "" ) ) }

Would it be worth adding syntax to bitbake for this kind of operation,
something like:

S *= "${S}-native"

?

I don't know if many people had noticed but I've recently added a lot of
-sdk packages to poky and this would be useful for sdk.bbclass too. The
sdk packages are really useful but the .bb files are tedious, just like
-native.

I've been thinking about the -native/-sdk problem again and I'd like to
try and plan an extension to bitbake to help with this. The idea would
be to have a list of "extension" classes like sdk and native. During
parsing bitbake bitbake would first parse as usual but then it would
automatically "inherit native" and then "inherit sdk" for each .bb file.

The extension classes could be named in some variable
BB_PARSING_EXTENSION_CLASSES = "native sdk" or I wondered if we add a
new type of file (.bbextclass?). The variable approach would mean a
package could easily choose not to have this behaviour or to extend
it...

This does assume we can reduce native recipes to "inherit native" but
with suitable changes to native.bbclass that should be possible?

Cheers,

Richard



