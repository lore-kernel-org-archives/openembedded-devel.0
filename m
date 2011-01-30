Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <neil@gumstix.com>) id 1PjfSi-00083t-Gw
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Jan 2011 23:09:37 +0100
Received: from homiemail-a76.g.dreamhost.com (caiajhbdcbhh.dreamhost.com
	[208.97.132.177])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 756C5179D27
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Jan 2011 14:08:44 -0800 (PST)
Received: from homiemail-a76.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a76.g.dreamhost.com (Postfix) with ESMTP id 4E28E45807B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Jan 2011 14:08:40 -0800 (PST)
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gumstix.com; h=message-id:date
	:from:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding; q=dns; s=gumstix.com;
	b=CyKvIA9VxZAC++HMQSxbRQn26jpgGpy1x8bxLkkGnIBwn8M27d7b1g9/X/YDo
	5SIyzy0d0UFw4ePxHxNSrAxtgCAnKAWyYUvTCVvpHWG1d8s81dHd7DC+BmJjHkKl
	NGATyX9768mbM6GWRXNsskn9ob4OeikB3Uade01aFVtG48=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=gumstix.com; h=message-id
	:date:from:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding; s=gumstix.com; bh=ifLFT
	htD8z/0ue5d3qsx7ZnOM7Y=; b=XWBuYsAjQr8FID+wHOEnlhMQKSjy3x8kceCnE
	r/fwvzIRr9wnmlDUIesP3BvOFFyQTdcXrLad/EPwItl+dFhU1MsHGgJj0tjQigVp
	gnw85dZXE/UtrqOIy576nrJmzvX5ww+ZwOJZfYBSZcmAwUlodilKrsTFTOcEnaJJ
	ye6pSE=
Received: from [10.0.1.35] (s64-180-61-141.bc.hsia.telus.net [64.180.61.141])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: neil@gumstix.com)
	by homiemail-a76.g.dreamhost.com (Postfix) with ESMTPSA id 32A4F458074
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Jan 2011 14:08:40 -0800 (PST)
Message-ID: <4D45E172.4030105@gumstix.com>
Date: Sun, 30 Jan 2011 14:08:50 -0800
From: Neil MacMunn <neil@gumstix.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D347C60.6000805@gumstix.com> <20110117185830.GL21179@jama>
In-Reply-To: <20110117185830.GL21179@jama>
Subject: Re: EFL_SRCREV bump breaks GPE/enlightenment
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
X-List-Received-Date: Sun, 30 Jan 2011 22:09:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

>
> does it segfault or something? I haven't seen it with illume2 profiles,
> but I'm not using gpe-dm..

I don't see any messages about what's happening but I seem to remember 
something about a missing function in a .so. There was another EFL_SRCRV 
change recently so I undid my revisions and accepted all of the upstream 
changes. Unfortunately still no luck.


> Would be great if you can provide info and debug it with e devs
> (#edevelop on freenode), if you bisect which efl commit caused it, they will
> be able to fix it sooner.
>
> Regards,
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



