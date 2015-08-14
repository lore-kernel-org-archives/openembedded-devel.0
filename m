Return-Path: <andreas.baak@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id C7E3660034
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 18:05:38 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so28867340wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 11:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:message-id:date:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=kxXK37FvbDXqazclQwatYK5j3SKL7E/uRoERIDF8oM8=;
	b=poLxNdLshOV4Z4zuLYRtbaeyEx8cxG55pCSk5GQ1cLBjzyke0HuQWFbj4RT+tIXQy5
	FgvzXismc2jBD3vWFZmf0QH6pUkbwYKdA/2lVFBWY19r96Okcq8DipPVIH5Hc4XeptOl
	QEbZSbyHNrp5kF/mPHrq9wYqYeqke8d+r4x+n+3req9slSas2pzd8253jpqOEaTa2z8f
	bMTXMs7pOI+Ui2oHr37vpHuqHQGt9fp0luBBZ18lMt/fsb6vhZBAyopgTF3cWn07qgWa
	3PSx7jes23i17/GWrKuOG5ceBxPQ+K0YZk2GATgX7llN2UeqcFP+TenTuw2yj7vUphCZ
	ZhJw==
X-Received: by 10.180.208.81 with SMTP id mc17mr8643098wic.93.1439575537495;
	Fri, 14 Aug 2015 11:05:37 -0700 (PDT)
Received: from [192.168.178.33]
	(dslb-088-064-184-191.088.064.pools.vodafone-ip.de. [88.64.184.191])
	by smtp.googlemail.com with ESMTPSA id
	gm20sm9320616wjc.17.2015.08.14.11.05.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Aug 2015 11:05:36 -0700 (PDT)
From: Andreas Baak <andreas.baak@gmail.com>
X-Google-Original-From: Andreas Baak <Andreas.Baak@gmail.com>
Message-ID: <55CE2DF6.8030700@gmail.com>
Date: Fri, 14 Aug 2015 20:05:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1439568807-1839-1-git-send-email-TicoTimo@gmail.com>
	<1439568807-1839-2-git-send-email-TicoTimo@gmail.com>
In-Reply-To: <1439568807-1839-2-git-send-email-TicoTimo@gmail.com>
Subject: Re: [meta-perl][PATCH 2/3] librole-tiny-perl: add 2.000001 recipe
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
X-List-Received-Date: Fri, 14 Aug 2015 18:05:39 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I just noticed that the homepage link is broken.
The current link should be
https://metacpan.org/pod/Role::Tiny

Cheers,
Andreas

On 14.08.2015 18:13, Tim Orling wrote:
> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> ---
>   .../librole/librole-tiny-perl_2.000001.bb          | 29 ++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
>   create mode 100644 meta-perl/recipes-perl/librole/librole-tiny-perl_2.000001.bb
>
> diff --git a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.000001.bb b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.000001.bb
> new file mode 100644
> index 0000000..9a8ec2e
> --- /dev/null
> +++ b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.000001.bb
> @@ -0,0 +1,29 @@
> +SUMMARY = "Role::Tiny - Roles. Like a nouvelle cousine portion size of Moose."
> +DESCRIPTION = "\"Role::Tiny\" is a minimalist role composition tool."
> +
> +SECTION = "libs"
> +
> +HOMEPAGE = "https://metacpan.org/pod/Role-Tiny"
> +
> +LICENSE = "Artistic-1.0 | GPL-1.0+"
> +LIC_FILES_CHKSUM = "file://README;beginline=172;endline=209;md5=26df7e7c20551fb1906e2286624f0b71"
> +
> +SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Role-Tiny-${PV}.tar.gz"
> +SRC_URI[md5sum] = "f350f1f8c13652bf85da172380b39ec8"
> +SRC_URI[sha256sum] = "31883410a7c85d6dc7501c718b1f83edba013a7b9bbccf0338a1033c391f296d"
> +
> +S = "${WORKDIR}/Role-Tiny-${PV}"
> +
> +inherit cpan
> +
> +RDEPENDS_${PN} = " perl-module-exporter \
> +                   perl-module-strict \
> +                   perl-module-test-more \
> +                   perl-module-warnings \
> +"
> +
> +RPROVIDES_${PN} = " librole-tiny-perl \
> +                    librole-tiny-with-perl \
> +"
> +
> +BBCLASSEXTEND = "native"


