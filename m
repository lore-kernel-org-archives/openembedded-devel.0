Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OKXcb-0004Ko-Dy
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 16:11:56 +0200
Received: by gwb15 with SMTP id 15so916559gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 07:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=/ylpcRRhotHeDmp6+6lfqZ07TWPZwFSPSSHibscYuFY=;
	b=mrObVMYOCsgudNQNs6H541nrNjQzbJjJitWQIedCJwFQO/rewuz93cexOCrE4uOHIE
	DsidqvAzQR5Q5AAc8PTxb1Lb2pw/YxhlRxR/qz6Qh6Q9SOeQz8V9XUORHuJPC35jui6R
	GJf55T0n8cbGorLVo4IxBI82G+8Jpf5TrIrms=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=nOrBoZa9AnOdbbJl3X8LORBwYQXQ52KF1Qe2hiKrUpF+2zfh1mqPEp8YzbdrdltVCZ
	5qtv9+VBn4XhHF6/Uax0+z22xa9J4/g8b60vfW2xPOagWRIj6Q4v+rLP20icG6qC0YQq
	GjFuclOivKfUQO2LoLU2erLaJlmblOfOw68bA=
Received: by 10.224.113.201 with SMTP id b9mr5799839qaq.66.1275660443018; Fri, 
	04 Jun 2010 07:07:23 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.3.133 with HTTP; Fri, 4 Jun 2010 07:07:02 -0700 (PDT)
In-Reply-To: <AANLkTikyR0VhEu_Ex4JcaJ1bDHLK2Rh6NyVF801VtlVy@mail.gmail.com>
References: <AANLkTikyR0VhEu_Ex4JcaJ1bDHLK2Rh6NyVF801VtlVy@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 4 Jun 2010 07:07:02 -0700
X-Google-Sender-Auth: kY09DLibRMOqW3gAWIay3oCMt_c
Message-ID: <AANLkTimKfsHgJIGlyzsX9tneLob9uyQo5riVZ5mbxqQj@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 1/2] Rename url params patch=<ignored>/pnum=<n> to apply={yes, no}/striplevel=<n>
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
X-List-Received-Date: Fri, 04 Jun 2010 14:11:56 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 4, 2010 at 5:52 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> Apologies for not replying to the original message, but that one is
> already deleted.
>
> Just bumped into this after doing a pull.
>
> A few comments:
>
> I would suggest if doing something like this that it is announced
> somewhat more explictly so people are well aware of it. Since it was
> brought as a patch it escaped my attention, and in fact it is not only
> a patch but also a change of policy.
>

Personally, I'd think people should always read any patches to the main
classes, including patch.bbclass.  Any change to a core class or config file
has the potential for large impact, and it would benefit everyone to be
aware of those things.

That said, I'll be sure to send out an RFC to try to draw more attention to
it next time around.


> Also I'd like to suggest to complete the change by also updating the
> manual, otherwise this could become confusing.
>

Yes, I know, I intended (and still do intend) to update the manual, but
haven't gotten to it yet.  I apologize for the delay.


> Most recipes are updated, but a few are apparently not.
> This is a grep on a git pull of yesterday (or maybe 1.5 day ago):
>
> frans@frans:~/workspace/nios2/openembedded.git$ grep -r ";patch" recipes
> recipes/m4/m4_1.4.14.bb:SRC_URI += "file://f13-compile.patch;patch=1"
> recipes/udev/udev_092.bb:SRC_URI += "file://noasmlinkage.patch;patch=1 \
> recipes/udev/udev_092.bb:           file://flags.patch;patch=1 \
> recipes/udev/udev_092.bb:           file://udevsynthesize.patch;patch=1 \
> recipes/udev/udev_092.bb:            file://arm_inotify_fix.patch;patch=1
> \
> recipes/udev/udev_092.bb:
> file://mtd-exclude-persistent.patch;patch=1 \
> recipes/udev/udev_100.bb:SRC_URI += "file://noasmlinkage.patch;patch=1 \
> recipes/udev/udev_100.bb:           file://flags.patch;patch=1 \
> recipes/udev/udev_100.bb:
> file://mtd-exclude-persistent.patch;patch=1 \
> recipes/udev/udev_097.bb:SRC_URI += "file://noasmlinkage.patch;patch=1 \
> recipes/udev/udev_097.bb:           file://flags.patch;patch=1 \
> recipes/ti/matrix-gui_svn.bb:
> file://0001-Disable-cursor-override-for-X11.patch;patch=1 \
> recipes/mplayer/mplayer_0.0+1.0rc2.bb:
> file://w100-mplayer.patch;patch= \
>

I suspect those were due to recent merges and commits after the change, as
I'm fairly certain the patches covered the existing ones at that point in
time.  It's also harmless.  The old flags *still work*, they're just
deprecated, and will display warnings, along with suggestions of what to use
instead.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

