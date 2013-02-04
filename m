Received: from mail-vb0-f46.google.com ([209.85.212.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U2OZ9-0006tY-1g
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2013 17:06:43 +0100
Received: by mail-vb0-f46.google.com with SMTP id b13so3923090vby.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2013 07:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=zbA8xbqJGOezVaIupCr3uYuJuze6GFI5H9ULzmFT1FM=;
	b=fJXjJmP+yAvpVZplRDy8rkm97n+DrqgkazJeJDffg2g3YlB0qNd1Dil/Is21ZCYjKa
	yoft7aAiuiOK9Z0146HEj3SRkmeYW96i6dTchjyRk7BKVoy5eyBbYk2phFONjNfRU9aO
	GkfNBVajzqyHcCuAid30w1NAfgUorbDar2ZuNsgtPKeSfdFi9+z5DLUqpyPvHHp4KcmZ
	gmlTekwCLMCRVf6JxfzpngoD46qR0fburv7kJ6zrq7E3Kz8JXAewMovEJBK9sHEG2L56
	guUITu/ce9t+DaMU12VTKDFwxasWlgVAKNBgYI/IWInHBRrEEGkpkNCGirOOKu71R9AH
	0Yag==
MIME-Version: 1.0
X-Received: by 10.52.88.237 with SMTP id bj13mr8114292vdb.75.1359993053886;
	Mon, 04 Feb 2013 07:50:53 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Mon, 4 Feb 2013 07:50:53 -0800 (PST)
In-Reply-To: <CAP9ODKqaPYLTpwWvo82hhQq3qjzR8Mf7q5OdGqn6gx8JU1CLVw@mail.gmail.com>
References: <1359982426-9836-1-git-send-email-mario@ossystems.com.br>
	<20130204120212.GA3271@jama>
	<CALbNGRRYh06qkphJ-sJx=Qn46cpdh2=vcDNu097e5ACYxhZa5g@mail.gmail.com>
	<CAP9ODKqaPYLTpwWvo82hhQq3qjzR8Mf7q5OdGqn6gx8JU1CLVw@mail.gmail.com>
Date: Mon, 4 Feb 2013 16:50:53 +0100
Message-ID: <CALbNGRTwAJbtFjC+UotFLq2Lfp+em_GACX8x9E-GbOcMaXF6nw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [PATCH] xinput-calibrator: add --boot-mode comand line option to wrapper script
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
X-List-Received-Date: Mon, 04 Feb 2013 16:06:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 4, 2013 at 4:39 PM, Otavio Salvador <otavio@ossystems.com.br> w=
rote:
> On Mon, Feb 4, 2013 at 11:49 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
> ...
>> I can't see what this patch fixes. From my point of view we have current=
ly:
>
> This allow us to re-run it from a running system; in our use-case user
> might want to re-run the colibration and without this patch it does
> not work.
>
>> * two conflicting/racing start types systemd and xdg/autostart
>> * systemd service fails always - it doesn't know which display to use
>> (error message something like 'cannot connect to xserver')
>> * xdg/autostart sometimes fails because the touchscreen devices are
>> not yet known to xserver (error message something like 'no devices to
>> calibrate devices found'). This causes calibration being started from
>> time to time.
>
> You need to consider the use of serial touchscreen as well; we have
> here one which we can test your proposed patch. Bear on mind that user
> might want to run the calibration *again* so a script to support this
> needs to be add as well.
>
>> I am working on a complete different solution (udev/systemd automatic
>> start) but need a few days to iron out & test. Can we wait few days
>> before applying this to give me the chance to send an alternative?
>> Sorry for this but I spent of efforts till now and wand to avoid
>> rebasing.
>
> If you plan to add support to our use-case too, sure. :-)

Hope I get it done soon (give me till end of week max) - your use-case
included :)

Andreas


