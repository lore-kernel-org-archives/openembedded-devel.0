Received: from hsp-52.hspserver.com ([85.197.80.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ml@vdm-design.de>) id 1NuL9P-0002B0-Cs
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Mar 2010 08:37:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by hsp-52.hspserver.com (Postfix) with ESMTP id 0BD25A2C3AD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Mar 2010 08:34:08 +0100 (CET)
Received: from hsp-52.hspserver.com ([127.0.0.1])
	by localhost (hsp-52.hspserver.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id GGVKh-tmHtd2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Mar 2010 08:34:05 +0100 (CET)
Received: from tomboy.localnet (pD9E17E23.dip.t-dialin.net [217.225.126.35])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by hsp-52.hspserver.com (Postfix) with ESMTP id 6369EA2C3CA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Mar 2010 08:34:05 +0100 (CET)
From: Thomas Zimmermann <ml@vdm-design.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Mar 2010 08:34:04 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-1.slh.3-sidux-amd64; KDE/4.3.4; x86_64; ;
	)
References: <1269383658-27562-1-git-send-email-ml@vdm-design.de>
	<b6ebd0a51003231748s293a4020v989b8cdf590ccc4@mail.gmail.com>
In-Reply-To: <b6ebd0a51003231748s293a4020v989b8cdf590ccc4@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201003240834.04740.ml@vdm-design.de>
X-SA-Exim-Connect-IP: 85.197.80.179
X-SA-Exim-Mail-From: ml@vdm-design.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
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
X-List-Received-Date: Wed, 24 Mar 2010 07:37:17 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch 24 M=E4rz 2010 01:48:58 schrieb Chris Larson:
> This should not be necessary.  native.bbclass automatically sets deps on
>  the -native versions of what's in your DEPENDS.  Or was there a specific
>  reason behind adding libtool-native and removing tiff?
>=20
No there was no such a reason, i just copied it from imagemagick-
native_0.6.3.5-10 recipe.

The question is, do we convert 6.3.5-10 to BBCLASSEXTEND too, or do we remo=
ve=20
that recipe, or is there a bug about mixed BBCLASSEXTEND and -native recipe=
s,=20
that -native recipes are preferred?


