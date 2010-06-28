Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1OT9hM-0000Mz-Eq
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jun 2010 10:28:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o5S8NVjp029018
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jun 2010 09:23:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28775-05 for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jun 2010 09:23:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o5S8NPlg029012
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jun 2010 09:23:26 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <i0220d$htp$1@dough.gmane.org>
References: <201006250901.38077.schnitzeltony@gmx.de>
	<i0220d$htp$1@dough.gmane.org>
Date: Mon, 28 Jun 2010 09:23:24 +0100
Message-ID: <1277713404.29314.3248.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: MeeGo support in OE
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
X-List-Received-Date: Mon, 28 Jun 2010 08:28:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-06-25 at 12:56 +0200, Koen Kooi wrote:
> On 25-06-10 09:01, Andreas Mueller wrote:
> > My investigations for a 'colorful' embedded environment lead me to Meego (http://meego.com/).
> > 
> > On the webpage we learn that this is a platform independent environment but there are only few platforms supported (Nokia N900 / Beaglebord / few Intel netbooks).
> > 
> > To have full platform-independency I would like to have Meego (maybe parts of it only) within OE and started already with easiest part uxlaunch (very tiny dm - see 
> > git://gitorious.org/meego-os-base/uxlaunch.git). This is already tested with xfce environment but before posting a patch here I would like to do some further tests with gnome/enlightenment and 
> > see what happens in case another dm is found in the image. 
> > 
> > Next step planned is mutter. Here I would like to use the original gnome sources and check the diffs to meego branch.
> > 
> > Now my questions:
> > 
> > - Are there any objections including meego parts (licensing / don't like Intel/Nokia..) in OE
> > - Are there already proceedings related to mutter ongoing? Or is there a reason that mutter is not in OE other than nobody has done so far?
> 
> I didn't add mutter because at the time it didn't build against
> clutter/gles. It think that has changed now :)
> 
> I would very much like to build meego components in OE!

You could do worse than look at meta-moblin in Poky which has recipes
for some components like mutter.

Cheers,

Richard



