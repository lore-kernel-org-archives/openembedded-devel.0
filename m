Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OtR8w-0006of-NZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 22:21:20 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OtR8D-00056l-KH from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 13:20:33 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 8 Sep 2010 13:20:23 -0700
Received: from [172.30.80.172] ([172.30.80.172]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 8 Sep 2010 14:20:22 -0600
Message-ID: <4C87F003.7060106@mentor.com>
Date: Wed, 08 Sep 2010 13:20:19 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C874458.3060101@nedap.com>	<lytym0e69l.fsf@ensc-virt.intern.sigma-chemnitz.de>	<4C87D8FD.9050709@mentor.com>
	<ly7hiwknoq.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <ly7hiwknoq.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-OriginalArrivalTime: 08 Sep 2010 20:20:22.0658 (UTC)
	FILETIME=[43CE6E20:01CB4F93]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: cmake-native trouble making
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
X-List-Received-Date: Wed, 08 Sep 2010 20:21:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Enrico Scholz wrote:
> Tom Rini <tom_rini@mentor.com> writes:
> 
>>>> | /usr/bin/ld: cannot find -ltinfo
>>> no, 'DEPENDS = "ncurses-native"'; BUT:
>>>
>>> * it will cause problems on (host)distributions which do not have libtinfo
>>>   (e.g. RHEL5) and have ncurses-native in their ASSUME_PROVIDED
>> Isn't the whole point of ASSUME_PROVIDED that user be aware?
> 
> Would be too arbitrary in this case because it forces people to check by
> trial & error whether ASSUME_PROVIDED are working.  A raw guideline for
> adding an entry to ASSUME_PROVIDED should be, whether a corresponding,
> recent -devel package has been installed on the host.

That seems totally backwards.  The guideline for adding an entry to 
ASSUME_PROVIDED is that you know better than the build system.  No one 
doing commits for native packages should have anything set, or at least 
confirming that having an empty set (aside from bitbake.conf anyhow...) 
works fine too as that's the common case.

> imo, packages should not have so strict requirements on the actual
> provider but check in their configure task what to use (this includes
> autodetection of libtinfo vs. libtermcap vs. libncurses).

Yes, and we're grappling with the fallout of a big switch, which 
includes fixing up (or upgrading) other packages to be happy with a 
given version.

> For cmake, problem above can by solved by an initial configuration
> script having
> 
> | SET (BUILD_CursesDialog OFF CACHE BOOL "" FORCE)
>

Great, lets do that.

> 
>>> * some hours ago I added a libtermcap.so compatibility symlink to
>>>   ncurses(-native) so that 5ea3047995421d99f7f3537cb8f9ae23f3185a9f
>>>   might not be needed anymore
>> Um, is there a reason this wasn't just done as a ln within the recipe?
> 
> It's a mix of personal preference, following Fedora's packaging of this
> file and the hope to use some more of the power of linker scripts (giving
> out a deprecated warning, add AS_NEEDED, linking against multiple files).
> There was no opposition when I wrote about linker scripts neither.
> 
> Perhaps I should have made it inline by 'echo INPUT(-ltinfo) > ...' but
> I did not saw this when I committed the patch.

Well, it wasn't at all clear from the commit message why anything more 
than a symlink was done.  So can you please add a comment and a commit 
message explaining what's going on here?  Thanks!

-- 
Tom Rini
Mentor Graphics Corporation


