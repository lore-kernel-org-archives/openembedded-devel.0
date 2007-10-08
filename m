Received: from [209.85.198.189] (helo=rv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <papercrane@gmail.com>) id 1If1py-0003Wo-Ki
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2007 01:16:35 +0200
Received: by rv-out-0910.google.com with SMTP id c24so852583rvf
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Oct 2007 16:10:49 -0700 (PDT)
Received: by 10.114.79.1 with SMTP id c1mr11559816wab.1191885049029;
	Mon, 08 Oct 2007 16:10:49 -0700 (PDT)
Received: by 10.114.144.2 with HTTP; Mon, 8 Oct 2007 16:10:48 -0700 (PDT)
Message-ID: <432beae0710081610k11b018a9s164aff560466718d@mail.gmail.com>
Date: Mon, 8 Oct 2007 16:10:48 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <DE31D336-513F-40FF-B766-DCED127697B0@gumstix.com>
MIME-Version: 1.0
References: <DE31D336-513F-40FF-B766-DCED127697B0@gumstix.com>
Subject: Re: monotone question
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
X-List-Received-Date: Mon, 08 Oct 2007 23:16:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/8/07, Craig Hughes <craig@gumstix.com> wrote:
> I'm trying to propagate changes from the org.openembedded.dev branch
> onto my own branch, which I'd previous split off of org.oe.dev:
>
> craig@azazel ~/code/gumstix/build/oe/org.gumstix.oe $ mtn propagate
> org.openembedded.dev org.gumstix.oe
> mtn: propagating org.openembedded.dev -> org.gumstix.oe
> mtn: [source] 1a130f677a5150a067c580db5a25b619d936b441
> mtn: [target] 4cd685ff40e8d2ee51c4e79e8fe6545549b865b6
> mtn: warning: rename target conflict: nodes 24673, 24302, both want
> parent 2139, name udev-115
> mtn: warning: rename target conflict: nodes 24685, 24309, both want
> parent 2139, name udev_115.bb
> mtn: warning: rename target conflict: nodes 24693, 24630, both want
> parent 25, name wifistix
> mtn: warning: rename target conflict: nodes 24718, 24372, both want
> parent 23861, name gumstix-pxa270-mmc.patch
> mtn: warning: rename target conflict: nodes 24719, 24373, both want
> parent 23861, name smc911x-fixup.patch
> mtn: warning: resolve non-content conflicts and then try again.
> mtn: error: merge failed due to unresolved conflicts
>
> Now after some googling and head scratching, I've managed to decipher
> those errors (which call themselves warnings) mean that the left and
> right branches both added a new file with the same name.  But, how do
> I resolve this conflict in a propagate?  In a merge, I could just mv
> the file from my workdir then merge to get the file from the other
> branch, then manually merge; kind of a PITA it should just diff3 them
> for me with an empty ancestor or something and let me do the merge
> that way -- no idea why there's a special case when the ancestor is
> non-existent vs existent.  But with a propagate, there is no
> "workdir" in which to perform this.  Is the only way to resolve this
> to, say, checkout org.gumstix.oe, then delete the files from it,
> commit, then propagate?

That's essentially the only way to fix it. You could also rename them
or move them to another place. Monotone doesn't merge these since they
aren't the same file ancestrally, they just happen to have the same
name.

> That seems really bad cos there's a window
> there where the org.gumstix.oe needs to be committed in a broken
> state (missing those files)....

True, but if you always expect every single revision to be bug-free.....

>
> Anyone got any thoughts on how to resolve this?
>



-- 
Justin Patrin


