Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OaWOi-0007WF-F1
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jul 2010 18:07:38 +0200
Received: by vws3 with SMTP id 3so4023367vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jul 2010 09:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=BAe/SX/ClK9zxPeXEmjcBhMUayatxTsfaSJfZM8pAT4=;
	b=wK7ADvXu/P/e43xukKPvbp4wpyXjVt0XtUomZJav2gtLOSM45AhZ9EzH0qsandjDhC
	YDbzDCDv9cRbDaLywdM7UEWNpJ2d7xTV9FuyNUN8Grojr49RlNgWeqYmpDUXkKaD3Iew
	WcEPecK5mYoYdr0q6uO0bZTvp6dQOn6BSTdsQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=aQIqvtDxLbk1AuadpllPFZq6vtJ8jfHfStW3VP2jlaOEAg9ofFOtwpZqaEKrMkQItg
	Ot98f7JCpNCnzK+q1bKtkchPJfrt24dCZpbw+7943psRBWyL4KRO/gv6xKTtl9op6nHR
	I3+Iphd3f48hTVca0Jo6VpCXq9wKt3Cefv1GI=
Received: by 10.224.89.11 with SMTP id c11mr3110836qam.344.1279469235224; Sun, 
	18 Jul 2010 09:07:15 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.212.11 with HTTP; Sun, 18 Jul 2010 09:06:55 -0700 (PDT)
In-Reply-To: <4C43255B.3000601@vollmann.ch>
References: <1279290319.10837.1747.camel@rex> <4C42D208.2000909@vollmann.ch> 
	<AANLkTimGdT8mVtOVYiPZfeGhRvt02DyUiiKEtITzuyQT@mail.gmail.com> 
	<4C43255B.3000601@vollmann.ch>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 18 Jul 2010 09:06:55 -0700
X-Google-Sender-Auth: uI97K3HEjiHHfKZpZQB87I_otss
Message-ID: <AANLkTilan1WpQ8ygbi4Dg3HLgRwyggP66X_-xlT1VB5r@mail.gmail.com>
To: Detlef Vollmann <dv@vollmann.ch>
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [Bitbake-dev] A new bitbake extension: .bbappend files
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
X-List-Received-Date: Sun, 18 Jul 2010 16:09:08 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jul 18, 2010 at 9:01 AM, Detlef Vollmann <dv@vollmann.ch> wrote:

> On 07/18/10 17:13, Chris Larson wrote:
>
>> On Sun, Jul 18, 2010 at 3:06 AM, Detlef Vollmann <dv@vollmann.ch> wrote:
>>
>>  On 07/16/10 16:25, Richard Purdie wrote:
>>>
>>>  For the specific case of paths, I have wondered if there would be a way
>>>> to leverage help from bitbake in creating a sane set of search paths but
>>>> I'm still thinking about that. This extension is good enough in its own
>>>> right in my opinion to be worthwhile.
>>>>
>>>>  This might be true, but solving the general path problem would be
>>> much more useful.
>>> If you want to add a new version of e.g. gcc in your ovlerlay,
>>> you have to pull over the whole gcc directory with all its .inc classes.
>>> This can't be solved by .bbapend, or am I missing something?
>>>
>>
>>
>> You can handle that today by adding to FILESPATHBASE.  All file:// files
>> from SRC_URI are located using FILESPATH, which is constructed from
>> FILESPATHBASE, FILESPATHPKG, and OVERRIDES.
>>
> AFAIK this doen't work for include/require :-(


Don't copy the recipe at all, use .bbappend instead, and you won't need to
have the .inc in a different collection from the recipe itself.

Alternatively, you can adjust BBPATH to also include the other collection
based paths + os.path.dirname('${FILE_DIRNAME}') or so.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

