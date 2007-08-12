Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IK9FN-00046I-Lm
	for openembedded-devel@openembedded.org; Sun, 12 Aug 2007 10:56:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7C8uPho032571
	for <openembedded-devel@openembedded.org>;
	Sun, 12 Aug 2007 09:56:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32311-05 for <openembedded-devel@openembedded.org>;
	Sun, 12 Aug 2007 09:56:20 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7C8uJ1f032564
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sun, 12 Aug 2007 09:56:19 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <74d0deb30708111748i666057f7s519b631cdc772f98@mail.gmail.com>
References: <74d0deb30708100622mb2c048et188fca0c03e8117e@mail.gmail.com>
	<1186761021.6405.45.camel@localhost.localdomain>
	<74d0deb30708110320n3cebe757seccd90801ee49e5a@mail.gmail.com>
	<1186836221.5859.32.camel@localhost.localdomain>
	<74d0deb30708111748i666057f7s519b631cdc772f98@mail.gmail.com>
Date: Sun, 12 Aug 2007 09:56:18 +0100
Message-Id: <1186908978.6156.6.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] a small bbclass for task recipes
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
X-List-Received-Date: Sun, 12 Aug 2007 08:56:30 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Sun, 2007-08-12 at 02:48 +0200, pHilipp Zabel wrote:
> Then PACKAGES += "task-b task-c task-d"?
> That will help because it keeps ${PN}-dev and -dbg packages, but still
> doesn't create -dev and -dbg for task-a and task-b ...

Looking at Poky, you do have to add the -dev and -dbg package names to
PACKAGES manually:

http://svn.o-hand.com/view/poky/trunk/meta/packages/tasks/task-poky.bb?rev=2466&view=markup

which is perhaps more ammunition for a task.bbclass. 

> Ah, thanks.
> The reason it didn't work for some packages was that they set RDEPENDS
> instead of RDEPENDS_${PN}.

In the fragment you quoted it does do:

rdepends = explode_deps(bb.data.getVar('RDEPENDS_' + base, d, 1) or
bb.data.getVar('RDEPENDS', d, 1) or "")

which should cover plain RDEPENDS (if RDEPENDS_${PN} isn't set)?

> The reason it didn't work for some other packages is that they use RRECOMMENDS,
> not (only) RDEPENDS. Currently package_depchains()
> only shovels the base packages' RDEPENDS into the flavoured packages'
> RRECOMMENDS, adding the corresponding pre/postfix.
> To make this mechanism useful for task packages, we'd have to scan
> the base packages' RRECOMMENDS, too. Can we do this without negatively
> affecting some existing -dbg or -dev packages?

There were differences in the depchains code in poky which I merged last
night. I think this issue might have been addressed but it needs to be
checked.

> I further noticed that setting ALLOW_EMPTY_${PN}-dbg = "0" like in the
> attached patch has no effect because (not "0") is False in python
> (getVar returns a string).
> Should not bb.data.getVar('ALLOW_EMPTY', localdata) be changed to
> bb.data.getVar('ALLOW_EMPTY', localdata) != "1" in
> package_ipk.bbclass?

Yes, that looks like something it would be good to fix.

Cheers,

Richard




