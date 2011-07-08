Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1Qf0ZU-0006Mx-KL
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jul 2011 04:13:36 +0200
Received: by iym10 with SMTP id 10so1493485iym.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jul 2011 19:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=A1Rr3yobTe/I+2IgZrkk3gYxOK5KzQ12rhSbL+kN81Q=;
	b=cZDfO4SCHYS+1HHghjSrTpDW2ZNe3KZ30XLrBky2eTNfOqRn70J+5IhSJNn1HP8tic
	QBDSDiOoDLbywDdLAae9uoL68vPcBmept61cz8I85puBNbeNPPb0nJGKpUB8KuPmBXpo
	uQ++nOtvCh2mFCDUc6qNNkxsMtmBwDXycXs2k=
MIME-Version: 1.0
Received: by 10.231.111.39 with SMTP id q39mr1231521ibp.106.1310090982177;
	Thu, 07 Jul 2011 19:09:42 -0700 (PDT)
Received: by 10.231.174.73 with HTTP; Thu, 7 Jul 2011 19:09:42 -0700 (PDT)
In-Reply-To: <1310022018.4532.21.camel@mattotaupa>
References: <1310017138-8936-1-git-send-email-agnel.joel@gmail.com>
	<1310022018.4532.21.camel@mattotaupa>
Date: Thu, 7 Jul 2011 21:09:42 -0500
Message-ID: <CAD=GYpaAHX=RiS98pXAqE3bRbBs6gsbXQoSCdcs8+9u=2F267w@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Paul Menzel <paulepanter@users.sourceforge.net>
Cc: jdk@ti.com, joelagnel@ti.com, openembedded-devel@lists.openembedded.org,
	beagle@list.ti.com, k-kooi@ti.com
Subject: Re: [PATCH v2] pulseaudio: Run as system-wide instance instead of per-user
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
X-List-Received-Date: Fri, 08 Jul 2011 02:13:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Thanks for your email.

On Thu, Jul 7, 2011 at 2:00 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear Joel,
>
>
> Am Donnerstag, den 07.07.2011, 00:38 -0500 schrieb Joel A Fernandes:
>> * Pulseaudio running as per-user is opening audio devices and blocking e=
veryone else from getting access
>> =A0 to the device. The problem is it doesn't even seem to be allowing ap=
plications to connect to it, this
>> =A0 patch starts it up in system mode instead which is tested and known =
to work
>
> thank you for the patch. Could you post your error and check with the
> PulseAudio guys what the cause is? There are very responsive on their
> mailing list, which moved to freedesktop.org recently.

Sure, I will follow up with the pulseaudio folks.

>
> As far as I understood system mode can sometimes be the right thing to
> do but most of the time it is just a configuration error. Running PA and
> printing out the debug messages should give you a clue.

Pulseaudio isn't printing any debug messages to syslog or stdout ( -vv
-log-level pulseaudio options )

Here was the thread on BeagleBoard mailing list that discusses this issue:
http://groups.google.com/group/beagleboard/browse_thread/thread/4dc82483a8d=
000fb/ccbd0e21fa5e89a0

I will post the details of the problem on the pulseaudio mailing list
and try to get some other alternatives.

For now, can we temporarily merge this patch while I followup with them?

> Is that needed? It is an unexpected change for the user having to find
> out that s/he has to make a program under `/usr/bin/` executable to run
> it.

Do you have any suggestions on else we could do it? A patch that rm's
the script?

thanks
Joel


