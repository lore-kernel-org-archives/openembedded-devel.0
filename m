Return-Path: <brgl@bgdev.pl>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id E21BB7D714
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 16:33:34 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id c6so21795552ioo.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 09:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=muWbDA5GtT0NroEn5BEUSate34x+C//m1HTcdsJjL8Y=;
	b=JSNnEvucEUGmuakTa+x46z0wHUaBnYzz4cNgkE0Ub8rN2jZWt/kin6P1Aq2+I0AEsB
	hYeDx/pQSPLgR9mqiZTLNk1BVpNihSIjfULRRt6C2fw69v7C1bdowg5IwlKr8sPuDI57
	kgrNzSRLsIloypFo4bZEqCQBD2IEpdn0mALgTKtETrRB1ndN2WUqPRnX1seBXpL0gl5n
	p74kf3Tz30/3vPqLvjT6ih11suCc6Hpu2YcqnJ9g0aef8g72PDD7O2IWSUgUP89i0Bdk
	7mxdPa3hi+E21jZAhO/f28NoFf0eCeyfRe1iShVzItrcRJQiAaK0rMNPqv/ZoXuBYsyV
	6ZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=muWbDA5GtT0NroEn5BEUSate34x+C//m1HTcdsJjL8Y=;
	b=YlUhvcLfNTG2SA2f72nwf/Eos6K9HLRnHlViKHJkwpqre+z8Mj4jreqddIEvuE1ySF
	qopFzD+ufn61oXPIL20T16eRfMS67zH/vmQ9FFKfQpdYa17Bc31h7ADyV2ZerxTBUcda
	qSoDhIVl4vMYY7t/9tHNRZo2rXA8sNa1dVK46q/h9Gwxda3VNR9dutFt0d+HBv41n0Bx
	KPCRYxsX9hVVrNo4X93Xmn0T7s3XBUME8DkbNwWQU2uDRIkuYeTqnCdE2aDNAwxCHY6o
	2FcScxr+LtES63sTwzIpLpqdNHy0dkj6XZ5uBi98gkiZ4bGq1N7U6eM/UrxICWX/Aa4V
	lIfg==
X-Gm-Message-State: APjAAAUE7T01P5N/H473GBS1YZn42ghRC2rtFQ/yjPpo/jYu2+Bu7kwV
	LYvytUCm5ahgWLonzZ77YqW58ZCKECLPk13Zul41kA==
X-Google-Smtp-Source: APXvYqw9vZXpHAQCCAnfQeQi+B05LHOoWX+vqAl6o8VNf+18WBiivCqLQhbcaP9APs7RQ/puandjVH87GTFUftf/65U=
X-Received: by 2002:a02:7b0d:: with SMTP id q13mr278775jac.114.1569256415719; 
	Mon, 23 Sep 2019 09:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190923155811.25526-1-brgl@bgdev.pl>
	<CAMKF1srDtyMHk9bCNDDg6GEeHJ-Gf_kWopJ2ZoTqK3Y4CADtkg@mail.gmail.com>
In-Reply-To: <CAMKF1srDtyMHk9bCNDDg6GEeHJ-Gf_kWopJ2ZoTqK3Y4CADtkg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Sep 2019 18:33:24 +0200
Message-ID: <CAMRc=MdnBN9Qo3mSqid9QSOtsZh_zOYzjnwaUVoM7ZvKrJ4p=g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v2] python3-dtschema: new package
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
X-List-Received-Date: Mon, 23 Sep 2019 16:33:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pon., 23 wrz 2019 o 18:25 Khem Raj <raj.khem@gmail.com> napisa=C5=82(a):
>
>
>
> On Mon, Sep 23, 2019 at 8:58 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
>>
>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>
>> This adds a recipe for dtschema package developed by Rob Herring for
>> easy validation of YAML device-tree files in the linux kernel.
>>
>> The version is current git as the only release so far - v0.1 - is old
>> and doesn't work with kernel's dt_binding_check make target.
>>
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> ---
>> v1 -> v2:
>> - added PV
>>
>> Note: I'm already seeing patch 1/2 from v1 of this series in master-next
>> so I'm only resending this one.
>>
>>  .../python/python3-dt-schema_git.bb               | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>  create mode 100644 meta-python/recipes-devtools/python/python3-dt-schem=
a_git.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-dt-schema_git.b=
b b/meta-python/recipes-devtools/python/python3-dt-schema_git.bb
>> new file mode 100644
>> index 000000000..831b8fb8d
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-dt-schema_git.bb
>> @@ -0,0 +1,15 @@
>> +SUMMARY =3D "Tooling for devicetree validation using YAML and jsonschem=
a"
>> +AUTHOR =3D "Rob Herring"
>> +
>> +LICENSE =3D "BSD-2-Clause"
>> +LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D2;endline=3D3;md5=3Dc=
795d4924c5f739424fa8d9b569c6659"
>> +
>> +inherit setuptools3
>> +
>> +SRC_URI =3D "git://github.com/robherring/dt-schema.git"
>> +SRCREV =3D "5009e47c1c76e48871f5988e08dad61f3c91196b"
>> +PV =3D "0.1+git${SRCREV}"
>
>
> It should be SRCPV
>>

Sorry, my bad.

Resending v3.

Bart

>>
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +RDEPENDS_${PN} =3D "python3-jsonschema python3-ruamel-yaml"
>> --
>> 2.23.0
>>

