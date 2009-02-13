Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1LXlYw-0005DO-Js
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 01:05:47 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id AB3FE4025B;
	Thu, 12 Feb 2009 20:04:42 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 1974C740D9;
	Thu, 12 Feb 2009 22:04:36 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id B9D886101F6; Thu, 12 Feb 2009 22:04:23 -0200 (BRST)
From: Otavio Salvador <otavio@debian.org>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <1234456715-23618-1-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-2-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-3-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-4-git-send-email-otavio@ossystems.com.br>
	<1234460865.3592.2.camel@mill.internal.reciva.com>
	<49946CA4.6060303@dls.net>
	<1234478544.4890.404.camel@lenovo.internal.reciva.com>
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Thu, 12 Feb 2009 22:04:23 -0200
In-Reply-To: <1234478544.4890.404.camel@lenovo.internal.reciva.com> (Phil
	Blundell's message of "Thu, 12 Feb 2009 22:42:24 +0000")
Message-ID: <871vu3mcc8.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.90 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH 3/6] package.bbclass, package_ipk.bbclass:	add	dynamic depends on locale packages (ipk	specific)
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
X-List-Received-Date: Fri, 13 Feb 2009 00:05:47 -0000
Content-Type: text/plain; charset=us-ascii

Phil Blundell <pb@reciva.com> writes:

> On Thu, 2009-02-12 at 12:38 -0600, Mike (mwester) wrote:
>> Phil Blundell wrote:
>> > This looks like it will add locale dependencies to all the subpackages
>> > (e.g. foo-doc, foo-dev and the like) as well as the main "foo" package,
>> > which is a bit different to how the old code used to work.  But I guess
>> > that's harmless enough: the worst effect will be to bloat the Packages
>> > file a bit, and I doubt anybody will care too much.  So, thumbs up from
>> > me.
>> 
>> How much bloat? 
>
> For a source package "foo", you'd be talking about adding one copy of
> the literal string "foo-locale-*" to the Depends line for each of its
> subpackages (foo-doc, foo-dev, foo-dbg and the like).  The exact amount
> obviously depends on the length of the package name, but I guess you
> could call it about 16 bytes per binary package as a rough
> approximation.
>
> Exactly what the real-world impact of that would be will depend on your
> distro policy.  If you already strip out the -dev and -doc packages from
> the main Packages feed then obviously the impact will be virtually nil
> because most of the affected packages won't be there in the first place.
> At the other extreme, if your Packages files currently contain
> everything from the control data (including Source:, Description: and so
> on) then they are probably so huge already that another sixteen bytes
> per package is negligible in percentage terms.
>
> If those 16*n bytes did turn out to cause a problem for someone then it
> probably wouldn't be that hard to reinstate the original behaviour of
> only adding this dependency on the primary binary.

Now I have two good points and I'm uncertain where to go :-)

Push it and sort the regressions out depending how hard is it or make it
optional?

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


