Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NmDLo-0007vF-VG
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 22:40:43 +0100
Received: by gwj17 with SMTP id 17so177689gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 13:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=cgcUBGZYBGRjTuRx+oki8DGwn9/jidL6ZER1t/wQtNc=;
	b=mLQLoU6SU1g3h1GP8lJTZg+wpWF0+pTOB85/Da2O3xLcXQqWiuEvEaFVycPflOyONm
	urBGypudY1tb5kwx4qAhkmz2UeDwKutWFI5aEqsoR6yZjM0vYOthIBPrYSECmw9PAuf0
	aAC9kC0paWmKSAsE1wwg3pvAhRKMTDUgvVMpc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=fxkTfPNc/uxqQy0SViACJksBkJG26CPiU5WrM0sobjyWa2xLvjsqgCU12vhJhTFDLT
	GHAYSF1HrSsbgZDZ+dr0dWS3aSYvj5RpqfHAXBvGn+QtL86WZlHdMyqSCSzJq9f+RGlx
	O+wY97O/T3xlivNn8Ps5Txr9M3WNWE2fnlw0M=
MIME-Version: 1.0
Received: by 10.100.235.24 with SMTP id i24mr7152887anh.155.1267479458469; 
	Mon, 01 Mar 2010 13:37:38 -0800 (PST)
In-Reply-To: <4B8C2B1B.40604@balister.org>
References: <ac9c93b11003011133wa0f4e3bqe7af69ead4d7eec6@mail.gmail.com>
	<4B8C2B1B.40604@balister.org>
Date: Mon, 1 Mar 2010 22:37:38 +0100
Message-ID: <ac9c93b11003011337g5405fe11rcb7d138ae2f854f2@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: {TSC] request to discuss items.
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
X-List-Received-Date: Mon, 01 Mar 2010 21:40:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/3/1 Philip Balister <philip@balister.org>:
> On 03/01/2010 02:33 PM, Frans Meulenbroeks wrote:
>>
>> As we have (as far as I know) no procedure to table issues for the
>> TSC, I'm proposing two issues for the TSC:
>
>> 1) the location of distro specific files
>
> This is a little premature ... There is a good discussion going on about
> this at the moment. It takes time for the community to draw a conclusion on
> matters like this.

I thought most arguments were brought up, and it is clear there is no consensus.
actually I'm not sure when the next TSC meeting is, but afaik it is
perfectly ok to move it to the one after that.
Guess a TSC decision will be needed at some point as I don't think
there will be consensus.
>
>> 2) how to handle legacy recipes that are not used by any known distro
>
> I'd note that this issue has come up before, and the consensus is no major
> shuffling of recipes for aesthetic reasons. I don't see any changes that
> would change the conclusion this time. I believe all of the TSC members are
> already involved in the on list discussion.

The overlay mechanism is better supported now, so could act as a help.
And I know that at least one TSC member feels that moving e.g. to an
obsolete dir is a good plan (so guess the consensus is not there any
more).
But again if we feel the discusion has not settled yet and not all
arguments are on the table it can be moved to e.g. the meeting after
the next one.

Frans.

(ps: I object that the change is purely aesthetic; it improves the
parse time, reduces disk space somewhat and imho improves
maintainability).
>
> Philip
>
>>
>> Both have been discussed on this list, and several options have been
>> coined
>> E.g. for 1) dedicated directories, overlays or retain the current solution
>> And for 2) an overlay, and "obsolete" directory, retain the current
>> solution and remove the recipes.
>>
>> May I ask the TSC to provide a verdict on these.
>>
>> Thanks alot,
>> Frans
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


