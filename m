Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 77AF071A73
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2017 20:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8898820AAE;
	Wed, 18 Jan 2017 20:55:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id tojssYORwyen; Wed, 18 Jan 2017 20:55:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 687782078F;
	Wed, 18 Jan 2017 20:55:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DC24C162321; Wed, 18 Jan 2017 15:55:53 -0500 (EST)
Date: Wed, 18 Jan 2017 15:55:53 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Mikko Gronoff <mikko.gronoff@qt.io>
Message-ID: <20170118205553.GT15833@denix.org>
References: <1484363626-12770-1-git-send-email-denis@denix.org>
	<72187853-9f6e-e0a0-b09c-c87060ae182e@qt.io>
	<20170117174621.GQ15833@denix.org> <20170118012720.GA3279@jama>
	<29daa72b-2c73-3c71-abb3-7a22b8d81e0d@qt.io>
MIME-Version: 1.0
In-Reply-To: <29daa72b-2c73-3c71-abb3-7a22b8d81e0d@qt.io>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][morty-next][PATCH] qtwebengine: update SRCREV due to old commit no longer being available
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jan 2017 20:55:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 18, 2017 at 02:54:29PM +0200, Mikko Gronoff wrote:
> Hi,
> 
> FYI the commit should be available now.

That's also great news, hopefully we can get 5.7.1 in morty soon.


> On 01/18/2017 03:27 AM, Martin Jansa wrote:
> >On Tue, Jan 17, 2017 at 12:46:21PM -0500, Denys Dmytriyenko wrote:
> >>Mikko,
> >>
> >>Are there any estimatest when this commit is finally coming?
> >>
> >>
> >>Currently, morty is broken for me because it doesn't have the corresponding
> >>QWaylandIntegration patch from master and Martin doesn't want to apply it,
> >>since Qt 5.7.1 is coming any day now. And while 5.7.1 is already in
> >>morty-next, it is also broken for me, because it points to a missing commit
> >>in qtwebengine, which is also coming any day now.
> >>
> >>I'd like to get unblocked on either of this issues ASAP, as it's been in the
> >>limbo for quite some time!
> >>
> >>
> >>Martin,
> >>
> >>Would you mind applying the old QWaylandIntegration patch to morty, while we
> >>are still waiting for 5.7.1 update to finalize? You already have the modified
> >>and squashed version for 5.7.1 in morty-next, so should be easy to rebase and
> >>merge it in the future... Please let me know, thanks.
> >ok, I've pushed your change from morty-next to morty.
> >
> >>-- 
> >>Denys
> >>
> >>
> >>On Mon, Jan 16, 2017 at 02:43:05PM +0200, Mikko Gronoff wrote:
> >>>This one commit was missing a merge from 5.7.1 branch to 5.7 but
> >>>it's coming very soon. The merge commit is already done, it's just a
> >>>matter of author submitting it in. Should be available very soon.
> >>>
> >>>-Mikko
> >>>
> >>>
> >>>On 01/14/2017 05:13 AM, Denys Dmytriyenko wrote:
> >>>>From: Denys Dmytriyenko <denys@ti.com>
> >>>>
> >>>>Previous commit used for 5.7.1 baseline is no longer available on 5.7 branch.
> >>>>
> >>>>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >>>>---
> >>>>  recipes-qt/qt5/qtwebengine_git.bb | 2 +-
> >>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>>diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
> >>>>index 4712441..210f791 100644
> >>>>--- a/recipes-qt/qt5/qtwebengine_git.bb
> >>>>+++ b/recipes-qt/qt5/qtwebengine_git.bb
> >>>>@@ -122,7 +122,7 @@ SRC_URI += " \
> >>>>      file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch \
> >>>>  "
> >>>>-SRCREV_qtwebengine = "9cc97f0c63049a8076476acc89c875c9e240abfb"
> >>>>+SRCREV_qtwebengine = "6766290699acd0d73c81cf690012d52729e518b9"
> >>>>  # This is in git submodule, but we're using the latest in 49-based
> >>>>  # SRCREV_chromium = "c109a95a067af783e48f93d1cdeca870cda98878"
> >>>>  SRCREV_chromium = "b3c79e92f0a631273b639af171e59f4c367ae02e"
> >>>-- 
> >>>_______________________________________________
> >>>Openembedded-devel mailing list
> >>>Openembedded-devel@lists.openembedded.org
> >>>http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 

