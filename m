Received: from [66.249.92.174] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <leon.woestenberg@gmail.com>) id 1HbZZZ-0001JL-T8
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2007 11:57:05 +0200
Received: by ug-out-1314.google.com with SMTP id e2so72873ugf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2007 02:57:05 -0700 (PDT)
Received: by 10.66.252.18 with SMTP id z18mr332321ugh.1176285425123;
	Wed, 11 Apr 2007 02:57:05 -0700 (PDT)
Received: by 10.66.251.2 with HTTP; Wed, 11 Apr 2007 02:57:05 -0700 (PDT)
Message-ID: <c384c5ea0704110257r480191b6h8469d77471fe59@mail.gmail.com>
Date: Wed, 11 Apr 2007 11:57:05 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <461CAD47.7050307@openhardware.net>
MIME-Version: 1.0
References: <4611582F.8010203@openhardware.net>
	<f96d234e0704050628p3f72ec6exe9ef8ea5c732d80b@mail.gmail.com>
	<c384c5ea0704081010y623cdbafq4f9dce1148a593e5@mail.gmail.com>
	<461972D6.1060901@openhardware.net>
	<461A6F08.3020904@openhardware.net>
	<f96d234e0704091138j7118f436j4f4a3cc3edee4446@mail.gmail.com>
	<461AE55E.6020301@openhardware.net> <461AE6FA.8010009@balister.org>
	<461CAD47.7050307@openhardware.net>
Subject: Re: versioning madness
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Apr 2007 09:57:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Tom,

On 4/11/07, Tom Walsh <tom@openhardware.net> wrote:
> Philip Balister wrote:
> > Tom,
> >
> > Have you looked at bb collections?
> >
> > http://bitbake.berlios.de/manual/ch04s02.html#id870544
> >
> > I think they will do what you want. You can keep separate data and
> > chose which data takes priority in case of duplicate packages.
> >
>
> AH! Thank you!  That is exactly what I need.
>
Yep, bitbake collections to the rescue.

Note that you should carefully make sure you have no "Multiple
providers" and "Consider specifying PREFERRED_PROVIDER" messages left,
as they seem to work undeterministic in that case when using bitbake
collections.

If you specify a PREFERRED_PROVIDER for each such package, it works brilliantly.

Regards,

Leon



-- 
Leon


