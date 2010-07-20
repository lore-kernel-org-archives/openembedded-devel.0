Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Ob8lJ-0005nk-Mi
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 11:05:23 +0200
Received: by fxm12 with SMTP id 12so2632450fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 02:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=6PJqzigDGOOqndGmc6zCCuGjICed+JUlzy0qxp1CcN4=;
	b=pygW3iy98sgOQxAW2/yO2uaCcaPcwAj3NQMuR15VHB1nHuk9I4NaxXdJcSSZJR2hVQ
	3DnAf/5mgEWuAsTVwTVvLNdvHa97rVoNxgZKQ6GhlLhxJ9kPVD6GVKI1DZn2xqaz3VXa
	fk0v+TVrOT8r1E33s/llO2Lh2nEQ5oBzPOHNk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=HlrVFzAwhFh6lba7oXvhMKn2TWzb1UMYf4O6gmbV1Fclvl+T4ax7yCDEeezJOh6KHu
	T9ejTtsIhY5R3uap2YenMaQIIQqiJPmH36bvxskbqffuARYA3iAKKK9oJtZOEifMqfxQ
	3z4K68VeFd3yJnqon9TUKv6uCLHMDqjUxGFEM=
MIME-Version: 1.0
Received: by 10.223.119.198 with SMTP id a6mr4952231far.66.1279616705933; Tue, 
	20 Jul 2010 02:05:05 -0700 (PDT)
Received: by 10.223.117.75 with HTTP; Tue, 20 Jul 2010 02:05:05 -0700 (PDT)
In-Reply-To: <AANLkTikC9w3lRbPPKsJTm3X5fKo0jU778xfQ7vOT7Npn@mail.gmail.com>
References: <1271752342-17886-1-git-send-email-vjensen@gmx.de>
	<20100420161553.GA12219@denix.org>
	<alpine.LNX.2.00.1006040532220.5274@asterix.crazy-teaparty.dyndns.org>
	<AANLkTikC9w3lRbPPKsJTm3X5fKo0jU778xfQ7vOT7Npn@mail.gmail.com>
Date: Tue, 20 Jul 2010 11:05:05 +0200
Message-ID: <AANLkTin2vHt0CQOPuVtDBVFw-gO2bQ9aPyecWPOFWlgW@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: base_do_compile() accepts GNUmakefile as Makefile
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
X-List-Received-Date: Tue, 20 Jul 2010 09:05:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 4, 2010 at 2:50 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> On Thu, Jun 3, 2010 at 11:39 PM, Vitus Jensen <vjensen@gmx.de> wrote:
>> On Tue, 20 Apr 2010, Denys Dmytriyenko wrote:
>>
>>> On Tue, Apr 20, 2010 at 10:32:22AM +0200, Vitus Jensen wrote:
>>>>
>>>> GNU make will look for GNUmakefile, makefile and Makefile. =A0GNUmakef=
ile
>>>> isn't recommended but used by some programs, e.g. canutils.
>>>>
>>>> Signed-off-by: Vitus Jensen <vjensen@gmx.de>
>>>
>>> Acked-by: Denys Dmytriyenko <denis@denix.org>
>>
>> Could someone please apply that patch? =A0Now that it's acked by two
>> developers.
>
> Applied, thanks!

Applied to org.openembedded.dev now. No idea where it was lost..


