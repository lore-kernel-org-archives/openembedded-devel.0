Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PzGNK-0000s6-5N
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Mar 2011 23:36:30 +0100
Received: by iyb26 with SMTP id 26so2500iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2011 15:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=+1f+rYP0BkrgDpPR4Vobk5ntfAyVO5WpcdWKPIfpMCk=;
	b=fbfXQ5QrMVVdoKVrqrOXI1rUDKUYxS7ZI9LPe/OD2JHSoj3YglxdOiJXY3vcvKVkoo
	g0o18MRqdbf3DjYWPUuE6BS+ibTlVzyQ8FgG6+Ud/NNOfCUJEqZaNgOb1BkN3CJoEpnm
	HBqvCNovqdBu41dJhE3FFfFLQWlRvLnWqtHOs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=aihVo3muCBDBovKF1BHnXmK4CHfZ1x0yMvbPcgTVbBDXMIERgBozzQS7vA19rC2htu
	Ezja6xWI9lsYXd6VGKRUwMxrOEVKlKqzv8Bq0auNiY40M5ytGFt5r8hGjRUsJ0FXsZRb
	1Wn7xfKNHoEzQGO7Z/3jOUc51dGNC2VkkWZGE=
Received: by 10.42.176.197 with SMTP id bf5mr306253icb.267.1300142085028; Mon,
	14 Mar 2011 15:34:45 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.42.176.137 with HTTP; Mon, 14 Mar 2011 15:34:25 -0700 (PDT)
In-Reply-To: <4D7E953E.2000706@balister.org>
References: <4D7E3B34.5050100@mentor.com> <4D7E953E.2000706@balister.org>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 14 Mar 2011 15:34:25 -0700
X-Google-Sender-Auth: N20R41Yf3peqfFE3oUWlSrUuly4
Message-ID: <AANLkTin11HwrgRnF8tXj8prnr5G2yeX0id8DFMz1QtdU@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Discussion: Version retention policy in oe-core
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
X-List-Received-Date: Mon, 14 Mar 2011 22:36:30 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 14, 2011 at 3:22 PM, Philip Balister <philip@balister.org> wrote:
>> The TSC has discussed this item at the request of the community and has
>> come up with the following recommendation which we are looking for
>> feedback (positive/negative/neutral) before putting this up on the wiki.
>
> Looks reasonable. One thing I did not see is asking people not to add a new
> recipe and delete the old one in separate commits. This makes it easier to
> figure out problems when they arise.

I'd think this is a smaller piece of the general commit policies, and
in particular, bisectability, rather than version retention in
particular -- having a commit in the history where the recipe doesn't
exist would certainly violate bisectability, as it's hard to build
something that doesn't exist ;)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


