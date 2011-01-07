Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PbG3P-00066i-QW
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 18:24:43 +0100
Received: by bwz10 with SMTP id 10so16801348bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jan 2011 09:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=NoRFESlixyeb80GfBHnTE2oahHGDDNe6RxbF9N7yGzo=;
	b=PhOkTw/CO86qBw8h7eLT/zFhLC9mJnByishKxBxuhXYgXSfFyEwf5XfaNVlkoG4llV
	B/r7+MxU4hTwmeRmxLz2gVlj/JxgH021bbdh+qgGHb/TioBHwani3bSFHctodUn+kBVj
	tw/SjiKFyCjW5eQEyBDLExJHSfFhhYObitVSI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=OOvtAoKYUvyfvBz8hYpzSfjhMyPikUykXo39qlJSnd7IClEBgJYJr506TPm+ud7H4W
	B5lmTHcQDfaft2yYjSxdvOxEKNahV06KFAU2DurcabsBSj+v9gMHgFSS8I1/1eTDrXPw
	VXdVTNl8W1jd8VkfS+awpsNzKDJ5gvwaAoIu4=
MIME-Version: 1.0
Received: by 10.204.102.206 with SMTP id h14mr929911bko.45.1294421054814; Fri,
	07 Jan 2011 09:24:14 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.59.147 with HTTP; Fri, 7 Jan 2011 09:24:14 -0800 (PST)
In-Reply-To: <4D272079.5000402@opendreambox.org>
References: <1294392497-24747-1-git-send-email-raj.khem@gmail.com>
	<AANLkTi=UUDxkTNDoWBoOxaCPDyupG8BazYtt6nGs3-7E@mail.gmail.com>
	<4D272079.5000402@opendreambox.org>
Date: Fri, 7 Jan 2011 15:24:14 -0200
X-Google-Sender-Auth: o0BxFdQVlOH7AtH-y5inHnfynoQ
Message-ID: <AANLkTimnL4Pdm2CexD+p+XZVeNCyRGw0yyRCnbdVemvV@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] eglibc: Make it configurable by tuning eglibc options
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
X-List-Received-Date: Fri, 07 Jan 2011 17:24:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 7, 2011 at 12:17, Andreas Oberritter <obi@opendreambox.org> wro=
te:
> On 01/07/2011 02:47 PM, Otavio Salvador wrote:
>> On Fri, Jan 7, 2011 at 07:28, Khem Raj <raj.khem@gmail.com> wrote:
>>> * Look for disabled features in DISTRO_FEATURES and disable them while =
building eglibc
>>> * By default all features are built
>>> * One can disable a feature by specifying DISTRO_FEATURES +=3D "noinet6=
 nobsd ...." e.g.
>>
>> Awesome.
>>
>> Do you think we could do something similar to busybox to avoid having
>> many defconfigs?
>>
>
> Maybe it would be better to introduce EGLIBC_FEATURES and
> BUSYBOX_FEATURES, possibly presetting some values with options already
> present in DISTRO_FEATURES.

This does look better IMO.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


