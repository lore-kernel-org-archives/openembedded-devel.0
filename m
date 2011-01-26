Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Pi5HF-0006Xj-P8
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 14:19:14 +0100
Received: by iwn8 with SMTP id 8so902125iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 05:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=j7rGvlLJUOpHK+KsLOtUtI96xXuN4YZfWU3yVvVZwUg=;
	b=H/M2xXvrd+rZ8GLCJP3u+Oy0G+4KVEjGPwiyZjP/otUxfFpg0ywncABRk80PVgSW8b
	xoRdxf7bPJ08RmCaKjLMutjLGbkCIoVaCDow2TtAc+966qdyxtuh8+5I/GysNxv4kfzP
	iFfQE5BtHbYFFIGEE63tMmPlWLdeuC7V3gSfo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=BiX5eCZgNVAcL6ogYZ5YEqtcGyf4Pq2XK++bTZHlawY0Vmo55l7LiHf78kVYpD3sZ6
	zux8UFuxPftvvpo/kBwkgLQNIz0n5Nn4oHRerM5uB7y/nCGglpqoCrnFN25W2eF/SmDv
	/dMcNVwrGzd/8jXgPgNejZGjVSeV0MaQjiRDw=
MIME-Version: 1.0
Received: by 10.231.37.12 with SMTP id v12mr8184174ibd.83.1296047907080; Wed,
	26 Jan 2011 05:18:27 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Wed, 26 Jan 2011 05:18:27 -0800 (PST)
In-Reply-To: <20110126111251.GB29416@excalibur.local>
References: <20110126102308.GA29416@excalibur.local>
	<4D3FFB03.9010206@xora.org.uk>
	<20110126111251.GB29416@excalibur.local>
Date: Wed, 26 Jan 2011 14:18:27 +0100
Message-ID: <AANLkTikjzDWp7dWSRFJ_Zvw=O8+365GrUxUZgPNPmpiL@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OE 2011.03 release vs. oe-core migration
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
X-List-Received-Date: Wed, 26 Jan 2011 13:19:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/1/26 Stefan Schmidt <stefan@datenfreihafen.org>:
> Hello.
>
> On Wed, 2011-01-26 at 10:44, Graeme Gregory wrote:
>> On 26/01/2011 10:23, Stefan Schmidt wrote:
>> >
>> > During last OEDEM we set out a timeline for quarterly releases. The first one
>> > hit on time in december 2010 (Thanks Khem).
>> >
>> > The next one would be scheduled for 2011-03. As our plans towards oe-core are
>> > getting into shape I wonder if and how these both are going to conflict.
>> >
>> > Will we go ahead and make the 2011-03 release, maybe the last one before moving
>> > over to oe-core? Personally I don't think these two block each other. Syncing
>> > would be needed, but people will keep working on the OE repo for a bit longer
>> > anyway I would think.
>> >
>> > If we are going to scratch the release what would be the next target for it?
>> > Yocto 1.0 is planned for April 2011. Somehow I doubt we will have oe-core ready
>> > for this in time, including yocto movs to it and we base the rest of OE on top
>> > of it. Am I wrong here and that is the actual plan?
>> >
>> >
>> My opinion is 2010-03 should be the last release on the old source tree.
>
> Great
>
>> Releases after this should be on the new oe-core layer system. I don't
>> think we should scrap the release as its going to take some time to kick
>> oe-core into shape and finish the poky merge. Then there is work on
>> meta-openembedded and meta-distro to do on top of that.
>
> Frans was saying something along these lines as well and personally I would be
> happy with one last release with the current metadata layout. This would allow
> current OE users to have a release with the latest changes as a base until we
> found our way through the oe-core changes moving forward.
>
> Should we try a freeze for the repo this time or go ahead with the model from
> last time. Having a branch with fixes which gets deleted once the release taggin
> is done?

The issue here is also when the move to oe-core will be done.
If that is making progress I would not expect activity on this repo to
slow down.
And if the move to oe-core is done shortly after the release we could
maybe turn it into a maintenance branch.

Frans.
>
> Depending on some other factors I might also be interested in using this release
> for a product and I'm thinking about having a branch for it with fixes and
> pooling resources on it. Not much thinking about this yet though.
>
> regards
> Stefan Schmidt
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


