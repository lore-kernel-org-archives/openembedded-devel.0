Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1PqOGh-00070o-Qe
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 12:13:00 +0100
Received: by vxa37 with SMTP id 37so1810525vxa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 03:11:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.52.158.136 with SMTP id wu8mr970289vdb.91.1298027503551; Fri,
	18 Feb 2011 03:11:43 -0800 (PST)
Sender: jay@jay-tech.ru
Received: by 10.220.157.137 with HTTP; Fri, 18 Feb 2011 03:11:43 -0800 (PST)
X-Originating-IP: [95.29.188.223]
In-Reply-To: <1298026721-16036-1-git-send-email-eric@eukrea.com>
References: <1298026721-16036-1-git-send-email-eric@eukrea.com>
Date: Fri, 18 Feb 2011 14:11:43 +0300
X-Google-Sender-Auth: 0LPMrspQ3p8Gwo4H3nHf0bZfRqQ
Message-ID: <AANLkTim+nYfxfRO5Y9Yk0of7yvg_FECVnEkJRZsNmuYJ@mail.gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 18 Feb 2011 11:13:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/2/18 Eric B=E9nard <eric@eukrea.com>:
> actual behaviour is to send a report for *each* task runned by bitbake
> this is ok for one personnal oestat server but doesn't scale well when
> dozen of peoples are running test builders which all send reports to
> the OE's infrastructure.
>
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>

I'm Ack'ing it as temporary solution to keep oestats server running..

Acked-by: Yury Bushmelev <jay4mail@gmail.com>

> ---
> v2: cleaner way to handle the problem as per pb & Jay2 suggestion
>
> =A0classes/oestats-client.bbclass | =A0 =A06 ++++--
> =A01 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/classes/oestats-client.bbclass b/classes/oestats-client.bbcl=
ass
> index 4233d4a..f9ac88f 100644
> --- a/classes/oestats-client.bbclass
> +++ b/classes/oestats-client.bbclass
> @@ -202,8 +202,10 @@ python oestats_eventhandler () {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0oestats_stop(server, e.data, e.getFailures=
())
> =A0 =A0 =A0 =A0elif getName(e) =3D=3D 'TaskStarted':
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bb.data.setVar('OESTATS_STAMP', repr(time.=
time()), e.data)
> - =A0 =A0 =A0 elif getName(e) =3D=3D 'TaskSucceeded':
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 oestats_task(server, e.data, e.task, 'Succe=
eded')
> + =A0 =A0 =A0 # Temporary disable sending sucess report as this generates=
 to much trafic
> + =A0 =A0 =A0 # for the oestat server
> + =A0 =A0 =A0 # elif getName(e) =3D=3D 'TaskSucceeded':
> + =A0 =A0 =A0 # =A0 =A0 =A0 oestats_task(server, e.data, e.task, 'Succeed=
ed')
> =A0 =A0 =A0 =A0elif getName(e) =3D=3D 'TaskFailed':
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0oestats_task(server, e.data, e.task, 'Fail=
ed')
> =A0}
> --
> 1.7.0.4

--=20
Yury Bushmelev


