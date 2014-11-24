Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 353 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 24 Nov 2014 10:19:25 UTC
Received: from retry101.mer-nm.internl.net (vif1-retry101.mer-nm.internl.net
	[217.149.192.107])
	by mail.openembedded.org (Postfix) with ESMTP id E62A67215B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 10:19:25 +0000 (UTC)
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by retry101.mer-nm.internl.net (Postfix) with ESMTP id 6CFDC40ABA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 11:13:39 +0100 (CET)
Received: from amavisd-new (mailscanner08.wrt-nm.internl.net [217.149.192.54])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id D75EF3F6FA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 11:13:31 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
X-Spam-Status: No, score=-2.899 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner08.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 11:13:31 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 11:13:30 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Mon, 24 Nov 2014 11:13:45 +0100
Message-ID: <547304C9.1060509@topic.nl>
Date: Mon, 24 Nov 2014 11:13:29 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1B858668EC6A94408DCA5225FDFA85AABD59CFA9@ALA-MBA.corp.ad.wrs.com>
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AABD59CFA9@ALA-MBA.corp.ad.wrs.com>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Re: There is no LAYERVERSION and LAYERDEPENDS for most meta-FOO layers
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
X-List-Received-Date: Mon, 24 Nov 2014 10:19:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 11/24/2014 09:53 AM, Huang, Jie (Jackie) wrote:
> Hi,
>
> I know LAYERVERSION is optional but I think LAYERDEPENDS is required and =
at least we should specify the main oe-core,
> but I found only meta-networking and meta-webser have this:
>
> $ grep -r LAYERDEPENDS *
> meta-networking/conf/layer.conf:LAYERDEPENDS_networking-layer =3D "core"
> meta-networking/conf/layer.conf:LAYERDEPENDS_networking-layer =3D "openem=
bedded-layer"
> meta-networking/conf/layer.conf:LAYERDEPENDS_networking-layer =3D "meta-p=
ython"
> meta-webserver/conf/layer.conf:LAYERDEPENDS_webserver =3D "core"
> $ grep -r LAYERVERSION *
> meta-networking/conf/layer.conf:LAYERVERSION_networking-layer =3D "1"
> meta-webserver/conf/layer.conf:LAYERVERSION_webserver =3D "1"
>
> I found dependencies section in README for most of the meta-FOO layers, b=
ut no definition of LAYERDEPENDS in the layer.conf.
>
> Thanks,
> Jackie
>

And reading this:

LAYERDEPENDS_networking-layer =3D "core"
LAYERDEPENDS_networking-layer =3D "openembedded-layer"
LAYERDEPENDS_networking-layer =3D "meta-python"

makes me wonder whether:
- The author forgot to use "+=3D" instead of "=3D"; or
- The syntax of LAYERDEPENDS is different from what the rest of the variabl=
es=20
use (in that case, an RFC may be in order here); or
- These lines are parsed by something else than bitbake's regular parser.




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


