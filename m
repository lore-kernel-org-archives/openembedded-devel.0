Received: from [209.85.218.221] (helo=mail-bw0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicola.mfb@gmail.com>) id 1MYF0M-00078s-HH
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Aug 2009 10:04:18 +0200
Received: by bwz21 with SMTP id 21so2807737bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Aug 2009 00:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=FUGJIIH0iIfPFcV6VBxNlZ6nmZL6r+JEz05dVIdXjV0=;
	b=MwhafOuAkWihhE82Z+2OGtXhrMOUpT8iKE5+4+GcIni2pvi7IDbwwWMnyGl0Gt6qZ3
	yYCStjVnp0jx7YVctIJKKD4IbN33PBCpYs4gWnGIM2NACSTKPItsXeYJ52JeALSIpsP3
	0hjwre0jlfeYcTqdixzS4cTLgUYSUMgUvf32s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=PuDzvhv3o2ZIfyq48gIaE4SZEmEp7socpkMGyx7vjtx+W9WEaZMV0iptFIf5o/i1V9
	2r7+dBtDcMfXagCseiggY8yTdRfJfbl0Gs9gUE9DwW9grubg+xhHHWqMlQkU+WI8cx3x
	DtRXhfB49An3wq739lU5Az1Lm+ykre4rdGc/s=
MIME-Version: 1.0
Received: by 10.103.95.1 with SMTP id x1mr1911642mul.20.1249372124959; Tue, 04 
	Aug 2009 00:48:44 -0700 (PDT)
In-Reply-To: <200908021304.43335.mok@mnet-online.de>
References: <200908021211.14793.mok@mnet-online.de> <4A756F8F.30405@gmx.de>
	<200908021304.43335.mok@mnet-online.de>
Date: Tue, 4 Aug 2009 09:48:44 +0200
Message-ID: <359c5480908040048t54ac4adbsa6a4e4fa88b7557f@mail.gmail.com>
From: Nicola Mfb <nicola.mfb@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: shr-user@lists.shr-project.org
Subject: Re: some RRECOMMENDed packages do not get included into the image
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
X-List-Received-Date: Tue, 04 Aug 2009 08:04:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Sun, Aug 2, 2009 at 1:04 PM, Klaus 'mrmoku'
Kurzmann<mok@mnet-online.de> wrote:
> Am Sonntag 02 August 2009 12:50:55 schrieb Stefan Buschmann:
>> I'm experiencing problems with current SHR images as well. In my case,
>> everything gets built and the image is created successfully, but when I
>> boot into the system on my device, I get a few error messages like "no
>> sound device" for alsa, "no network card" etc., and the X server fails
>> to start. However the fso-daemons etc. seem to be working, or at least
>> starting, correctly.
> yeah, thats exactly what happens to me too.
>
> I just gave the 1.8-parser-rework a shot and it looks like it builds correct
> images with all needed stuff included. Did not boot it yet, but I checked that
> the missing packages are included.
>
> Is 1.8-parser-rework prime time ready?

Some news about that?
I just reverted bb thread numbers to 1, now kernel is installed and
rcS too, so I'm experiencing the same of you, no X startup, etc.. I
tryed 1.8, 1.8-parser-rework and old bitbake from svn, same result.

Regards

    Nicola


