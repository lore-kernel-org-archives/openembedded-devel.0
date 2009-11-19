Received: from mail-fx0-f209.google.com ([209.85.220.209])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NB4cX-0000Cz-5o
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 11:52:16 +0100
Received: by fxm1 with SMTP id 1so2120914fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2009 02:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=ka51q1jy/UwALmFkjydJGdJdg+ure2LR0qvFg2m6pv4=;
	b=OZ4/ylg5Zsov6Rg2NXtk04FlyfajLF610EjztNfQ8g+josk3ZXCOTNbMop+pOP6y3M
	SZ832jFfwB0QPU8rhfFR6cjoX67i54AfG4h2RxO8JInlEojJwiDtILI+PbtAro/CCoWQ
	4C7Ws5R1qXVZpf76CkskfBpAkQ93+g67ZqqEU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=sF36uh7gttckCCr6yNqds8dWU32Jm9TxYHaaFV7Sye9iCtym1J0KXds/lPARHds17I
	0f5sni9626Tak4rP/b3ayqu11WVGA/dLKQ3uU4SMZVMteJ7/ZN1XXALxuJfpftgRQsRG
	kbizBcqZyHsVpmmVYyKyB5Cfqpfq63dYOq3Ms=
MIME-Version: 1.0
Received: by 10.213.2.70 with SMTP id 6mr1501327ebi.30.1258627845652; Thu, 19 
	Nov 2009 02:50:45 -0800 (PST)
In-Reply-To: <be7a9f3d0911181421i4d3a1ffy2417cbbd91d9a1ff@mail.gmail.com>
References: <be7a9f3d0911181211s614defeaq5a49ca33c3691c50@mail.gmail.com>
	<1258576924.25369.687.camel@lenovo.internal.reciva.com>
	<be7a9f3d0911181421i4d3a1ffy2417cbbd91d9a1ff@mail.gmail.com>
Date: Thu, 19 Nov 2009 11:50:45 +0100
Message-ID: <c384c5ea0911190250p30ad7b42ra1d3b5843039c4de@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Merging of stable/2009 into dev
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
X-List-Received-Date: Thu, 19 Nov 2009 10:52:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Otavio,

On Wed, Nov 18, 2009 at 11:21 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Hello Phil,
>
> On Wed, Nov 18, 2009 at 6:42 PM, Phil Blundell <philb@gnu.org> wrote:
>> On Wed, 2009-11-18 at 18:11 -0200, Otavio Salvador wrote:
>>> From my POV the best alternative is, before we start changing a lot of
>>> stuff in dev we do a merge of stable/2009 into dev to allow easy
>>> merging from outside "forks" made by users.
>>
>> I don't quite understand what you mean by merging stable/2009 into dev.
>> Isn't it the case that all the changesets in stable/2009 were
>> cherry-picked from .dev in the first place, and hence are already there?
>>
>> Can you give a bit more detail on what exactly you are proposing?
>
> Please try it:
>
> git checkout -b merge-try origin/org.openembedded.dev
> git merge stable/2009
>
> You'll notice how many conflicts it produces.
>

I also do not understand what you are trying to achieve?

stable/2009 is a fix-only stable branch, whereas .dev is heavily on
the move with both features, fixes, framework changes and other cruft.

The branches are never supposed to be merged, in fact we expect .dev
to move away from stable.

In other words, the branch is a a "fish bone" branch; if you had a
product living on .dev then, you could base it on stable/2009 and be
happy with it.

Regards,
-- 
Leon


