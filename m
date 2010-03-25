Received: from hsp-52.hspserver.com ([85.197.80.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ml@vdm-design.de>) id 1NujC4-00015P-C8
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 10:17:41 +0100
Received: from localhost (localhost [127.0.0.1])
	by hsp-52.hspserver.com (Postfix) with ESMTP id 99169A2C3BC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Mar 2010 10:14:28 +0100 (CET)
Received: from hsp-52.hspserver.com ([127.0.0.1])
	by localhost (hsp-52.hspserver.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id LAG8ozQ5DBJo
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Mar 2010 10:14:28 +0100 (CET)
Received: from tomboy.localnet (pD9E15DD9.dip.t-dialin.net [217.225.93.217])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by hsp-52.hspserver.com (Postfix) with ESMTP id 35B57A2C3B7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Mar 2010 10:14:28 +0100 (CET)
From: Thomas Zimmermann <ml@vdm-design.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Mar 2010 10:14:27 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-1.slh.5-sidux-amd64; KDE/4.3.4; x86_64; ;
	)
References: <b6ebd0a51003240909t642135dfy5b2667f6dac0a8c5@mail.gmail.com>
	<1269507272-19036-1-git-send-email-ml@vdm-design.de>
In-Reply-To: <1269507272-19036-1-git-send-email-ml@vdm-design.de>
MIME-Version: 1.0
Message-Id: <201003251014.27055.ml@vdm-design.de>
X-SA-Exim-Connect-IP: 85.197.80.179
X-SA-Exim-Mail-From: ml@vdm-design.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] imagemagick: convert to BBCLASSEXTEND and new staging
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
X-List-Received-Date: Thu, 25 Mar 2010 09:17:41 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag 25 M=E4rz 2010 09:54:32 schrieb Thomas Zimmermann:
> * now imagemagick is buildable again with autoconf > 2.63
> * tiff-native now exists, so no need to override DEPENDS of -native anymo=
re
>=20
> Signed-off-by: Thomas Zimmermann <ml@vdm-design.de>
> ---
>  recipes/imagemagick/imagemagick-native_6.3.5-10.bb |    6 ------
>  recipes/imagemagick/imagemagick_6.3.5-10.bb        |   10 ++++------
>  recipes/imagemagick/imagemagick_6.4.4-1.bb         |   10 ++++------
>  3 files changed, 8 insertions(+), 18 deletions(-)
>  delete mode 100644 recipes/imagemagick/imagemagick-native_6.3.5-10.bb

6.4.4-1 builds fine, but i can't try if 6.3.5 builds fine too, as it doesn'=
t=20
compile anymore for me because of to recent autoconf...

So it would be nice if someone can confirm that 6.3.5 builds fine too.


