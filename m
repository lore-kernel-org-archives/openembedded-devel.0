Received: from [209.85.146.182] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MNhmW-0001nz-1g
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Jul 2009 08:34:28 +0200
Received: by wa-out-1112.google.com with SMTP id j4so585874wah.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Jul 2009 23:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=INVsgtIn2s1TA83bZMqQHMQuVmcm+27PAukGz3+8dUA=;
	b=qDEli/b3t+G4MrqgBUGh306uWyzTulE9hUxWfkGUSgXjaj0A+MHo7aCWF7imL/lZSh
	EuAbWk8AaRbeJKVFVpJ9oAvOfB8ms+DcaATXW+xZHIEUPN2kJ8o4hmBwJzcnt78WIw7k
	Kwxl9DTZsDpgyb3vuboJjt8w9KY9kSr993azE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=O84UQTeY/xZgEXXZYASX8rc6+ExxqL9SDeBuJfpDTg00k8uGT4899U4gczIKQE31mz
	57SBMiv04ds6l6WZCouJVSD3SV0BUXpzHhd6EtWqWRMoZKakFVCSc0MIWkg1knCNzcH2
	izgsBe1YMoE0jz8xwucWuRiOFxnZdR+G1aEiU=
MIME-Version: 1.0
Received: by 10.115.106.14 with SMTP id i14mr6995040wam.77.1246861322443; Sun, 
	05 Jul 2009 23:22:02 -0700 (PDT)
In-Reply-To: <loom.20090704T072427-524@post.gmane.org>
References: <64d5b90a0907032223t749b13ffy95305639fcf3e654@mail.gmail.com>
	<1246691571.16040.20.camel@lenovo.internal.reciva.com>
	<loom.20090704T072427-524@post.gmane.org>
Date: Sun, 5 Jul 2009 23:22:02 -0700
Message-ID: <19c1b8a90907052322w2f2e590ch8498331b1608539c@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: (Possibly grave) error with Busybox recipe ?
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
X-List-Received-Date: Mon, 06 Jul 2009 06:34:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/4/09, Kirtika Ruchandani <kirtibr@gmail.com> wrote:
> Phil Blundell <philb <at> gnu.org> writes:
>
>
>>
>> It's intentional that busybox doesn't ship most of those files.  Was
>> there a particular one that was causing you a problem?
>
> Ok. I haven't tested my image as yet but I posted here because I saw
> ls,mv,cp
> and other utilities under /busybox/bin being excluded out of the packages as
> seen in the pastebin,

They are also provided by coreutils. Is coreutils being included in your image ?

-Khem


