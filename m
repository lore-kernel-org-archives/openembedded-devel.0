Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QeD12-0005dW-Ng
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jul 2011 23:18:44 +0200
Received: by pvf24 with SMTP id 24so5853532pvf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jul 2011 14:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=u3UbdWnZ9p4KMqh/0QegFLUvRZTFLUtvEuRn6UI91Uw=;
	b=Yudte/qFUBeTGgXprILKL9ZilLhr8eGodXcvERX1Aokdslb6ruqBBiU6KD9eLStA8K
	YmCM/yhI92sMEpY/SUsKpnFM5Da/H/HDw1B0MHGeH5y8PIJJLwBnB0zDYf5QKDxR2tcf
	jkzGz2Q93X5jFSDckqVpt8eQJVjTGiqBVC8s0=
Received: by 10.68.5.135 with SMTP id s7mr8643355pbs.96.1309900494307; Tue, 05
	Jul 2011 14:14:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.57.104 with HTTP; Tue, 5 Jul 2011 14:14:24 -0700 (PDT)
In-Reply-To: <1309772399.2633.97.camel@phil-desktop>
References: <1309654060-29955-1-git-send-email-raj.khem@gmail.com>
	<1309772399.2633.97.camel@phil-desktop>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Jul 2011 14:14:24 -0700
Message-ID: <CAMKF1so3q=Q_CQU3D5oYO_qgJOtcQqvWeHiRs=i=t5_mNbKY0A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] systemd: Replace use of %m in printf formats
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
X-List-Received-Date: Tue, 05 Jul 2011 21:18:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 4, 2011 at 2:39 AM, Phil Blundell <philb@gnu.org> wrote:
> On Sat, 2011-07-02 at 17:47 -0700, Khem Raj wrote:
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((fd =3D mkostemp(temp, O_CLOEXEC|O_CRE=
AT|O_WRONLY)) < 0) {
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((fd =3D mkstemp(temp)) < 0) {
>
> This change looks like it will effectively remove O_CLOEXEC without
> reinstating it anywhere else. =C2=A0Have you verified this is a safe thin=
g to
> do?

Initial tests on uclibc seems to work well. but this needs more testing
thats why the patch is only applied for uclibc based systems

>
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D mkostemp(path, O_RDWR|O_CLOEXEC);
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D mkstemp(path);
>
> Likewise.
>
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char dev[20];
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int prio =3D 0=
, k;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((k =3D fsc=
anf(m->proc_swaps,
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"%ms " =C2=A0/* device/file */
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"%19s " =C2=A0/* device/file */
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "%*s " =C2=A0/* type of swap */
>
> Is 19 characters definitely enough? =C2=A0If this is potentially a pathna=
me
> then it could be much longer than that.
>

it just reads /dev/* so should be ok.

> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


