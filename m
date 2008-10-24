Received: from [209.85.198.251] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ricardo.salveti@openbossa.org>) id 1KtDXU-0007NM-6v
	for openembedded-devel@openembedded.org; Fri, 24 Oct 2008 05:40:40 +0200
Received: by rv-out-0708.google.com with SMTP id k29so795539rvb.0
	for <openembedded-devel@openembedded.org>;
	Thu, 23 Oct 2008 20:40:06 -0700 (PDT)
Received: by 10.142.13.13 with SMTP id 13mr753380wfm.127.1224819605949;
	Thu, 23 Oct 2008 20:40:05 -0700 (PDT)
Received: by 10.142.147.6 with HTTP; Thu, 23 Oct 2008 20:40:05 -0700 (PDT)
Message-ID: <ae9c9a1c0810232040k4af9b61sed0522a203291a54@mail.gmail.com>
Date: Fri, 24 Oct 2008 00:40:05 -0300
From: "Ricardo Salveti" <ricardo.salveti@openbossa.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20081023231631.GB21151@denix.org>
MIME-Version: 1.0
References: <bdb0025f0810222159ka9b7ab7q4088bd6a241e477a@mail.gmail.com>
	<20081023231631.GB21151@denix.org>
Cc: openembedded-devel@openembedded.org
Subject: Re: pushing mamona things upstream
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
X-List-Received-Date: Fri, 24 Oct 2008 03:40:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Oct 23, 2008 at 8:16 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Thu, Oct 23, 2008 at 01:59:11AM -0300, Rodrigo Vivi wrote:
>> My plan is to send directly all patches that change mamona packages,
>> tasks and configuration.
>
> Thanks for doing it.
>
>> This shouldn't break anyone's build. (Get prepared for an avalanche of
>> commits :) )
>
> At least in theory. But in reality it got broken:
>
> ERROR: Could not include required file ../gcc/gcc3-build.inc while parsing /OE/openembedded/packages/mamona/gcc-noemu_4.1.2.bb
>
> You forgot the gcc/gcc3-build.inc and BitBake chokes on it while parsing the
> tree.

It seems to be fixed at 3a83d1fb3fd0fdbbf763e5f495ef9046f09e15b9

We still have some issues to fix even at our commits, like we had with
this one. We'll first try to push things that shouldn't be very
related with other distros, mostly to avoid breaking every build.

Probably we'll need some kind of Mamona branch at OE for the patches
that needs review, like ones that touch any bbclass.

At the moment we'll try to track what we need to push in a page at our
Trac, but let's see how it goes.

Thanks for the report.

Cheers,
-- 
Ricardo Salveti de Araujo


