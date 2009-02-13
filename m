Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1LXlX9-0005BL-2m
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 01:03:55 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id 278C44025B;
	Thu, 12 Feb 2009 20:02:51 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 7B7EB740D9;
	Thu, 12 Feb 2009 22:02:44 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id F35FF6101F6; Thu, 12 Feb 2009 22:02:31 -0200 (BRST)
From: Otavio Salvador <otavio@debian.org>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <1234456715-23618-1-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-2-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-3-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-4-git-send-email-otavio@ossystems.com.br>
	<1234460865.3592.2.camel@mill.internal.reciva.com>
	<49946CA4.6060303@dls.net>
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Thu, 12 Feb 2009 22:02:31 -0200
In-Reply-To: <49946CA4.6060303@dls.net> (Mike's message of "Thu, 12 Feb 2009
	12:38:28 -0600")
Message-ID: <8763jfmcfc.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.90 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH 3/6] package.bbclass, package_ipk.bbclass: add	dynamic depends on locale packages (ipk	specific)
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
X-List-Received-Date: Fri, 13 Feb 2009 00:03:55 -0000
Content-Type: text/plain; charset=us-ascii

"Mike (mwester)" <mwester@dls.net> writes:

>> This looks like it will add locale dependencies to all the subpackages
>> (e.g. foo-doc, foo-dev and the like) as well as the main "foo" package,
>> which is a bit different to how the old code used to work.  But I guess
>> that's harmless enough: the worst effect will be to bloat the Packages
>> file a bit, and I doubt anybody will care too much.  So, thumbs up from
>> me.
>
> How much bloat?  Opkg already trips the OOM killer on the NSLU2 (32MB of
> RAM) when it loads the current Packages file and then tries to do
> something; we can work around it for now, but if this doubles the size
> in-memory, we may simply not have enough RAM to do whatever it is that
> opkg does with all that in-memory.
>
> I have grave concerns over anything that adds unnecessary entries that
> cannot be turned off.

Personally I don't think any bloat needs to be pushed and with that in
mind I think we could then rework it to be enabled by default but
disabled using a variable.

What people think? I'd also be interested in a BitBake expert comment
about it all.

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


