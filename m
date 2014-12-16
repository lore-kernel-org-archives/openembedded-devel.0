Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id A8AC472594
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 08:28:42 +0000 (UTC)
Received: from amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.127])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id 8DA903F864
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 09:28:41 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
X-Spam-Status: No, score=-2.899 tagged_above=-999 required=3.5
	tests=[BAYES_00=-2.9, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: rm en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 09:28:41 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 09:28:40 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Tue, 16 Dec 2014 09:28:54 +0100
Message-ID: <548FED38.40802@topic.nl>
Date: Tue, 16 Dec 2014 09:28:40 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1418035371-3544-1-git-send-email-awais_belal@mentor.com>,
	<1418035371-3544-2-git-send-email-awais_belal@mentor.com>
	<2021B186DC632746BD5A3CE32F12BD28E9FE2BDA@EU-MBX-03.mgc.mentorg.com>
In-Reply-To: <2021B186DC632746BD5A3CE32F12BD28E9FE2BDA@EU-MBX-03.mgc.mentorg.com>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Re: [meta-oe][PATCH v2 2/2] mplayer2: cleanup empty directories
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Dec 2014 08:28:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 12/16/2014 08:26 AM, Belal, Awais wrote:
> ping!
>
> BR,
> Awais
>
>=20

Met vriendelijke groet / kind regards,

Mike Looijmans
System Expert


TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) (0) 499 33 69 79
Telefax:  (+31) (0) 499 33 69 70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Please consider the environment before printing this e-mail

Topic zoekt gedreven (embedded) software specialisten!
http://topic.nl/vacatures/topic-zoekt-software-engineers/

________________________________________
> From: openembedded-devel-bounces@lists.openembedded.org [openembedded-dev=
el-bounces@lists.openembedded.org] on behalf of Belal, Awais
> Sent: Monday, December 08, 2014 3:42 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH v2 2/2] mplayer2: cleanup empty directories
>
> The mplayer "make install" phase leaves an empty
> /usr/lib directory seemingly regardless of the setting
> of libdir.  Remove it to avoid a packaging warning.
>
> Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
>   meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe=
/recipes-multimedia/mplayer/mplayer2_git.bb
> index 6b3d120..a68a2ba 100644
> --- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> @@ -141,4 +141,5 @@ do_install() {
>       install ${S}/etc/input.conf ${D}/usr/etc/mplayer/
>       install ${S}/etc/example.conf ${D}/usr/etc/mplayer/
>       install ${S}/etc/codecs.conf ${D}/usr/etc/mplayer/
> +    [ -e ${D}/usr/lib ] && rmdir ${D}/usr/lib

This will cause the script to fail when someone fixes the install and /usr/=
lib=20
was not created, because "test -e ${D}/usr/lib" would return failure.


>   }
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


