Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RmswN-0008N1-O0
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jan 2012 21:14:03 +0100
Received: by qabj34 with SMTP id j34so2653662qab.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jan 2012 12:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=jsJT49sT/nNZLVkZ5vYESb8N8Ig6Hl+4Xo0QNjBPW1o=;
	b=qQxDMog7oCd8vKRarxlPed/IjUj/4/pwKPUyoWgLJEJpiBRs6Arhvu+ZF38StQnQFM
	ppI/+7/Tt7+KOfazcpckWQoiKS6BeGJ7j75sBWJuubeGLouOiOSQEjrR+M8T9d77PLRt
	bcvoJ5R7nukt7Gsc468OmP/0XMcvhjBsptnmQ=
MIME-Version: 1.0
Received: by 10.224.18.137 with SMTP id w9mr16852572qaa.91.1326744387184; Mon,
	16 Jan 2012 12:06:27 -0800 (PST)
Received: by 10.229.98.149 with HTTP; Mon, 16 Jan 2012 12:06:27 -0800 (PST)
In-Reply-To: <CACW_hTaEj8ogaR5NihAeGQsKu6kA0SXD4-BzgaoK02+eH_uGcg@mail.gmail.com>
References: <CACW_hTaxUWYmPmvczsBFNgaGBKMFyt7Pg40ZCr6JNppe3btScA@mail.gmail.com>
	<CA+M6bXnz_B48oc4Nt_Cw-arQpR_nqx=HSLMba49+5giqGt4mSQ@mail.gmail.com>
	<CACW_hTaEj8ogaR5NihAeGQsKu6kA0SXD4-BzgaoK02+eH_uGcg@mail.gmail.com>
Date: Mon, 16 Jan 2012 13:06:27 -0700
Message-ID: <CA+M6bX=g79S88=-vwDDG9aYU4bydxdqHquASE-i12c5u_K-q4g@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] commit 89cb863234616620d172984ff173f1d84ce4caa9
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
X-List-Received-Date: Mon, 16 Jan 2012 20:14:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 16, 2012 at 12:59 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2012/1/16 Tom Rini <trini@kernel.crashing.org>
>
>> On Thu, Jan 12, 2012 at 12:33 AM, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> wrote:
>> > Dear all,
>> >
>> > I just accidently committed
>> > 89cb863234616620d172984ff173f1d84ce4caa9<
>> http://cgit.openembedded.org/openembedded/commit/?h=3D2011.03-maintenanc=
e&id=3D89cb863234616620d172984ff173f1d84ce4caa9
>> >on
>> > the maintenance branch.
>> >
>> > My intention was to commit this to master and send a maintenance pull
>> > request, but as i did not notice that my branch was on
>> 2011.03-maintenance,
>> > I accidently pushed to that branch
>> > (actually somewhat surprizing me, as i did not expect to be able to pu=
sh
>> > against that branch).
>> >
>> > I'll leave it to the maintainers to decide on how to handle this.
>> > I would like to see this recipe in the maintenance branch too thoguh.
>> >
>> > The patch moves the recipe from the 2007_365 version to the 2010_365
>> > version.
>> > commit message:
>>
>> *kicks gmail for not marking this important*
>>
>> Well, how does this fit against the rest of the requirements for the
>> branch? =A0In other words, have you gotten all of these changes in
>> somewhere else so they won't be lost?
>>
>> Hi Tom,
>
> Not sure what you exactly mean.
> The change is also in oe classic master. oe-core does not carry this reci=
pe
> (and if I recall correctly meta-oe neither does)
> As it stands the patch simplifies the recipe as the uclibc specific patch
> is not needed any more (and hence is dropped).
>
> And maybe I caused confusion: the changes I listed in the commit message
> are the official changes between 2007_365 and 2010_365, not changes I mad=
e
> to the code.
> In fact the recipe is pretty straightforward.

So long as the recipe changes exist somewhere else then yes, I'm OK
with this accident.  We don't currently have special hooks setup to
make the maintenance branch only writable by me and I'm not sure if
it's worth adding to our admins workload.

--=20
Tom


