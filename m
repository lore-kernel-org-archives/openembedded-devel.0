Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PUvps-0002n2-49
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 07:36:36 +0100
Received: by iwn8 with SMTP id 8so4055634iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Dec 2010 22:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=lZD944v07rmDdG5qMUFgFLmEjLFfTSeSv/Xi14ROPIU=;
	b=TGEwNwuSNhDzzuuncJSnX106lAUt1ZRlsY7gmOdF8O+2pnk1cwgpSjhfLPTqrvTmpr
	buf4qOCs/u3Ul/5fPSsRz+XcgNS8GqQpGLX3GNE3pPrFGJIDqS7JH40yQAalVdWlGrIL
	4D4hhvVtp9ZyPVaUyBQhF3TIeyCQzSkE/jVF8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Pp8hKzbkiqrCw5TNSc+GEo/D3NrRS7lGT/CGwFHzmpriDNBGpvWCbKG4MjQ8v+THvD
	20Oo2ge8YIrKNMjnzcdgyzALWkojx8aaH1OYr0YuIGAEbdWtc1CBlzsI+0Oo4DADwqL2
	7I0FQRR7rBPbmVvv4GhZL4nPf6vtmBEhEzu2Y=
Received: by 10.231.16.140 with SMTP id o12mr4889952iba.183.1292913389737;
	Mon, 20 Dec 2010 22:36:29 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id z4sm4242549ibg.7.2010.12.20.22.36.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 20 Dec 2010 22:36:29 -0800 (PST)
Date: Mon, 20 Dec 2010 22:36:38 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101221063638.GA23041@gmail.com>
References: <1292507333-20222-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1292507333-20222-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [RFC] xorg: upgrade to X11R7.6 and remove preferred-xorg-versions*.inc files
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
X-List-Received-Date: Tue, 21 Dec 2010 06:36:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/12/10 14:48), Martin Jansa wrote:
> * X11R7.6-RC1 was already released
>   http://www.x.org/releases/X11R7.6-RC1/doc/xorg-docs/ReleaseNotes.html
>   so it's IMHO time to start migration there
> * preferred-xorg-versions-live.inc was tracking latest stable released
>   tarballs, but only reason I was maintaining it was to overwrite older
>   preferred-xorg-versions-X11R7.5.inc if your distribution included ie
>   X11R7.5.inc and you wanted live.inc from local.conf
> * default recipe versions without any preferred-xorg-versions include
>   are now the same as live.inc
> * we will get better test coverage if we use same versions
> * if someone really needs older release then pinning only core stuff
>   like xserver/libx11 will be probably better, than pinning every xorg
>   app/proto/font etc.
> * I can slow down adding newest xorg stuff or ie keep it everytime for
>   at least a week on ML for another review and test on more targets
>   (I'm testing it only on om-gta02/spitz/nokia900)
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

FWIW my uclibc builds of x11-image built for qemumips, qemuarm, qemux86 and
qemuppc. Seems good to me.

-Khem


