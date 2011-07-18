Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Qiv4B-0006U4-3b
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jul 2011 23:09:27 +0200
Received: by vws2 with SMTP id 2so2763376vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2011 14:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=OtlLM2NdB00PJuwkkD1CPzRSAyFkkDeOqws5GQaZaO0=;
	b=GS25EsFTr8P9Q2f1/F8/TVUCzV2LUwSfO3VZQPA7sw1i2THxofq/OYKvb7SUs0mB4l
	BRZhARQWBRJnRQcbstYpm6hZ662Jn55JW4BGsY9+BcvUk03hrJVvH7YFEb5bt9yYDZce
	YEIIhbIDyAcwB36xdxF7P3U38f9OM9uJSkwx0=
Received: by 10.52.75.234 with SMTP id f10mr1421219vdw.241.1311023122058; Mon,
	18 Jul 2011 14:05:22 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.181.104 with HTTP; Mon, 18 Jul 2011 14:05:02 -0700 (PDT)
In-Reply-To: <4E249F56.8030907@vollmann.ch>
References: <4E248688.1030902@vollmann.ch> <4E249F56.8030907@vollmann.ch>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 18 Jul 2011 14:05:02 -0700
X-Google-Sender-Auth: 6Atx20Mv8qxjviPEiiOc7iwvkDQ
Message-ID: <CABcZANnmZwTK147Vwgv8j9omd7xNQQK5EKT99_UEctC2itw3Jw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: preferred version not available
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
X-List-Received-Date: Mon, 18 Jul 2011 21:09:27 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 18, 2011 at 2:02 PM, Detlef Vollmann <dv@vollmann.ch> wrote:
> On 07/18/11 21:16, Detlef Vollmann wrote:
>>
>> NOTE: preferred version githead of linux-taurus not available (for item
>> linux-taurus)
>
>> What really drives me nuts is the last line: it clearly parsed
>> linux-taurus_githead.bb before, doesn't give me any error on it,
>> but then tells me 'preferred version githead of linux-taurus not
>> available'. It's clearly there, so why is it not available?
>
> Ok, I found the problem: PREFERRED_VERSION refers to PV inside
> the recipe, not to the part of the filename after '_'.
> As I tinker with PV inside the recipe, bitbake is actually correct
> that a PV 'githead' is not available for linux-taurus.

All variables which are typically set by the filename can be
overridden. Those are simply defaults. See the definitions of PN, PV,
and PR in bitbake.conf.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


