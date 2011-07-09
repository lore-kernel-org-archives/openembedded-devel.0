Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QfLRm-0003P5-Dx
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jul 2011 02:31:02 +0200
Received: by iwn4 with SMTP id 4so2284271iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jul 2011 17:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Q+CLckdqzosCO69HEamiAWM+e+nGnDoK5Xk44OviiHc=;
	b=EfvPUwx5EHGo2lWeiMuGLMViC5hHWL0XbRDUKIIF2+P2ipsJ6I7rg8j2bhamZgpg6m
	bYiv5yVu0kdzZznNNz3INbjKT3cEhyZZQ0lEMRSS1dDGu0nkaNEJCjJAeYcfAl9XmiOF
	WCaA8xzYVTWp/wvK3qqg9QKnB7ryO1TPAhai0=
MIME-Version: 1.0
Received: by 10.231.203.136 with SMTP id fi8mr2280821ibb.181.1310171228483;
	Fri, 08 Jul 2011 17:27:08 -0700 (PDT)
Received: by 10.231.174.73 with HTTP; Fri, 8 Jul 2011 17:27:08 -0700 (PDT)
In-Reply-To: <1310170909-3533-1-git-send-email-agnel.joel@gmail.com>
References: <1310170909-3533-1-git-send-email-agnel.joel@gmail.com>
Date: Fri, 8 Jul 2011 19:27:08 -0500
Message-ID: <CAD=GYpZrrjVp_TtE5zP2KdnAF_hVttJTo0R9ZV9K2aqJ8cc-5Q@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] pulseaudio: Switch to version version 0.9.22 for Angstrom 2011.03
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
X-List-Received-Date: Sat, 09 Jul 2011 00:31:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 8, 2011 at 7:21 PM, Joel A Fernandes <agnel.joel@gmail.com> wro=
te:
> This fixes all the issues noticed earlier with pulseaudio 0.9.15:
> =A0* Pulseaudio keeping audio devices busy when run as per-user instance
> =A0* Failure of pactl, pacmd etc to connect to the pulseaudio server
>
> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
> ---
> Notes:
> * This has to go into the OpenEmbedded 2011.03-maintenance branch as ther=
e is no such configration file in the master branch
> * Please ignore the earlier patch "pulseaudio: Run as system-wide instanc=
e instead of per-user"
>
> Applying this and the patch titled "beagleboard-test-scripts: Add a scrip=
t flash-fs.sh for flashing NAND" will mark the
> "Alpha" build of the C5 image. Can this be tagged?
>
> Things to go into "Beta":
> * User button fixes (kernel and flashing scripts)
> * U-boot fixes for EHCI timeouts when doing a tftpboot
>
> =A0conf/distro/angstrom-2008.1.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A03 +++
> =A0.../include/angstrom-2008-preferred-versions.inc =A0 | =A0 =A02 +-
> =A02 files changed, 4 insertions(+), 1 deletions(-)
>

I'm not sure if DISTRO_PR has to be bumped so I left it as is, please
let me know if its required.

Thanks,
Joel


