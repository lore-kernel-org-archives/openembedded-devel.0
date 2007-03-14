Received: from [64.233.182.187] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <hvontres@gmail.com>) id 1HRbkP-0002FD-9c
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Mar 2007 23:15:05 +0100
Received: by nf-out-0910.google.com with SMTP id l24so405280nfc
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Mar 2007 15:15:03 -0700 (PDT)
Received: by 10.78.180.16 with SMTP id c16mr192633huf.1173910486849;
	Wed, 14 Mar 2007 15:14:46 -0700 (PDT)
Received: by 10.78.17.3 with HTTP; Wed, 14 Mar 2007 15:14:46 -0700 (PDT)
Message-ID: <a7f8874a0703141514n6e42cc7fyb3cfcda0e50caefd@mail.gmail.com>
Date: Wed, 14 Mar 2007 15:14:46 -0700
From: "Hans Henry von Tresckow" <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <08fa01c75d4e$71e4a2b0$6e01a8c0@twilight>
MIME-Version: 1.0
References: <f34f85580702070514u42b2b887qf416466c5b7bf83d@mail.gmail.com>
	<08fa01c75d4e$71e4a2b0$6e01a8c0@twilight>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: tzdata.bb
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
X-List-Received-Date: Wed, 14 Mar 2007 22:15:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Is there any reason why /usr/share/zoneinfo/iso3166.tab
/usr/share/zoneinfo/zone.tab are not being packaged? Just wondering.

On 3/2/07, Mike (mwester) <mwester@dls.net> wrote:
>
> tzdata (and tzcode-native) are committed.
>
> The tzdata recipe is Todd's original, I incorporated the feedback from the
> list (and added any bugs).  The tzcode-native recipe provides the native
> timezone utilities, including zic.
>
> Regards,
> Mike (mwester)
>
> ----- Original Message -----
> From: "Todd Blumer" <sdgvulpes@gmail.com>
> To: <openembedded-devel@lists.openembedded.org>
> Cc: "Rene Wagner" <rw@handhelds.org>
> Sent: Wednesday, February 07, 2007 7:14 AM
> Subject: [oe] tzdata.bb
>
>
> > Because of the impending changes to daylight savings time (DST) here
> > in the US, I was motivated to work on creating a new timezone package.
> > In the base package I tried to put a city in every timezone around the
> > world. This package replaces the 'timezone' package used by Opie, so
> > some other packages will need to be changed to depend on tzdata
> > instead of timezone. (I used 'tzdata' since that is the Debian name
> > and in case some developers were not ready to switch over to tzdata.)
> >
> > Someone with write access to oe (something I should probably get
> > eventually :-) can commit this to dev if you feel it is appropriate to
> > do so. I have tested the US Eastern time.
> >
> > I'm sure more work could be done here. Feedback is welcome.
> > --
> > Todd Blumer
> > SDG Systems
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

