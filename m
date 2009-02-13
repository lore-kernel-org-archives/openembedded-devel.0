Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1LY1Xz-00086J-O8
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 18:09:51 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id 4490E4020B;
	Fri, 13 Feb 2009 13:08:35 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 7BD3F740C3;
	Fri, 13 Feb 2009 15:07:50 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 57BC0610067; Fri, 13 Feb 2009 15:08:09 -0200 (BRST)
From: Otavio Salvador <otavio@debian.org>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <200902131728.08634.openembedded@haerwu.biz>
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Fri, 13 Feb 2009 15:08:09 -0200
In-Reply-To: <200902131728.08634.openembedded@haerwu.biz> (Marcin
	Juszkiewicz's message of "Fri, 13 Feb 2009 17:28:08 +0100")
Message-ID: <878woae03q.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.90 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: checksums situation
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
X-List-Received-Date: Fri, 13 Feb 2009 17:09:52 -0000
Content-Type: text/plain; charset=us-ascii

Marcin Juszkiewicz <openembedded@haerwu.biz> writes:

<...>
> This solution also has one nasty part - now we can keep SRC_URI for 
> multiple versions in common file, but if we switch to storing it in 
> SRC_URI we will have to change that.
>
> Other solution proposed on IRC was to keep checksums in extra file in 
> each directory of packages/ subdirectory. I think that it is not best 
> but sounds better then one file.
>
> What do you think? Which way we should go? Do you have other ideas?
<...>

What about having a checksums for _each_ recipe?

foo_1.0.bb
foo_1.0.md5sum

This could have the valid one; this also avoid the sorting problem and
like.

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


