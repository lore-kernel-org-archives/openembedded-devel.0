Received: from 13.mo5.mail-out.ovh.net ([87.98.182.191]
	helo=mo5.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QzErL-0003jN-He
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 23:31:39 +0200
Received: from mail98.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo5.mail-out.ovh.net (Postfix) with SMTP id 946D51004E74
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Sep 2011 21:01:31 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 1 Sep 2011 21:01:14 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.9?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 1 Sep 2011 21:01:14 +0200
Message-ID: <4E5FD679.1000606@eukrea.com>
Date: Thu, 01 Sep 2011 21:01:13 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.5 (mo5.mail-out.ovh.net)
References: <4d660e0531b72769b0bf04e0288cca6d52cb083f.1314892207.git.Martin.Jansa@gmail.com>
	<49f18160290338d81c35a56f12fb5edaababe78b.1314892207.git.Martin.Jansa@gmail.com>
In-Reply-To: <49f18160290338d81c35a56f12fb5edaababe78b.1314892207.git.Martin.Jansa@gmail.com>
X-Ovh-Tracer-Id: 15454665072236277065
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeftddruddvucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenuc
Subject: Re: [meta-oe][PATCH 4/4] xf86-video-omapfb: add patch for fixing segfault on starting X when using VRFB
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
X-List-Received-Date: Thu, 01 Sep 2011 21:31:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

Le 01/09/2011 17:50, Martin Jansa a =E9crit :
> From: Sebastian Krzyszkowiak<dos@dosowisko.net>
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   .../0004-Attempt-to-fix-VRFB.patch                 |  320 +++++++++++=
+++++++++
>   .../xorg-driver/xf86-video-omapfb_git.bb           |    3 +-
>   2 files changed, 322 insertions(+), 1 deletions(-)
>   create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-om=
apfb/0004-Attempt-to-fix-VRFB.patch
>
why does this driver is inside meta-oe layer instead of the TI layer ?

btw, as we are starting porting our bsp against meta-oc, is there a docum=
ent=20
describing how the layers are splitted ?

Eric


