Received: from [209.85.132.247] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rodrigo.vivi@gmail.com>) id 1KpuLM-0001pY-7g
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Oct 2008 02:34:28 +0200
Received: by an-out-0708.google.com with SMTP id b38so179262ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2008 17:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=6ayRynZqb8AdxyojohacFrRIL1kRh96XP7m2L3JyGnk=;
	b=H1H8ijnDXS+SiMAvIEVn0nxbrxWx0pWcpLtG0l+yXa7E1rZadED2Wvsc8FCaugl618
	VslpdBIO8qpZO/8fuSMV5UVhkxCaZd2HmXJximWR/PONR6rRIrwTDZlLvZtqG35GM9mx
	55JH5+cqZWIS1aaIJVZ3yCLdsQsgvpYLw37+M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=ETkgpKD6VWDU3kGaulOSAfovui+MXkgKvnwcxQg9zGSR7NzduF62ujxwN+LEMCanf8
	n/jKPboQUyskunAlL+5TgmPZgtkhsev07+5FtAvGEB2/VsoUBpAZQzxDk8DG9+Lz6Ljo
	TeUCrfMLsUe6qU9bGPbkZcuyZSWRUjbDhL7oA=
Received: by 10.100.226.19 with SMTP id y19mr268919ang.120.1224030561728;
	Tue, 14 Oct 2008 17:29:21 -0700 (PDT)
Received: by 10.100.105.13 with HTTP; Tue, 14 Oct 2008 17:29:21 -0700 (PDT)
Message-ID: <bdb0025f0810141729i7c225186x5cdca349b25e57c3@mail.gmail.com>
Date: Tue, 14 Oct 2008 21:29:21 -0300
From: "Rodrigo Vivi" <rodrigo.vivi@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200810142341.06945.zecke@selfish.org>
MIME-Version: 1.0
References: <200810080751.15817.zecke@selfish.org>
	<200810142341.06945.zecke@selfish.org>
Subject: Re: ETA on git conversion
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
X-List-Received-Date: Wed, 15 Oct 2008 00:34:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Holger,

Great news!
Great job!

Thank you very much for your efforts on this migration.

On Tue, Oct 14, 2008 at 6:41 PM, Holger Freyther <zecke@selfish.org> wrote:
> On Wednesday 08 October 2008 07:51:15 Holger Freyther wrote:
>
>> Wednesday:
>>       - Be back up with git and use that as primary system.
>>       - Disable monotone completely
>
> 1.) git user account created
> 2.) gitosis setup
> 3.) keys added and permissions added (see the end of the mail)
> 4.) populated the repository with content
> 5.) git-daemon is serving data
> 6.) push/pull with git ssh works
> 7.) notifications should work too
> 8.) the GitPhraseBook got updated with the final git location
> 9.) gitweb is nice and even tells you which URL to use
> 10.) mail almost sent
>
> I think the conversion is complete and we can disable the mtn servers now or
> leave them readonly for a while.
>
>
> Notes to people with commit access:
> git clone git@git.openembedded.net:openembedded to get the tree
>
> Notes to people:
>        DO NOT MERGE the old trial history and this history. We have no commit hook
> yet to prevent this and solely depend on common sense...
>
>
> Notes to people using the trial git:
>  git-remote add new-origin git://git.openembedded.net/openembedded
>  git-fetch new-origin
>  git-rebase --onto new-origin/org.openembedded.dev
> origin/org.openembedded.dev org.openembedded.dev (if i got this right from
> the manpage)
>
>
>
> Thins for the near future:
> Remove the nslu2 branches once nslu2 folks have migrated to git as well and
> created repositories for them.
>
> Consider renaming the branches, I kind of like the names though
>
>
>
>
> People with push access:
>        cbrake.pub
>        crofton.pub
>        daniel_willman.pub
>        dirk_opfer.pub
>        felix_domke.pub
>        florian_boor.txt
>        henning_heinold.pub
>        hrw.pub
>        jan_luebbe.pub
>        john_lee.pub
>        khem_raj1.pub
>        khem_raj2.pub
>        koen.pub
>        leon_woestenberg.pub
>        mickeyl.pub
>        mustafa_yuecel.pub
>        mwester.pub
>        otavio_salvador.pub
>        paul_eggleton.pub
>        phillip_zabel.pub
>        robert_schuster.pub
>        rodrigo_vivi.pub
>        rolf.pub
>        rpurdie.pub
>        rwhitby.pub
>        shane_volpe.pub
>        stanislav_brabec.pub
>        thomas_kunze.pub
>        xora.pub
>        zecke.pub
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Rodrigo Vivi
INdT - Instituto Nokia de Tecnologia
Blog: http://blog.vivi.eng.br
GPG: 0x905BE242 @ wwwkeys.pgp.net


