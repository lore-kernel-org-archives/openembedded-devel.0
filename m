Received: from [209.85.132.245] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jroman.espinar@gmail.com>) id 1KLDLh-0002cM-EG
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jul 2008 10:35:57 +0200
Received: by an-out-0708.google.com with SMTP id b38so394423ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2008 01:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:sender
	:to:subject:in-reply-to:mime-version:content-type:references
	:x-google-sender-auth;
	bh=Z2VS0Z287lVKTg3SNcaIFY+wOT6OcjjBNFSDKgsKE7U=;
	b=VOrmv+d2ExA1cItC1b2WpJDnRNymyNCAWCgE9A6aXEcJRMujvfQjgAky9ZYlFnRbjB
	z34aPTEWH4IwYHre6D81TWzkL91ygZ8vWjlYyxK4kKeHA7D0wj0PjyjRGtBWYDIiUs60
	qh0DGriNhEk5f7WlJVZYJmM7VYBX7zJWcWwBQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:sender:to:subject:in-reply-to:mime-version
	:content-type:references:x-google-sender-auth;
	b=h7E3uO8tNhrRKD8Gux1V0/3SfMM4jTfGdfiDZNJfIaPa5Rd1pE7PgA6JlnIJTl3jAM
	V2ACJWRIxU0pxAI8ORd9lMuDOmGwcx61FMy7fV5BjfC/9HDt016aYtvXkQmLO9IvwuEa
	TctMCdaGWOXqVn8TtqbQPFVb32payUI64hGEQ=
Received: by 10.101.71.9 with SMTP id y9mr2244372ank.127.1216715690468;
	Tue, 22 Jul 2008 01:34:50 -0700 (PDT)
Received: by 10.100.191.11 with HTTP; Tue, 22 Jul 2008 01:34:50 -0700 (PDT)
Message-ID: <12c2e32e0807220134l4c013933he2d17578c8a5988@mail.gmail.com>
Date: Tue, 22 Jul 2008 10:34:50 +0200
From: "Javi Roman" <javiroman@kernel-labs.org>
Sender: jroman.espinar@gmail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <d2b9ea600807220111i4c3adc1ekcb470034329e18f7@mail.gmail.com>
MIME-Version: 1.0
References: <d2b9ea600807220111i4c3adc1ekcb470034329e18f7@mail.gmail.com>
X-Google-Sender-Auth: 0fc88d1bfbb9a298
X-Content-Filtered-By: Mailman/MimeDel 2.1.10
Subject: Re: Stable source repository
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 22 Jul 2008 08:35:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jul 22, 2008 at 10:11 AM, Esben Haabendal <esbenhaabendal@gmail.com>
wrote:

> Hi
>
> For some reason, some OSS projects does not offer persistent access to
> old releases,
> which continously give problems for OE and other similar distributions.
>
> With the org.openembedded.stable branch, this problem is considerably
> worse.
> The usual fix in .dev is to upgrade the recipes to a current release,
> which of-course
> is not what we want for a stable branch.
>
> Take for example
> http://bugs.openembedded.net/show_bug.cgi?id=4227
>
> I think it is worth considering a permanent solution to this kind of
> problems.
> We should have a download server which carries all sources referred to
> by http and ftp URI's in org.openembedded.stable recipes.
> Why not setup ftp://downloads.openembedded.org/org.openmbedded.stable
> to mirror a copy of all sources referred to by current .stable recipes, and
> when a bug is filed with a missing source, the solution is simply to change
> the SRC_URI to use the ftp://downloads.openembedded.org URI instead.
>
> Of-course, unless continous manual labor is to be required, we need to
> write a script or something like that to maintain the mirror repository.
>
> And we need a server with enough storage and a big fat pipe to the
> Internet.
>
> What do you think?
>
> Best regards,
> Esben Haabendal
>
>
I was thinking to automatize the search for old software versions by means
of http://www.filewatcher.com/ or something similar. If the original SRC_URI
fails, then OE could automatically look for the source file with searching
engines.

Regards.

-- 
Javi Roman

