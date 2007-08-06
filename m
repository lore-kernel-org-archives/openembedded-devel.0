Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <utx@penguin.cz>) id 1II60q-0004im-64
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Aug 2007 19:05:00 +0200
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id 319C7628192
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2007 19:02:34 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46B74C34.4050300@klever.net>
References: <46B1753D.1090507@dominion.kabel.utwente.nl>
	<46B1B6DB.6020603@klever.net>	<1186053831.5972.222.camel@hammer.suse.cz>
	<46B1C71F.2090608@klever.net>	<1186058282.5972.232.camel@hammer.suse.cz>
	<46B1D0DA.5030905@balister.org>	<1186061255.5972.243.camel@hammer.suse.cz>
	<46B1E063.7010407@dominion.kabel.utwente.nl>
	<1186064138.5972.259.camel@hammer.suse.cz>
	<46B1E812.8020706@dominion.kabel.utwente.nl>
	<1186066059.5972.269.camel@hammer.suse.cz>	<46B1F78F.4040700@klever.net>
	<46B1FC60.6030908@dominion.kabel.utwente.nl>	<46B1FDD8.8000404@klever.net>
	<46B20D9F.70704@dominion.kabel.utwente.nl>
	<1186093013.6626.57.camel@localhost.localdomain>
	<1186132901.5972.314.camel@hammer.suse.cz>
	<1186313563.5962.36.camel@localhost.localdomain>
	<46B63294.30107@klever.net> <1186395310.5972.360.camel@hammer.suse.cz>
	<46B74C34.4050300@klever.net>
Date: Mon, 06 Aug 2007 19:02:33 +0200
Message-Id: <1186419753.27368.43.camel@hammer.suse.cz>
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
X-List-Received-Date: Mon, 06 Aug 2007 17:05:00 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Michael Krelin wrote:
> > I am still not sure, how correct will be binaries created by upper
> > mentioned wrappers, but it will be for sure better than the
> > libtool-level hack. And it's easy to catch remaining references by QA
> > scripts.
> 
> You mostly make a lot of sense, but sometimes I'm puzzled by your
> statements. You're not sure whether binaries will be correct, but for
> sure better than correct ones made the way you personally (and for
> reason) dislike?

To be exact:

I tried to create a binary + library loaded with use of rpath using
"libtool ...-gcc --sysroot ..." option instead of current approach.

Library was properly find and loaded after copying to my Zaurus.

I got some references into sysroot path in debug section, no reference
in stripped code, no reference in .la files.

After stripping binaries and library, there was no reference to sysroot
any more.

I did not do further research on references in debug section. It's
required to check, whether debug info is correct.

Overall, it looks like better result than the current solution.

I did not yet wrote the wrapper, so I don't know, whether the result
will be as good as gcc --sysroot.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



