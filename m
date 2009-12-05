Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <darkstar6262@gmail.com>) id 1NH1ZV-0001Yr-Uf
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Dec 2009 21:49:45 +0100
Received: by pwj11 with SMTP id 11so2917620pwj.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Dec 2009 12:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:from:date:message-id:subject:to:content-type;
	bh=oELPbJL6Nr+Wpfl6BuR6MIxPcwHfUPhg/j9sGTwfr8E=;
	b=CzVmlMmyNapfoOBYSQAEl+9yN5zHeJBRgJ6/Aztos+HI95HfQb9qtfEY61fP9PVXdy
	uljIgJ6emtdhnQnStDmvYxOGOwv5YGTnYpdQYOzES0nLsIQHu7QP/Sx+uEPICJVhxH4X
	wJMuFUZxHdpAk9q10wn3m47BihPxlOaQb1+64=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=tMQsNw4QB3eOiZyHLMVKig2i8XKlaUY1XgkNReo3NT5rqZX6qlpDcfAsgrJStF/Vhq
	zgOjwpK+a8EMaq/+021oaCA1fn9BQ+P/DfGh7O+QWuHeCfqtNhmS1OlB1vRHWrj8x5UW
	ExA1OmYYoU6VRUZ+ruGs3D23XEI41tXxlzUT0=
MIME-Version: 1.0
Received: by 10.143.24.36 with SMTP id b36mr547326wfj.14.1260046083065; Sat, 
	05 Dec 2009 12:48:03 -0800 (PST)
In-Reply-To: <4B1AC1D3.6000601@balister.org>
References: <1260039602-21665-1-git-send-email-darkstar6262@gmail.com> 
	<4B1AC1D3.6000601@balister.org>
From: Cory Maccarrone <darkstar6262@gmail.com>
Date: Sat, 5 Dec 2009 12:47:43 -0800
Message-ID: <6cb013310912051247h6fc00140h74b6d49118e3cf99@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: darkstar6262@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [STABLE] [PATCH] icu: Add patch for dangling #elif expression
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
X-List-Received-Date: Sat, 05 Dec 2009 20:49:45 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Dec 5, 2009 at 12:25 PM, Philip Balister <philip@balister.org> wrote:
> On 12/05/2009 02:00 PM, Cory Maccarrone wrote:
>>
>> This change adds a patch that fixes a compile error in
>> source/layoutex/ParagraphLayout.cpp caused by an
>
> I'm testing this and also see a problem with icu-native preventing icu from
> building. Did you fix this in stable also?
>

I haven't noticed any issues with icu-native -- I was building the
openmoko image when I encountered this, and for me this patch was
enough to get it compiling again.  I've confirmed that both icu and
icu-native compiled fine for me after this patch is added.

- Cory


