Received: from mail-ve0-f170.google.com ([209.85.128.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UYEh0-000487-6S
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 May 2013 14:03:57 +0200
Received: by mail-ve0-f170.google.com with SMTP id 15so1403959vea.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 May 2013 04:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=rwgRaxv2/+na8IQcS/Kgn3MUtZBroJXXhD+TewyEWnc=;
	b=r8uXIvv637XYxAEi7PXNGdffruS3ww3aNNNhbFDD0wPGhO+s5cjNIcgy/wv/bge05B
	kGTiMv+Dj88rsKZq6R6/qpEvOs/6VIK0VFwXrFH0FbDrEZahBFdP1W3u18a75bpIAx7H
	J18jj+aCGK+SVYT+Bu76ql0Y9Wni6ylv6r1HMUTt1xKXJJ7oEWCMjrRy+hUvsYxSEGLp
	Qm61QtAWdcCLPNPo+ep4YbuvN6l3HN2u/yeGdeycVK9E9eEiggi7YNH85QquIok1v4L5
	qzcmkHtEVha5wPDs8rPk5JypVKKCdLpbLf+eWxVmpatlQAE/pMpo36PE1uHjxnswe/gg
	BXUA==
MIME-Version: 1.0
X-Received: by 10.58.50.7 with SMTP id y7mr3548448ven.24.1367581470843; Fri,
	03 May 2013 04:44:30 -0700 (PDT)
Received: by 10.52.139.33 with HTTP; Fri, 3 May 2013 04:44:30 -0700 (PDT)
In-Reply-To: <20130503113522.GA3187@jama>
References: <1367087640-4264-1-git-send-email-schnitzeltony@googlemail.com>
	<1367087640-4264-2-git-send-email-schnitzeltony@googlemail.com>
	<20130427193111.GF3199@jama>
	<CALbNGRSZ-H-+0yZuf4uvYbLEqXdUzTuMLXMhc63BtrZPieYyLA@mail.gmail.com>
	<CALbNGRQ63OrcZY9i-qvc0ERzGTsnTMiY101dAgr7keNBVDrpWQ@mail.gmail.com>
	<CALbNGRSXsNgFksmktPkCq85O6dN+2R-RbZDk_R0CcqgxF8ytbw@mail.gmail.com>
	<20130503113522.GA3187@jama>
Date: Fri, 3 May 2013 13:44:30 +0200
Message-ID: <CALbNGRRXito-0zO5a6Htm8q9wx1mMM6Xw3yhCqKCFFsfJfcY8A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome/meta-xfce 1/4] gdm: fix postinst-code to unbreak first boot issues
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
X-List-Received-Date: Fri, 03 May 2013 12:04:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2013 at 1:35 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Thu, May 02, 2013 at 04:58:13PM +0200, Andreas M=C3=BCller wrote:
>> On Thu, May 2, 2013 at 4:48 PM, Andreas M=C3=BCller
>> <schnitzeltony@googlemail.com> wrote:
>> > On Mon, Apr 29, 2013 at 9:33 AM, Andreas M=C3=BCller
>> > <schnitzeltony@googlemail.com> wrote:
>> >> On Sat, Apr 27, 2013 at 9:31 PM, Martin Jansa <martin.jansa@gmail.com=
> wrote:
>> >>> On Sat, Apr 27, 2013 at 08:33:57PM +0200, Andreas M=C3=BCller wrote:
>> >>>> Exiting postinst code leaves systemd.bbclass offline postinst code =
unexecuted,
>> >>>> causes postinst not to finish at first boot (gdm.service is not ali=
ased to
>> >>>> display-manager.service -> started much too early) and is not necce=
sary:
>> >>>> language preparation can be done offline.
>> > Just learned that the chown code does not belong to do_install. Shall
>> > I send a V2 or a follow up?
>> I was too fast - it still discussed [1]
>
> Do you want me to apply these 4 and then add better fix in follow-up if
> needed? From that discussion it looks like you did all what you could in
> gdm :).
Yes please - otherwise I'll loose overview of patches around :)

Andreas


