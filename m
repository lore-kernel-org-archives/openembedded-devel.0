Received: from [64.233.170.190] (helo=rn-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1L5OvH-0005zA-DZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Nov 2008 19:15:35 +0100
Received: by rn-out-0910.google.com with SMTP id j66so625454rne.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Nov 2008 10:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=bie4gBr9EXv/Rdfw1nLIRN1cBvEfeWq9WMDOZhICxz8=;
	b=kVHXayrVcBfY/ckHY7zSXniZZplPSdZgZnOlnnXtNwIbj+t0THV8jO38qxY2syx9i7
	NmdVr/Ny6h07h+92NQHeiT2wYUY7PsT7u1S2s788spGkX9Qeuit5nKYTz3e11AxIg5kV
	cgTVEog2KNN9xlpxKET+teRIRUdEcJFzA2Zxc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=plJGO03Jtjnm4yjdlM6lilPlGi88XzBL5d2Pw/oSuUIfIaqJ5FBrLvUfNs4k5egtUt
	JGzbJw0eF19BkMFxMoP4TRgcCmsX6jEEsYj+8J21i6ISVZxkhYeWBJiBGCYKRnjTv9zd
	vDdGZUKYPcWXWniPYdzE3FTEgmIGh6V5j6yio=
Received: by 10.151.51.18 with SMTP id d18mr11631819ybk.236.1227723155015;
	Wed, 26 Nov 2008 10:12:35 -0800 (PST)
Received: by 10.151.102.13 with HTTP; Wed, 26 Nov 2008 10:12:34 -0800 (PST)
Message-ID: <48239d390811261012w26eb9a9fva6c7eacf4aff0a50@mail.gmail.com>
Date: Wed, 26 Nov 2008 21:12:34 +0300
From: "Sergey Lapin" <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ggk26f$30a$1@ger.gmane.org>
MIME-Version: 1.0
References: <ggjnpc$qhg$1@ger.gmane.org>
	<200811261755.53197.mickey@vanille-media.de>
	<1227721214.19934.33.camel@mill.internal.reciva.com>
	<ggk26f$30a$1@ger.gmane.org>
Cc: openembedded-devel@openembedded.org
Subject: Re: preferred-provider at the image level a.k.a why is all this fso stuff in my non-fso image
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
X-List-Received-Date: Wed, 26 Nov 2008 18:15:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I just need to mention we have same kind of problems with mplayer vs
mplayer-maemo recipe,
when you try to put e.g. mencoder into IMAGE_INSTALL, mplayer-maemo
recipe is used instead of mplayer one.
Also, which is weird, I was able to reproduce this lots of times on
one my setup even with build from scratch,
and was unable to do so with my another setup.

All the best,
S.


