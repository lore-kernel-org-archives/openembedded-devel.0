Received: from mail-fx0-f226.google.com ([209.85.220.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NgI4h-00006J-73
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Feb 2010 14:30:22 +0100
Received: by fxm26 with SMTP id 26so3389663fxm.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2010 05:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=M/TF/PELZXH7n7MXEZYOHQC3/BI8z6lGYiGDTPI6Efw=;
	b=I9uEiqI9pMG8CCtCQngMlakloL/iTd4wpc/6QOCQOJyuXPImDwvXuT3LNgRH8VRO/q
	OvfaDhN/Ys9+hmfgqhb+vIjabOILDkY1KL7CgTxIZN409KeQSM0KRbdpA05qXl6BvkUd
	L9ukmhv/JXxy+hzoF2Jrv4vJQ7r+vFQeUK/kI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=krp+ZgOn27ejRBDnRNlGuCLZlEIJzew6vhyS13pJpRLvnOPvobEr13HSDX+wKU4iB+
	2pI/vxxzgW03CJz9LkzlVE4QlVFFnwXvcsZGhm4fjO6qZNhGwwBzaZL/AT8+EUVdFKV2
	GskryrlPjrsb+Qwi96ir4goH7+vdootr0CCfI=
Received: by 10.87.70.29 with SMTP id x29mr4861886fgk.61.1266067661344;
	Sat, 13 Feb 2010 05:27:41 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm2207143fxm.12.2010.02.13.05.27.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 13 Feb 2010 05:27:40 -0800 (PST)
Date: Sat, 13 Feb 2010 14:26:56 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100213132656.GE5364@jama>
References: <22B019BE-6BD8-4748-A263-54A1CB919CA4@vanille-media.de>
	<1265903466-22758-1-git-send-email-sledz@dresearch.de>
	<1265903466-22758-2-git-send-email-sledz@dresearch.de>
	<20100211160724.GB5364@jama> <4B756FA7.2080800@dresearch.de>
MIME-Version: 1.0
In-Reply-To: <4B756FA7.2080800@dresearch.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.226
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 2/2] vala-dbus-binding-tool: relocate native recipe from freesmartphone subdir
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
X-List-Received-Date: Sat, 13 Feb 2010 13:30:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 12, 2010 at 04:11:35PM +0100, Steffen Sledz wrote:
> Martin Jansa wrote:
> >>  .../vala-dbus-binding-tool-native_git.bb           |   10 ----------
> >>  .../vala-dbus-binding-tool-native_git.bb           |   10 ++++++++++
> >>  2 files changed, 10 insertions(+), 10 deletions(-)
> >>  delete mode 100644 recipes/freesmartphone/vala-dbus-binding-tool-native_git.bb
> >>  create mode 100644 recipes/vala-dbus-binding-tool/vala-dbus-binding-tool-native_git.bb
> > 
> > Why not use that non-native package or at least that new .inc file or
> > ideally BBCLASSEXTENDS?
> 
> Hmmm? I'm not really familiar with BBCLASSEXTENDS.

grep recipes for examples, but in short
if you add BBCLASSEXTENDS="native" in
vala-dbus-binding-tool_git.bb
it will be like having vala-dbus-binding-tool-native_git.bb with 
include for non-native and inherit native (and will save few seconds for
parsing second file I guess)

> I believe sharing recipe stuff between non-native and native
> packages i could realize like in recipes/vala/. But i've
> no idea how to bring the numbered version we need (0.1.3)
> together with the git version the freesmartphone guys use.

If you insist on having versioned recipe (good), then please add both
0.1.3 and git recipe with BBCLASSEXTENDS.

You can share all metadata except SRC_URI and S, between versioned and git.
Or even better, put generic SRC_URI (with ${PV} and name=archive) and then 
overwrite that only in git recipe. This way new version is created by just 
cp pn_pv.bb pn_pvNew.bb and update checksums in pn_pvNew.bb.

> Anyone an example for this?

yes in recipes/* :)

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


