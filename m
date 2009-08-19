Received: from [209.85.218.221] (helo=mail-bw0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <brandhetlampje@gmail.com>) id 1MdhDd-0006qd-88
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Aug 2009 11:12:33 +0200
Received: by bwz21 with SMTP id 21so3262888bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2009 01:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=UfVzqPmWC4Cb0WnOjeyGOqeUuMgAzaetTj5QukXS0GI=;
	b=izLKEJ2xI9VXafZIsHgZer398qYy3gNFVxAfuiCLVx8H06vz5s0nD/CKDsPPsnkJmy
	E59mvsEBLAh4DQMZbHCMywxlIis3yJSGJuohPnh5QIzc7shGL3z8OJSy5mtqeQaMsyD8
	GcL6BbMOn69wXZv9FqgPbfNq211MjLvBEWBls=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=BcrHn9zk8FGa4MZIR8p1AbH/zIlFtHZ3W9/z9uyOWrQXu2blxwPtBsVs7k1ksTH1LM
	9JgZjtLvsQd9s5aChJzT2e3402m61KNToF6NyRPEdjYYW4BiUukHzfsi7W/74SmsdMz6
	u/DdlLTczab9iqhBRyswnueggAjFD0KT6N2X0=
MIME-Version: 1.0
Received: by 10.216.71.13 with SMTP id q13mr1463172wed.190.1250672121381; Wed, 
	19 Aug 2009 01:55:21 -0700 (PDT)
In-Reply-To: <4A8AB6C4.8040805@xora.org.uk>
References: <6978a1740908180652y36467f0evcfc467153cf9ac64@mail.gmail.com>
	<4A8AB6C4.8040805@xora.org.uk>
Date: Wed, 19 Aug 2009 10:55:21 +0200
Message-ID: <6978a1740908190155n44f55df1k40ce20162caa73ae@mail.gmail.com>
From: s hakkesteegt <brandhetlampje@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Create dir with 700 permissions from recipe
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
X-List-Received-Date: Wed, 19 Aug 2009 09:12:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Tue, Aug 18, 2009 at 4:12 PM, Graeme Gregory <dp@xora.org.uk> wrote:
>
> You above recipe doesnt create a package called.
>
> ${PN}-chmodsshdir


Thanx, I missed that.

On Tue, Aug 18, 2009 at 4:40 PM, Phil Blundell <pb@reciva.com> wrote:
>
> Or, perhaps even better, add ${D} to the chmod command's argument so
> that it can run correctly during image creation.  Deferring this to boot
> time would work, but it'd slow down the initial "ipkg configure" run for
> no real gain.
>
> p.
>

I agree that I think there is no reason not to do this during image
creation.

So If I combine both these suggestions, this script should only run when $D
is defined (what will be during image creation), isn't it?

pkg_postinst_${PN}  () {
  if [ test x"$D" != "x" ]; then
    chmod 700 ${D}/home/root/.ssh
  fi
}

Unfortunately the result is still the same (after bitbake -c clean my-image,
updated the PR of the recipe and then rebuild my-image).

For testing I tried this as well:

pkg_postinst_${PN}  () {
    chmod 700 ${D}/home/root/.ssh
}

But that didn't change the permissions in the rootfs either.


By the way: I rechecked the result in the workdir and there the result in
the image/ dir has the correct 700 permissions, but the result in the
install/${PN}/ has the 'wrong' 775 permissions already. Am I right that it
might not be a problem from the package manager, but that the .ipk might be
created with the wrong input?


Siebren

