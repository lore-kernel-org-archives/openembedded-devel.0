Return-Path: <erik.boto@pelagicore.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id B264C6BB02
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2013 11:27:19 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id es8so8452990obc.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2013 04:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=G3gInGcaTeGYmPQwMv3WmUpdsWnfXzOz6n0JYBoHKwg=;
	b=C4T8lEG6T9kRHA7aZHHX1kQPUO+0P22e2Dvrkwv8hG9c/94Mvmopgt5sk5LIO6tRAo
	2X0Rh9Nv8ZmgFd/0oq4Z540O+ru1MXRFQqldwMoOHVaczMoUrNqeGUbruNFYNqI6HhWt
	PoyfWobHQwTt87UD6HzFlqG8oTiHDOeSyOQci94G6FEwM2lWfcE/gt+svoY/nb1YCikU
	AlrvNLOwg2XHyETI75akCuEYBqt/5QGx24xEaIvn1mXhJxhiUsL+7ZVV3Sqb5G9Al4AZ
	kstt/zT+UIuyMonmA13/aE3YUqIjWKcZcMlSTxUDhpnhuo3abypIdMu/pQi+PUoPIjr4
	pagA==
X-Gm-Message-State: ALoCoQl05jEMKXATTO2WnK/LJ3smvjnzAHhs3ExcgyX9gUhwAwWiofL0AXgk2ltTfONG8bMouTvB
MIME-Version: 1.0
X-Received: by 10.60.131.41 with SMTP id oj9mr975338oeb.40.1378898840986; Wed,
	11 Sep 2013 04:27:20 -0700 (PDT)
Received: by 10.182.66.6 with HTTP; Wed, 11 Sep 2013 04:27:20 -0700 (PDT)
In-Reply-To: <CAOMwXhONd6pVJ4=Nut+xF5cyBVcF9-LGfd0OzQ8NL2oJQbMsRQ@mail.gmail.com>
References: <1378898387-7629-1-git-send-email-erik.boto@pelagicore.com>
	<CAOMwXhONd6pVJ4=Nut+xF5cyBVcF9-LGfd0OzQ8NL2oJQbMsRQ@mail.gmail.com>
Date: Wed, 11 Sep 2013 13:27:20 +0200
Message-ID: <CA+AhUGxYgv3yhGxHHJ+tb7xzLL7OkXn6RLnz1duZrdTKV1rO1Q@mail.gmail.com>
From: =?ISO-8859-1?Q?Erik_Bot=F6?= <erik.boto@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH] Added module qtquickcontrols
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
X-List-Received-Date: Wed, 11 Sep 2013 11:27:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Yes, I have a project that uses "QtQuick.Layouts 1.0" and
"QtQuick.Controls 1.0". I haven't done extensive testing, but after
adding this module the GUI starts and seems to be working as intended.

Cheers,
Erik

On Wed, Sep 11, 2013 at 1:22 PM, Laszlo Papp <lpapp@kde.org> wrote:
> Were you able to run an example after adding this?
>
>
> On Wed, Sep 11, 2013 at 12:19 PM, Erik Bot=F6 <erik.boto@pelagicore.com>w=
rote:
>
>> Signed-off-by: Erik Bot=F6 <erik.boto@pelagicore.com>
>> ---
>>  recipes-qt/qt5/qtquickcontrols.inc      | 3 +++
>>  recipes-qt/qt5/qtquickcontrols_5.1.0.bb | 5 +++++
>>  2 files changed, 8 insertions(+)
>>  create mode 100644 recipes-qt/qt5/qtquickcontrols.inc
>>  create mode 100644 recipes-qt/qt5/qtquickcontrols_5.1.0.bb
>>
>> diff --git a/recipes-qt/qt5/qtquickcontrols.inc
>> b/recipes-qt/qt5/qtquickcontrols.inc
>> new file mode 100644
>> index 0000000..63e884e
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qtquickcontrols.inc
>> @@ -0,0 +1,3 @@
>> +require qt5.inc
>> +
>> +DEPENDS +=3D "qtdeclarative"
>> diff --git a/recipes-qt/qt5/qtquickcontrols_5.1.0.bb b/recipes-qt/qt5/
>> qtquickcontrols_5.1.0.bb
>> new file mode 100644
>> index 0000000..fc880d7
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qtquickcontrols_5.1.0.bb
>> @@ -0,0 +1,5 @@
>> +require qt5-${PV}.inc
>> +require ${PN}.inc
>> +
>> +SRC_URI[md5sum] =3D "b3825124a173a36f63c2f8380dc61e81"
>> +SRC_URI[sha256sum] =3D
>> "88d39421d78464c3900c37616e8369fc8d998c1b0f611980e6e082f46569646b"
>> --
>> 1.8.1.2
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Erik Bot=F6
Senior Software Engineer
Pelagicore AB
Ekelundsgatan 4, 6tr, SE-411 18 Gothenburg, Sweden
Mobile: +46 (0)76 881 72 03
E-Mail: erik.boto@pelagicore.com
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

