Received: from mail-ie0-f169.google.com ([209.85.223.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U8Qhu-0001S4-Bt
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Feb 2013 08:36:43 +0100
Received: by mail-ie0-f169.google.com with SMTP id 13so11186813iea.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2013 23:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=EFqpGXHuBN/uj3g/oJ+G7ToK2MH1rCrVesywnBOp8Ok=;
	b=FL3x5N2igU+3NhaVudaTNvQGrZARSMOFVOo/cHrv6ud+S3zBy042XhG+gtTKYlsRth
	dB6aGZEp2pj3RLt6mq6kbf+FHXf29gR0MF9LI3BSasdTJEnYElILeYr/ZoQ/6XpZ996q
	sAIvN17gc8mI3ntrOumE2PdE8lVDkjABu/wsiojWVoVfEdeKZz9CeJgb35MDwMBMczHv
	1bFQk6ktF2u88u5nLZog1P8vIXO7CU4VXmOUBdjZOBnI7BNeZRjUHEoMaPPnhJPGtnUx
	RZrwTNzvR4d3ehSmsyjR1mJJPOGY6UhcuWkJXTo1FD0bBztG2Ap65d8xU6UIZorIHl4e
	jHWA==
X-Received: by 10.50.57.232 with SMTP id l8mr12914252igq.49.1361431230089;
	Wed, 20 Feb 2013 23:20:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.192.134 with HTTP; Wed, 20 Feb 2013 23:19:59 -0800 (PST)
In-Reply-To: <CAGiJk9eRf5edo-5r6YBXKkjzv9bMOnv8tBsuBPBy+UVLCtq5CQ@mail.gmail.com>
References: <20130109101310.38A4C103A7@opal>
	<CAGiJk9fX-W=P_5z_e45NwU+Nj3CSc4ozdS3_WyVyVtQyEWc5bw@mail.gmail.com>
	<lyobgvykjp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20130220070843.GB23580@sakrah.homelinux.org>
	<CAGiJk9eRf5edo-5r6YBXKkjzv9bMOnv8tBsuBPBy+UVLCtq5CQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Feb 2013 23:19:59 -0800
Message-ID: <CAMKF1sqWz2MYeMzYqs2U0eVZR3w4MoX9Ndx95a3Xb1cM-phYnw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 21 Feb 2013 07:36:44 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 19, 2013 at 11:20 PM, Samuel Stirtzel
<s.stirtzel@googlemail.com> wrote:
> 2013/2/20 Khem Raj <raj.khem@gmail.com>:
>> On (11/01/13 13:24), Enrico Scholz wrote:
>>> Samuel Stirtzel <s.stirtzel-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>>> writes:
>>>
>>> >> +ExecStart=/sbin/dhclient -cf /etc/dhcp/dhclient.conf -q $INTERFACES -lf /var/lib/dhcp/dhclient.leases
>>> > ...
>>> > systemd[1]: PID file /var/run/dhclient.pid not readable (yet?) after start.
>>> > [FAILED] Failed to start Dynamic Host Configuration Protocol (DHCP).
>>> > See 'systemctl status dhclient.service' for details.
>>> >
>>> >
>>> > Any idea why it is missing?
>>>
>>> probably a '--no-pid' option
>>
>> how is /var/run setup in your case ? may be its not existing for some
>> reason
>>
>
> Hi,
>
> /var/run exists, there is just no PID file for dhclient.
> The service however explicitly states that it wants one
> "PIDFile=/var/run/dhclient.pid".
>

In my case pid file exists and I dont get this error so wondering what could
be different in your case.

>
> --
> Regards
> Samuel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


