Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LxQkz-0006by-Lo
	for openembedded-devel@openembedded.org; Fri, 24 Apr 2009 21:08:17 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LxQgM-000361-Nl
	for openembedded-devel@openembedded.org; Fri, 24 Apr 2009 19:03:32 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 24 Apr 2009 19:03:30 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 24 Apr 2009 19:03:30 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 24 Apr 2009 21:03:18 +0200
Message-ID: <gst2dn$u4j$1@ger.gmane.org>
References: <gsst4a$cvj$1@ger.gmane.org> <49F1FCFB.9000205@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <49F1FCFB.9000205@balister.org>
Sender: news <news@ger.gmane.org>
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
X-List-Received-Date: Fri, 24 Apr 2009 19:08:17 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24-04-09 19:55, Philip Balister wrote:
> Koen Kooi wrote:
>> Hi,
>>
>> Recently the e17 people made a change to how libtool names their
>> libraries by poking in some magic string (ver-pre-svn-00) into SONAME.
>> This has some implications for OE, namely that you get the old *and*
>> new lib in your rootfs. There was one bug that killed everything at
>> runtime:
>>
>> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=1496aea759adb716453d0fbf85795a5a6e914484
>>
>>
>> So after that cset you'd get a completely working rootfs again with
>> e17 stuff.
>>
>> Today a few csets have been pushed that break things horribly:
>>
>> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=6898f8ca089d35109b3652d640ebb907d8115736
>>
>> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=8101ad8e1229b3b9f8aa0be0fdc262b5283034d0
>>
>> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=80c85e0af3865710a189ba536022d326fa996d26
>>
>>
>> Let's take a look at the generated packages:
>>
>> before:
>> libecore-evas-ver-pre-svn-00-0_0.9.9.050+svnr40247-r3.1_armv7a.ipk
>> after:
>> libecore-ver-pre-svn-00-lib-evas_0.9.9.060+svnr40247-r3.1_armv7a.ipk
>>
>> So suddenly the library packages (or plugin packages, but no
>> difference in this case) have a new name, but don't set RPROVIDES or
>> RREPLACES to the old packages containing *the same files*. This means
>> that 'opkg install <foo>' or 'opkg upgrade' doesn't work anymore. It
>> will abort saying to package <foo> wants to overwrite files belonging
>> to <bar>. Depending on the way you build your images in OE, your build
>> will break.
>>
>> My position is that breaking upgrade patch unacceptable without prior
>> notice and that the above 3 csets get reverted ASAP.
>> The changes in question are not intrinsically bad, and the
>> autosplitting is way better than manually poking at FILES_foo, but
>> right now they break way too much at runtime.
>
> I'm not opposed to breaking upgrade paths in .dev.

You're are saying that breaking upgrade paths in .dev with prior notice 
is OK? Shall I go head and delete package_{ipk,deb,rpm}.bbclass then, 
since .dev will only work with package_tar.bbclass?

Upgrade paths are the foundation of package management, breaking them is 
stabbing people using your binaries in the eye. Do you want to tell the 
companies evaluating OE using .dev that they can't use the feature 
anymore that drew them to OE, namely package management?

If it's OK to break package management is it OK to break toolchains as 
well? If people can't use the resulting binaries it should be OK to 
break the compiler that would build them, right?

Without upgrade paths OE is just buildroot with a really slow parser on top.

 > After all .stable exists to provide a sane base for supplying 
packages to users.

Having a stable branch does not mean that turning .dev into an unusable 
wasteland is OK. I was hoping that the focus on quality for the stable 
branch would have a positive impact on .dev, but that doesn't seem to be 
the case.

regards,

Koen



