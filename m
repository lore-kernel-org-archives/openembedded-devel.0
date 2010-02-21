Received: from mail-yx0-f188.google.com ([209.85.210.188])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nj9EH-0006Sv-HM
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Feb 2010 11:40:05 +0100
Received: by yxe26 with SMTP id 26so362672yxe.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Feb 2010 02:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=qCXNVm3MWNUVqOABrHaRDpxoGv1T1th10DmZN0UZ9Cg=;
	b=E4KkPS9xD8IPzNXlFfXaeG+Z4ej/kbMXfJ6h0FITMSmlYi/QENgXjJOk1B/+eoEmxR
	4pfNUyTmleguW9xDxzwgp66ApjYws/g9F4GdZfMrbuLoacVf1LiF2atbeSiLoY73HzcO
	37radAFlr88LOqaQN3YNl3jpPTlNvN46MnOa0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=KqAbUeKwSFtvnGdZuempisiLLP9TaoC3OPSztyR0Bzhet5B/NX8Ii0TrlwIS79a5V+
	bJd9am/9W8UiZsytsYVlDlvVJmzsUNBJcLRndq3Z7u86A6T3VH+G845l4PCJu/Zi9due
	Qeog+hd3S+vzTa1fC6pt7qqrXhYg/hqSCV0d0=
MIME-Version: 1.0
Received: by 10.101.165.29 with SMTP id s29mr5809408ano.162.1266748637702; 
	Sun, 21 Feb 2010 02:37:17 -0800 (PST)
In-Reply-To: <20100127220919.GA30195@denix.org>
References: <1264277173.3738.74.camel@mattotaupa.wohnung.familie-menzel.net>
	<20100124070602.GA8642@denix.org> <hjh7f3$6v0$2@ger.gmane.org>
	<20100125015636.GA9855@denix.org> <hjjk5q$rmc$1@ger.gmane.org>
	<20100125084340.GA18489@denix.org>
	<20100125085246.GA2670@xora-build.xora.org.uk>
	<20100127220919.GA30195@denix.org>
Date: Sun, 21 Feb 2010 11:37:17 +0100
Message-ID: <ac9c93b11002210237h6cd7d735kf8340c1d54ebc27d@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.188
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Official policy to list checksums
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
X-List-Received-Date: Sun, 21 Feb 2010 10:40:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/1/27 Denys Dmytriyenko <denis@denix.org>:
> On Mon, Jan 25, 2010 at 08:52:46AM +0000, Graeme Gregory wrote:
>> On Mon, Jan 25, 2010 at 03:43:40AM -0500, Denys Dmytriyenko wrote:
>> > This way we won't get anywhere... :) I thought (maybe I'm wrong) everybody
>> > agrees at least with the fact that central checksums.ini is not the best
>> > approach. Keeping checksums in the metadata inside SRC_URI seemed like a
>> > viable solution. Are there any fundamental flaws with this method, besides
>> > lacking some tools?
>>
>> I dont think there is any fundamental flaws, but there is still quite
>> a lot of cleanup work. Patches like
>>
>> http://www.xora.org.uk/cgi-bin/cgit.cgi/openembedded/commit/?h=xora/gnome-update&id=d2074190e711eb70a0bd26d2ac5b89b4988044b5
>>
>> Will need to be applied in some places.
>
> Hmm, I haven't noticed there were SRC_URIs in classes... On the other hand,
> the same needs to be done for .inc files.
>
> BTW, I have applied the first patch - let me know when we are ready for the
> second part. :)

What is the status of this?
I see that currently both the entries in checksums.ini and the format
for recipes are generated.
Of all possible scenarios this seems to be among the least desirable ones.

Are we ready for the 2nd patch as proposed by Denys ? (so no
generation of checksums.ini entries in the log if none exist)
And maybe some friendly encouragement (like we did with the commit
messages) towards those that still keep updating checksums.ini ?

Frans.


