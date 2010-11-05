Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1PERur-00041D-0T
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 20:25:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id oA5JOe8O025410
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 5 Nov 2010 19:24:40 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24784-09 for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Nov 2010 19:24:36 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id oA5JOYWn025404
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 5 Nov 2010 19:24:34 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1288975005.3826.56.camel@mattotaupa>
References: <1288973274.28481.15978.camel@rex>
	<1288975005.3826.56.camel@mattotaupa>
Date: Fri, 05 Nov 2010 19:24:17 +0000
Message-ID: <1288985057.28481.15994.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OpenEmbedded and the Yocto Project
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
X-List-Received-Date: Fri, 05 Nov 2010 19:25:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-11-05 at 17:36 +0100, Paul Menzel wrote:
> Am Freitag, den 05.11.2010, 16:07 +0000 schrieb Richard Purdie:
> > Hopefully this email explains some of the reasons the project exists,
> > what the differences are to OE and that is isn't something bad but
> > actually a very positive thing. I have not dived into the topic of
> > if/how Poky and OE can work together, that can be the subject of another
> > email. If anyone has any questions I'm happy to answer them.
> 
> Actually this is in my opinion the most important question. In the
> beginning you talk about the one good build system.
> 
> But in the end to get the one good build system, OpenEmbedded should
> somehow be merged into or replaced by Poky(?) or be replaced, should not
> it?
> 
> I have only some small experience with and used only OpenEmbedded. So I
> do not know about Poky and the other build systems. But I agree with you
> to try to avoid duplicate work.
> 
> So a message about your vision about the future of OE would be greatly
> appreciated.

The thing to keep in mind is that Poky and OE are very similar, sharing
bitbake, the recipe format and pretty much the same class files.

We therefore we didn't start a new build system project we took an
existing one very similar to OpenEmbedded and we plan to keep the
architecture the same. Even since Poky was created over five years ago
I've been publicly discussing new features, how they're best implemented
and so on with OE developers, bitbake maintainers and the OE TSC so the
projects stay roughly in sync.

I've stated what Yocto/Poky is doing differently and why, the question
now is whether the OE developers agree/disagree with those things and if
they are prepared to change OE at all to address some of the reasons
Yocto is doing some things differently.

There are ways the two projects can complement each other but there has
to be a will there to do it. Traditionally, OE has trouble making
decisions which I think it hurts the project in general. I'm hoping this
topic isn't going to be one of those things it fails to reach a
conclusion on.

Cheers,

Richard




