Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LrFNx-0006sE-F5
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Apr 2009 19:48:27 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KHQ00JC4RX4X3Y7@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	07 Apr 2009 12:43:52 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CFD886B83A8; Tue,
	07 Apr 2009 13:43:51 -0400 (EDT)
Date: Tue, 07 Apr 2009 13:43:51 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090407174351.GD11203@denix.org>
References: <200904071212.18247.mickey@vanille-media.de>
MIME-version: 1.0
In-reply-to: <200904071212.18247.mickey@vanille-media.de>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=AWL,BAYES_40,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: DEPLOY_DIR / packaged staging / persistent toolchains
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
X-List-Received-Date: Tue, 07 Apr 2009 17:48:44 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 07, 2009 at 12:12:18PM +0200, Michael 'Mickey' Lauer wrote:
> Hi folks,
> 
> I just stumbled over something that surprises me. I have set DEPLOY_DIR 
> outside TMP for a while (which works fine). Now when I remove the TMPDIR to 
> start a new build from scratch, I can no longer build anything. Apparantly OE 
> thinks I do no longer need a toolchain, since it does not attempt to built 
> one. I need to remove the whole DEPLOY_DIR to be able to do any builds again.
> 
> Wasn't the idea of packaged staging to be able to keep core packages and the 
> toolchain intact when removing TMPDIR? If I understodd this wrong, how can I 
> do something like that these days? Would it be sufficient to set CROSS_DIR 
> outside TMPDIR?

Mickey,

Are you overwriting DEPLOY_DIR_PSTAGE from its default ${DEPLOY_DIR}/pstage?

Otherwise it should work and should populate CROSS_DIR from pstage. There is 
one little quirk - if you don't have opkg in your system PATH, you may need to 
remove opkg packages from pstage to force rebuilding and installing it. Its a 
chicken and egg problem - opkg-native binary is in .ipk and in order to 
install and use it you need opkg-native...

-- 
Denys


