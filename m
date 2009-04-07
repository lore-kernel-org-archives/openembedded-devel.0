Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LrGPi-0004u0-Jp
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Apr 2009 20:53:19 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KHQ00GTAUYAAWC9@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	07 Apr 2009 13:49:27 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D80D66B83A8; Tue,
	07 Apr 2009 14:49:21 -0400 (EDT)
Date: Tue, 07 Apr 2009 14:49:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090407184921.GE11203@denix.org>
References: <200904071212.18247.mickey@vanille-media.de>
	<20090407174351.GD11203@denix.org> <grg59h$e3q$1@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <grg59h$e3q$1@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL,BAYES_00,
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
X-List-Received-Date: Tue, 07 Apr 2009 18:53:34 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 07, 2009 at 08:16:16PM +0200, Koen Kooi wrote:
> On 07-04-09 19:43, Denys Dmytriyenko wrote:
>> if you don't have opkg in your system PATH, you may need to
>> remove opkg packages from pstage to force rebuilding and installing it. 
>> Its a
>> chicken and egg problem - opkg-native binary is in .ipk and in order to
>> install and use it you need opkg-native...
>
> That's not true:
>
> PSTAGE_PKGMANAGER = "stage-manager-ipkg"
>
> [..]
>
>     pkgmanager = bb.which(path, 'opkg-cl')
>     if pkgmanager == "":
>         pkgmanager = bb.which(path, 'ipkg-cl')
>     if pkgmanager != "":
>         bb.data.setVar("PSTAGE_PKGMANAGER", pkgmanager, d)
>
>
> stage-manager-ipkg is a shell script (flashback to the original ipkg 
> implementation), which will get used till opkg-cl is found in $PATH.

Hmm, good to know - thanks! I wonder why it doesn't always work, as reported 
on irc? The workaround so far was to delete the opkg package from pstage...

-- 
Denys


