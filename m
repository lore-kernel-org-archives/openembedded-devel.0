Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ashcharles@gmail.com>) id 1OBCbo-0003lU-NY
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 May 2010 21:56:17 +0200
Received: by pxi14 with SMTP id 14so1208542pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 May 2010 12:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=PfvTIrgqvO7/Pq9GNLOz4Q/zDjaAf7cwz1QgC/nSTLU=;
	b=kUt0jE1JKluoJgLfPneymhwgmkT9jaht+855IcMTVtxvc2eA5O8JsuBrXOtmLK3mqI
	18/OSW9+4JbThEtgfvHLgRx+RwX6fSzmnM+TSiF4EE9RSVZoU0B2GKDiZdmgFNm5eU6O
	Z1hSldDAn1Cdn4hKAiW3imN8sOqWMHnP9MEd4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=tyVvANQoESSvUy+eOAGfi9ql/3uqTg2yAB+z/NHxrrYU9untqI8jzzh8Np8H1rdKL2
	isHclK/7iIwYwmLfWSZDPdqlAVOyBolYwINHV3FQNAl78GsEi1rlQ3x2+CdPUq91SbMB
	l1jr4ovv/N1ze9spuDXqcSxw1rh/SZa4mCGds=
Received: by 10.140.252.7 with SMTP id z7mr1897892rvh.186.1273434744089; Sun, 
	09 May 2010 12:52:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.208.6 with HTTP; Sun, 9 May 2010 12:52:04 -0700 (PDT)
In-Reply-To: <u2xb6ebd0a51005071600ra9935d46r8fe294c592c7cebf@mail.gmail.com>
References: <z2qbd4a003f1005071539wbd18f0e5w531868565b953e2a@mail.gmail.com> 
	<u2xb6ebd0a51005071600ra9935d46r8fe294c592c7cebf@mail.gmail.com>
From: Ash Charles <ashcharles@gmail.com>
Date: Sun, 9 May 2010 12:52:04 -0700
Message-ID: <x2lbd4a003f1005091252na20bddeaj61078fce2c825a70@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: ashcharles@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Understanding Bitbake Dependencies
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
X-List-Received-Date: Sun, 09 May 2010 19:56:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 7, 2010 at 4:00 PM, Chris Larson <clarson@kergoth.com> wrote:
> On Fri, May 7, 2010 at 3:39 PM, Ash Charles <ashcharles@gmail.com> wrote:
>
>> Hi,
>>
>> When I change a recipe or configuration in OE, I often end up doing a
>> 'bitbake <package-name> -c clean; bitbake <package-name>' to ensure
>> whatever it is I'm doing it gets rebuilt. =C2=A0I realize there must be =
a
>> better way to do this in some cases---sometimes just a bitbake
>> <package-name> -c rebuild is sufficient though not always---other
>> times I can just get away with bitbake <package-name>.
>>
>> --- What types of changes causes bitbake to rebuild a recipe?
>>
>
> It never magically detects changes to recipes or configuration and rebuil=
d.
> =C2=A0It goes by the stamp files, whose file names include the PN, PV, PR
> variables. If you change a recipe or config and need something rebuilt, y=
ou
> need to either bump its PR (revision) or do the -c clean then bitbake.
Perfect--this makes sense.
>
> --- Why is '-c clean, then rebuild' different than '-c rebuild'?
>>
>
> It's an artifact of how bitbake's runqueue works. =C2=A0Strongly advise a=
gainst
> using -c rebuild as it stands today.
>
>
>> --- If I make changes to the kernel (e.g. enable a module), what else
>> do I need to bitbake to get an updated root file system|image?
>>
>
> Image recipes rebuild the image from the packages every time you bitbake
> them (their tasks are flagged with 'nostamp'). =C2=A0If your question is =
how to
> rebuild the kernel packages that the image recipes can then install, as I
> said above, clean and re-bitbake the kernel or bump the recipe revision i=
f
> it's a recipe change.
>
> Sorry for the simple questions but the dependencies can seem a little
>> magical at times. If anyone could point me to a reference or give me a
>> brief explanation of this, that'd be wonderful!
>
>
> I had thought the behavior of the stamps was documented in the bitbake
> manual.. if not, it should be :)
The version online (is there another version to be using?) has only
this information about the stamps directory I think:
"Nothing of interest to users in here. These time stamps are used by
bitbake to keep track of what tasks it has completed and what tasks it
still has outstanding. This is how it knows that certain actions have
been completed and it doesn't need to do them again."

Thanks for the info Chris.

-Ash


