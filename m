Return-Path: <mike.looijmans@topicproducts.com>
X-Greylist: delayed 1856 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 14 Sep 2016 12:26:30 UTC
Received: from mx12-14.smtp.antispamcloud.com (mx12-14.smtp.antispamcloud.com
	[46.165.232.184])
	by mail.openembedded.org (Postfix) with ESMTP id A6F05734B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2016 12:26:30 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx12.antispamcloud.com with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1bk8mo-0007Qx-9N for openembedded-devel@lists.openembedded.org;
	Wed, 14 Sep 2016 13:55:31 +0200
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Wed, 14 Sep 2016 13:55:29 +0200
To: <openembedded-devel@lists.openembedded.org>
References: <17c49fd3-d0d9-d00f-69d9-07656bee9c00@gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <57D93AB0.2010305@topic.nl>
Date: Wed, 14 Sep 2016 13:55:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <17c49fd3-d0d9-d00f-69d9-07656bee9c00@gmail.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw8GIk4znw5EcwHHi+ra9lypEmJCbamfqLB4wH/k+k+Tftor9O5jjWZI633McN2M/OUXR
	4XktS92Fqq3Qa0exZrH30SrPk8tfaSF+RZrpk8YKU12d2pmLLkAmzasehlwbl330I7d8n7Wa3GQ1
	Gavb9/w+DKA2NNvQHVv9U39IvZ21x85OM4GWP9JQ/hHPc9c4dspy46MY4AXC06EFbOC1uAoX2ECf
	0tidf4f9xbnt4dr3ucE6FVHy9oQcVLiVeDoadp8jI9oH6dGc6edzLFJtSM1o5rQC2VE4ySdZe0mi
	K6wgOmG6/54gza7q5Za0AFsz6J51OyFNIoaxpS1mXZNdroDdpaan89csPuxNcrcm3g0VrZ+7KIxe
	L9a8yWCRhadOUlss+n2ffnQxt6aJ7klZab+9g1L5kxBIYGB7BJyUdlmpOtqAyNDaGu3M3V4NLSLw
	IF/664n8xZZ193ZhZHjQXRtPWfCpEalZkqHbJcTqNjqGWxwNFavLErUb39TUKcCiO2iH1Wgh6RAe
	nBR+licROGa7w33/14GVkNZ6okgvMpPoU75prjeyjuZlW2IsigoonmNIBxN+8iLMjiqr6CILtV73
	kf3bHfLz5oIsvwONwYzu
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00311722141238)
X-Recommended-Action: accept
Subject: Re: [PATCH] libnl: Fix possible host contamination error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Sep 2016 12:26:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFUsually this is the result from using a "cp" (typically "cp -r") c=
ommand in=20
the install script instead of "install". Use "install" if possible, patch t=
he=20
makefile if you have to. If the install script uses "cp -r", add a few extr=
a=20
--preserve options to the command to prevent it overriding ownership.

On 14-09-16 12:45, Mats Karrman wrote:
>  From 975b7e64462a465449d367ff6a4e5240a59221d9 Mon Sep 17 00:00:00 2001
> From: =3D?UTF-8?q?Mats=3D20K=3DC3=3DA4rrman?=3D <mats@southpole.se>
> Date: Wed, 14 Sep 2016 12:29:27 +0200
> Subject: [PATCH] libnl: Fix possible host contamination error
>
> ---
>   meta/recipes-support/libnl/libnl_3.2.28.bb | 4 ++++
>   1 file changed, 4 insertions(+)
>
>   Possibly a cannon to swat a fly but I get "WARNING: libnl-1_3.2.28-r0
> do_package_qa: QA Issue: libnl: /libnl-nf/usr/lib/libnl-nf-3.so.200.23.0 =
is
> owned by uid 1001, which is the same as the user running bitbake. This ma=
y be
> due to host contamination [host-user-contaminated]"
>   type errors on every file.
>
> diff --git a/meta/recipes-support/libnl/libnl_3.2.28.bb
> b/meta/recipes-support/libnl/libnl_3.2.28.bb
> index 26982f3..3fcfbc1 100644
> --- a/meta/recipes-support/libnl/libnl_3.2.28.bb
> +++ b/meta/recipes-support/libnl/libnl_3.2.28.bb
> @@ -23,6 +23,10 @@ SRC_URI[sha256sum] =3D
> "cd608992c656e8f6e3ab6c1391b162a5a51c49336b9219f7f390e61fc5
>
>   inherit autotools pkgconfig
>
> +do_install_append() {
> +    chown -R root:root ${D}
> +}
> +
>   FILES_${PN} =3D "${libdir}/libnl-3.so.* \
>                  ${libdir}/libnl.so.* \
>                  ${sysconfdir}"



Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail

Topic zoekt gedreven (embedded) software specialisten!
http://topic.nl/vacancy/topic-zoekt-technische-software-engineers/



