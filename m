Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <utx@penguin.cz>) id 1IGZyG-0002cb-4D
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2007 14:40:04 +0200
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id AB8DD628495
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Aug 2007 14:38:02 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46B1C71F.2090608@klever.net>
References: <46B1753D.1090507@dominion.kabel.utwente.nl>
	<46B1B6DB.6020603@klever.net>
	<1186053831.5972.222.camel@hammer.suse.cz>
	<46B1C71F.2090608@klever.net>
Date: Thu, 02 Aug 2007 14:38:02 +0200
Message-Id: <1186058282.5972.232.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
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
X-List-Received-Date: Thu, 02 Aug 2007 12:40:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Michael Krelin wrote:
> > Michael Krelin wrote:
> >> I don't know much about gstreamer, but being inventor of
> >> OE_LT_RPATH_ALLOW I felt obliged to look into gst-plugins.inc and I'm
> >> guessing it should be:
> > 
> > Maybe it would be better to not break build environment and then work
> > around consequent errors by hacks like OE_LT_RPATH_ALLOW,
> > never-ever-do-rpath.patch etc.
> > 
> > gcc has --sysroot which can do required linking without any hacks.
> > 
> 
> Generally, I tend to agree, but in practice I'm afraid that would amount
> to rewriting the whole OE...

No.

1. and 2. and 4. should be change of about 20 lines (change xxxx_CC from
e. g. "arm-angstrom-linux-gnueabi-gcc" to e. g.
"arm-angstrom-linux-gnueabi-gcc --sysroot=/OE/build/tmp/staging/arm-angstrom-linux-gnueabi").
I only could not find correct lines.

If anybody tell me the correct location, I can do test bootstrap with
the new options.

5. is low priority, after 4. it will become NOP

6. Is already done, it should be enough to change check pattern in the
QA stuff.

3. and 7. break packages (e. g. findutils) not depending on CC
definition and has to be fixed manually anyway.

And if 8. will be done (in far future), most individual fixes in 7.
could be removed.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



