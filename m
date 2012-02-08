Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rv555-0006Kz-Va
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 11:48:56 +0100
Received: by lahc1 with SMTP id c1so339651lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 02:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=BYrMRwcpcrx3WtqTd/8LSbvy+DQwB6S26RDgId1cdpo=;
	b=rmq0RVGKJVwl9kTcd4fu3rV80ukJGuakfnI+CWYYiLkza1uuBNkAQV75rbz7Qo06AG
	ljx5PBl6mAX6MliDfWUuWGFVTtLpLoaMK9dyXObeFfOgr9gKgq/l7BxCKGf7yjnHggB4
	c+wXflwDUHEwKt9eQUdLpypnY0x1UJ4sAja5A=
MIME-Version: 1.0
Received: by 10.152.131.40 with SMTP id oj8mr15582725lab.24.1328697652622;
	Wed, 08 Feb 2012 02:40:52 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Wed, 8 Feb 2012 02:40:52 -0800 (PST)
Date: Wed, 8 Feb 2012 11:40:52 +0100
Message-ID: <CALbNGRT=M=x7dTr68hLVs37ZAOQ1EOerAn+AbbXveAz6AMcABg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: IMAGE_FEATURES questions (was [meta-oe][RFC 00/27] systemd / initmanager rework)
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
X-List-Received-Date: Wed, 08 Feb 2012 10:48:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 7, 2012 at 5:39 PM, Otavio Salvador <otavio@ossystems.com.br> w=
rote:
> On Tue, Feb 7, 2012 at 14:35, Andreas M=FCller
> <schnitzeltony@googlemail.com>wrote:
>
>> On Tue, Feb 7, 2012 at 4:12 PM, Andreas M=FCller
>> <schnitzeltony@googlemail.com> wrote:
>> > =A0What I have already
>> > =A0detected after a build from scatch is that /var/lib/opkg is missing=
 in
>> the
>> > =A0image (although it can be found in libopkg.ipk).
>> Hmm Last night I had a build from scratch without these patches and
>> have the same - this seems a different issue...
>
>
> You need to add package-management onto IMAGE_FEATURES or it will be
> dropped if all postinst has runned fine in rootfs generation.
>
I added into my image

IMAGE_FEATURES +=3D "package-management"

and after rebuild find the missing directories in my image. Looking
around in my environment gives:

* angstrom sets
meta-angstrom/conf/distro/include/angstrom-core-tweaks.inc:EXTRA_IMAGE_FEAT=
URES
??=3D "package-management"
* in my local.conf I have (taken from OE-core local.conf.sample - long
time ago) EXTRA_IMAGE_FEATURES =3D "debug-tweaks"
* EXTRA_IMAGE_FEATURES is added to IMAGE_FEATURES in bitbake.conf.

If I understand this right, the angstrom default is kicked out by my
local.conf. Since I use this configuration for a while now: What has
changed causing the directories missing?

Andreas


