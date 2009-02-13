Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1LXva5-0005iL-Iu
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 11:47:37 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id 90DF94020B;
	Fri, 13 Feb 2009 06:46:30 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id C99DC740C3;
	Fri, 13 Feb 2009 08:46:27 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 68CCB610142; Fri, 13 Feb 2009 08:46:15 -0200 (BRST)
From: Otavio Salvador <otavio@debian.org>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <87iqnfjccq.fsf@neumann.lab.ossystems.com.br>
	<gn3cpm$tif$1@ger.gmane.org>
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Fri, 13 Feb 2009 08:46:15 -0200
In-Reply-To: <gn3cpm$tif$1@ger.gmane.org> (Koen Kooi's message of "Fri, 13 Feb
	2009 09:59:33 +0100")
Message-ID: <87d4dmiphk.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.90 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFH] Support for automatic package versining using git describe
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
X-List-Received-Date: Fri, 13 Feb 2009 10:47:38 -0000
Content-Type: text/plain; charset=us-ascii

Koen Kooi <k.kooi@student.utwente.nl> writes:

> On 13-02-09 03:32, Otavio Salvador wrote:
>> Hello,
>>
>> One of nice features we've been using is the git-describe to get
>> versions based on tags; many projects are using it to name the
>> development releases and it does give a better view of how diverged it
>> from last released version.
>>
>> So we're looking for a way to use it to generate the PV based on
>> that. The current git fetcher already has the required support to get
>> tags, so we can use it as SRCREV, but not yet to use git-describe.
>
> Do you have any examples of the output?

Sure:

otavio@neumann:~/hacking/ossystems/toscoterm$ git describe 
0.1-1-gd834119

Basically this can be read as:

 - last version was 0.1
 - since that we've done 1 commit
 - the sha1sum of it is d834119 (g is always included before it)

Cheers,

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


