Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RvCZp-00065H-UW
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 19:49:09 +0100
Received: by eaal10 with SMTP id l10so229965eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 10:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=GJbvDDZkUDWVwUGPfDOK3F5rlqr5KB6PYnoMkL/VomM=;
	b=pYTnbttY+TUl9GaRI7avF2PrgbwFJemL273fEnJTTbEsa7Zw0BBz/09pF/59MRzCkf
	P9aT4eC0QYde0BB6F6qT1/2HiKKUj3tW96+1zePFqzjg7zdXbhAhj+SRgaOqfL++jPO5
	eLIQqmNzButY+06yvGDDH/xmnnJ3MuiZv1ygE=
MIME-Version: 1.0
Received: by 10.14.206.133 with SMTP id l5mr8786282eeo.22.1328726464379; Wed,
	08 Feb 2012 10:41:04 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Wed, 8 Feb 2012 10:41:04 -0800 (PST)
In-Reply-To: <4F2A97B7.2080709@opendreambox.org>
References: <4F2A97B7.2080709@opendreambox.org>
Date: Wed, 8 Feb 2012 16:41:04 -0200
X-Google-Sender-Auth: P18HFAOm76MyQwhbUSXy5GuUv9Y
Message-ID: <CAP9ODKqah-6Y6hp-beD0hUi=-r6VXJ02QD=puXFFYW2Hq8FACw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH] giflib: don't depend on libsm if x11 is unavailable
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
X-List-Received-Date: Wed, 08 Feb 2012 18:49:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 2, 2012 at 12:03, Andreas Oberritter <obi@opendreambox.org>wrote:

> There's no need to alter configure flags, because without x11,
> libsm cannot be picked up accidentially. Because this just fixes
> a missing dependency failure without x11, no PR bump is required
> either.
>

I do prefer a clear configure option depending on if it is going to use or
not libsm otherwise if user has built it, it is going to be taken. Also,
please PR bump in any case since it can help spot other possible failures
that we'd not catch otherwise.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

