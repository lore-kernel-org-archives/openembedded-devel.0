Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tnt5R-0008As-Sv
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Dec 2012 16:40:06 +0100
Received: by mail-wg0-f41.google.com with SMTP id ds1so3353045wgb.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Dec 2012 07:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=QTamIwQ25FaAozhCBS51Pqco4pwMIBQEN4GImSW+nNg=;
	b=Eua53Plmus7tHVW1K5lJVpC59Rjr/DUZRDiFuE97LoXnm8yklHp1fm3uODfVvpt1Ia
	Rw7fTplp2aEnG+j/2eOSqqWjGe/E469Z9cXoXFb8TXq+DhSjw0VROhdMrDH7NnqvwyqE
	rbUFso9gcAtiSH4ffT1mUm5xRNFVnfXCss/4Xra11o7x/Tq7WfYmS7+EesGgx9gjV+ok
	CC0eIxs7k4x64KbDpDY+aXxkkBZtT4jn6mKY8dJlWHCmq/7WGOC3PX+vBgzlyWWTsqwS
	oQGLH5PYiTG9oJ/y8p8t5hzs9nWfXxUOar8HvhHuO/p7KelXypCQCMhbo/xtVelCbfZS
	Rd8w==
MIME-Version: 1.0
Received: by 10.194.90.238 with SMTP id bz14mr35655176wjb.9.1356535512299;
	Wed, 26 Dec 2012 07:25:12 -0800 (PST)
Received: by 10.194.178.72 with HTTP; Wed, 26 Dec 2012 07:25:12 -0800 (PST)
In-Reply-To: <0E6348F0-C1BE-4325-818C-8F3CCACBA730@dominion.thruhere.net>
References: <kb31gs$u4d$1@ger.gmane.org> <3053324.FGHdgGAGGN@helios>
	<20121223194558.GL8988@jama.palm1.palmone.com>
	<20121226121055.GA8988@jama.palm1.palmone.com>
	<0E6348F0-C1BE-4325-818C-8F3CCACBA730@dominion.thruhere.net>
Date: Wed, 26 Dec 2012 16:25:12 +0100
Message-ID: <CA+chaQd1JKSiSi4gQDRsUOSWWEk2bMVXCce1D+wWuEnOLA2=fQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Ruby and meta-oe?
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
X-List-Received-Date: Wed, 26 Dec 2012 15:40:06 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 26, 2012 at 4:13 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
>
> Op 26 dec. 2012 om 13:10 heeft Martin Jansa <martin.jansa@gmail.com> het volgende geschreven:
>
>> On Sun, Dec 23, 2012 at 08:45:58PM +0100, Martin Jansa wrote:
>>> On Sun, Dec 23, 2012 at 07:40:51PM +0000, Paul Eggleton wrote:
>>>> On Saturday 22 December 2012 02:14:07 Koen Kooi wrote:
>>>>> What's the status on getting ruby recipes into a meta-ruby or meta-oe? I
>>>>> just had to import it into my working branch to build mkvtoolnix which needs
>>>>> ruby-native for its buildsystem (don't ask).
>>>>
>>>> The original author never replied to my suggestion about creating a separate
>>>> layer. Unless there are objections I'd suggest just creating a meta-ruby and
>>>> using the patches from patchwork to add ruby into it.
>>>
>>> Agreed,
>>
>> Btw: I'm doing this atm, but that recipe on patchwork didn't even have
>> LIC_FILES_CHKSUMs.
>
> I squashed 1/2 and 2/2 together, that makes ruby-native work

Ah I haven't seen 2/2 on patchwork because I was looking only on
"action needed" state. I've updated 2/2 to apply and will push it
later if ruby-native still builds OK.


