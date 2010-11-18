Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PJ5Az-0005wF-NB
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 15:09:26 +0100
Received: by wyb34 with SMTP id 34so3378290wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Nov 2010 06:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=6QFHMZKVIoojgJlFzeRqQ/QiDv9QhNqVUB3tG0ToQck=;
	b=xMd2NL9d1+ePbh0hCIYmv2Yc/rB2yiZEnkSB7F3p43B8IMzr48F+yEAiPmZRZcRDkv
	KAqXvpXkVS3tCoBYtZWLS0pEla4gIE8d3vZO7qhR6Fu/LAbTEiG0/YjqnAonUScVIEnm
	3eBw5O6jTonECXtDYIrMZVVMjI1mVpGkyug9I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=pA6cOyczOYvd6XTkTHlHZ176Rx6J32396y8zR3P1NdpxTpSxAYuek+AJsk2XqyatFO
	MuKb/a5g2mHFv6RoP5rXDGDTK9fE94/B5FUAKlIwJZPojbZ9KfIn1gTOXfnhhy7mTEbh
	UX5QUk03DlPPjBtBa91wMupE4FmVzHzlS4Xm4=
Received: by 10.216.154.8 with SMTP id g8mr3097156wek.12.1290089288554; Thu,
	18 Nov 2010 06:08:08 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Thu, 18 Nov 2010 06:07:48 -0800 (PST)
In-Reply-To: <AANLkTin4uoJzqtd0G5Z+gS_Y+-kxpgojKm92jkJ8jnLy@mail.gmail.com>
References: <AANLkTi=4sU4238+b8zyJJ35VCyJB2ysestx9N=_my697@mail.gmail.com>
	<ic06a8$uft$1@dough.gmane.org> <4CE3A6DE.2070203@xora.org.uk>
	<ic0aj2$hqc$1@dough.gmane.org>
	<AANLkTimdqZ1hdZNPN70LXd1WuJSn4pU2y=2C5tZs0-LT@mail.gmail.com>
	<1290074903.3183.202.camel@mill.internal.reciva.com>
	<AANLkTin4uoJzqtd0G5Z+gS_Y+-kxpgojKm92jkJ8jnLy@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 18 Nov 2010 07:07:48 -0700
X-Google-Sender-Auth: msbS1K3o6w1ZdXfrVtEdnIgvO68
Message-ID: <AANLkTi=7ixLgaKr5LKxsfgtJyCPaaxBrWkmOih9GHnq3@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Preparing for release - Freeze on master
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
X-List-Received-Date: Thu, 18 Nov 2010 14:09:26 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 18, 2010 at 4:09 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> 2010/11/18 Phil Blundell <philb@gnu.org>:
>
> >
> > 1. make a stabilisation branch from some semi-arbitrary point, maybe one
> > of the existing weekly test versions.
>
> Seems fine with me. I suggest to start with the testing branch that is
> to be made today.
> that avoids having to pick the changes that are done for the release
> on the master branch last week.
>

Just a reminder that this stabilization branch should only exist from this
semi-arbitrary point to the point when the release is tagged -- the branch
should then be removed, to ensure no one thinks it is a long term
maintenance branch, which it is not.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

