Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SxJGD-0000HR-HW
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Aug 2012 16:53:53 +0200
Received: by eekb57 with SMTP id b57so215564eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Aug 2012 07:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=wbCKZC+TP1PpChSo/BN9nDk0MEBva4Niq/YG4aqjO10=;
	b=f1opUaW9eSGQoYvUznyckyM6d2i7r3AMrVtr9/jqpudk4aL4DmIYwSoKY+O3tecZfp
	UXgWut/biFAQ8qOTazOjFiEyxBoL+xMVDmOZZsjpObJ/QKNlC4ffHREcgF4FWqRUuNtl
	pebvnQUEZzdeRnfBK0WLNEMf584+WhH6Si8/6ZoEKGUXFj4CnkwB6Bclw7rrApxajW7H
	jWdoU3asPJAXj9r9dYxijkF/U8zWvhSxiyShK9TJBqHsSiBSyJO5wX7xN+fKocpHZUGK
	+ZvYvqV1laocoukH8270ZDsSlRjIfpo6DcA30s/vXOYle0Sjf1r4hOEHIib7Ve7jP8JH
	PFGQ==
Received: by 10.14.194.198 with SMTP id m46mr2451930een.13.1344004932768; Fri,
	03 Aug 2012 07:42:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Fri, 3 Aug 2012 07:41:42 -0700 (PDT)
In-Reply-To: <jvggnd$naj$1@dough.gmane.org>
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
	<jvbgus$ove$1@dough.gmane.org>
	<BCFACC99-6EAF-4C57-B8E2-18DA0E62BAB3@gmail.com>
	<671950423.c3foblMkXu@helios>
	<6602C8C9-45EA-47B9-B446-C96264B142B7@gmail.com>
	<jvggnd$naj$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Aug 2012 07:41:42 -0700
Message-ID: <CAMKF1sqqyahA8QXH2eOo0SPM-vRtygE1iiyOWMLanV=mGxLfNg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-systemd][PATCH V2 1/7] systemd: Upgrade to 187
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
X-List-Received-Date: Fri, 03 Aug 2012 14:53:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 3, 2012 at 5:38 AM, Koen Kooi <koen@dominion.thruhere.net> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 03-08-12 12:32, Khem Raj schreef:
>>
>> On Aug 2, 2012, at 1:11 AM, Paul Eggleton <paul.eggleton@linux.intel.com=
>
>> wrote:
>>
>>> On Wednesday 01 August 2012 15:56:34 Khem Raj wrote:
>>>> On Aug 1, 2012, at 8:11 AM, Koen Kooi <koen@dominion.thruhere.net>
>>>> wrote:
>>>>>> Along with upgrade use the release tarballs instead of git
>>>>>
>>>>> For an update we need to pull in some patches from master, so a git
>>>>> recipe is still the preferred way.
>>>>
>>>> OK, you know more about it then me but do you know how many those
>>>> will be ? in other words does systemd releases mean much for
>>>> stability yet or still its a project moving at so fast pace ?
>>>>
>>>> I see that releases are rolled out almost every month, that sort of
>>>> could mean either way, we wait until the next release or just take
>>>> from a commit upstream
>>>>
>>>> I feel like staying with a release+patches could be one way if we are
>>>> not importing pathes too often. but I don't know how often that would
>>>> be. For the testing I did release worked well for those platforms
>>>> x86, ppc and arm
>>>
>>> One might suggest, if stable releases are working and you want to live
>>> on the bleeding edge in your distro, you can easily do so there=E2=80=
=A6
>>
>> This is moving forward from where we were so it includes all the git
>> commits that were there until cd96b3b86abb4a88cac2722bdfb6e5d4413f6831
>> commit so this update is inclusive.
>>
>> we can also think of having a stable recipe and a git recipe but systemd
>> releases are almost a month apart it would be more or less covered if we
>> moved from release to release with some patches if needed.
>
> If you look at the fedora and debian packages you'll see that they also p=
ull
> in a fair number of patches, so it's not uncommon to do what we're doing.

ok. However, my original motivation is to make this layer independent
enough and remove the layer dependencies it has
It will make both layers thrive IMO. I proposed removal of
using gitpkgv you did not like that, then I proposed this to remove
use of SRCREV completely this also is objected on.
may I ask what other option do you have ? I am willing to
make a solution. Ultimately this will make systemd integration
into OE-Core as reference init system easier.


