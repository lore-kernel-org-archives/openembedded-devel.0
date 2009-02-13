Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1LY0Ah-0008Df-0R
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 16:41:43 +0100
Received: from internet.ossystems.com.br (unknown [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id 29AB54020B;
	Fri, 13 Feb 2009 11:40:25 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 6A047740C3;
	Fri, 13 Feb 2009 13:39:14 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 12930610067; Fri, 13 Feb 2009 13:39:32 -0200 (BRST)
From: Otavio Salvador <otavio@debian.org>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <200902131525.34787.openembedded@haerwu.biz>
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Fri, 13 Feb 2009 13:39:32 -0200
In-Reply-To: <200902131525.34787.openembedded@haerwu.biz> (Marcin
	Juszkiewicz's message of "Fri, 13 Feb 2009 15:25:33 +0100")
Message-ID: <87r622firv.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.90 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: Machine config generator (FOSDEM idea)
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
X-List-Received-Date: Fri, 13 Feb 2009 15:41:43 -0000
Content-Type: text/plain; charset=us-ascii

Marcin Juszkiewicz <openembedded@haerwu.biz> writes:

> Hi
>
> I was talking during FOSDEM with some developers and one of things which 
> I was asked about was 'how to create machine config' (usually question 
> was other but had this sense).
>
> OE developers usually know that machine config is simple but tell that 
> to Joe Random who only knows that his board use s3c2443 etc. So idea was 
> to create simple few steps wizard which will ask few questions and 
> produce machine config as result. More work would be required on 
> creating kernel recipe because kernel can be from svn/cvs/git or tarball 
> + quilt patchset etc...
>
> Thats only beginning of idea - I hope that someone will provide 
> feedback.

I see the pros for it but I also think it will not help too much; the
most difficult problem is to understand OE as a whole and how the
packages can affect each other.

It takes a while to identify the failures and to cook up a fix for those
problems.

What will be the use of a machine definition without a kernel config for
it? And let's be real, if the person knows how to compile the kernel for
it then I'm absolute sure that the machine definition won't be problem.

What I do think could be useful is a more detailed set of "Quick Start
Guide" having one for each really common task. The set of tasks I
believe are common for regular users are:

 - adding a new package version
 - adding a new package
 - creating a distribution based in another
 - adding a new machine

This small set solves 90% of problems people usually have and as a plus
help the end user to understand OE in more deep; as a bonus we can end
up having more people giving back the generated changes.

My 2c.

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


