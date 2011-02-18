Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PqSPK-0006gE-2j
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 16:38:10 +0100
Received: by fxm17 with SMTP id 17so3694442fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 07:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=lzUJc3t7zOgRJB6wiqmHWTcJeFsU467zle/ji5MiwtM=;
	b=BH6KgFidh09P8P1rLP/aTYgj7+4q1pzpP8wVoabwVUHEgLP9NRVGXtx5mr9xTbTKc+
	+xHVFeQam8FGwhOOxda4q9knSA4ouec6HsnrnsYrEab2hx0VnLfXj3MWO5Pvrq93TRW2
	BRNEFWPDdSWLXZsVS7MsO6rwmNyqeEFhsZ9A8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=R3fkXTe8Whih+54srpqfWmb8LID/GWl5SLkx1oijUK06swo0jWZ4MgfQPNwx5FEYGn
	UjfOg396S6Eqa1kTuxFdSyneju6bmNhgPW5VBnFuN/bIY4ieJa/kZEEwj+V8iFISwLOj
	qThk3ZSZle16+ZnmdYwyoaC2b5MMUDv1kmDwo=
Received: by 10.223.79.74 with SMTP id o10mr979463fak.63.1298043342797; Fri,
	18 Feb 2011 07:35:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.66.22 with HTTP; Fri, 18 Feb 2011 07:35:15 -0800 (PST)
In-Reply-To: <1298026721-16036-1-git-send-email-eric@eukrea.com>
References: <1298026721-16036-1-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Feb 2011 07:35:15 -0800
Message-ID: <AANLkTimXo8+3vOcq79Ttn7=Cf7i3wcepNHNJotU1+jLw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Subject: Re: [PATCH v2] oestats-client: only send report when task has failed
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
X-List-Received-Date: Fri, 18 Feb 2011 15:38:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 18, 2011 at 2:58 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> actual behaviour is to send a report for *each* task runned by bitbake
> this is ok for one personnal oestat server but doesn't scale well when
> dozen of peoples are running test builders which all send reports to
> the OE's infrastructure.
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
> ---
> v2: cleaner way to handle the problem as per pb & Jay2 suggestion
>
> =C2=A0classes/oestats-client.bbclass | =C2=A0 =C2=A06 ++++--
> =C2=A01 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/classes/oestats-client.bbclass b/classes/oestats-client.bbcl=
ass
> index 4233d4a..f9ac88f 100644
> --- a/classes/oestats-client.bbclass
> +++ b/classes/oestats-client.bbclass
> @@ -202,8 +202,10 @@ python oestats_eventhandler () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oestats_stop(serve=
r, e.data, e.getFailures())
> =C2=A0 =C2=A0 =C2=A0 =C2=A0elif getName(e) =3D=3D 'TaskStarted':
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('OE=
STATS_STAMP', repr(time.time()), e.data)
> - =C2=A0 =C2=A0 =C2=A0 elif getName(e) =3D=3D 'TaskSucceeded':
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oestats_task(server, e=
.data, e.task, 'Succeeded')
> + =C2=A0 =C2=A0 =C2=A0 # Temporary disable sending sucess report as this =
generates to much trafic
> + =C2=A0 =C2=A0 =C2=A0 # for the oestat server
> + =C2=A0 =C2=A0 =C2=A0 # elif getName(e) =3D=3D 'TaskSucceeded':
> + =C2=A0 =C2=A0 =C2=A0 # =C2=A0 =C2=A0 =C2=A0 oestats_task(server, e.data=
, e.task, 'Succeeded')
> =C2=A0 =C2=A0 =C2=A0 =C2=A0elif getName(e) =3D=3D 'TaskFailed':
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oestats_task(serve=
r, e.data, e.task, 'Failed')
> =C2=A0}


will this mean that only failed packages show up on tinderbox ?
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


