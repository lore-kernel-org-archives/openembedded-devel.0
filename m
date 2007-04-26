Received: from [64.233.162.225] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <papercrane@gmail.com>) id 1Hh7oT-0008LN-Vt
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Apr 2007 19:31:29 +0200
Received: by nz-out-0506.google.com with SMTP id m22so755874nzf
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2007 10:22:35 -0700 (PDT)
Received: by 10.114.150.1 with SMTP id x1mr705286wad.1177608154434;
	Thu, 26 Apr 2007 10:22:34 -0700 (PDT)
Received: by 10.115.92.7 with HTTP; Thu, 26 Apr 2007 10:22:34 -0700 (PDT)
Message-ID: <432beae0704261022u16ba644dqb4781ac046a0a215@mail.gmail.com>
Date: Thu, 26 Apr 2007 10:22:34 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: "Using the OpenEmbedded metadata to build Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <c384c5ea0704261001x7756fd58yc637a6b1aec12440@mail.gmail.com>
MIME-Version: 1.0
References: <c384c5ea0704261001x7756fd58yc637a6b1aec12440@mail.gmail.com>
Subject: Re: HEADS UP: insane.bbclass will now detect and stop the build on wrong RPATHs.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Apr 2007 17:31:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 4/26/07, Leon Woestenberg <leon.woestenberg@gmail.com> wrote:
> Hello all,
>
> for those of you using insane.bbclass, it will now correctly detect
> wrong RPATH's in shared libraries and fail on them.
>
> Unfortunately, as we have not fixed wrong RPATH's yet in our shared
> library handling, this will cause builds using insane.bbclass to fail.
>
> See bug #2140.
>
> I hope to be able to fix the .so RPATH stuff as well, but any help is welcomed.
>

So what you're saying is that angstrom won't build until the RPATH
problems are fixed? Kind of sucks for those users who don't know how
to fix the problem. I'd suggest that this be made a warning instead of
a failure (or have a conf entry that makes it one or the other).

-- 
Justin Patrin


