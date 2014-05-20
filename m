Return-Path: <koen@dominion.thruhere.net>
X-Greylist: delayed 328 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 20 May 2014 07:15:28 UTC
Received: from mail-we0-f171.google.com (unknown [74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 03AA165D0E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 May 2014 07:15:28 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id w62so65829wes.30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 May 2014 00:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=gJ2DuOyVNqhVNA0td8Clc4GGxYGUybCIGD1rUndY7FU=;
	b=b9tMfC4kaZzLrBpaR+UzfcKq44MIatJ0kQGalWAAY9y+lQTCcIWyUhI1GpbdB6wifI
	4ZWtZ8LoFb5ETAJ7bOUGT+MuKh5neC7d8ZRRfwUyuk31bIybQ60ki/ZFt7KOGQnItJrL
	MjDWqhrQMROe/5BMuvdauwS1xA3nWnWPyHdqJZUhngauY1tHTLhnMmn1+Puszqs/xVHL
	C1MVn5YC/AhR/BeGCVavzMi+UQVIHFux8jK6BhH/uQg9VhxEpWv88WHujl1CkP9NviWJ
	/Lr0dNIkV+ra1J6h00XfSqhP9I9FvfPPxU1G8J/QcVxTGCRJAQ8Dl1Mrdy14kbuSf1s5
	QU8Q==
X-Gm-Message-State: ALoCoQn8UoBiErEym1Ipa0ksa0QxMQKnjEfATB3RTimhhfOEulrPLRNlFCi7yy4Bo0qiPXeTGft+
X-Received: by 10.180.109.69 with SMTP id hq5mr2269950wib.30.1400569801166;
	Tue, 20 May 2014 00:10:01 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id o2sm19145179wiy.19.2014.05.20.00.09.59
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 20 May 2014 00:10:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.2\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1400568570-23824-1-git-send-email-fathi.boudra@linaro.org>
Date: Tue, 20 May 2014 09:09:58 +0200
Message-Id: <BFBFE57F-788E-4621-B1F0-25662F02737B@dominion.thruhere.net>
References: <1400568570-23824-1-git-send-email-fathi.boudra@linaro.org>
To: Fathi Boudra <fathi.boudra@linaro.org>
X-Mailer: Apple Mail (2.1878.2)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] pm-qa: update to 0.4.10 release
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
X-List-Received-Date: Tue, 20 May 2014 07:15:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 mei 2014, om 08:49 heeft Fathi Boudra <fathi.boudra@linaro.org> =
het volgende geschreven:

> Update SRC_URI, /tools/ is deprecated.
>=20
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
> meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb =
b/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
> index f6ffcb6..9243340 100644
> --- a/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
> +++ b/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
> @@ -4,14 +4,14 @@ HOMEPAGE =3D =
"https://wiki.linaro.org/WorkingGroups/PowerManagement/Resources/Test
> LICENSE =3D "GPLv2"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
>=20
> -PV =3D "0.4.9"
> +PV =3D "0.4.10"
>=20
> BRANCH ?=3D "master"
>=20
> -# Corresponds to tag pm-qa-v0.4.9
> -SRCREV =3D "c54941a9bbaac33e44e6d0c7f5344e21102642cf"
> +# Corresponds to tag pm-qa-v0.4.10
> +SRCREV =3D "03a22d5ad7deb6021b2ec1d546a960d8a9878255"
>=20
> -SRC_URI =3D =
"git://git.linaro.org/tools/pm-qa.git;protocol=3Dgit;branch=3D${BRANCH}"
> +SRC_URI =3D =
"git://git.linaro.org/power/pm-qa.git;protocol=3Dgit;branch=3D${BRANCH}"

Nitpick: protocol=3Dhttp might be better, git:// is flaky on =
git.linaro.org.

regards,

Koen=

