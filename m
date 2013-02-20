Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1U84EX-0002mH-Lv
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Feb 2013 08:36:55 +0100
Received: by mail-ob0-f175.google.com with SMTP id uz6so7353050obc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2013 23:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=sAYEqOUxkQsvpvjN2xp+IW3ERGRr08qMHT4QHu/Wc+0=;
	b=DLpYJVYqx2RBNqXvEynF9TgAgFkLCQn+So7PBtFBE6RNZVoAPGf+L32mGMNYt++6Om
	VmGPaHvU587IaXD+isn22ZplfXLCDYaAv+7zJgPJRVu7wMLaf6Qo7f7SANkhsbruc9yC
	5at0+9SDp8NaUpeH44pACsEf3t/qUCSFwpVbT1d+URE8GgP6mIFMPvhk8x2ZBi5kzubt
	B8XhZZpQoTylN5jqWX3BcccbwTI+g9OTrqG6C2fE8ns9YMiTaqs15XaVZHu/zgCca0hH
	RACE2BJQd9wcQLc0GKvIMq1tAhpQT2GtiC5BiOutmW4r5OWvIq0ncnZPWFYOJFMrFbWW
	6uDg==
MIME-Version: 1.0
X-Received: by 10.60.19.101 with SMTP id d5mr5256938oee.115.1361344842918;
	Tue, 19 Feb 2013 23:20:42 -0800 (PST)
Received: by 10.60.76.199 with HTTP; Tue, 19 Feb 2013 23:20:42 -0800 (PST)
In-Reply-To: <20130220070843.GB23580@sakrah.homelinux.org>
References: <20130109101310.38A4C103A7@opal>
	<CAGiJk9fX-W=P_5z_e45NwU+Nj3CSc4ozdS3_WyVyVtQyEWc5bw@mail.gmail.com>
	<lyobgvykjp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20130220070843.GB23580@sakrah.homelinux.org>
Date: Wed, 20 Feb 2013 08:20:42 +0100
Message-ID: <CAGiJk9eRf5edo-5r6YBXKkjzv9bMOnv8tBsuBPBy+UVLCtq5CQ@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Khem Raj : dhcp: Add systemd unit file for dhclient
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
X-List-Received-Date: Wed, 20 Feb 2013 07:36:55 -0000
Content-Type: text/plain; charset=UTF-8

2013/2/20 Khem Raj <raj.khem@gmail.com>:
> On (11/01/13 13:24), Enrico Scholz wrote:
>> Samuel Stirtzel <s.stirtzel-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>> writes:
>>
>> >> +ExecStart=/sbin/dhclient -cf /etc/dhcp/dhclient.conf -q $INTERFACES -lf /var/lib/dhcp/dhclient.leases
>> > ...
>> > systemd[1]: PID file /var/run/dhclient.pid not readable (yet?) after start.
>> > [FAILED] Failed to start Dynamic Host Configuration Protocol (DHCP).
>> > See 'systemctl status dhclient.service' for details.
>> >
>> >
>> > Any idea why it is missing?
>>
>> probably a '--no-pid' option
>
> how is /var/run setup in your case ? may be its not existing for some
> reason
>

Hi,

/var/run exists, there is just no PID file for dhclient.
The service however explicitly states that it wants one
"PIDFile=/var/run/dhclient.pid".


--
Regards
Samuel


