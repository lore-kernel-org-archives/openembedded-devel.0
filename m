Received: from mail-oa0-f48.google.com ([209.85.219.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U2OOX-000613-En
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2013 16:55:50 +0100
Received: by mail-oa0-f48.google.com with SMTP id j1so5330039oag.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2013 07:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=un7IPTuCoNQFkIysW6JKJv1SZNCMYM3ikFx52WpgzKI=;
	b=1Bbhm60WvSh21EdlW/IwGassHF7lfvaJrftO7CkTQ+mXQ2mTwmx5Oi24sQ4ZMulgjg
	eOdsZUQjfrgoS3zHZuUhoh4w5PfnSwnjDLJKeQXSnbcSIgnHwks5Hsvl8bkPwBNvRPcD
	/TBjg7cPSCYMADCxHKY78NSU2Nx90mruyX4U8F9+rf68zF7SJ0d7WN/ZUtMhYv2eX00F
	LyQj0TtBRoB7vQofazVnOYT/NmQgrhoYmgkXV+z8AxHpSt6HEhjB6DDOo3Wo5epqBKDu
	13bsBcYD+w05CAFYYqX8w8ZBlBhX+EFzvlWErvyN0rVvVa+YQlup9rYqC/pF8NvYSUPN
	O8rQ==
MIME-Version: 1.0
X-Received: by 10.182.232.65 with SMTP id tm1mr15635454obc.32.1359992396172;
	Mon, 04 Feb 2013 07:39:56 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Mon, 4 Feb 2013 07:39:55 -0800 (PST)
In-Reply-To: <CALbNGRRYh06qkphJ-sJx=Qn46cpdh2=vcDNu097e5ACYxhZa5g@mail.gmail.com>
References: <1359982426-9836-1-git-send-email-mario@ossystems.com.br>
	<20130204120212.GA3271@jama>
	<CALbNGRRYh06qkphJ-sJx=Qn46cpdh2=vcDNu097e5ACYxhZa5g@mail.gmail.com>
Date: Mon, 4 Feb 2013 13:39:55 -0200
X-Google-Sender-Auth: h7HkOr-X3CSriNHoXRfjtsFdqHg
Message-ID: <CAP9ODKqaPYLTpwWvo82hhQq3qjzR8Mf7q5OdGqn6gx8JU1CLVw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 04 Feb 2013 15:55:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 4, 2013 at 11:49 AM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
...
> I can't see what this patch fixes. From my point of view we have currentl=
y:

This allow us to re-run it from a running system; in our use-case user
might want to re-run the colibration and without this patch it does
not work.

> * two conflicting/racing start types systemd and xdg/autostart
> * systemd service fails always - it doesn't know which display to use
> (error message something like 'cannot connect to xserver')
> * xdg/autostart sometimes fails because the touchscreen devices are
> not yet known to xserver (error message something like 'no devices to
> calibrate devices found'). This causes calibration being started from
> time to time.

You need to consider the use of serial touchscreen as well; we have
here one which we can test your proposed patch. Bear on mind that user
might want to run the calibration *again* so a script to support this
needs to be add as well.

> I am working on a complete different solution (udev/systemd automatic
> start) but need a few days to iron out & test. Can we wait few days
> before applying this to give me the chance to send an alternative?
> Sorry for this but I spent of efforts till now and wand to avoid
> rebasing.

If you plan to add support to our use-case too, sure. :-)

Regards,

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


