Received: from [72.14.220.159] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JIv4n-0004zh-TK
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Jan 2008 01:08:45 +0100
Received: by fg-out-1718.google.com with SMTP id 22so1322168fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jan 2008 16:08:51 -0800 (PST)
Received: by 10.82.184.2 with SMTP id h2mr6801835buf.22.1201392531074;
	Sat, 26 Jan 2008 16:08:51 -0800 (PST)
Received: from widy.lan ( [88.231.90.74])
	by mx.google.com with ESMTPS id 34sm3518549nfu.39.2008.01.26.16.08.49
	(version=SSLv3 cipher=OTHER); Sat, 26 Jan 2008 16:08:50 -0800 (PST)
Date: Sun, 27 Jan 2008 02:20:20 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1352961465.20080127022020@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
In-Reply-To: <1201355021.4717.16.camel@localhost.localdomain>
References: <fnchem$8v4$1@ger.gmane.org>
	<200801260151.13034.mickey@vanille-media.de>
	<1201355021.4717.16.camel@localhost.localdomain>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: strip "-native" from $S for native packages automatically (bug 1856)
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
X-List-Received-Date: Sun, 27 Jan 2008 00:08:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Richard,

Saturday, January 26, 2008, 3:43:41 PM, you wrote:

> On Sat, 2008-01-26 at 01:51 +0100, Michael 'Mickey' Lauer wrote:
>> On Friday 25 January 2008 12:33:39 Rolf Leggewie wrote:
>> > Hi,
>> >
>> > I elicit your comments on bug 1856, especially comment3.
>> >
>> > The bug is about stripping "-native" automatically from the S variable
>> > for native packages since it will hardly ever occur that a tar ball will
>> > unpack to $PN-native-$PV/  This would save us resetting $S manually for
>> > native packages all the time.  Koen suggested the fix to go into
>> > native.bbclass. When I revisited the bug today, I thought this must be
>> > as easy to fix as simply adding
>> >
>> >   export S=`echo $S|sed s/\-native\-/\-/`
>> 
>> That looks like an infinite recursion to me.
>> S:= ... may work, but I don't like launching a shell for that.

> Agreed, it won't work and := is not appropriate either, I still maintain
> that := should be used with caution and only when people really
> understand what its implications are.

>> If we really want to have that (I'm -0 on that), I would rather propose
>> 
>> S = ${@"%s/%s" % ( bb.data.getVar("WORKDIR", d, 1), bb.data.getVar("P", d, 1).replace( "-native", "" ) ) }

> Would it be worth adding syntax to bitbake for this kind of operation,
> something like:

> S *= "${S}-native"

> ?

> I don't know if many people had noticed but I've recently added a lot of
> -sdk packages to poky and this would be useful for sdk.bbclass too. The
> sdk packages are really useful but the .bb files are tedious, just like
> -native.

> I've been thinking about the -native/-sdk problem again and I'd like to
> try and plan an extension to bitbake to help with this. The idea would
> be to have a list of "extension" classes like sdk and native. During
> parsing bitbake bitbake would first parse as usual but then it would
> automatically "inherit native" and then "inherit sdk" for each .bb file.

> The extension classes could be named in some variable
> BB_PARSING_EXTENSION_CLASSES = "native sdk" or I wondered if we add a
> new type of file (.bbextclass?). The variable approach would mean a
> package could easily choose not to have this behaviour or to extend
> it...

  Sounds like something complex and obscure ;-I. However, here's
another usecase for such scheme:

   I've been pondering about 2-stage kernel building, which would
allow to have kernel with builtin initramfs. For this, modules should
be built first, then initramfs image which includes them, and then
zImage which includes initramfs. Even if modules vs zImage building
will be reduced to "inherit kernel-modules" and "inherit
kernel-image", that would mean that such 2 extra .bb files are needed
for all kernel recipes. Your template/generator idea might handle this
too. (But at what price...?).

> This does assume we can reduce native recipes to "inherit native" but
> with suitable changes to native.bbclass that should be possible?

> Cheers,

> Richard



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



