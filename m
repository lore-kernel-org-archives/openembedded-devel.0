Received: from mail-gx0-f224.google.com ([209.85.217.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nu0vf-00038S-87
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 11:01:45 +0100
Received: by gxk24 with SMTP id 24so1696643gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 02:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=diO3u0IGHaSHZjvBKLGNRfLulZ5RmZrELM1h3C14KxY=;
	b=xBeCXavsoU5TJXN3gZDXwWL5g5BYHN53XOZCpDrCOR9Fncrtg13JLghwj/z5uCcGQK
	c1xHsALiWoeMnsf1pZKD3BDBJ5fq98SUavlaOOch+5A0D75BMljJCR3pCYz734b7lEBY
	fC2kmTjuTv4U9oc5nuOgdO0Le2AK3ju9tpXPM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ggv70R4vXGEup7TOyE67T3uj1MJ/3Z/i8TUuIGd5ZJsIlJRikdQjuOqW5HnAKUtbNE
	AN81FbBZiHrpGv84fixT0+t7y+Ro1JdITK6njVe0iCEvpwdaJxP2/RhBzWgbth+94ort
	zBKw04OVSsaetYvX8tXlJlXARPViWhhwG9VkM=
MIME-Version: 1.0
Received: by 10.101.59.16 with SMTP id m16mr4559723ank.84.1269338312151; Tue, 
	23 Mar 2010 02:58:32 -0700 (PDT)
In-Reply-To: <201003231050.56580.holger+oe@freyther.de>
References: <b6ebd0a51003221526y7c47c57esd7bc14cc5e85f893@mail.gmail.com>
	<ac9c93b11003230232y2b556dc3t19813973d7c01b46@mail.gmail.com>
	<201003231050.56580.holger+oe@freyther.de>
Date: Tue, 23 Mar 2010 10:58:31 +0100
Message-ID: <ac9c93b11003230258i42269ffcq2e40dde07324ad8@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.224
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: BBVERSIONS
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
X-List-Received-Date: Tue, 23 Mar 2010 10:01:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/3/23 Holger Hans Peter Freyther <holger+oe@freyther.de>:
> On Tuesday 23 March 2010 10:32:59 Frans Meulenbroeks wrote:
>> Chris, while this is a nice idea it conflicts with having checksums in
>> the recipe, as that makes the recipes unique.
>> Unless of course there is (or we create) a way to have multiple
>> checksums in a recipe and pick the one that is for the version we are
>> building.
>
>
> There is a way or could be a way. For the name= we can use a variable in the
> name (e.g. PV) but have a written out variant for the SRC_URI.

That would be cool and also nice to have for current recipes.
When moving a recipe to a new dir you cannot just clip whatever is
generated and paste it into the recipe (especially if the SRC_URI is
in a .inc)
You either need to change the SRC_URI or the generated checksum name.


