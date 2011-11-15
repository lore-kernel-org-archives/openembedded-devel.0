Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1RQSuP-00052w-A4
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Nov 2011 00:59:21 +0100
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LUQ003YH7NTJ061@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	15 Nov 2011 17:52:47 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A6A0014AF5D; Tue,
	15 Nov 2011 18:52:41 -0500 (EST)
Date: Tue, 15 Nov 2011 18:52:41 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20111115235241.GC15557@denix.org>
References: <CAObi9r-fY1M+5PbW=ZXxfPigrT_yrOabWv9C1_2VL-OBg037Xg@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAObi9r-fY1M+5PbW=ZXxfPigrT_yrOabWv9C1_2VL-OBg037Xg@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: wrapping bb and updating base bb environments
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
X-List-Received-Date: Tue, 15 Nov 2011 23:59:21 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Nov 15, 2011 at 09:43:04PM +0200, mgundes wrote:
>    Hi,
> 
>    I wonder if there is a way to wrap a bb file. For example, I use
> dropbear with oe classic but I need to make some update in dropbear init
> script. I copied oe/openembedded/recipes/dropbear/ to another bb path which
> has higher bbfile priority. In this case bitbake find bb and files
> in workarea/recipes/dropbear/ and I update init script in
> path workarea/recipes/dropbear/dropbear/init. It is ok and work fine
> however I duplicate whole recipe files for my little update. Is there a
> better way do same thing without duplicating whole files such as simple bb
> wrapping original dropbear bb file?
> 
>    Since oe is so modular and talented I though there would already be a
> way to do that :)

There are at least 2 ways - first is the old amend class[1], which allows you 
to alter recipes with simple amend.inc placed in your overlay, that gets 
parsed after the corresponding recipe, letting you overwrite any variables 
from the original recipe, like we often do in Arago, for example[2][3].

Another way is to use bbappend feature of the newer bitbake. It's used quite a 
lot with the "new" layered structure of oe-core and meta-oe. You just place a 
file, named like your recipe, but instead of .bb extension, it's .bbappend[4][5]

[1] http://cgit.openembedded.org/openembedded/tree/classes/amend.bbclass?h=org.openembedded.dev
[2] http://arago-project.org/git/?p=arago.git;a=blob;f=recipes/openobex/openobex/amend.inc;hb=HEAD
[3] http://arago-project.org/git/?p=arago.git;a=blob;f=recipes/qt4/qt4-embedded-4.7.2/amend.inc;hb=HEAD
[4] http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-devtools/gcc/gcc-cross_4.6.bbappend
[5] http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-qt/qt4/qt4-embedded_4.7.4.bbappend

-- 
Denys


