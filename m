Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1SKgcj-0008K2-Ns
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Apr 2012 03:57:30 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3J1lwuL014075
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 18 Apr 2012 18:47:59 -0700 (PDT)
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 18 Apr 2012 18:47:58 -0700
Message-ID: <4F8F6ED7.5080708@windriver.com>
Date: Thu, 19 Apr 2012 09:48:07 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
References: <1334542833-27552-1-git-send-email-kai.kang@windriver.com>
	<1334542833-27552-2-git-send-email-kai.kang@windriver.com>
	<CAGiJk9crD24MvT0sKm2SgVpA4FZumr_ob0LDfhx11X=ac0eYPg@mail.gmail.com>
In-Reply-To: <CAGiJk9crD24MvT0sKm2SgVpA4FZumr_ob0LDfhx11X=ac0eYPg@mail.gmail.com>
X-Originating-IP: [128.224.162.202]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q3J1lwuL014075
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/3] qt4-native: enable features to build kdelib4-native
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
X-List-Received-Date: Thu, 19 Apr 2012 01:57:30 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B404=E6=9C=8816=E6=97=A5 18:50, Samuel Stirtzel wrote:
> 2012/4/16 Kang Kai<kai.kang@windriver.com>:
>> add a bbappend file to enable qt4-native 4.7.4 to enable openssl and
>> phonon support. Add flags '-no-pch -no-sm' to make qt4-native itself
>> compiled successfully.
>>
>> Signed-off-by: Kang Kai<kai.kang@windriver.com>
>> ---
>>   recipes-misc-support/qt4-native_4.7.4.bbappend |    4 ++++
>>   1 files changed, 4 insertions(+), 0 deletions(-)
>>   create mode 100644 recipes-misc-support/qt4-native_4.7.4.bbappend
>>
>> diff --git a/recipes-misc-support/qt4-native_4.7.4.bbappend b/recipes-=
misc-support/qt4-native_4.7.4.bbappend
>> new file mode 100644
>> index 0000000..a11a23f
>> --- /dev/null
>> +++ b/recipes-misc-support/qt4-native_4.7.4.bbappend
>> @@ -0,0 +1,4 @@
>> +# Needed by kdelibs4-native
>> +EXTRA_OECONF +=3D "-no-pch -no-sm -openssl"
>> +
>> +TOBUILD +=3D "src/phonon"
>> --
>> 1.7.5.4
>>
> Hi,
> this patch works although it is recommended to use Qt 4.8.0 for KDE 4.8=
.0.
> I renamed the patch to let it append to qt4-native_4.8.0.bb.
>
>
Hi Samuel,

Thanks for your guide.

Kai


