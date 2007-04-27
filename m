Received: from [64.233.184.236] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mattjreimer@gmail.com>) id 1HhFAy-0001jy-39
	for openembedded-devel@openembedded.org; Fri, 27 Apr 2007 03:23:08 +0200
Received: by wr-out-0506.google.com with SMTP id i31so842366wra
	for <openembedded-devel@openembedded.org>;
	Thu, 26 Apr 2007 18:14:15 -0700 (PDT)
Received: by 10.78.192.20 with SMTP id p20mr653914huf.1177636454951;
	Thu, 26 Apr 2007 18:14:14 -0700 (PDT)
Received: by 10.78.184.1 with HTTP; Thu, 26 Apr 2007 18:14:14 -0700 (PDT)
Message-ID: <f383264b0704261814x6e1f951em30e8957f42635a36@mail.gmail.com>
Date: Thu, 26 Apr 2007 18:14:14 -0700
From: "Matt Reimer" <mattjreimer@gmail.com>
To: "Using the OpenEmbedded metadata to build Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <c384c5ea0704261001x7756fd58yc637a6b1aec12440@mail.gmail.com>
MIME-Version: 1.0
References: <c384c5ea0704261001x7756fd58yc637a6b1aec12440@mail.gmail.com>
Cc: openembedded-devel@openembedded.org
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
X-List-Received-Date: Fri, 27 Apr 2007 01:23:08 -0000
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

IIRC, pb looked into this at one time and found that the problem was
with certain packages .pc files. So a good place to start is the check
the .pc files for those libraries that are referenced by these bogus
RPATHs.

Matt


