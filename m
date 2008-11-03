Received: from [66.7.219.172] (helo=hostdime.freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1Kx3jI-0002lc-72
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Nov 2008 19:00:44 +0100
Received: from hostdime.freedom.ind.br (localhost [127.0.0.1])
	by hostdime.freedom.ind.br (Postfix) with ESMTP id 525C1337405;
	Mon,  3 Nov 2008 15:59:21 -0200 (BRST)
Received: from mail.freedom.ind.br (localhost [127.0.0.1])
	by hostdime.freedom.ind.br (Postfix) with ESMTP id C75FE337401;
	Mon,  3 Nov 2008 15:59:19 -0200 (BRST)
Received: from mail.freedom.ind.br ([201.35.65.91] helo=mail.freedom.ind.br)
	by mail.freedom.ind.br; 3 Nov 2008 15:59:18 -0200
Received: from mail.freedom.ind.br (localhost [127.0.0.1])
	by mail.freedom.ind.br (Postfix) with ESMTP id C988D8E36E7;
	Mon,  3 Nov 2008 15:59:20 -0200 (BRST)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by mail.freedom.ind.br (Postfix) with ESMTP id 836658E3668;
	Mon,  3 Nov 2008 15:59:20 -0200 (BRST)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 3 Nov 2008 15:59:20 -0200
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 88097C1F9;
	Mon,  3 Nov 2008 15:59:18 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 2AA3261006E; Mon,  3 Nov 2008 15:55:51 -0200 (BRST)
To: openembedded-devel@lists.openembedded.org
References: <490BF303.1030701@dls.net> <490E5FAA.9070206@dls.net>
	<200811031347.08952.zecke@selfish.org>
	<87ljw1ey5l.fsf@neumann.lab.ossystems.com.br>
	<490F0E99.6030401@dls.net>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Mon, 03 Nov 2008 15:55:51 -0200
In-Reply-To: <490F0E99.6030401@dls.net> (Mike's message of "Mon\,
	03 Nov 2008 08\:45\:45 -0600")
Message-ID: <87skq8ae3c.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] Re: DISTRO_PR, ipkg dependencies, and meta toolchains...
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
X-List-Received-Date: Mon, 03 Nov 2008 18:00:44 -0000
Content-Type: text/plain; charset=us-ascii

"Mike (mwester)" <mwester@dls.net> writes:

> Otavio Salvador wrote:
>> Holger Freyther <zecke@selfish.org> writes:
>> 
>>> On Monday 03 November 2008 03:19:22 Mike (mwester) wrote:
>>>> Mike (mwester) wrote:
>>>>
>>>> (Replying to my own email, and what's worse -- I'm top-posting!)
>>>> (And I changed the subject line to add [RFC] to get your attention.)
>>>>
>>>> I found the problem.  Here's a fix:
>>> eek, otavios and richard went over it. could you please comment?
>> 
>> It is fixed in current GIT and works fine for me since then... 
>
> I'm not sure what you are saying here -- I'm using the GIT tip, and the
> patches I posted are required.  It's really quite easy to see -- just do
> "ar x something-dev.ipk", extract the control file, and look at the
> dependency -- without the patch I posted, the dependency on package
> "something" is written with an explicit version number that does not
> exist, because it does not have the DISTRO_PR on it.

Please test today's tip since I've applied a missing piece of fix. I
guess it will work for you.

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


