Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SvTX3-0005v0-7B
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Jul 2012 15:27:41 +0200
Received: by vbbfr13 with SMTP id fr13so3706684vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jul 2012 06:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=wCq0M8PDIzZXR3H0zJqFrgSeVvrBBQUgwQeLw8upK7c=;
	b=VGJz6t4oppUTzPfDwnkQXNldLJSK0nTbNI2c3+ndsA7bUMwELOKnKDtqaSZtcAVBoZ
	U4O377ObOd5pjuRoh3AotDSAgG0LSD9FS4Uxi4LxmCoFdSzm1WbfVBZciVcjXsZsPcHq
	tA9iqTCt3CcNbb7xVV2S6m57nJUDJasVtamIteyG6bh5sVfSJngj1jh9oYM4/6Knebin
	paMrnkCl6/ymBVcjVHHIH3Z9WlyH564bO2rSjGUhy4FNG7ePePs0BTYjeF3s/ipSft5e
	3TdFIstewxr6by4OiTUUsmcnTzuYQtyWicK4sNJgguteZeGwEDzVLRfzoqdbdhgxz7tW
	aiAg==
MIME-Version: 1.0
Received: by 10.52.90.52 with SMTP id bt20mr7072395vdb.42.1343567766414; Sun,
	29 Jul 2012 06:16:06 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.220.196 with HTTP; Sun, 29 Jul 2012 06:16:06 -0700 (PDT)
In-Reply-To: <20120729131359.GF3261@jama.jama.net>
References: <1343515918-20671-1-git-send-email-raj.khem@gmail.com>
	<1343515918-20671-2-git-send-email-raj.khem@gmail.com>
	<CAP9ODKrX04zfu_wVg317WPgc=u38niLtjmfkBiNrzfkTgBCbeA@mail.gmail.com>
	<20120729131359.GF3261@jama.jama.net>
Date: Sun, 29 Jul 2012 10:16:06 -0300
X-Google-Sender-Auth: 0EBdBYZns4jN-yNRIxHESTHgH_Y
Message-ID: <CAP9ODKoQPz2p4Qc+HtsRy_4EV-JwCgzhd=oO7RUyUbH4LjiM=A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-systemd][PATCH 2/2] busybox: stopping systemd-kmsg-syslogd is not needed
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
X-List-Received-Date: Sun, 29 Jul 2012 13:27:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Jul 29, 2012 at 10:13 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sun, Jul 29, 2012 at 10:10:48AM -0300, Otavio Salvador wrote:
>> On Sat, Jul 28, 2012 at 7:51 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> > systemd-kmsg-syslogd.service is discontinued in systemd so
>> > there is no need to stop it.
>>
>> I don't see a relationship in above description :-)
>>
>> Or we drop it completely or it needs to be stoped ;-)
>
> It's not installed by current systemd, so busybox-syslogd-systemd is
> failing (to start/stop) because it's trying to stop it.

Then the .systemd file needs to be removed, not the stop to be dropped.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


