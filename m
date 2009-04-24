Received: from [68.230.241.43] (helo=fed1rmmtao103.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LxQvR-00079Z-Rc
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Apr 2009 21:19:06 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090424191418.BJLK4363.fed1rmmtao103.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2009 15:14:18 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id jXED1b00C4dMFYL04XEDRH; Fri, 24 Apr 2009 15:14:17 -0400
X-Authority-Analysis: v=1.0 c=1 a=KjjrOjXTx8cA:10 a=jExYjHyISV8A:10
	a=b2ZvGRdsAAAA:8 a=oU-Lc-zU28Uka6uFFBIA:9 a=M5z2lBdwscn6o-5qZ0oA:7
	a=0xFokZkHdOIYIw58vh9lH7pQv0wA:4
X-CM-Score: 0.00
Date: Fri, 24 Apr 2009 12:14:13 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090424191413.GB15489@smtp.west.cox.net>
References: <gsst4a$cvj$1@ger.gmane.org> <49F1FCFB.9000205@balister.org>
	<gst2dn$u4j$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gst2dn$u4j$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: reverting some csets that kill package upgrade paths
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
X-List-Received-Date: Fri, 24 Apr 2009 19:19:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 24, 2009 at 09:03:18PM +0200, Koen Kooi wrote:
> On 24-04-09 19:55, Philip Balister wrote:
>> Koen Kooi wrote:
>>> Hi,
>>>
>>> Recently the e17 people made a change to how libtool names their
>>> libraries by poking in some magic string (ver-pre-svn-00) into SONAME.
>>> This has some implications for OE, namely that you get the old *and*
>>> new lib in your rootfs. There was one bug that killed everything at
>>> runtime:
>>>
>>> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=1496aea759adb716453d0fbf85795a5a6e914484
>>>
>>>
>>> So after that cset you'd get a completely working rootfs again with
>>> e17 stuff.
>>>
>>> Today a few csets have been pushed that break things horribly:
>>>
>>> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=6898f8ca089d35109b3652d640ebb907d8115736
>>>
>>> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=8101ad8e1229b3b9f8aa0be0fdc262b5283034d0
>>>
>>> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=80c85e0af3865710a189ba536022d326fa996d26
>>>
>>>
>>> Let's take a look at the generated packages:
>>>
>>> before:
>>> libecore-evas-ver-pre-svn-00-0_0.9.9.050+svnr40247-r3.1_armv7a.ipk
>>> after:
>>> libecore-ver-pre-svn-00-lib-evas_0.9.9.060+svnr40247-r3.1_armv7a.ipk
>>>
>>> So suddenly the library packages (or plugin packages, but no
>>> difference in this case) have a new name, but don't set RPROVIDES or
>>> RREPLACES to the old packages containing *the same files*. This means
>>> that 'opkg install <foo>' or 'opkg upgrade' doesn't work anymore. It
>>> will abort saying to package <foo> wants to overwrite files belonging
>>> to <bar>. Depending on the way you build your images in OE, your build
>>> will break.
>>>
>>> My position is that breaking upgrade patch unacceptable without prior
>>> notice and that the above 3 csets get reverted ASAP.
>>> The changes in question are not intrinsically bad, and the
>>> autosplitting is way better than manually poking at FILES_foo, but
>>> right now they break way too much at runtime.
>>
>> I'm not opposed to breaking upgrade paths in .dev.
>
> You're are saying that breaking upgrade paths in .dev with prior notice  
> is OK? Shall I go head and delete package_{ipk,deb,rpm}.bbclass then,  
> since .dev will only work with package_tar.bbclass?
>
> Upgrade paths are the foundation of package management, breaking them is  
> stabbing people using your binaries in the eye. Do you want to tell the  
> companies evaluating OE using .dev that they can't use the feature  
> anymore that drew them to OE, namely package management?
>
> If it's OK to break package management is it OK to break toolchains as  
> well? If people can't use the resulting binaries it should be OK to  
> break the compiler that would build them, right?
>
> Without upgrade paths OE is just buildroot with a really slow parser on top.

So it's not OK to say "Upstream changed things, and we're following suit
here in the development line.  Over in the stable line we're adding the
extra overhead to allow for a clean upgrade path".

-- 
Tom Rini


