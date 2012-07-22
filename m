Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1St1Y0-0006rN-Ka
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Jul 2012 21:10:32 +0200
Received: by wibhq4 with SMTP id hq4so1913866wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Jul 2012 11:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Bp0gHk9jfXu9KIopFlRalz3+zs70WFXjTgQFwYIS6Sc=;
	b=XUsMIBqENyGcONicmqKDTQN1b2oLIA4/9iQB4Q6GQh6gbuEZK4gN9gMwf059abPbDO
	32LHSmqAr1JuAotJILvkePWHDYEGNQ14GqYLn3kemJ2tOr9+k++Cwg0z1G+NFqY5FRtH
	vMsgXSOuKx0MifoipXFu+NFtlftb82bGyoH0hEh4J7fgZ4ULMw4X1f6rPQUw045YRa+f
	5DFUi9Mur0ivOmHB2vcsAY1EBv2nwAN6PHoW0NOxB4TvBIqLl8B50OfFk6DPq3tSNzZt
	stFaeyOqPB9GmRUmB5SUoTMcjI7jB/99vn8S0zxHtxevvVR9ANbTScoFEd4vsZP9tKoW
	j/4Q==
Received: by 10.216.61.83 with SMTP id v61mr5660354wec.31.1342983546560; Sun,
	22 Jul 2012 11:59:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.18.98 with HTTP; Sun, 22 Jul 2012 11:58:36 -0700 (PDT)
In-Reply-To: <juhedn$q1a$1@dough.gmane.org>
References: <1342899684-4450-1-git-send-email-raj.khem@gmail.com>
	<jug959$3gr$1@dough.gmane.org>
	<CAMKF1soBGKfELcPqLALt2SeZzvp6keA2DwpumoCQinPqo1j=PQ@mail.gmail.com>
	<juhedn$q1a$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 22 Jul 2012 11:58:36 -0700
Message-ID: <CAMKF1sp0iVEFrOLFA6tFSjYYvcq61gO3zYcyJTkCPWwBVGe16Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-systemd][PATCH] systemd_git.bb: Dont inherit vala and gitpkgv
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
X-List-Received-Date: Sun, 22 Jul 2012 19:10:32 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jul 22, 2012 at 10:48 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Right now we automatically get the proper version, removing gitpkgv would be
> a regression. Why not symlink the class into meta-systemd?

symlink would work since both layers are in same repo but logically it
may not be right thing
secondly if one day we would want to make systemd as default init
system in OE-Core then
either gitpkgv has to go into OE-Core or it be dropped. I think with
advent of autopr these all
may become less important in time anyway.


