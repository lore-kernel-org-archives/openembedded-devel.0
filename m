Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Sy8hI-00071A-L5
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 23:49:16 +0200
Received: by lagv3 with SMTP id v3so771546lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Aug 2012 14:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=c2twAVGjWgNqJiulwDimL4IwIVpcLSvrFzpnON7Lxy8=;
	b=qzR5TOun/0q1Ki0B/TR/XiDjsdy9YyIJ3/SKG6gvibgmHFHMIxYf1V5TVUZ/muxQA7
	VDohdbDEv/D57Lxntw8u2tTAVIdjEKa1TcLopJ134kJzRjN+zwLk75GA0dp8Y9HwuH+T
	YljgQ1d23doTdkNOmUDzuOXUBdVu0Km14y63Ai0SljwGgeSsaqQHY5ngm8KyjgnfBjd2
	jTqwVXYazy+DJ/EWrsLfO38g4LGoxsE28L9U66Lu0RCYagf/yq/uWnSoBDfa7hi0gTi2
	H6vYu4WJCFWGSHfUI1BxWXPRGVQxzCKCY26fiMPm/Lsjq5Iayx99tHoj+YzLR7KYhbUR
	4F0w==
Received: by 10.112.30.41 with SMTP id p9mr3788131lbh.26.1344202652845; Sun,
	05 Aug 2012 14:37:32 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.209 with HTTP; Sun, 5 Aug 2012 14:37:12 -0700 (PDT)
In-Reply-To: <jvlm56$r75$1@dough.gmane.org>
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
	<1343760977-3290-6-git-send-email-raj.khem@gmail.com>
	<jvk13l$nh$2@dough.gmane.org>
	<CAMKF1sqBGOR=f-e+D8zrguifFbsRzkVLtLsOCf4rxaGKiwPK2Q@mail.gmail.com>
	<jvlm56$r75$1@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 5 Aug 2012 14:37:12 -0700
X-Google-Sender-Auth: 9O8NX8KjOzIgJ7LGGI7AZuoCUNk
Message-ID: <CABcZANnEmASgH3wrk7TZOpe3BaK+o6oRPyvAo6SadtybgqDWJg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH V2 6/7] blacklist.bbclass: Move to meta-angstrom
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
X-List-Received-Date: Sun, 05 Aug 2012 21:49:16 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 5, 2012 at 4:41 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> doent sound logical to me. Would it be acceptable if angstrom used this
>> feature from OE-Core as well ? then it will remove the usecase
>> completely.
>
> I keep waiting on the person that pushed it to oe-core to provide patches
> for distro layers using the old functionality, see above.

This doesn't make much sense to me. It's impossible to know what all
layers use a given piece of functionality, particularly ones that
aren't published in public places, so expecting every person changing
something in oe-core will go and submit changes to every layer that
exists is entirely unreasonable. If you maintain a layer, it's your
responsibility to make sure your layer retains compatibility with
upstream. It's not upstream's responsibility to make sure everyone
using their functionality stays compatible.
-- 
Christopher Larson


