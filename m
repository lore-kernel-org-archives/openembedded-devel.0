Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1LCyPj-0006qg-DI
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Dec 2008 16:34:19 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id C58D3400CA;
	Wed, 17 Dec 2008 11:29:06 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id EBEDB22552;
	Wed, 17 Dec 2008 13:28:39 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 8C2C3610045; Wed, 17 Dec 2008 13:25:17 -0200 (BRST)
To: openembedded-devel@lists.openembedded.org
References: <gib10j$i28$1@ger.gmane.org>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Wed, 17 Dec 2008 13:25:17 -0200
In-Reply-To: <gib10j$i28$1@ger.gmane.org> (Koen Kooi's message of "Wed\,
	17 Dec 2008 15\:06\:10 +0100")
Message-ID: <87r6467rj6.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] collapse commits in branches to easy review
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
X-List-Received-Date: Wed, 17 Dec 2008 15:34:19 -0000
Content-Type: text/plain; charset=us-ascii

Koen Kooi <k.kooi@student.utwente.nl> writes:

> Big branches CANNOT be merged without proper review, but I don't think
> anyone wants to review a few hundred commits :/
>
> So, what do you think about this?

Big branches are usually wrong. Instead of using diffsplit I'd suggest
that people provide the patches as patch series, as done in Linux
kernel, or in topic branches.

If the user/devel has a server where he/she can host the branches, a
set of small topic branches are easier to review and merge. Otherwise
git send-email does the work and could send the patch set to mailing
list.

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


