Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RXFKA-0004JP-Ak
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Dec 2011 17:53:58 +0100
Received: by qcqw6 with SMTP id w6so1053446qcq.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Dec 2011 08:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=nVP2vgOE5oRyyPI8HZa7mY8F0MBZjZ83uPfjKuCbrDE=;
	b=HPv6+nuTRdtzDYvuQFYJKPSsqoOh5enX8ubsPEfuqo+A5B4yshD6NSaGAX0FoI2qJO
	B15Xbs/a6DexANvgdKSHT1gL08VAsIV6D1Tn+UsKKDpFi2gyh/8/qwVoBNqursTP7D6M
	d05y7FCbndRZiebfv4HIS+U9LYhClZW9ORNRk=
Received: by 10.229.212.78 with SMTP id gr14mr1256418qcb.162.1323017227323;
	Sun, 04 Dec 2011 08:47:07 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.73.200 with HTTP; Sun, 4 Dec 2011 08:46:46 -0800 (PST)
In-Reply-To: <cover.1322969413.git.elizabeth.flanagan@intel.com>
References: <cover.1322969413.git.elizabeth.flanagan@intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 4 Dec 2011 09:46:46 -0700
X-Google-Sender-Auth: yTbEJRzd9q8iJ8AoAG4HRhEatpc
Message-ID: <CABcZANk9Z4OVMFvPtwAxc2Nti-o0+hfJ5uGk5MqMMz2drMi6wg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [[RFC] 0/4] license.bbclass: License Manifest Stage 1
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
X-List-Received-Date: Sun, 04 Dec 2011 16:53:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 3, 2011 at 8:42 PM, Beth Flanagan
<elizabeth.flanagan@intel.com> wrote:
> Please see commit messages for full description:
> This RFC includes:
>
> - License manifest implementation in preparation for SPDX manifests.
> - fixes to how licenses are collected. We now can support accurate licens=
es
> =C2=A0during a parallel bitbake.
> - optional addition of license manifest to the generated image.
> - optional addition of full common-license directory to the generated ima=
ge.
> - additional licenses, more SPDX mappings.
> - ability to add custom license directories instead of adding license fil=
es
> =C2=A0to common-licenses.
> - some recipe fixes to fix LICENSE fields.
> - removal of license functionality of base-files as it's now redundant.
>
> These patches require the included commits by Paul Eggleton in order to
> function. Specifically, it requires list_installed_packages in rootfs_*.
>
> Please note. License manifest does not work with .deb packaging yet. When
> list_installed_packages is working in rootfs_deb, I'll patch include deb.
>
> The following changes since commit 9be6d59b78510443d0944513503d515df13caa=
45:
>
> =C2=A0dpkg-native: Fix perl path (2011-12-02 15:31:08 +0000)
>
> are available in the git repository at:
> =C2=A0git://git.yoctoproject.org/poky-contrib eflanagan/license_m1
> =C2=A0http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Deflanaga=
n/license_m1

Nice work on all of this :) Small nits:

- 74efa4d: you revert the bb.data.getVar -> d.getVar change to busybox.inc.
- e1a3bfe: license_create_manifest uses a combination of space and tab
indentation. please pick one :)
- e1a3bfe: license_create_manifest uses a more complex pipeline with
more execs of sed than is necessary. This will do it:

    pkged_pn=3D"$(sed -n 's/^PN: //p' ${filename})"
    pkged_lic=3D"$(sed -n '/^LICENSE: /{ s/^LICENSE: //; s/[+|&()*]/ /g;
s/  */ /g; p }' ${filename})"
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


