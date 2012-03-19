Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S9ea9-0008R7-SB
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Mar 2012 16:33:14 +0100
Received: by iaag37 with SMTP id g37so9422356iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2012 08:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=tahvxAievg/drHqRuLeLZ98S/1MdASfL8QyX0r8Fygs=;
	b=G2uVAgh+M12HmIJR0vW6KVof17mXU++e/u0iBSYF40SiRmUqnGDI3sIY2Nq1XtW9HF
	ga4APEzXV78gbqgXfmE1ek0WD+a/dg6k5QKdWI+nz+3FrNm+xgBOyapmuLrJFGqo11Re
	lbe2EMN8X2iSOAsLFI+OH5JGSYeVM+QYLbPbaAGxjdhV9h0DdtY+m8JgG723fwVxcPS8
	krqEelxn2O71OJ5qcbmS3Oqxq6t9ZJm2xArYI0Y/gflNl+LCf1Vvb2kKhd0WkYrpkA7z
	nygVjBq8TRXTlMyxzYmB66yUN6tKDs3b7rDRmrl9We+DfQo+dvZ53zdwEyICxb1V7ZEA
	MF9g==
MIME-Version: 1.0
Received: by 10.42.159.201 with SMTP id m9mr6916327icx.32.1332170661610; Mon,
	19 Mar 2012 08:24:21 -0700 (PDT)
Received: by 10.42.75.137 with HTTP; Mon, 19 Mar 2012 08:24:21 -0700 (PDT)
In-Reply-To: <jk7aa6$bjh$1@dough.gmane.org>
References: <1332103254-3729-1-git-send-email-schnitzeltony@googlemail.com>
	<jk7aa6$bjh$1@dough.gmane.org>
Date: Mon, 19 Mar 2012 16:24:21 +0100
Message-ID: <CALbNGRRx041cARMx4bWrZbOzoCJg5qL5v+i4s+mudXPMKAOgYw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe 1/6] mpd: initial add 0.16.7
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
X-List-Received-Date: Mon, 19 Mar 2012 15:33:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Mar 19, 2012 at 1:54 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> +DESC="The Music Player Daemon" +DAEMON=/usr/bin/mpd
>> +MPDCONF=/etc/mpd.conf
>
> The above hardcodes $bindir and $sysconfdir, which it shouldn't do.
mpd.in + sed in V2. OK?

> Furthermore I'd like to stop maintaining our own initsystem in meta-oe and
> switch to upstream initscripts as much as possible
The package itself does not contain an initscript so I implemented it
close to that found in debian-lenny package. What upstream source do
you suggest (matching also above requirement not hardcoding paths)?

> and include systemd units by default as well.
This requirement I did not know and did not find any source for that -
some suggestion?

> The above script is missing LSB headers as well.
This initscript as is does not need.

> Move EXTRA_OECONF above do_install
V2

regards

Andreas


