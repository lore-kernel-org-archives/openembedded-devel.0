Received: from [209.85.221.197] (helo=mail-qy0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1MVmb2-0007zq-LY
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jul 2009 15:20:00 +0200
Received: by qyk35 with SMTP id 35so4651517qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jul 2009 06:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=JmnVVWY4jX0QIlz/TlKUyh9k+5w17xFJpwTh1u6751s=;
	b=w2EsdY/gJ9WtqDe56LjqNMrxOFOQDGkRqeQlUdWpIKNqSBS6+8ie1NbgCJHdfR/yMS
	Lw0rIZpK/Sd18ZG9Yr/24dKKgxWpnMJxFex1ITTUf3zpTzHYhxO73/UCPDbwKOXAS1E+
	BwPL3LhPkIB6aPhmefmKhYAAXYPK/qG8fATfY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=MIpqc5HAxMyh6zaAfUhUSA0xGCYoOyjTLd8OdrlsVt7DUBiyKAvkscgCOTsSRYHAA3
	ZteB7LD8d9We0ImZPP5T5DuGPnHCWH+xAtxzStt0U6HDF462xV2yPJDx9f2lybF5ZmE/
	b4Nl4hfW9dl8lyjHMBY2s7T0XqPe6BcYu43VE=
MIME-Version: 1.0
Received: by 10.229.80.21 with SMTP id r21mr1734634qck.80.1248786310912; Tue, 
	28 Jul 2009 06:05:10 -0700 (PDT)
In-Reply-To: <h4m9qr$9bc$1@ger.gmane.org>
References: <5e088bd90907271310o13787c35j5412c20fa1039912@mail.gmail.com>
	<h4m9qr$9bc$1@ger.gmane.org>
Date: Tue, 28 Jul 2009 06:05:10 -0700
Message-ID: <5e088bd90907280605o2881f7bbnb289931711ca763b@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] policykit: install missing PolicyKit.conf
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
X-List-Received-Date: Tue, 28 Jul 2009 13:20:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2009 at 12:36 AM, Koen Kooi<k.kooi@student.utwente.nl> wrot=
e:
> I applied all three patches

Thanks Koen!

> I fixed those manually, could you next time try using git-format-patch an=
d
> git-send-email? I use the following to send my patches using gmail:
> http://git.or.cz/gitwiki/GitTips#Usingmsmtptosendyourpatches

Sorry for the extra trouble.  I'll try your method next time.

Steve

> On 27-07-09 22:10, Steve Sakoman wrote:
>>
>> From: Steve Sakoman<steve@sakoman.com>
>> Date: Mon, 27 Jul 2009 19:38:05 +0000 (-0700)
>> Subject: policykit: install missing PolicyKit.conf
>> X-Git-Url:
>> http://www.sakoman.net/cgi-bin/gitweb.cgi?p=3Dopenembedded.git;a=3Dcommi=
tdiff_plain;h=3D98b71f9ab5b8578b77bb45887e72681ce16a2910
>>
>> policykit: install missing PolicyKit.conf
>> ---
>>
>> diff --git a/recipes/policykit/policykit/PolicyKit.conf
>> b/recipes/policykit/policykit/PolicyKit.conf
>> new file mode 100644
>> index 0000000..ed502ac
>> --- /dev/null
>> +++ b/recipes/policykit/policykit/PolicyKit.conf
>> @@ -0,0 +1,13 @@
>> +<?xml version=3D"1.0" encoding=3D"UTF-8"?> =A0<!-- -*- XML -*- -->
>> +
>> +<!DOCTYPE pkconfig PUBLIC "-//freedesktop//DTD PolicyKit Configuration
>> 1.0//EN"
>> +"http://hal.freedesktop.org/releases/PolicyKit/1.0/config.dtd">
>> +
>> +<!-- See the manual page PolicyKit.conf(5) for file format -->
>> +
>> +<config version=3D"0.1">
>> +<match user=3D"root">
>> +<return result=3D"yes"/>
>> +</match>
>> +<define_admin_auth group=3D"admin"/>
>> +</config>
>> diff --git a/recipes/policykit/policykit_0.9.bb
>> b/recipes/policykit/policykit_0.9.bb
>> index 28cbb11..2a31701 100644
>> --- a/recipes/policykit/policykit_0.9.bb
>> +++ b/recipes/policykit/policykit_0.9.bb
>> @@ -1,9 +1,11 @@
>> =A0HOMEPAGE =3D "http://www.packagekit.org/"
>> =A0DEPENDS =3D "libpam expat dbus-glib"
>>
>> -PR =3D "r4"
>> +PR =3D "r5"
>>
>> -SRC_URI =3D "http://hal.freedesktop.org/releases/PolicyKit-${PV}.tar.gz=
"
>> +SRC_URI =3D "http://hal.freedesktop.org/releases/PolicyKit-${PV}.tar.gz=
 \
>> + =A0 =A0 =A0 =A0 =A0 file://PolicyKit.conf \
>> + =A0 =A0 =A0 =A0 =A0"
>>
>> =A0EXTRA_OECONF =3D "--with-authfw=3Dpam --with-os-type=3Dmoblin
>> --disable-man-pages --disable-gtk-doc"
>>
>> @@ -11,6 +13,10 @@ S =3D "${WORKDIR}/PolicyKit-${PV}"
>>
>> =A0inherit autotools pkgconfig
>>
>> +do_install_append () {
>> + =A0 =A0 =A0 install -m 0644 ${WORKDIR}/PolicyKit.conf
>> ${D}${sysconfdir}/PolicyKit/PolicyKit.conf
>> +}
>> +
>> =A0do_stage() {
>> =A0 =A0 =A0 =A0 =A0autotools_stage_all
>> =A0}
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


