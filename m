Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1RT0aS-00048P-DG
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Nov 2011 01:21:17 +0100
Received: by ggnh4 with SMTP id h4so873282ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2011 16:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=/PoTWH7k0Bt8VM2fcD04R0TAk1jmaSO4pVwyQ1jPdfQ=;
	b=seMwY7sTYTOgAVkwUyWz4MeZNsYTpuTpVtmZ7adF7JgPa5pShLf5+UGQ0vDK7UXF1o
	9OLW9zEG+Oj80FHi4WkFGhsNdjRw/Hq3k9mPNpbnn6iwhRRJ+yPE1PuwbG45U3FctWAc
	6R5S06Sz9WPVZLyX94jhufSq7afMd7GrqD+50=
MIME-Version: 1.0
Received: by 10.236.131.97 with SMTP id l61mr32527368yhi.51.1322007284468;
	Tue, 22 Nov 2011 16:14:44 -0800 (PST)
Received: by 10.236.67.33 with HTTP; Tue, 22 Nov 2011 16:14:44 -0800 (PST)
In-Reply-To: <CALJpqJxdR20T1zAYrx0B4Q+87jJ83ArwjLZMqLus+DF+dHbFiw@mail.gmail.com>
References: <CALJpqJxdR20T1zAYrx0B4Q+87jJ83ArwjLZMqLus+DF+dHbFiw@mail.gmail.com>
Date: Tue, 22 Nov 2011 19:14:44 -0500
Message-ID: <CAOd_LFxFVe=VhBte54C3Bc=r5odWNuWFLzTo9uaB9nuPyYxfyw@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Insanity
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
X-List-Received-Date: Wed, 23 Nov 2011 00:21:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 2, 2011 at 8:53 AM, David Thomas
<david.thomas@microbee-systems.com> wrote:
> I am new to OE and trying to get this tool chain working has about
> finished me off. After struggling with distro issues for 2 weeks I
> installed Ubuntu 10... and now
> the tools at least seem to work. I am using a OMAP board from
> Compulabs and the stable kernel they offer on their website. This is
> for a hi-rel application.
>
> However after gating all this way I am now stopped at
> HANDHELDS_CVS=cvs://anoncvs:anoncvs@cvs.handhelds.org/cvs as it
> appears this is no longer available?
>
> update.rc seems to be the hangup. Does it really need to be this
> difficult? I am at the point of tossing in the towel and moving in to
> some other platform. There are no mirrors?
> This is a nightmare and as usual, no solutions seem to be available.

Are you using oe-core, or oe-classic?  I've been putting together a
simple oe-core build template for several projects, and here is what I
have so far:

http://cgit.bec-systems.com/cgit.cgi/oe-build-core/
http://cgit.bec-systems.com/cgit.cgi/oe-build-core/tree/README

This should build systemd-console-image without any problems, etc.
Let me know if it does not work.

Thanks,
Cliff

-- 
=================
http://bec-systems.com


