Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SKkwT-00089r-1S
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Apr 2012 08:34:09 +0200
Received: by lbjn8 with SMTP id n8so2839503lbj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2012 23:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=LeR3l3ugCfF7r+tpXSTMMESGyovkkH6gxgUIc1oX5Vc=;
	b=F22M4LUx/CT6EA6JW/qyrpqhrRYDAmMMmtKY7m8ik8sV04weiQEQYH9Q+m38PtBmsO
	SXzY9s+n3fGobvJ7ch/SnCiHX+FeIttXDxWIHsFETMLBzwoFGytTPpDrueAVvO789LWA
	Jf4CiitJnXrhqErq4R/7Mh0QueKd170sFdNC/phQKsDpVLRLOUvMHotz7Ur+qLgbT8yu
	SRNpZpC4QBooaY0Cq+XsP3zWa5CQLn5NMiBwmRQlV5aXLAh1eXuHuLO5ffg0CBj+B8YD
	Pu/zwKYxwDOrtzS/Bh6OiZRJPQE2uHBOuOM88OvB9w+qG913uGVVWI3Ynx8+gtIIxsvm
	ocHQ==
Received: by 10.112.103.202 with SMTP id fy10mr391585lbb.43.1334816680704;
	Wed, 18 Apr 2012 23:24:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Wed, 18 Apr 2012 23:24:10 -0700 (PDT)
In-Reply-To: <4F8F8749.8000803@gmail.com>
References: <4F88ACCE.1030202@gmail.com> <4F88ADA3.5030804@gmail.com>
	<4F8C9902.8020904@gmail.com> <4F8C9D26.9050500@mlbassoc.com>
	<4F8C9E68.9050106@gmail.com> <4F8CCAAA.6050406@gmail.com>
	<CAHJAAqeFgtzf1x934XB-2AP2bomie29g7Ns4Ztt51MLLaOA+hw@mail.gmail.com>
	<4F8D9245.3080908@mlbassoc.com>
	<CAHJAAqcf7O8i9tOegb=GeP9Da8z4Vgw5ohd1JgHLeQg8LTK3ig@mail.gmail.com>
	<4F8DBFF3.2060508@gmail.com> <4F8DC5B5.600@windriver.com>
	<4F8DC939.90208@gmail.com>
	<4F8DCFC4.9010508@gmail.com> <4F8DDDB7.5010605@gmail.com>
	<4F8E0CDF.6040401@gmail.com>
	<CAMKF1sqys83Vu1pv-_3r-RpUe894vQrwpJ1K7NCsyfHXb8vBYA@mail.gmail.com>
	<4F8E53DD.6060404@gmail.com>
	<CAMKF1spO2U+Va9pUnr9pABL9rw_Bc1GBZvrpggXNNfcUg7XrGA@mail.gmail.com>
	<4F8F8749.8000803@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Apr 2012 23:24:10 -0700
Message-ID: <CAMKF1spNs63FypJRj332WJzwL9M_eoMFqbiVYzM7BLCim6-9MQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-core] ld segfault cant figure it out
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
X-List-Received-Date: Thu, 19 Apr 2012 06:34:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 18, 2012 at 8:32 PM, j <vwyodapink@gmail.com> wrote:
>>
>> on ubuntu edit /etc/security/limits.conf on build host and then add
>> * =C2=A0 =C2=A0 =C2=A0 =C2=A0 soft =C2=A0 =C2=A0core =C2=A0 =C2=A0unlimi=
ted


btw. reboot your machine after this change is made

>>
>> that should generate core files. After this search for core* files in
>> build tree
>> and see if there are any then debug them with gdb to diagnose it further
>>
>> Now I am not sure if those segfaults directly relate to malfunction of
>> image
>> if thats the case but its likely. You should also try to explore the
>> reasons why
>> the image fails to behave as expected.
>
> I will do as suggested as well as do a full image build again and see if =
I
> can find out all that is not working. Thank you for the extra debugging i=
nfo
> and suggestions. Are there any keywords to search through all the files f=
or
> including the normal log files, it may help me track down things even
> further.


