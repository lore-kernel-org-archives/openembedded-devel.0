Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PuE6F-0006nw-VI
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 02:10:04 +0100
Received: by pzk12 with SMTP id 12so695208pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 17:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=BFBHJlo0Q105rukAB8ltNb2eIN1V3LlSTteYp8IPnOY=;
	b=lJ92FT0diHKWdNVZpAtIf3DACkRZzL2PoYihcRMAfA3MyHp6BjcTeow2xDhNSgUfv+
	CO0KbfDA9gF6y2RlZY98qb7zxcY+ztD7pdAJLk2ih9cpf4igy9Sn4bKT1kD2HKIs4qvX
	7xjICarrLCz9Ks4u1+fBdL2X2qWWHyoblNFC4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=YYsYSuSZcVhLB05Q6yXXqTggl3ZltkXhornOIl5F98V9/rWhsNphGFxHAbWP2kB23X
	mtaHE6aifi03YYmEPD9NsnbfvlXeSJmBh7XKRp18zrHnkG/1ExrjENZ//iiOHuFJ3zzj
	fOlnziPuAYNn0mu4ErOlpQvB2VLnqGvoa2JJY=
Received: by 10.142.188.8 with SMTP id l8mr4873979wff.272.1298941717142;
	Mon, 28 Feb 2011 17:08:37 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w19sm6717711wfd.20.2011.02.28.17.08.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Feb 2011 17:08:35 -0800 (PST)
Date: Mon, 28 Feb 2011 17:09:25 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110301010925.GA30622@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <4D51B81D.8000800@mentor.com>
	<AANLkTikbfyoZfnJq9k1fSkMVMkReNw0G8APuXjc_rTyY@mail.gmail.com>
	<iium4d$gau$1@dough.gmane.org> <20110209193129.GA15397@nirvana>
	<4D52EEE5.9030309@mentor.com>
	<AANLkTin0nJfcj1wFiYcbXLyLa9tk_Dy8yn8Lp3=PGNHC@mail.gmail.com>
	<4D53272F.1020400@mentor.com> <1298454891.3892.3.camel@mattotaupa>
	<20110224053346.GA15439@nirvana> <ik541d$nb4$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ik541d$nb4$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] evas: disable cpu neon support for palmpre machine
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
X-List-Received-Date: Tue, 01 Mar 2011 01:10:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/02/11 09:14), Koen Kooi wrote:
> > I already saw Koen's commit but nevertheless someone should try to find out 
> > why Neon makes such troubles on our arm targets. 
> 
> In my case, the ASM is written with gcc 4.5 and binutils 2.20 in mind,
> so the constraints are a bit different, resulting in misrendered buttons.
> I can't say what your problem with the palm is, probably a buggy kernel.
> 

hmm I can have a look at the code if you like.

-- 
-Khem


