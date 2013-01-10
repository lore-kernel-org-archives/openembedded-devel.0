Received: from mail-vb0-f52.google.com ([209.85.212.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TtH0a-0003qh-8Q
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 13:13:32 +0100
Received: by mail-vb0-f52.google.com with SMTP id ez10so380242vbb.25
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 03:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=7mOpbPwXtRtiiW1jmetbml3r4ZzfgNvp7kmdGZVE3hE=;
	b=LKlnXraVxevFkt3TJWNqURaJUPxAh7gjRGmzlD6hAQN8OTainlWRJV2W2d3vqoiafk
	2IAS4F9v5LWpu8/VT/xg+kD6BXAt61W5aW+GCrgZRhTkcxJIQpu9epU+pxQFSeNkCg4D
	DKDMQSxEeNZNsLWN7ku4n6Nmf6espD1NHXi6DY6mPwKtB6LhtxdRLPPLMPsr1sEZ4lSk
	uHjO+flTiq6ddIloUrVQcB9NMj72HbUKuAjA8YBB2pkWDKIddVcoK7hEQAeBBVmf/Hn1
	JyWZRC1PzGmyQKx2+LAjoz3t2GZn9VIvh5iOjJhOHDh3B6LBI5qYygO02CIoJot5T1+j
	uRDw==
MIME-Version: 1.0
Received: by 10.220.155.137 with SMTP id s9mr4529366vcw.47.1357819086683; Thu,
	10 Jan 2013 03:58:06 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Thu, 10 Jan 2013 03:58:06 -0800 (PST)
In-Reply-To: <CALbNGRTY2_cAeE8GPKsLxiQE8iJaAVsOfe_9rpBRP0NcQ7LpXA@mail.gmail.com>
References: <1357814691-1724-1-git-send-email-noor_ahsan@mentor.com>
	<CALbNGRTY2_cAeE8GPKsLxiQE8iJaAVsOfe_9rpBRP0NcQ7LpXA@mail.gmail.com>
Date: Thu, 10 Jan 2013 12:58:06 +0100
Message-ID: <CALbNGRQYhMrEFDhbBPAcPyEejp9GkhuLwo4uStJCLP64Ap_Bpg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] autofs: Remove systemd related things.
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
X-List-Received-Date: Thu, 10 Jan 2013 12:13:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2013 at 12:53 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Thu, Jan 10, 2013 at 11:44 AM, Noor, Ahsan <noor_ahsan@mentor.com> wro=
te:
>> From: Noor Ahsan <noor_ahsan@mentor.com>
>>
>> * Autofs was being inherited from systemd. This class is only
>> present in meta-systemd. So bitbake was giving parse error
>> about systemd class. So removed systemd from inherit and
>> removed SYSTEMD_PACKAGES and SYSTEMD_SERVICE.
> Is this still true after auto BBMASKing?
I misread the patch so please forget previous mail. But it would be
nice to have an systemd append.

Andreas


