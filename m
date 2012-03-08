Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S5h4i-0002eF-SD
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Mar 2012 18:24:25 +0100
Received: by iaag37 with SMTP id g37so904693iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Mar 2012 09:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=2xMUTboGeukBiBgq7g5bLngv7wSQ7XMfygpgfHi9q8Y=;
	b=DG65UqepFIoCQAlyWtTqTzIbnvX3fBU1Im3zFiMCftKaFcZYhIBkpWUavEIkqiu9sj
	FfleAzMgt+u0+z3v7LDfope5vB9BwrM3SwKb5n37gxEjQhZUZNViW5bXjJ/zPVvenUeV
	uNJzmYSQJkRRv26jVHk/1HDymuhMfdRFuAtx+dYFpUqlR3kkMclnAqRNuhTIwcLyCtz+
	WT3fpaqRVPVlVfAh04dX1+O7ZiHgJkAL3fEZ/VrQXnXoBzA2/V0EZLuiWglfjRemREg6
	QOA0paBm+rxVyve+ZUXHRNiHZUOw6OiQtywW29xmo4+pB2L1cp+TLCGKNHPqBlyeSJP/
	q2+g==
MIME-Version: 1.0
Received: by 10.50.154.169 with SMTP id vp9mr7779115igb.61.1331226945658; Thu,
	08 Mar 2012 09:15:45 -0800 (PST)
Received: by 10.42.75.137 with HTTP; Thu, 8 Mar 2012 09:15:45 -0800 (PST)
In-Reply-To: <CALbNGRTiaqQQPb_UqkCKrevZYJk4+LLUh9E2VDzAcHHC6v_sTw@mail.gmail.com>
References: <1331025741-26216-1-git-send-email-koen@dominion.thruhere.net>
	<1331025741-26216-2-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKo+i3d31+xUt8RnOgFeDQbUw4hSkHeoR1LomZvxF5oa8A@mail.gmail.com>
	<CAP9ODKovkJ_pHu+-__yUA=tshBiBvQwuJN7xN93P_6nrViZULw@mail.gmail.com>
	<CALbNGRTiaqQQPb_UqkCKrevZYJk4+LLUh9E2VDzAcHHC6v_sTw@mail.gmail.com>
Date: Thu, 8 Mar 2012 18:15:45 +0100
Message-ID: <CALbNGRT1iEb8G=OXNog5aU9CZgO1j_Gc8bmD_pbDQ9UU96YL-Q@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2 2/3] systemd: enable logging to disk instead of tmpfs
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
X-List-Received-Date: Thu, 08 Mar 2012 17:24:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 6, 2012 at 1:21 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> On Tue, Mar 6, 2012 at 12:59 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> On Tue, Mar 6, 2012 at 06:22, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>>> + =A0 =A0 =A0 # create dir for journal
>>> + =A0 =A0 =A0 install -d ${D}${localstatedir}/log/journal
>>
>> I am not against it creating the path for storing the logs but the
>> default configuration ought to use a memory buffer IMO.
>>
>> What people think?
>>
> To make up mind: Which amount of memory do we expect per boot
> approximately (uncompressed/compressed)?
>
I played around with this a bit: After boot & starting GUI there is a
single file of ~600kB. After working with the system for few days the
contents of the folder grew up to ~40MB.

After reading journal design document [1] it seems that 'rotating'
scales with maximum size available.

My personal opinion: since RAM is most expensive prefer flash/disk as
default ( as Koen already pointed out this default can be simply
overridden by deleting /var/log/journal [2][3] )

so

Acked-by: Andreas M=FCller <schnitzeltony@googlemail.com>

Andreas

[1] https://docs.google.com/document/pub?id=3D1IC9yOXj7j6cdLLxWEBAGRL6wl97t=
FxgjLUEHIX3MSTs
[2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-March/0384=
27.html
[3] http://lwn.net/Articles/474968/


