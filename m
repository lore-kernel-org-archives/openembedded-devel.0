Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1Rfc4z-00078c-0J
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Dec 2011 19:48:53 +0100
Received: by qcqw6 with SMTP id w6so6682720qcq.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Dec 2011 10:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=aERdHApF+ZTEKyKKaMT8yZ8QlTVbuBQgiaqwEh1Lvbk=;
	b=dZbbZ0ouvmCLbmkZCZeUYxtCvpHhyZrYccPpq2APTC7y3x59jsdZJLkzMc/DmtkxXq
	1cBph5mweOD8M/Qg0YFJdaqqC5xtVtp02bjv/X7zdTPd7wUAGQWUYh9Y2ZAiFWCthoil
	37nWqq/5T/1BUfdE9EzfJMsDatKMPAGsEs63Y=
MIME-Version: 1.0
Received: by 10.224.102.2 with SMTP id e2mr34761156qao.31.1325011299658; Tue,
	27 Dec 2011 10:41:39 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Tue, 27 Dec 2011 10:41:39 -0800 (PST)
In-Reply-To: <CACW_hTZkQw6G=D=vKo1KUkHmbT-ODu7uPVH0ebbh-E7=R8zKMA@mail.gmail.com>
References: <CACW_hTbaEcTcwhut+9NJX6yci6Mu6w+uhqB3xKcfORSg5gM2FA@mail.gmail.com>
	<CA+M6bXn4T8YO5SwiotYJcy3K2ioQtUBsGLCTOXCZZE=yU2vdBg@mail.gmail.com>
	<CACW_hTZkQw6G=D=vKo1KUkHmbT-ODu7uPVH0ebbh-E7=R8zKMA@mail.gmail.com>
Date: Tue, 27 Dec 2011 11:41:39 -0700
Message-ID: <CA+M6bXmmJENqVDy+Ym+65a5D6jmzjJQAR4T=2y=8CZs_W1hHyA@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] net-snmp: please cherry pick 4a98e62ac35d4367d3c072819317deeda52abf5e from master
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
X-List-Received-Date: Tue, 27 Dec 2011 18:48:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 27, 2011 at 11:28 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2011/12/27 Tom Rini <tom.rini@gmail.com>
>
>> On Mon, Dec 26, 2011 at 1:29 PM, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> wrote:
>> > Please merge this one
>> >
>> http://cgit.openembedded.org/openembedded/commit/?id=4a98e62ac35d4367d3c072819317deeda52abf5e
>> >
>> > to the maintenance tree. it updates net-snmp to 5.7.1; the existing
>> version
>> > does not build for uclibc; this fixes it.
>>
>> Per the wiki page, this is not a proper request for the maintenance
>> branch, please re-submit a pull request with the cherry-pick tested
>> and confirmed to fix the issue, thanks.
>>
>> This has been tested for meta-oe (by Eric) and for the maintenance branch
> (by me, actually it is part of our most recent product) and compile-tested
> by me on master.
> I'm not planning to set up a git or branch for a single patch. I'll mail a
> patch in a few minutes.
> Didn't know we became this bureaucratic. Will take that into account when
> considering submitting my next patch.

Yes, I'm only taking cherry-picks that others have done and
send-email'd or pull requests and not individual cherry-pick requests
so that I can be sure that the person requesting the change is sure
this deals with their issue fully.  Sorry if I wasn't clear that
individual patches are also fine (the wiki page does say patches or
pull requests already, just re-confirmed).  Thanks.

-- 
Tom


