Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1P0v5S-00030o-A5
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 13:44:39 +0200
Received: by qwb7 with SMTP id 7so465966qwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 04:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=tLf5taCbFShSP8DeJz8R1noDfiPw7oYk14ylix4jwVc=;
	b=wOFngDVYR5/wHc89/32L02VKA2oS1J2XFS8W701ppsTZ4OvJ1gP34FjSBQgkzWY9dv
	KGzd3o3OvSodNuY7l28rDVNTuOonWuXmysPOD29u+uxl3z/gx2VuRvnvP8hkBdu6WauP
	gEe11ouj6LUXQtIqlDC80yrYQE17XiQkKlfAg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=lVXll2Q+sVlE/SiupVza7I+tG8aR8DkG/YDbBnSiSHLvjGaH8PPtH4uyjtOpNVZ8ZY
	j8v0l5st4eWfe9rQechxQqcLbl0o9aNPxpvrpo9HTiVmLDzkB/Z0t5qTbNdHYjuTi/wt
	59i4SplTTNWp+iESDIY+WuVRwNDgqyDhpyPPQ=
MIME-Version: 1.0
Received: by 10.229.241.146 with SMTP id le18mr1119378qcb.86.1285760659612;
	Wed, 29 Sep 2010 04:44:19 -0700 (PDT)
Received: by 10.229.36.65 with HTTP; Wed, 29 Sep 2010 04:44:19 -0700 (PDT)
In-Reply-To: <AANLkTikDLYVEa=X5eHj7kB+9O3Hu=a_Our7iAimyW0-c@mail.gmail.com>
References: <AANLkTikjs7DrdBxNpo0GpGy-FkbG3MEQe=+aT8if_a_C@mail.gmail.com>
	<AANLkTimxud8X-EdsRC1FrJg8Xpya7S_BM5vKSs3K7Vi5@mail.gmail.com>
	<AANLkTikDLYVEa=X5eHj7kB+9O3Hu=a_Our7iAimyW0-c@mail.gmail.com>
Date: Wed, 29 Sep 2010 13:44:19 +0200
Message-ID: <AANLkTimeg=+6VEvgd8k1sJk0KQ6Y+po6qcCZSW8C3A3f@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: generate a named kernel in ${DEPLOY_DIR_IMAGE}
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
X-List-Received-Date: Wed, 29 Sep 2010 11:44:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 29, 2010 at 8:54 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/9/29 Andrea Adami <andrea.adami@gmail.com>:
>> On Tue, Sep 28, 2010 at 6:54 PM, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> wrote:
>
>> We solved same issues with linux-kexecboot.inc including linux.inc and
>> redefining vars/tasks.
>> In particular
>> ...
>> PACKAGES = ""
>> PROVIDES = ""
>> ...
>> KERNEL_IMAGE_BASE_NAME = "${KERNEL_IMAGETYPE}-kexecboot-${PV}-${PR}-${MACHINE}"
>> KERNEL_IMAGE_SYMLINK_NAME = "${KERNEL_IMAGETYPE}-kexecboot-${MACHINE}"
>> ...
>>
>> do_populate_sysroot() {
>> }
>>
>> do_install() {
>> }
>>
>> python do_package() {
>> }
>>
>
> Tried this. works nice.
> Two small remarks:
>
> I would have expected you had to add something like:
> FILESPATHPKG_append = ":linux-${PV}"
> I had to add this to get access to the linux patches.

No need to extend FILESPATHPKG being we keep the patches in the
kernel-specific dirs: e.g. /linux-2.6.34 and /linux-kexecboot-2.6.34

>
> And this:
> S = "${WORKDIR}/linux-${PV}"
> might perhaps better end up in the base recipe (in my case linux_2.6.34.bb)

I misunderstand perhaps: this is in each recipe (e.g.
linux-kexecboot_2.6.34.bb). Do you mean moving it in
linux-kexecboot.inc?


> (actually thinking of it the FILESPATHPKG might also be moved into there).
>
> Should I prepare a patch for that ?
Sorry, not sure about the question.

>
> Frans.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Regards

Andrea

P.S: : I feel sorry for the 400 files of the linux-kexecboot merge.
While I'm working on zaurus in order to remove as many recipes as
possible, I hope the same happens for omap3 and qemu people.
Compatibility for those machines was added long ago and the kernels
became very old.
If I don't see any change I propose to move many linux-kexecboot
recipes to obsolete.


